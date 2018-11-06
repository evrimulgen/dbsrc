CREATE USER "IX" IDENTIFIED BY VALUES 'S:B7B2C76E34BC396CAD685E4FED02FC122ABB07D17D106C83A515C41B9E7F;H:EAD97E5D3D1A1D0672C011B1C5A2B35D;T:492F4C093A8D11BEA066759F8D5DA9E1E7076DF44DAAFC08469D501B3C5E3C349D937F3D6E121840F0B4BE7ABD145C3301B152C663A86D7282F47FC30C54783EB7CB16E4BECA548009839FB527AAC6A5;2BE6F80744E08FEB'
      DEFAULT TABLESPACE "USERS"
      TEMPORARY TABLESPACE "TEMP"
      PASSWORD EXPIRE
      ACCOUNT LOCK;

GRANT SELECT ANY DICTIONARY TO "IX";
GRANT CREATE INDEXTYPE TO "IX";
GRANT CREATE OPERATOR TO "IX";
GRANT CREATE TYPE TO "IX";
GRANT CREATE TRIGGER TO "IX";
GRANT CREATE PROCEDURE TO "IX";
GRANT CREATE DATABASE LINK TO "IX";
GRANT CREATE SEQUENCE TO "IX";
GRANT CREATE VIEW TO "IX";
GRANT CREATE SYNONYM TO "IX";
GRANT CREATE CLUSTER TO "IX";
GRANT CREATE TABLE TO "IX";
GRANT UNLIMITED TABLESPACE TO "IX";
GRANT ALTER SESSION TO "IX";
GRANT CREATE SESSION TO "IX";
GRANT "CONNECT" TO "IX";
GRANT "RESOURCE" TO "IX";
GRANT "AQ_ADMINISTRATOR_ROLE" TO "IX";
GRANT "AQ_USER_ROLE" TO "IX";
GRANT "SELECT_CATALOG_ROLE" TO "IX";
ALTER USER "IX" DEFAULT ROLE ALL;
CREATE SEQUENCE  "IX"."AQ$_ORDERS_QUEUETABLE_N"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "IX"."AQ$_STREAMS_QUEUE_TABLE_N"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE OR REPLACE EDITIONABLE TYPE "IX"."ORDER_EVENT_TYP" AS OBJECT (
	order_id 	NUMBER(12),
	product_id  	NUMBER(6),
	customer_id	NUMBER(6),
	cust_first_name	VARCHAR2(20),
	cust_last_name	VARCHAR2(20),
	order_status  	NUMBER(2),
	delivery_date	DATE
);
/

CREATE TABLE "IX"."AQ$_STREAMS_QUEUE_TABLE_C"
   (	"CSCN" NUMBER,
	"ENQ_TID" VARCHAR2(30),
	"MSGCNT" NUMBER,
	 PRIMARY KEY ("CSCN", "ENQ_TID") ENABLE
   ) USAGE QUEUE ORGANIZATION INDEX NOCOMPRESS ;

CREATE TABLE "IX"."AQ$_ORDERS_QUEUETABLE_H"
   (	"MSGID" RAW(16),
	"SUBSCRIBER#" NUMBER,
	"NAME" VARCHAR2(30),
	"ADDRESS#" NUMBER,
	"DEQUEUE_TIME" TIMESTAMP (6),
	"TRANSACTION_ID" VARCHAR2(30),
	"DEQUEUE_USER" VARCHAR2(30),
	"PROPAGATED_MSGID" RAW(16),
	"RETRY_COUNT" NUMBER,
	"HINT" ROWID,
	"SPARE" RAW(16),
	 PRIMARY KEY ("MSGID", "SUBSCRIBER#", "NAME", "ADDRESS#") ENABLE
   ) USAGE QUEUE ORGANIZATION INDEX NOCOMPRESS ;

