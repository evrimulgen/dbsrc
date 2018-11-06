CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYS"."SYSLSBY_EDS_DDL_TRIG"
  AFTER CREATE OR ALTER ON DATABASE
  DECLARE
   DGL_STATUS_EDS_EVOLVING     EXCEPTION;
   PRAGMA               EXCEPTION_INIT(DGL_STATUS_EDS_EVOLVING, -16310);
   sql_text             ora_name_list_t;
   t_stmt               CLOB;
   stmt                 CLOB;
   n                    NUMBER;
   dummy                NUMBER;
   pos		        NUMBER;
   evolve               BOOLEAN := FALSE;
   table_owner          VARCHAR2(40);
   table_ownerQ         VARCHAR2(40);
   table_name           VARCHAR2(40);
   table_nameQ          VARCHAR2(40);
   dbrole               VARCHAR2(80);
   state                VARCHAR2(255);
   table_type           VARCHAR2(30);
   job_stmt             CLOB;
   l_xid_str            VARCHAR2(22);
BEGIN
   -- only applicable on primary
   SELECT database_role INTO dbrole FROM v$database;
   IF dbrole != 'PRIMARY' THEN
      RETURN;
   END IF;

   -- put SQL into single buffer
   dummy := ora_sql_txt(sql_text);
   t_stmt := NULL;
   FOR i IN 1..dummy LOOP
      t_stmt := t_stmt || sql_text(i);
   END LOOP;

   -- handle CREATE UNIQUE INDEX which requires digging out table and owner
   IF ora_sysevent = 'CREATE' THEN
      IF ora_dict_obj_type = 'INDEX' THEN
	 SELECT INSTR(UPPER(t_stmt), ' UNIQUE ') INTO pos FROM dual;
	 IF pos = 0 THEN
	    RETURN;
	 END IF;

         -- only interested in user cursors
         dbms_internal_logstdby.eds_user_cursor(evolve,
                                                table_owner,
                                                table_name);

      END IF;

   -- otherwise anything other than ALTER TABLE is uninteresting
   ELSE
      IF ora_sysevent != 'ALTER' OR ora_dict_obj_type != 'TABLE' THEN
         RETURN;
      END IF;

      -- look for RENAME token to eliminate DROP TABLE lacking a PURGE which
      -- comes in as an ALTER TABLE RENAME TO
      SELECT INSTR(UPPER(t_stmt), ' RENAME TO ') INTO pos FROM dual;
      IF pos != 0 THEN
         RETURN;
      END IF;

      evolve := TRUE;
      table_owner := ora_dict_obj_owner;
      table_name :=  ora_dict_obj_name;
   END IF;

   -- if its an EDS table and evolve not already started then start one
   IF evolve THEN
      stmt := 'select state from system.logstdby$eds_tables where owner=:1' ||
              ' and table_name=:2';
      BEGIN
	 EXECUTE IMMEDIATE stmt INTO state USING table_owner, table_name;
      EXCEPTION
         WHEN others THEN state := NULL;
      END;
      IF state IS NOT NULL THEN
	 IF state = 'EVOLVING' THEN
	    RAISE DGL_STATUS_EDS_EVOLVING;
	 END IF;
	 table_ownerQ := DBMS_ASSERT.ENQUOTE_NAME(table_owner,FALSE);
	 table_nameQ := DBMS_ASSERT.ENQUOTE_NAME(table_name,FALSE);

          -- start the evolve
	 DBMS_LOGSTDBY.EDS_EVOLVE_MANUAL(
                options => 'START',
 	        table_owner => table_ownerQ,
		table_name => table_nameQ
                );

         -- schedule the evolve finish
         SELECT syslsby_eds_ddl_seq.NEXTVAL INTO n FROM DUAL;
         l_xid_str := dbms_transaction.local_transaction_id();
         job_stmt := 'BEGIN DBMS_INTERNAL_LOGSTDBY.EDS_EVOLVE(' ||
                DBMS_ASSERT.ENQUOTE_LITERAL(replace(table_ownerQ,'''',''''''))
                 || ',' ||
                DBMS_ASSERT.ENQUOTE_LITERAL(replace(table_nameQ,'''',''''''))
                 || ',' ||
                DBMS_ASSERT.ENQUOTE_LITERAL(l_xid_str) ||
                '); END;';
         dbms_system.ksdwrt(dbms_system.alert_file,
                'LOGSTDBY: performing an EDS evolve in response to DDL');
         DBMS_SCHEDULER.CREATE_JOB(
              job_name => 'SYSLSBY_EDS_DDL_JOB_' || n,
              job_type => 'PLSQL_BLOCK',
              job_action => job_stmt,
              enabled => TRUE
              );
      END IF;
   END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYS"."LOGMNRGGC_TRIGGER"
BEFORE ddl ON DATABASE
 CALL logmnr_ddl_trigger_proc
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYS"."AW_TRUNC_TRG" AFTER TRUNCATE ON DATABASE
BEGIN
  aw_trunc_proc(ora_dict_obj_type, ora_dict_obj_name, ora_dict_obj_owner);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYS"."AW_REN_TRG" AFTER RENAME ON DATABASE
BEGIN
  aw_ren_proc(ora_dict_obj_type, ora_dict_obj_name, ora_dict_obj_owner);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYS"."AW_DROP_TRG" AFTER DROP ON DATABASE
BEGIN
  aw_drop_proc(ora_dict_obj_type, ora_dict_obj_name, ora_dict_obj_owner);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYS"."XDB_PI_TRIG"
BEFORE DROP OR TRUNCATE on DATABASE
BEGIN
  BEGIN
    IF (sys.is_vpd_enabled(sys.dictionary_obj_owner, sys.dictionary_obj_name, xdb.DBMS_XDBZ.IS_ENABLED_CONTENTS)) THEN
      xdb.XDB_PITRIG_PKG.pitrig_truncate(sys.dictionary_obj_owner, sys.dictionary_obj_name);
    ELSIF (sys.is_vpd_enabled(sys.dictionary_obj_owner, sys.dictionary_obj_name, xdb.DBMS_XDBZ.IS_ENABLED_RESMETADATA)) THEN
      xdb.XDB_PITRIG_PKG.pitrig_dropmetadata(sys.dictionary_obj_owner, sys.dictionary_obj_name);
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
     null;
  END;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYS"."OJDS$ROLE_TRIGGER$" after drop on database  WHEN (ora_dict_obj_type='ROLE') begin
    ojds_context.role_dropped(ora_dict_obj_name);
  exception -- if not present then ignore
  when others then
  if sqlcode not in (-00604, -04063, -06508) then raise; end if;
  end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYS"."CDC_ALTER_CTABLE_BEFORE"
  BEFORE
    ALTER ON DATABASE
    BEGIN
      /* NOP UNLESS A TABLE OBJECT */
      IF dictionary_obj_type = 'TABLE'
      THEN
        sys.dbms_cdc_ipublish.change_table_trigger(dictionary_obj_owner,dictionary_obj_name,sysevent);
      END IF;
      END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYS"."CDC_CREATE_CTABLE_AFTER"
  AFTER
    CREATE ON DATABASE
    BEGIN
      /* NOP UNLESS A TABLE OBJECT */
      IF dictionary_obj_type = 'TABLE'
      THEN
        sys.dbms_cdc_ipublish.change_table_trigger(dictionary_obj_owner,dictionary_obj_name,sysevent);
      END IF;
      END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYS"."CDC_CREATE_CTABLE_BEFORE"
  BEFORE
    CREATE ON DATABASE
    BEGIN
      /* NOP UNLESS A TABLE OBJECT */
      IF dictionary_obj_type = 'TABLE'
      THEN
        sys.dbms_cdc_ipublish.change_table_trigger(dictionary_obj_owner,dictionary_obj_name,'LOCK');
      END IF;
      END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYS"."CDC_DROP_CTABLE_BEFORE"
  BEFORE
    DROP ON DATABASE
    BEGIN
      /* NOP UNLESS A TABLE OBJECT */
      IF dictionary_obj_type = 'TABLE'
      THEN
        sys.dbms_cdc_ipublish.change_table_trigger(dictionary_obj_owner,dictionary_obj_name,sysevent);
      END IF;
      END;
/

