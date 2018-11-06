-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."AQ$WM$EVENT_QUEUE_TABLE_S" ("QUEUE",
"NAME",
"ADDRESS",
"PROTOCOL",
"TRANSFORMATION",
"QUEUE_TO_QUEUE") AS
  SELECT queue_name QUEUE, name NAME , address ADDRESS , protocol PROTOCOL, trans_name TRANSFORMATION, decode(bitand(SUBSCRIBER_TYPE, 512), 512, 'TRUE', 'FALSE') QUEUE_TO_QUEUE  FROM "AQ$_WM$EVENT_QUEUE_TABLE_S" s  WHERE (bitand(s.subscriber_type, 1) = 1)  WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."AQ$WM$EVENT_QUEUE_TABLE" ("QUEUE",
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
"PROPAGATED_MSGID",
"SENDER_NAME",
"SENDER_ADDRESS",
"SENDER_PROTOCOL",
"ORIGINAL_MSGID",
"ORIGINAL_QUEUE_NAME",
"ORIGINAL_QUEUE_OWNER",
"EXPIRATION_REASON",
"CONSUMER_NAME",
"ADDRESS",
"PROTOCOL") AS
  SELECT  q_name QUEUE, qt.msgid MSG_ID, corrid CORR_ID,  priority MSG_PRIORITY,  decode(bitand(s.subscriber_type,2) , 2,'UNDELIVERABLE',
                                             decode(h.dequeue_time, NULL,decode(l.dequeue_time, NULL, decode(state, 0,   'READY',	
                              		                                          1,   'WAIT',	
                                                                                  2,   'PROCESSED',	
                                                                                  3,   'EXPIRED',
                                                                                  8,   'DEFERRED',
                                                                                 10,  'BUFFERED_EXPIRED'),(decode(l.transaction_id, NULL, 'UNDELIVERABLE', 'PROCESSED'))), (decode(h.transaction_id, NULL, 'UNDELIVERABLE', 'PROCESSED')))
                          )                         MSG_STATE,  cast(FROM_TZ(qt.delay, '00:00')
                 at time zone sessiontimezone as date) delay,  cast(FROM_TZ(qt.delay, '00:00')
                 at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration,  cast(FROM_TZ(qt.enq_time, '00:00')
                 at time zone sessiontimezone as date) enq_time,  cast(FROM_TZ(qt.enq_time, '00:00')
                 at time zone sessiontimezone as timestamp)
                 enq_timestamp,   enq_uid ENQ_USER_ID,  qt.enq_tid ENQ_TXN_ID,  decode(h.transaction_id, NULL,
                 decode(l.transaction_id, NULL, TO_DATE(NULL), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, '00:00')
                 at time zone sessiontimezone as date)) DEQ_TIME,  decode(h.transaction_id, NULL,
            decode(l.transaction_id, NULL, TO_TIMESTAMP(NULL), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, '00:00')
                 at time zone sessiontimezone as timestamp))
                 DEQ_TIMESTAMP,  decode(h.dequeue_user, NULL, l.dequeue_user, h.dequeue_user)
	         DEQ_USER_ID,  decode(h.transaction_id, NULL, l.transaction_id,
                 h.transaction_id) DEQ_TXN_ID,  h.retry_count retry_count,  decode (state, 0, exception_qschema,
                                1, exception_qschema,
                                2, exception_qschema,
                                NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue,
                                1, exception_queue,
                                2, exception_queue,
                                NULL) EXCEPTION_QUEUE,  user_data,  h.propagated_msgid PROPAGATED_MSGID,  sender_name  SENDER_NAME, sender_address  SENDER_ADDRESS, sender_protocol  SENDER_PROTOCOL, dequeue_msgid ORIGINAL_MSGID,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_queue, NULL),
                   decode (l.transaction_id, NULL, NULL, exception_queue)),
                   decode (h.transaction_id, NULL, NULL, exception_queue))
                                ORIGINAL_QUEUE_NAME,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_qschema, NULL),
                   decode (l.transaction_id, NULL, NULL, exception_qschema)),
                   decode (h.transaction_id, NULL, NULL, exception_qschema))
                                ORIGINAL_QUEUE_OWNER,  decode(bitand(s.subscriber_type, 2), 2,
                                         'Messages to be cleaned up later',
                        decode(h.dequeue_time, NULL,
                               decode(state, 3,
                                           decode(h.transaction_id, NULL,
                                           decode (expiration , NULL ,
                                                   'MAX_RETRY_EXCEEDED',
                                                   'TIME_EXPIRATION'),
                                                   'INVALID_TRANSACTION', NULL,
                                                   'MAX_RETRY_EXCEEDED'), NULL),
                                           decode(h.transaction_id, NULL,
                                                 'PROPAGATION_FAILURE', NULL)))
                 EXPIRATION_REASON,  decode(h.subscriber#, 0, decode(h.name, '0', NULL,
							        h.name),
					  s.name) CONSUMER_NAME,  s.address ADDRESS,  s.protocol PROTOCOL  FROM "WM$EVENT_QUEUE_TABLE" qt, "AQ$_WM$EVENT_QUEUE_TABLE_H" h LEFT OUTER JOIN  (SELECT fv.MSGID MSGID, fv.SUBSCRIBER# SUBSCRIBER#, fv.NAME NAME, 0 ADDRESS#, fv.DEQUEUE_TIME DEQUEUE_TIME,fv.TRANSACTION_ID TRANSACTION_ID, fv.DEQUEUE_USER DEQUEUE_USER, fv.FLAGS FLAGS FROM AQ$_UNFLUSHED_DEQUEUES fv WHERE fv.QTOBJNO = 19927 union select dl.MSGID MSGID, dl.SUBSCRIBER# SUBSCRIBER#, dl.NAME NAME, dl.ADDRESS# ADDRESS#, dl.DEQUEUE_TIME DEQUEUE_TIME, dl.TRANSACTION_ID TRANSACTION_ID, dl.DEQUEUE_USER DEQUEUE_USER, dl.FLAGS FLAGS from "WMSYS"."AQ$_WM$EVENT_QUEUE_TABLE_L" dl )  l  ON h.msgid = l.msgid AND h.subscriber# = l.subscriber# AND h.name = l.name AND h.address# = l.address#, "AQ$_WM$EVENT_QUEUE_TABLE_S" s  WHERE  qt.msgid = h.msgid AND  ((h.subscriber# != 0 AND h.subscriber# = s.subscriber_id)  OR (h.subscriber# = 0 AND h.address# = s.subscriber_id)) AND (qt.state != 7 OR   qt.state != 9 )     WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."AQ$_WM$EVENT_QUEUE_TABLE_F" ("Q_NAME",
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
"SENDER_NAME",
"SENDER_ADDRESS",
"SENDER_PROTOCOL",
"DEQUEUE_MSGID",
"DELIVERY_MODE",
"SEQUENCE_NUM",
"MSG_NUM",
"QUEUE_ID",
"USER_PROP",
"SUBSCRIBER_ID",
"SUBSCRIBER_NAME",
"QUEUE_EVTID") AS
  SELECT  /*+ NO_MERGE (qo) USE_NL(iot) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA, qt.sender_name SENDER_NAME, qt.sender_address SENDER_ADDRESS, qt.sender_protocol SENDER_PROTOCOL, qt.dequeue_msgid DEQUEUE_MSGID, 'PERSISTENT' DELIVERY_MODE, 0 SEQUENCE_NUM, 0 MSG_NUM, qo.qid QUEUE_ID, qt.user_prop USER_PROP, iot.subscriber# SUBSCRIBER_ID, iot.name SUBSCRIBER_NAME, iot.queue# QUEUE_EVTID FROM "WM$EVENT_QUEUE_TABLE" qt, "AQ$_WM$EVENT_QUEUE_TABLE_I" iot, SYS.ALL_INT_DEQUEUE_QUEUES qo WHERE qt.msgid=iot.msgid  and qt.q_name = qo.name  AND qo.owner = 'WMSYS' AND iot.msg_enq_time = qt.enq_time AND  iot.msg_step_no = qt.step_no AND iot.msg_local_order_no = qt.local_order_no AND   iot.msg_chain_no = qt.chain_no  WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."AQ$WM$EVENT_QUEUE_TABLE_R" ("QUEUE",
"NAME",
"ADDRESS",
"PROTOCOL",
"RULE",
"RULE_SET",
"TRANSFORMATION") AS
  SELECT queue_name QUEUE, s.name NAME , address ADDRESS , protocol PROTOCOL, rule_condition RULE, ruleset_name RULE_SET, trans_name TRANSFORMATION  FROM "AQ$_WM$EVENT_QUEUE_TABLE_S" s , sys.all_rules r WHERE (bitand(s.subscriber_type, 1) = 1) AND s.rule_name = r.rule_name and r.rule_owner = 'WMSYS'  WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$WORKSPACES_TABLE" ("WORKSPACE",
"CURRENT_VERSION",
"PARENT_VERSION",
"POST_VERSION",
"VERLIST",
"OWNER",
"CREATETIME",
"DESCRIPTION",
"WORKSPACE_LOCK_ID",
"FREEZE_STATUS",
"FREEZE_MODE",
"FREEZE_WRITER",
"OPER_STATUS",
"WM_LOCKMODE",
"ISREFRESHED",
"FREEZE_OWNER",
"SESSION_DURATION",
"IMPLICIT_SP_CNT",
"CR_STATUS",
"SYNC_PARVER",
"LAST_CHANGE",
"DEPTH",
"MP_ROOT",
"PARENT_WORKSPACE#",
"PARENT_WORKSPACE",
"PARENT_CURRENT_VERSION") AS
  select wt1.workspace,
       wt1.current_version,
       wt1.parent_version,
       wt1.post_version,
       null verlist,
       wt1.owner,
       wt1.createtime,
       wt1.description,
       wt1.workspace_lock_id,
       decode(bitand(wt1.wm$flag, 1), 0, 'UNLOCKED', 1, 'LOCKED') freeze_status,
       decode(bitand(wt1.wm$flag, 14), 0, null, 2, '1WRITER', 4, '1WRITER_SESSION', 6, 'NO_ACCESS', 8, 'READ_ONLY', 10,'WM_ONLY') freeze_mode,
       wt1.freeze_writer,
       null oper_status,
       decode(bitand(wt1.wm$flag, 112), 0, null, 16, 'S', 32, 'E', 48, 'WE', 64, 'VE', 80, 'C', 96, 'D') ||
         decode(bitand(wt1.wm$flag, 496),  0, null, ',') ||
         decode(bitand(wt1.wm$flag, 384), 0, null, 128, 'Y', 256, 'N') wm_lockmode,
       decode(bitand(wt1.wm$flag, 512), 0, 0, 1) isRefreshed,
       wt1.freeze_owner,
       decode(bitand(wt1.wm$flag, 1024), 0, 0, 1) session_duration,
       (select nvl(max(to_number(substr(st.savepoint, 5))), 0)
        from wmsys.wm$workspace_savepoints_table$ st
        where st.workspace# = wt1.workspace_lock_id and st.savepoint like 'ICP-%') implicit_sp_cnt,
       decode(bitand(wt1.wm$flag, 6144), 0, 'CRS_ALLCR', 2048, 'CRS_ALLNONCR', 4096, 'CRS_LEAF', 6144, 'CRS_MIXED') cr_status,
       wt1.sync_parver,
       wt1.last_change,
       wt1.depth,
       wt1.mp_root,
       wt2.workspace_lock_id parent_workspace#,
       wt2.workspace parent_workspace,
       wt2.current_version parent_current_version
from wmsys.wm$workspaces_table$ wt1, wmsys.wm$workspaces_table$ wt2
where wt1.parent_workspace# = wt2.workspace_lock_id(+) ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$VERSIONED_TABLES$D" ("VTID",
"TABLE_NAME",
"OWNER",
"DISABLING_VER",
"BL_VERSION",
"BL_SAVEPOINT",
"BL_CHECK_FOR_DUPLICATES",
"BL_SINGLE_TRANSACTION",
"VALIDTIME") AS
  select vt.vtid# vtid,
       vt.table_name,
       vt.owner,
       decode(bitand(vt.wm$flag, 31), 0, 'UNDEFINED', 1, 'VERSIONED', 2, 'HIDDEN', 3, 'EV', 4, 'LWEV', 5, 'DV', 6, 'LWDV', 7, 'LW_DISABLED', 8, 'DDL',
                                      9, 'BDDL', 10, 'CDDL', 11, 'ODDL', 12, 'TDDL', 13, 'AVTDDL', 14, 'BL_F_BEGIN', 15, 'BL_P_BEGIN', 16, 'BL_P_END',
                                     17, 'BL_R_BEGIN', 18, 'ADD_VT', 19, 'SYNCVTV1', 20, 'SYNCVTV2', 21, 'RB_IND', 22, 'RN_CONS', 23, 'RN_IND',
                                     24, 'D_HIST_COLS', 25, 'U_HIST_COLS') disabling_ver,
       vt.bl_version,
       decode(bitand(vt.wm$flag,1536), 0, null, 512, 'ROOT_VERSION', 1024, 'LATEST') bl_savepoint,
       decode(bitand(vt.wm$flag,6144), 0, null, 2048, 'NO', 4096, 'YES') bl_check_for_duplicates,
       decode(bitand(vt.wm$flag,24576), 0, null, 8192, 'NO', 16384, 'YES') bl_single_transaction,
       decode(bitand(vt.wm$flag, 256), 0, 0, 256, 1) validtime
from wmsys.wm$versioned_tables$ vt ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$VERSIONED_TABLES$H" ("VTID",
"TABLE_NAME",
"OWNER",
"NOTIFICATION",
"NOTIFYWORKSPACES",
"DISABLING_VER",
"RICWEIGHT",
"ISFASTLIVE",
"ISWORKFLOW",
"HIST",
"PKEY_COLS",
"UNDO_CODE",
"SITESLIST",
"REPSITECOUNT",
"BL_WORKSPACE",
"BL_VERSION",
"BL_SAVEPOINT",
"BL_CHECK_FOR_DUPLICATES",
"BL_SINGLE_TRANSACTION",
"VALIDTIME") AS
  select vt.vtid# vtid,
       vt.table_name,
       vt.owner,
       0 notification,
       null notifyworkspaces,
       decode(bitand(vt.wm$flag, 31), 0, 'UNDEFINED', 1, 'VERSIONED', 2, 'HIDDEN', 3, 'EV', 4, 'LWEV', 5, 'DV', 6, 'LWDV', 7, 'LW_DISABLED', 8, 'DDL',
                                      9, 'BDDL', 10, 'CDDL', 11, 'ODDL', 12, 'TDDL', 13, 'AVTDDL', 14, 'BL_F_BEGIN', 15, 'BL_P_BEGIN', 16, 'BL_P_END',
                                     17, 'BL_R_BEGIN', 18, 'ADD_VT', 19, 'SYNCVTV1', 20, 'SYNCVTV2', 21, 'RB_IND', 22, 'RN_CONS', 23, 'RN_IND',
                                     24, 'D_HIST_COLS', 25, 'U_HIST_COLS') disabling_ver,
       vt.ricweight,
       0 isfastlive,
       0 isworkflow,
       decode(bitand(vt.wm$flag, 224), 0, 'NONE', 32, 'VIEW_W_OVERWRITE', 64, 'VIEW_W_OVERWRITE_PERF',
                                      96, 'VIEW_WO_OVERWRITE', 128, 'VIEW_WO_OVERWRITE_PERF') hist,
       vt.pkey_cols,
       vt.undo_code,
       vt.siteslist,
       vt.repsitecount,
       null bl_workspace,
       vt.bl_version,
       decode(bitand(vt.wm$flag,1536), 0, null, 512, 'ROOT_VERSION', 1024, 'LATEST') bl_savepoint,
       decode(bitand(vt.wm$flag,6144), 0, null, 2048, 'NO', 4096, 'YES') bl_check_for_duplicates,
       decode(bitand(vt.wm$flag,24576), 0, null, 8192, 'NO', 16384, 'YES') bl_single_transaction,
       decode(bitand(vt.wm$flag, 256), 0, 0, 256, 1) validtime
from wmsys.wm$versioned_tables$ vt ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$VERSIONED_TABLES" ("VTID",
"TABLE_NAME",
"OWNER",
"NOTIFICATION",
"NOTIFYWORKSPACES",
"DISABLING_VER",
"RICWEIGHT",
"ISFASTLIVE",
"ISWORKFLOW",
"HIST",
"PKEY_COLS",
"UNDO_CODE",
"SITESLIST",
"REPSITECOUNT",
"BL_WORKSPACE",
"BL_VERSION",
"BL_SAVEPOINT",
"BL_CHECK_FOR_DUPLICATES",
"BL_SINGLE_TRANSACTION",
"VALIDTIME") AS
  select vtid, table_name, owner, notification, notifyworkspaces, disabling_ver, ricweight, isfastlive, isworkflow,
       hist, pkey_cols, undo_code, siteslist, repsitecount, bl_workspace, bl_version, bl_savepoint,
       bl_check_for_duplicates, bl_single_transaction, validtime
from wmsys.wm$versioned_tables$h
where disabling_ver<>'HIDDEN' ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$BATCH_COMPRESSIBLE_TABLES" ("WORKSPACE",
"TABLE_NAME",
"BEGIN_VERSION",
"END_VERSION",
"WHERE_CLAUSE") AS
  select wt.workspace,
       vt.owner || '.' || vt.table_name table_name,
       bct.begin_version,
       bct.end_version,
       bct.where_clause
from wmsys.wm$batch_compressible_tables$ bct, wmsys.wm$workspaces_table$ wt, wmsys.wm$versioned_tables$ vt
where bct.workspace# = wt.workspace_lock_id and
      bct.vtid# = vt.vtid# ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CONS_COLUMNS" ("OWNER",
"CONSTRAINT_NAME",
"TABLE_NAME",
"COLUMN_NAME",
"POSITION") AS
  select vt.owner, cc.constraint_name, vt.table_name, cc.column_name, cc.position
from wmsys.wm$cons_columns$ cc, wmsys.wm$versioned_tables$ vt
where cc.vtid# = vt.vtid# ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CONSTRAINTS_TABLE" ("OWNER",
"CONSTRAINT_NAME",
"CONSTRAINT_TYPE",
"TABLE_NAME",
"SEARCH_CONDITION",
"STATUS",
"INDEX_OWNER",
"INDEX_NAME",
"INDEX_TYPE",
"ALIASEDCOLUMNS",
"NUMINDEXCOLS") AS
  select vt.owner,
       ct.constraint_name,
       decode(bitand(ct.wm$flag, 7), 0, 'P', 1, 'PN', 2, 'PU', 3, 'U', 4, 'UI', 5, 'UN', 6, 'UU', 7, 'C') constraint_type,
       vt.table_name,
       ct.search_condition,
       decode(bitand(ct.wm$flag, 8), 0, 'DISABLED', 8, 'ENABLED') status,
       ct.index_owner,
       ct.index_name,
       decode(bitand(ct.wm$flag, 112), 0, null, 16, 'NORMAL', 32, 'BITMAP', 48, 'FUNCTION-BASED NORMAL',
                                       64, 'FUNCTION-BASED NORMAL DESC', 80, 'FUNCTION-BASED BITMAP', 96, 'DOMAIN') index_type,
       ct.aliasedcolumns,
       ct.numindexcols
from wmsys.wm$constraints_table$ ct, wmsys.wm$versioned_tables$ vt
where ct.vtid# = vt.vtid# ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$ENV_VARS" ("NAME",
"VALUE",
"HIDDEN") AS
  select ev.name,
       ev.value,
       decode(bitand(ev.wm$flag, 1), 0, 0, 1, 1) hidden
from wmsys.wm$env_vars$ ev ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$EVENTS_INFO" ("EVENT_NAME",
"CAPTURE") AS
  select ei.event_name, decode(bitand(ei.wm$flag, 1), 0, 'OFF', 1, 'ON') capture
from wmsys.wm$events_info$ ei ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$HASH_TABLE" ("HASH") AS
  select hash
from wmsys.wm$hash_table$ ht ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$HINT_TABLE" ("HINT_ID",
"OWNER",
"TABLE_NAME",
"HINT_TEXT",
"ISDEFAULT") AS
  select ht.hint_id, vt.owner, vt.table_name, ht.hint_text, decode(bitand(ht.wm$flag, 1), 0, 0, 1, 1) isdefault
from wmsys.wm$hint_table$ ht, wmsys.wm$versioned_tables$ vt
where ht.vtid# = vt.vtid#(+) ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$INSTEADOF_TRIGS_TABLE" ("TABLE_OWNER",
"TABLE_NAME",
"INSERT_TRIGGER_NAME",
"UPDATE_TRIGGER_NAME",
"DELETE_TRIGGER_NAME") AS
  select vt.owner table_owner, vt.table_name,
       'WMSYS.WM$' || vt.vtid || '$INSERT$' insert_trigger_name,
       'WMSYS.WM$' || vt.vtid || '$UPDATE$' update_trigger_name,
       'WMSYS.WM$' || vt.vtid || '$DELETE$' delete_trigger_name
from wmsys.wm$versioned_tables vt ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$LOCKROWS_INFO" ("WORKSPACE",
"OWNER",
"TABLE_NAME",
"WHERE_CLAUSE") AS
  select wt.workspace, vt.owner, vt.table_name, li.where_clause
from wmsys.wm$lockrows_info$ li, wmsys.wm$workspaces_table$ wt, wmsys.wm$versioned_tables$ vt
where li.vtid# = vt.vtid# and
      li.workspace# = wt.workspace_lock_id ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$MODIFIED_TABLES" ("VTID",
"TABLE_NAME",
"VERSION",
"WORKSPACE") AS
  select mt.vtid# vtid, vt.owner || '.' || vt.table_name table_name, mt.version, wt.workspace
from wmsys.wm$modified_tables$ mt, wmsys.wm$versioned_tables$ vt, wmsys.wm$workspaces_table$ wt
where mt.vtid# = vt.vtid# and
      mt.workspace# = wt.workspace_lock_id ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$MP_GRAPH_WORKSPACES_TABLE" ("MP_LEAF_WORKSPACE",
"MP_GRAPH_WORKSPACE",
"ANC_VERSION",
"MP_GRAPH_FLAG") AS
  select wt1.workspace mp_leaf_workspace, wt2.workspace mp_graph_workspace, mgwt.anc_version,
       decode(bitand(mgwt.wm$flag, 3), 0, 'I', 1, 'L', 2, 'R') mp_graph_flag
from wmsys.wm$mp_graph_workspaces_table$ mgwt, wmsys.wm$workspaces_table$ wt1, wmsys.wm$workspaces_table$ wt2
where mgwt.mp_leaf_workspace# = wt1.workspace_lock_id and
      mgwt.mp_graph_workspace# = wt2.workspace_lock_id ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$MP_PARENT_WORKSPACES_TABLE" ("WORKSPACE",
"PARENT_WORKSPACE",
"PARENT_VERSION",
"CREATOR",
"CREATETIME",
"WORKSPACE_LOCK_ID",
"PARENT_WORKSPACE#",
"ISREFRESHED",
"PARENT_FLAG") AS
  select wt1.workspace,
       wt2.workspace parent_workspace,
       mpwt.parent_version,
       mpwt.creator,
       mpwt.createtime,
       mpwt.workspace# workspace_lock_id,
       mpwt.parent_workspace#,
       decode(bitand(mpwt.wm$flag, 1), 0, 0, 1, 1) isrefreshed,
       decode(bitand(mpwt.wm$flag, 2), 0, 'DP', 2, 'MP') parent_flag
from wmsys.wm$mp_parent_workspaces_table$ mpwt, wmsys.wm$workspaces_table$ wt1, wmsys.wm$workspaces_table$ wt2
where mpwt.workspace# = wt1.workspace_lock_id and
      mpwt.parent_workspace# = wt2.workspace_lock_id ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$MW_TABLE" ("WORKSPACE") AS
  select wt.workspace
from wmsys.wm$mw_table$ mt, wmsys.wm$workspaces_table$ wt
where mt.workspace# = wt.workspace_lock_id ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$NESTED_COLUMNS_TABLE" ("OWNER",
"TABLE_NAME",
"COLUMN_NAME",
"POSITION",
"TYPE_OWNER",
"TYPE_NAME",
"NT_OWNER",
"NT_NAME",
"NT_STORE") AS
  select vt.owner,
       vt.table_name,
       nct.column_name,
       nct.position,
       nct.type_owner,
       nct.type_name,
       nct.nt_owner,
       nct.nt_name,
       nct.nt_store
from wmsys.wm$nested_columns_table$ nct, wmsys.wm$versioned_tables$ vt
where nct.vtid# = vt.vtid# ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$NEXTVER_TABLE" ("VERSION",
"NEXT_VERS",
"WORKSPACE",
"SPLIT") AS
  select nt.version, nt.next_vers, wt.workspace, nt.split
from wmsys.wm$nextver_table$ nt, wmsys.wm$workspaces_table$ wt
where nt.workspace# = wt.workspace_lock_id ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$REMOVED_WORKSPACES_TABLE" ("OWNER",
"WORKSPACE_NAME",
"WORKSPACE_ID",
"PARENT_WORKSPACE_NAME",
"PARENT_WORKSPACE_ID",
"CREATETIME",
"RETIRETIME",
"DESCRIPTION",
"MP_ROOT_ID",
"ISREFRESHED") AS
  select rwt1.owner,
       rwt1.workspace_name,
       rwt1.workspace_id,
       rwt2.workspace_name parent_workspace_name,
       rwt2.workspace_id parent_workspace_id,
       rwt1.createtime,
       rwt1.retiretime,
       rwt1.description,
       rwt1.mp_root_id,
       decode(bitand(rwt1.wm$flag, 1), 0, 0, 1, 1) isrefreshed
from wmsys.wm$removed_workspaces_table$ rwt1,
     (select workspace_name, workspace_id
      from wmsys.wm$removed_workspaces_table$
     union
      select workspace, workspace_lock_id
      from wmsys.wm$workspaces_table$) rwt2
where rwt1.parent_workspace_id = rwt2.workspace_id(+) ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$REPLICATION_DETAILS_TABLE" ("NAME",
"VALUE") AS
  select rdt.name, rdt.value
from wmsys.wm$replication_details_table$ rdt ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$REPLICATION_TABLE" ("GROUPNAME",
"MASTERDEFSITE",
"ISWRITERSITE",
"STATUS") AS
  select cast(substr(value, 1, p1-1) as varchar2(128)) groupname,
       cast(substr(value, p1+1, p2-p1-1) as varchar2(128)) masterdefsite,
       cast(substr(value, p2+1) as varchar2(1)) iswritersite,
       cast('E' as varchar2(1)) status
from (select value, instr(value, '|', 1) p1, instr(value, '|', -1) p2
      from wmsys.wm$env_vars
      where name = 'REPLICATION_DETAILS') ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$RESOLVE_WORKSPACES_TABLE" ("WORKSPACE",
"RESOLVE_USER",
"UNDO_SP_VER",
"OLDFREEZEMODE",
"OLDFREEZEWRITER") AS
  select wt.workspace, rwt.resolve_user, rwt.undo_sp# undo_sp_ver,
       decode(bitand(rwt.wm$flag, 7), 0, null, 1, '1WRITER', 2, '1WRITER_SESSION', 3, 'NO_ACCESS', 4, 'READ_ONLY', 5, 'WM_ONLY') oldfreezemode,
       rwt.oldfreezewriter
from wmsys.wm$resolve_workspaces_table$ rwt, wmsys.wm$workspaces_table$ wt
where rwt.workspace# = wt.workspace_lock_id ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$RIC_LOCKING_TABLE" ("PT_OWNER",
"PT_NAME",
"SLOCKNO",
"ELOCKNO") AS
  select vt.owner pt_owner, vt.table_name pt_name, rlt.slockno, rlt.elockno
from wmsys.wm$ric_locking_table$ rlt, wmsys.wm$versioned_tables$ vt
where rlt.pt_vtid# = vt.vtid# ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$RIC_TABLE" ("CT_OWNER",
"CT_NAME",
"PT_OWNER",
"PT_NAME",
"RIC_NAME",
"CT_COLS",
"PT_COLS",
"PT_UNIQUE_CONST_NAME",
"MY_MODE",
"STATUS") AS
  select vt1.owner ct_owner,
       vt1.table_name ct_name,
       vt2.owner pt_owner,
       vt2.table_name pt_name,
       rt.ric_name,
       rt.ct_cols,
       rt.pt_cols,
       rt.pt_unique_const_name,
       decode(bitand(rt.wm$flag, 3), 0, 'C', 1, 'N', 2, 'R') my_mode,
       decode(bitand(rt.wm$flag, 4), 0, 'DISABLED', 4, 'ENABLED') status
from wmsys.wm$ric_table$ rt, wmsys.wm$versioned_tables$ vt1, wmsys.wm$versioned_tables$ vt2
where rt.ct_vtid# = vt1.vtid# and
      rt.pt_vtid# = vt2.vtid# ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$RIC_TRIGGERS_TABLE" ("PT_OWNER",
"PT_NAME",
"CT_OWNER",
"CT_NAME",
"UPDATE_TRIGGER_NAME",
"DELETE_TRIGGER_NAME") AS
  select vt2.owner pt_owner, vt2.table_name pt_name, vt1.owner ct_owner, vt1.table_name ct_name,
       'WMSYS.WM$' || vt1.vtid# || '$LT_AU_' || rtt.trig# update_trigger_name,
       'WMSYS.WM$' || vt1.vtid# || '$LT_AD_' || rtt.trig# delete_trigger_name
from wmsys.wm$ric_triggers_table$ rtt, wmsys.wm$versioned_tables$ vt1, wmsys.wm$versioned_tables$ vt2
where rtt.ct_vtid# = vt1.vtid# and
      rtt.pt_vtid# = vt2.vtid# ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$SYSPARAM_ALL_VALUES" ("NAME",
"VALUE",
"ISDEFAULT",
"HIDDEN") AS
  select sav.name, sav.value, decode(bitand(sav.wm$flag, 1), 0, 'NO', 1, 'YES') isdefault, decode(bitand(sav.wm$flag, 2), 0, 0, 2, 1) hidden
from wmsys.wm$sysparam_all_values$ sav ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$UDTRIG_DISPATCH_PROCS" ("TABLE_OWNER_NAME",
"TABLE_NAME",
"DISPATCHER_NAME",
"TRIG_FLAG") AS
  select vt.owner table_owner_name,
       vt.table_name,
       'WMSYS.WM$DSP_UDT_' || udp.proc# dispatcher_name,
       udp.wm$flag trig_flag
from wmsys.wm$udtrig_dispatch_procs$ udp, wmsys.wm$versioned_tables$ vt
where udp.vtid# = vt.vtid# ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$UDTRIG_INFO" ("TRIG_OWNER_NAME",
"TRIG_NAME",
"TABLE_OWNER_NAME",
"TABLE_NAME",
"TRIG_FLAG",
"STATUS",
"TRIG_PROCEDURE",
"WHEN_CLAUSE",
"DESCRIPTION",
"TRIG_CODE",
"INTERNAL_TYPE",
"EVENT_FLAG") AS
  select ui.trig_owner_name,
       ui.trig_name,
       vt.owner table_owner_name,
       vt.table_name,
       decode(bitand(ui.wm$flag, 1), 0, 0, 1, 1) +
       decode(bitand(ui.wm$flag, 2), 0, 0, 2, 2) +
       decode(bitand(ui.wm$flag, 4), 0, 0, 4, 4) +
       decode(bitand(ui.wm$flag, 8), 0, 0, 8, 8) +
       decode(bitand(ui.wm$flag, 16), 0, 0, 16, 16) +
       decode(bitand(ui.wm$flag, 32), 0, 0, 32, 32) +
       decode(bitand(ui.wm$flag, 64), 0, 0, 64, 64) +
       decode(bitand(ui.wm$flag, 128), 0, 0, 128, 128) +
       decode(bitand(ui.wm$flag, 256), 0, 0, 256, 256) +
       decode(bitand(ui.wm$flag, 512), 0, 0, 512, 512) +
       decode(bitand(ui.wm$flag, 1024), 0, 0, 1024, 1024) +
       decode(bitand(ui.wm$flag, 2048), 0, 0, 2048, 2048) +
       decode(bitand(ui.wm$flag, 4096), 0, 0, 4096, 4096) trig_flag,
       decode(bitand(ui.wm$flag, 8192), 0, 'DISABLED', 8192, 'ENABLED') status,
       decode(proc#, null, null,
              decode(bitand(ui.wm$flag, 16384), 0, ui.trig_owner_name || '.WM$PROC_UDT_' || proc#, 16384, 'WMSYS.WM$PROC_RIC_' || proc#)) trig_procedure,
       ui.when_clause,
       ui.description,
       ui.trig_code,
       decode(bitand(ui.wm$flag, 16384), 0, 'USER_DEFINED', 16384, 'RIC_CHECK') internal_type,
       decode(bitand(ui.wm$flag, 32768), 0, 0, 32768, 32768) +
       decode(bitand(ui.wm$flag, 65536), 0, 0, 65536, 65536) +
       decode(bitand(ui.wm$flag, 131072), 0, 0, 131072, 131072) +
       decode(bitand(ui.wm$flag, 262144), 0, 0, 262144, 262144) +
       decode(bitand(ui.wm$flag, 524288), 0, 0, 524288, 524288) +
       decode(bitand(ui.wm$flag, 1048576), 0, 0, 1048576, 1048576) +
       decode(bitand(ui.wm$flag, 2097152), 0, 0, 2097152, 2097152) +
       decode(bitand(ui.wm$flag, 4194304), 0, 0, 4194304, 4194304) +
       decode(bitand(ui.wm$flag, 8388608), 0, 0, 8388608, 8388608) +
       decode(bitand(ui.wm$flag, 16777216), 0, 0, 16777216, 16777216) +
       decode(bitand(ui.wm$flag, 33554432), 0, 0, 33554432, 33554432) event_flag
from wmsys.wm$udtrig_info$ ui, wmsys.wm$versioned_tables$ vt
where ui.vtid# = vt.vtid# ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$VERSION_HIERARCHY_TABLE" ("VERSION",
"PARENT_VERSION",
"WORKSPACE",
"WM_LOCKMODE") AS
  select vht.version, vht.parent_version, wt.workspace,
       decode(bitand(wt.wm$flag, 112), 0, null, 16, 'S', 32, 'E', 48, 'WE', 64, 'VE', 80, 'C', 96, 'D') ||
         decode(bitand(wt.wm$flag, 496),  0, null, ',') ||
         decode(bitand(wt.wm$flag, 384), 0, null, 128, 'Y', 256, 'N') wm_lockmode
from wmsys.wm$version_hierarchy_table$ vht, wmsys.wm$workspaces_table$ wt
where vht.workspace# = wt.workspace_lock_id ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$VERSION_TABLE" ("WORKSPACE",
"ANC_WORKSPACE",
"ANC_VERSION",
"ANC_DEPTH",
"REFCOUNT") AS
  select wt1.workspace, wt2.workspace anc_workspace, vt.anc_version, vt.anc_depth, vt.refcount
from wmsys.wm$version_table$ vt, wmsys.wm$workspaces_table$ wt1, wmsys.wm$workspaces_table$ wt2
where vt.workspace# = wt1.workspace_lock_id and
      vt.anc_workspace# = wt2.workspace_lock_id ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$VT_ERRORS_TABLE" ("OWNER",
"TABLE_NAME",
"INDEX_TYPE",
"INDEX_FIELD",
"STATUS",
"ERROR_MSG") AS
  select vt.owner,
       vt.table_name,
       vet.index_type,
       vet.index_field,
       decode(bitand(vet.wm$flag, 31), 0,  'EV STEP BEING EXECUTED',
                                       1,  'EV STEP EXECUTED WITH ERRORS',
                                       2,  'DV STEP BEING EXECUTED',
                                       3,  'DV STEP EXECUTED WITH ERRORS',
                                       4,  'CDDL STEP BEING EXECUTED',
                                       5,  'CDDL STEP EXECUTED WITH ERRORS',
                                       6,  'UNDO EV STEP BEING EXECUTED',
                                       7,  'UNDO EV STEP EXECUTED WITH ERRORS',
                                       8,  'STATEMENT BEING EXECUTED',
                                       9,  'STATEMENT EXECUTED WITH ERRORS',
                                       10, 'ADD VALID TIME STEP BEING EXECUTED',
                                       11, 'ADD VALID TIME STEP EXECUTED WITH ERRORS',
                                       12, 'ALTERVERSIONEDTABLE DDL STEP BEING EXECUTED',
                                       13, 'ALTERVERSIONEDTABLE DDL STEP EXECUTED WITH ERRORS',
                                       14, 'REBUILD INDEX STEP BEING EXECUTED',
                                       15, 'REBUILD INDEX STEP EXECUTED WITH ERRORS',
                                       16, 'RENAME CONSTRAINT STEP BEING EXECUTED',
                                       17, 'RENAME CONSTRAINT STEP EXECUTED WITH ERRORS',
                                       18, 'RENAME INDEX STEP BEING EXECUTED',
                                       19, 'RENAME INDEX STEP EXECUTED WITH ERRORS',
                                       20, 'SYNCRONIZE VT VIEWS STEP BEING EXECUTED',
                                       21, 'SYNCRONIZE VT VIEWS STEP EXECUTED WITH ERRORS') status,
       vet.error_msg
from wmsys.wm$vt_errors_table$ vet, wmsys.wm$versioned_tables$ vt
where vet.vtid# = vt.vtid# ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$WORKSPACE_PRIV_TABLE" ("GRANTEE",
"WORKSPACE",
"GRANTOR",
"PRIV",
"ADMIN") AS
  select wpt.grantee,
       wt.workspace,
       wpt.grantor,
       decode(bitand(wpt.wm$flag, 31), 0, 'U',
                                       1, 'A', 2, 'M', 3, 'R', 4, 'D', 5, 'C', 6, 'F', 13, 'G',
                                       7, 'AA', 8, 'MA', 9, 'RA', 10, 'DA', 11, 'CA', 12, 'FA', 14, 'GA',
                                       15, 'W') priv,
       decode(bitand(wpt.wm$flag, 32), 0, 0, 32, 1) admin
from wmsys.wm$workspace_priv_table$ wpt, wmsys.wm$workspaces_table$ wt
where wpt.workspace# = wt.workspace_lock_id(+) ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$WORKSPACE_SAVEPOINTS_TABLE" ("WORKSPACE",
"SAVEPOINT",
"VERSION",
"POSITION",
"IS_IMPLICIT",
"OWNER",
"CREATETIME",
"DESCRIPTION") AS
  select wt.workspace,
       wst.savepoint,
       wst.version,
       (select count(*)+1
        from wmsys.wm$workspace_savepoints_table$ wst2
        where wst2.workspace# = wst.workspace# and
              (wst2.version < wst.version or (wst2.version = wst.version and wst2.createtime < wst.createtime))) position,
       decode(bitand(wst.wm$flag, 1), 0, 0, 1, 1) is_implicit,
       wst.owner,
       wst.createtime,
       wst.description
from wmsys.wm$workspace_savepoints_table$ wst, wmsys.wm$workspaces_table$ wt
where wst.workspace# = wt.workspace_lock_id ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$ALL_LOCKS_VIEW" ("OWNER",
"TABLE_NAME",
"LOCK_MODE",
"LOCK_OWNER",
"LOCKING_STATE") AS
  select vt.owner, vt.table_name,
       decode(wmsys.lt_ctx_pkg.getltlockinfo(translate(t.info USING CHAR_CS), 'ROW_LOCKMODE'),
              'E', 'EXCLUSIVE', 'S', 'SHARED', 'VE', 'VERSION EXCLUSIVE', 'WE','WORKSPACE EXCLUSIVE') lock_mode,
       wmsys.lt_ctx_pkg.getltlockinfo(translate(t.info USING CHAR_CS),'ROW_LOCKUSER') lock_owner,
       wmsys.lt_ctx_pkg.getltlockinfo(translate(t.info USING CHAR_CS),'ROW_LOCKSTATE') locking_state
from wmsys.wm$versioned_tables vt,
     table(wmsys.ltadm.get_lock_table(vt.owner, vt.table_name)) t
with READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$ALL_VERSION_HVIEW_WDEPTH" ("VERSION",
"PARENT_VERSION",
"WORKSPACE",
"WORKSPACE_ID",
"DEPTH") AS
  select vht.version, vht.parent_version, wt.workspace, vht.workspace# workspace_id, wt.depth
from wmsys.wm$version_hierarchy_table$ vht, wmsys.wm$workspaces_table$ wt
where vht.workspace# = wt.workspace_lock_id
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$ANC_VERSION_VIEW" ("VERSION",
"PARENT_VERS",
"WORKSPACE") AS
  select vht1.version, vht2.version parent_vers, vht1.workspace
from wmsys.wm$version_hierarchy_table vht1, wmsys.wm$version_hierarchy_table vht2, wmsys.wm$version_table vt
where vht1.workspace = vt.workspace and
      vht2.workspace = vt.anc_workspace and
      vht2.version  <= vt.anc_version
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$BASE_VERSION_VIEW" ("VERSION",
"WORKSPACE#") AS
  select decode(sign(vt1.anc_version - vt2.anc_version), 1, vt2.anc_version, vt1.anc_version) version,
       decode(sign(vt1.anc_version - vt2.anc_version), 1, vt2.anc_workspace#, vt1.anc_workspace#) workspace#
from (select vt1.anc_version, vt1.anc_workspace#
      from wmsys.wm$version_table$ vt1
      where vt1.workspace# = sys_context('lt_ctx', 'diffWspc1_id') and
            vt1.anc_workspace# = sys_context('lt_ctx', 'anc_workspace_id')
      union all
      select decode(sys_context('lt_ctx', 'diffver1'),
                    -1, (select current_version
                         from wmsys.wm$workspaces_table$
                         where workspace_lock_id = sys_context('lt_ctx', 'diffWspc1_id')),
                     sys_context('lt_ctx', 'diffver1')) version,
              cast(sys_context('lt_ctx', 'diffWspc1_id') as number)
      from sys.dual
      where sys_context('lt_ctx', 'anc_workspace_id') = sys_context('lt_ctx', 'diffWspc1_id')
      ) vt1,
      (select vt2.anc_version, vt2.anc_workspace#
       from wmsys.wm$version_table$ vt2
       where vt2.workspace# = sys_context('lt_ctx', 'diffWspc2_id') and
             vt2.anc_workspace# = sys_context('lt_ctx', 'anc_workspace_id')
       union all
       select decode(sys_context('lt_ctx', 'diffver2'),
                     -1, (select current_version
                          from wmsys.wm$workspaces_table$
                          where workspace_lock_id = sys_context('lt_ctx', 'diffWspc2_id')),
                     sys_context('lt_ctx', 'diffver2')) version,
              cast(sys_context('lt_ctx', 'diffWspc2_id') as number)
       from sys.dual
       where sys_context('lt_ctx', 'anc_workspace_id') = sys_context('lt_ctx', 'diffWspc2_id')
      ) vt2
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$BASE_HIERARCHY_VIEW" ("VERSION") AS
  select vht.version
 from wmsys.wm$version_hierarchy_table$ vht, wmsys.wm$base_version_view bv
 where vht.workspace# = bv.workspace# and
       vht.version <= bv.version
union all
 select vht.version
 from wmsys.wm$version_table$ vt, wmsys.wm$version_hierarchy_table$ vht, wmsys.wm$base_version_view bv
 where vt.workspace# = bv.workspace# and
       vht.workspace# = vt.anc_workspace# and
       vht.version <= vt.anc_version
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$BASE_NEXTVER_VIEW" ("NEXT_VERS") AS
  select next_vers
from wmsys.wm$nextver_table$
where version in (select version from wmsys.wm$base_hierarchy_view)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CONF1_HIERARCHY_VIEW" ("VERSION") AS
  select vht.version
 from wmsys.wm$version_hierarchy_table$ vht
 where vht.workspace# = sys_context('lt_ctx', 'conflict_state_id')
union all
 select vht.version
 from wmsys.wm$version_table$ vt, wmsys.wm$version_hierarchy_table$ vht
 where vt.workspace# = sys_context('lt_ctx', 'conflict_state_id') and
       vht.workspace# = vt.anc_workspace# and
       vht.version <= vt.anc_version
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CONF1_NEXTVER_VIEW" ("NEXT_VERS") AS
  select next_vers
from wmsys.wm$nextver_table
where version in (select version from wmsys.wm$conf1_hierarchy_view)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CONF2_HIERARCHY_VIEW" ("VERSION") AS
  select vht.version
 from wmsys.wm$version_hierarchy_table$ vht
 where vht.workspace# = sys_context('lt_ctx', 'parent_conflict_state_id')
union all
 select vht.version
 from wmsys.wm$version_table$ vt, wmsys.wm$version_hierarchy_table$ vht
 where vt.workspace# = sys_context('lt_ctx', 'parent_conflict_state_id') and
       vht.workspace# = vt.anc_workspace# and
       vht.version <= vt.anc_version
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CONF2_NEXTVER_VIEW" ("NEXT_VERS") AS
  select next_vers
from wmsys.wm$nextver_table
where version in (select version from wmsys.wm$conf2_hierarchy_view)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CONF_BASE_HIERARCHY_VIEW" ("VERSION") AS
  select vht.version
 from wmsys.wm$version_hierarchy_table$ vht
 where vht.workspace# = sys_context('lt_ctx', 'confbasever_id') and
       vht.version <= sys_context('lt_ctx', 'confbasever')
union all
 select vht.version
 from wmsys.wm$version_table$ vt, wmsys.wm$version_hierarchy_table$ vht
 where vt.workspace# = sys_context('lt_ctx', 'confbasever_id') and
       vht.workspace# = vt.anc_workspace# and
       vht.version <= vt.anc_version
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CONF_BASE_NEXTVER_VIEW" ("NEXT_VERS") AS
  select next_vers
from wmsys.wm$nextver_table
where version in (select version from wmsys.wm$conf_base_hierarchy_view)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CURCONFLICT_PARVERS_VIEW" ("PARENT_VERS",
"VTID") AS
  select mt.version parent_vers, mt.vtid# vtid
from wmsys.wm$modified_tables$ mt
where mt.workspace# = sys_context('lt_ctx','conflict_state_id')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CURCONFLICT_NEXTVERS_VIEW" ("VERSION",
"NEXT_VERS",
"SPLIT",
"VTID") AS
  select nt.version, nt.next_vers, nt.split, cpv.vtid
from wmsys.wm$nextver_table$ nt, wmsys.wm$curConflict_parvers_view cpv
where nt.version = cpv.parent_vers
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CURRENT_CHILD_VERSIONS_VIEW" ("VERSION") AS
  select vht.version
 from wmsys.wm$version_hierarchy_table vht, wmsys.wm$version_table vt
 where
    vht.workspace = vt.workspace and
    vt.anc_workspace = nvl(sys_context('lt_ctx','state'),'LIVE') and
    vt.anc_version  >= decode(sys_context('lt_ctx','version'),
                               null, (select current_version
                                      from wmsys.wm$workspaces_table
                                      where workspace = 'LIVE'),
                               -1, (select current_version
                                    from wmsys.wm$workspaces_table
                                    where workspace = sys_context('lt_ctx','state')),
                               sys_context('lt_ctx','version')
                             )
union all
 select vht.version
 from wmsys.wm$version_hierarchy_table vht
 where vht.workspace = nvl(sys_context('lt_ctx','state'),'LIVE') and
       vht.version > decode(sys_context('lt_ctx','version'),
                             null, (select current_version
                                    from wmsys.wm$workspaces_table
                                    where workspace = 'LIVE'),
                             -1, (select current_version
                                  from wmsys.wm$workspaces_table
                                  where workspace = sys_context('lt_ctx','state')),
                             sys_context('lt_ctx','version')
                           )
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CURRENT_CONS_NEXTVERS_VIEW" ("NEXT_VERS") AS
  select /*+ INDEX(nvt WM$NEXTVER_TABLE_NV_INDX) */ nvt.next_vers
