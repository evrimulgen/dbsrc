CREATE USER "DBSRC_U" IDENTIFIED BY VALUES 'S:137403118E3DA266F373631F7BA656EC2F8BCE49C1759E71CD6A32970416;H:78078A6F8562F6F02A865D89B22A36A1;T:5574DF5B65F4D3A1BACE74A70F2CF4BBDF509C2A4DF80C2FFFCC3D0AE6FE8E8D7CA80A4A7C47FEEBCF2826E34A450E63186C5C6459F334FAFB34D5A808ED0AB5A84EC3F39EB8E530396B711ED4B04E4D;E3C69B35412229BA'
      DEFAULT TABLESPACE "USERS"
      TEMPORARY TABLESPACE "TEMP";

GRANT CREATE VIEW TO "DBSRC_U";
GRANT "CONNECT" TO "DBSRC_U";
GRANT "RESOURCE" TO "DBSRC_U";
GRANT "SELECT_CATALOG_ROLE" TO "DBSRC_U";
GRANT "EXP_FULL_DATABASE" TO "DBSRC_U";
ALTER USER "DBSRC_U" DEFAULT ROLE ALL;
CREATE SEQUENCE  "DBSRC_U"."SQ_DBSRC_CNT_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 54640 CACHE 30 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DBSRC_U"."SQ_DBSRC_SET_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1090 CACHE 30 NOORDER  NOCYCLE  NOPARTITION ;
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

COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG"."CFG_NAME" IS 'Database Source Configuration Name: primary key: uniquely identifies a configuration for extracting database source.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG"."CFG_DESC" IS 'Configuration Description: Textual description of a configuration, suitable for display.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG"."CREATE_DATE" IS 'Create Date: Date when record created in the table. Standard maintenance column.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG"."CREATE_USER" IS 'Create User: Who created the record. Standard maintenance column.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG"."CREATE_PROCESS" IS 'Create Process: Who created the record, captured from userenv context as os_user@host/module:action. Standard maintenance column.';
COMMENT ON TABLE "DBSRC_U"."DBSRC_CFG"  IS 'Database Source Configuration: a configuration of dbms_metadata api calls and custom post-processing for extracting database source.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_POST_PRCS"."CFG_NAME" IS 'Configuration Name: part of primary key: uniquely identifies a configuration for extracting database source.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_POST_PRCS"."ORDER_NO" IS 'Order Number: part of primary key. Unique within a configuration name. The order in which the post-processing sql should be applied when creating a database script.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_POST_PRCS"."POST_PRCS_SQL_TEXT" IS 'Post-processing SQL Text: a sql statement, typically an update to the dbsrc table of a subset of rows within a configuration name.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_POST_PRCS"."COMMENT_TEXT" IS 'Comment Text: Textual description of a post-processing sql item, suitable for display.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_POST_PRCS"."CREATE_DATE" IS 'Create Date: Date when record created in the table. Standard maintenance column.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_POST_PRCS"."CREATE_USER" IS 'Create User: Who created the record. Standard maintenance column.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_POST_PRCS"."CREATE_PROCESS" IS 'Create Process: Who created the record, captured from userenv context as os_user@host/module:action. Standard maintenance column.';
COMMENT ON TABLE "DBSRC_U"."DBSRC_CFG_POST_PRCS"  IS 'Database Source Configuration Post-Processing: custom post-processing applied using sql to dbms_metadata output to create a database script. This post-processing is intended for handling filtering and transformations not currently possible with dbms_metadata filters and transforms.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_FILTER"."CFG_NAME" IS 'Configuration Name: part of primary key: uniquely identifies a configuration for extracting database source.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_FILTER"."FILTER_NAME" IS 'dbms_metadata.set_filter() name parameter. Part of the primary key.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_FILTER"."FILTER_VALUE" IS 'dbms_metadata.set_filter() value parameter. Part of the primary key.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_FILTER"."OBJECT_TYPE_PATH" IS 'dbms_metadata.set_filter() object_type_path parameter. Part of the primary key.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_FILTER"."COMMENT_TEXT" IS 'Comment Text: Textual description of a set_filter() call, suitable for display.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_FILTER"."CREATE_DATE" IS 'Create Date: Date when record created in the table. Standard maintenance column.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_FILTER"."CREATE_USER" IS 'Create User: Who created the record. Standard maintenance column.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_FILTER"."CREATE_PROCESS" IS 'Create Process: Who created the record, captured from userenv context as os_user@host/module:action. Standard maintenance column.';
COMMENT ON TABLE "DBSRC_U"."DBSRC_CFG_FILTER"  IS 'Database Source Configuration dbms_metadata.set_filter(): parameter values and associated information necessary to assemble a call to dbms_metadata.set_filter(). set_filter() specifies restrictions on the objects to be retrieved, for example, the object name or schema. See Oracle doc for more information: https://docs.oracle.com/database/121/ARPLS/d_metada.htm#ARPLS66903';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_TRANSFORM"."CFG_NAME" IS 'Configuration Name: part of primary key: uniquely identifies a configuration for extracting database source';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_TRANSFORM"."TRANSFORM_NAME" IS 'dbms_metadata.set_transform_param() name parameter. Part of the primary key.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_TRANSFORM"."TRANSFORM_VALUE" IS 'dbms_metadata.set_transform_param() value parameter. Part of the primary key.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_TRANSFORM"."OBJECT_TYPE_PATH" IS 'dbms_metadata.set_transform_param() object_type_path parameter. Part of the primary key.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_TRANSFORM"."COMMENT_TEXT" IS 'Comment Text: Textual description of a set_transform_param() call, suitable for display.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_TRANSFORM"."CREATE_DATE" IS 'Create Date: Date when record created in the table. Standard maintenance column.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_TRANSFORM"."CREATE_USER" IS 'Create User: Who created the record. Standard maintenance column.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_TRANSFORM"."CREATE_PROCESS" IS 'Create Process: Who created the record, captured from userenv context as os_user@host/module:action. Standard maintenance column.';
COMMENT ON TABLE "DBSRC_U"."DBSRC_CFG_TRANSFORM"  IS 'Database Source Configuration dbms_metadata.set_transform_param(): parameter values and associated information necessary to assemble a call to dbms_metadata.set_transform_param(). set_transform_param() specifies parameters to the XSLT stylesheet used to modify or customize the output of the transform.  See Oracle doc for more information: https://docs.oracle.com/database/121/ARPLS/d_metada.htm#ARPLS66903';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_DBSCRIPT"."CFG_NAME" IS 'Configuration Name: part of primary key: uniquely identifies a configuration for extracting database source.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_DBSCRIPT"."DDL_TYPE" IS 'DDL Type:  The type of ddl as reported by dbms_metadata.get_ddl().';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_DBSCRIPT"."ORDER_NO" IS 'Order Number: part of primary key. Unique within a configuration name. The order in which the ddl_type is will be rendered in an explicitly ordered dbscript.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_DBSCRIPT"."DISPLAY_NAME" IS 'Display Name: Descriptive name for a ddl type.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_DBSCRIPT"."DISPLAY_NOTE" IS 'Display Note: Optional note for a ddl_type.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_DBSCRIPT"."DISPLAY_HEADER_TEXT" IS 'Display Header Text: a header comment block derived from display_name and display_note.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_DBSCRIPT"."COMMENT_TEXT" IS 'Comment Text: Textual description of a XXXX, suitable for display.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_DBSCRIPT"."CREATE_DATE" IS 'Create Date: Date when record created in the table. Standard maintenance column.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_DBSCRIPT"."CREATE_USER" IS 'Create User: Who created the record. Standard maintenance column.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC_CFG_DBSCRIPT"."CREATE_PROCESS" IS 'Create Process: Who created the record, captured from userenv context as os_user@host/module:action. Standard maintenance column.';
COMMENT ON TABLE "DBSRC_U"."DBSRC_CFG_DBSCRIPT"  IS 'Database Source Configuration Database Script. This is a template for creating a database script from the database source code found in the dbsrc table.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC"."DBSRC_SET_NO" IS 'Database Source Set Number: part of primary key: sequence-number-based identifier for a set of related database source exported together.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC"."CFG_NAME" IS 'Configuration Name: part of primary key: uniquely identifies a configuration for extracting database source';
COMMENT ON COLUMN "DBSRC_U"."DBSRC"."ORDER_NO" IS 'Order Number: part of primary key. Unique within a configuration name. The order in which the ddl will be rendered in a dbscript.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC"."OBJECT_OWNER" IS 'Object Owner:  The owner for the database object.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC"."DDL_TYPE" IS 'DDL Type:  The type of ddl as reported by dbms_metadata.get_ddl().';
COMMENT ON COLUMN "DBSRC_U"."DBSRC"."OBJECT_NAME" IS 'Object Name: The name for the database object.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC"."DBSRC_TEXT_RAW" IS '"Raw" Database Source Text:  the database source (ddl, dcl, etc.) for the database object; raw as-is from dbms_metadata.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC"."DBSRC_TEXT_COOKED" IS '"Cooked" Database Source Text:  the database source (ddl, dcl, etc.) for the database object; after post-processing.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC"."DBSCRIPT_INCLUDE_FLAG" IS 'Database Script Include Flag: defaults to Y, can be set no N by post-processing to exclude objects from dbscripts.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC"."POST_PRCS_ORDER_NO_LIST" IS 'Post-process Order Number List: a series of zero to many numbers, delimited by colons; ex '':1::2:''. Indicates which post-processing steps were applied to this ddl.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC"."DBA_OBJ_CREATED_DATE" IS 'DBA Object Created Date: timestamp for creation of object. Value is null if not an object.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC"."DBA_OBJ_LAST_DDL_TIME" IS 'DBA Object Last DDL Time: timestamp for the last modification resulting from a DDL statement. Value is null if not an object.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC"."DBA_OBJ_STATUS" IS 'DBA Object Status: status of the object (VALID, INVALID, N/A). Value is null if not an object.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC"."CREATE_DATE" IS 'Create Date: Date when record created in the table. Standard maintenance column.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC"."CREATE_USER" IS 'Create User: Who created the record. Standard maintenance column.';
COMMENT ON COLUMN "DBSRC_U"."DBSRC"."CREATE_PROCESS" IS 'Create Process: Who created the record, captured from userenv context as os_user@host/module:action. Standard maintenance column.';
COMMENT ON TABLE "DBSRC_U"."DBSRC"  IS 'Database Source: Database Source exported by dbms_metadata.';
CREATE OR REPLACE EDITIONABLE PACKAGE "DBSRC_U"."DBSRC_MGR" authid current_user as
-- ============================================================================
--
--	Public API:
--	==========
--
    procedure export_ddl(p_cfg_name in varchar2);
