-- Generated by dbsrc: database source utility, created by Steve Rutledge
-- This file was generated on 30-OCT-18 by DBSRC_U@sterutle
-- ============================================================================
-- DESCRIPTION
--
-- This is a companion script to the "all_1060_create_*.sql"
-- scripts, intended to drop all objects created by the
-- "all_1060_create_*.sql" scripts.
--
-- ============================================================================
-- ========================================================================
-- BEGIN Configuration Details
-- all:  30-OCT-18
--    ALL: export everything remotely interesting in entire db
--    q794008@QAMR-ACCOUNTS\USRTPWL67501/01@ ../cfg/..\cfg\all.sql:@sterutle
--
-- dbms_metadata.set_filter() Parameters:
--    EXCLUDE_PATH_EXPR ='DATABASE_EXPORT/SCHEMA/JAVA_CLASS',
--    EXCLUDE_PATH_EXPR ='DATABASE_EXPORT/SCHEMA/JAVA_RESOURCE',
--    EXCLUDE_PATH_EXPR ='DATABASE_EXPORT/SCHEMA/JAVA_SOURCE',
--    EXCLUDE_PATH_EXPR ='DATABASE_EXPORT/SCHEMA/PACKAGE_BODIES/PACKAGE/PACKAGE_BODY',
--    EXCLUDE_PATH_EXPR ='DATABASE_EXPORT/SCHEMA/PUBLIC_SYNONYM/SYNONYM',
--    EXCLUDE_PATH_EXPR ='DATABASE_EXPORT/XS_SECURITY',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/AUDIT',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/AUDIT_DEFAULT',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/AUDIT_UNIFIED',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/DIRECTORY/DIRECTORY',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/EARLY_OPTIONS/CLUSTERING',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/EARLY_OPTIONS/OPTION_TYPE/TYPE_BODY',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/EARLY_OPTIONS/RADM_POLICY',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/END_PLUGTS_BLK',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/GRANT/SYSTEM_GRANT/PROC_SYSTEM_GRANT',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/NORMAL_OPTIONS/CLUSTERING',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/NORMAL_OPTIONS/RADM_POLICY',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/PASSWORD_VERIFY_FUNCTION',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/PLUGTS_FULL/PLUGTS_BEGIN',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/PLUGTS_FULL/PLUGTS_BLK',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/PLUGTS_FULL/PLUGTS_CHECKPL',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/POST_SYSTEM',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/PRE_SYSTEM',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/PROFILE',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/PROXY',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/RADM_FPTM',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/RESOURCE_COST',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/ROLE',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/ROLLBACK_SEGMENT',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/SCHEMA',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/SYSTEM_PROCOBJACT',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/TABLESPACE',
--    INCLUDE_PATH_EXPR ='DATABASE_EXPORT/TABLESPACE_ILM_POLICY',
--
-- dbms_metadata.set_transform() Parameters:
--    CONSTRAINTS,false,TABLE
--    CONSTRAINTS_AS_ALTER,true,TABLE
--    FORCE,TRUE,VIEW
--    PARTITIONING,false,INDEX
--    PARTITIONING,false,MATERIALIZED VIEW
--    PARTITIONING,false,TABLE
--    PRETTY,true,
--    REF_CONSTRAINTS,false,TABLE
--    SEGMENT_ATTRIBUTES,false,CLUSTER
--    SEGMENT_ATTRIBUTES,false,CONSTRAINT
--    SEGMENT_ATTRIBUTES,false,INDEX
--    SEGMENT_ATTRIBUTES,false,MATERIALIZED VIEW
--    SEGMENT_ATTRIBUTES,false,ROLLBACK_SEGMENT
--    SEGMENT_ATTRIBUTES,false,TABLE
--    SEGMENT_ATTRIBUTES,false,TABLESPACE
--    SQLTERMINATOR,true,
--    STORAGE,false,INDEX
--    STORAGE,false,MATERIALIZED VIEW
--    STORAGE,false,TABLE
--    TABLESPACE,false,MATERIALIZED VIEW
--    TABLESPACE,false,TABLE
-- END Configuration Details
-- ========================================================================
-- ========================================================================
-- BEGIN Database Source Details
-- dbsrc_set_no=1060 cfg_name=all create_date=30-OCT-18
-- create_process=q794008@QAMR-ACCOUNTS\USRTPWL67501/01@ ../sql/export_ddl.sql:@sterutle
-- TOTAL: 52977
--   ASSOCIATION: 13
--   AUDIT_OBJ: 410
--   AUDIT_POLICY: 8
--   AUDIT_POLICY_ENABLE: 2
--   CLUSTER: 10
--   COMMENT: 27076
--   CONSTRAINT: 3221
--   DEFAULT_ROLE: 43
--   DIMENSION: 5
--   DIRECTORY: 15
--   EPILOGUE: 1
--   FUNCTION: 697
--   INDEX: 3191
--   INDEXTYPE: 7
--   LIBRARY: 228
--   MATERIALIZED VIEW: 2
--   OBJECT_GRANT: 4083
--   ON_USER_GRANT: 25
--   OPERATOR: 54
--   PACKAGE: 1307
--   PACKAGE_SPEC: 1
--   POST_TABLE_ACTION: 4
--   PRE_TABLE_ACTION: 6
--   PROCACT_INSTANCE: 28
--   PROCACT_SCHEMA: 29
--   PROCACT_SYSTEM: 47
--   PROCDEPOBJ: 20
--   PROCEDURE: 406
--   PROCOBJ: 39
--   PROC_SYSTEM_GRANT: 14
--   PROFILE: 2
--   PROLOGUE: 1
--   RADM_FPTM: 1
--   RESOURCE_COST: 1
--   RLS_POLICY: 51
--   ROLE: 86
--   ROLE_GRANT: 19
--   ROLLBACK_SEGMENT: 1
--   SEQUENCE: 264
--   SYNONYM: 68
--   SYSTEM_GRANT: 53
--   TABLE: 2406
--   TABLESPACE: 7
--   TABLESPACE_QUOTA: 7
--   TABLE_REF: 52
--   TRIGGER: 592
--   TRIGGER_ALTER: 592
--   TYPE: 864
--   TYPE BODY: 311
--   USER: 43
--   VIEW: 6519
--   XMLSCHEMA: 45
-- END Database Source Details
-- ========================================================================
-- ========================================================================
-- BEGIN Post-Processing Details
-- Total object(s) excluded due to post-processing: 0
-- Total object(s) affected in any way due to post-processing: 6521
-- (16) Handle sqlplus limitation by injecting newlines after commas 
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
--   Post-processing 264 object(s) affected.
-- (17) Handle sqlplus limitation by injecting newlines after commas in 
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
--   Post-processing 6519 object(s) affected.
-- (28) inject a call to a prologue script for customizations.
--   Post-processing 1 object(s) affected.
-- (29) inject a call to an epilogue script for customizations.
--   Post-processing 1 object(s) affected.
-- END Post-Processing Details
-- ========================================================================