from wmsys.wm$nextver_table nvt
where (nvt.workspace = nvl(sys_context('lt_ctx','state'),'LIVE') and
       nvt.version <= decode(sys_context('lt_ctx','version'),
                             null, (select current_version
                                    from wmsys.wm$workspaces_table
                                    where workspace = 'LIVE'),
                             -1, (select current_version
                                  from wmsys.wm$workspaces_table
                                  where workspace = sys_context('lt_ctx','state')),
                             sys_context('lt_ctx','version')
                            ) and
       not (nvl(sys_context('lt_ctx','rowlock_status'),'X') = 'F' and nvl(sys_context('lt_ctx','flip_version'),'N') = 'Y')
      )
      or
      (exists (select 1
               from wmsys.wm$version_table vt
               where vt.workspace  = nvl(sys_context('lt_ctx','state'),'LIVE') and
                     nvt.workspace = vt.anc_workspace and
                     nvt.version  <= vt.anc_version)
      )
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CURRENT_PARVERS_VIEW" ("PARENT_VERS") AS
  select vht.version parent_vers
from wmsys.wm$version_hierarchy_table  vht
where (vht.workspace = nvl(sys_context('lt_ctx','state'),'LIVE') and
       vht.version <= decode(sys_context('lt_ctx','version'),
                             null, (select current_version
                                    from wmsys.wm$workspaces_table
                                    where workspace = 'LIVE'),
                            -1, (select current_version
                                 from wmsys.wm$workspaces_table
                                 where workspace = sys_context('lt_ctx','state')),
                            sys_context('lt_ctx','version'))
      )
      or
      (exists (select 1
               from wmsys.wm$version_table vt
               where vt.workspace  = nvl(sys_context('lt_ctx','state'),'LIVE') and
                     vht.workspace = vt.anc_workspace and
                     vht.version  <= vt.anc_version )
      )
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$MP_GRAPH_CONS_VERSIONS" ("VERSION",
"WORKSPACE") AS
  select vht.version, vht.workspace
