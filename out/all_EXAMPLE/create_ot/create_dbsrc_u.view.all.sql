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

