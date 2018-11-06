
--    Copyright 2019 Steve Rutledge
--    =========================================================================
--    This file is part of DBSRC Librarian.
--
--    DBSRC Librarian is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, version 3 of the License.
--
--    DBSRC Librarian is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with DBSRC Librarian (see file COPYING.txt).  
--    If not, see <https://www.gnu.org/licenses/>.
--    =========================================================================

-- ============================================================================
-- DESCRIPTION
--
-- Generate the "object creation" database scripts, within a new directory. 
-- Create script file for each owner and ddl type.
--
-- INVOCATION	sqlplus -s user/pw@db @get_create_otn_dbscripts [set_no]
--
--     		dir name: ../out/[cfg_name]
--      	script names: [cfg_name]_create.[owner].[type].all.sql
--
--	parm 1: set_no is optional and defaults to max(dbsrc.set_no)
--
-- ============================================================================

prompt -- BEGIN get_create_ot_dbscripts ...

-- appropriate sqlplus settings for batch spooling to a file
@@_init_batch

-- no headers needed for this output!
set pages 0;
col text for a32767 wrap;

-- stop immediately if something blows up, to minimize wasted time
whenever sqlerror exit rollback;

-- ================================================
-- parm 1: set_no (default is current_dbsrc set_no)
-- ================================================

-- Sqlplus makes this awkward: we want the crnt_dbsrc view to default to the
--  latest dbsrc (the max dbsrc_set_no). But, we also want to have the
--  option to instead pass in a different set_no on the cmdline.
-- The below wierdness does just that: set dbsrc.mgr.set_no to cmdline parm, 
--	else default to 1
col 1 new_value 1
select '' "1" from dual where rownum = 0;
exec dbsrc_mgr.set_set_no(&&1);

-- Copy set_no from pl/sql state into sqlplus substitution variable
-- where we can use it from sqlplus stuff.
-- (trim? implicit datatype conversion added spaces, so trim, blah)
col x new_value p_set_no noprint
select trim(dbsrc_mgr.get_set_no()) x from dual;

-- lookup cfg_name for set_no and copy into a sqlplus var
col x new_value p_cfg_name noprint
select dbsrc_mgr.get_cfg_name() x from dual;

-- create a descriptively-named directory to contain all the files we generate.
-- Note, if dir already exists, silently continue
col x new_value p_dirname noprint 
select 'out\&&p_cfg_name\create_ot' x from dual;
host if not exist "&&p_dirname" mkdir "&&p_dirname"

-- =============================================================================
-- (1) generate _readme.txt
-- =============================================================================

set termout on
prompt --   Creating &&p_dirname\_readme.txt
set termout off

spool &&p_dirname\_readme.txt

prompt -- Generated by DBSRC Library, Copyright Steve Rutledge 2019

select 
    '-- This file was generated on '||sysdate||' by '||user||'@'||
        sys_context('userenv', 'db_name') 
from dual;

prompt -- ============================================================================
prompt -- DESCRIPTION
prompt --;
prompt -- These are database scripts for each owner and type in the &&p_cfg_name dbsrc
prompt -- configuration. DDL is arranged in dependency order inside each script.
prompt --;
prompt -- Explicitly grouping ddl by owner and type will of course violate build
prompt -- dependencies, so don't expect to be able to execute these scripts without
prompt -- errors.
prompt --;
prompt -- ============================================================================

-- describe the source for the current set_no (summarize the objects in the
-- set, the configuration used to generate this set, etc.
exec dbsrc_mgr.describe

spool off;

-- =============================================================================
-- (1) generate slave script
-- =============================================================================

spool &&p_dirname\_ot_slave.sql

-- bind vars for below
prompt var o varchar2(35);
prompt var t varchar2(35);

-- we are bursting into possibly VERY many scripts here by
--  carefully varying the spool files we write to:
--      create.[owner].[object_type].all.sql
-- fyi: chr(59) is a semi-colon
select
    'spool &&p_dirname\create_'||
		case when object_owner = 'NO_OWNER' then 'x' else lower(object_owner) end||'.'||
		lower(replace(ddl_type,' ','_'))||
		'.all.sql'||
--
-- now get the ddl
'
exec :o := '''||object_owner||''''||chr(59)||'
exec :t := '''||ddl_type||''''||chr(59)||'
with pp as (
    select /*+ monitor */ s.order_no,
        listagg(
            ''-- (''||pp.order_no||'') ''|| 
                regexp_replace(pp.comment_text, chr(10), chr(10)||''--      ''), 
            chr(10)
         ) within group (order by pp.order_no)||chr(10)
        post_prcs_comment_text
    from crnt_dbsrc s
        inner join dbsrc_cfg_post_prcs pp
            on pp.cfg_name = s.cfg_name and
                instr(s.post_prcs_order_no_list, '':''||pp.order_no||'':'') > 0
    where dbscript_include_flag = ''Y''
    group by s.order_no
)
select case when pp.order_no is not null then
        ''-- [dbsrc POST-PROCESSED]:''||chr(10)||pp.post_prcs_comment_text
        else null
    end||s.dbsrc_text_cooked text
from crnt_dbsrc s 
    left outer join pp
        on s.order_no = pp.order_no
where 
	s.dbscript_include_flag = ''Y'' and
	s.object_owner = :o and
	s.ddl_type = :t
order by s.order_no'||chr(59)||chr(10)||
'spool off'||chr(59) text
from crnt_dbsrc
where 
    dbscript_include_flag = 'Y' and
	--
	-- we never want scripts for these!
    ddl_type not in ('PROLOGUE', 'EPILOGUE')
--
group by object_owner, ddl_type
order by object_owner, ddl_type;
spool off;

-- =============================================================================
-- (2) execute slave script
-- ==============================================================================

set termout on
prompt --   Creating &&p_dirname\[cfg_name]_create.[owner].[type].all.sql script(s)
set termout off

@@&&p_dirname\_ot_slave.sql

-- =============================================================================
-- (3) cleanup
-- =============================================================================

host del "&&p_dirname\_ot_slave.sql"

set termout on;
prompt -- END get_create_ot_dbscripts.

-- done!
exit;
'