from wmsys.wm$mp_graph_workspaces_table mpg, wmsys.wm$version_hierarchy_table vht
where instr(sys_context('lt_ctx','current_mp_leafs'), mpg.mp_leaf_workspace) > 0 and
      mpg.mp_graph_flag = 'I' and
      vht.workspace = mpg.mp_graph_workspace and
      vht.version <= mpg.anc_version and
      ((nvl(sys_context('lt_ctx','rowlock_status'),'X') = 'F' and nvl(sys_context('lt_ctx','flip_version'),'N') = 'Y')
       or
       (nvl(sys_context('lt_ctx','isrefreshed'),'0') = '1')
      )
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CURRENT_CONS_VERSIONS_VIEW" ("VERSION") AS
  select version from wmsys.wm$current_child_versions_view
union all
 select parent_vers from wmsys.wm$current_parvers_view
union all
 select version from wmsys.wm$mp_graph_cons_versions
union all
 select version
 from wmsys.wm$version_hierarchy_table
 where workspace in (select workspace from wmsys.wm$version_table where anc_workspace = sys_context('lt_ctx','state')) and
       (nvl(sys_context('lt_ctx','rowlock_status'),'X') = 'F' and nvl(sys_context('lt_ctx','flip_version'),'N') = 'Y')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CURRENT_MP_JOIN_POINTS" ("WORKSPACE#",
