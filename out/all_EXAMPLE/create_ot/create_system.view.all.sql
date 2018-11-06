-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_WORKLOAD" ("WORKLOADID",
"IMPORT_TIME",
"QUERYID",
"APPLICATION",
"CARDINALITY",
"RESULTSIZE",
"LASTUSE",
"FREQUENCY",
"OWNER",
"PRIORITY",
"QUERY",
"RESPONSETIME") AS
  select
  a.collectionid# as workloadid,
  a.collecttime as import_time,
  a.queryid# as queryid,
  a.application,
  a.cardinality,
  a.resultsize,
  a.qdate as lastuse,
  a.frequency,
  a.uname as owner,
  a.priority,
  a.sql_text as query,
  a.exec_time as responsetime
from SYSTEM.MVIEW$_ADV_WORKLOAD A, SYSTEM.MVIEW$_ADV_LOG B, ALL_USERS D
WHERE a.collectionid# = b.runid#
AND b.uname = d.username
AND d.user_id = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_FILTER" ("FILTERID",
"SUBFILTERNUM",
"SUBFILTERTYPE",
"STR_VALUE",
"NUM_VALUE1",
"NUM_VALUE2",
"DATE_VALUE1",
"DATE_VALUE2") AS
  select
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filter a, system.mview$_adv_log b, ALL_USERS u
   WHERE a.filterid# = b.runid#
   AND b.uname = u.username
   AND u.user_id = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_LOG" ("ID",
"FILTERID",
"RUN_BEGIN",
"RUN_END",
"TYPE",
"STATUS",
"MESSAGE",
"COMPLETED",
"TOTAL",
"ERROR_CODE") AS
  select
      m.runid# as id,
      m.filterid# as filterid,
      m.run_begin,
      m.run_end,
      decode(m.run_type,1,'EVALUATE',2,'EVALUATE_W',3,'RECOMMEND',
                      4,'RECOMMEND_W',5,'VALIDATE',6,'WORKLOAD',
                      7,'FILTER','UNKNOWN') AS type,
      decode(m.status,0,'UNUSED',1,'CANCELLED',2,'IN_PROGRESS',3,'COMPLETED',
                    4,'ERROR','UNKNOWN') AS status,
      m.message,
      m.completed,
      m.total,
      m.error_code
   from system.mview$_adv_log m, all_users u
   where m.uname = u.username
   and   u.user_id = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_FILTERINSTANCE" ("RUNID",
"FILTERID",
"SUBFILTERNUM",
"SUBFILTERTYPE",
"STR_VALUE",
"NUM_VALUE1",
"NUM_VALUE2",
"DATE_VALUE1",
"DATE_VALUE2") AS
  select
      a.runid# as runid,
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filterinstance a;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_RECOMMENDATIONS" ("RUNID",
"ALL_TABLES",
"FACT_TABLES",
"GROUPING_LEVELS",
"QUERY_TEXT",
"RECOMMENDATION_NUMBER",
"RECOMMENDED_ACTION",
"MVIEW_OWNER",
"MVIEW_NAME",
"STORAGE_IN_BYTES",
"PCT_PERFORMANCE_GAIN",
"BENEFIT_TO_COST_RATIO") AS
  select
  t1.runid# as runid,
  t1.from_clause as all_tables,
  fact_tables,
  grouping_levels,
  query_text,
  rank# as recommendation_number,
  action_type as recommended_action,
  summary_owner as mview_owner,
  summary_name as mview_name,
  storage_in_bytes,
  pct_performance_gain,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 0
order by t1.rank#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_EVALUATIONS" ("RUNID",
"MVIEW_OWNER",
"MVIEW_NAME",
"RANK",
"STORAGE_IN_BYTES",
"FREQUENCY",
"CUMULATIVE_BENEFIT",
"BENEFIT_TO_COST_RATIO") AS
  select
  t1.runid# as runid,
  summary_owner AS mview_owner,
  summary_name AS mview_name,
  rank# as rank,
  storage_in_bytes,
  frequency,
  cumulative_benefit,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 1
order by t1.rank#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_EXCEPTIONS" ("RUNID",
"OWNER",
"TABLE_NAME",
"DIMENSION_NAME",
"RELATIONSHIP",
"BAD_ROWID") AS
  select
  t1.runid# as runid,
  owner,
  table_name,
  dimension_name,
  relationship,
  bad_rowid
from SYSTEM.MVIEW$_ADV_EXCEPTIONS t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."SCHEDULER_PROGRAM_ARGS" ("OWNER",
"PROGRAM_NAME",
"ARGUMENT_NAME",
"ARGUMENT_POSITION",
"ARGUMENT_TYPE",
"METADATA_ATTRIBUTE",
"DEFAULT_VALUE",
"DEFAULT_ANYDATA_VALUE",
"OUT_ARGUMENT") AS
  SELECT "OWNER",
