CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_FEATURE_USAGE_UPDATE"
AFTER UPDATE OR DELETE ON MDSYS.SDO_FEATURE_USAGE
FOR EACH ROW
BEGIN
  mdsys.mdprvt_feature.sdo_invalidate_feature(:old.feature_name);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."CHK_SDO_DIMNAME"
  BEFORE INSERT OR UPDATE ON MDSYS.SDO_GEOM_METADATA_TABLE
  FOR EACH ROW
DECLARE
  cnt   NUMBER;
  res   NUMBER;
BEGIN
  FOR cnt IN 1 .. :NEW.sdo_diminfo.COUNT LOOP



    SELECT REGEXP_INSTR(:NEW.sdo_diminfo(cnt).sdo_dimname, '[^[:alnum:]_]')
      INTO res FROM DUAL;
    IF (res > 0) THEN
      mderr.raise_md_error('MD', 'SDO_GEOM_METADATA_TABLE',-13249,
      'Only alphanumeric characters and "_" are allowed in SDO_DIMNAME');
    END IF;

  END LOOP;


  mdsys.mdprvt_gmd.invalidate_geom_metadata(:new.sdo_owner,
                                            :new.sdo_table_name,
                                            :new.sdo_column_name);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_GEOM_METADATA_UPDATE"
AFTER UPDATE OR DELETE ON MDSYS.SDO_GEOM_METADATA_TABLE
FOR EACH ROW
BEGIN
  mdsys.mdprvt_gmd.invalidate_geom_metadata(:old.sdo_owner,
                                            :old.sdo_table_name,
                                            :old.sdo_column_name);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_INDEX_METADATA_UPDATE"
AFTER UPDATE OR DELETE ON MDSYS.SDO_INDEX_METADATA_TABLE
FOR EACH ROW
BEGIN


  mdsys.mdprvt_idx.invalidate_cache(:old.sdo_index_owner,
                                    :old.sdo_index_name,
                                    :old.sdo_index_partition,
                                    :old.sdo_index_table);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."OGIS_CRS_DELETE_TRIGGER"
BEFORE
  DELETE
ON
  MDSYS.ogis_spatial_reference_systems
FOR EACH ROW
BEGIN
  DELETE FROM MDSYS.sdo_coord_ref_system WHERE SRID = :old.srid;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."OGIS_CRS_INSERT_TRIGGER"
BEFORE
  INSERT
ON
  MDSYS.ogis_spatial_reference_systems
FOR EACH ROW
BEGIN
  IF(nls_upper(TRIM(:new.srtext)) like 'GEOGCS%') THEN
    insert into MDSYS.sdo_coord_ref_system (
      SRID,
      COORD_REF_SYS_NAME,
      COORD_REF_SYS_KIND,
      COORD_SYS_ID,
      DATUM_ID,
      GEOG_CRS_DATUM_ID,
      SOURCE_GEOG_SRID,
      PROJECTION_CONV_ID,
      CMPD_HORIZ_SRID,
      CMPD_VERT_SRID,
      INFORMATION_SOURCE,
      DATA_SOURCE,
      IS_LEGACY,
      LEGACY_CODE,
      LEGACY_WKTEXT,
      LEGACY_CS_BOUNDS,
      IS_VALID,
      SUPPORTS_SDO_GEOMETRY)
    VALUES (
      :new.SRID,
      'OGIS ' || :new.SRID,
      'GEOGRAPHIC2D',
      NULL,
      1000000123,
      1000000123,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      'TRUE',
      NULL,
      :new.SRTEXT,
      NULL,
      'TRUE',
      'TRUE');
  ELSE
    insert into MDSYS.sdo_coord_ref_system (
      SRID,
      COORD_REF_SYS_NAME,
      COORD_REF_SYS_KIND,
      COORD_SYS_ID,
      DATUM_ID,
      GEOG_CRS_DATUM_ID,
      SOURCE_GEOG_SRID,
      PROJECTION_CONV_ID,
      CMPD_HORIZ_SRID,
      CMPD_VERT_SRID,
      INFORMATION_SOURCE,
      DATA_SOURCE,
      IS_LEGACY,
      LEGACY_CODE,
      LEGACY_WKTEXT,
      LEGACY_CS_BOUNDS,
      IS_VALID,
      SUPPORTS_SDO_GEOMETRY)
    VALUES (
      :new.SRID,
      'OGIS ' || :new.SRID,
      'PROJECTED',
      NULL,
      NULL,
      1000000123,
      1000000123,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      'TRUE',
      NULL,
      :new.SRTEXT,
      NULL,
      'TRUE',
      'TRUE');
  END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_UNITS_OF_MEASURE_TRIGGER"
AFTER
  INSERT OR
  UPDATE
ON
  MDSYS.SDO_UNITS_OF_MEASURE
DECLARE
  c NUMBER;
BEGIN
  select
    count(*)
  into
    c
  from (
    select
      name
    from
      (
        select unit_of_meas_name name, factor_b, factor_c from mdsys.sdo_units_of_measure
        union
        select short_name        name, factor_b, factor_c from mdsys.sdo_units_of_measure where not short_name is null
      )
    group by
      name
    having
      count(*) > 1
      and
      min(factor_b/factor_c) < max(factor_b/factor_c));

  if(c > 0) then
    MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, 'This unit name/short name has already been defined with another factor or base unit.');
  end if;

  ------------------------------------------

  select
    count(*)
  into
    c
  from
    mdsys.sdo_units_of_measure uom1,
    mdsys.sdo_units_of_measure uom2
  where
    uom1.target_uom_id = uom2.uom_id and
    not(nls_lower(uom1.unit_of_meas_type) = nls_lower(uom2.unit_of_meas_type));

  if(c > 0) then
    MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, 'Unit and base unit have different types.');
  end if;

END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_COORD_REF_SRID_INSERT"
BEFORE INSERT ON MDSYS.SDO_COORD_REF_SYS
FOR EACH ROW
BEGIN
  mdsys.mdprvt_srid.sdo_invalidate_srid_metadata(:new.srid,
                                                 :new.coord_ref_sys_kind);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_COORD_REF_SRID_UPDATE"
AFTER UPDATE OR DELETE ON MDSYS.SDO_COORD_REF_SYS
FOR EACH ROW
BEGIN
  mdsys.mdprvt_srid.sdo_invalidate_srid_metadata(:old.srid,
                                                 :old.coord_ref_sys_kind);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_COORD_OP_METHODS_TRIGGER"
BEFORE
  INSERT OR
  UPDATE OR
  DELETE
ON
  MDSYS.SDO_COORD_OP_METHODS
FOR EACH ROW
BEGIN
  MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, 'This cannot change the actual implementation status of a method.');
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_COORD_OPS_TRIGGER"
BEFORE
  INSERT OR
  UPDATE OR
  DELETE
ON
  MDSYS.SDO_COORD_OPS
FOR EACH ROW
BEGIN
  MDSYS.sdo_cs.sdo_cs_context_invalidate;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_PREFERRED_OPS_SYSTEM_TRIG"
BEFORE
  INSERT OR
  UPDATE OR
  DELETE
ON
  MDSYS.SDO_PREFERRED_OPS_SYSTEM
FOR EACH ROW
BEGIN
  MDSYS.sdo_cs.sdo_cs_context_invalidate;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_PREFERRED_OPS_SYS_TRIGGER"
BEFORE
  INSERT OR
  UPDATE
ON
  MDSYS.SDO_PREFERRED_OPS_SYSTEM
FOR EACH ROW
DECLARE
  c NUMBER;
BEGIN

  MDSYS.sdo_cs.sdo_cs_context_invalidate;

  SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_OPS WHERE COORD_OP_ID = :new.COORD_OP_ID;
  IF(c < 1) THEN
    IF(:new.COORD_OP_ID > 0) THEN
      MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.COORD_OP_ID || ' does not exist.'));
    ELSE
      SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_OPS WHERE COORD_OP_ID = -:new.COORD_OP_ID;
      IF(c < 1) THEN
        MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.COORD_OP_ID || ' does not exist, neither does its forward version ' || -:new.COORD_OP_ID || '.'));
      ELSE
        SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = -:new.COORD_OP_ID;
        IF(c < 1) THEN
          MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Elementary operation ' || -:new.COORD_OP_ID || ' is not reversible.'));
        ELSE
          dbms_output.put_line('Concatenated operation ' || -:new.COORD_OP_ID || ' is not reversible, because of its following elementary component(s):');

          <<FIND_CULPRITS>>
          DECLARE
            CURSOR CULPRITS IS
              SELECT
                -PATHS.SINGLE_OPERATION_ID "COORD_OP_ID"
              FROM
                MDSYS.SDO_COORD_OP_PATHS PATHS
              WHERE
                PATHS.CONCAT_OPERATION_ID = -:new.COORD_OP_ID
              MINUS
              SELECT
                COORD_OP_ID
              FROM
                MDSYS.SDO_AVAILABLE_OPS;
            CULPRIT CULPRITS%ROWTYPE;
          BEGIN
            FOR CULPRIT IN CULPRITS LOOP
              dbms_output.put_line('Elementary operation ' || (-CULPRIT.COORD_OP_ID) || ' is not reversible.');
            END LOOP;
          END FIND_CULPRITS;

          MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Concatenated operation ' || -:new.COORD_OP_ID || ' is not reversible.'));
        END IF;
      END IF;
    END IF;
  END IF;

  SELECT IS_IMPLEMENTED INTO c FROM MDSYS.SDO_AVAILABLE_OPS WHERE COORD_OP_ID = :new.COORD_OP_ID;
  IF(c = 0) THEN
    MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.COORD_OP_ID || ' is not implemented.'));
  END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_PREFERRED_OPS_USER_TRIGGER"