"VERSION") AS
  select mpwst.mp_leaf_workspace# workspace#, vht.version
from wmsys.wm$mp_graph_workspaces_table$ mpwst, wmsys.wm$workspaces_table$ wt, wmsys.wm$version_hierarchy_table$ vht
where mpwst.mp_graph_workspace# = sys_context('lt_ctx','state_id')  and
      mpwst.mp_leaf_workspace# = wt.workspace_lock_id and
      wt.workspace_lock_id = vht.workspace# and
      wt.parent_version = vht.parent_version
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CURRENT_NEXTVERS_VIEW" ("NEXT_VERS",
"VERSION") AS
  select nvt.next_vers, nvt.version
 from wmsys.wm$nextver_table$ nvt
 where nvt.workspace# = nvl(sys_context('lt_ctx', 'state_id'), 0) and
       nvt.version <= decode(sys_context('lt_ctx', 'version'),
                             null, (select current_version
                                    from wmsys.wm$workspaces_table$
                                    where workspace_lock_id = 0),
                             -1, (select current_version
                                  from wmsys.wm$workspaces_table$
                                  where workspace_lock_id = sys_context('lt_ctx', 'state_id')),
                             sys_context('lt_ctx', 'version'))
union all
 select nvt.next_vers, nvt.version
 from wmsys.wm$version_table$ vt, wmsys.wm$nextver_table$ nvt
 where vt.workspace# = nvl(sys_context('lt_ctx', 'state_id'), 0) and
       vt.anc_workspace# = nvt.workspace# and
       nvt.version <= vt.anc_version
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$CURRENT_WORKSPACE_VIEW" ("WORKSPACE",
"PARENT_WORKSPACE",
"CURRENT_VERSION",
"POST_VERSION",
"VERLIST",
"OWNER",
"CREATETIME",
"DESCRIPTION",
"WORKSPACE_LOCK_ID",
"FREEZE_STATUS",
"FREEZE_MODE",
"FREEZE_WRITER",
"OPER_STATUS",
"WM_LOCKMODE",
"ISREFRESHED",
"FREEZE_OWNER",
"SESSION_DURATION",
"IMPLICIT_SP_CNT",
"CR_STATUS",
"SYNC_PARVER",
"LAST_CHANGE") AS
  select workspace, parent_workspace, current_version, post_version, verlist, owner, createtime, description,
       workspace_lock_id, freeze_status, freeze_mode, freeze_writer, oper_status, wm_lockmode, isrefreshed, freeze_owner,
       session_duration, implicit_sp_cnt, cr_status, sync_parver, last_change
from wmsys.wm$workspaces_table
where workspace = nvl(sys_context('lt_ctx','state'),'LIVE')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$DIFF1_HIERARCHY_VIEW" ("VERSION") AS
  select version
 from wmsys.wm$version_hierarchy_table$
 where workspace# = sys_context('lt_ctx', 'diffWspc1_id') and
       version <= decode(sys_context('lt_ctx', 'diffver1'),
                         -1, (select current_version
                              from wmsys.wm$workspaces_table$
                              where workspace_lock_id = sys_context('lt_ctx', 'diffWspc1_id')),
                         sys_context('lt_ctx', 'diffver1'))
union all
 select version
 from wmsys.wm$version_table$ vt, wmsys.wm$version_hierarchy_table$ vht
 where vt.workspace# = sys_context('lt_ctx', 'diffWspc1_id') and
       vt.anc_workspace# = vht.workspace# and
       vht.version <= vt.anc_version
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$DIFF1_NEXTVER_VIEW" ("NEXT_VERS") AS
  select next_vers
from wmsys.wm$nextver_table$
where version in (select version from wmsys.wm$diff1_hierarchy_view)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$DIFF2_HIERARCHY_VIEW" ("VERSION") AS
  select version
 from wmsys.wm$version_hierarchy_table$
 where workspace# = sys_context('lt_ctx', 'diffWspc2_id') and
       version <= decode(sys_context('lt_ctx', 'diffver2'),
                         -1, (select current_version
                              from wmsys.wm$workspaces_table$
                              where workspace_lock_id = sys_context('lt_ctx', 'diffWspc2_id')),
                         sys_context('lt_ctx', 'diffver2'))
union all
 select version
 from wmsys.wm$version_table$ vt, wmsys.wm$version_hierarchy_table$ vht
 where vt.workspace# = sys_context('lt_ctx', 'diffWspc2_id') and
       vt.anc_workspace# = vht.workspace# and
       vht.version <= vt.anc_version
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$DIFF2_NEXTVER_VIEW" ("NEXT_VERS") AS
  select next_vers
from wmsys.wm$nextver_table$
where version in (select version from wmsys.wm$diff2_hierarchy_view)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$EXP_MAP" ("CODE",
"NFIELD1",
"NFIELD2",
"NFIELD3",
"VFIELD1",
"VFIELD2",
"VFIELD3") AS
  select "CODE","NFIELD1","NFIELD2","NFIELD3","VFIELD1","VFIELD2","VFIELD3"
from table(wmsys.lt_export_pkg.export_mapping_view_func())
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$MODIFIED_TABLES_VIEW" ("VTID",
"VERSION",
"WORKSPACE#") AS
  select vtid# vtid, version, workspace#
from wmsys.wm$modified_tables$ mt
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$MP_GRAPH_NEW_VERSIONS" ("VERSION",
"WORKSPACE") AS
  select vht.version, vht.workspace
from wmsys.wm$version_hierarchy_table vht, wmsys.wm$version_table vt
where vt.workspace = sys_context('lt_ctx','new_mp_leaf') and
      vht.workspace = vt.anc_workspace and
      vht.version <= vt.anc_version and
      (vt.refCount < 0 or (vht.workspace = sys_context('lt_ctx','new_mp_root') and vht.version > sys_context('lt_ctx','old_root_anc_version')))
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$MP_GRAPH_OTHER_VERSIONS" ("VERSION",
"WORKSPACE") AS
  select vht.version, vht.workspace
 from wmsys.wm$version_hierarchy_table vht, wmsys.wm$version_table vt
 where vt.workspace = sys_context('lt_ctx','new_mp_leaf') and
       vht.workspace = vt.anc_workspace and
       vht.version <= vt.anc_version and
       vt.refCount > 0 and
       vt.anc_workspace not in
             (select sys_context('lt_ctx','new_mp_root')
              from sys.dual
             union all
              select anc_workspace
              from wmsys.wm$version_table root_anc
              where workspace = sys_context('lt_ctx','new_mp_root'))
union all
 select vht.version, vht.workspace
 from wmsys.wm$version_hierarchy_table vht, wmsys.wm$version_table vt
 where vt.anc_workspace = sys_context('lt_ctx','new_mp_leaf') and
        vht.workspace = vt.workspace
union all
 select vht.version, vht.workspace
 from wmsys.wm$version_hierarchy_table vht
 where vht.workspace = sys_context('lt_ctx','new_mp_leaf')
union all
 select version, workspace
 from wmsys.wm$mp_graph_cons_versions
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$MP_GRAPH_REMAINING_VERSIONS" ("VERSION") AS
  select vht.version
 from wmsys.wm$version_hierarchy_table vht, wmsys.wm$version_table vt
 where vt.anc_workspace = sys_context('lt_ctx','mp_workspace') and
       vht.workspace = vt.workspace
union all
 select vht.version
 from wmsys.wm$version_hierarchy_table vht
 where vht.workspace = sys_context('lt_ctx','mp_workspace')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$MP_GRAPH_REMOVED_VERSIONS" ("VERSION",
"WORKSPACE") AS
  select vht.version, vht.workspace
from wmsys.wm$version_hierarchy_table vht, wmsys.wm$version_table vt
where vt.workspace = sys_context('lt_ctx','mp_workspace') and
      vht.workspace = vt.anc_workspace and
      vht.version <= vt.anc_version and
      (vt.refCount = 0 or (vht.workspace = sys_context('lt_ctx','mp_root') and
                           vht.version > sys_context('lt_ctx','new_root_anc_version')))
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$MP_JOIN_POINTS" ("WORKSPACE",
"VERSION") AS
  select mpwst.mp_leaf_workspace workspace, vht.version
from wmsys.wm$mp_graph_workspaces_table mpwst, wmsys.wm$workspaces_table wt, wmsys.wm$version_hierarchy_table vht
where mpwst.mp_graph_workspace = sys_context('lt_ctx','new_mp_leaf') and
      mpwst.mp_leaf_workspace = wt.workspace and
      wt.workspace = vht.workspace and
      wt.parent_version = vht.parent_version
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$MW_NEXTVERS_VIEW" ("NEXT_VERS") AS
  select nvt.next_vers
from wmsys.wm$nextver_table  nvt
where  nvt.workspace in (select workspace from wmsys.wm$mw_table)
       or
       exists (select 1
               from wmsys.wm$version_table vt
               where vt.workspace in (select workspace from wmsys.wm$mw_table) and
                     nvt.workspace = vt.anc_workspace and
                     nvt.version  <= vt.anc_version)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$MW_VERSIONS_VIEW_9I" ("VERSION",
"MODIFIED_BY",
"SEEN_BY") AS
  select version, modified_by, wmsys.ltUtil.wm$concat(cast(collect(workspace) as wmsys.wm$ident_tab_type)) seen_by
from (select vht.version, vht.workspace modified_by, mw.workspace
      from wmsys.wm$mw_table mw, wmsys.wm$version_table vt, wmsys.wm$version_hierarchy_table vht
      where mw.workspace = vt.workspace and
            vt.anc_workspace = vht.workspace and
            vht.version <= vt.anc_version
     union all
      select vht.version, vht.workspace modified_by, mw.workspace
      from wmsys.wm$mw_table mw, wmsys.wm$version_hierarchy_table vht
      where mw.workspace = vht.workspace
     )
group by (version,modified_by)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$NET_DIFF1_HIERARCHY_VIEW" ("VERSION") AS
  select version from wmsys.wm$diff1_hierarchy_view
minus
 select version from wmsys.wm$base_hierarchy_view
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$NET_DIFF2_HIERARCHY_VIEW" ("VERSION") AS
  select version from wmsys.wm$diff2_hierarchy_view
minus
 select version from wmsys.wm$base_hierarchy_view
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$PARCONFLICT_PARVERS_VIEW" ("PARENT_VERS",
"VTID") AS
  select mt.version parent_vers, mt.vtid# vtid
from wmsys.wm$modified_tables$ mt, wmsys.wm$workspaces_table$ wt
where mt.workspace# = sys_context('lt_ctx','parent_conflict_state_id') and
      wt.workspace_lock_id = sys_context('lt_ctx','conflict_state_id') and
      mt.version >= decode(sign(wt.parent_version - wt.sync_parver), -1, (wt.parent_version+1), sync_parver)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$PARCONFLICT_NEXTVERS_VIEW" ("VERSION",
"NEXT_VERS",
"SPLIT",
"VTID") AS
  select nt.version, nt.next_vers, nt.split, ppv.vtid
from wmsys.wm$nextver_table$ nt, wmsys.wm$parConflict_parvers_view ppv
where nt.version = ppv.parent_vers
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$PARVERS_VIEW" ("PARENT_VERS") AS
  select version parent_vers
 from wmsys.wm$version_hierarchy_table$
 where workspace# = nvl(sys_context('lt_ctx','state_id'), 0)
union all
 select vht.version
 from wmsys.wm$version_hierarchy_table$ vht, wmsys.wm$version_table$ vt
 where vt.workspace# = nvl(sys_context('lt_ctx','state_id'), 0) and
       vht.workspace# = vt.anc_workspace# and
       vht.version <= vt.anc_version
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$TABLE_PARVERS_VIEW" ("VTID",
"PARENT_VERS") AS
  select vtid# vtid, mt.version parent_vers
 from wmsys.wm$modified_tables$ mt
 where mt.workspace# = nvl(sys_context('lt_ctx', 'state_id'), 0) and
       mt.version <= decode(sys_context('lt_ctx', 'version'),
                            null, (select current_version
                                   from wmsys.wm$workspaces_table$
                                   where workspace_lock_id = 0),
                            -1, (select current_version
                                 from wmsys.wm$workspaces_table$
                                 where workspace_lock_id = sys_context('lt_ctx', 'state_id')),
                            sys_context('lt_ctx', 'version'))
union all
 select vtid#, mt.version
 from wmsys.wm$version_table$ vt, wmsys.wm$modified_tables$ mt
 where vt.workspace# = nvl(sys_context('lt_ctx', 'state_id'), 0) and
       vt.anc_workspace# = mt.workspace# and
       mt.version <= vt.anc_version
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$TABLE_VERSIONS_IN_LIVE_VIEW" ("VTID",
"PARENT_VERS") AS
  select vtid# vtid, mt.version parent_vers