-- 	Export the ddl for the given configuration name into the dbsrc table.
-- 	This is the "main" procedure: everything else plays a supporting role.
--			executes:
--				gather_dbsrc_stats()
--				get_db_ddl()
--				gather_dbsrc_stats()
--				post_prcs()
--				describe()
--
	procedure post_prcs;
-- 	Post-process ddl for the current database source set in the dbsrc table
-- 	to apply formatting, tweaks and fixes.  Called by export_ddl(), but also
-- 	publicly available to re-post-process.
--		reads dbsrc table (mostly dbsrc_text_raw column)
--		writes dbsrc table (mostly dbsrc_text_cooked column)
--		reads sys.dba_objects view
--		reads dbsrc_post_prcs
--
	procedure describe;
-- 	Describe the configuration, settings and post-processing details of the
-- 	current database source set.  This is a useful readout for mere humans
-- 	trying to understand what is going on.
--		executes:
--			desc_cfg()
--			desc_dbsrc_set()
--			desc_post_prcs()
--		writes dbms_output
--
	procedure desc_dbsrc_set;
-- 	Describe the database source set for the current set_no.  Called by
--	export_ddl(), but also publicly available to call independently.
--		reads crnt_dbsrc view
--		writes dbms_output
--
	procedure desc_post_prcs;