BEFORE
  INSERT OR
  UPDATE
ON
  MDSYS.SDO_PREFERRED_OPS_USER
FOR EACH ROW
DECLARE
  c NUMBER;
BEGIN

  MDSYS.sdo_cs.sdo_cs_context_invalidate;

  SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_OPS WHERE COORD_OP_ID = :new.COORD_OP_ID;
  IF(c < 1) THEN
    IF(:new.COORD_OP_ID > 0) THEN
      MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.COORD_OP_ID || ' does not exist.'));
    ELSE
      SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_OPS WHERE COORD_OP_ID = -:new.COORD_OP_ID;
      IF(c < 1) THEN
        MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.COORD_OP_ID || ' does not exist, neither does its forward version ' || -:new.COORD_OP_ID || '.'));
      ELSE
        SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = -:new.COORD_OP_ID;
        IF(c < 1) THEN
          MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Elementary operation ' || -:new.COORD_OP_ID || ' is not reversible.'));
        ELSE
          dbms_output.put_line('Concatenated operation ' || -:new.COORD_OP_ID || ' is not reversible, because of its following elementary component(s):');

          <<FIND_CULPRITS>>
          DECLARE
            CURSOR CULPRITS IS
              SELECT
                -PATHS.SINGLE_OPERATION_ID "COORD_OP_ID"
              FROM
                MDSYS.SDO_COORD_OP_PATHS PATHS
              WHERE
                PATHS.CONCAT_OPERATION_ID = -:new.COORD_OP_ID
              MINUS
              SELECT
                COORD_OP_ID
              FROM
                MDSYS.SDO_AVAILABLE_OPS;
            CULPRIT CULPRITS%ROWTYPE;
          BEGIN
            FOR CULPRIT IN CULPRITS LOOP
              dbms_output.put_line('Elementary operation ' || (-CULPRIT.COORD_OP_ID) || ' is not reversible.');
            END LOOP;
          END FIND_CULPRITS;

          MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Concatenated operation ' || -:new.COORD_OP_ID || ' is not reversible'));
        END IF;
      END IF;
    END IF;
  END IF;

  SELECT IS_IMPLEMENTED INTO c FROM MDSYS.SDO_AVAILABLE_OPS WHERE COORD_OP_ID = :new.COORD_OP_ID;
  IF(c = 0) THEN
    MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.COORD_OP_ID || ' is not implemented.'));
  END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_COORD_OP_PATHS_TRIGGER"
BEFORE
  INSERT OR
  UPDATE
ON
  MDSYS.SDO_COORD_OP_PATHS
FOR EACH ROW
DECLARE
  c NUMBER;
  is_impl_single NUMBER;
  is_impl_concat NUMBER;
BEGIN

  MDSYS.sdo_cs.sdo_cs_context_invalidate;

  SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = :new.CONCAT_OPERATION_ID;
  IF(c < 1) THEN
    SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_ELEM_OPS WHERE COORD_OP_ID = :new.CONCAT_OPERATION_ID;
    IF(c < 1) THEN
      IF(:new.CONCAT_OPERATION_ID > 0) THEN
        MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.CONCAT_OPERATION_ID || ' does not exist.'));
      ELSE
        SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = -:new.CONCAT_OPERATION_ID;
        IF(c < 1) THEN
          MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.CONCAT_OPERATION_ID || ' does not exist, neither does its forward version ' || -:new.CONCAT_OPERATION_ID || '.'));
        ELSE
          dbms_output.put_line('Concatenated operation ' || -:new.CONCAT_OPERATION_ID || ' is not reversible, because of its following elementary component(s):');

          <<FIND_CULPRITS>>
          DECLARE
            CURSOR CULPRITS IS
              SELECT
                -PATHS.SINGLE_OPERATION_ID "COORD_OP_ID"
              FROM
                MDSYS.SDO_COORD_OP_PATHS PATHS
              WHERE
                PATHS.CONCAT_OPERATION_ID = -:new.CONCAT_OPERATION_ID
              MINUS
              SELECT
                COORD_OP_ID
              FROM
                MDSYS.SDO_AVAILABLE_OPS;
            CULPRIT CULPRITS%ROWTYPE;
          BEGIN
            FOR CULPRIT IN CULPRITS LOOP
              dbms_output.put_line('Elementary operation ' || (-CULPRIT.COORD_OP_ID) || ' is not reversible.');
            END LOOP;
          END FIND_CULPRITS;

          MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Concatenated operation ' || -:new.CONCAT_OPERATION_ID || ' is not reversible'));
        END IF;
      END IF;
    ELSE
      MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.CONCAT_OPERATION_ID || ' is an elementary operation, not a concatenated one.'));
    END IF;
  END IF;

  SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_ELEM_OPS WHERE COORD_OP_ID = :new.SINGLE_OPERATION_ID;
  IF(c < 1) THEN
    SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = :new.SINGLE_OPERATION_ID;
    IF(c < 1) THEN
      IF(:new.SINGLE_OPERATION_ID > 0) THEN
        MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.SINGLE_OPERATION_ID || ' does not exist.'));
      ELSE
        SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_ELEM_OPS WHERE COORD_OP_ID = -:new.SINGLE_OPERATION_ID;
        IF(c < 1) THEN
          MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.SINGLE_OPERATION_ID || ' does not exist, neither does its forward version ' || -:new.SINGLE_OPERATION_ID || '.'));
        ELSE
          MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || -:new.SINGLE_OPERATION_ID || ' is not reversible.'));
        END IF;
      END IF;
    ELSE
      MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.SINGLE_OPERATION_ID || ' is a concatenated operation, not an elementary one.'));
    END IF;
  END IF;

  SELECT IS_IMPLEMENTED INTO is_impl_single FROM MDSYS.SDO_AVAILABLE_ELEM_OPS WHERE COORD_OP_ID = :new.SINGLE_OPERATION_ID;
  IF(is_impl_single = 0) THEN
    SELECT IS_IMPLEMENTED INTO is_impl_concat FROM MDSYS.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = :new.CONCAT_OPERATION_ID;
    IF(is_impl_concat = 1) THEN
      MDSYS.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, (
        'Single operation ' || :new.SINGLE_OPERATION_ID ||
        ' is not implemented. Then concatenated operation ' || :new.CONCAT_OPERATION_ID ||
        ' cannot be, neither.'));
    END IF;
  END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_COORD_OP_PARAM_VAL_TRIGGER"
AFTER
  INSERT OR
  UPDATE or
  delete
ON
  MDSYS.SDO_coord_op_param_vals
for each row
BEGIN
  MDSYS.sdo_cs.sdo_cs_context_invalidate;

  update
    sdo_cs_srs
  set
    wktext = 'Getting updated'
  where
    srid in (
      select
        crs.srid
      from
        sdo_coord_ref_sys crs
      where
        crs.projection_conv_id = :new.coord_op_id);
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_COORD_OP_PARAM_VAL_TRIGG2"
AFTER
  INSERT OR
  UPDATE or
  delete
ON
  MDSYS.SDO_coord_op_param_vals
BEGIN
  update
    sdo_cs_srs
  set
    wktext = MDSYS.sdo_cs.internal_det_srid_wkt(srid),
    wktext3d = mdsys.sdo_cs.get_3d_wkt(srid)
  where
    wktext = 'Getting updated';
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_CRS_GEOG_SRID_UPDATE"
AFTER UPDATE OR DELETE ON MDSYS.SDO_CRS_GEOGRAPHIC_PLUS_HEIGHT
FOR EACH ROW
BEGIN
  mdsys.mdprvt_srid.sdo_invalidate_srid_metadata(:old.srid);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_CS_SRS_SRID_INSERT"
BEFORE INSERT ON MDSYS.SDO_CS_SRS
FOR EACH ROW
BEGIN

  mdsys.mdprvt_srid.sdo_invalidate_srid_metadata(:new.srid);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_CS_SRS_SRID_UPDATE"
AFTER UPDATE OR DELETE ON MDSYS.SDO_CS_SRS
FOR EACH ROW
BEGIN
  mdsys.mdprvt_srid.sdo_invalidate_srid_metadata(:old.srid);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_TIME_DEL_TRIG"
INSTEAD OF DELETE ON user_sdo_network_timestamps
REFERENCING OLD AS o
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  DELETE
    FROM  sdo_network_timestamps
    WHERE owner = NLS_UPPER(user_name)
      AND network = :o.network
      AND table_name = :o.table_name;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_GEOM_TRIG_INS1"
INSTEAD OF INSERT ON user_sdo_geom_metadata
REFERENCING NEW AS n
FOR EACH ROW
declare
 tname varchar2(32);
 stmt  varchar2(2048);
 vcount INTEGER;
 dimcount INTEGER;
 tolerance NUMBER;
 dimelement MDSYS.SDO_DIM_ELEMENT;
 idx  number;
