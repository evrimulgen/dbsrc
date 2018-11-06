CREATE OR REPLACE NONEDITIONABLE TRIGGER "XDB"."XDBCONFIG_VALIDATE" before insert or update
on xdb.XDB$CONFIG for each row
declare
  xdoc xmltype;
begin
  xdoc := :new.sys_nc_rowinfo$;
  xmltype.schemaValidate(xdoc);
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "XDB"."XDB_PV_TRIG" INSTEAD OF insert or delete or update
on xdb.path_view for each row
begin
  if inserting then
    xdb.xdb_pvtrig_pkg.pvtrig_ins(:new.res, :new.link, :new.path);

    /* check that either the REF or the BLOB columns are filled, not both */
  end if;

  if deleting then
     xdb.xdb_pvtrig_pkg.pvtrig_del(:old.res, :old.link, :old.path);

    /* check if we get the correct values from two tables in a view */
  end if;

  if updating then
     xdb.xdb_pvtrig_pkg.pvtrig_upd(:old.res,    :new.res,
                               :old.link,   :new.link,
                               :old.path,   :new.path );
  end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "XDB"."XDB_RV_TRIG" INSTEAD OF insert or delete or update
on xdb.resource_view for each row
begin
  if inserting then
    xdb_rvtrig_pkg.rvtrig_ins(:new.res, :new.any_path);


  end if;

  if deleting then
     xdb_rvtrig_pkg.rvtrig_del(:old.res, :old.any_path);


  end if;

  if updating then
     xdb_rvtrig_pkg.rvtrig_upd(:old.res,    :new.res,
                               :old.any_path,   :new.any_path );
  end if;
end;
/

