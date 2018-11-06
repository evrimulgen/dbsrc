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