CREATE TABLE "IX"."AQ$_STREAMS_QUEUE_TABLE_I"
   (	"SUBSCRIBER#" NUMBER,
	"NAME" VARCHAR2(30),
	"QUEUE#" NUMBER,
	"MSG_ENQ_TID" VARCHAR2(30),
	"SENDER#" NUMBER,
	"TXN_STEP#" NUMBER,
	"MSG_CHAIN_NO" NUMBER,
	"MSG_LOCAL_ORDER_NO" NUMBER,
	"MSGID" RAW(16),
	"HINT" ROWID,
	"SPARE" RAW(16),
	 PRIMARY KEY ("SUBSCRIBER#", "NAME", "QUEUE#", "MSG_ENQ_TID", "SENDER#", "TXN_STEP#", "MSG_CHAIN_NO", "MSG_LOCAL_ORDER_NO", "MSGID") ENABLE
   ) USAGE QUEUE ORGANIZATION INDEX NOCOMPRESS ;

CREATE TABLE "IX"."AQ$_STREAMS_QUEUE_TABLE_G"
   (	"MSGID" RAW(16),
	"SUBSCRIBER#" NUMBER,
	"NAME" VARCHAR2(30),
	"ADDRESS#" NUMBER,
	"SIGN" "SYS"."AQ$_SIG_PROP" ,
	"DBS_SIGN" "SYS"."AQ$_SIG_PROP" ,
	 PRIMARY KEY ("MSGID", "SUBSCRIBER#", "NAME", "ADDRESS#") ENABLE
   ) USAGE QUEUE ORGANIZATION INDEX NOCOMPRESS  INCLUDING "SIGN" OVERFLOW;

CREATE TABLE "IX"."AQ$_ORDERS_QUEUETABLE_I"
   (	"SUBSCRIBER#" NUMBER,
	"NAME" VARCHAR2(30),
	"QUEUE#" NUMBER,
	"MSG_ENQ_TIME" TIMESTAMP (6),
	"MSG_STEP_NO" NUMBER,
	"MSG_CHAIN_NO" NUMBER,
	"MSG_LOCAL_ORDER_NO" NUMBER,
	"MSGID" RAW(16),
	"HINT" ROWID,
	"SPARE" RAW(16),
	 PRIMARY KEY ("SUBSCRIBER#", "NAME", "QUEUE#", "MSG_ENQ_TIME", "MSG_STEP_NO", "MSG_CHAIN_NO", "MSG_LOCAL_ORDER_NO", "MSGID") ENABLE
   ) USAGE QUEUE ORGANIZATION INDEX NOCOMPRESS ;

CREATE TABLE "IX"."AQ$_STREAMS_QUEUE_TABLE_T"
   (	"NEXT_DATE" TIMESTAMP (6),
	"TXN_ID" VARCHAR2(30),
	"MSGID" RAW(16),
	"ACTION" NUMBER,
	 PRIMARY KEY ("NEXT_DATE", "TXN_ID", "MSGID") ENABLE
   ) USAGE QUEUE ORGANIZATION INDEX NOCOMPRESS ;

CREATE TABLE "IX"."AQ$_ORDERS_QUEUETABLE_G"
   (	"MSGID" RAW(16),
	"SUBSCRIBER#" NUMBER,
	"NAME" VARCHAR2(30),
	"ADDRESS#" NUMBER,
	"SIGN" "SYS"."AQ$_SIG_PROP" ,
	"DBS_SIGN" "SYS"."AQ$_SIG_PROP" ,
	 PRIMARY KEY ("MSGID", "SUBSCRIBER#", "NAME", "ADDRESS#") ENABLE
   ) USAGE QUEUE ORGANIZATION INDEX NOCOMPRESS  INCLUDING "SIGN" OVERFLOW;

