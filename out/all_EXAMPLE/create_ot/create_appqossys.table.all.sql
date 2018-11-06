CREATE TABLE "APPQOSSYS"."WLM_METRICS_STREAM"
   (	"TIMESTAMP" DATE,
	"PC" VARCHAR2(31),
	"NEGATIVE_INTERVAL" NUMBER
   ) ;

CREATE TABLE "APPQOSSYS"."WLM_CLASSIFIER_PLAN"
   (	"OPER" NUMBER,
	"NCLSRS" NUMBER,
	"CLPCSTR" VARCHAR2(4000),
	"ACTIVE" CHAR(1),
	"SEQNO" NUMBER,
	"TIMESTAMP" DATE,
	"CHKSUM" NUMBER
   ) ;

CREATE TABLE "APPQOSSYS"."WLM_MPA_STREAM"
   (	"NAME" VARCHAR2(4000),
	"SERVERORPOOL" VARCHAR2(8),
	"RISKLEVEL" NUMBER
   ) ;

CREATE TABLE "APPQOSSYS"."WLM_VIOLATION_STREAM"
   (	"TIMESTAMP" DATE,
	"SERVERPOOL" VARCHAR2(4000),
	"VIOLATION" VARCHAR2(4000)
   ) ;

