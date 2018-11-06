CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$WST_I_TRIG" instead of insert on wmsys.wm$workspace_savepoints_table for each row
declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$workspace_savepoints_t$f(:new.is_implicit) ;

  insert into wmsys.wm$workspace_savepoints_table$(workspace#, savepoint, version, owner, createtime, description, wm$flag)
  values (ws#, :new.savepoint, :new.version, :new.owner, :new.createtime, :new.description, flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$WT_I_TRIG" instead of insert on wmsys.wm$workspaces_table for each row
declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.parent_workspace) ;


  last_change     timestamp with time zone := :new.last_change ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$workspaces_table$f(:new.freeze_status, :new.freeze_mode, :new.wm_lockmode,
                                                    :new.isrefreshed, :new.session_duration, :new.cr_status) ;

  if (last_change is null) then
    last_change := systimestamp ;
  end if ;

  insert into wmsys.wm$workspaces_table$(workspace, parent_workspace#, current_version, parent_version, post_version,
                                         owner, createtime, description, workspace_lock_id, freeze_writer, freeze_owner,
                                         sync_parver, last_change, depth, mp_root, wm$flag)
  values (:new.workspace, ws#, :new.current_version, :new.parent_version, :new.post_version, :new.owner, :new.createtime,
          :new.description, :new.workspace_lock_id, :new.freeze_writer, :new.freeze_owner,
          :new.sync_parver, last_change, :new.depth, :new.mp_root, flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$WT_U_TRIG" instead of update on wmsys.wm$workspaces_table for each row
declare
  sqlstr  varchar2(32000) ;
  flag_v  integer := 0;
begin
  if (updating('FREEZE_STATUS') or updating('FREEZE_MODE') or updating('WM_LOCKMODE') or
     updating('ISREFRESHED') or updating('SESSION_DURATION') or updating('CR_STATUS')) then
    flag_v := wmsys.owm_dml_pkg.wm$workspaces_table$f(:new.freeze_status, :new.freeze_mode, :new.wm_lockmode,
                                                      :new.isrefreshed, :new.session_duration, :new.cr_status) ;
    sqlstr := sqlstr || ' wm$flag=:1' ;
  end if ;

  if (updating('CURRENT_VERSION')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' current_version=:2' ;
  end if;

  if (updating('PARENT_VERSION')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' parent_version=:3' ;
  end if;

  if (updating('POST_VERSION')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' post_version=:4' ;
  end if;

  if (updating('DESCRIPTION')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' description=:5' ;
  end if;

  if (updating('FREEZE_WRITER')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' freeze_writer=:6' ;
  end if;

  if (updating('FREEZE_OWNER')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' freeze_owner=:7' ;
  end if;

  if (updating('SYNC_PARVER')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' sync_parver=:8' ;
  end if;

  if (updating('LAST_CHANGE')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' last_change=:9' ;
  end if;

  if (updating('MP_ROOT')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' mp_root=:10' ;
  end if;

  if (sqlstr is not null) then
    execute immediate
      'begin
         if (1=2 and (:1 is null or :2 is null or :3 is null or :4 is null or :5 is null or :6 is null or
                      :7 is null or :8 is null or :9 is null or :10 is null or :11 is null)) then
           null ;
         end if;

         update wmsys.wm$workspaces_table$
         set ' || substr(sqlstr, 2) || '
         where workspace_lock_id=:11;
       end;' using flag_v, :new.current_version, :new.parent_version, :new.post_version, :new.description, :new.freeze_writer,
                   :new.freeze_owner, :new.sync_parver, :new.last_change, :new.mp_root, :old.workspace_lock_id ;
  end if ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$WT_D_TRIG" instead of delete on wmsys.wm$workspaces_table for each row
begin
  delete wmsys.wm$batch_compressible_tables$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$lockrows_info$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$mp_graph_workspaces_table$
  where mp_leaf_workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$mp_graph_workspaces_table$
  where mp_graph_workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$mp_parent_workspaces_table$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$mp_parent_workspaces_table$
  where parent_workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$mw_table$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$resolve_workspaces_table$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$version_hierarchy_table$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$version_table$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$version_table$
  where anc_workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$workspace_priv_table$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$workspace_savepoints_table$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$workspaces_table$
  where workspace_lock_id=:old.workspace_lock_id ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$VTH_I_TRIG" instead of insert on wmsys.wm$versioned_tables$h for each row
declare
  flag_v integer := 0;


  repsitecount integer := :new.repsitecount ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$versioned_tables$f(:new.disabling_ver, :new.hist, :new.validtime, :new.bl_savepoint,
                                                    :new.bl_check_for_duplicates, :new.bl_single_transaction) ;

  if (repsitecount is null) then
    repsitecount := 0 ;
  end if ;

  insert into wmsys.wm$versioned_tables$(vtid#, table_name, owner, ricweight,
                                         pkey_cols, undo_code, siteslist, repsitecount, bl_version, wm$flag)
  values (:new.vtid, :new.table_name, :new.owner, :new.ricweight, :new.pkey_cols, :new.undo_code,
          :new.siteslist, repsitecount, :new.bl_version, flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$VTH_U_TRIG" instead of update on wmsys.wm$versioned_tables$h for each row
declare
  sqlstr  varchar2(32000) ;
  flag_v  integer := 0;
begin
  if (updating('DISABLING_VER') or updating('HIST') or updating('VALIDTIME') or
      updating('BL_SAVEPOINT') or updating('BL_CHECK_FOR_DUPLICATES') or updating('BL_SINGLE_TRANSACTION')) then
    flag_v := wmsys.owm_dml_pkg.wm$versioned_tables$f(:new.disabling_ver, :new.hist, :new.validtime, :new.bl_savepoint,
                                                      :new.bl_check_for_duplicates, :new.bl_single_transaction) ;
    sqlstr := sqlstr || ' wm$flag=:1' ;
  end if ;

  if (updating('RICWEIGHT')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' ricweight=:2' ;
  end if;

  if (updating('PKEY_COLS')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' pkey_cols=:3' ;
  end if;

  if (updating('UNDO_CODE')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' undo_code=:4' ;
  end if;

  if (updating('SITESLIST')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' siteslist=:5' ;
  end if;

  if (updating('REPSITECOUNT')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' repsitecount=:6' ;
  end if;

  if (updating('BL_VERSION')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' bl_version=:7' ;
  end if;

  if (sqlstr is not null) then
    execute immediate
      'begin
         if (1=2 and (:1 is null or :2 is null or :3 is null or :4 is null or :5 is null or
                      :6 is null or :7 is null or :8 is null or :9 is null)) then
           null ;
         end if;

         update wmsys.wm$versioned_tables$
         set ' || substr(sqlstr, 2) || '
         where owner=:8 and table_name=:9;
       end;' using flag_v, :new.ricweight, :new.pkey_cols, :new.undo_code, :new.siteslist, :new.repsitecount, :new.bl_version,
                   :old.owner, :old.table_name ;
  end if ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$VTH_D_TRIG" instead of delete on wmsys.wm$versioned_tables$h for each row
begin
  delete wmsys.wm$batch_compressible_tables$
  where vtid#=:old.vtid ;

  delete wmsys.wm$constraints_table$
  where vtid#=:old.vtid ;

  delete wmsys.wm$cons_columns$
  where vtid#=:old.vtid ;

  delete wmsys.wm$hint_table$
  where vtid#=:old.vtid ;

  delete wmsys.wm$lockrows_info$
  where vtid#=:old.vtid ;

  delete wmsys.wm$modified_tables$
  where vtid#=:old.vtid ;

  delete wmsys.wm$nested_columns_table$
  where vtid#=:old.vtid ;

  delete wmsys.wm$ric_table$
  where ct_vtid#=:old.vtid ;

  delete wmsys.wm$ric_triggers_table$
  where ct_vtid#=:old.vtid ;

  delete wmsys.wm$udtrig_dispatch_procs$
  where vtid#=:old.vtid ;

  delete wmsys.wm$udtrig_info$
  where vtid#=:old.vtid ;

  delete wmsys.wm$vt_errors_table$
  where vtid#=:old.vtid ;

  delete wmsys.wm$versioned_tables$
  where vtid#=:old.vtid ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$VTH_NT_I_TRIG" instead of insert on nested table undo_code of wmsys.wm$versioned_tables$h for each row
begin
  insert into table(select undo_code from wmsys.wm$versioned_tables$ where owner=:parent.owner and table_name=:parent.table_name)
  values(:new.index_type, :new.index_field, :new.sql_str) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$VTH_NT_U_TRIG" instead of update on nested table undo_code of wmsys.wm$versioned_tables$h for each row
begin
  update table (select undo_code from wmsys.wm$versioned_tables$ where owner=:parent.owner and table_name=:parent.table_name)
  set sql_str = :new.sql_str
  where index_type  = index_type and
        index_field = index_field ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$VTH_NT_D_TRIG" instead of delete on nested table undo_code of wmsys.wm$versioned_tables$h for each row
begin
  delete table (select undo_code from wmsys.wm$versioned_tables$ where owner=:parent.owner and table_name=:parent.table_name)
  where index_type  = :old.index_type and
        index_field = :old.index_field ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$BCT_I_TRIG" instead of insert on wmsys.wm$batch_compressible_tables for each row
declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
  vtid   integer := wmsys.ltUtil.getVtid(substr(upper(:new.table_name), 1, instr(:new.table_name, '.')-1),
                                         substr(upper(:new.table_name), instr(:new.table_name, '.')+1)) ;
begin
  insert into wmsys.wm$batch_compressible_tables$(workspace#, vtid#, begin_version, end_version, where_clause)
  values (ws#, vtid, :new.begin_version, :new.end_version, :new.where_clause) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$CC_I_TRIG" instead of insert on wmsys.wm$cons_columns for each row
declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.owner, :new.table_name) ;
begin
  insert into wmsys.wm$cons_columns$(vtid#, constraint_name, column_name, position)
  values (vtid, :new.constraint_name, :new.column_name, :new.position) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$CT_I_TRIG" instead of insert on wmsys.wm$constraints_table for each row
declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.owner, :new.table_name) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$constraints_table$f(:new.constraint_type, :new.status, :new.index_type) ;

  insert into wmsys.wm$constraints_table$(vtid#, constraint_name, search_condition, index_owner, index_name, aliasedcolumns, numindexcols, wm$flag)
  values (vtid, :new.constraint_name, :new.search_condition, :new.index_owner, :new.index_name, :new.aliasedcolumns, :new.numindexcols, flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$CT_U_TRIG" instead of update on wmsys.wm$constraints_table for each row
declare
  sqlstr  varchar2(32000) ;
  flag_v  integer := 0;
  vtid    integer := wmsys.ltUtil.getVtid(:old.owner, :old.table_name) ;
begin
  if (updating('STATUS')) then
    flag_v := wmsys.owm_dml_pkg.wm$constraints_table$f(:new.constraint_type, :new.status, :new.index_type) ;
    sqlstr := sqlstr || ' wm$flag=:1' ;
  end if ;

  if (updating('CONSTRAINT_NAME')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' constraint_name=:2' ;
  end if;

  if (updating('INDEX_NAME')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' index_name=:3' ;
  end if;

  if (updating('ALIASEDCOLUMNS')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' aliasedcolumns=:4' ;
  end if;

  if (updating('NUMINDEXCOLS')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' numindexcols=:5' ;
  end if;

  if (sqlstr is not null) then
    execute immediate
      'begin
         if (1=2 and (:1 is null or :2 is null or :3 is null or :4 is null or :5 is null or :6 is null or :7 is null or :8 is null)) then
           null ;
         end if;

         update wmsys.wm$constraints_table$
         set ' || substr(sqlstr, 2) || '
         where vtid#=:6 and constraint_name=:7 and bitand(wm$flag, 8)=decode(:8, ''DISABLED'', 0, ''ENABLED'', 8);
       end;' using flag_v, :new.constraint_name, :new.index_name, :new.aliasedcolumns, :new.numindexcols,
                   vtid, :old.constraint_name, :old.status ;
  end if ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$EV_I_TRIG" instead of insert on wmsys.wm$env_vars for each row
declare
  flag_v integer := 0;
begin
  flag_v := wmsys.owm_dml_pkg.wm$env_vars$f(:new.hidden) ;

  insert into wmsys.wm$env_vars$(name, value, wm$flag)
  values (:new.name, :new.value, flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$EI_I_TRIG" instead of insert on wmsys.wm$events_info for each row
declare
  flag_v integer := 0;
begin
  flag_v := wmsys.owm_dml_pkg.wm$events_info$f(:new.capture) ;

  insert into wmsys.wm$events_info$(event_name, wm$flag)
  values (:new.event_name, flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$EI_U_TRIG" instead of update on wmsys.wm$events_info for each row
declare
  sqlstr  varchar2(32000) ;
  flag_v  integer := 0;
begin
  if (updating('CAPTURE')) then
    flag_v := wmsys.owm_dml_pkg.wm$events_info$f(:new.capture) ;
    sqlstr := sqlstr || ' wm$flag=:1' ;
  end if ;

  if (sqlstr is not null) then
    execute immediate
      'begin
         if (1=2 and (:1 is null or :2 is null)) then
           null ;
         end if;

         update wmsys.wm$events_info$
         set ' || substr(sqlstr, 2) || '
         where event_name=:2;
       end;' using flag_v, :old.event_name ;
  end if ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$HT_I_TRIG" instead of insert on wmsys.wm$hint_table for each row
declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.owner, :new.table_name) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$hint_table$f(:new.isdefault) ;

  insert into wmsys.wm$hint_table$(hint_id, vtid#, hint_text, wm$flag)
  values (:new.hint_id, vtid, :new.hint_text, flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$LI_I_TRIG" instead of insert on wmsys.wm$lockrows_info for each row
declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
  vtid   integer := wmsys.ltUtil.getVtid(:new.owner, :new.table_name) ;
begin
  insert into wmsys.wm$lockrows_info$(workspace#, vtid#, where_clause)
  values (ws#, vtid, :new.where_clause) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$MT_I_TRIG" instead of insert on wmsys.wm$modified_tables for each row
declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
  vtid   integer := wmsys.ltUtil.getVtid(substr(upper(:new.table_name), 1, instr(:new.table_name, '.')-1),
                                         substr(upper(:new.table_name), instr(:new.table_name, '.')+1)) ;
begin
  insert into wmsys.wm$modified_tables$(vtid#, version, workspace#)
  values (vtid, :new.version, ws#) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$MGWT_I_TRIG" instead of insert on wmsys.wm$mp_graph_workspaces_table for each row
declare
  flag_v integer := 0;
  ws#1   integer := wmsys.ltUtil.getWorkspaceLockId(:new.mp_leaf_workspace) ;
  ws#2   integer := wmsys.ltUtil.getWorkspaceLockId(:new.mp_graph_workspace) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$mp_graph_workspaces_table$f(:new.mp_graph_flag) ;

  insert into wmsys.wm$mp_graph_workspaces_table$(mp_leaf_workspace#, mp_graph_workspace#, anc_version, wm$flag)
  values (ws#1, ws#2, :new.anc_version, flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$MPWT_I_TRIG" instead of insert on wmsys.wm$mp_parent_workspaces_table for each row
declare
  flag_v integer := 0;
  ws#1   integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
  ws#2   integer := wmsys.ltUtil.getWorkspaceLockId(:new.parent_workspace) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$mp_parent_workspaces_t$f(:new.isrefreshed, :new.parent_flag) ;

  insert into wmsys.wm$mp_parent_workspaces_table$(workspace#, parent_workspace#, parent_version, creator, createtime, wm$flag)
  values (ws#1, ws#2, :new.parent_version, :new.creator, :new.createtime, flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$MW_I_TRIG" instead of insert on wmsys.wm$mw_table for each row
declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
begin
  insert into wmsys.wm$mw_table$(workspace#)
  values (ws#) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$NCT_I_TRIG" instead of insert on wmsys.wm$nested_columns_table for each row
declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.owner, :new.table_name) ;
begin
  insert into wmsys.wm$nested_columns_table$(vtid#, column_name, position, type_owner, type_name, nt_owner, nt_name, nt_store)
  values (vtid, :new.column_name, :new.position, :new.type_owner, :new.type_name, :new.nt_owner, :new.nt_name, :new.nt_store) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$NT_I_TRIG" instead of insert on wmsys.wm$nextver_table for each row
declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
begin
  insert into wmsys.wm$nextver_table$(version, workspace#, next_vers, split)
  values (:new.version, ws#, :new.next_vers, :new.split) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$RWST_I_TRIG" instead of insert on wmsys.wm$removed_workspaces_table for each row
declare
  flag_v integer := 0;
begin
  flag_v := wmsys.owm_dml_pkg.wm$removed_workspaces_table$f(:new.isrefreshed) ;

  insert into wmsys.wm$removed_workspaces_table$(owner, workspace_name, workspace_id, parent_workspace_id,
                                                 createtime, retiretime, description, mp_root_id, wm$flag)
  values (:new.owner, :new.workspace_name, :new.workspace_id, :new.parent_workspace_id,
          :new.createtime, :new.retiretime, :new.description, :new.mp_root_id, flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$REPT_I_TRIG" instead of insert on wmsys.wm$replication_table for each row
declare
  flag_v integer := 0;
begin
  flag_v := wmsys.owm_dml_pkg.wm$env_vars$f(1) ;

  insert into wmsys.wm$env_vars$ values('REPLICATION_DETAILS',
                                       :new.groupname || '|' || :new.masterdefsite || '|' || (case :new.iswritersite when 'Y' then 'Y' else 'N' end),
                                       flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$RT_U_TRIG" instead of update on wmsys.wm$replication_table for each row
declare
  sqlstr  varchar2(32000) ;
  flag_v  integer := 0;
begin
  update wmsys.wm$env_vars$
  set value = :new.groupname || '|' || :new.masterdefsite || '|' || (case :new.iswritersite when 'Y' then 'Y' else 'N' end)
  where name = 'REPLICATION_DETAILS' ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$RWT_I_TRIG" instead of insert on wmsys.wm$resolve_workspaces_table for each row
declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$resolve_workspaces_table$f(:new.oldfreezemode) ;

  insert into wmsys.wm$resolve_workspaces_table$(workspace#, resolve_user, undo_sp#, oldfreezewriter, wm$flag)
  values (ws#, :new.resolve_user, :new.undo_sp_ver, :new.oldfreezewriter, flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$RLT_I_TRIG" instead of insert on wmsys.wm$ric_locking_table for each row
declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.pt_owner, :new.pt_name) ;
begin
  insert into wmsys.wm$ric_locking_table$(pt_vtid#, slockno, elockno)
  values (vtid, :new.slockno, :new.elockno) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$RT_I_TRIG" instead of insert on wmsys.wm$ric_table for each row
declare
  flag_v integer := 0;
  vtid1  integer := wmsys.ltUtil.getVtid(:new.ct_owner, :new.ct_name) ;
  vtid2  integer := wmsys.ltUtil.getVtid(:new.pt_owner, :new.pt_name) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$ric_table$f(:new.my_mode, :new.status) ;

  insert into wmsys.wm$ric_table$(ct_vtid#, pt_vtid#, ric_name, ct_cols, pt_cols, pt_unique_const_name, wm$flag)
  values (vtid1, vtid2, :new.ric_name, :new.ct_cols, :new.pt_cols, :new.pt_unique_const_name, flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$RTT_I_TRIG" instead of insert on wmsys.wm$ric_triggers_table for each row
declare
  flag_v integer := 0;
  vtid1  integer := wmsys.ltUtil.getVtid(:new.pt_owner, :new.pt_name) ;
  vtid2  integer := wmsys.ltUtil.getVtid(:new.ct_owner, :new.ct_name) ;
begin
  insert into wmsys.wm$ric_triggers_table$(pt_vtid#, ct_vtid#, trig#)
  values (vtid1, vtid2, regexp_substr(:new.update_trigger_name, '[[:digit:]]+$')) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$SAV_I_TRIG" instead of insert on wmsys.wm$sysparam_all_values for each row
declare
  flag_v integer := 0;
begin
  flag_v := wmsys.owm_dml_pkg.wm$sysparam_all_values$f(:new.isdefault, :new.hidden) ;

  insert into wmsys.wm$sysparam_all_values$(name, value, wm$flag)
  values (:new.name, :new.value, flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$UDP_I_TRIG" instead of insert on wmsys.wm$udtrig_dispatch_procs for each row
declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.table_owner_name, :new.table_name) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$udtrig_dispatch_procs$f(:new.trig_flag) ;

  insert into wmsys.wm$udtrig_dispatch_procs$(vtid#, proc#, wm$flag)
  values (vtid, regexp_substr(:new.dispatcher_name, '[[:digit:]]+$'), flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$UI_I_TRIG" instead of insert on wmsys.wm$udtrig_info for each row
declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.table_owner_name, :new.table_name) ;
  trig_t integer ;
  u_flag boolean ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$udtrig_info$f(:new.trig_flag, :new.status, :new.internal_type, :new.event_flag) ;

  insert into wmsys.wm$udtrig_info$(trig_owner_name, trig_name, vtid#, proc#, when_clause, description, trig_code, wm$flag)
  values (:new.trig_owner_name, :new.trig_name, vtid, regexp_substr(:new.trig_procedure, '[[:digit:]]+$'),
          :new.when_clause, :new.description, :new.trig_code, flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$UD_U_TRIG" instead of update on wmsys.wm$udtrig_info for each row
declare
  sqlstr  varchar2(32000) ;
  flag_v  integer := 0;
  vtid    integer := wmsys.ltUtil.getVtid(:new.table_owner_name, :new.table_name) ;
  trig_t  integer ;
  u_flag  boolean ;
begin
  if (updating('TRIG_FLAG') or updating('EVENT_FLAG')) then
    flag_v := wmsys.owm_dml_pkg.wm$udtrig_info$f(:new.trig_flag, :new.status, :new.internal_type, :new.event_flag) ;
    sqlstr := sqlstr || ' wm$flag=:1' ;
  end if ;

  if (updating('TRIG_PROCEDURE')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' proc#=:2' ;
  end if;

  if (updating('DESCRIPTION')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' description=:3' ;
  end if;

  if (sqlstr is not null) then
    execute immediate
      'begin
         if (1=2 and (:1 is null or :2 is null or :3 is null or :4 is null or :5 is null)) then
           null ;
         end if;

         update wmsys.wm$udtrig_info$
         set ' || substr(sqlstr, 2) || '
         where trig_owner_name=:4 and trig_name=:5;
       end;' using flag_v, regexp_substr(:new.trig_procedure, '[[:digit:]]+$'), :new.description, :old.trig_owner_name, :old.trig_name ;
  end if ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$VHT_I_TRIG" instead of insert on wmsys.wm$version_hierarchy_table for each row
declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
begin
  insert into wmsys.wm$version_hierarchy_table$(version, parent_version, workspace#)
  values (:new.version, :new.parent_version, ws#) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$VT_I_TRIG" instead of insert on wmsys.wm$version_table for each row
declare
  flag_v integer := 0;
  ws#1   integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
  ws#2   integer := wmsys.ltUtil.getWorkspaceLockId(:new.anc_workspace) ;


  refcount integer := :new.refcount ;
begin
  if (refcount is null) then
    refcount := 0 ;
  end if ;

  insert into wmsys.wm$version_table$(workspace#, anc_workspace#, anc_version, anc_depth, refcount)
  values (ws#1, ws#2, :new.anc_version, :new.anc_depth, refcount) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$VET_I_TRIG" instead of insert on wmsys.wm$vt_errors_table for each row
declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.owner, :new.table_name) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$vt_errors_table$f(:new.status) ;

  insert into wmsys.wm$vt_errors_table$(vtid#, index_type, index_field, error_msg, wm$flag)
  values (vtid, :new.index_type, :new.index_field, :new.error_msg, flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$VET_U_TRIG" instead of update on wmsys.wm$vt_errors_table for each row
declare
  sqlstr  varchar2(32000) ;
  flag_v  integer := 0;
  vtid    integer := wmsys.ltUtil.getVtid(:old.owner, :old.table_name) ;
begin
  if (updating('STATUS')) then
    flag_v := wmsys.owm_dml_pkg.wm$vt_errors_table$f(:new.status) ;
    sqlstr := sqlstr || ' wm$flag=:1' ;
  end if ;

  if (updating('ERROR_MSG')) then
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' error_msg=:2' ;
  end if;

  if (sqlstr is not null) then
    execute immediate
      'begin
         if (1=2 and (:1 is null or :2 is null or :3 is null)) then
           null ;
         end if;

         update wmsys.wm$vt_errors_table$
         set ' || substr(sqlstr, 2) || '
         where vtid#=:3;
       end;' using flag_v, :new.error_msg, vtid ;
  end if ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$WPT_I_TRIG" instead of insert on wmsys.wm$workspace_priv_table for each row
declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$workspace_priv_table$f(:new.priv, :new.admin) ;

  insert into wmsys.wm$workspace_priv_table$(grantee, workspace#, grantor, wm$flag)
  values (:new.grantee, ws#, :new.grantor, flag_v) ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$WPT_U_TRIG" instead of update on wmsys.wm$workspace_priv_table for each row
declare
  sqlstr  varchar2(32000) ;
  flag_v  integer := 0;
  ws#     integer := wmsys.ltUtil.getWorkspaceLockId(:old.workspace) ;
begin
  if (updating('ADMIN')) then
    flag_v := wmsys.owm_dml_pkg.wm$workspace_priv_table$f(:new.priv, :new.admin) ;
    sqlstr := sqlstr || (case when sqlstr is not null then ',' else null end) || ' wm$flag=:1' ;
  end if ;

  if (sqlstr is not null) then
    execute immediate
      'begin
         if (1=2 and (:1 is null or :2 is null or :3 is null or :4 is null)) then
           null ;
         end if;

         if (:3 is not null) then
           update wmsys.wm$workspace_priv_table$
           set ' || substr(sqlstr, 2) || '
           where grantee = :2 and
                 workspace# = :3 and
                 bitand(wm$flag, 31) = decode(:4, null, 0, ''U'', 0,
                                                  ''A'', 1, ''M'', 2, ''R'', 3, ''D'', 4, ''C'', 5, ''F'', 6, ''G'', 13,
                                                  ''AA'', 7, ''MA'', 8, ''RA'', 9, ''DA'', 10, ''CA'', 11, ''FA'', 12, ''GA'', 14,
                                                  ''W'', 15) ;
         else
           update wmsys.wm$workspace_priv_table$
           set ' || substr(sqlstr, 2) || '
           where grantee = :2 and
                 workspace# is null and
                 bitand(wm$flag, 31) = decode(:4, null, 0, ''U'', 0,
                                                  ''A'', 1, ''M'', 2, ''R'', 3, ''D'', 4, ''C'', 5, ''F'', 6, ''G'', 13,
                                                  ''AA'', 7, ''MA'', 8, ''RA'', 9, ''DA'', 10, ''CA'', 11, ''FA'', 12, ''GA'', 14,
                                                  ''W'', 15) ;
         end if ;
       end;' using flag_v, :old.grantee, ws#, :old.priv ;
  end if ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."WM$WPT_D_TRIG" instead of delete on wmsys.wm$workspace_priv_table for each row
declare
  ws#     integer := wmsys.ltUtil.getWorkspaceLockId(:old.workspace) ;
  flag_v  integer := wmsys.owm_dml_pkg.wm$workspace_priv_table$f(:old.priv, null) ;
begin
  if (ws# is not null) then
    delete wmsys.wm$workspace_priv_table$ where grantee=:old.grantee and workspace#=ws# and bitand(wm$flag, 31) = flag_v ;
  else
    delete wmsys.wm$workspace_priv_table$ where grantee=:old.grantee and workspace# is null and bitand(wm$flag, 31) = flag_v ;
  end if ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."NO_VM_DDL" before alter or create or drop or rename or truncate on database
   WHEN ((ora_sysevent in ('ALTER', 'RENAME', 'TRUNCATE') and ora_dict_obj_type in ('INDEX','TABLE')) or
        (ora_sysevent = 'CREATE' and ora_dict_obj_type in ('INDEX', 'PROCEDURE', 'TRIGGER', 'VIEW')) or
        (ora_sysevent = 'DROP' and ora_dict_obj_type in ('INDEX', 'PROCEDURE', 'ROLE', 'TABLE', 'TRIGGER', 'TYPE', 'USER', 'VIEW'))) declare
  validStack  integer ;
begin
  if (sys_context('lt_ctx', 'allowDDLOperation')='true') then
    return ;
  end if ;

  if (sys_context('lt_ctx', 'validStack') is null or sys_context('lt_ctx', 'validStack') != 'YES') then
    validStack := 0 ;
  else
    validStack := 1 ;
  end if ;

  if (ora_sysevent='CREATE') then
    wmsys.ltadm.no_vm_create_proc(ora_dict_obj_type, ora_dict_obj_name, ora_dict_obj_owner, validStack) ;
  elsif (ora_sysevent='DROP') then
    wmsys.ltadm.no_vm_drop_proc(ora_dict_obj_type, ora_dict_obj_name, ora_dict_obj_owner, validStack) ;
  elsif (ora_sysevent in ('ALTER', 'RENAME', 'TRUNCATE')) then
    wmsys.ltadm.no_vm_alter_proc(ora_dict_obj_type, ora_dict_obj_name, ora_dict_obj_owner, validStack) ;
  end if ;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "WMSYS"."NO_VM_DROP_A" after drop on database  WHEN (ora_dict_obj_type in ('USER')) begin
  wmsys.lt_ctx_pkg.allowDDLOperation('false') ;



end;
/