CREATE TABLE "IX"."AQ$_STREAMS_QUEUE_TABLE_H"
   (	"MSGID" RAW(16),
	"SUBSCRIBER#" NUMBER,
	"NAME" VARCHAR2(30),
	"ADDRESS#" NUMBER,
	"DEQUEUE_TIME" TIMESTAMP (6),
	"TRANSACTION_ID" VARCHAR2(30),
	"DEQUEUE_USER" VARCHAR2(30),
	"PROPAGATED_MSGID" RAW(16),
	"RETRY_COUNT" NUMBER,
	"HINT" ROWID,
	"SPARE" RAW(16),
	 PRIMARY KEY ("MSGID", "SUBSCRIBER#", "NAME", "ADDRESS#") ENABLE
   ) USAGE QUEUE ORGANIZATION INDEX NOCOMPRESS ;

CREATE TABLE "IX"."AQ$_ORDERS_QUEUETABLE_T"
   (	"NEXT_DATE" TIMESTAMP (6),
	"TXN_ID" VARCHAR2(30),
	"MSGID" RAW(16),
	"ACTION" NUMBER,
	 PRIMARY KEY ("NEXT_DATE", "TXN_ID", "MSGID") ENABLE
   ) USAGE QUEUE ORGANIZATION INDEX NOCOMPRESS ;

CREATE TABLE "IX"."AQ$_STREAMS_QUEUE_TABLE_L"
   (	"MSGID" RAW(16),
	"SUBSCRIBER#" NUMBER,
	"NAME" VARCHAR2(30),
	"ADDRESS#" NUMBER,
	"DEQUEUE_TIME" TIMESTAMP (6) WITH TIME ZONE,
	"TRANSACTION_ID" VARCHAR2(30),
	"DEQUEUE_USER" VARCHAR2(30),
	"FLAGS" RAW(1)
   ) USAGE QUEUE ;

CREATE TABLE "IX"."AQ$_STREAMS_QUEUE_TABLE_S"
   (	"SUBSCRIBER_ID" NUMBER,
	"QUEUE_NAME" VARCHAR2(128),
	"NAME" VARCHAR2(128),
	"ADDRESS" VARCHAR2(1024),
	"PROTOCOL" NUMBER,
	"SUBSCRIBER_TYPE" NUMBER,
	"RULE_NAME" VARCHAR2(128),
	"TRANS_NAME" VARCHAR2(261),
	"RULESET_NAME" VARCHAR2(261),
	"NEGATIVE_RULESET_NAME" VARCHAR2(261),
	"CSCN_LWM" NUMBER,
	"CREATION_TIME" TIMESTAMP (6) WITH TIME ZONE,
	"MODIFICATION_TIME" TIMESTAMP (6) WITH TIME ZONE,
	"DELETION_TIME" TIMESTAMP (6) WITH TIME ZONE,
	"SCN_AT_REMOVE" NUMBER,
	"SCN_AT_ADD" NUMBER
   ) USAGE QUEUE ;

CREATE TABLE "IX"."STREAMS_QUEUE_TABLE"
   (	"Q_NAME" VARCHAR2(30),
	"MSGID" RAW(16),
	"CORRID" VARCHAR2(128),
	"PRIORITY" NUMBER,
	"STATE" NUMBER,
	"DELAY" TIMESTAMP (6),
	"EXPIRATION" NUMBER,
	"TIME_MANAGER_INFO" TIMESTAMP (6),
	"LOCAL_ORDER_NO" NUMBER,
	"CHAIN_NO" NUMBER,
	"CSCN" NUMBER,
	"DSCN" NUMBER,
	"ENQ_TIME" TIMESTAMP (6),
	"ENQ_UID" VARCHAR2(30),
	"ENQ_TID" VARCHAR2(30),
	"DEQ_TIME" TIMESTAMP (6),
	"DEQ_UID" VARCHAR2(30),
	"DEQ_TID" VARCHAR2(30),
	"RETRY_COUNT" NUMBER,
	"EXCEPTION_QSCHEMA" VARCHAR2(30),
	"EXCEPTION_QUEUE" VARCHAR2(30),
	"STEP_NO" NUMBER,
	"RECIPIENT_KEY" NUMBER,
	"DEQUEUE_MSGID" RAW(16),
	"SENDER_NAME" VARCHAR2(30),
	"SENDER_ADDRESS" VARCHAR2(1024),
	"SENDER_PROTOCOL" NUMBER,
	"USER_DATA" "SYS"."ANYDATA" ,
	"USER_PROP" "SYS"."ANYDATA"
   ) USAGE QUEUE ;

