CREATE SEQUENCE  "SYS"."UGROUP_SEQUENCE"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."PDB_ALERT_SEQUENCE"  MINVALUE 1 MAXVALUE 18446744073709551615 INCREMENT BY 1 START WITH 1 CACHE 10 ORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."SQLLOG$_SEQ"  MINVALUE 1 MAXVALUE 100000000000000000000 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."PROFNUM$"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."JOBSEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."ORA_TQ_BASE$"  MINVALUE 1 MAXVALUE 4294967 INCREMENT BY 1 START WITH 30001 CACHE 10000 NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."TSM_MIG_SEQ$"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."OBJECT_GRANT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 48322 CACHE 20 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."SYSTEM_GRANT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1701 CACHE 20 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."USER_GRANT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 481 CACHE 20 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AUDSES$"  MINVALUE 1 MAXVALUE 2000000000 INCREMENT BY 1 START WITH 500321 CACHE 10000 NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."XSPARAM_REG_SEQUENCE$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."DAM_CLEANUP_SEQ$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."CACHE_STATS_SEQ_1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."CACHE_STATS_SEQ_0"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."ST_OPR_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 758 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."PARTITION_NAME$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 407 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."SNAPSHOT_ID$"  MINVALUE 1 MAXVALUE 2147483647 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."SNAPSITE_ID$"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."RGROUPSEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."CDC_SUBSCRIBE_SEQ$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."CDC_RSID_SEQ$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10000 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."STREAMS$_CAP_SUB_INST"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."STREAMS$_CAPTURE_INST"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."STREAMS$_PROPAGATION_SEQNUM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."APPLY$_SOURCE_OBJ_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."APPLY$_DEST_OBJ_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."STREAMS$_STMT_HANDLER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."APPLY$_ERROR_HANDLER_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."STREAMS$_SM_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."LOG$SEQUENCE"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."COMPARISON_SEQ$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."COMPARISON_SCAN_SEQ$"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."CONFLICT_HANDLER_ID_SEQ$"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."PSINDEX_SEQ$"  MINVALUE 1 MAXVALUE 18446744073709551615 INCREMENT BY 1 START WITH 1100 CACHE 1000 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AWSEQ$"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1000 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AWLOGSEQ$"  MINVALUE 1 MAXVALUE 18446744073709551615 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."SYNCREF_GROUP_ID_SEQ$"  MINVALUE 1 MAXVALUE 2147483647 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."SYNCREF_STEP_SEQ$"  MINVALUE 1 MAXVALUE 2147483647 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."REDEF_SEQ$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."DM$EXPIMP_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."CLI_ID$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."IDGEN1$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 50 START WITH 3128251 CACHE 1000 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."ILM_SEQ$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."ILM_EXECUTIONID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_EMX_FILE_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 201 CACHE 100 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_REPT_COMP_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 100 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_REPT_REPT_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 201 CACHE 100 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_REPT_FORMAT_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 100 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRP$_REPORT_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 60 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."ORA_PLAN_ID_SEQ$"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."TSDP_SENSITIVE$SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."TSDP_SOURCE$SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."TSDP_TYPE$SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."TSDP_POLICY$SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."TSDP_SUBPOL$SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."TSDP_ASSOCIATION$SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."TSDP_PROTECTION$SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."TSDP_POLNAME$SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_TRANS_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."CHNF$_QUERYID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."CHNF$_CLAUSEID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."SSCR_CAP_SEQ$"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."INVALIDATION_REG_ID$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 301 CACHE 300 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_PROPAGATION_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_CHAINSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_IOTENQTXID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 CACHE 1000 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_RULE_SET_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 1000 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_RULE_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 1000 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_PUBLISHER_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 1000 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_NONDURSUB_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_ADV_SEQ_TASK"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 54 CACHE 10 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_ADV_SEQ_EXEC"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 44 CACHE 10 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_ADV_SEQ_DIR"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 11 CACHE 10 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_ADV_SEQ_DIR_INST"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_ADV_SEQ_JOURNAL"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_ADV_SEQ_MSGGROUP"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 44 CACHE 10 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_ADV_SQLT_PLAN_SEQ"  MINVALUE 1 MAXVALUE 18446744073709551615 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."SCHEDULER$_LWJOB_OID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."SCHEDULER$_INSTANCE_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 792 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."SCHEDULER$_RDB_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."SCHEDULER$_EVTSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."SCHEDULER$_JOBSUFFIX_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_ALERT_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 373 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_ALERT_THRSLOG_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 391 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_SQLSET_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_SQLSET_REF_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_SQLSET_STMT_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_SQLSET_WORKSPACE_PLAN_SEQ"  MINVALUE 1 MAXVALUE 18446744073709551615 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRR$_CAPTURE_ID"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRR$_REPLAY_ID"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WI$_JOB_ID"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_ADV_SEQ_SQLW_QUERY"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."DBMS_PARALLEL_EXECUTE_SEQ$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."DBFS_SFS$_FSSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 8192 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."DBFS_HS$_RSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."DBFS_HS$_STOREIDSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 2 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."DBFS_HS$_ARCHIVEREFIDSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 2 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."DBFS_HS$_TARBALLSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 2 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."DBFS_HS$_POLICYIDSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 2 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."DBFS_HS$_BACKUPFILEIDSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 2 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."XS$ID_SEQUENCE"  MINVALUE 2147493648 MAXVALUE 18446744073709551615 INCREMENT BY 1 START WITH 2147493688 CACHE 20 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."PRIV_CAPTURE_SEQ$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."PRIV_USED_ID$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."PRIV_UNUSED_ID$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRI$_SQLSET_RATMASK_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."SQL_TK_CHK_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 161 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."GENERATOR$_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."GROUP_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."SYNOPSIS_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."SYSLSBY_EDS_DDL_SEQ"  MINVALUE 0 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 0 CACHE 20 NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."STREAMS$_APPLY_SPILL_TXNKEY_S"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."FGR$_NAMES_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."STREAMS$_RULE_NAME_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."MV_RF$JOBSEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."IDX_RB$JOBSEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."DBMS_LOCK_ID_V2"  MINVALUE 1073741824 MAXVALUE 1999999999 INCREMENT BY 1 START WITH 1073741865 CACHE 20 NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."JOBSEQLSBY"  MINVALUE 1000000000 MAXVALUE 1999999999 INCREMENT BY 1 START WITH 1000000000 CACHE 20 NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_SCHEDULER$_EVENT_QTAB_N"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_SCHEDULER$_REMDB_JOBQTAB_N"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_SCHEDULER_FILEWATCHER_QT_N"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_ALERT_QT_N"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 22 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_KUPC$DATAPUMP_QUETAB_N"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."HS$_FDS_CLASS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."HS$_FDS_INST_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."HS$_CLASS_CAPS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."HS$_INST_CAPS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."HS$_BASE_DD_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."HS$_CLASS_DD_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."HS$_INST_DD_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."HS$_CLASS_INIT_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."HS$_INST_INIT_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."HS_BULK_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_AQ$_MEM_MC_N"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_AQ_PROP_TABLE_N"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_KUPC$DATAPUMP_QUETAB_1_N"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AQ$_SYS$SERVICE_METRICS_TAB_N"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."JAVA$POLICY$SEQUENCE$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 161 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."JAVA$PREFS$SEQ$"  MINVALUE 1 MAXVALUE 2147483647 INCREMENT BY 1 START WITH 21 CACHE 20 ORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."EXPRESS_S$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AWMD_S$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AWCREATE_S$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AWCREATE10G_S$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AWXML_S$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."AWREPORT_S$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."DBMS_CUBE_ADVICE_SEQ$"  MINVALUE 1 MAXVALUE 99999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."OLAP_ATTRIBUTES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."OLAP_DIMENSIONALITY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."OLAP_DIM_LEVELS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."OLAP_HIERARCHIES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."OLAP_HIER_LEVELS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."OLAP_MAPPINGS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."OLAP_MEASURES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."OLAP_MODELS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."OLAP_ASSIGNMENTS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."OLAP_CALCULATED_MEMBERS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."OLAP_PROPERTIES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."UTL_RECOMP_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "SYS"."WRM$_DEEP_PURGE_INTERVAL"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 4 NOCACHE  NOORDER  CYCLE  NOPARTITION ;