BEGIN
  tname := user;

  if ( (instr(:n.table_name, ' ') > 0 ) OR
       (instr(:n.table_name, '''') > 0 ) )  then
   mderr.raise_md_error('MD', 'SDO', -13199,
               'wrong table name: ' || :n.table_name);
   end if;

  if ( (instr(:n.column_name, ' ') > 0 ) OR
       (instr(:n.column_name, '''') > 0 ) ) then
   mderr.raise_md_error('MD', 'SDO', -13199,
               'wrong column name: ' || :n.column_name);
   end if;

  stmt :=  'SELECT count(*) FROM SDO_GEOM_METADATA_TABLE ' ||
  'WHERE sdo_owner = :tname  AND sdo_table_name = :table_name  '||
  '  AND  sdo_column_name = :column_name  ';

EXECUTE IMMEDIATE stmt INTO vcount
   USING tname, nls_upper(:n.table_name), nls_upper(:n.column_name);


  IF vcount = 0 THEN
    dimcount :=  :n.diminfo.count;
    FOR idx in 1 .. dimcount LOOP
      dimelement := :n.diminfo(idx);
      tolerance := dimelement.SDO_TOLERANCE;
      if ( (tolerance is NULL) OR (tolerance <= 0) ) then
          mderr.raise_md_error('MD', 'SDO', -13224,
                :n.table_name||'.'||:n.column_name);
      end if;
    END LOOP;

    mdsys.sdo_meta.insert_all_sdo_geom_metadata(tname,
                                                :n.table_name,
                                                :n.column_name,
                                                :n.diminfo,
                                                :n.srid);
  ELSE
   mderr.raise_md_error('MD', 'SDO', -13223,
               :n.table_name||'.'||:n.column_name);
 END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_GEOM_TRIG_DEL1"
INSTEAD OF DELETE ON user_sdo_geom_metadata
REFERENCING OLD AS n
FOR EACH ROW
declare
BEGIN

  mdsys.sdo_meta.delete_all_sdo_geom_metadata(user,
                                              :n.table_name,
                                              :n.column_name);

END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_GEOM_TRIG_UPD1"
INSTEAD OF UPDATE ON user_sdo_geom_metadata
REFERENCING OLD AS old NEW AS n
FOR EACH ROW
declare
BEGIN

  mdsys.sdo_meta.change_all_sdo_geom_metadata(user,
                                              :old.table_name,
                                              :old.column_name,
                                              :n.table_name,
                                              :n.column_name,
                                              :n.diminfo,
                                              :n.srid);

END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_LRS_TRIG_INS"
INSTEAD OF INSERT ON user_sdo_lrs_metadata
REFERENCING NEW AS n
FOR EACH ROW
declare
 user_name      varchar2(32);
 stmt           varchar2(2048);
 vcount         INTEGER;
BEGIN

  EXECUTE IMMEDIATE
  'SELECT user FROM dual' into user_name;

  if ( (instr(:n.table_name, ' ') > 0) OR
       (instr(:n.table_name, '''') > 0)  ) then
   mderr.raise_md_error('MD', 'SDO', -13223,
               :n.table_name||'.'||:n.column_name);
   end if;

  if ( (instr(:n.column_name, ' ') > 0) OR
   (instr(:n.column_name, '''') > 0)  ) then
   mderr.raise_md_error('MD', 'SDO', -13223,
               :n.table_name||'.'||:n.column_name);
   end if;

/*
  stmt :=  'SELECT count(*) FROM SDO_LRS_METADATA_TABLE ' ||
  ' WHERE sdo_owner = '''   || nls_upper(user_name) || '''  ' ||
  '  AND  sdo_table_name = '''  || nls_upper(replace(:n.table_name,'''',''))
   || ''' ' ||
 ' AND  sdo_column_name = ''' || nls_upper(replace(:n.column_name,'''',''))|| ''' ';
  */

  stmt :=  'SELECT count(*) FROM SDO_LRS_METADATA_TABLE ' ||
  ' WHERE sdo_owner = :owner  AND  sdo_table_name =  :tab ' ||
  ' AND  sdo_column_name = :col ';

 EXECUTE IMMEDIATE stmt INTO vcount
    USING  nls_upper(user_name), nls_upper(:n.table_name), nls_upper(:n.column_name) ;

  IF vcount = 0 THEN
    INSERT INTO sdo_lrs_metadata_table values
             (nls_upper(user_name), nls_upper(:n.table_name), nls_upper(:n.column_name), :n.dim_pos, nls_upper(:n.dim_unit));
  ELSE
   mderr.raise_md_error('MD', 'SDO', -13223,
           user_name||'.'||:n.table_name);
 END IF;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_LRS_TRIG_DEL"
INSTEAD OF DELETE ON user_sdo_lrs_metadata
REFERENCING OLD AS n
FOR EACH ROW
declare
 user_name      varchar2(32);
 stmt           varchar2(2048);
 vcount         INTEGER;
BEGIN

  EXECUTE IMMEDIATE
  'SELECT user FROM dual' into user_name;

    DELETE FROM  sdo_lrs_metadata_table
    WHERE SDO_OWNER   = user_name
      AND SDO_TABLE_NAME  = nls_upper(:n.table_name)
      AND SDO_COLUMN_NAME = nls_upper(:n.column_name);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_LRS_TRIG_UPD"
INSTEAD OF UPDATE ON user_sdo_lrs_metadata
REFERENCING OLD AS old NEW AS n
FOR EACH ROW
declare
 user_name      varchar2(32);
 stmt           varchar2(2048);
 vcount         INTEGER;
BEGIN

  EXECUTE IMMEDIATE
  'SELECT user FROM dual' into user_name;

    UPDATE sdo_lrs_metadata_table
    SET (SDO_TABLE_NAME, SDO_COLUMN_NAME, SDO_DIM_POS, SDO_DIM_UNIT)  =
     (SELECT nls_upper(:n.table_name), nls_upper(:n.column_name),:n.dim_pos, nls_upper(:n.dim_unit) FROM DUAL)
    WHERE SDO_OWNER       = nls_upper(user_name)
      AND SDO_TABLE_NAME  = nls_upper(:old.table_name)
      AND SDO_COLUMN_NAME = nls_upper(:old.column_name);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_TOPO_TRIG_INS1"
INSTEAD OF INSERT ON SDO_TOPO_TRANSACT_DATA$
REFERENCING NEW AS n
FOR EACH ROW
declare
begin

   INSERT INTO SDO_TOPO_TRANSACT_DATA
      values(SDO_TOPO_TRANSACT_SUBSEQ.nextval, :n.topology_id, :n.topo_id,
                :n.topo_type, :n.topo_op, :n.parent_id);

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_CRS_INSERT_TRIGGER"
INSTEAD OF
  INSERT
ON
  MDSYS.SDO_COORD_REF_SYSTEM
FOR EACH ROW
DECLARE
  already_exists  NUMBER;
BEGIN
  MDSYS.sdo_cs.sdo_cs_context_invalidate;

  INSERT INTO MDSYS.SDO_COORD_REF_SYS (
    SRID,
    COORD_REF_SYS_NAME,
    COORD_REF_SYS_KIND,
    COORD_SYS_ID,
    DATUM_ID,
    GEOG_CRS_DATUM_ID,
    SOURCE_GEOG_SRID,
    PROJECTION_CONV_ID,
    CMPD_HORIZ_SRID,
    CMPD_VERT_SRID,
    INFORMATION_SOURCE,
    DATA_SOURCE,
    IS_LEGACY,
    LEGACY_CODE,
    LEGACY_WKTEXT,
    LEGACY_CS_BOUNDS,
    IS_VALID,
    SUPPORTS_SDO_GEOMETRY)
  VALUES (
    :new.SRID,
    :new.COORD_REF_SYS_NAME,
    :new.COORD_REF_SYS_KIND,
    :new.COORD_SYS_ID,
    :new.DATUM_ID,
    :new.GEOG_CRS_DATUM_ID,
    :new.SOURCE_GEOG_SRID,
    :new.PROJECTION_CONV_ID,
    :new.CMPD_HORIZ_SRID,
    :new.CMPD_VERT_SRID,
    :new.INFORMATION_SOURCE,
    :new.DATA_SOURCE,
    :new.IS_LEGACY,
    :new.LEGACY_CODE,
    :new.LEGACY_WKTEXT,
    :new.LEGACY_CS_BOUNDS,
    :new.IS_VALID,
    :new.SUPPORTS_SDO_GEOMETRY);

  INSERT INTO MDSYS.SDO_CS_SRS (
    CS_NAME,
    SRID,
    AUTH_SRID,
    AUTH_NAME,
    WKTEXT,
    wktext3d,
    CS_BOUNDS
    )
  VALUES (
    :new.COORD_REF_SYS_NAME,
    :new.SRID,
    :new.SRID,
    :new.INFORMATION_SOURCE,
    NVL(
      :new.LEGACY_WKTEXT,
      MDSYS.sdo_cs.internal_det_srid_wkt(:new.srid)),
    sdo_cs.get_3d_wkt(:new.srid),
    :new.LEGACY_CS_BOUNDS);

    if(:new.COORD_REF_SYS_KIND = 'GEOGRAPHIC3D') then
      insert into sdo_crs_geographic_plus_height values (:new.srid);
    elsif(:new.COORD_REF_SYS_KIND = 'COMPOUND') then
      insert into sdo_crs_geographic_plus_height (
        select :new.srid from sdo_crs_geographic2d g2d
        where g2d.srid = :new.CMPD_HORIZ_SRID);
    end if;

END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_CRS_DELETE_TRIGGER"
INSTEAD OF
  DELETE
ON
  MDSYS.SDO_COORD_REF_SYSTEM
FOR EACH ROW
DECLARE
  already_exists  NUMBER;
BEGIN
  DELETE FROM MDSYS.SDO_CS_SRS WHERE SRID = :old.SRID;
  DELETE FROM MDSYS.SDO_COORD_REF_SYS WHERE SRID = :old.SRID;
  DELETE FROM mdsys.sdo_crs_geographic_plus_height WHERE srid = :old.srid;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."CS_SRS_TRIGGER"
INSTEAD OF
  UPDATE OR
  INSERT OR
  DELETE
ON
  MDSYS.CS_SRS
FOR EACH ROW
BEGIN
  MDSYS.sdo_cs.sdo_cs_context_invalidate;

  if(not(:old.srid is null)) then
    delete from sdo_coord_ref_system crs where crs.srid = :old.srid;
  end if;
  if(not(:new.srid is null)) then
    if(nls_upper(trim(:new.wktext)) like 'GEOGCS%') then
      insert into sdo_coord_ref_system (
        SRID,
        COORD_REF_SYS_NAME,
        COORD_REF_SYS_KIND,
        COORD_SYS_ID,
        DATUM_ID,
        GEOG_CRS_DATUM_ID,
        SOURCE_GEOG_SRID,
        PROJECTION_CONV_ID,
        CMPD_HORIZ_SRID,
        CMPD_VERT_SRID,
        INFORMATION_SOURCE,
        DATA_SOURCE,
        IS_LEGACY,
        LEGACY_CODE,
        LEGACY_WKTEXT,
        LEGACY_CS_BOUNDS,
        IS_VALID,
        SUPPORTS_SDO_GEOMETRY)
      values(
        :new.SRID,
        :new.CS_NAME,
        'GEOGRAPHIC2D',
        null,
        1000000123,
        1000000123,
        null,
        null,
        null,
        null,
        :new.AUTH_NAME,
        null,
        'TRUE',
        null,
        :new.WKTEXT,
        :new.CS_BOUNDS,
        'TRUE',
        'TRUE');
    else
      insert into sdo_coord_ref_system (
        SRID,
        COORD_REF_SYS_NAME,
        COORD_REF_SYS_KIND,
        COORD_SYS_ID,
        DATUM_ID,
        GEOG_CRS_DATUM_ID,
        SOURCE_GEOG_SRID,
        PROJECTION_CONV_ID,
        CMPD_HORIZ_SRID,
        CMPD_VERT_SRID,
        INFORMATION_SOURCE,
        DATA_SOURCE,
        IS_LEGACY,
        LEGACY_CODE,
        LEGACY_WKTEXT,
        LEGACY_CS_BOUNDS,
        IS_VALID,
        SUPPORTS_SDO_GEOMETRY)
      values(
        :new.SRID,
        :new.CS_NAME,
        'PROJECTED',
        null,
        null,
        1000000123,
        1000000123,
        null,
        null,
        null,
        :new.AUTH_NAME,
        null,
        'TRUE',
        null,
        :new.WKTEXT,
        :new.CS_BOUNDS,
        'TRUE',
        'TRUE');
    end if;
  end if;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_ANNOT_TRIG_INS1"
INSTEAD OF INSERT OR DELETE OR UPDATE ON USER_ANNOTATION_TEXT_METADATA
REFERENCING NEW AS n OLD as o
FOR EACH ROW
declare
 tname varchar2(32);
begin

  IF INSERTING THEN
 EXECUTE IMMEDIATE
  'SELECT user FROM dual' into tname;
      INSERT INTO SDO_ANNOTATION_TEXT_METADATA values(null,tname,
            nls_upper(:n.table_name), nls_upper(:n.column_name), :n.MAP_BASE_SCALE,
                 :n.TEXT_EXPRESSION,
             :n.TEXT_ATTRIBUTES);
  ELSIF UPDATING THEN
 EXECUTE IMMEDIATE
  'SELECT user FROM dual' into tname;
  UPDATE SDO_ANNOTATION_TEXT_METADATA SET(F_TABLE_SCHEMA,
             F_TABLE_NAME,F_TEXT_COLUMN, MAP_BASE_SCALE, TEXT_DEFAULT_EXPRESSION,
                    TEXT_DEFAULT_ATTRIBUTES) =
   (SELECT tname, :n.table_name, :n.column_name, :n.MAP_BASE_SCALE,
                    :n.TEXT_EXPRESSION,
           :n.TEXT_ATTRIBUTES FROM DUAL)
  WHERE F_TABLE_SCHEMA =  tname AND
     F_TABLE_NAME = :o.table_name AND F_TEXT_COLUMN = :o.column_name;
  ELSE
 EXECUTE IMMEDIATE
  'SELECT user FROM dual' into tname;
   DELETE FROM SDO_ANNOTATION_TEXT_METADATA
    WHERE  F_TABLE_SCHEMA =  tname AND
     F_TABLE_NAME = :o.table_name AND F_TEXT_COLUMN = :o.column_name;
  END IF;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_GEOR_TRIG_INS1"
INSTEAD OF INSERT ON user_sdo_geor_sysdata
FOR EACH ROW
DECLARE
  owner   VARCHAR2(32);
  valid   VARCHAR2(32);
BEGIN
  owner:=user;
  valid:=SDO_GEOR_DEF.isValidEntry(nls_upper(owner),nls_upper(:new.table_name),nls_upper(:new.column_name),nls_upper(:new.rdt_table_name),:new.raster_id);

  if(valid='FALSE')
  then
     mderr.raise_md_error('MD', 'SDO', -13391, 'The inserted entry is not valid.');
  end if;
  SDO_GEOR_INT.insertUserSysEntry(user, :new.table_name, :new.column_name,
      :new.metadata_column_name, :new.rdt_table_name, :new.raster_id,
      :new.other_table_names);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_GEOR_TRIG_DEL1"
INSTEAD OF DELETE ON user_sdo_geor_sysdata
FOR EACH ROW
DECLARE
  owner   VARCHAR2(32);
  valid   VARCHAR2(32);
BEGIN
  owner:=user;
  valid:=SDO_GEOR_DEF.isValidEntry(nls_upper(owner),nls_upper(:old.table_name),nls_upper(:old.column_name),nls_upper(:old.rdt_table_name),:old.raster_id);
  if(valid='TRUE')
  then
     mderr.raise_md_error('MD', 'SDO', -13391, 'A valid entry cannot be deleted directly.');
  end if;
  SDO_GEOR_DEF.deleteMetaEntry(user, :old.rdt_table_name, :old.raster_id);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_GEOR_TRIG_UPD1"
INSTEAD OF UPDATE ON user_sdo_geor_sysdata
FOR EACH ROW
DECLARE
 owner VARCHAR2(32);
 valid   VARCHAR2(32);
BEGIN
  owner:=user;
  valid:=SDO_GEOR_DEF.isValidEntry(nls_upper(owner),nls_upper(:old.table_name),nls_upper(:old.column_name),nls_upper(:old.rdt_table_name),:old.raster_id);
  if(valid='TRUE')
  then
     mderr.raise_md_error('MD', 'SDO', -13391, 'A valid entry cannot be updated directly.');
  end if;
  valid:=SDO_GEOR_DEF.isValidEntry(nls_upper(owner),nls_upper(:new.table_name),nls_upper(:new.column_name),nls_upper(:new.rdt_table_name),:new.raster_id);
  if(valid='FALSE')
  then
     mderr.raise_md_error('MD', 'SDO', -13391, 'The updated entry is not valid.');
  end if;


  SDO_GEOR_DEF.deleteMetaEntry(user, :old.rdt_table_name, :old.raster_id);


  SDO_GEOR_INT.insertUserSysEntry(user, :new.table_name, :new.column_name,
      :new.metadata_column_name, :new.rdt_table_name, :new.raster_id,
      :new.other_table_names);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_TRIG_INS"
INSTEAD OF INSERT ON USER_SDO_NETWORK_METADATA
REFERENCING NEW AS n
FOR EACH ROW
declare
 user_name varchar2(32);
 net_id number;
 no_of_partitions number := 0;
 no_of_hierarchy_levels number := 1;
 direction    VARCHAR2(12);
BEGIN

  EXECUTE IMMEDIATE 'SELECT user FROM dual' into user_name;
  -- find out the network ID from network ID sequence
  EXECUTE IMMEDIATE 'SELECT sdo_ndm_network_id_seq.nextval FROM DUAL' INTO net_id;

  -- insert network metadata and network ID into SDO_NETWORK_METADATA_TABLE

  IF ( :n.no_of_partitions is NOT null ) THEN
        no_of_partitions :=  :n.no_of_partitions;
  END IF;

  IF ( :n.no_of_hierarchy_levels is NOT null ) THEN
        no_of_hierarchy_levels :=  :n.no_of_hierarchy_levels;
  END IF;

  -- change bidirected to undirected
  direction := :n.link_direction ;

  IF ( NLS_UPPER(direction) = 'BIDIRECTED' ) THEN
    direction := 'UNDIRECTED';
  END IF ;

  insert into SDO_NETWORK_METADATA_TABLE
        (
         SDO_OWNER,
         NETWORK,
         NETWORK_ID,
         NETWORK_CATEGORY,
         GEOMETRY_TYPE,
         NETWORK_TYPE,
         NO_OF_HIERARCHY_LEVELS,
         NO_OF_PARTITIONS,
         LRS_TABLE_NAME,
         LRS_GEOM_COLUMN,
         NODE_TABLE_NAME,
         NODE_GEOM_COLUMN,
         NODE_COST_COLUMN,
         NODE_PARTITION_COLUMN,
         NODE_DURATION_COLUMN,
         LINK_TABLE_NAME,
         LINK_GEOM_COLUMN,
         LINK_DIRECTION,
         LINK_COST_COLUMN,
         LINK_PARTITION_COLUMN,
         LINK_DURATION_COLUMN,
         PATH_TABLE_NAME,
         PATH_GEOM_COLUMN,
         PATH_LINK_TABLE_NAME,
         SUBPATH_TABLE_NAME,
         SUBPATH_GEOM_COLUMN,
         PARTITION_TABLE_NAME,
         PARTITION_BLOB_TABLE_NAME,
         COMPONENT_TABLE_NAME,
         NODE_LEVEL_TABLE_NAME,
         TOPOLOGY,
         USER_DEFINED_DATA,
         EXTERNAL_REFERENCES,
         CHILD_NETWORK,
         HIERARCHY_TABLE_NAME
        )
        values
        (
         NLS_UPPER(user_name),
         NLS_UPPER(:n.network),
         net_id,
         NLS_UPPER(:n.network_category),
         NLS_UPPER(:n.geometry_type),
         NLS_UPPER(:n.network_type),
         no_of_hierarchy_levels,
         no_of_partitions,
         NLS_UPPER(:n.lrs_table_name),
         NLS_UPPER(:n.lrs_geom_column),
         NLS_UPPER(:n.node_table_name),
         NLS_UPPER(:n.node_geom_column),
         NLS_UPPER(:n.node_cost_column),
         NLS_UPPER(:n.node_partition_column),
         NLS_UPPER(:n.node_duration_column),
         NLS_UPPER(:n.link_table_name),
         NLS_UPPER(:n.link_geom_column),
         NLS_UPPER(direction),
         NLS_UPPER(:n.link_cost_column),
         NLS_UPPER(:n.link_partition_column),
         NLS_UPPER(:n.link_duration_column),
         NLS_UPPER(:n.path_table_name),
         NLS_UPPER(:n.path_geom_column),
         NLS_UPPER(:n.path_link_table_name),
         NLS_UPPER(:n.subpath_table_name),
         NLS_UPPER(:n.subpath_geom_column),
         NLS_UPPER(:n.partition_table_name),
         NLS_UPPER(:n.partition_blob_table_name),
         NLS_UPPER(:n.component_table_name),
         NLS_UPPER(:n.node_level_table_name),
         NLS_UPPER(:n.topology),
         NLS_UPPER(:n.user_defined_data),
         NLS_UPPER(:n.external_references),
         NLS_UPPER(:n.child_network),
         NLS_UPPER(:n.hierarchy_table_name)
        );
   -- register NDM feature usage when inserting a NDM network metadata in 12c and beyond
         IF ( to_number(substr(sdo_version,1, instr(sdo_version,'.')-1)) >= 12 ) then
           execute immediate 'BEGIN mdsys.mdprvt_feature.sdo_register_feature(''NDM''); END;';
         END IF;

END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_TRIG_DEL"
INSTEAD OF DELETE ON user_sdo_network_metadata
REFERENCING OLD AS o
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  DELETE FROM SDO_NETWORK_METADATA_TABLE WHERE NLS_UPPER(SDO_OWNER) = NLS_UPPER(user_name)
  AND NLS_UPPER(network) = NLS_UPPER(:o.network);

END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_TRIG_UPD"
INSTEAD OF UPDATE ON user_sdo_network_metadata
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
  direction    VARCHAR2(12);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;
  direction := :n.link_direction ;
  IF ( nls_upper(direction) = 'BIDIRECTED' ) THEN
    direction := 'UNDIRECTED';
  END IF;


  UPDATE sdo_network_metadata_table
    SET (NETWORK,
         NETWORK_CATEGORY,
         GEOMETRY_TYPE,
         NETWORK_TYPE,
         NO_OF_HIERARCHY_LEVELS,
         NO_OF_PARTITIONS,
         LRS_TABLE_NAME,
         LRS_GEOM_COLUMN,
         NODE_TABLE_NAME,
         NODE_GEOM_COLUMN,
         NODE_COST_COLUMN,
         NODE_PARTITION_COLUMN,
         NODE_DURATION_COLUMN,
         LINK_TABLE_NAME,
         LINK_GEOM_COLUMN,
         LINK_DIRECTION,
         LINK_COST_COLUMN,
         LINK_PARTITION_COLUMN,
         LINK_DURATION_COLUMN,
         PATH_TABLE_NAME,
         PATH_GEOM_COLUMN,
         PATH_LINK_TABLE_NAME,
         SUBPATH_TABLE_NAME,
         SUBPATH_GEOM_COLUMN,
         PARTITION_TABLE_NAME,
         PARTITION_BLOB_TABLE_NAME,
         COMPONENT_TABLE_NAME,
         NODE_LEVEL_TABLE_NAME,
         TOPOLOGY,
         USER_DEFINED_DATA,
         EXTERNAL_REFERENCES,
         CHILD_NETWORK,
         HIERARCHY_TABLE_NAME
        ) =
        ( SELECT
         NLS_UPPER(:n.network),
         NLS_UPPER(:n.network_category),
         NLS_UPPER(:n.geometry_type),
         NLS_UPPER(:n.network_type),
         :n.no_of_hierarchy_levels,
         :n.no_of_partitions,
         NLS_UPPER(:n.lrs_table_name),
         NLS_UPPER(:n.lrs_geom_column),
         NLS_UPPER(:n.node_table_name),
         NLS_UPPER(:n.node_geom_column),
         NLS_UPPER(:n.node_cost_column),
         NLS_UPPER(:n.node_partition_column),
         NLS_UPPER(:n.node_duration_column),
         NLS_UPPER(:n.link_table_name),
         NLS_UPPER(:n.link_geom_column),
         NLS_UPPER(direction),
         NLS_UPPER(:n.link_cost_column),
         NLS_UPPER(:n.link_partition_column),
         NLS_UPPER(:n.link_duration_column),
         NLS_UPPER(:n.path_table_name),
         NLS_UPPER(:n.path_geom_column),
         NLS_UPPER(:n.path_link_table_name),
         NLS_UPPER(:n.subpath_table_name),
         NLS_UPPER(:n.subpath_geom_column),
         NLS_UPPER(:n.partition_table_name),
         NLS_UPPER(:n.partition_blob_table_name),
         NLS_UPPER(:n.component_table_name),
         NLS_UPPER(:n.node_level_table_name),
         NLS_UPPER(:n.topology),
         NLS_UPPER(:n.user_defined_data),
         NLS_UPPER(:n.external_references),
         NLS_UPPER(:n.child_network),
         NLS_UPPER(:n.hierarchy_table_name)
         FROM DUAL )
  WHERE  NLS_UPPER(SDO_OWNER)  = NLS_UPPER(user_name)
     AND NLS_UPPER(NETWORK)    = NLS_UPPER(:o.network);

END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_CONS_INS_TRIG"
INSTEAD OF INSERT ON user_sdo_network_constraints
REFERENCING NEW AS n
FOR EACH ROW
DECLARE
  err_msg         VARCHAR2(200);
  num             NUMBER := -1;
  stmt            VARCHAR2(200);
BEGIN

  stmt := 'select count(*) from dba_java_classes where owner = :owner '||
   ' and name = :name';
  execute immediate stmt into num using user, :n.class_name;

  if (num<>1) then
    err_msg := 'Could not find Java class schema object: ' || :n.class_name ||
        '. Did not load Java class properly.';
    mdsys.mderr.raise_md_error('MD', 'SDO','13385', err_msg);
  else
    stmt := 'insert into sdo_network_constraints(sdo_owner, constraint, ' ||
     'description, class_name, class) values (:owner, :constraint, '||
     ':description, :class_name, :class)';
    execute immediate stmt using NLS_UPPER(user),:n.constraint,
     :n.description, :n.class_name,:n.class;
  end if;

EXCEPTION
  when others then raise;
END sdo_network_cons_ins_trig;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_CONS_DEL_TRIG"
INSTEAD OF DELETE ON user_sdo_network_constraints
FOR EACH ROW
DECLARE
  err_msg      VARCHAR2(200);
  num          NUMBER := -1;
  stmt         VARCHAR2(200);
BEGIN

  stmt := 'select count(*) from dba_java_classes where owner = :owner '||
   ' and name = :name';
  execute immediate stmt into num using user, :old.class_name;

  if (num=1) then
    err_msg := 'Java class schema object: '||:old.class_name||' exists. Please '||
      'drop it first.';
    mdsys.mderr.raise_md_error('MD', 'SDO', '13385', err_msg);
  else
    stmt := 'delete from sdo_network_constraints where sdo_owner = :owner '||
      ' and class_name = :name';
    execute immediate stmt using user, :old.class_name;
  end if;

EXCEPTION
  when others then raise;
END sdo_network_cons_del_trig;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_CONS_UPD_TRIG"
INSTEAD OF UPDATE ON user_sdo_network_constraints
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  UPDATE sdo_network_constraints
    SET
            (constraint,
       description,
       class_name,
       class)
      =
            (SELECT
               :n.constraint,
         :n.description,
         :n.class_name,
         :n.class
       FROM DUAL)
    WHERE  NLS_UPPER(sdo_owner)  = NLS_UPPER(user_name)
      AND  constraint = :o.constraint;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_JAVA_INS_TRIG"
INSTEAD OF INSERT ON user_sdo_network_java_objects
REFERENCING NEW AS n
FOR EACH ROW
DECLARE
 user_name         VARCHAR2(32);
 dir_name          VARCHAR2(200);
 file_name         VARCHAR2(32);
 class_file_name   VARCHAR2(32);
BEGIN

  EXECUTE IMMEDIATE 'SELECT user FROM dual' INTO user_name;

  INSERT INTO
    sdo_network_constraints
          (sdo_owner,
     constraint,
     description,
     class_name,
     class,
     java_interface)
  VALUES
          (
           NLS_UPPER(user_name),
           :n.name,
     :n.description,
     :n.class_name,
     :n.class,
     :n.java_interface
          );
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_JAVA_DEL_TRIG"
INSTEAD OF DELETE ON user_sdo_network_java_objects
REFERENCING OLD AS o
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  DELETE
    FROM  sdo_network_constraints
    WHERE NLS_UPPER(SDO_OWNER) = NLS_UPPER(user_name)
      AND constraint = :o.name;

END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_JAVA_UPD_TRIG"
INSTEAD OF UPDATE ON user_sdo_network_java_objects
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  UPDATE sdo_network_constraints
    SET
            (constraint,
       description,
       class_name,
       class,
       java_interface)
      =
            (SELECT
               :n.name,
         :n.description,
         :n.class_name,
         :n.class,
         :n.java_interface
       FROM DUAL)
    WHERE  NLS_UPPER(sdo_owner)  = NLS_UPPER(user_name)
      AND  constraint = :o.name;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_LOCKS_INS_TRIG"
INSTEAD OF INSERT ON user_sdo_network_locks_wm
REFERENCING NEW AS n
FOR EACH ROW
DECLARE
 user_name         VARCHAR2(32);
BEGIN

  EXECUTE IMMEDIATE 'SELECT user FROM dual' INTO user_name;

  INSERT INTO
    sdo_network_locks_wm(sdo_owner, lock_id, network, workspace,
     original_node_filter, original_link_filter, original_path_filter,
     adjusted_node_filter, adjusted_link_filter, adjusted_path_filter)
  VALUES (NLS_UPPER(user_name), :n.lock_id, :n.network, :n.workspace,
     :n.original_node_filter,:n.original_link_filter,:n.original_path_filter,
     :n.adjusted_node_filter,:n.adjusted_link_filter,:n.adjusted_path_filter);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_LOCKS_DEL_TRIG"
INSTEAD OF DELETE ON user_sdo_network_locks_wm
REFERENCING OLD AS o
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  DELETE
    FROM  sdo_network_locks_wm
    WHERE NLS_UPPER(SDO_OWNER) = NLS_UPPER(user_name)
      AND lock_id = :o.lock_id;

END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_LOCKS_UPD_TRIG"
INSTEAD OF UPDATE ON user_sdo_network_locks_wm
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  UPDATE sdo_network_locks_wm
    SET  (lock_id, network, workspace,
          original_node_filter, original_link_filter, original_path_filter,
          adjusted_node_filter, adjusted_link_filter, adjusted_path_filter)
      = (SELECT :n.lock_id, :n.network, :n.workspace,
          :n.original_node_filter, :n.original_link_filter,
          :n.original_path_filter,
          :n.adjusted_node_filter, :n.adjusted_link_filter,
          :n.adjusted_path_filter
       FROM DUAL)
    WHERE  NLS_UPPER(sdo_owner)  = NLS_UPPER(user_name)
      AND  lock_id = :o.lock_id;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_UD_INS_TRIG"
INSTEAD OF INSERT ON user_sdo_network_user_data
REFERENCING NEW AS n
FOR EACH ROW
DECLARE
 user_name         VARCHAR2(32);
 no                number ;
 table_name        VARCHAR2(32);
BEGIN

  EXECUTE IMMEDIATE 'SELECT user FROM dual' INTO user_name;

  -- check if network already exists in the networkwork metadata
  EXECUTE IMMEDIATE
        'SELECT COUNT(*) FROM sdo_network_metadata_table ' ||
        '  where sdo_owner = :owner AND NLS_UPPER(network) = :net ' into no using NLS_UPPER(user_name), NLS_UPPER(:n.network);
  IF ( no = 0 ) THEN
   mderr.raise_md_error('MD', 'SDO', -13385, user_name||'.'||:n.network || ' NOT IN NETWORK METADATA!');
  END IF;


  INSERT INTO
    sdo_network_user_data
    (
     sdo_owner,
     network,
     table_type,
     data_name,
     data_type,
     data_length,
     category_id
     )
  VALUES
     (
      NLS_UPPER(user_name),
      NLS_UPPER(:n.network),
      NLS_UPPER(:n.table_type),
      NLS_UPPER(:n.data_name),
      NLS_UPPER(:n.data_type),
      :n.data_length,
      :n.category_id
     );
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_UD_DEL_TRIG"
INSTEAD OF DELETE ON user_sdo_network_user_data
REFERENCING OLD AS o
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  DELETE
    FROM  sdo_network_user_data
    WHERE NLS_UPPER(SDO_OWNER) = NLS_UPPER(user_name)
      AND network    = NLS_UPPER(:o.network)
      AND table_type = NLS_UPPER(:o.table_type)
      AND data_name  = NLS_UPPER(:o.data_name);

END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_UD_UPD_TRIG"
INSTEAD OF UPDATE ON user_sdo_network_user_data
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
  no           number ;
  table_name       VARCHAR2(32);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  -- check if network already exists in the networkwork metadata
  EXECUTE IMMEDIATE
        'SELECT COUNT(*) FROM sdo_network_metadata_table ' ||
        '  where sdo_owner = :owner AND NLS_UPPER(network) = :net ' into no using NLS_UPPER(user_name), NLS_UPPER(:n.network);

  IF ( no = 0 ) THEN
   mderr.raise_md_error('MD', 'SDO', -13385,
           user_name||'.'||:n.network || ' NOT IN NETWORK METADATA!');
  END IF;

  UPDATE sdo_network_user_data
    SET
      (
       network,
       table_type,
       data_name,
       data_type,
       data_length,
       category_id)
      =
      (SELECT
         NLS_UPPER(:n.network),
         NLS_UPPER(:n.table_type),
         NLS_UPPER(:n.data_name),
         NLS_UPPER(:n.data_type),
         :n.data_length,
         :n.category_id
       FROM DUAL)
    WHERE  NLS_UPPER(sdo_owner)  = NLS_UPPER(user_name)
      AND  NLS_UPPER(network)    = NLS_UPPER(:o.network)
      AND  NLS_UPPER(table_type) = NLS_UPPER(:o.table_type)
      AND  NLS_UPPER(data_name)  = NLS_UPPER(:o.data_name);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_HIS_INS_TRIG"
INSTEAD OF INSERT ON user_sdo_network_histories
REFERENCING NEW AS n
FOR EACH ROW
DECLARE
 user_name         VARCHAR2(32);
BEGIN

  EXECUTE IMMEDIATE 'SELECT user FROM dual' INTO user_name;

  INSERT INTO sdo_network_histories(
     owner, network, node_history_table, link_history_table, node_trigger,
     link_trigger)
  VALUES(
     NLS_UPPER(user_name),:n.network,:n.node_history_table,
     :n.link_history_table,:n.node_trigger,:n.link_trigger);

EXCEPTION WHEN OTHERS THEN RAISE;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_HIS_UPD_TRIG"
INSTEAD OF UPDATE ON user_sdo_network_histories
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  UPDATE sdo_network_histories
   SET(network,node_history_table,link_history_table,node_trigger,link_trigger)
      =
   (SELECT
      :n.network,:n.node_history_table,:n.link_history_table,:n.node_trigger,
      :n.link_trigger
    FROM DUAL)
    WHERE  NLS_UPPER(owner)  = NLS_UPPER(user_name)
      AND  network = :o.network;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_HIS_DEL_TRIG"
INSTEAD OF DELETE ON user_sdo_network_histories
REFERENCING OLD AS o
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  DELETE
    FROM  sdo_network_histories
    WHERE NLS_UPPER(OWNER) = NLS_UPPER(user_name)
      AND network = :o.network;

END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_TIME_INS_TRIG"
INSTEAD OF INSERT ON user_sdo_network_timestamps
REFERENCING NEW AS n
FOR EACH ROW
DECLARE
 user_name         VARCHAR2(32);
BEGIN

  EXECUTE IMMEDIATE 'SELECT user FROM dual' INTO user_name;

  INSERT INTO sdo_network_timestamps(
     owner, network, table_name, last_dml_time)
  VALUES(NLS_UPPER(user_name),:n.network,:n.table_name, :n.last_dml_time);

EXCEPTION WHEN OTHERS THEN RAISE;
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_TIME_UPD_TRIG"
INSTEAD OF UPDATE ON user_sdo_network_timestamps
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  UPDATE sdo_network_timestamps
   SET(network,table_name,last_dml_time)
      =
   (SELECT
      :n.network,:n.table_name,:n.last_dml_time
    FROM DUAL)
    WHERE  owner = NLS_UPPER(user_name)
      AND  NLS_UPPER(network) = NLS_UPPER(:o.network)
      AND  NLS_UPPER(table_name) = NLS_UPPER(:o.table_name);
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_GEOR_ADDL_TRIGGER"
after ddl on database
declare
 m_event   varchar2(512);
 m_owner   varchar2(512);
 m_type    varchar2(512);
 m_name    varchar2(5120);
 m_adt     NUMBER;
 m_cnt     NUMBER;
 m_stmt    varchar2(512);
 m_ret     varchar2(3000);
 m_ret1     varchar2(512);
begin



 m_stmt := 'select mdsys.GetMdsysEvent() from dual';
 execute immediate m_stmt into m_cnt;
 if ( m_cnt != 0 ) then
   return;
 end if;

 m_stmt:='select sys.dbms_standard.dictionary_obj_type from dual';
 execute immediate m_stmt into m_type;
 if(not (m_type='TABLE' or m_type='TRIGGER' or m_type='USER' or m_type='TABLESPACE'))
 then
   return;
 end if;

 m_stmt:='select sys.dbms_standard.dictionary_obj_owner from dual';
 execute immediate m_stmt into m_owner;

 m_stmt:='select sys.dbms_standard.dictionary_obj_name from dual';
 execute immediate m_stmt into m_name;

 m_stmt:='select sys.dbms_standard.sysevent from dual';
 execute immediate m_stmt into m_event;





 if ( m_type = 'TABLE' and m_event != 'DROP' and m_event != 'RENAME' ) then
   m_stmt := 'select mdsys.TblContainsAdt(:own, :tab) from dual';
   begin
     execute immediate m_stmt into m_adt using m_owner, m_name;
     exception when others then
       m_adt := 1;
   end;
   if ( m_adt = 0 ) then
     return;
   end if;
 end if;

 if((instr(nls_upper(m_name),'MDRT_')>0) and m_event='DROP')
 then
   return;
 end if;








 if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='CREATE')
 then
   m_stmt:='select sdo_geor_def.listAllGeoRasterFieldsStr(:1,:2) from dual';
   execute immediate m_stmt  into m_ret  using m_owner,m_name;
   m_ret:=trim(m_ret);
   while (length(m_ret)!=0) loop
     if (instr(m_ret,' $$__## ')!=0)
     then
       m_ret1:=trim(substr(m_ret,1,instr(m_ret,' $$__## ')-1));
       m_ret:=trim(substr(m_ret,instr(m_ret,' $$__## ')+8));
     else
       m_ret1:=trim(m_ret);
       m_ret:='';
     end if;
     m_stmt:='begin SDO_GEOR_UTL.createDMLTrigger(:1,:2); end;';
    execute immediate m_stmt using m_owner||'.'||m_name,m_ret1;
   end loop;
   return;
 end if;






















  if (m_name!='MDSYS' and m_type='USER' and m_event='DROP')
  then
     m_stmt:='call sdo_geor_def.doDropUserAndTable()';
     execute immediate m_stmt;
  end if;

  if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='DROP')
  then
     m_stmt:='call sdo_geor_def.doDropUserAndTable()';
     execute immediate m_stmt;
  end if;

  if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='TRUNCATE')
  then
     m_stmt:='call sdo_geor_def.doTruncateTable()';
     execute immediate m_stmt;
  end if;

  if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='ALTER')
  then
     m_stmt:='call sdo_geor_def.doAlterRenameTable()';
     execute immediate m_stmt;
  end if;

  if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='RENAME')
  then
     m_stmt:='call sdo_geor_def.doRenameTable()';
     execute immediate m_stmt;
  end if;






 if (m_event='DROP' and m_type='TABLE')
 then
   m_stmt:='delete from sdo_geor_ddl__table$$ where id=2';
   EXECUTE IMMEDIATE m_stmt;
 end if;

 if ((m_type='USER' and m_event='DROP') or (m_type='TABLESPACE' and m_event='DROP'))
 then
   m_stmt:='delete from sdo_geor_ddl__table$$';
   EXECUTE IMMEDIATE m_stmt;
 end if;

 Exception
   when others then
     if(sqlcode=-13391)
     then
       m_stmt:=sqlerrm;
       m_stmt:=substr(m_stmt,11);
       m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391,'''||m_stmt||''')';
       execute immediate m_stmt;
     end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_ST_SYN_CREATE"
  BEFORE CREATE ON DATABASE
 declare
 error boolean;
  st_syn_detected EXCEPTION;
   PRAGMA EXCEPTION_INIT(st_syn_detected, -995);
 BEGIN
   if((sys.dbms_standard.dictionary_obj_type!='SYNONYM')or(sys.dbms_standard.dictionary_obj_owner!='PUBLIC'))
   then
     return;
   end if;
   error :=
      CASE sys.dbms_standard.dictionary_obj_name
         WHEN 'ST_GEOMETRY' THEN TRUE
         WHEN 'ST_SURFACE' THEN TRUE
         WHEN 'ST_POLYGON' THEN TRUE
         WHEN 'ST_POINT' THEN TRUE
         WHEN 'ST_MULTISURFACE' THEN TRUE
         WHEN 'ST_MULTIPOINT' THEN TRUE
         WHEN 'ST_MULTILINESTRING' THEN TRUE
         WHEN 'ST_MULTICURVE' THEN TRUE
         WHEN 'ST_LINESTRING' THEN TRUE
         WHEN 'ST_GEOMCOLLECTION' THEN TRUE
         WHEN 'ST_CURVE' THEN TRUE
         WHEN 'ST_CURVEPOLYGON' THEN TRUE
         WHEN 'ST_COMPOUNDCURVE' THEN TRUE
         WHEN 'ST_CIRCULARSTRING' THEN TRUE
         WHEN 'ST_INTERSECTS' THEN TRUE
         WHEN 'ST_RELATE' THEN TRUE
         WHEN 'ST_TOUCH' THEN TRUE
         WHEN 'ST_CONTAINS' THEN TRUE
         WHEN 'ST_COVERS' THEN TRUE
         WHEN 'ST_COVEREDBY' THEN TRUE
         WHEN 'ST_INSIDE' THEN TRUE
         WHEN 'ST_OVERLAP' THEN TRUE
         WHEN 'ST_OVERLAPS' THEN TRUE
         WHEN 'ST_EQUAL' THEN TRUE
         WHEN 'ST_OVERLAPBDYDISJOINT' THEN TRUE
         WHEN 'ST_OVERLAPBDYINTERSECT' THEN TRUE
         WHEN 'ST_GEOMETRY_ARRAY' THEN TRUE
         WHEN 'ST_POINT_ARRAY' THEN TRUE
         WHEN 'ST_CURVE_ARRAY' THEN TRUE
         WHEN 'ST_SURFACE_ARRAY' THEN TRUE
         WHEN 'ST_LINESTRING_ARRAY' THEN TRUE
         WHEN 'ST_POLYGON_ARRAY' THEN TRUE
         ELSE FALSE
      END;

   if(error) then
     raise st_syn_detected;

   end if;
 END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_DROP_USER"