CREATE TABLE "IX"."AQ$_ORDERS_QUEUETABLE_L"
   (	"MSGID" RAW(16),
	"SUBSCRIBER#" NUMBER,
	"NAME" VARCHAR2(30),
	"ADDRESS#" NUMBER,
	"DEQUEUE_TIME" TIMESTAMP (6) WITH TIME ZONE,
	"TRANSACTION_ID" VARCHAR2(30),
	"DEQUEUE_USER" VARCHAR2(30),
	"FLAGS" RAW(1)
   ) USAGE QUEUE ;

CREATE TABLE "IX"."AQ$_ORDERS_QUEUETABLE_S"
   (	"SUBSCRIBER_ID" NUMBER,
	"QUEUE_NAME" VARCHAR2(128),
	"NAME" VARCHAR2(128),
	"ADDRESS" VARCHAR2(1024),
	"PROTOCOL" NUMBER,
	"SUBSCRIBER_TYPE" NUMBER,
	"RULE_NAME" VARCHAR2(128),
	"TRANS_NAME" VARCHAR2(261),
	"RULESET_NAME" VARCHAR2(261),
	"NEGATIVE_RULESET_NAME" VARCHAR2(261),
	"CREATION_TIME" TIMESTAMP (6) WITH TIME ZONE,
	"MODIFICATION_TIME" TIMESTAMP (6) WITH TIME ZONE,
	"DELETION_TIME" TIMESTAMP (6) WITH TIME ZONE,
	"SCN_AT_REMOVE" NUMBER,
	"SCN_AT_ADD" NUMBER
   ) USAGE QUEUE ;

CREATE TABLE "IX"."ORDERS_QUEUETABLE"
   (	"Q_NAME" VARCHAR2(30),
	"MSGID" RAW(16),
	"CORRID" VARCHAR2(128),
	"PRIORITY" NUMBER,
	"STATE" NUMBER,
	"DELAY" TIMESTAMP (6),
	"EXPIRATION" NUMBER,
	"TIME_MANAGER_INFO" TIMESTAMP (6),
	"LOCAL_ORDER_NO" NUMBER,
	"CHAIN_NO" NUMBER,
	"CSCN" NUMBER,
	"DSCN" NUMBER,
	"ENQ_TIME" TIMESTAMP (6),
	"ENQ_UID" VARCHAR2(30),
	"ENQ_TID" VARCHAR2(30),
	"DEQ_TIME" TIMESTAMP (6),
	"DEQ_UID" VARCHAR2(30),
	"DEQ_TID" VARCHAR2(30),
	"RETRY_COUNT" NUMBER,
	"EXCEPTION_QSCHEMA" VARCHAR2(30),
	"EXCEPTION_QUEUE" VARCHAR2(30),
	"STEP_NO" NUMBER,
	"RECIPIENT_KEY" NUMBER,
	"DEQUEUE_MSGID" RAW(16),
	"SENDER_NAME" VARCHAR2(30),
	"SENDER_ADDRESS" VARCHAR2(1024),
	"SENDER_PROTOCOL" NUMBER,
	"USER_DATA" "IX"."ORDER_EVENT_TYP" ,
	"USER_PROP" "SYS"."ANYDATA"
   ) USAGE QUEUE ;

CREATE UNIQUE INDEX "IX"."AQ$_STREAMS_QUEUE_TABLE_Y" ON "IX"."AQ$_STREAMS_QUEUE_TABLE_C" ("ENQ_TID")
  ;