from wmsys.wm$modified_tables$ mt
where mt.workspace# = 0
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$TABLE_WS_PARVERS_VIEW" ("VTID",
"PARENT_VERS") AS
  select vtid# vtid, mt.version parent_vers
 from wmsys.wm$modified_tables$ mt
 where mt.workspace# = nvl(sys_context('lt_ctx', 'state_id'), 0)
union all
 select vtid#, mt.version
 from wmsys.wm$version_table$ vt, wmsys.wm$modified_tables$ mt
 where vt.workspace# = nvl(sys_context('lt_ctx', 'state_id'), 0) and
       vt.anc_workspace# = mt.workspace# and
       mt.version <= vt.anc_version
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$VERSION_VIEW" ("VERSION",
"PARENT_VERS",
"WORKSPACE") AS
  select vht1.version, vht2.version parent_vers, vht1.workspace
 from wmsys.wm$version_hierarchy_table vht1, wmsys.wm$version_hierarchy_table vht2, wmsys.wm$version_table vt
 where vht1.workspace = vt.workspace and
       vht2.workspace = vt.anc_workspace and
       vht2.version  <= vt.anc_version
union all
 select vht1.version, vht2.version parent_vers, vht1.workspace
 from wmsys.wm$version_hierarchy_table vht1, wmsys.wm$version_hierarchy_table vht2
 where vht2.version <= vht1.version and
       vht2.workspace = vht1.workspace
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM$WORKSPACE_SESSIONS_VIEW" ("USERNAME",
"WORKSPACE",
"SID",
"SERIAL#",
"SADDR",
"INST_ID",
"LOCKMODE",
"ISIMPLICIT") AS
  select st.username, wt.workspace, st.sid, st.serial#, st.saddr, st.inst_id, decode(dl.lmode, 2, 'SS', 4, 'S', 'U') lockMode, 0 isImplicit
  from gv$lock dl, wmsys.wm$workspaces_table wt, gv$session st
  where dl.type = 'UL' and
        dl.id1 - 1 = wt.workspace_lock_id and
        dl.sid = st.sid and
        dl.inst_id = st.inst_id
 union all
  select st.username, 'LIVE', st.sid, st.serial#, st.saddr, st.inst_id, 'S', 1
  from gv$session st
  where st.username is not null and
        not exists(select 1
                   from gv$lock dl, wmsys.wm$workspaces_table wt
                   where dl.type = 'UL' and
                         dl.lmode = 4 and
                         dl.id1 - 1 = wt.workspace_lock_id and
                         dl.sid = st.sid and
                         dl.inst_id = st.inst_id)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_WM_PRIVS" ("WORKSPACE",
"PRIVILEGE",
"GRANTOR",
"GRANTABLE") AS
  select distinct
       workspace,
       decode(priv,'A',  'ACCESS_WORKSPACE',
                   'C',  'CREATE_WORKSPACE',
                   'D',  'REMOVE_WORKSPACE',
                   'F',  'FREEZE_WORKSPACE',
                   'G',  'GRANTPRIV_WORKSPACE',
                   'M',  'MERGE_WORKSPACE',
                   'R',  'ROLLBACK_WORKSPACE',
                   'AA', 'ACCESS_ANY_WORKSPACE',
                   'CA', 'CREATE_ANY_WORKSPACE',
                   'DA', 'REMOVE_ANY_WORKSPACE',
                   'FA', 'FREEZE_ANY_WORKSPACE',
                   'GA', 'GRANTPRIV_ANY_WORKSPACE',
                   'MA', 'MERGE_ANY_WORKSPACE',
                   'RA', 'ROLLBACK_ANY_WORKSPACE',
                   'W',  'WM_ADMIN',
                         'UNKNOWN_PRIV') privilege,
       grantor,
       decode(admin, 0, 'NO', 1, 'YES') grantable
from wmsys.wm$workspace_priv_table
where grantee in
   (select role from session_roles
   union all
    select 'WM_ADMIN_ROLE' from sys.dual where sys_context('userenv', 'current_user') = 'SYS'
   union all
    select username from all_users where username = sys_context('userenv', 'current_user')
   union all
    select 'PUBLIC' from sys.dual)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_WORKSPACES_INTERNAL" ("WORKSPACE",
"PARENT_WORKSPACE",
"CURRENT_VERSION",
"PARENT_VERSION",
"POST_VERSION",
"VERLIST",
"OWNER",
"CREATETIME",
"DESCRIPTION",
"WORKSPACE_LOCK_ID",
"FREEZE_STATUS",
"FREEZE_MODE",
"FREEZE_WRITER",
"OPER_STATUS",
"WM_LOCKMODE",
"ISREFRESHED",
"FREEZE_OWNER",
"SESSION_DURATION",
"MP_ROOT") AS
  select s.workspace, s.parent_workspace, s.current_version, s.parent_version, s.post_version, s.verlist, s.owner, s.createTime,
        s.description, s.workspace_lock_id, s.freeze_status, s.freeze_mode, s.freeze_writer, s.oper_status, s.wm_lockmode, s.isRefreshed,
        s.freeze_owner, s.session_duration, s.mp_root
 from wmsys.wm$workspaces_table s
 where exists (select 1 from wmsys.user_wm_privs where privilege = 'WM_ADMIN' or privilege like '%ANY%')
 union
 select s.workspace, s.parent_workspace, s.current_version, s.parent_version, s.post_version, s.verlist, s.owner, s.createTime,
        s.description, s.workspace_lock_id, s.freeze_status, s.freeze_mode, s.freeze_writer, s.oper_status, s.wm_lockmode, s.isRefreshed,
        s.freeze_owner, s.session_duration, s.mp_root
 from wmsys.wm$workspaces_table s,
      (select distinct workspace from wmsys.user_wm_privs) u
 where u.workspace = s.workspace
union
 select s.workspace, s.parent_workspace, s.current_version, s.parent_version, s.post_version, s.verlist, s.owner, s.createTime,
        s.description, s.workspace_lock_id, s.freeze_status, s.freeze_mode, s.freeze_writer, s.oper_status, s.wm_lockmode, s.isRefreshed,
        s.freeze_owner, s.session_duration, s.mp_root
from wmsys.wm$workspaces_table s where owner = sys_context('userenv', 'current_user')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_WORKSPACES" ("WORKSPACE",
"WORKSPACE_ID",
"PARENT_WORKSPACE",
"PARENT_SAVEPOINT",
"OWNER",
"CREATETIME",
"DESCRIPTION",
"FREEZE_STATUS",
"FREEZE_MODE",
"FREEZE_WRITER",
"FREEZE_OWNER",
"SESSION_DURATION",
"CURRENT_SESSION",
"RESOLVE_STATUS",
"RESOLVE_USER",
"CONTINUALLY_REFRESHED",
"WORKSPACE_LOCKMODE",
"WORKSPACE_LOCKMODE_OVERRIDE",
"MP_ROOT_WORKSPACE") AS
  select asp.workspace, asp.workspace_lock_id workspace_id, asp.parent_workspace, ssp.savepoint parent_savepoint,
       asp.owner, asp.createTime, asp.description,
       decode(asp.freeze_status,'LOCKED','FROZEN', 'UNLOCKED','UNFROZEN') freeze_status,
       decode(asp.oper_status, null, asp.freeze_mode,'INTERNAL') freeze_mode,
       decode(asp.freeze_mode, '1WRITER_SESSION', s.username, asp.freeze_writer) freeze_writer,
       decode(rst.workspace, null, decode(asp.session_duration, 0, asp.freeze_owner, s.username), null) freeze_owner,
       decode(asp.freeze_status, 'UNLOCKED', null, decode(asp.session_duration, 1, 'YES', 'NO')) session_duration,
       decode(asp.session_duration, 1,
              decode((select 1 from sys.dual
                      where s.sid = sys_context('lt_ctx', 'cid') and
                            s.serial# = sys_context('lt_ctx', 'serial#') and
                            s.inst_id = dbms_utility.current_instance),
                     1, 'YES', 'NO'),
              null) current_session,
       decode(rst.workspace, null, 'INACTIVE', 'ACTIVE') resolve_status,
       rst.resolve_user,
       decode(asp.isRefreshed, 1, 'YES', 'NO') continually_refreshed,
       decode(substr(asp.wm_lockmode, 1, instr(asp.wm_lockmode, ',')-1),
              'C', 'CARRY',
              'D', 'DISREGARD',
              'E', 'EXCLUSIVE',
              'S', 'SHARED',
              'VE', 'VERSION EXCLUSIVE',
              'WE', 'WORKSPACE EXCLUSIVE',
              null) workspace_lockmode,
       decode(substr(asp.wm_lockmode, instr(asp.wm_lockmode, ',')+1, 1), 'Y', 'YES', 'N', 'NO', NULL) workspace_lockmode_override,
       mp_root mp_root_workspace
from   wmsys.all_workspaces_internal asp, wmsys.wm$workspace_savepoints_table ssp,
       wmsys.wm$resolve_workspaces_table rst, gv$session s
where  (ssp.position is null or ssp.position = (select min(position) from wmsys.wm$workspace_savepoints_table where version = ssp.version)) and
       asp.parent_version = ssp.version (+) and
       asp.workspace = rst.workspace (+) and
       to_char(s.sid(+)) = substr(asp.freeze_owner, 1, instr(asp.freeze_owner, ',')-1)  and
       to_char(s.serial#(+)) = substr(asp.freeze_owner, instr(asp.freeze_owner, ',')+1, instr(asp.freeze_owner, ',',1,2)-instr(asp.freeze_owner, ',')-1) and
       to_char(s.inst_id(+)) = substr(asp.freeze_owner, instr(asp.freeze_owner, ',', 1, 2)+1)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_WORKSPACES" ("WORKSPACE",
"WORKSPACE_ID",
"PARENT_WORKSPACE",
"PARENT_SAVEPOINT",
"OWNER",
"CREATETIME",
"DESCRIPTION",
"FREEZE_STATUS",
"FREEZE_MODE",
"FREEZE_WRITER",
"FREEZE_OWNER",
"SESSION_DURATION",
"CURRENT_SESSION",
"RESOLVE_STATUS",
"RESOLVE_USER",
"CONTINUALLY_REFRESHED",
"WORKSPACE_LOCKMODE",
"WORKSPACE_LOCKMODE_OVERRIDE",
"MP_ROOT_WORKSPACE") AS
  select st.workspace, st.workspace_lock_id workspace_id, st.parent_workspace, ssp.savepoint parent_savepoint,
       st.owner, st.createTime, st.description,
       decode(st.freeze_status,'LOCKED','FROZEN', 'UNLOCKED','UNFROZEN') freeze_status,
       decode(st.oper_status, null, st.freeze_mode,'INTERNAL') freeze_mode,
       decode(st.freeze_mode, '1WRITER_SESSION', s.username, st.freeze_writer) freeze_writer,
       decode(rst.workspace, null, decode(st.session_duration, 0, st.freeze_owner, s.username), null) freeze_owner,
       decode(st.freeze_status, 'UNLOCKED', null, decode(st.session_duration, 1, 'YES', 'NO')) session_duration,
       decode(st.session_duration, 1,
              decode((select 1 from sys.dual
                      where s.sid = sys_context('lt_ctx', 'cid') and
                            s.serial# = sys_context('lt_ctx', 'serial#') and
                            s.inst_id = dbms_utility.current_instance),
                     1, 'YES', 'NO'),
              null) current_session,
       decode(rst.workspace, null, 'INACTIVE', 'ACTIVE') resolve_status,
       rst.resolve_user,
       decode(st.isRefreshed, 1, 'YES', 'NO') continually_refreshed,
       decode(substr(st.wm_lockmode, 1, instr(st.wm_lockmode, ',')-1),
              'C', 'CARRY',
              'D', 'DISREGARD',
              'E', 'EXCLUSIVE',
              'S', 'SHARED',
              'VE', 'VERSION EXCLUSIVE',
              'WE', 'WORKSPACE EXCLUSIVE',
              null) workspace_lockmode,
       decode(substr(st.wm_lockmode, instr(st.wm_lockmode, ',')+1, 1), 'Y', 'YES', 'N', 'NO', NULL) workspace_lockmode_override,
       mp_root mp_root_workspace
from wmsys.wm$workspaces_table st,
     wmsys.wm$workspace_savepoints_table ssp,
     wmsys.wm$resolve_workspaces_table rst, gv$session s
where st.owner = sys_context('userenv', 'current_user') and
      (ssp.position is null or ssp.position = (select min(position) from wmsys.wm$workspace_savepoints_table where version = ssp.version)) and
      st.parent_version = ssp.version (+) and
      st.workspace = rst.workspace (+) and
      to_char(s.sid(+)) = substr(st.freeze_owner, 1, instr(st.freeze_owner, ',')-1)  and
      to_char(s.serial#(+)) = substr(st.freeze_owner, instr(st.freeze_owner, ',')+1, instr(st.freeze_owner, ',',1,2)-instr(st.freeze_owner, ',')-1) and
      to_char(s.inst_id(+)) = substr(st.freeze_owner, instr(st.freeze_owner, ',', 1, 2)+1)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_MP_GRAPH_WORKSPACES" ("MP_LEAF_WORKSPACE",
"GRAPH_WORKSPACE",
"GRAPH_FLAG") AS
  select mpg.mp_leaf_workspace, mpg.mp_graph_workspace GRAPH_WORKSPACE,
       decode(mpg.mp_graph_flag,'R','ROOT_WORKSPACE','I','INTERMEDIATE_WORKSPACE','L','LEAF_WORKSPACE') GRAPH_FLAG
from wmsys.wm$mp_graph_workspaces_table mpg, wmsys.all_workspaces uw
where mpg.mp_leaf_workspace = uw.workspace
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_MP_PARENT_WORKSPACES" ("MP_LEAF_WORKSPACE",
"PARENT_WORKSPACE",
"CREATOR",
"CREATETIME",
"ISREFRESHED",
"PARENT_FLAG") AS
  select mp.workspace mp_leaf_workspace,mp.parent_workspace,mp.creator,mp.createtime,
       decode(mp.isRefreshed,0,'NO','YES') ISREFRESHED, decode(mp.parent_flag,'DP','DEFAULT_PARENT','ADDITIONAL_PARENT') PARENT_FLAG
from wmsys.wm$mp_parent_workspaces_table mp, wmsys.all_workspaces aw
where mp.workspace = aw.workspace
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_REMOVED_WORKSPACES" ("OWNER",
"WORKSPACE_NAME",
"WORKSPACE_ID",
"PARENT_WORKSPACE_NAME",
"PARENT_WORKSPACE_ID",
"CREATETIME",
"RETIRETIME",
"DESCRIPTION",
"MP_ROOT_WORKSPACE_ID",
"CONTINUALLY_REFRESHED") AS
  select owner, workspace_name, workspace_id, parent_workspace_name, parent_workspace_id,
        createtime, retiretime, description, mp_root_id mp_root_workspace_id, decode(rwt.isRefreshed, 1, 'YES', 'NO') continually_refreshed
 from wmsys.wm$removed_workspaces_table rwt
 where exists (select 1 from wmsys.user_wm_privs where privilege = 'WM_ADMIN' or privilege like '%ANY%')
union
 select owner, workspace_name, workspace_id, parent_workspace_name, parent_workspace_id,
        createtime, retiretime, description, mp_root_id mp_root_workspace_id, decode(rwt.isRefreshed, 1, 'YES', 'NO') continually_refreshed
 from wmsys.wm$removed_workspaces_table rwt,
      (select distinct workspace from wmsys.user_wm_privs) u
 where rwt.workspace_name = u.workspace
union
 select owner, workspace_name, workspace_id, parent_workspace_name, parent_workspace_id,
        createtime, retiretime, description, mp_root_id mp_root_workspace_id, decode(rwt.isRefreshed, 1, 'YES', 'NO') continually_refreshed
 from wmsys.wm$removed_workspaces_table rwt
 where rwt.owner = sys_context('userenv', 'current_user')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_VERSION_HVIEW" ("VERSION",
"PARENT_VERSION",
"WORKSPACE",
"WORKSPACE_ID") AS
  select vht.version, vht.parent_version, wt.workspace, vht.workspace# workspace_id
