
BEGIN
DECLARE
AGENT_EXISTS  exception;
PRAGMA EXCEPTION_INIT(AGENT_EXISTS, -24089);
BEGIN
dbms_aqadm.create_aq_agent(agent_name  => 'SCHEDULER$_EVENT_AGENT', enable_http => FALSE, enable_smtp => FALSE, enable_anyp => FALSE);
dbms_aqadm.enable_db_access(agent_name => 'SCHEDULER$_EVENT_AGENT', db_username => 'SYS');
EXCEPTION WHEN AGENT_EXISTS THEN NULL; END;

COMMIT;
END;
/


BEGIN
DECLARE
AGENT_EXISTS  exception;
PRAGMA EXCEPTION_INIT(AGENT_EXISTS, -24089);
BEGIN
dbms_aqadm.create_aq_agent(agent_name  => 'SCHEDULER$_REMDB_AGENT', enable_http => FALSE, enable_smtp => FALSE, enable_anyp => FALSE);
dbms_aqadm.enable_db_access(agent_name => 'SCHEDULER$_REMDB_AGENT', db_username => 'SYS');
EXCEPTION WHEN AGENT_EXISTS THEN NULL; END;

COMMIT;
END;
/


BEGIN
DECLARE
AGENT_EXISTS  exception;
PRAGMA EXCEPTION_INIT(AGENT_EXISTS, -24089);
BEGIN
dbms_aqadm.create_aq_agent(agent_name  => 'SERVER_ALERT', enable_http => FALSE, enable_smtp => FALSE, enable_anyp => FALSE);
dbms_aqadm.enable_db_access(agent_name => 'SERVER_ALERT', db_username => 'SYS');
EXCEPTION WHEN AGENT_EXISTS THEN NULL; END;

COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2158213');
COMMIT;
END;
/


BEGIN
DECLARE
CURSOR prog_args IS SELECT a.program_name program_name, a.arg_name arg_name,  a.arg_position position, a.type_name type_name, DECODE(bitand(a.flags, 2+4+64+128+256+1024+2048+8192+16384+32768        +65536+131072+262144+524288+1048576),        2,'JOB_NAME',4,'JOB_OWNER',        64, 'JOB_START', 128, 'WINDOW_START',        256, 'WINDOW_END', 1024, 'JOB_SUBNAME',         2048, 'EVENT_MESSAGE', 8192, 'JOB_SCHEDULED_START',         16384, 'CHAIN_ID', 32768, 'CREDENTIAL_OWNER',        65536, 'CREDENTIAL_NAME', 131072, 'DESTINATION_OWNER',        262144, 'DESTINATION_NAME', 524288, 'JOB_DEST_ID',        1048576, 'LOG_ID', NULL) int_arg_type, a.value value, BITAND(a.flags,1) out_flag  FROM scheduler$_program_arg a;
 BEGIN
FOR arg in prog_args LOOP
 IF arg.int_arg_type IS NULL THEN
 dbms_scheduler.define_anydata_argument( '"'||arg.program_name|| '"', arg.position,  CASE WHEN arg.arg_name IS NULL THEN NULL ELSE
     '"'||arg.arg_name||'"' END, arg.type_name, arg.value, arg.out_flag=1 );
 ELSE
 dbms_scheduler.define_metadata_argument( '"' || arg.program_name||'"',arg.int_arg_type, arg.position, CASE WHEN arg.arg_name IS NULL THEN NULL ELSE
     '"'||arg.arg_name||'"' END );
 END IF;
 END LOOP;
 END;
dbms_scheduler.enable('"HS_PARALLEL_SAMPLING"');
dbms_scheduler.enable('"AQ$_PROPAGATION_PROGRAM"');
 EXECUTE IMMEDIATE 'DROP TABLE scheduler$_program_arg' ;
DECLARE
CURSOR job_args IS SELECT  a.job_name job_name, a.arg_position position, a.value value FROM scheduler$_job_arg a ;
 BEGIN
 FOR arg in job_args LOOP
 dbms_scheduler.set_job_anydata_value( '"'||arg.job_name||'"',arg.position, arg.value);
 END LOOP;
 END;
dbms_scheduler.enable('"DRA_REEVALUATE_OPEN_FAILURES"');
 EXECUTE IMMEDIATE 'DROP TABLE scheduler$_job_arg' ;
COMMIT;
END;
/


BEGIN
SYS.DBMS_AQ_IMP_INTERNAL.CLEANUP_SCHEMA_IMPORT;
COMMIT;
END;
/


BEGIN
SYS.DBMS_AQ_IMP_INTERNAL.CLEANUP_SCHEMA_IMPORT;
COMMIT;
END;
/


BEGIN
SYS.DBMS_AQ_IMP_INTERNAL.CLEANUP_SCHEMA_IMPORT;
COMMIT;
END;
/


BEGIN
SYS.DBMS_REPCAT_MIG.CLEANUP_IMPORT(expseal=>'EXPORT:V12.01.00');
COMMIT;
END;
/

