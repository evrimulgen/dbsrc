-- [dbsrc POST-PROCESSED]:
-- (8) Add "show errors" after all stored code to make log files more useful.
CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DBSRC_U"."DBSRC_MGR" as
    --
    -- ============================================================
    -- ============================================================
    -- PRIVATE
    -- ============================================================
    -- ============================================================
    --
	-- commit every x records when inserting ddl into the dbsrc table
    G_COMMIT_INTERVAL number :=  250;
	--
	-- Specify the maximum number of objects to be retrieved in a single
    -- fetch_XXx call. By default, each call tO fetch_xxx returns one
    -- object.  Specifying a count value greater than 1 can result in fewer
    -- server round trips and, therefore, improved performance, (and higher
    -- memory usage).  For heterogeneous object types (that's us), a single
    -- fetch_xxx operation only returns objects of a single object type.
    --
    -- In my experience, set_count 10000 uses >5g of pga with very large
    -- numbers of objects, resulting in ORA-04030: out of process memory
    -- when trying to allocate X bytes.
	-- A value of 25 is about 30% faster than 1 or 100 in my experience.
    G_DDL_FETCH_ARRAYSIZE number := 25;
	--
    -- unique id and cfg_name for the set of ddl we exporting
    G_SET_NO number := -1;
    G_CFG_NAME varchar2(1000);
    -- unique id and order number for each ddl
    G_ORDER_NO number := -1;
    -- stats
    G_START_TIMESTAMP number :=  -1;
    G_ELAPSED number :=  -1;
    G_USAGE_COUNTER number := -1;
    -- the funky datastructure that dbms_metata returns results into
    -- Make global for perf reasons (avoid initializing within function)
    doc sys.ku$_ddls;
    --
    -- ============================================================
    -- p: convenience wrapper for ole dbms_output.put_line
    -- ============================================================
    procedure p(s in varchar) is begin dbms_output.put_line(s); end p;
    --
    -- ============================================================
    -- init: initialize the global variable G_SET_NO to the max
    --  currently in the dbsrc table. G_SET_NO drives the crnt_dbsrc
    --  view, which is used by almost everything else
    -- ============================================================
    procedure init is
    begin
        select nvl(max(dbsrc_set_no), -1) into G_SET_NO from dbsrc;
    end init;
    --
    -- ============================================================
    -- export_public_db_links
    --  a helper for get_db_ddl that cannot conveniently address
    --  public db_links. Use a very simple approach: always export
    --  all public links; always make them first in dependency order.
    --
    -- Execute dynamically to avoid elevated priv requirement:
    --  static: "select any dictionary" privilege required
    --      -or- a direct grant select on sys.dba_db_links
    --  dynamic: select_catalog_role suffices
    --      dynamic avoids dba resistance to granting "select any dictionary"
    --      dynamic adds unnecessary complexity that could easily be avoided
    --      dynamic hides dependencies
    --      dynamic delays finding syntax errors from compiletime to runtime
    -- ============================================================
    procedure export_public_db_links is
        x number := -1;
        v_sql varchar2(32767 char) := '';
    begin
        -- honor exclude path expressions
        -- dont export public links if were are excluding db_links
        select count(*) into x
        from dbsrc_cfg_filter
        where
            cfg_name = G_CFG_NAME and
            filter_name = 'EXCLUDE_PATH_EXPR' and
            filter_value like '%DB_LINK%';
        --
        if x = 0 then
            v_sql := '
                insert into dbsrc (
                    dbsrc_set_no,
                    cfg_name,
                    order_no,
                    object_owner,
                    ddl_type,
                    object_name,
                    dbsrc_text_raw
                ) (
                    select
                        :G_SET_NO,
                        :G_CFG_NAME,
                        rownum,
                        ''PUBLIC'',
                        ''DB_LINK'',
                        db_link,
                        dbms_metadata.get_ddl(
                    ''DB_LINK'', db_link, owner)||'';''
                    from sys.dba_db_links
                    where owner = ''PUBLIC''
                )
            ';
            execute immediate v_sql using G_SET_NO, G_CFG_NAME;
            -- set order_no to where we left off.
            -- please note that we are assuming that this
            --  runs before anything else (G_ORDER_NO is not yet set)
            G_ORDER_NO := sql%rowcount +1;
            -- increment usage counter for public db links
            for x in 1..G_ORDER_NO-1 loop
                select sq_dbsrc_cnt_no.nextval
                into G_USAGE_COUNTER from dual;
            end loop;
        end if;
    exception
        when others then
            p('ERROR export_public_db_links:');
            p(dbms_utility.format_error_backtrace());
            p(v_sql);
            rollback;
            raise;
    end export_public_db_links;
    --
    -- ============================================================
    -- desc_cfg: describe the configuration for the current set_no
    -- This is a useful readout for mere humans trying to
    -- understand what is going on.
    -- ============================================================
    procedure desc_cfg is
    begin
        p('-- ========================================================================');
        p('-- BEGIN Configuration Details');
        for x in (
            select '-- '||cfg_name||': '||' '||create_date text
            from dbsrc_cfg
            where cfg_name = dbsrc_mgr.get_cfg_name()
        ) loop p(x.text); end loop;
        --
        for x in (
            select '--    '||cfg_desc text
            from dbsrc_cfg
            where cfg_name = dbsrc_mgr.get_cfg_name()
        ) loop p(x.text); end loop;
        --
        for x in (
            select '--    '||create_process text
            from dbsrc_cfg
            where cfg_name = dbsrc_mgr.get_cfg_name()
        ) loop p(x.text); end loop;
        --
        p('--');
        p('-- dbms_metadata.set_filter() Parameters:');
        for x in (
            select
                '--    '||filter_name||' '||
                -- some values are mult-line, so preface each line
                --  with a comment '--'
                regexp_replace(filter_value, chr(10)||'(.*)', chr(10)||'-- \1')
                ||','|| object_type_path text
            from dbsrc_cfg_filter
            where cfg_name = dbsrc_mgr.get_cfg_name()
            order by filter_name, filter_value, object_type_path)
		loop
			p(x.text);
		end loop;
        --
        p('--');
        p('-- dbms_metadata.set_transform() Parameters:');
        for x in (
            select
                '--    '||transform_name||','||transform_value||','||object_type_path text
            from dbsrc_cfg_transform
            where cfg_name = dbsrc_mgr.get_cfg_name()
            order by transform_name, transform_value, object_type_path
        ) loop
			p(x.text);
		end loop;
		--
        p('-- END Configuration Details');
        p('-- ========================================================================');
    end desc_cfg;
    --
    -- ============================================================
    -- set_missing_attrs: fill in dbms_metadata blanks
    --
    -- set owner, name, type as dbms_metadata.get_ddl returns nulls
	-- for some ddl types. The intent is to assign a unique,
	-- descriptive (owner, type, name) to everything.
    -- parse out from p_ddl based on double-quote positions
    -- ============================================================
    procedure set_missing_attrs (
        p_ddl in clob,
		p_order_no in number,
        p_object_owner in out NOCOPY varchar,
        p_ddl_type in out NOCOPY varchar,
        p_object_name in out NOCOPY varchar
    ) is
    begin
		-- make names unique for several object types without useful names
        if p_ddl_type in (
			'AUDIT_OBJ', 'OBJECT_GRANT', 'PROACT_INSTANCE',
			'PROC_SYSTEM_GRANT', 'SYSTEM_GRANT', 'TYPE'
		) then
            p_object_name := nvl(p_object_name,'NO_NAME')||'.'||p_order_no;
		end if;
		-- system grants
		-- separate out from object grants
		--                               1        2   !3
		-- GRANT CREATE DATABASE LINK TO "SPOTFIRE";
        if p_ddl_type = 'OBJECT_GRANT' and instr(p_ddl, '"',1,3) = 0 then
            p_object_owner := substr(p_ddl,
                instr(p_ddl, '"', 1, 1) +1,
                instr(p_ddl, '"', 1, 2) - instr(p_ddl, '"', 1, 1) -1);
			p_ddl_type := 'SYSTEM_GRANT';
		end if;
        -- object grants
        if p_ddl_type = 'OBJECT_GRANT' then
			-- handle special case: PUBLIC is rendered without double quotes !?!
			if instr(p_ddl, 'TO PUBLIC') != 0 then
				--                 1        2 3        4
				-- GRANT SELECT ON "EDC_CODS"."FORM_REF" TO PUBLIC;
				p_object_name := substr(p_ddl,
					instr(p_ddl, '"', 1, 3) +1,
					instr(p_ddl, '"', 1, 4) - instr(p_ddl, '"', 1, 3) -1)
					||'.PUBLIC';
			else
				--                 1        2 3        4    5        6
				-- GRANT SELECT ON "EDC_CODS"."FORM_REF" TO "DFACCESS" WITH GRANT OPTION;
				p_object_name := substr(p_ddl,
					instr(p_ddl, '"', 1, 3) +1,
					instr(p_ddl, '"', 1, 4) - instr(p_ddl, '"', 1, 3) -1)
					||'.'||
					substr(p_ddl,
						instr(p_ddl, '"', 1, 5) +1,
						instr(p_ddl, '"', 1, 6) - instr(p_ddl, '"', 1, 5) -1)||'.'||
					substr(p_ddl,
						instr(p_ddl, ' ', 1, 1) +1,
						instr(p_ddl, ' ', 1, 2) - instr(p_ddl, ' ', 1, 1) -1);
			end if;
        p_object_owner := substr(p_ddl,
            instr(p_ddl, '"', 1, 1) +1,
            instr(p_ddl, '"', 1, 2) - instr(p_ddl, '"', 1, 1) -1);
        end if;
        -- table and materialized view comments
        if p_ddl_type = 'COMMENT' and (
				p_ddl like 'COMMENT ON TABLE %'  or
				p_ddl like 'COMMENT ON MATERIALIZED VIEW %'
			) then
			--                              1   2 3                             4
			-- COMMENT ON MATERIALIZED VIEW "SDM"."MV_EASS_USER_GROUP_MEMBERSHIP"  IS '...';
            p_object_name := substr(p_ddl,
                instr(p_ddl, '"', 1, 3) +1,
                instr(p_ddl, '"', 1, 4) - instr(p_ddl, '"', 1, 3) -1);
            p_object_owner := substr(p_ddl,
                instr(p_ddl, '"', 1, 1) +1,
                instr(p_ddl, '"', 1, 2) - instr(p_ddl, '"', 1, 1) -1);
        end if;
        -- column comments
        if p_ddl_type = 'COMMENT' and p_ddl like 'COMMENT ON COLUMN %' then
            --                   1     2 3     4 5      6
            -- COMMENT ON COLUMN "owner"."table"."column" IS 'blah...'
            p_object_name := substr(p_ddl,
                    instr(p_ddl, '"', 1, 3) +1,
                    instr(p_ddl, '"', 1, 4) - instr(p_ddl, '"', 1, 3) -1)
                ||'.'||
                substr(p_ddl,
                    instr(p_ddl, '"', 1, 5) +1,
                    instr(p_ddl, '"', 1, 6) - instr(p_ddl, '"', 1, 5) -1);
            p_object_owner := substr(p_ddl,
                instr(p_ddl, '"', 1, 1) +1,
                instr(p_ddl, '"', 1, 2) - instr(p_ddl, '"', 1, 1) -1);
        end if;
        -- constraints
        if p_ddl_type = 'CONSTRAINT' then
            p_object_owner := substr(p_ddl,
                instr(p_ddl, '"', 1, 1) +1,
                instr(p_ddl, '"', 1, 2) - instr(p_ddl, '"', 1, 1) -1);
        end if;
        -- contexts
        if p_ddl_type = 'CONTEXT' then
            --                           1         2       3     4 5   6
            -- CREATE OR REPLACE CONTEXT "namespace" USING "owner"."pgm"
            -- namespace.pgm
            p_object_name := substr(p_ddl,
                    instr(p_ddl, '"', 1, 1) +1,
                    instr(p_ddl, '"', 1, 2) - instr(p_ddl, '"', 1, 1) -1);
            p_object_owner := substr(p_ddl,
                instr(p_ddl, '"', 1, 3) +1,
                instr(p_ddl, '"', 1, 4) - instr(p_ddl, '"', 1, 3) -1);
        end if;
        -- default roles
        if p_ddl_type = 'DEFAULT_ROLE' then
            p_object_owner := substr(p_ddl,
                instr(p_ddl, '"', 1, 1) +1,
                instr(p_ddl, '"', 1, 2) - instr(p_ddl, '"', 1, 1) -1);
        end if;
        -- users
        if p_ddl_type = 'USER' then
            p_object_owner := substr(p_ddl,
                instr(p_ddl, '"', 1, 1) +1,
                instr(p_ddl, '"', 1, 2) - instr(p_ddl, '"', 1, 1) -1);
        end if;
        -- object grants
        --                               1    2
        -- GRANT CREATE DATABASE LINK TO "user";
        if p_ddl_type = 'OBJECT_GRANT' then
            p_object_owner := substr(p_ddl,
                instr(p_ddl, '"', 1, 1) +1,
                instr(p_ddl, '"', 1, 2) - instr(p_ddl, '"', 1, 1) -1);
        end if;
        -- role grants
        --       1    2    3    4
        -- GRANT "role" TO "user";
        if p_ddl_type = 'ROLE_GRANT' then
            p_object_owner := substr(p_ddl,
                instr(p_ddl, '"', 1, 3) +1,
                instr(p_ddl, '"', 1, 4) - instr(p_ddl, '"', 1, 3) -1);
            p_object_name := substr(p_ddl,
                instr(p_ddl, '"', 1, 1) +1,
                instr(p_ddl, '"', 1, 2) - instr(p_ddl, '"', 1, 1) -1);
        end if;
		-- rls_policy
	    if p_ddl_type = 'RLS_POLICY' then
			--	BEGIN DBMS_RLS.ADD_GROUPED_POLICY(
			--       1     2   3      4   5           6   7      8
			--		'"owner"','"object"','"SYS_DEFAULT"','"policy"',
			--		'"function_owner"','"function"',
			--		'DELETE,UPDATE,INSERT',TRUE,TRUE,FALSE,dbms_rls.DYNAMIC,FALSE,'',NULL);
			--	END;
            p_object_name := substr(p_ddl,
                    instr(p_ddl, '"', 1, 3) +1,
                    instr(p_ddl, '"', 1, 4) - instr(p_ddl, '"', 1, 3) -1)
                ||'.'||
                substr(p_ddl,
                    instr(p_ddl, '"', 1, 7) +1,
                    instr(p_ddl, '"', 1, 8) - instr(p_ddl, '"', 1, 7) -1);
            p_object_owner := substr(p_ddl,
                instr(p_ddl, '"', 1, 1) +1,
                instr(p_ddl, '"', 1, 2) - instr(p_ddl, '"', 1, 1) -1);
        end if;
	    -- table refs
        if p_ddl_type = 'TABLE' and p_ddl like '%ALTER TABLE % ADD REF %'  then
            p_ddl_type := 'TABLE_REF';
			-- I don't know how to unique name this! append order_no for now....
			p_object_name := p_object_name||'.'||p_order_no;
        end if;
		-- trigger alters
		if p_ddl_type = 'TRIGGER' and p_ddl like '%ALTER TRIGGER %'  then
            p_ddl_type := 'TRIGGER_ALTER';
        end if;

    end set_missing_attrs;
	--
    -- ============================================================
	-- gather_dbsrc_stats
	--	If dbsrc tables stats are stale or missing, then gather
	--	stats.
    -- ============================================================
    procedure gather_dbsrc_stats is
	begin
		for x in (
			select table_name
			from user_tab_statistics
			where
				-- YES = stale stats , NULL = no stats
				(stale_stats is null or stale_stats = 'YES') and
				(table_name = 'DBSRC' or table_name like 'DBSRC\_%' escape '\')
		) loop
			p('-- '||x.table_name||' table stats are stale or missing. Gathering stats...');
			dbms_stats.gather_table_stats(user, x.table_name);
		end loop;
	end gather_dbsrc_stats;
	--
	-- ============================================================
    -- get_db_ddl
    --  this is where most of the fun happens...
    --  invoke dbms_metadata.get_ddl get_db_ddl
    --  with all our filters and transforms,
	--  for the current database source set.
    --
    -- Note this procedure is an autonomous transaction. It will not
    -- trigger a commit in the calling block.
    -- ============================================================
    procedure get_db_ddl is pragma autonomous_transaction;
        no_objects_exported exception;
        pragma exception_init(no_objects_exported, -31605);
        -- handle to a dbms_metadata "session"
        h number := -1;
        -- handle to a dbms_metadata "transform"
        th number := -1;
        -- loop iterators
        i number := null;
        j number := null;
        -- buffer for current ddl
        ddl clob := null;
        -- buffer for items we parse out of sys.ku$_ddls
        pi sys.ku$_parsed_items;
        -- attributes we parse out for each object
        l_object_owner varchar2(2000 char);
        l_ddl_type varchar2(2000 char);
        l_object_name varchar2(2000 char);
        -- counter buffer
        n number := -1;
    begin
        G_START_TIMESTAMP := dbms_utility.get_time;
        p('-- ========================================================================');
        p('-- BEGIN export_ddl '||to_char(sysdate, 'MON-DD-YYYY HH24:MI:SS'));
        --
        -- get public database links first
        export_public_db_links;
        --
        -- now for the rest of the ddl...
        h := dbms_metadata.open('DATABASE_EXPORT');
        --
        dbms_metadata.set_count(h, G_DDL_FETCH_ARRAYSIZE);
        --
        -- apply the filters for this given cfg_name
        for psf in (
            select filter_name, filter_value, object_type_path
            from dbsrc_cfg_filter
            where cfg_name = G_CFG_NAME
            order by filter_name, filter_value, object_type_path
        ) loop
            dbms_metadata.set_filter(
                h, psf.filter_name, psf.filter_value, psf.object_type_path);
        end loop;
        --
        -- parse out object_type and name to store with ddl
        dbms_metadata.set_parse_item(h,'SCHEMA');
        dbms_metadata.set_parse_item(h,'OBJECT_TYPE');
        dbms_metadata.set_parse_item(h,'NAME');
        --
        -- we want ddl!
        th := dbms_metadata.add_transform(h,'DDL');
        --
        -- apply the transforms for this given cfg_name
        for pst in (
            select transform_name, transform_value, object_type_path
            from dbsrc_cfg_transform
            where cfg_name = G_CFG_NAME
            order by transform_name, transform_value, object_type_path
        ) loop
            dbms_metadata.set_transform_param(
                th,
                pst.transform_name,
                case upper(pst.transform_value) when 'TRUE' then true else false end,
                pst.object_type_path);
        end loop;
        --
        loop
            doc := dbms_metadata.fetch_ddl(h);
            exit when doc is null;
            i := doc.first;
            while i is not null loop
                if not doc.exists(i) then continue; end if;
                ddl := trim(doc(i).ddltext);
                pi := doc(i).parseditems;
                if pi is not null and pi.count > 0 then
                    j := pi.first;
                    --
                    -- clear previous and parse out new
                    l_object_owner := null;
                    l_ddl_type := null;
                    l_object_name := null;
                    while j is not null loop
                        if pi(j).item='SCHEMA' then
                            l_object_owner := pi(j).value;
                        elsif pi(j).item='OBJECT_TYPE' then
                            l_ddl_type := pi(j).value;
                        elsif pi(j).item='NAME' then
                            l_object_name := pi(j).value;
                        end if;
                        j := pi.next(j);
                    end loop; -- inner-inner "j" loop
                end if;
                -- insert results for current object
                --
                -- increment usage counter
                select sq_dbsrc_cnt_no.nextval
                into G_USAGE_COUNTER from dual;
                --
                -- fill in dbms_metadata blanks:
                --  when object_owner and/or object_name is blank,
                --  set them to something useful
                set_missing_attrs(
                    ddl, G_ORDER_NO, l_object_owner, l_ddl_type, l_object_name);
                --
                insert into dbsrc (
                    dbsrc_set_no,
                    cfg_name,
                    order_no,
                    object_owner,
                    ddl_type,
                    object_name,
                    dbsrc_text_raw,
                    dbsrc_text_cooked
                ) values (
                    G_SET_NO,
                    G_CFG_NAME,
                    G_ORDER_NO,
                    nvl(l_object_owner, 'NO_OWNER'),
                    l_ddl_type,
                    nvl(l_object_name, 'NO_NAME'),
                    ddl,
                    ddl
                );
                -- point to next record, which is
                --  sparse, so using next()
                G_ORDER_NO := G_ORDER_NO +1;
                i := doc.next(i);
                --
                -- commit on interval
                if mod(G_ORDER_NO, G_COMMIT_INTERVAL) = 0 then
                    commit;
                end if;
            end loop; -- inner "i" loop
        end loop; -- outer loop
        dbms_metadata.close(h);
        --
        -- possibly useful, but probably not
        dbms_session.free_unused_user_memory;
        --
        G_ELAPSED := (dbms_utility.get_time - G_START_TIMESTAMP) / 100;
        p('-- export_ddl elapsed seconds: '||G_ELAPSED);
        select count(*) into n from dbsrc where dbsrc_set_no = G_SET_NO;
        p('-- export_ddl object count: '||n);
        if n = 0 then raise no_objects_exported; end if;
        p('-- export_ddl rate in objects/s: '||round(n/G_ELAPSED, 2));
        p('-- export_ddl all-time objects exported: '||G_USAGE_COUNTER);
        p('-- END export_ddl '||to_char(sysdate, 'MON-DD-YYYY HH24:MI:SS'));
        p('-- ========================================================================');
        --
        -- a final commit
        commit;
    --
    exception
        when no_objects_exported then
            p('WARN export_ddl(): no objects found to export. Stopping here.');
			rollback;
			raise;
        when others then
            p('get_db_ddl:');
            p(dbms_utility.format_error_backtrace());
            raise;
    end get_db_ddl;
    --
    --
    --
    -- ============================================================
    -- ============================================================
    -- ============================================================
    -- PUBLIC
    -- ============================================================
    -- ============================================================
    -- ============================================================
 	--
    -- ============================================================
    -- post_prcs
    --  * process dbsrc_text_raw into dbsrc_text_cooked ddl
    --  * enrich dbsrc with additional useful info
    --      dba_objects.created_date
    --      dba_objects.last_ddl_time
    --      dba_objects.status
    -- * apply complex post-processing that cannot be addressed via
    --  simple dbms_metadata include and exclude expressions.
    --
    -- Execute dynamically to avoid elevated priv requirement:
    --  static: "select any dictionary" privilege required
    --      -or- a direct grant select on sys.dba_objects
    --  dynamic: select_catalog_role suffices
    --      dynamic avoids dba resistance to granting select_catalog_role
    --      dynamic adds unnecessary complexity that could easily be avoided
    --      dynamic hides dependencies
    --      dynamic delays finding syntax errors from compiletime to runtime
    --  sad but true :)
	--
    -- Note this procedure is an autonomous transaction. It will not
    -- trigger a commit in the calling block.
    -- ============================================================
    procedure post_prcs is pragma autonomous_transaction;
        v_sql varchar2(32767 char) := '';
		-- counter
		c number := 0;
    begin
        G_START_TIMESTAMP := dbms_utility.get_time;
        p('-- ========================================================================');
        p('-- BEGIN Post-processing '||to_char(sysdate, 'MON-DD-YYYY HH24:MI:SS'));
        -- enrich dbsrc with additional useful info
        --  some dbsrc "dups" exist for a valid reason,
        --      hence the distinct
        v_sql := '
            merge into dbsrc dst
            using (
                select distinct
                    do.owner object_owner,
                    do.object_type ddl_type,
                    do.object_name,
                    ds.dbsrc_set_no,
                    do.created dba_obj_created_date,
                    do.last_ddl_time dba_obj_last_ddl_time,
                    do.status dba_obj_status
                from
                    sys.dba_objects do
                    inner join dbsrc ds
                        on ds.object_owner = do.owner and
                            ds.ddl_type = do.object_type and
                            ds.object_name = do.object_name
                where
                    ds.dbsrc_set_no = :G_SET_NO and
                    ds.object_owner != ''NO_OWNER'' and
                    ds.object_name != ''NO_NAME''
            ) src
            on (
                dst.object_owner = src.object_owner and
                dst.ddl_type = src.ddl_type and
                dst.object_name = src.object_name and
                dst.dbsrc_set_no = src.dbsrc_set_no
            )
            when matched then update set
                dst.dba_obj_created_date = src.dba_obj_created_date,
                dst.dba_obj_last_ddl_time = src.dba_obj_last_ddl_time,
                dst.dba_obj_status = src.dba_obj_status
        ';
        execute immediate v_sql using G_SET_NO;
        commit;
        --
        -- step through each post-processing step for this cfg_name
        --  in order by order_no and apply post-processing.
        -- commit is more to enable easy snooping on intermediate progress
        --  than for performance or efficiency
        for x in (
            select
                pp.order_no,
                pp.post_prcs_sql_text,
                pp.comment_text
            from
                dbsrc_cfg_post_prcs pp
            where exists (
                select 1
                from dbsrc d
                where
                    d.dbsrc_set_no = G_SET_NO and
                    -- correlate
                    d.cfg_name = pp.cfg_name
            )
            order by pp.order_no
        ) loop
			c := c+1;
            v_sql := x.post_prcs_sql_text;
            execute immediate (v_sql);
            commit;
        end loop;
		if c = 0 then
			p('>>> WARNING: there are no rows in dbsrc_cfg_post_prcs for set_no='||G_SET_NO);
		end if;
        --
        G_ELAPSED := (dbms_utility.get_time - G_START_TIMESTAMP) / 100;
        p('-- Post-processing Elapsed seconds: '||G_ELAPSED);
        p('-- END Post-processing '||to_char(sysdate, 'MON-DD-YYYY HH24:MI:SS'));
        p('-- ========================================================================');
    exception
        when others then
            p('ERROR post_prcs():');
            p(v_sql);
            p(dbms_utility.format_error_backtrace());
            rollback;
            raise;
    end post_prcs;
	--
	-- ============================================================
    -- desc_dbsrc_set: describe the dbsrc set for the current set_no
    -- This is a useful readout for mere humans trying to
    -- understand what is going on.
    -- ============================================================
    procedure desc_dbsrc_set is
    begin
        p('-- ========================================================================');
        p('-- BEGIN Database Source Details');
        for x in (
            select '-- dbsrc_set_no='||dbsrc_set_no||' cfg_name='||cfg_name||
                ' create_date='|| max(create_date) text
            from crnt_dbsrc
            group by dbsrc_set_no, cfg_name
        ) loop p(x.text); end loop;
        --
        for x in (
            select distinct '-- create_process='||create_process text
            from crnt_dbsrc
        ) loop p(x.text); end loop;
        --
        for x in (
            select '-- TOTAL: '||count(*) text
            from crnt_dbsrc
            where dbscript_include_flag = 'Y'
        ) loop p(x.text); end loop;
        --
        for x in (
            select '--   '||ddl_type||': '||count(ddl_type) text
            from crnt_dbsrc
            where dbscript_include_flag = 'Y'
            group by ddl_type
            order by ddl_type
        ) loop p(x.text); end loop;
        p('-- END Database Source Details');
        p('-- ========================================================================');
    end desc_dbsrc_set;
    --
    -- ============================================================
    -- desc_post_prcs: describe the post-processing for the current set_no
    -- This is a useful readout for mere humans trying to
    -- understand what is going on.
    -- ============================================================
    procedure desc_post_prcs is
        n number := -1;
        -- convenience wrapper for ole dbms_output.put_line
        procedure p(s varchar) is begin dbms_output.put_line(s); end p;
    begin
        p('-- ========================================================================');
        p('-- BEGIN Post-Processing Details');
        -- print grand total of rows excluded because of post-processing
        select count(*) into n from crnt_dbsrc
        where dbscript_include_flag = 'N';
        p('-- Total object(s) excluded due to post-processing: '||n);
        --
        -- print grand total of rows affected in any way because of
        --  post-processing
        select count(*) into n from crnt_dbsrc
        where post_prcs_order_no_list is not null;
        p('-- Total object(s) affected in any way due to post-processing: '||n);
		--
        -- describe post-processing, one step at a time
        -- step through each post-processing step for this cfg_name
        --  in order by order_no
        for x in (
            select
                count(*) cnt,
                p.order_no,
                p.comment_text
            from
                crnt_dbsrc s
                inner join dbsrc_cfg_post_prcs p
                    on instr(s.post_prcs_order_no_list,
                            ':'||to_char(p.order_no)||':') > 0 and
                        s.cfg_name = p.cfg_name
            group by
                p.order_no,
                p.comment_text
            order by p.order_no
        ) loop
            p('-- ('||x.order_no||') '||
                regexp_replace(x.comment_text, chr(10), chr(10)||'--      '));
            p('--   Post-processing '||x.cnt||' object(s) affected.');
        end loop;
        --
        p('-- END Post-Processing Details');
        p('-- ========================================================================');
    end desc_post_prcs;
    --
    -- ============================================================
    -- set_set_no: set the global variable G_SET_NO
    --  default to last set_no
    -- ============================================================
    procedure set_set_no(n in number default -1) is
    begin if n = -1 then init(); else G_SET_NO := n; end if;
    end set_set_no;
    --
    -- ============================================================
    -- get_set_no: get the global variable G_SET_NO
    --  init() if not set yet
    -- ============================================================
    function get_set_no return number is
    begin if G_SET_NO = -1 then init(); end if;
        return G_SET_NO;
    end get_set_no;
    --
    -- ============================================================
    -- get_cfg_name: get the global variable cfg_name for the
    --  current set_no
    -- ============================================================
    function get_cfg_name return varchar2 is
    begin
        select distinct cfg_name into G_CFG_NAME from crnt_dbsrc;
        return G_CFG_NAME;
    end get_cfg_name;
    --
    -- ============================================================
    -- describe: convenient public interface and wrapper to all
    --      the desc* procedures
    -- ============================================================
    procedure describe is
    begin
        desc_cfg;
        desc_dbsrc_set;
        desc_post_prcs;
    end describe;
    --
    -- ============================================================
    -- stat: show status summary of dbsrc table contents
    -- ============================================================
    procedure stat is
    begin
        p('                                  Post                              ');
        p(' Set                   Object  Process  Elapsed                     ');
        p('  No     Config Name   Count     Count  Seconds Create Date         ');
        p('==== =============== ======== ======== ======== ====================');
        for x in (
            select
                dbsrc_set_no,
                rtrim(lpad(cfg_name, 15), 20) cfg_name,
                to_char(count(*), '999,999') cnt,
                to_char(count(post_prcs_order_no_list), '999,999') pp_cnt,
                to_char(
                    round(((max(create_date) -
                        min(create_date)) *24*60*60), 0)
                , '999,999') ss,
                max(to_char(create_date, 'MON-DD-YYYY HH24:MI:SS')) create_date
            from dbsrc
            group by
                dbsrc_set_no,
                cfg_name
            order by dbsrc_set_no
        ) loop
            p(x.dbsrc_set_no||' '||x.cfg_name||' '||x.cnt||' '||x.pp_cnt||' '||
                x.ss||' '||x.create_date);
        end loop;
        --
        -- this seems to be the cleanest approach:
        --  avoid requiring the sq.curval to be initialized
        for x in (
            select last_number n from user_sequences
            where sequence_name = 'SQ_DBSRC_CNT_NO'
        ) loop
            p('export_ddl all-time objects exported: '||x.n);
        end loop;
    end stat;
    --
	-- ============================================================
	-- export_ddl
	--  for the current set_no:
	--  * export the ddl for a dbsrc configuration into the dbsrc table
	--  * apply post-processing
	--  * describe results
	-- ============================================================
	procedure export_ddl(p_cfg_name in varchar2) is
		l_cfg_cnt number := -1;
	begin
		-- test and set G_CFG_NAME
		select count(*) cnt
		into l_cfg_cnt
		from dbsrc_cfg c
			inner join dbsrc_cfg_dbscript g
				on g.cfg_name = c.cfg_name
			-- post-processing is optional and does not have to exist for a
			--  dbsrc_set
			--inner join dbsrc_cfg_post_prcs p
			--    on p.cfg_name = c.cfg_name
			inner join dbsrc_cfg_filter f
				on f.cfg_name = c.cfg_name
			inner join dbsrc_cfg_transform t
				on t.cfg_name = c.cfg_name
			where c.cfg_name = p_cfg_name;
		if l_cfg_cnt < 1 then
			p('WARN: export_ddl(): Some or all of the dbsrc_cfg is missing');
		end if;
		G_CFG_NAME := p_cfg_name;
		--
		-- assign new dbsrc_set_no
		G_SET_NO := sq_dbsrc_set_no.nextval;
		dbsrc_mgr.set_set_no(G_SET_NO);
		--
		-- export and post-process
		gather_dbsrc_stats;
		get_db_ddl;
		gather_dbsrc_stats;
		post_prcs;
		describe;
	--
	exception
		when others then
			p('ERROR export_ddl:');
			p(dbms_utility.format_error_backtrace());
			raise;
	end export_ddl;
end dbsrc_mgr;
/
show errors;