from wmsys.wm$version_hierarchy_table$ vht, wmsys.wm$workspaces_table$ wt
where vht.workspace# = wt.workspace_lock_id
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_WM_CONSTRAINTS" ("OWNER",
"CONSTRAINT_NAME",
"CONSTRAINT_TYPE",
"TABLE_NAME",
"SEARCH_CONDITION",
"STATUS",
"INDEX_OWNER",
"INDEX_NAME",
"INDEX_TYPE") AS
  select /*+ LEADING(ct) */ ct.owner, constraint_name, constraint_type, table_name, search_condition, status, index_owner, index_name, index_type
from wmsys.wm$constraints_table ct, all_views av
where ct.owner = av.owner and
      ct.table_name = av.view_name
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_WM_CONS_COLUMNS" ("OWNER",
"CONSTRAINT_NAME",
"TABLE_NAME",
"COLUMN_NAME",
"POSITION") AS
  select /*+ LEADING(t1) */ t1.owner, t1.constraint_name, t1.table_name, t1.column_name, t1.position
from wmsys.wm$cons_columns t1, all_views t2
where t1.owner = t2.owner and
      t1.table_name = t2.view_name
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_WM_IND_COLUMNS" ("INDEX_OWNER",
"INDEX_NAME",
"OWNER",
"TABLE_NAME",
"COLUMN_NAME",
"COLUMN_POSITION",
"COLUMN_LENGTH",
"DESCEND") AS
  select /*+ USE_NL(t1 t2) */ t2.index_owner, t2.index_name, t1.owner, t1.table_name, t2.column_name, t2.column_position, t2.column_length,  t2.descend
 from wmsys.wm$constraints_table t1, all_ind_columns t2
 where t1.index_owner = t2.index_owner and
       t1.index_name = t2.index_name and
       t1.constraint_type not in ('P', 'PN', 'PU')
union
 select /*+ USE_NL(t1 t2) */ t2.index_owner, t2.index_name, t1.owner, t1.table_name, t2.column_name, t2.column_position-1, t2.column_length, t2.descend
 from wmsys.wm$constraints_table t1, all_ind_columns t2
 where t1.index_owner = t2.index_owner and
       t1.index_name = t2.index_name and
       t1.constraint_type in ('P', 'PN', 'PU') and
       t2.column_name not in ('WM_VERSION','WM_DELSTATUS')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_WM_IND_EXPRESSIONS" ("INDEX_OWNER",
"INDEX_NAME",
"OWNER",
"TABLE_NAME",
"COLUMN_EXPRESSION",
"COLUMN_POSITION") AS
  select /*+ USE_NL(t1 t2) */ t2.index_owner,t2.index_name, t1.owner, t1.table_name, t2.column_expression, t2.column_position
from wmsys.wm$constraints_table t1, all_ind_expressions t2
where t1.index_owner = t2.index_owner and
      t1.index_name = t2.index_name
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_WM_LOCKED_TABLES" ("TABLE_OWNER",
"TABLE_NAME",
"LOCK_MODE",
"LOCK_OWNER",
"LOCKING_STATE") AS
  select /*+ LEADING(t) */ t.owner table_owner, t.table_name, t.lock_mode, t.lock_owner, t.locking_state
from wmsys.wm$all_locks_view t, all_views s
where t.owner = s.owner and t.table_name = s.view_name
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_WM_MODIFIED_TABLES" ("TABLE_NAME",
"WORKSPACE",
"SAVEPOINT") AS
  select table_name, workspace, savepoint
from
     (select distinct o.table_name, o.workspace,
             nvl(s.savepoint, 'LATEST') savepoint,
             min(s.is_implicit) imp, count(s.version) counter
      from wmsys.wm$modified_tables o, wmsys.wm$workspace_savepoints_table s, all_views a
      where substr(o.table_name, 1, instr(table_name,'.')-1) = a.owner and
            substr(o.table_name, instr(table_name,'.')+1) = a.view_name and
            o.version = s.version (+)
      group by o.table_name, o.workspace, savepoint)
where (imp = 0 or imp is null or counter = 1)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_WM_POLICIES" ("OBJECT_OWNER",
"OBJECT_NAME",
"POLICY_GROUP",
"POLICY_NAME",
"PF_OWNER",
"PACKAGE",
"FUNCTION",
"SEL",
"INS",
"UPD",
"DEL",
"IDX",
"CHK_OPTION",
"ENABLE",
"STATIC_POLICY",
"POLICY_TYPE",
"LONG_PREDICATE") AS
  select ap.object_owner, ap.object_name, ap.policy_group, ap.policy_name, ap.pf_owner,ap. package, ap.function,
       ap.sel, ap.ins, ap.upd, ap.del, ap.idx, ap.chk_option, enable, ap.static_policy, ap.policy_type, ap.long_predicate
from wmsys.wm$versioned_tables vt, all_policies ap
where ap.object_owner = vt.owner and
      ap.object_name in (vt.table_name, vt.table_name || '_CONF', vt.table_name || '_DIFF',
                         vt.table_name || '_HIST', vt.table_name || '_LOCK', vt.table_name || '_MW')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_WM_RIC_INFO" ("CT_OWNER",
"CT_NAME",
"PT_OWNER",
"PT_NAME",
"RIC_NAME",
"CT_COLS",
"PT_COLS",
"R_CONSTRAINT_NAME",
"DELETE_RULE",
"STATUS") AS
  select /*+ LEADING(rt) */ ct_owner, ct_name, pt_owner, pt_name, ric_name, rtrim(ct_cols,',') ct_cols, rtrim(pt_cols,',') pt_cols,
                          pt_unique_const_name r_constraint_name, my_mode delete_rule, status
from wmsys.wm$ric_table rt, all_views uv
where uv.view_name = rt.ct_name and
      uv.owner = rt.ct_owner
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_WM_TAB_TRIGGERS" ("TRIGGER_OWNER",
"TRIGGER_NAME",
"TABLE_OWNER",
"TABLE_NAME",
"TRIGGER_TYPE",
"STATUS",
"WHEN_CLAUSE",
"DESCRIPTION",
"TRIGGER_BODY",
"TAB_MERGE_WO_REMOVE",
"TAB_MERGE_W_REMOVE",
"WSPC_MERGE_WO_REMOVE",
"WSPC_MERGE_W_REMOVE",
"DML",
"TABLE_IMPORT") AS
  select trig_owner_name trigger_owner,
       trig_name trigger_name,
       table_owner_name table_owner,
       table_name table_name,
       wmsys.ltUtil.getTrigTypes(trig_flag) trigger_type,
       status,
       when_clause,
       description,
       trig_code trigger_body,
       decode(bitand(event_flag, 32768), 0, 'OFF', 'ON') tab_merge_wo_remove,
       decode(bitand(event_flag, 65536), 0, 'OFF', 'ON') tab_merge_w_remove,
       decode(bitand(event_flag, 131072), 0, 'OFF', 'ON') wspc_merge_wo_remove,
       decode(bitand(event_flag, 262144), 0, 'OFF', 'ON') wspc_merge_w_remove,
       decode(bitand(event_flag, 524288), 0, 'OFF', 'ON') dml,
       decode(bitand(event_flag, 33554432), 0, 'OFF', 'ON') table_import
from wmsys.wm$udtrig_info
where (trig_owner_name  = sys_context('userenv', 'current_user') or
       table_owner_name = sys_context('userenv', 'current_user') or
       exists (select 1
               from user_sys_privs
               where privilege = 'CREATE ANY TRIGGER') or
       exists (select 1
               from session_roles sr, role_sys_privs rsp
               where sr.role = rsp.role and
                     rsp.privilege = 'CREATE ANY TRIGGER')) and
     internal_type = 'USER_DEFINED'
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_WM_VERSIONED_TABLES" ("TABLE_NAME",
"OWNER",
"STATE",
"HISTORY",
"NOTIFICATION",
"NOTIFYWORKSPACES",
"CONFLICT",
"DIFF",
"VALIDTIME") AS
  select /*+ LEADING(t) */ t.table_name, t.owner,
        disabling_ver state,
        t.hist history,
        decode(t.notification, 0, 'NO', 1, 'YES') notification,
        substr(notifyWorkspaces,2,length(notifyworkspaces)-2) notifyworkspaces,
        wmsys.ltadm.AreThereConflicts(t.owner, t.table_name) conflict,
        wmsys.ltadm.AreThereDiffs(t.owner, t.table_name) diff,
        decode(t.validtime, 0, 'NO', 1, 'YES') validtime
 from wmsys.wm$versioned_tables t, all_views av
 where t.table_name = av.view_name and t.owner = av.owner
union all
 select /*+ LEADING(t) */ t.table_name, t.owner,
        disabling_ver state,
        t.hist history,
        decode(t.notification, 0, 'NO', 1, 'YES') notification,
        substr(notifyWorkspaces,2,length(notifyworkspaces)-2) notifyworkspaces,
        wmsys.ltadm.AreThereConflicts(t.owner, t.table_name) conflict,
        wmsys.ltadm.AreThereDiffs(t.owner, t.table_name) diff,
        decode(t.validtime, 0, 'NO', 1, 'YES') validtime
 from wmsys.wm$versioned_tables t, all_tables at
 where t.table_name = at.table_name and t.owner = at.owner
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_WM_VT_ERRORS" ("OWNER",
"TABLE_NAME",
"STATE",
"SQL_STR",
"STATUS",
"ERROR_MSG") AS
  select distinct vt.owner,vt.table_name,vt.state,vt.sql_str,et.status,et.error_msg
 from (select t1.owner,t1.table_name,t1.disabling_ver state,nt.index_type,nt.index_field,dbms_lob.substr(nt.sql_str,4000,1) sql_str
       from wmsys.wm$versioned_tables t1, table(t1.undo_code) nt) vt,
      wmsys.wm$vt_errors_table et, all_tables at
 where vt.owner = et.owner and
       vt.table_name = et.table_name and
       vt.index_type = et.index_type and
       vt.index_field = et.index_field and
       vt.owner = at.owner and
       at.table_name in (vt.table_name, vt.table_name || '_LT')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_WORKSPACE_PRIVS" ("GRANTEE",
"WORKSPACE",
"PRIVILEGE",
"GRANTOR",
"GRANTABLE") AS
  select spt.grantee,
       spt.workspace,
       decode(spt.priv,'A',  'ACCESS_WORKSPACE',
                       'C',  'CREATE_WORKSPACE',
                       'D',  'REMOVE_WORKSPACE',
                       'F',  'FREEZE_WORKSPACE',
                       'G',  'GRANTPRIV_WORKSPACE',
                       'M',  'MERGE_WORKSPACE',
                       'R',  'ROLLBACK_WORKSPACE',
                       'AA', 'ACCESS_ANY_WORKSPACE',
                       'CA', 'CREATE_ANY_WORKSPACE',
                       'DA', 'REMOVE_ANY_WORKSPACE',
                       'FA', 'FREEZE_ANY_WORKSPACE',
                       'GA', 'GRANTPRIV_ANY_WORKSPACE',
                       'MA', 'MERGE_ANY_WORKSPACE',
                       'RA', 'ROLLBACK_ANY_WORKSPACE',
                       'W',  'WM_ADMIN',
                             'UNKNOWN_PRIV') privilege,
       spt.grantor,
       decode(spt.admin, 0, 'NO',
                         1, 'YES') grantable
from wmsys.all_workspaces_internal alt, wmsys.wm$workspace_priv_table spt
where alt.workspace = spt.workspace
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ALL_WORKSPACE_SAVEPOINTS" ("SAVEPOINT",
"WORKSPACE",
"IMPLICIT",
"POSITION",
"OWNER",
"CREATETIME",
"DESCRIPTION",
"CANROLLBACKTO",
"REMOVABLE",
"VERSION") AS
  select t.savepoint, t.workspace,
       decode(t.is_implicit, 0, 'NO', 1, 'YES') implicit, t.position,
       t.owner, t.createTime, t.description,
       decode(sign(t.version - max.pv), -1, 'NO', 'YES') canRollbackTo,
       decode(t.is_implicit || decode(parent_vers.parent_version, null, 'NOT_EXISTS', 'EXISTS'), '1EXISTS', 'NO', 'YES') removable,
       t.version
from wmsys.wm$workspace_savepoints_table t,
     wmsys.all_workspaces_internal asi,
     (select max(parent_version) pv, parent_workspace pw from wmsys.wm$workspaces_table group by parent_workspace) max,
     (select unique parent_version from wmsys.wm$workspaces_table) parent_vers
where t.workspace = asi.workspace and
      t.workspace = max.pw (+) and
      t.version = parent_vers.parent_version (+)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."DBA_REMOVED_WORKSPACES" ("OWNER",
"WORKSPACE_NAME",
"WORKSPACE_ID",
"PARENT_WORKSPACE_NAME",
"PARENT_WORKSPACE_ID",
"CREATETIME",
"RETIRETIME",
"DESCRIPTION",
"MP_ROOT_WORKSPACE_ID",
"CONTINUALLY_REFRESHED") AS
  select owner, workspace_name, workspace_id, parent_workspace_name, parent_workspace_id,
       createtime, retiretime, description, mp_root_id mp_root_workspace_id, decode(rwt.isRefreshed, 1, 'YES', 'NO') continually_refreshed
from wmsys.wm$removed_workspaces_table rwt
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."CDB_REMOVED_WORKSPACES"  CONTAINER_DATA
 ("OWNER",
"WORKSPACE_NAME",
"WORKSPACE_ID",
"PARENT_WORKSPACE_NAME",
"PARENT_WORKSPACE_ID",
"CREATETIME",
"RETIRETIME",
"DESCRIPTION",
"MP_ROOT_WORKSPACE_ID",
"CONTINUALLY_REFRESHED",
"CON_ID") AS
  SELECT "OWNER","WORKSPACE_NAME","WORKSPACE_ID","PARENT_WORKSPACE_NAME","PARENT_WORKSPACE_ID","CREATETIME","RETIRETIME","DESCRIPTION","MP_ROOT_WORKSPACE_ID","CONTINUALLY_REFRESHED","CON_ID" FROM CONTAINERS("WMSYS"."DBA_REMOVED_WORKSPACES");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."DBA_WM_SYS_PRIVS" ("GRANTEE",
"PRIVILEGE",
"GRANTOR",
"GRANTABLE") AS
  select spt.grantee,
       decode(spt.priv,'A',  'ACCESS_WORKSPACE',
                       'C',  'CREATE_WORKSPACE',
                       'D',  'REMOVE_WORKSPACE',
                       'F',  'FREEZE_WORKSPACE',
                       'G',  'GRANTPRIV_WORKSPACE',
                       'M',  'MERGE_WORKSPACE',
                       'R',  'ROLLBACK_WORKSPACE',
                       'AA', 'ACCESS_ANY_WORKSPACE',
                       'CA', 'CREATE_ANY_WORKSPACE',
                       'DA', 'REMOVE_ANY_WORKSPACE',
                       'FA', 'FREEZE_ANY_WORKSPACE',
                       'GA', 'GRANTPRIV_ANY_WORKSPACE',
                       'MA', 'MERGE_ANY_WORKSPACE',
                       'RA', 'ROLLBACK_ANY_WORKSPACE',
                       'W',  'WM_ADMIN',
                             'UNKNOWN_PRIV') privilege,
       spt.grantor,
       decode(spt.admin, 0, 'NO', 1, 'YES') grantable
from wmsys.wm$workspace_priv_table spt
where spt.workspace is null
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."CDB_WM_SYS_PRIVS"  CONTAINER_DATA
 ("GRANTEE",
"PRIVILEGE",
"GRANTOR",
"GRANTABLE",
"CON_ID") AS
  SELECT "GRANTEE","PRIVILEGE","GRANTOR","GRANTABLE","CON_ID" FROM CONTAINERS("WMSYS"."DBA_WM_SYS_PRIVS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."DBA_WM_VERSIONED_TABLES" ("TABLE_NAME",
"OWNER",
"STATE",
"HISTORY",
"NOTIFICATION",
"NOTIFYWORKSPACES",
"CONFLICT",
"DIFF",
"VALIDTIME") AS
  select /*+ LEADING(t) */ t.table_name, t.owner,
       disabling_ver state,
       t.hist history,
       decode(t.notification, 0, 'NO', 1, 'YES') notification,
       substr(notifyWorkspaces,2,length(notifyworkspaces)-2) notifyworkspaces,
       wmsys.ltadm.AreThereConflicts(t.owner, t.table_name) conflict,
       wmsys.ltadm.AreThereDiffs(t.owner, t.table_name) diff,
       decode(t.validtime, 0, 'NO', 1, 'YES') validtime