"PROGRAM_NAME",
"ARGUMENT_NAME",
"ARGUMENT_POSITION",
"ARGUMENT_TYPE",
"METADATA_ATTRIBUTE",
"DEFAULT_VALUE",
"DEFAULT_ANYDATA_VALUE",
"OUT_ARGUMENT" FROM sys.all_scheduler_program_args;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."SCHEDULER_JOB_ARGS" ("OWNER",
"JOB_NAME",
"ARGUMENT_NAME",
"ARGUMENT_POSITION",
"ARGUMENT_TYPE",
"VALUE",
"ANYDATA_VALUE",
"OUT_ARGUMENT") AS
  SELECT "OWNER",
"JOB_NAME",
"ARGUMENT_NAME",
"ARGUMENT_POSITION",
"ARGUMENT_TYPE",
"VALUE",
"ANYDATA_VALUE",
"OUT_ARGUMENT" FROM sys.all_scheduler_job_args;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."AQ$DEF$_AQCALL" ("QUEUE",
"MSG_ID",
"CORR_ID",
"MSG_PRIORITY",
"MSG_STATE",
"DELAY",
"DELAY_TIMESTAMP",
"EXPIRATION",
"ENQ_TIME",
"ENQ_TIMESTAMP",
"ENQ_USER_ID",
"ENQ_TXN_ID",
"DEQ_TIME",
"DEQ_TIMESTAMP",
"DEQ_USER_ID",
"DEQ_TXN_ID",
"RETRY_COUNT",
"EXCEPTION_QUEUE_OWNER",
"EXCEPTION_QUEUE",
"USER_DATA",
"ORIGINAL_QUEUE_NAME",
"ORIGINAL_QUEUE_OWNER",
"EXPIRATION_REASON") AS
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp)
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp)
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema,
                                  1, exception_qschema,
                                  2, exception_qschema,
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue,
                                  1, exception_queue,
                                  2, exception_queue,
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3,
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL,
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3,
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL,
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3,
                     decode(deq_time, NULL,
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL)
                             EXPIRATION_REASON  FROM "DEF$_AQCALL" WHERE state != 7 AND   state != 9 WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."AQ$_DEF$_AQCALL_F" ("Q_NAME",
"ROW_ID",
"MSGID",
"CORRID",
"PRIORITY",
"STATE",
"DELAY",
"EXPIRATION",
"ENQ_TIME",
"ENQ_UID",
"ENQ_TID",
"DEQ_TIME",
"DEQ_UID",
"DEQ_TID",
"RETRY_COUNT",
"EXCEPTION_QSCHEMA",
"EXCEPTION_QUEUE",
"CSCN",
"DSCN",
"CHAIN_NO",
"LOCAL_ORDER_NO",
"TIME_MANAGER_INFO",
"STEP_NO",
"USER_DATA",
"QUEUE_ID") AS
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQCALL" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."AQ$DEF$_AQERROR" ("QUEUE",
"MSG_ID",
"CORR_ID",
"MSG_PRIORITY",
"MSG_STATE",
"DELAY",
"DELAY_TIMESTAMP",
"EXPIRATION",
"ENQ_TIME",
"ENQ_TIMESTAMP",
"ENQ_USER_ID",
"ENQ_TXN_ID",
"DEQ_TIME",
"DEQ_TIMESTAMP",
"DEQ_USER_ID",
"DEQ_TXN_ID",
"RETRY_COUNT",
"EXCEPTION_QUEUE_OWNER",
"EXCEPTION_QUEUE",
"USER_DATA",
"ORIGINAL_QUEUE_NAME",
"ORIGINAL_QUEUE_OWNER",
"EXPIRATION_REASON") AS
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp)
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp)
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema,
                                  1, exception_qschema,
                                  2, exception_qschema,
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue,
                                  1, exception_queue,
                                  2, exception_queue,
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3,
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL,
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3,
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL,
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3,
                     decode(deq_time, NULL,
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL)
                             EXPIRATION_REASON  FROM "DEF$_AQERROR" WHERE state != 7 AND   state != 9 WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."AQ$_DEF$_AQERROR_F" ("Q_NAME",
"ROW_ID",
"MSGID",
"CORRID",
"PRIORITY",
"STATE",
"DELAY",
"EXPIRATION",
"ENQ_TIME",
"ENQ_UID",
"ENQ_TID",
"DEQ_TIME",
"DEQ_UID",
"DEQ_TID",
"RETRY_COUNT",
"EXCEPTION_QSCHEMA",
"EXCEPTION_QUEUE",
"CSCN",
"DSCN",
"CHAIN_NO",
"LOCAL_ORDER_NO",
"TIME_MANAGER_INFO",
"STEP_NO",
"USER_DATA",
"QUEUE_ID") AS
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQERROR" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."PRODUCT_PRIVS" ("PRODUCT",
"USERID",
"ATTRIBUTE",
"SCOPE",
"NUMERIC_VALUE",
"CHAR_VALUE",
"DATE_VALUE",
"LONG_VALUE") AS
  SELECT PRODUCT, USERID, ATTRIBUTE, SCOPE,
         NUMERIC_VALUE, CHAR_VALUE, DATE_VALUE, LONG_VALUE
  FROM SQLPLUS_PRODUCT_PROFILE
  WHERE USERID = 'PUBLIC' OR USER LIKE USERID;