-- 	Describe what post processing did to the raw ddl.  Called by export_ddl(),
-- 	but also publicly available to call independently.
--		reads crnt_dbsrc view
--		reads dbsrc_cfg_post_prcs table
--		writes dbms_output
--
	procedure set_set_no(n in number default -1);
-- 	Set the current dbsrc_set_no. As most other procedures operate on the
--	current dbsrc_set_no, this drives the context for everything.
--		executes init()
--		sets values of G_SET_NO global variable
--
	function get_set_no return number;
-- 	Get the dbsrc_set_no for the current database source configuration.
--		returns value of G_SET_NO global variable
--
	function get_cfg_name return varchar2;
-- 	Get the "short name" for the current database source configuration.
--		returns value of G_CFG_NAME global variable
--
	procedure stat;
-- 	Get a summarized status of the contents of the dbsrc table.
--		reads user_tab_statistics view
--		executes dbms_stats.gather_table_stats()
--
-- Private API:
-- ============
--
--	procedure p(s in varchar)
-- 	Convenience wrapper for ole dbms_output.put_line.
-- 		executes dbms_output.put_line
--		writes dbms_output
--
--	procedure init()
-- 	Initialize the global variable G_SET_NO to the max currently
--  in the dbsrc table. G_SET_NO drives the crnt_dbsrc view,
--	which is used by almost everything else.
--		reads dbsrc table
--		set values of G_SET_NO global variable
--
--	procedure export_public_db_links()
--  A helper for get_db_ddl that cannot conveniently address
--  public db_links. Use a very simple approach: always export
--  all public links; always make them first in dependency order.
--		reads dbsrc_cfg_filter table
--		inserts dbsrc table
--		executes dbms_metadata.get_ddl()
--
--	procedure desc_cfg()
--	Describe the configuration for the current set_no
--	This is a useful readout for mere humans trying to
--	understand what is going on.
--		reads dbsrc_cfg table
--		reads dbsrc_cfg_filter table
--		reads dbsrc_cfg_transform table
--		executes get_cfg_name()
--		writes dbms_output
--
--	procedure set_missing_attrs(
--		p_ddl in clob,
--		p_order_no in number,
--		p_object_owner in out NOCOPY varchar,
--		p_ddl_type in out NOCOPY varchar,
--		p_object_name in out NOCOPY varchar
--	)
--  fill in dbms_metadata blanks
--
--	procedure gather_dbsrc_stats()
--	If dbsrc tables stats are stale or missing, then gather stats.
--		reads user_tab_statistics view
--		executes dbms_stats.gether_tab_stats()
--
--	procedure get_db_ddl()
--  This is where most of the fun happens...  invoke dbms_metadata.get_ddl with
--  all our filters and transforms, for the current database source set.
--		reads dbsrc_cfg_filter table
--		writes dbsrc table
--		executes:
--			export_public_dblinks()
--			dbms_metadata.open()
--			dbms_metadata.set_count()
--			dbms_metadata.set_parse_item()
--			dbms_metadata.get_ddl()
--			dbms_metadata.add_transform()
--			dbms_metadata.set_transform_param()
--			set_missing_attrs()
--			dbms_metadata.close()
--			dbms_session.free_unused_user_memory()
--			dbms_utility.get_time()
--
-- ============================================================================
end dbsrc_mgr;
/


ALTER PACKAGE "DBSRC_U"."DBSRC_MGR"
  COMPILE SPECIFICATION
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2018-10-30 11:45:40'
/

