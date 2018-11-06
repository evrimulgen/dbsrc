CREATE TABLE "DBSRC_U"."DBSRC"
   (	"DBSRC_SET_NO" NUMBER,
	"CFG_NAME" VARCHAR2(80),
	"ORDER_NO" NUMBER,
	"OBJECT_OWNER" VARCHAR2(200 CHAR),
	"DDL_TYPE" VARCHAR2(200 CHAR),
	"OBJECT_NAME" VARCHAR2(200 CHAR),
	"DBSRC_TEXT_RAW" CLOB,
	"DBSRC_TEXT_COOKED" CLOB,
	"DBSCRIPT_INCLUDE_FLAG" VARCHAR2(1 CHAR) DEFAULT 'Y',
	"POST_PRCS_ORDER_NO_LIST" VARCHAR2(1000),
	"DBA_OBJ_CREATED_DATE" DATE,
	"DBA_OBJ_LAST_DDL_TIME" DATE,
	"DBA_OBJ_STATUS" VARCHAR2(7),
	"CREATE_DATE" DATE DEFAULT sysdate,
	"CREATE_USER" VARCHAR2(80 CHAR) DEFAULT user,
	"CREATE_PROCESS" VARCHAR2(200 CHAR) DEFAULT sys_context('userenv', 'os_user')||'@'||
            sys_context('userenv', 'host')||'/'||
            sys_context('userenv', 'module')||':'||
            sys_context('userenv', 'action')||'@'||
            sys_context('userenv', 'db_name')
   ) ;

CREATE TABLE "DBSRC_U"."DBSRC_CFG"
   (	"CFG_NAME" VARCHAR2(80),
	"CFG_DESC" VARCHAR2(2000),
	"CREATE_DATE" DATE DEFAULT sysdate,
	"CREATE_USER" VARCHAR2(80 CHAR) DEFAULT user,
	"CREATE_PROCESS" VARCHAR2(2000 CHAR) DEFAULT sys_context('userenv', 'os_user')||'@'||
            sys_context('userenv', 'host')||'/'||
            sys_context('userenv', 'module')||':'||
            sys_context('userenv', 'action')||'@'||
            sys_context('userenv', 'db_name')
   ) ;

CREATE TABLE "DBSRC_U"."DBSRC_CFG_FILTER"
   (	"CFG_NAME" VARCHAR2(80),
	"FILTER_NAME" VARCHAR2(80),
	"FILTER_VALUE" VARCHAR2(2000),
	"OBJECT_TYPE_PATH" VARCHAR2(80),
	"COMMENT_TEXT" VARCHAR2(2000),
	"CREATE_DATE" DATE DEFAULT sysdate,
	"CREATE_USER" VARCHAR2(80 CHAR) DEFAULT user,
	"CREATE_PROCESS" VARCHAR2(2000 CHAR) DEFAULT sys_context('userenv', 'os_user')||'@'||
            sys_context('userenv', 'host')||'/'||
            sys_context('userenv', 'module')||':'||
            sys_context('userenv', 'action')||'@'||
            sys_context('userenv', 'db_name')
   ) ;

CREATE TABLE "DBSRC_U"."DBSRC_CFG_TRANSFORM"
   (	"CFG_NAME" VARCHAR2(80),
	"TRANSFORM_NAME" VARCHAR2(80),
	"TRANSFORM_VALUE" VARCHAR2(2000),
	"OBJECT_TYPE_PATH" VARCHAR2(80),
	"COMMENT_TEXT" VARCHAR2(2000),
	"CREATE_DATE" DATE DEFAULT sysdate,
	"CREATE_USER" VARCHAR2(80 CHAR) DEFAULT user,
	"CREATE_PROCESS" VARCHAR2(2000 CHAR) DEFAULT sys_context('userenv', 'os_user')||'@'||
            sys_context('userenv', 'host')||'/'||
            sys_context('userenv', 'module')||':'||
            sys_context('userenv', 'action')||'@'||
            sys_context('userenv', 'db_name')
   ) ;

CREATE TABLE "DBSRC_U"."DBSRC_CFG_POST_PRCS"
   (	"CFG_NAME" VARCHAR2(80),
	"ORDER_NO" NUMBER,
	"POST_PRCS_SQL_TEXT" CLOB,
	"COMMENT_TEXT" VARCHAR2(2000),
	"CREATE_DATE" DATE DEFAULT sysdate,
	"CREATE_USER" VARCHAR2(80 CHAR) DEFAULT user,
	"CREATE_PROCESS" VARCHAR2(2000 CHAR) DEFAULT sys_context('userenv', 'os_user')||'@'||
            sys_context('userenv', 'host')||'/'||
            sys_context('userenv', 'module')||':'||
            sys_context('userenv', 'action')||'@'||
            sys_context('userenv', 'db_name')
   ) ;

CREATE TABLE "DBSRC_U"."DBSRC_CFG_DBSCRIPT"
   (	"CFG_NAME" VARCHAR2(80),
	"DDL_TYPE" VARCHAR2(80),
	"ORDER_NO" NUMBER,
	"DISPLAY_NAME" VARCHAR2(80),
	"DISPLAY_NOTE" VARCHAR2(1000),
	"DISPLAY_HEADER_TEXT" CLOB,
	"COMMENT_TEXT" VARCHAR2(2000),
	"CREATE_DATE" DATE DEFAULT sysdate,
	"CREATE_USER" VARCHAR2(80 CHAR) DEFAULT user,
	"CREATE_PROCESS" VARCHAR2(2000 CHAR) DEFAULT sys_context('userenv', 'os_user')||'@'||
            sys_context('userenv', 'host')||'/'||
            sys_context('userenv', 'module')||':'||
            sys_context('userenv', 'action')||'@'||
            sys_context('userenv', 'db_name')
   ) ;

