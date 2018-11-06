CREATE OR REPLACE NONEDITIONABLE TYPE "APEX_040200"."WWV_FLOW_TREE_ENTRY" as object
( seq      number,
  lev      number,
  id       varchar2(4000),
  pid      varchar2(4000),
  kids     number,
  expand   varchar2(1),
  indent   varchar2(4000),
  name     varchar2(4000),
  link     varchar2(4000),
  a1       varchar2(4000),
  a2       varchar2(4000) )
/

CREATE OR REPLACE NONEDITIONABLE TYPE "APEX_040200"."WWV_FLOW_TREE_NUM_ARR" as table of number not null
/

CREATE OR REPLACE NONEDITIONABLE TYPE "APEX_040200"."VC4000ARRAY" as table of varchar2(32767)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "APEX_040200"."T_TEMP_LOV_VALUE" is object (
    insert_order number,
    disp         varchar2(4000),
    val          varchar2(4000) )
/

CREATE OR REPLACE NONEDITIONABLE TYPE "APEX_040200"."WWV_FLOW_TREE_SUBS" as table of wwv_flow_tree_entry not null;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "APEX_040200"."T_TEMP_LOV_DATA" is table of t_temp_lov_value
/