CREATE UNIQUE INDEX "DBSRC_U"."PK_DBSRC_CFG" ON "DBSRC_U"."DBSRC_CFG" ("CFG_NAME")
  ;

CREATE UNIQUE INDEX "DBSRC_U"."PK_DBSRC_CFG_POST_PRCS_01" ON "DBSRC_U"."DBSRC_CFG_POST_PRCS" ("CFG_NAME", "ORDER_NO")
  ;

CREATE UNIQUE INDEX "DBSRC_U"."UK_DBSRC_CFG_FILTER_01" ON "DBSRC_U"."DBSRC_CFG_FILTER" ("CFG_NAME", "FILTER_NAME", "FILTER_VALUE", "OBJECT_TYPE_PATH")
  ;

CREATE UNIQUE INDEX "DBSRC_U"."UK_DBSRC_CFG_TRANSFORM_01" ON "DBSRC_U"."DBSRC_CFG_TRANSFORM" ("CFG_NAME", "TRANSFORM_NAME", "TRANSFORM_VALUE", "OBJECT_TYPE_PATH")
  ;

CREATE UNIQUE INDEX "DBSRC_U"."PK_DBSRC_CFG_DBSCRIPT" ON "DBSRC_U"."DBSRC_CFG_DBSCRIPT" ("CFG_NAME", "DDL_TYPE")
  ;

CREATE UNIQUE INDEX "DBSRC_U"."PK_DBSRC" ON "DBSRC_U"."DBSRC" ("DBSRC_SET_NO", "CFG_NAME", "ORDER_NO")
  ;

CREATE INDEX "DBSRC_U"."X_DBSRC_01" ON "DBSRC_U"."DBSRC" ("DBSCRIPT_INCLUDE_FLAG")
  ;

CREATE INDEX "DBSRC_U"."X_DBSRC_02" ON "DBSRC_U"."DBSRC" ("CFG_NAME")
  ;

CREATE INDEX "DBSRC_U"."X_DBSRC_03" ON "DBSRC_U"."DBSRC" ("DDL_TYPE", "OBJECT_NAME")
  ;

CREATE INDEX "DBSRC_U"."X_DBSRC_04" ON "DBSRC_U"."DBSRC" ("ORDER_NO")
  ;

