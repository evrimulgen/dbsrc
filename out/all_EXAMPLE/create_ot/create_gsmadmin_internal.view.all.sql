-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "GSMADMIN_INTERNAL"."AQ$CHANGE_LOG_QUEUE_TABLE_S" ("QUEUE",
"NAME",
"ADDRESS",
"PROTOCOL",
"TRANSFORMATION",
"QUEUE_TO_QUEUE") AS
  SELECT queue_name QUEUE, name NAME , address ADDRESS , protocol PROTOCOL, trans_name TRANSFORMATION, decode(bitand(SUBSCRIBER_TYPE, 512), 512, 'TRUE', 'FALSE') QUEUE_TO_QUEUE  FROM "AQ$_CHANGE_LOG_QUEUE_TABLE_S" s  WHERE (bitand(s.subscriber_type, 1) = 1)  WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "GSMADMIN_INTERNAL"."AQ$CHANGE_LOG_QUEUE_TABLE" ("QUEUE",
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
					  s.name) CONSUMER_NAME,  s.address ADDRESS,  s.protocol PROTOCOL  FROM "CHANGE_LOG_QUEUE_TABLE" qt, "AQ$_CHANGE_LOG_QUEUE_TABLE_H" h LEFT OUTER JOIN  (SELECT fv.MSGID MSGID, fv.SUBSCRIBER# SUBSCRIBER#, fv.NAME NAME, 0 ADDRESS#, fv.DEQUEUE_TIME DEQUEUE_TIME,fv.TRANSACTION_ID TRANSACTION_ID, fv.DEQUEUE_USER DEQUEUE_USER, fv.FLAGS FLAGS FROM AQ$_UNFLUSHED_DEQUEUES fv WHERE fv.QTOBJNO = 19714 union select dl.MSGID MSGID, dl.SUBSCRIBER# SUBSCRIBER#, dl.NAME NAME, dl.ADDRESS# ADDRESS#, dl.DEQUEUE_TIME DEQUEUE_TIME, dl.TRANSACTION_ID TRANSACTION_ID, dl.DEQUEUE_USER DEQUEUE_USER, dl.FLAGS FLAGS from "GSMADMIN_INTERNAL"."AQ$_CHANGE_LOG_QUEUE_TABLE_L" dl )  l  ON h.msgid = l.msgid AND h.subscriber# = l.subscriber# AND h.name = l.name AND h.address# = l.address#, "AQ$_CHANGE_LOG_QUEUE_TABLE_S" s  WHERE  qt.msgid = h.msgid AND  ((h.subscriber# != 0 AND h.subscriber# = s.subscriber_id)  OR (h.subscriber# = 0 AND h.address# = s.subscriber_id)) AND (qt.state != 7 OR   qt.state != 9 )     WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "GSMADMIN_INTERNAL"."AQ$_CHANGE_LOG_QUEUE_TABLE_F" ("Q_NAME",
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
  SELECT  /*+ NO_MERGE (qo) USE_NL(iot) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA, qt.sender_name SENDER_NAME, qt.sender_address SENDER_ADDRESS, qt.sender_protocol SENDER_PROTOCOL, qt.dequeue_msgid DEQUEUE_MSGID, 'PERSISTENT' DELIVERY_MODE, 0 SEQUENCE_NUM, 0 MSG_NUM, qo.qid QUEUE_ID, qt.user_prop USER_PROP, iot.subscriber# SUBSCRIBER_ID, iot.name SUBSCRIBER_NAME, iot.queue# QUEUE_EVTID FROM "CHANGE_LOG_QUEUE_TABLE" qt, "AQ$_CHANGE_LOG_QUEUE_TABLE_I" iot, SYS.ALL_INT_DEQUEUE_QUEUES qo WHERE qt.msgid=iot.msgid  and qt.q_name = qo.name  AND qo.owner = 'GSMADMIN_INTERNAL' AND iot.msg_enq_time = qt.enq_time AND  iot.msg_step_no = qt.step_no AND iot.msg_local_order_no = qt.local_order_no AND   iot.msg_chain_no = qt.chain_no  WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "GSMADMIN_INTERNAL"."AQ$CHANGE_LOG_QUEUE_TABLE_R" ("QUEUE",
"NAME",
"ADDRESS",
"PROTOCOL",
"RULE",
"RULE_SET",
"TRANSFORMATION") AS
  SELECT queue_name QUEUE, s.name NAME , address ADDRESS , protocol PROTOCOL, rule_condition RULE, ruleset_name RULE_SET, trans_name TRANSFORMATION  FROM "AQ$_CHANGE_LOG_QUEUE_TABLE_S" s , sys.all_rules r WHERE (bitand(s.subscriber_type, 1) = 1) AND s.rule_name = r.rule_name and r.rule_owner = 'GSMADMIN_INTERNAL'  WITH READ ONLY;