set define on;
column logfile new_value v_logfile noprint
select 'all_1060_drop_'||to_char(sysdate,'YYYYMMDD_HH24MISS')||'.log' logfile from dual;
spool &v_logfile

set trimspool on;
set echo on;

select SYS_CONTEXT ('USEREqV', 'DB_NAME') as DATABASE, SYS_CONTEXT ('USERENV', 'SESSION_USER') as SESSION_USER, SYSDATE from dual;

-- the output script may have embedded ampersands that are NOT substitution variables
set define off;
-- the output script have blank lines in the middle of a sql statement
set sqlblanklines on;

-- ============================================================================
-- script body
-- ============================================================================

-- ====================================================================
-- public dblinks
-- ====================================================================


-- ====================================================================
-- user
-- ====================================================================

drop user "ANONYMOUS" cascade;
drop user "APEX_040200" cascade;
drop user "APEX_PUBLIC_USER" cascade;
drop user "APPQOSSYS" cascade;
drop user "AUDSYS" cascade;
drop user "BI" cascade;
drop user "CTXSYS" cascade;
drop user "DBSNMP" cascade;
drop user "DBSRC_U" cascade;
drop user "DIP" cascade;
drop user "DVF" cascade;
drop user "DVSYS" cascade;
drop user "FLOWS_FILES" cascade;
drop user "GSMADMIN_INTERNAL" cascade;
drop user "GSMCATUSER" cascade;
drop user "GSMUSER" cascade;
drop user "HR" cascade;
drop user "IX" cascade;
drop user "LBACSYS" cascade;
drop user "MDDATA" cascade;
drop user "MDSYS" cascade;
drop user "OE" cascade;
drop user "OJVMSYS" cascade;
drop user "OLAPSYS" cascade;
drop user "ORACLE_OCM" cascade;
drop user "ORDDATA" cascade;
drop user "ORDPLUGINS" cascade;
drop user "ORDSYS" cascade;
drop user "OUTLN" cascade;
drop user "PM" cascade;
drop user "SCOTT" cascade;
drop user "SH" cascade;
drop user "SI_INFORMTN_SCHEMA" cascade;
drop user "SPATIAL_CSW_ADMIN_USR" cascade;
drop user "SPATIAL_WFS_ADMIN_USR" cascade;
drop user "SYS" cascade;
drop user "SYSBACKUP" cascade;
drop user "SYSDG" cascade;
drop user "SYSKM" cascade;
drop user "SYSTEM" cascade;
drop user "WMSYS" cascade;
drop user "XDB" cascade;
drop user "XS$NULL" cascade;