after drop on DATABASE
declare
   stmt varchar2(200);
   cnt number;
BEGIN
     if sys.dbms_standard.dictionary_obj_type = 'USER' THEN
       stmt := 'DELETE FROM SDO_GEOM_METADATA_TABLE ' ||
     ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_MAPS_TABLE ' ||
    ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_CACHED_MAPS_TABLE ' ||
    ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_STYLES_TABLE ' ||
    ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_THEMES_TABLE ' ||
   ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_LRS_METADATA_TABLE ' ||
   ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_TOPO_METADATA_TABLE ' ||
   ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_ANNOTATION_TEXT_METADATA ' ||
   ' WHERE F_TABLE_SCHEMA = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_TOPO_DROP_FTBL"
  BEFORE DROP ON DATABASE
  DECLARE
    cnt        NUMBER;
    stmt       VARCHAR(500);
    topology   VARCHAR(100);
    REG_TBL    EXCEPTION;

  BEGIN
    if(sys.dbms_standard.dictionary_obj_type != 'TABLE')
    then
      return;
    end if;
    stmt := 'SELECT topology ' ||
     'FROM MDSYS.SDO_TOPO_METADATA_TABLE a, TABLE(a.Topo_Geometry_Layers) b ' ||
     'WHERE b.owner = :owner AND b.table_name = :tab ';
    EXECUTE IMMEDIATE stmt into topology
      USING sys.dbms_standard.DICTIONARY_OBJ_OWNER,
            sys.dbms_standard.DICTIONARY_OBJ_NAME;
    RAISE REG_TBL;

    EXCEPTION
      WHEN REG_TBL THEN
        MDSYS.MDERR.raise_md_error(
         'MD', 'SDO', -13199,
         'Need to use delete_topo_geometry_layer() to deregister table '
       || sys.dbms_standard.DICTIONARY_OBJ_NAME ||
             ' from topology ' || topology ||
         ' before dropping it');
      WHEN OTHERS THEN
        RETURN;
  END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_GEOR_BDDL_TRIGGER"
