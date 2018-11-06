
BEGIN
SYS.DBMS_REPCAT_MIG.PRE_IMPORT;
COMMIT;
END;
/


BEGIN
sys.dbms_logrep_imp.instantiate_schema(schema_name=>NULL, export_db_name=>'STERUTLE.QWORLD.QUINTILES.COM', inst_scn=>'2157991');sys.dbms_logrep_imp.bump_scn(scn=>'2157991');
COMMIT;
END;
/


BEGIN
begin execute immediate 'begin dbms_rmin_sys.begin_import_export; end;'; exception when others then NULL; end;
COMMIT;
END;
/


BEGIN
dbms_resource_manager.create_pending_area;
COMMIT;
END;
/


BEGIN
dbms_server_alert.set_threshold(9000,dbms_server_alert.operator_GE,'85',dbms_server_alert.operator_GE,'97',1,1,NULL,dbms_server_alert.object_type_TABLESPACE,'');
COMMIT;
END;
/


BEGIN
dbms_resource_manager.set_consumer_group_mapping_pri(explicit => 1, oracle_user => 7, service_name => 6, client_os_user => 9, client_program => 8, client_machine => 10, module_name => 5, module_name_action => 4, service_module => 3, service_module_action => 2);
COMMIT;
END;
/


BEGIN
begin execute immediate 'begin dbms_resource_manager.set_consumer_group_mapping_pri(explicit => 1, oracle_user => 7, service_name => 6, client_os_user => 9, client_program => 8, client_machine => 10, module_name => 5, module_name_action => 4, service_module => 3, service_module_action => 2, client_id => 11);; end;'; exception when others then NULL; end;
COMMIT;
END;
/


BEGIN
declare error_num1 exception;PRAGMA EXCEPTION_INIT(error_num1, -29355);error_num2 exception;PRAGMA EXCEPTION_INIT(error_num2, -29368);begin dbms_resource_manager.set_consumer_group_mapping(attribute => 'ORACLE_USER', value => '"SYS"', consumer_group => 'SYS_GROUP');exception when error_num1 then NULL;when error_num2 then NULL;when others then raise; end;
COMMIT;
END;
/


BEGIN
declare error_num1 exception;PRAGMA EXCEPTION_INIT(error_num1, -29355);error_num2 exception;PRAGMA EXCEPTION_INIT(error_num2, -29368);begin dbms_resource_manager.set_consumer_group_mapping(attribute => 'ORACLE_USER', value => '"SYSTEM"', consumer_group => 'SYS_GROUP');exception when error_num1 then NULL;when error_num2 then NULL;when others then raise; end;
COMMIT;
END;
/


BEGIN
declare error_num1 exception;PRAGMA EXCEPTION_INIT(error_num1, -29355);error_num2 exception;PRAGMA EXCEPTION_INIT(error_num2, -29368);begin dbms_resource_manager.set_consumer_group_mapping(attribute => 'ORACLE_FUNCTION', value => '"BACKUP"', consumer_group => 'BATCH_GROUP');exception when error_num1 then NULL;when error_num2 then NULL;when others then raise; end;
COMMIT;
END;
/


BEGIN
declare error_num1 exception;PRAGMA EXCEPTION_INIT(error_num1, -29355);error_num2 exception;PRAGMA EXCEPTION_INIT(error_num2, -29368);begin dbms_resource_manager.set_consumer_group_mapping(attribute => 'ORACLE_FUNCTION', value => '"COPY"', consumer_group => 'BATCH_GROUP');exception when error_num1 then NULL;when error_num2 then NULL;when others then raise; end;
COMMIT;
END;
/


BEGIN
declare error_num1 exception;PRAGMA EXCEPTION_INIT(error_num1, -29355);error_num2 exception;PRAGMA EXCEPTION_INIT(error_num2, -29368);begin dbms_resource_manager.set_consumer_group_mapping(attribute => 'ORACLE_FUNCTION', value => '"DATALOAD"', consumer_group => 'ETL_GROUP');exception when error_num1 then NULL;when error_num2 then NULL;when others then raise; end;
COMMIT;
END;
/


BEGIN
declare error_num1 exception;PRAGMA EXCEPTION_INIT(error_num1, -29355);error_num2 exception;PRAGMA EXCEPTION_INIT(error_num2, -29368);begin dbms_resource_manager.set_consumer_group_mapping(attribute => 'ORACLE_FUNCTION', value => '"INMEMORY"', consumer_group => 'ORA$AUTOTASK');exception when error_num1 then NULL;when error_num2 then NULL;when others then raise; end;
COMMIT;
END;
/


BEGIN
dbms_resource_manager.submit_pending_area;
COMMIT;
END;
/


BEGIN
dbms_rmin.rm$_process_priv('PUBLIC',0,1,'LOW_GROUP',0,12);
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_AQADM TO "AQ_ADMINISTRATOR_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_AQADM TO "EXECUTE_CATALOG_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_AQADM TO "IMP_FULL_DATABASE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_AQADM TO "OEM_MONITOR"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_AQADM TO "SYSTEM" WITH GRANT OPTION');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_AQADM TO "IX"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_AQ TO "AQ_ADMINISTRATOR_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_AQ TO "AQ_USER_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_AQ TO "EXECUTE_CATALOG_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_AQ TO "OEM_MONITOR"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_AQ TO "SYSTEM" WITH GRANT OPTION');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_AQ TO "IX"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_AQIN TO "AQ_ADMINISTRATOR_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_AQIN TO "AQ_USER_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_AQIN TO "EXECUTE_CATALOG_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_RLS TO "EXECUTE_CATALOG_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_RLS TO "RECOVERY_CATALOG_OWNER"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_RLS TO "DV_OWNER"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_DEFER_SYS TO "DBA"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_DEFER_QUERY TO "DBA"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_REPCAT TO "EXECUTE_CATALOG_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_REPCAT TO "SYSTEM"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_INTERNAL_REPCAT TO "EXECUTE_CATALOG_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_REPCAT_DECL TO "EXECUTE_CATALOG_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_RECTIFIER_DIFF TO "EXECUTE_CATALOG_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_SNAPSHOT TO "PUBLIC"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_DEFER TO "EXECUTE_CATALOG_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_OFFLINE_OG TO "EXECUTE_CATALOG_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_OFFLINE_SNAPSHOT TO "EXECUTE_CATALOG_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_AQJMS TO "PUBLIC"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_FGA TO "EXECUTE_CATALOG_ROLE"');
COMMIT;
END;
/


BEGIN
SYS.DBMS_UTILITY.EXEC_DDL_STATEMENT('GRANT EXECUTE ON DBMS_FGA TO "AUDIT_ADMIN"');
COMMIT;
END;
/