-- ====================================================================
-- profile
-- ====================================================================

drop profile "DEFAULT";
drop profile "ORA_STIG_PROFILE";

-- ====================================================================
-- role
-- ====================================================================

drop role "ADM_PARALLEL_EXECUTE_TASK";
drop role "APEX_ADMINISTRATOR_ROLE";
drop role "APEX_GRANTS_FOR_NEW_USERS_ROLE";
drop role "AQ_ADMINISTRATOR_ROLE";
drop role "AQ_USER_ROLE";
drop role "AUDIT_ADMIN";
drop role "AUDIT_VIEWER";
drop role "AUTHENTICATEDUSER";
drop role "CAPTURE_ADMIN";
drop role "CDB_DBA";
drop role "CONNECT";
drop role "CSW_USR_ROLE";
drop role "CTXAPP";
drop role "DATAPUMP_EXP_FULL_DATABASE";
drop role "DATAPUMP_IMP_FULL_DATABASE";
drop role "DBA";
drop role "DBFS_ROLE";
drop role "DELETE_CATALOG_ROLE";
drop role "DV_ACCTMGR";
drop role "DV_ADMIN";
drop role "DV_AUDIT_CLEANUP";
drop role "DV_DATAPUMP_NETWORK_LINK";
drop role "DV_GOLDENGATE_ADMIN";
drop role "DV_GOLDENGATE_REDO_ACCESS";
drop role "DV_MONITOR";
drop role "DV_OWNER";
drop role "DV_PATCH_ADMIN";
drop role "DV_PUBLIC";
drop role "DV_REALM_OWNER";
drop role "DV_REALM_RESOURCE";
drop role "DV_SECANALYST";
drop role "DV_STREAMS_ADMIN";
drop role "DV_XSTREAM_ADMIN";
drop role "EJBCLIENT";
drop role "EM_EXPRESS_ALL";
drop role "EM_EXPRESS_BASIC";
drop role "EXECUTE_CATALOG_ROLE";
drop role "EXP_FULL_DATABASE";
drop role "GATHER_SYSTEM_STATISTICS";
drop role "GDS_CATALOG_SELECT";
drop role "GLOBAL_AQ_USER_ROLE";
drop role "GSMADMIN_ROLE";
drop role "GSMUSER_ROLE";
drop role "GSM_POOLADMIN_ROLE";
drop role "HS_ADMIN_EXECUTE_ROLE";
drop role "HS_ADMIN_ROLE";
drop role "HS_ADMIN_SELECT_ROLE";
drop role "IMP_FULL_DATABASE";
drop role "JAVADEBUGPRIV";
drop role "JAVAIDPRIV";
drop role "JAVASYSPRIV";
drop role "JAVAUSERPRIV";
drop role "JAVA_ADMIN";
drop role "JAVA_DEPLOY";
drop role "JMXSERVER";
drop role "LBAC_DBA";
drop role "LOGSTDBY_ADMINISTRATOR";
drop role "OEM_ADVISOR";
drop role "OEM_MONITOR";
drop role "OLAP_DBA";
drop role "OLAP_USER";
drop role "OLAP_XS_ADMIN";
drop role "OPTIMIZER_PROCESSING_RATE";
drop role "ORDADMIN";
drop role "PDB_DBA";
drop role "PROVISIONER";
drop role "PUBLIC";
drop role "RECOVERY_CATALOG_OWNER";
drop role "RECOVERY_CATALOG_USER";
drop role "RESOURCE";
drop role "SCHEDULER_ADMIN";
drop role "SELECT_CATALOG_ROLE";
drop role "SPATIAL_CSW_ADMIN";
drop role "SPATIAL_WFS_ADMIN";
drop role "WFS_USR_ROLE";
drop role "WM_ADMIN_ROLE";
drop role "XDBADMIN";
drop role "XDB_SET_INVOKER";
drop role "XDB_WEBSERVICES";
drop role "XDB_WEBSERVICES_OVER_HTTP";
drop role "XDB_WEBSERVICES_WITH_PUBLIC";
drop role "XS_CACHE_ADMIN";
drop role "XS_NAMESPACE_ADMIN";
drop role "XS_RESOURCE";
drop role "XS_SESSION_ADMIN";
drop role "_NEXT_USER";

-- ====================================================================
-- context
-- ====================================================================



-- =============
-- END OF SCRIPT
-- =============

spool off;
exit;