before ddl on database
declare
 TYPE attrs_cur IS REF CURSOR;
 m_cur       attrs_cur;
 m_event varchar2(512);
 m_user  varchar2(512);
 m_owner varchar2(512);
 m_type  varchar2(512);
 m_name  varchar2(5120);
 m_column varchar2(5120);
 m_cnt   NUMBER;
 m_adt   NUMBER;
 m_stmt  varchar2(512);
 m_stmt1 varchar2(512);
 m_var   varchar2(512);
 m_o_stmt VARCHAR2(5120);
PRAGMA AUTONOMOUS_TRANSACTION;
begin



 m_stmt := 'select mdsys.GetMdsysEvent() from dual';
 execute immediate m_stmt into m_cnt;
 if ( m_cnt != 0 ) then
   return;
 end if;

 m_stmt:='select sys.dbms_standard.dictionary_obj_type from dual';
 execute immediate m_stmt into m_type;
 if(not (m_type='TABLE' or m_type='TRIGGER' or m_type='USER' or m_type='TABLESPACE'))
 then
   return;
 end if;

 m_stmt:='select sys.dbms_standard.dictionary_obj_owner from dual';
 execute immediate m_stmt into m_owner;

 m_stmt:='select sys.dbms_standard.dictionary_obj_name from dual';
 execute immediate m_stmt into m_name;

 m_stmt:='select sys.dbms_standard.sysevent from dual';
 execute immediate m_stmt into m_event;





 if ( m_type = 'TABLE' and m_event != 'DROP' and m_event != 'RENAME' ) then
   m_stmt := 'select mdsys.TblContainsAdt(:own, :tab) from dual';
   begin
     execute immediate m_stmt into m_adt using m_owner, m_name;
     exception when others then
       m_adt := 1;
   end;
   if ( m_adt = 0 ) then
     return;
   end if;
 end if;

 m_stmt:='select SYS_CONTEXT(''USERENV'',''SESSION_USER'') from dual';
 execute immediate m_stmt into m_user;







  if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='ALTER')
  then
    m_stmt:='select column_name from dba_tab_columns where owner=:1 and table_name=:2';
    begin
      open m_cur for m_stmt using m_owner,m_name;
      loop
        fetch m_cur into m_column;
        exit when m_cur%NOTFOUND;
        m_stmt:='select sdo_geor_def.isDropColumn(:1) from dual';
        execute immediate m_stmt into m_stmt1 using m_column;
        if (trim(m_stmt1)='TRUE')
        then
          m_stmt:='begin sdo_geor_def.doAlterDropColumn(:1,:2,:3); end;';
          execute immediate m_stmt using m_owner,m_name,m_column;
        end if;
      end loop;
      close m_cur;

      EXCEPTION WHEN OTHERS THEN
        IF m_cur%ISOPEN THEN
          close m_cur;
        END IF;
      RAISE;
    end;
  end if;







 if ((m_event='DROP' and m_type='USER') or (m_event='DROP' and m_type='TABLESPACE'))
 then
   m_stmt:='insert into sdo_geor_ddl__table$$ values (1)';
   EXECUTE IMMEDIATE m_stmt;
   commit;
 end if;

 if (m_event='DROP' and m_type='TABLE')
 then
   if((m_user!='SYS' and m_user!='SYSTEM' and m_user!='MDSYS'and m_owner!='MDSYS' and m_owner!='SYS'))
   then


     m_stmt:='select /*+ FIRST_ROWS(1) */ count(*) from sdo_geor_sysdata_table where sdo_owner=:1 and RDT_TABLE_NAME=:2';
     EXECUTE IMMEDIATE m_stmt into m_cnt using m_owner,m_name;
     if(m_cnt!=0)
     then


       m_stmt:='select /*+ FIRST_ROWS(1) */ count(*) from sdo_geor_ddl__table$$';
       EXECUTE IMMEDIATE m_stmt into m_cnt;
       if(m_cnt=0)
       then
          m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391, ''The referenced raster data table(RDT) cannot be dropped.'')';
          execute immediate m_stmt;
       end if;
     end if;
   end if;

   m_stmt:='insert into sdo_geor_ddl__table$$ values (2)';
   EXECUTE IMMEDIATE m_stmt;
   commit;
 end if;

 if(m_user='SYS' or m_user='SYSTEM' or m_user='MDSYS'
   or m_owner='MDSYS' or m_owner='SYS')
 then
   return;
 end if;


 if (m_event='RENAME' and m_type='TABLE')
 then


   m_stmt:='select /*+ FIRST_ROWS(1) */ count(*) from sdo_geor_sysdata_table where sdo_owner=:1 and RDT_TABLE_NAME=:2';
   EXECUTE IMMEDIATE m_stmt into m_cnt using m_owner,m_name;
   if(m_cnt!=0)
   then


     m_stmt:='select /*+ FIRST_ROWS(1) */ count(*) from sdo_geor_ddl__table$$';
     EXECUTE IMMEDIATE m_stmt into m_cnt;
     if(m_cnt=0)
     then
        m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391, ''The referenced raster data table(RDT) cannot be renamed directly.'')';
        execute immediate m_stmt;
     end if;
   end if;

 end if;

 if (m_type='TRIGGER' and m_event='DROP')
 then
   m_stmt:='select REGEXP_SUBSTR(:1,''GRDMLTR_.+'',1,1,''i'') from dual';
   EXECUTE IMMEDIATE m_stmt into m_var using m_name;
   if(m_var is null)
   then
     return;
   end if;



   m_stmt:='select /*+ FIRST_ROWS(1) */ count(*) from sdo_geor_ddl__table$$';
   EXECUTE IMMEDIATE m_stmt into m_cnt;
   if(m_cnt=0)
   then
     m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391, ''GeoRaster DML triggers cannot be dropped.'')';
     execute immediate m_stmt;
   end if;
 end if;

 if (m_type='TRIGGER' and m_event='ALTER')
 then
   m_stmt:='select sdo_geor_def.getSqlText from dual';
   execute immediate m_stmt into m_o_stmt;
   m_o_stmt:=nls_upper(trim(m_o_stmt));
   if(instr(m_o_stmt,' COMPILE ')>0 or instr(m_o_stmt,' ENABLE ')>0
     or substr(m_o_stmt,length(m_o_stmt)-8,8)=' COMPILE' or substr(m_o_stmt,length(m_o_stmt)-7,7)=' ENABLE' )
   then
     return;
   end if;
   m_stmt:='select REGEXP_SUBSTR(:1,''GRDMLTR_.+'',1,1,''i'') from dual';
   EXECUTE IMMEDIATE m_stmt into m_var using m_name;
   if(m_var is null)
   then
     return;
   end if;



   m_stmt:='select /*+ FIRST_ROWS(1) */ count(*) from sdo_geor_ddl__table$$';
   EXECUTE IMMEDIATE m_stmt into m_cnt;
   if(m_cnt=0)
   then
     m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391, ''GeoRaster DML triggers cannot be altered.'')';
     execute immediate m_stmt;
   end if;
 end if;

 if (m_type='TRIGGER' and m_event='CREATE')
 then
   m_stmt:='select REGEXP_SUBSTR(:1,''GRDMLTR_.+'',1,1,''i'') from dual';
   EXECUTE IMMEDIATE m_stmt into m_var using m_name;
   if(m_var is null)
   then
     return;
   end if;


   m_stmt:='select /*+ FIRST_ROWS(1) */ count(*) from sdo_geor_ddl__table$$';
   EXECUTE IMMEDIATE m_stmt into m_cnt;
   if(m_cnt=0)
   then
     m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391, ''GeoRaster reserved names cannot be used to create regular triggers.'')';
     execute immediate m_stmt;
   end if;
 end if;

 Exception
   when others then
     if(sqlcode=-13391)
     then
       m_stmt:=sqlerrm;
       m_stmt:=substr(m_stmt,11);
       m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391,'''||m_stmt||''')';
       execute immediate m_stmt;
     end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "MDSYS"."SDO_NETWORK_DROP_USER"
AFTER DROP ON DATABASE
DECLARE
  stmt    VARCHAR2(256);
BEGIN

  IF  sys.dbms_standard.dictionary_obj_type = 'USER'  THEN
    stmt := 'DELETE FROM SDO_NETWORK_METADATA_TABLE WHERE SDO_OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    stmt := 'DELETE FROM SDO_NETWORK_CONSTRAINTS WHERE SDO_OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    stmt := 'DELETE FROM SDO_NETWORK_LOCKS_WM WHERE SDO_OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    stmt := 'DELETE FROM SDO_NETWORK_USER_DATA WHERE SDO_OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    --lrg-3417773
    stmt := 'DELETE FROM SDO_NETWORK_HISTORIES WHERE OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    stmt := 'DELETE FROM SDO_NETWORK_TIMESTAMPS WHERE OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    stmt := 'DELETE FROM SDO_NETWORK_FEATURE WHERE SDO_OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

  END IF;
END ;
/