ALTER TABLE "DBSRC_U"."DBSRC_CFG" ADD CONSTRAINT "PK_DBSRC_CFG" PRIMARY KEY ("CFG_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "DBSRC_U"."DBSRC_CFG_POST_PRCS" ADD CONSTRAINT "PK_DBSRC_CFG_POST_PRCS_01" PRIMARY KEY ("CFG_NAME", "ORDER_NO")
  USING INDEX  ENABLE;

ALTER TABLE "DBSRC_U"."DBSRC_CFG_FILTER" ADD CONSTRAINT "UK_DBSRC_CFG_FILTER_01" UNIQUE ("CFG_NAME", "FILTER_NAME", "FILTER_VALUE", "OBJECT_TYPE_PATH")
  USING INDEX  ENABLE;

ALTER TABLE "DBSRC_U"."DBSRC_CFG_TRANSFORM" ADD CONSTRAINT "UK_DBSRC_CFG_TRANSFORM_01" UNIQUE ("CFG_NAME", "TRANSFORM_NAME", "TRANSFORM_VALUE", "OBJECT_TYPE_PATH")
  USING INDEX  ENABLE;

ALTER TABLE "DBSRC_U"."DBSRC_CFG_DBSCRIPT" ADD CONSTRAINT "PK_DBSRC_CFG_DBSCRIPT" PRIMARY KEY ("CFG_NAME", "DDL_TYPE")
  USING INDEX  ENABLE;

ALTER TABLE "DBSRC_U"."DBSRC" ADD CONSTRAINT "PK_DBSRC" PRIMARY KEY ("DBSRC_SET_NO", "CFG_NAME", "ORDER_NO")
  USING INDEX  ENABLE;

ALTER TABLE "DBSRC_U"."DBSRC" ADD CONSTRAINT "CK_DBSRC_01" CHECK (
    dbscript_include_flag in ('Y', 'N')) ENABLE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "DBSRC_U"."CRNT_DBSRC" ("DBSRC_SET_NO",
"CFG_NAME",
"ORDER_NO",
"OBJECT_OWNER",
"DDL_TYPE",
"OBJECT_NAME",
"DBSRC_TEXT_RAW",
"DBSRC_TEXT_COOKED",
"DBSCRIPT_INCLUDE_FLAG",
"POST_PRCS_ORDER_NO_LIST",
"DBA_OBJ_CREATED_DATE",
"DBA_OBJ_LAST_DDL_TIME",
"DBA_OBJ_STATUS",
"CREATE_DATE",
"CREATE_USER",
"CREATE_PROCESS",
"DBSCRIPT_ORDER_NO",
"DBSCRIPT_DSP_NAME",
"DBSCRIPT_DSP_HEADER_TEXT") AS
  select
        -- dbsrc
        s.dbsrc_set_no,
        s.cfg_name,
        s.order_no,
        s.object_owner,
        s.ddl_type,
        s.object_name,
        s.dbsrc_text_raw,
        s.dbsrc_text_cooked,
        s.dbscript_include_flag,
        s.post_prcs_order_no_list,
        s.dba_obj_created_date,
        s.dba_obj_last_ddl_time,
        s.dba_obj_status,
        s.create_date,
        s.create_user,
        s.create_process,
        --
        -- dbsrc_dbscript
        d.order_no dbscript_order_no,
        d.display_name dbscript_dsp_name,
        d.display_header_text dbscript_dsp_header_text
    from dbsrc s
        -- some ddl_types are not in dbsrc_cfg_dbscript, on purpose
        --  (epilogue, prologue)
        left outer join dbsrc_cfg_dbscript d
            on d.ddl_type = s.ddl_type and
                d.cfg_name = s.cfg_name
    where dbsrc_set_no = dbsrc_mgr.get_set_no;

ALTER TABLE "DBSRC_U"."DBSRC_CFG_POST_PRCS" ADD CONSTRAINT "FK_DBSRC_CFG_POST_PRCS_01" FOREIGN KEY ("CFG_NAME")
	  REFERENCES "DBSRC_U"."DBSRC_CFG" ("CFG_NAME") ENABLE;

ALTER TABLE "DBSRC_U"."DBSRC_CFG_FILTER" ADD CONSTRAINT "FK_DBSRC_CFG_FILTER_01" FOREIGN KEY ("CFG_NAME")
	  REFERENCES "DBSRC_U"."DBSRC_CFG" ("CFG_NAME") ENABLE;

ALTER TABLE "DBSRC_U"."DBSRC_CFG_TRANSFORM" ADD CONSTRAINT "FK_DBSRC_CFG_TRANSFORM_01" FOREIGN KEY ("CFG_NAME")
	  REFERENCES "DBSRC_U"."DBSRC_CFG" ("CFG_NAME") ENABLE;

ALTER TABLE "DBSRC_U"."DBSRC_CFG_DBSCRIPT" ADD CONSTRAINT "FK_DBSRC_CFG_DBSCRIPT_01" FOREIGN KEY ("CFG_NAME")
	  REFERENCES "DBSRC_U"."DBSRC_CFG" ("CFG_NAME") ENABLE;

ALTER TABLE "DBSRC_U"."DBSRC" ADD CONSTRAINT "FK_DBSRC_01" FOREIGN KEY ("CFG_NAME", "DDL_TYPE")
	  REFERENCES "DBSRC_U"."DBSRC_CFG_DBSCRIPT" ("CFG_NAME", "DDL_TYPE") DISABLE;