ALTER TABLE "IX"."AQ$_STREAMS_QUEUE_TABLE_S" ADD PRIMARY KEY ("SUBSCRIBER_ID")
  USING INDEX  ENABLE;

ALTER TABLE "IX"."STREAMS_QUEUE_TABLE" ADD PRIMARY KEY ("MSGID")
  USING INDEX  ENABLE;

ALTER TABLE "IX"."AQ$_ORDERS_QUEUETABLE_S" ADD PRIMARY KEY ("SUBSCRIBER_ID")
  USING INDEX  ENABLE;

ALTER TABLE "IX"."ORDERS_QUEUETABLE" ADD PRIMARY KEY ("MSGID")
  USING INDEX  ENABLE;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "IX"."AQ$ORDERS_QUEUETABLE_S" ("QUEUE",
"NAME",
"ADDRESS",
"PROTOCOL",
"TRANSFORMATION",
"QUEUE_TO_QUEUE") AS
  SELECT queue_name QUEUE, name NAME , address ADDRESS , protocol PROTOCOL, trans_name TRANSFORMATION, decode(bitand(SUBSCRIBER_TYPE, 512), 512, 'TRUE', 'FALSE') QUEUE_TO_QUEUE  FROM "AQ$_ORDERS_QUEUETABLE_S" s  WHERE (bitand(s.subscriber_type, 1) = 1)  WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "IX"."AQ$ORDERS_QUEUETABLE_R" ("QUEUE",
"NAME",
"ADDRESS",
"PROTOCOL",
"RULE",
"RULE_SET",
"TRANSFORMATION") AS
  SELECT queue_name QUEUE, s.name NAME , address ADDRESS , protocol PROTOCOL, rule_condition RULE, ruleset_name RULE_SET, trans_name TRANSFORMATION  FROM "AQ$_ORDERS_QUEUETABLE_S" s , sys.all_rules r WHERE (bitand(s.subscriber_type, 1) = 1) AND s.rule_name = r.rule_name and r.rule_owner = 'IX'  WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "IX"."AQ$ORDERS_QUEUETABLE" ("QUEUE",
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
					  s.name) CONSUMER_NAME,  s.address ADDRESS,  s.protocol PROTOCOL  FROM "ORDERS_QUEUETABLE" qt, "AQ$_ORDERS_QUEUETABLE_H" h LEFT OUTER JOIN  (SELECT fv.MSGID MSGID, fv.SUBSCRIBER# SUBSCRIBER#, fv.NAME NAME, 0 ADDRESS#, fv.DEQUEUE_TIME DEQUEUE_TIME,fv.TRANSACTION_ID TRANSACTION_ID, fv.DEQUEUE_USER DEQUEUE_USER, fv.FLAGS FLAGS FROM AQ$_UNFLUSHED_DEQUEUES fv WHERE fv.QTOBJNO = 92698 union select dl.MSGID MSGID, dl.SUBSCRIBER# SUBSCRIBER#, dl.NAME NAME, dl.ADDRESS# ADDRESS#, dl.DEQUEUE_TIME DEQUEUE_TIME, dl.TRANSACTION_ID TRANSACTION_ID, dl.DEQUEUE_USER DEQUEUE_USER, dl.FLAGS FLAGS from "IX"."AQ$_ORDERS_QUEUETABLE_L" dl )  l  ON h.msgid = l.msgid AND h.subscriber# = l.subscriber# AND h.name = l.name AND h.address# = l.address#, "AQ$_ORDERS_QUEUETABLE_S" s  WHERE  qt.msgid = h.msgid AND  ((h.subscriber# != 0 AND h.subscriber# = s.subscriber_id)  OR (h.subscriber# = 0 AND h.address# = s.subscriber_id)) AND (qt.state != 7 OR   qt.state != 9 )     WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "IX"."AQ$_ORDERS_QUEUETABLE_F" ("Q_NAME",
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
  SELECT  /*+ NO_MERGE (qo) USE_NL(iot) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA, qt.sender_name SENDER_NAME, qt.sender_address SENDER_ADDRESS, qt.sender_protocol SENDER_PROTOCOL, qt.dequeue_msgid DEQUEUE_MSGID, 'PERSISTENT' DELIVERY_MODE, 0 SEQUENCE_NUM, 0 MSG_NUM, qo.qid QUEUE_ID, qt.user_prop USER_PROP, iot.subscriber# SUBSCRIBER_ID, iot.name SUBSCRIBER_NAME, iot.queue# QUEUE_EVTID FROM "ORDERS_QUEUETABLE" qt, "AQ$_ORDERS_QUEUETABLE_I" iot, SYS.ALL_INT_DEQUEUE_QUEUES qo WHERE qt.msgid=iot.msgid  and qt.q_name = qo.name  AND qo.owner = 'IX' AND iot.msg_enq_time = qt.enq_time AND  iot.msg_step_no = qt.step_no AND iot.msg_local_order_no = qt.local_order_no AND   iot.msg_chain_no = qt.chain_no  WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "IX"."AQ$STREAMS_QUEUE_TABLE_S" ("QUEUE",
"NAME",
"ADDRESS",
"PROTOCOL",
"TRANSFORMATION",
"QUEUE_TO_QUEUE") AS
  SELECT queue_name QUEUE, name NAME , address ADDRESS , protocol PROTOCOL, trans_name TRANSFORMATION, decode(bitand(SUBSCRIBER_TYPE, 512), 512, 'TRUE', 'FALSE') QUEUE_TO_QUEUE  FROM "AQ$_STREAMS_QUEUE_TABLE_S" s  WHERE (bitand(s.subscriber_type, 1) = 1)  WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "IX"."AQ$STREAMS_QUEUE_TABLE_R" ("QUEUE",
"NAME",
"ADDRESS",
"PROTOCOL",
"RULE",
"RULE_SET",
"TRANSFORMATION") AS
  SELECT queue_name QUEUE, s.name NAME , address ADDRESS , protocol PROTOCOL, rule_condition RULE, ruleset_name RULE_SET, trans_name TRANSFORMATION  FROM "AQ$_STREAMS_QUEUE_TABLE_S" s , sys.all_rules r WHERE (bitand(s.subscriber_type, 1) = 1) AND s.rule_name = r.rule_name and r.rule_owner = 'IX'  WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "IX"."AQ$STREAMS_QUEUE_TABLE" ("QUEUE",
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
"ENQ_CSCN",
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
                 enq_timestamp,   enq_uid ENQ_USER_ID,  qt.enq_tid ENQ_TXN_ID,  decode(qt.cscn, 0, c.cscn, qt.cscn) ENQ_CSCN,  decode(h.transaction_id, NULL,
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
					  s.name) CONSUMER_NAME,  s.address ADDRESS,  s.protocol PROTOCOL  FROM "STREAMS_QUEUE_TABLE" qt LEFT OUTER JOIN "AQ$_STREAMS_QUEUE_TABLE_C" c ON qt.enq_tid = c.enq_tid , "AQ$_STREAMS_QUEUE_TABLE_H" h LEFT OUTER JOIN  (SELECT fv.MSGID MSGID, fv.SUBSCRIBER# SUBSCRIBER#, fv.NAME NAME, 0 ADDRESS#, fv.DEQUEUE_TIME DEQUEUE_TIME,fv.TRANSACTION_ID TRANSACTION_ID, fv.DEQUEUE_USER DEQUEUE_USER, fv.FLAGS FLAGS FROM AQ$_UNFLUSHED_DEQUEUES fv WHERE fv.QTOBJNO = 92691 union select dl.MSGID MSGID, dl.SUBSCRIBER# SUBSCRIBER#, dl.NAME NAME, dl.ADDRESS# ADDRESS#, dl.DEQUEUE_TIME DEQUEUE_TIME, dl.TRANSACTION_ID TRANSACTION_ID, dl.DEQUEUE_USER DEQUEUE_USER, dl.FLAGS FLAGS from "IX"."AQ$_STREAMS_QUEUE_TABLE_L" dl )  l  ON h.msgid = l.msgid AND h.subscriber# = l.subscriber# AND h.name = l.name AND h.address# = l.address#, "AQ$_STREAMS_QUEUE_TABLE_S" s  WHERE  qt.msgid = h.msgid AND  ((h.subscriber# != 0 AND h.subscriber# = s.subscriber_id)  OR (h.subscriber# = 0 AND h.address# = s.subscriber_id)) AND (qt.state != 7 OR   qt.state != 9 )     WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "IX"."AQ$_STREAMS_QUEUE_TABLE_F" ("Q_NAME",
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
  SELECT  /*+ NO_MERGE (qo) USE_NL(iot) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA, qt.sender_name SENDER_NAME, qt.sender_address SENDER_ADDRESS, qt.sender_protocol SENDER_PROTOCOL, qt.dequeue_msgid DEQUEUE_MSGID, 'PERSISTENT' DELIVERY_MODE, 0 SEQUENCE_NUM, 0 MSG_NUM, qo.qid QUEUE_ID, qt.user_prop USER_PROP, iot.subscriber# SUBSCRIBER_ID, iot.name SUBSCRIBER_NAME, iot.queue# QUEUE_EVTID FROM "STREAMS_QUEUE_TABLE" qt, "AQ$_STREAMS_QUEUE_TABLE_I" iot, SYS.USER_AQ_AGENT_PRIVS up, SYS.ALL_INT_DEQUEUE_QUEUES qo  WHERE qt.msgid=iot.msgid  and (iot.name = up.agent_name or  iot.subscriber# = (select s.subscriber_id from "AQ$_STREAMS_QUEUE_TABLE_S" s  where s.name = up.agent_name and  bitand(s.subscriber_type, 9) = 1)) and qt.q_name = qo.name  AND qo.owner = 'IX' AND iot.msg_enq_tid = qt.enq_tid AND  iot.txn_step# = qt.step_no AND  iot.sender# = 0 AND  iot.msg_local_order_no = qt.local_order_no AND  iot.msg_chain_no = qt.chain_no  WITH READ ONLY;


BEGIN
DECLARE
ta sys.re$table_alias_list;
vt sys.re$variable_type_list;
BEGIN
ta := sys.re$table_alias_list();
vt := sys.re$variable_type_list();
ta.extend(1);
ta(1) := sys.re$table_alias('TAB','"ORDERS_QUEUETABLE"');
dbms_rule_imp_obj.import_evaluation_context('"AQ$_ORDERS_QUEUETABLE_V"', ta, vt, NULL,NULL, 1);
END;
COMMIT;
END;
/


BEGIN
DECLARE
ta sys.re$table_alias_list;
vt sys.re$variable_type_list;
BEGIN
ta := sys.re$table_alias_list();
vt := sys.re$variable_type_list();
ta.extend(1);
ta(1) := sys.re$table_alias('TAB','"STREAMS_QUEUE_TABLE"');
dbms_rule_imp_obj.import_evaluation_context('"AQ$_STREAMS_QUEUE_TABLE_V"', ta, vt, NULL,NULL, 1);
END;
COMMIT;
END;
/


BEGIN
BEGIN
dbms_rule_imp_obj.import_rule_set('"ORDERS_QUEUE_N"','"AQ$_ORDERS_QUEUETABLE_V"',NULL, 1);
END;

COMMIT;
END;
/


BEGIN
BEGIN
dbms_rule_imp_obj.import_rule_set('"ORDERS_QUEUE_R"','"AQ$_ORDERS_QUEUETABLE_V"',NULL, 1);
END;

COMMIT;
END;
/


BEGIN
BEGIN
dbms_rule_imp_obj.import_rule_set('"STREAMS_QUEUE_N"','"AQ$_STREAMS_QUEUE_TABLE_V"',NULL, 1);
END;

COMMIT;
END;
/


BEGIN
BEGIN
dbms_rule_imp_obj.import_rule_set('"STREAMS_QUEUE_R"','"AQ$_STREAMS_QUEUE_TABLE_V"',NULL, 1);
END;

COMMIT;
END;
/


BEGIN
SYS.DBMS_AQ_IMP_INTERNAL.IMPORT_QUEUE(HEXTORAW('780DD98B45B624E6E055000000000001'),'STREAMS_QUEUE_TABLE','STREAMS_QUEUE',0,5,0,0,0,'');
COMMIT;
END;
/


BEGIN
SYS.DBMS_AQ_IMP_INTERNAL.IMPORT_QUEUE(HEXTORAW('780DD98B45B724E6E055000000000001'),'STREAMS_QUEUE_TABLE','AQ$_STREAMS_QUEUE_TABLE_E',1,0,0,0,0,'exception queue');
COMMIT;
END;
/


BEGIN
SYS.DBMS_AQ_IMP_INTERNAL.IMPORT_QUEUE(HEXTORAW('780DD98B45B824E6E055000000000001'),'ORDERS_QUEUETABLE','ORDERS_QUEUE',0,5,0,0,0,'');
COMMIT;
END;
/


BEGIN
SYS.DBMS_AQ_IMP_INTERNAL.IMPORT_QUEUE(HEXTORAW('780DD98B45B924E6E055000000000001'),'ORDERS_QUEUETABLE','AQ$_ORDERS_QUEUETABLE_E',1,0,0,0,0,'exception queue');
COMMIT;
END;
/


BEGIN
DECLARE
ta sys.re$table_alias_list;
vt sys.re$variable_type_list;
BEGIN
ta := sys.re$table_alias_list();
vt := sys.re$variable_type_list();
ta.extend(1);
ta(1) := sys.re$table_alias('TAB','"STREAMS_QUEUE_TABLE"');
dbms_rule_imp_obj.import_evaluation_context('"AQ$_STREAMS_QUEUE_TABLE_V"', ta, vt, NULL,NULL, 1);
END;
COMMIT;
END;
/


BEGIN
DECLARE
ta sys.re$table_alias_list;
vt sys.re$variable_type_list;
BEGIN
ta := sys.re$table_alias_list();
vt := sys.re$variable_type_list();
ta.extend(1);
ta(1) := sys.re$table_alias('TAB','"ORDERS_QUEUETABLE"');
dbms_rule_imp_obj.import_evaluation_context('"AQ$_ORDERS_QUEUETABLE_V"', ta, vt, NULL,NULL, 1);
END;
COMMIT;
END;
/


BEGIN
BEGIN
dbms_rule_imp_obj.import_rule_set('"STREAMS_QUEUE_N"','"AQ$_STREAMS_QUEUE_TABLE_V"',NULL, 1);
END;

COMMIT;
END;
/


BEGIN
BEGIN
dbms_rule_imp_obj.import_rule_set('"ORDERS_QUEUE_R"','"AQ$_ORDERS_QUEUETABLE_V"',NULL, 1);
END;

COMMIT;
END;
/


BEGIN
BEGIN
dbms_rule_imp_obj.import_rule_set('"ORDERS_QUEUE_N"','"AQ$_ORDERS_QUEUETABLE_V"',NULL, 1);
END;

COMMIT;
END;
/


BEGIN
BEGIN
dbms_rule_imp_obj.import_rule_set('"STREAMS_QUEUE_R"','"AQ$_STREAMS_QUEUE_TABLE_V"',NULL, 1);
END;

COMMIT;
END;
/

