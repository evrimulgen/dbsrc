CREATE OR REPLACE NONEDITIONABLE TYPE "WMSYS"."WM$ED_UNDO_CODE_NODE_TYPE"
         as object (index_type   integer,
                    index_field  integer,
                    sql_str      clob)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "WMSYS"."WM$LOCK_INFO_TYPE"
      as object (table_owner  varchar2(128),
                 table_name   varchar2(128),
                 info         varchar2(100))
/

CREATE OR REPLACE NONEDITIONABLE TYPE "WMSYS"."WM$NEXTVER_EXP_TYPE"
         as object (next_vers  integer,
                    orig_nv    varchar2(500),
                    rid        varchar2(100))
/

CREATE OR REPLACE NONEDITIONABLE TYPE "WMSYS"."WM$NV_PAIR_TYPE"
         as object (name   varchar2(100),
                    value  clob)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "WMSYS"."WM$OPER_LOCKVALUES_TYPE"
         as object (parValue    integer,
                    curValue    integer,
                    interValue  integer)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "WMSYS"."WM$IDENT_TAB_TYPE" as table of varchar2(128)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "WMSYS"."WM_PERIOD"
         as object (validfrom timestamp with time zone,
                    validtill timestamp with time zone)
 alter type       "WMSYS"."WM_PERIOD" add MAP member function wm_period_map return varchar2 cascade
/

CREATE OR REPLACE NONEDITIONABLE TYPE "WMSYS"."WM$EXP_MAP_TYPE"
         as object (code     integer,
                    nfield1  number,
                    nfield2  number,
                    nfield3  number,
                    vfield1  varchar2(128),
                    vfield2  varchar2(128),
                    vfield3  clob)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "WMSYS"."WM$ED_UNDO_CODE_TABLE_TYPE"
         as table of wmsys.wm$ed_undo_code_node_type
/

CREATE OR REPLACE NONEDITIONABLE TYPE "WMSYS"."WM$LOCK_TABLE_TYPE"
        as table of wmsys.wm$lock_info_type
/

CREATE OR REPLACE NONEDITIONABLE TYPE "WMSYS"."WM$NEXTVER_EXP_TAB_TYPE" as table of wmsys.wm$nextver_exp_type
/

CREATE OR REPLACE NONEDITIONABLE TYPE "WMSYS"."WM$NV_PAIR_NT_TYPE"
        as table of WMSYS.WM$NV_PAIR_TYPE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "WMSYS"."WM$OPER_LOCKVALUES_ARRAY_TYPE" as varray(50) of wmsys.wm$oper_lockvalues_type
/

CREATE OR REPLACE NONEDITIONABLE TYPE "WMSYS"."WM$EXP_MAP_TAB" as table of wmsys.wm$exp_map_type
/

CREATE OR REPLACE NONEDITIONABLE TYPE "WMSYS"."WM$EVENT_TYPE"
         as object (event_name             varchar2(128),
                    workspace_name         varchar2(128),
                    parent_workspace_name  varchar2(128),
                    user_name              varchar2(128),
                    table_name             varchar2(128),
                    aux_params             wmsys.wm$nv_pair_nt_type)
/

