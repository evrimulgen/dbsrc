-- [dbsrc POST-PROCESSED]:
-- (8) Add "show errors" after all stored code to make log files more useful.
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
show errors;