from wmsys.wm$versioned_tables t, dba_views u
where t.table_name = u.view_name and t.owner = u.owner
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."CDB_WM_VERSIONED_TABLES"  CONTAINER_DATA
 ("TABLE_NAME",
"OWNER",
"STATE",
"HISTORY",
"NOTIFICATION",
"NOTIFYWORKSPACES",
"CONFLICT",
"DIFF",
"VALIDTIME",
"CON_ID") AS
  SELECT "TABLE_NAME","OWNER","STATE","HISTORY","NOTIFICATION","NOTIFYWORKSPACES","CONFLICT","DIFF","VALIDTIME","CON_ID" FROM CONTAINERS("WMSYS"."DBA_WM_VERSIONED_TABLES");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."DBA_WM_VT_ERRORS" ("OWNER",
"TABLE_NAME",
"STATE",
"SQL_STR",
"STATUS",
"ERROR_MSG") AS
  select decode(vt.owner, 'WMSYS', null, vt.owner) owner,
       decode(vt.owner, 'WMSYS', null, vt.table_name) table_name,
       decode(vt.owner, 'WMSYS', decode(vt.index_type, 10, 'DROP USER COMMAND', 11, 'EXPORT', 12, 'IMPORT', 'UNKNOWN OPERATION'), vt.state) state,
       vt.sql_str, et.status, et.error_msg
from (select t1.owner, t1.table_name, t1.disabling_ver state, nt.index_type, nt.index_field, dbms_lob.substr(nt.sql_str,4000, 1) sql_str
      from wmsys.wm$versioned_tables$h t1, table(t1.undo_code) nt) vt,
      wmsys.wm$vt_errors_table et
where (vt.state<>'HIDDEN' or vt.table_name in ('WM$IMP_EXP', 'WM$LOG_TABLE')) and
      vt.owner = et.owner and
      vt.table_name = et.table_name and
      vt.index_type = et.index_type and
      vt.index_field = et.index_field
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."CDB_WM_VT_ERRORS"  CONTAINER_DATA
 ("OWNER",
"TABLE_NAME",
"STATE",
"SQL_STR",
"STATUS",
"ERROR_MSG",
"CON_ID") AS
  SELECT "OWNER","TABLE_NAME","STATE","SQL_STR","STATUS","ERROR_MSG","CON_ID" FROM CONTAINERS("WMSYS"."DBA_WM_VT_ERRORS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."DBA_WORKSPACE_PRIVS" ("GRANTEE",
"WORKSPACE",
"PRIVILEGE",
"GRANTOR",
"GRANTABLE") AS
  select spt.grantee,
       spt.workspace,
       decode(spt.priv,'A',  'ACCESS_WORKSPACE',
                       'C',  'CREATE_WORKSPACE',
                       'D',  'REMOVE_WORKSPACE',
                       'F',  'FREEZE_WORKSPACE',
                       'G',  'GRANTPRIV_WORKSPACE',
                       'M',  'MERGE_WORKSPACE',
                       'R',  'ROLLBACK_WORKSPACE',
                       'AA', 'ACCESS_ANY_WORKSPACE',
                       'CA', 'CREATE_ANY_WORKSPACE',
                       'DA', 'REMOVE_ANY_WORKSPACE',
                       'FA', 'FREEZE_ANY_WORKSPACE',
                       'GA', 'GRANTPRIV_ANY_WORKSPACE',
                       'MA', 'MERGE_ANY_WORKSPACE',
                       'RA', 'ROLLBACK_ANY_WORKSPACE',
                       'W',  'WM_ADMIN',
                             'UNKNOWN_PRIV') privilege,
       spt.grantor,
       decode(spt.admin, 0, 'NO', 1, 'YES') grantable
from wmsys.wm$workspaces_table alt, wmsys.wm$workspace_priv_table spt
where alt.workspace = spt.workspace
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."CDB_WORKSPACE_PRIVS"  CONTAINER_DATA
 ("GRANTEE",
"WORKSPACE",
"PRIVILEGE",
"GRANTOR",
"GRANTABLE",
"CON_ID") AS
  SELECT "GRANTEE","WORKSPACE","PRIVILEGE","GRANTOR","GRANTABLE","CON_ID" FROM CONTAINERS("WMSYS"."DBA_WORKSPACE_PRIVS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."DBA_WORKSPACE_SAVEPOINTS" ("SAVEPOINT",
"WORKSPACE",
"IMPLICIT",
"POSITION",
"OWNER",
"CREATETIME",
"DESCRIPTION",
"CANROLLBACKTO",
"REMOVABLE",
"VERSION") AS
  select t.savepoint, t.workspace,
       decode(t.is_implicit, 0, 'NO', 1, 'YES') implicit, t.position,
       t.owner, t.createTime, t.description,
       decode(sign(t.version - max.pv), -1, 'NO', 'YES') canRollbackTo,
       decode(t.is_implicit || decode(parent_vers.parent_version, null, 'NOT_EXISTS', 'EXISTS'), '1EXISTS','NO','YES') removable,
       t.version
from wmsys.wm$workspace_savepoints_table t, wmsys.wm$workspaces_table asi,
     (select max(parent_version) pv, parent_workspace pw from wmsys.wm$workspaces_table group by parent_workspace) max,
     (select unique parent_version from wmsys.wm$workspaces_table) parent_vers
where t.workspace = asi.workspace and
      t.workspace = max.pw (+) and
      t.version = parent_vers.parent_version (+)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."CDB_WORKSPACE_SAVEPOINTS"  CONTAINER_DATA
 ("SAVEPOINT",
"WORKSPACE",
"IMPLICIT",
"POSITION",
"OWNER",
"CREATETIME",
"DESCRIPTION",
"CANROLLBACKTO",
"REMOVABLE",
"VERSION",
"CON_ID") AS
  SELECT "SAVEPOINT","WORKSPACE","IMPLICIT","POSITION","OWNER","CREATETIME","DESCRIPTION","CANROLLBACKTO","REMOVABLE","VERSION","CON_ID" FROM CONTAINERS("WMSYS"."DBA_WORKSPACE_SAVEPOINTS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."DBA_WORKSPACE_SESSIONS" ("USERNAME",
"WORKSPACE",
"SID",
"STATUS",
"ISIMPLICIT") AS
  select sut.username, sut.workspace, sut.sid, decode(t.ses_addr, null, 'INACTIVE', 'ACTIVE') status, decode(isImplicit, 1, 'YES', 'NO') isImplicit
from wmsys.wm$workspace_sessions_view sut, gv$transaction t
where sut.lockMode = 'S' and sut.inst_id = t.inst_id(+) and sut.saddr = t.ses_addr(+)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."CDB_WORKSPACE_SESSIONS"  CONTAINER_DATA
 ("USERNAME",
"WORKSPACE",
"SID",
"STATUS",
"ISIMPLICIT",
"CON_ID") AS
  SELECT "USERNAME","WORKSPACE","SID","STATUS","ISIMPLICIT","CON_ID" FROM CONTAINERS("WMSYS"."DBA_WORKSPACE_SESSIONS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."DBA_WORKSPACES" ("WORKSPACE",
"WORKSPACE_ID",
"PARENT_WORKSPACE",
"PARENT_SAVEPOINT",
"OWNER",
"CREATETIME",
"DESCRIPTION",
"FREEZE_STATUS",
"FREEZE_MODE",
"FREEZE_WRITER",
"SID",
"SERIAL#",
"INST_ID",
"FREEZE_OWNER",
"SESSION_DURATION",
"CURRENT_SESSION",
"RESOLVE_STATUS",
"RESOLVE_USER",
"MP_ROOT_WORKSPACE") AS
  select asp.workspace, asp.workspace_lock_id workspace_id, asp.parent_workspace, ssp.savepoint parent_savepoint,
       asp.owner, asp.createTime, asp.description,
       decode(asp.freeze_status,'LOCKED','FROZEN', 'UNLOCKED','UNFROZEN') freeze_status,
       decode(asp.oper_status, null, asp.freeze_mode,'INTERNAL') freeze_mode,
       decode(asp.freeze_mode, '1WRITER_SESSION', s.username, asp.freeze_writer) freeze_writer,
       to_number(decode(asp.freeze_mode, '1WRITER_SESSION', substr(asp.freeze_writer, 1, instr(asp.freeze_writer, ',')-1), null)) sid,
       to_number(decode(asp.freeze_mode, '1WRITER_SESSION', substr(asp.freeze_owner, instr(asp.freeze_owner, ',')+1,
                                                                   instr(asp.freeze_owner, ',',1,2)-instr(asp.freeze_owner, ',')-1), null)) serial#,
       to_number(decode(asp.freeze_mode, '1WRITER_SESSION', substr(asp.freeze_writer, instr(asp.freeze_writer, ',', 1, 2)+1), null)) inst_id,
       decode(asp.session_duration, 0, asp.freeze_owner, s.username) freeze_owner,
       decode(asp.freeze_status, 'UNLOCKED', null, decode(asp.session_duration, 1, 'YES', 'NO')) session_duration,
       decode(asp.session_duration, 1,
              decode((select 1 from sys.dual
                      where s.sid = sys_context('lt_ctx', 'cid') and
                            s.serial# = sys_context('lt_ctx', 'serial#') and
                            s.inst_id = dbms_utility.current_instance),
                     1, 'YES', 'NO'),
              null) current_session,
       decode(rst.workspace,null,'INACTIVE','ACTIVE') resolve_status,
       rst.resolve_user,
       mp_root mp_root_workspace
from   wmsys.wm$workspaces_table asp, wmsys.wm$workspace_savepoints_table ssp,
       wmsys.wm$resolve_workspaces_table rst, gv$session s
where  asp.parent_version = ssp.version (+) and
       nvl(ssp.is_implicit,1) = 1 and
       asp.workspace = rst.workspace (+) and
       to_char(s.sid(+)) = substr(asp.freeze_owner, 1, instr(asp.freeze_owner, ',')-1)  and
       to_char(s.serial#(+)) = substr(asp.freeze_owner, instr(asp.freeze_owner, ',')+1, instr(asp.freeze_owner, ',',1,2)-instr(asp.freeze_owner, ',')-1) and
       to_char(s.inst_id(+)) = substr(asp.freeze_owner, instr(asp.freeze_owner, ',', 1, 2)+1)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."CDB_WORKSPACES"  CONTAINER_DATA
 ("WORKSPACE",
"WORKSPACE_ID",
"PARENT_WORKSPACE",
"PARENT_SAVEPOINT",
"OWNER",
"CREATETIME",
"DESCRIPTION",
"FREEZE_STATUS",
"FREEZE_MODE",
"FREEZE_WRITER",
"SID",
"SERIAL#",
"INST_ID",
"FREEZE_OWNER",
"SESSION_DURATION",
"CURRENT_SESSION",
"RESOLVE_STATUS",
"RESOLVE_USER",
"MP_ROOT_WORKSPACE",
"CON_ID") AS
  SELECT "WORKSPACE","WORKSPACE_ID","PARENT_WORKSPACE","PARENT_SAVEPOINT","OWNER","CREATETIME","DESCRIPTION","FREEZE_STATUS","FREEZE_MODE","FREEZE_WRITER","SID","SERIAL#","INST_ID","FREEZE_OWNER","SESSION_DURATION","CURRENT_SESSION","RESOLVE_STATUS","RESOLVE_USER","MP_ROOT_WORKSPACE","CON_ID" FROM CONTAINERS("WMSYS"."DBA_WORKSPACES");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."ROLE_WM_PRIVS" ("ROLE",
"WORKSPACE",
"PRIVILEGE",
"GRANTABLE") AS
  select grantee role,
       workspace,
       decode(priv,'A',  'ACCESS_WORKSPACE',
                   'C',  'CREATE_WORKSPACE',
                   'D',  'REMOVE_WORKSPACE',
                   'F',  'FREEZE_WORKSPACE',
                   'G',  'GRANTPRIV_WORKSPACE',
                   'M',  'MERGE_WORKSPACE',
                   'R',  'ROLLBACK_WORKSPACE',
                   'AA', 'ACCESS_ANY_WORKSPACE',
                   'CA', 'CREATE_ANY_WORKSPACE',
                   'DA', 'REMOVE_ANY_WORKSPACE',
                   'FA', 'FREEZE_ANY_WORKSPACE',
                   'GA', 'GRANTPRIV_ANY_WORKSPACE',
                   'MA', 'MERGE_ANY_WORKSPACE',
                   'RA', 'ROLLBACK_ANY_WORKSPACE',
                   'W',  'WM_ADMIN',
                         'UNKNOWN_PRIV') privilege,
       decode(admin, 0, 'NO', 1, 'YES') grantable
from wmsys.wm$workspace_priv_table
where grantee in (select role from session_roles
                 union all
                  select 'WM_ADMIN_ROLE' from sys.dual where sys_context('userenv', 'current_user') = 'SYS')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_MP_GRAPH_WORKSPACES" ("MP_LEAF_WORKSPACE",
"GRAPH_WORKSPACE",
"GRAPH_FLAG") AS
  select mpg.mp_leaf_workspace, mpg.mp_graph_workspace graph_workspace,
       decode(mpg.mp_graph_flag,'R', 'ROOT_WORKSPACE', 'I', 'INTERMEDIATE_WORKSPACE', 'L', 'LEAF_WORKSPACE') graph_flag
from wmsys.wm$mp_graph_workspaces_table mpg, wmsys.user_workspaces uw
where mpg.mp_leaf_workspace = uw.workspace
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_MP_PARENT_WORKSPACES" ("MP_LEAF_WORKSPACE",
"PARENT_WORKSPACE",
"CREATOR",
"CREATETIME",
"ISREFRESHED",
"PARENT_FLAG") AS
  select mp.workspace mp_leaf_workspace,mp.parent_workspace,mp.creator,mp.createtime,
       decode(mp.isRefreshed,0,'NO','YES') IsRefreshed, decode(mp.parent_flag, 'DP', 'DEFAULT_PARENT', 'ADDITIONAL_PARENT') parent_flag
from wmsys.wm$mp_parent_workspaces_table mp, wmsys.user_workspaces uw
where mp.workspace = uw.workspace
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_REMOVED_WORKSPACES" ("OWNER",
"WORKSPACE_NAME",
"WORKSPACE_ID",
"PARENT_WORKSPACE_NAME",
"PARENT_WORKSPACE_ID",
"CREATETIME",
"RETIRETIME",
"DESCRIPTION",
"MP_ROOT_WORKSPACE_ID",
"CONTINUALLY_REFRESHED") AS
  select owner, workspace_name, workspace_id, parent_workspace_name, parent_workspace_id,
       createtime, retiretime, description, mp_root_id mp_root_workspace_id, decode(rwt.isRefreshed, 1, 'YES', 'NO') continually_refreshed
from wmsys.wm$removed_workspaces_table rwt
where rwt.owner = sys_context('userenv', 'current_user')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_WM_CONS_COLUMNS" ("OWNER",
"CONSTRAINT_NAME",
"TABLE_NAME",
"COLUMN_NAME",
"POSITION") AS
  select /*+ LEADING(t1) */ t1.owner, t1.constraint_name, t1.table_name, t1.column_name, t1.position
from wmsys.wm$cons_columns t1, user_views t2
where t1.owner = sys_context('userenv', 'current_user') and
      t1.table_name = t2.view_name
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_WM_CONSTRAINTS" ("CONSTRAINT_NAME",
"CONSTRAINT_TYPE",
"TABLE_NAME",
"SEARCH_CONDITION",
"STATUS",
"INDEX_OWNER",
"INDEX_NAME",
"INDEX_TYPE") AS
  select /*+ LEADING(ct) */ constraint_name, constraint_type, table_name, search_condition, status, index_owner, index_name, index_type
