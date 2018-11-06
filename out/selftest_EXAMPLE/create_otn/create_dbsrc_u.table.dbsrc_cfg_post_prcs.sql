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