from wmsys.wm$constraints_table ct, user_views uv
where ct.owner = sys_context('userenv', 'current_user') and
      ct.table_name = uv.view_name
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_WM_IND_COLUMNS" ("INDEX_NAME",
"TABLE_NAME",
"COLUMN_NAME",
"COLUMN_POSITION",
"COLUMN_LENGTH",
"DESCEND") AS
  select /*+ LEADING(t1) */ t2.index_name, t1.table_name, t2.column_name, t2.column_position, t2.column_length, t2.descend
 from wmsys.wm$constraints_table t1, user_ind_columns t2
 where t1.index_owner = sys_context('userenv', 'current_user') and
       t1.index_name = t2.index_name and
       t1.constraint_type not in ('P', 'PN', 'PU')
union
 select /*+ LEADING(t1) */ t2.index_name, t1.table_name, t2.column_name, t2.column_position-1, t2.column_length, t2.descend
 from wmsys.wm$constraints_table t1, user_ind_columns t2
 where t1.index_owner = sys_context('userenv', 'current_user') and
       t1.index_name = t2.index_name and
       t1.constraint_type in ('P', 'PN', 'PU') and
       t2.column_name not in ('WM_VERSION','WM_DELSTATUS')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_WM_IND_EXPRESSIONS" ("INDEX_NAME",
"TABLE_NAME",
"COLUMN_EXPRESSION",
"COLUMN_POSITION") AS
  select /*+ LEADING(t1) */ t2.index_name, t1.table_name, t2.column_expression, t2.column_position
from wmsys.wm$constraints_table t1, user_ind_expressions t2
where t1.index_owner = sys_context('userenv', 'current_user') and
      t1.index_name = t2.index_name
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_WM_LOCKED_TABLES" ("TABLE_OWNER",
"TABLE_NAME",
"LOCK_MODE",
"LOCK_OWNER",
"LOCKING_STATE") AS
  select t.owner table_owner, t.table_name, t.Lock_mode, t.Lock_owner, t.Locking_state
from wmsys.wm$all_locks_view t
where t.owner = sys_context('userenv', 'current_user')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_WM_MODIFIED_TABLES" ("TABLE_NAME",
"WORKSPACE",
"SAVEPOINT") AS
  select table_name, workspace, savepoint
from
      (select distinct o.table_name, o.workspace,
              nvl(s.savepoint, 'LATEST') savepoint,
              min(s.is_implicit) imp, count(s.version) counter
      from wmsys.wm$modified_tables o, wmsys.wm$workspace_savepoints_table s
      where substr(o.table_name, 1, instr(table_name,'.')-1) = sys_context('userenv', 'current_user') and
            o.version = s.version (+)
      group by o.table_name, o.workspace, savepoint)
where (imp = 0 or imp is null or counter = 1)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_WM_POLICIES" ("OBJECT_NAME",
"POLICY_GROUP",
"POLICY_NAME",
"PF_OWNER",
"PACKAGE",
"FUNCTION",
"SEL",
"INS",
"UPD",
"DEL",
"IDX",
"CHK_OPTION",
"ENABLE",
"STATIC_POLICY",
"POLICY_TYPE",
"LONG_PREDICATE") AS
  select object_name, policy_group, policy_name, pf_owner, package, function, sel, ins, upd, del, idx,
       chk_option, enable, static_policy, policy_type, long_predicate
from wmsys.all_wm_policies
where object_owner = sys_context('userenv', 'current_user')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_WM_RIC_INFO" ("CT_OWNER",
"CT_NAME",
"PT_OWNER",
"PT_NAME",
"RIC_NAME",
"CT_COLS",
"PT_COLS",
"R_CONSTRAINT_NAME",
"DELETE_RULE",
"STATUS") AS
  select ct_owner, ct_name, pt_owner, pt_name, ric_name, rtrim(ct_cols,',') ct_cols, rtrim(pt_cols,',') pt_cols,
       pt_unique_const_name r_constraint_name, my_mode delete_rule, status
from wmsys.wm$ric_table rt, user_views uv
where uv.view_name = rt.ct_name and
      rt.ct_owner = sys_context('userenv', 'current_user')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_WM_TAB_TRIGGERS" ("TRIGGER_NAME",
"TABLE_OWNER",
"TABLE_NAME",
"TRIGGER_TYPE",
"STATUS",
"WHEN_CLAUSE",
"DESCRIPTION",
"TRIGGER_BODY",
"TAB_MERGE_WO_REMOVE",
"TAB_MERGE_W_REMOVE",
"WSPC_MERGE_WO_REMOVE",
"WSPC_MERGE_W_REMOVE",
"DML",
"TABLE_IMPORT") AS
  select trig_name trigger_name,
       table_owner_name table_owner,
       table_name,
       wmsys.ltUtil.getTrigTypes(trig_flag) trigger_type,
       status,
       when_clause,
       description,
       trig_code trigger_body,
       decode(bitand(event_flag, 32768), 0, 'OFF', 'ON') tab_merge_wo_remove,
       decode(bitand(event_flag, 65536), 0, 'OFF', 'ON') tab_merge_w_remove,
       decode(bitand(event_flag, 131072), 0, 'OFF', 'ON') wspc_merge_wo_remove,
       decode(bitand(event_flag, 262144), 0, 'OFF', 'ON') wspc_merge_w_remove,
       decode(bitand(event_flag, 524288), 0, 'OFF', 'ON') dml,
       decode(bitand(event_flag, 33554432), 0, 'OFF', 'ON') table_import
from wmsys.wm$udtrig_info
where trig_owner_name = sys_context('userenv', 'current_user') and
      internal_type = 'USER_DEFINED'
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_WM_VERSIONED_TABLES" ("TABLE_NAME",
"OWNER",
"STATE",
"HISTORY",
"NOTIFICATION",
"NOTIFYWORKSPACES",
"CONFLICT",
"DIFF",
"VALIDTIME") AS
  select t.table_name, t.owner,
       disabling_ver state,
       t.hist history,
       decode(t.notification, 0, 'NO', 1, 'YES') notification,
       substr(notifyWorkspaces,2,length(notifyworkspaces)-2) notifyworkspaces,
       wmsys.ltadm.AreThereConflicts(t.owner, t.table_name) conflict,
       wmsys.ltadm.AreThereDiffs(t.owner, t.table_name) diff,
       decode(t.validtime, 0, 'NO', 1, 'YES') validtime
from wmsys.wm$versioned_tables t
where t.owner = sys_context('userenv', 'current_user')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_WM_VT_ERRORS" ("OWNER",
"TABLE_NAME",
"STATE",
"SQL_STR",
"STATUS",
"ERROR_MSG") AS
  select vt.owner,vt.table_name,vt.state,vt.sql_str,et.status,et.error_msg
from (select t1.owner, t1.table_name, t1.disabling_ver state, nt.index_type, nt.index_field, dbms_lob.substr(nt.sql_str,4000,1) sql_str
      from wmsys.wm$versioned_tables t1, table(t1.undo_code) nt) vt,
     wmsys.wm$vt_errors_table et
where vt.owner = et.owner and
      vt.table_name = et.table_name and
      vt.index_type = et.index_type and
      vt.index_field = et.index_field and
      vt.owner = sys_context('userenv', 'current_user')
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_WORKSPACE_PRIVS" ("GRANTEE",
"WORKSPACE",
"PRIVILEGE",
"GRANTOR",
"GRANTABLE") AS
  select spt.grantee,
       spt.workspace,
       decode(spt.priv,'A',  'ACCESS_WORKSPACE',
                       'C',  'CREATE_WORKSPACE',
                       'D',  'REMOVE_WORKSPACE',
                       'F',  'FREEZE_WORKSPACE',
                       'G',  'GRANTPRIV_WORKSPACE',
                       'M',  'MERGE_WORKSPACE',
                       'R',  'ROLLBACK_WORKSPACE',
                       'AA', 'ACCESS_ANY_WORKSPACE',
                       'CA', 'CREATE_ANY_WORKSPACE',
                       'DA', 'REMOVE_ANY_WORKSPACE',
                       'FA', 'FREEZE_ANY_WORKSPACE',
                       'GA', 'GRANTPRIV_ANY_WORKSPACE',
                       'MA', 'MERGE_ANY_WORKSPACE',
                       'RA', 'ROLLBACK_ANY_WORKSPACE',
                       'W',  'WM_ADMIN',
                             'UNKNOWN_PRIV') privilege,
       spt.grantor,
       decode(spt.admin, 0, 'NO', 1, 'YES') grantable
from user_workspaces ult, wmsys.wm$workspace_priv_table spt
where ult.workspace = spt.workspace
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."USER_WORKSPACE_SAVEPOINTS" ("SAVEPOINT",
"WORKSPACE",
"IMPLICIT",
"POSITION",
"OWNER",
"CREATETIME",
"DESCRIPTION",
"CANROLLBACKTO",
"REMOVABLE",
"VERSION") AS
  select t.savepoint, t.workspace,
       decode(t.is_implicit, 0, 'NO', 1, 'YES') implicit, t.position,
       t.owner, t.createTime, t.description,
       decode(sign(t.version - max.pv), -1, 'NO', 'YES') canRollbackTo,
       decode(t.is_implicit || decode(parent_vers.parent_version, null, 'NOT_EXISTS', 'EXISTS'), '1EXISTS', 'NO', 'YES') removable,
       t.version
from wmsys.wm$workspace_savepoints_table t, wmsys.wm$workspaces_table u,
     (select max(parent_version) pv, parent_workspace pw from wmsys.wm$workspaces_table group by parent_workspace) max,
     (select unique parent_version from wmsys.wm$workspaces_table) parent_vers
where t.workspace = u.workspace and
      u.owner = sys_context('userenv', 'current_user') and
      t.workspace = max.pw (+) and
      t.version = parent_vers.parent_version (+)
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM_COMPRESS_BATCH_SIZES" ("OWNER",
"TABLE_NAME",
"BATCH_SIZE",
"NUM_BATCHES") AS
  select /*+ RULE */ vt.owner, vt.table_name,
       decode(dt.data_type,
              'CHAR',decode(dt.num_buckets,null,'TABLE',0,'TABLE',1,'TABLE','TABLE/PRIMARY_KEY_RANGE'),
              'VARCHAR2',decode(dt.num_buckets,null,'TABLE',0,'TABLE',1,'TABLE','TABLE/PRIMARY_KEY_RANGE'),
              'NUMBER',decode(dt.num_buckets,null,'TABLE',0,'TABLE','TABLE/PRIMARY_KEY_RANGE'),
              'DATE',decode(dt.num_buckets,null,'TABLE',0,'TABLE','TABLE/PRIMARY_KEY_RANGE'),
              'TIMESTAMP',decode(dt.num_buckets,null,'TABLE',0,'TABLE','TABLE/PRIMARY_KEY_RANGE'),
              'TABLE') batch_size,
       decode(dt.data_type,
              'CHAR',decode(dt.num_buckets,null,1,0,1,1,1,dt.num_buckets),
              'VARCHAR2',decode(dt.num_buckets,null,1,0,1,1,1,dt.num_buckets),
              'NUMBER',decode(dt.num_buckets,null,1,0,1,1,(wmsys.ltadm.GetSystemParameter('NUMBER_OF_COMPRESS_BATCHES')),dt.num_buckets),
              'DATE',decode(dt.num_buckets,null,1,0,1,1,(wmsys.ltadm.GetSystemParameter('NUMBER_OF_COMPRESS_BATCHES')),dt.num_buckets),
              'TIMESTAMP',decode(dt.num_buckets,null,1,0,1,1,(wmsys.ltadm.GetSystemParameter('NUMBER_OF_COMPRESS_BATCHES')),dt.num_buckets),
              1) num_batches
from wmsys.wm$versioned_tables vt, dba_ind_columns di, dba_tab_columns dt
where di.table_owner = vt.owner and
      di.table_name = vt.table_name || '_LT' and
      di.index_name = vt.table_name || '_PKI$' and
      di.column_position = 1 and
      dt.owner = vt.owner and
      dt.table_name = vt.table_name || '_LT' and
      dt.column_name = di.column_name
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM_COMPRESSIBLE_TABLES" ("OWNER",
"TABLE_NAME",
"WORKSPACE",
"BEGIN_SAVEPOINT",
"END_SAVEPOINT") AS
  select vt.owner, vt.table_name,
        sys_context('lt_ctx','compress_workspace') workspace,
        sys_context('lt_ctx','compress_beginsp') begin_savepoint,
        sys_context('lt_ctx','compress_endsp') end_savepoint
 from wmsys.wm$versioned_tables vt
 where exists
      (select 1
       from wmsys.wm$modified_tables mt
       where mt.table_name = vt.owner || '.' || vt.table_name and
             mt.workspace = sys_context('lt_ctx','compress_workspace') and
             mt.version > sys_context('lt_ctx','compress_beginver') and
             mt.version <= sys_context('lt_ctx','compress_endver') and
             substr(vt.hist,1,17) != 'VIEW_WO_OVERWRITE' and
             mt.version in
               (select v.version
                from wmsys.wm$version_hierarchy_table v,
                     (select w1.beginver, w2.endver
                      from (select rownum rn,beginver
                            from (select distinct beginver
                                  from (select to_number(sys_context('lt_ctx','compress_beginver')) beginver
                                        from sys.dual
                                        where not exists
                                             (select parent_version
                                              from wmsys.wm$workspaces_table
                                              where parent_workspace = sys_context('lt_ctx','compress_workspace') and
                                                    to_number(sys_context('lt_ctx','compress_beginver')) = parent_version
                                             )
                                       union all
                                        select min(version) beginver
                                        from wmsys.wm$version_hierarchy_table,
                                             (select distinct parent_version
                                              from wmsys.wm$workspaces_table
                                              where parent_workspace = sys_context('lt_ctx','compress_workspace') and
                                                    parent_version >= sys_context('lt_ctx','compress_beginver') and
                                                    parent_version < sys_context('lt_ctx','compress_endver')) pv
                                        where workspace = sys_context('lt_ctx','compress_workspace') and
                                              version > pv.parent_version
                                        group by (pv.parent_version)
                                       )
                                  order by beginver
                                 )
                           ) w1,
                          (select rownum rn, endver
                           from (select distinct endver
                                 from (select parent_version endver
                                       from wmsys.wm$workspaces_table
                                       where parent_workspace = sys_context('lt_ctx','compress_workspace') and
                                             parent_version > sys_context('lt_ctx','compress_beginver') and
                                             parent_version <= sys_context('lt_ctx','compress_endver')
                                      union all
                                       select to_number(sys_context('lt_ctx','compress_endver')) endver
                                       from sys.dual
                                      )
                                 order by endver
                                )
                          ) w2
                      where w1.rn = w2.rn and
                            w2.endver > w1.beginver
                     ) p
                where v.workspace = sys_context('lt_ctx','compress_workspace') and
                      v.version > p.beginver and
                      v.version <= p.endver
               )
      union all
       select 1
       from wmsys.wm$modified_tables mt
       where mt.table_name = vt.owner || '.' || vt.table_name and
             mt.workspace = sys_context('lt_ctx','compress_workspace') and
             mt.version >= sys_context('lt_ctx','compress_beginver') and
             mt.version <= sys_context('lt_ctx','compress_endver') and
             substr(vt.hist,1,17) = 'VIEW_WO_OVERWRITE'
      )
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM_EVENTS_INFO" ("EVENT_NAME",
"CAPTURE") AS
  select event_name, capture
from wmsys.wm$events_info
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM_INSTALLATION" ("NAME",
"VALUE") AS
  select name, value
 from wmsys.wm$env_vars
 where hidden = 0
union
 select name, value
 from wmsys.wm$sysparam_all_values sv
 where isdefault = 'YES' and
       hidden = 0 and
       not exists (select 1 from wmsys.wm$env_vars ev where ev.name = sv.name)
union
 select 'OWM_VERSION', version from dba_registry where comp_id='OWM'
WITH READ ONLY ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "WMSYS"."WM_REPLICATION_INFO" ("GROUPNAME",
"WRITERSITE") AS
  select groupName, masterdefsite writerSite
from wmsys.wm$replication_table
WITH READ ONLY ;

