-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_GEOM_METADATA" ("TABLE_NAME",
"COLUMN_NAME",
"DIMINFO",
"SRID") AS
  SELECT SDO_TABLE_NAME TABLE_NAME,
       SDO_COLUMN_NAME COLUMN_NAME,
       SDO_DIMINFO DIMINFO,
       SDO_SRID SRID
FROM SDO_GEOM_METADATA_TABLE
WHERE  sdo_owner = sys_context('userenv', 'CURRENT_USER');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_GEOM_METADATA" ("OWNER",
"TABLE_NAME",
"COLUMN_NAME",
"DIMINFO",
"SRID") AS
  SELECT  b.SDO_OWNER OWNER,
        b.SDO_TABLE_NAME TABLE_NAME,
        b.SDO_COLUMN_NAME COLUMN_NAME,
        b.SDO_DIMINFO DIMINFO,
        b.SDO_SRID SRID
FROM mdsys.SDO_GEOM_METADATA_TABLE b,
     all_objects a
WHERE  b.sdo_table_name = a.object_name
  AND  b.sdo_owner = a.owner
  AND  a.object_type in ('TABLE', 'SYNONYM', 'VIEW');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."MY_SDO_INDEX_METADATA" ("SDO_INDEX_OWNER",
"SDO_INDEX_TYPE",
"SDO_LEVEL",
"SDO_NUMTILES",
"SDO_MAXLEVEL",
"SDO_COMMIT_INTERVAL",
"SDO_INDEX_TABLE",
"SDO_INDEX_NAME",
"SDO_INDEX_PRIMARY",
"SDO_TSNAME",
"SDO_COLUMN_NAME",
"SDO_RTREE_HEIGHT",
"SDO_RTREE_NUM_NODES",
"SDO_RTREE_DIMENSIONALITY",
"SDO_RTREE_FANOUT",
"SDO_RTREE_ROOT",
"SDO_RTREE_SEQ_NAME",
"SDO_FIXED_META",
"SDO_TABLESPACE",
"SDO_INITIAL_EXTENT",
"SDO_NEXT_EXTENT",
"SDO_PCTINCREASE",
"SDO_MIN_EXTENTS",
"SDO_MAX_EXTENTS",
"SDO_INDEX_DIMS",
"SDO_LAYER_GTYPE",
"SDO_RTREE_PCTFREE",
"SDO_INDEX_PARTITION",
"SDO_PARTITIONED",
"SDO_RTREE_QUALITY",
"SDO_INDEX_VERSION",
"SDO_INDEX_GEODETIC",
"SDO_INDEX_STATUS",
"SDO_NL_INDEX_TABLE",
"SDO_DML_BATCH_SIZE",
"SDO_RTREE_ENT_XPND",
"SDO_ROOT_MBR") AS
  select SDO_INDEX_OWNER, SDO_INDEX_TYPE,
        SDO_LEVEL, SDO_NUMTILES, SDO_MAXLEVEL,
        SDO_COMMIT_INTERVAL, SDO_INDEX_TABLE,
        SDO_INDEX_NAME,  SDO_INDEX_PRIMARY,
        SDO_TSNAME, SDO_COLUMN_NAME,
        SDO_RTREE_HEIGHT, SDO_RTREE_NUM_NODES,
        SDO_RTREE_DIMENSIONALITY, SDO_RTREE_FANOUT,
        SDO_RTREE_ROOT, SDO_RTREE_SEQ_NAME,
        SDO_FIXED_META, SDO_TABLESPACE,
        SDO_INITIAL_EXTENT, SDO_NEXT_EXTENT,
        SDO_PCTINCREASE, SDO_MIN_EXTENTS,
        SDO_MAX_EXTENTS, SDO_INDEX_DIMS,
        SDO_LAYER_GTYPE, SDO_RTREE_PCTFREE,
        SDO_INDEX_PARTITION, SDO_PARTITIONED,
        SDO_RTREE_QUALITY, SDO_INDEX_VERSION,
        SDO_INDEX_GEODETIC, SDO_INDEX_STATUS,
        SDO_NL_INDEX_TABLE,
        SDO_DML_BATCH_SIZE, SDO_RTREE_ENT_XPND,
        SDO_ROOT_MBR
 from SDO_INDEX_METADATA_TABLE
 where sdo_index_owner = sys_context('userenv', 'CURRENT_SCHEMA');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_INDEX_METADATA" ("SDO_INDEX_OWNER",
"SDO_INDEX_TYPE",
"SDO_LEVEL",
"SDO_NUMTILES",
"SDO_MAXLEVEL",
"SDO_COMMIT_INTERVAL",
"SDO_INDEX_TABLE",
"SDO_INDEX_NAME",
"SDO_INDEX_PRIMARY",
"SDO_TSNAME",
"SDO_COLUMN_NAME",
"SDO_RTREE_HEIGHT",
"SDO_RTREE_NUM_NODES",
"SDO_RTREE_DIMENSIONALITY",
"SDO_RTREE_FANOUT",
"SDO_RTREE_ROOT",
"SDO_RTREE_SEQ_NAME",
"SDO_FIXED_META",
"SDO_TABLESPACE",
"SDO_INITIAL_EXTENT",
"SDO_NEXT_EXTENT",
"SDO_PCTINCREASE",
"SDO_MIN_EXTENTS",
"SDO_MAX_EXTENTS",
"SDO_INDEX_DIMS",
"SDO_LAYER_GTYPE",
"SDO_RTREE_PCTFREE",
"SDO_INDEX_PARTITION",
"SDO_PARTITIONED",
"SDO_RTREE_QUALITY",
"SDO_INDEX_VERSION",
"SDO_INDEX_GEODETIC",
"SDO_INDEX_STATUS",
"SDO_NL_INDEX_TABLE",
"SDO_DML_BATCH_SIZE",
"SDO_RTREE_ENT_XPND",
"SDO_NUM_ROWS",
"SDO_NUM_BLKS",
"SDO_OPTIMIZED_NODES",
"SDO_ROOT_MBR") AS
  select SDO_INDEX_OWNER, SDO_INDEX_TYPE,
        SDO_LEVEL, SDO_NUMTILES, SDO_MAXLEVEL,
        SDO_COMMIT_INTERVAL, SDO_INDEX_TABLE,
        SDO_INDEX_NAME,  SDO_INDEX_PRIMARY,
        SDO_TSNAME, SDO_COLUMN_NAME,
        SDO_RTREE_HEIGHT, SDO_RTREE_NUM_NODES,
        SDO_RTREE_DIMENSIONALITY, SDO_RTREE_FANOUT,
        SDO_RTREE_ROOT, SDO_RTREE_SEQ_NAME,
        SDO_FIXED_META, SDO_TABLESPACE,
        SDO_INITIAL_EXTENT, SDO_NEXT_EXTENT,
        SDO_PCTINCREASE, SDO_MIN_EXTENTS,
        SDO_MAX_EXTENTS, SDO_INDEX_DIMS,
        SDO_LAYER_GTYPE, SDO_RTREE_PCTFREE,
        SDO_INDEX_PARTITION, SDO_PARTITIONED,
        SDO_RTREE_QUALITY, SDO_INDEX_VERSION,
        SDO_INDEX_GEODETIC, SDO_INDEX_STATUS,
        SDO_NL_INDEX_TABLE,
        SDO_DML_BATCH_SIZE, SDO_RTREE_ENT_XPND,
        SDO_NUM_ROWS,                                           --- bug9743250
        SDO_NUM_BLKS,
        SDO_OPTIMIZED_NODES,
        SDO_ROOT_MBR                                            --- bug2719909
 from SDO_INDEX_METADATA_TABLE
 where
 (exists
   (select index_name from user_indexes
    where index_name=sdo_index_name and
          sdo_index_owner = sys_context('userenv', 'CURRENT_USER')));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_INDEX_METADATA" ("SDO_INDEX_OWNER",
"SDO_INDEX_TYPE",
"SDO_LEVEL",
"SDO_NUMTILES",
"SDO_MAXLEVEL",
"SDO_COMMIT_INTERVAL",
"SDO_INDEX_TABLE",
"SDO_INDEX_NAME",
"SDO_INDEX_PRIMARY",
"SDO_TSNAME",
"SDO_COLUMN_NAME",
"SDO_RTREE_HEIGHT",
"SDO_RTREE_NUM_NODES",
"SDO_RTREE_DIMENSIONALITY",
"SDO_RTREE_FANOUT",
"SDO_RTREE_ROOT",
"SDO_RTREE_SEQ_NAME",
"SDO_FIXED_META",
"SDO_TABLESPACE",
"SDO_INITIAL_EXTENT",
"SDO_NEXT_EXTENT",
"SDO_PCTINCREASE",
"SDO_MIN_EXTENTS",
"SDO_MAX_EXTENTS",
"SDO_INDEX_DIMS",
"SDO_LAYER_GTYPE",
"SDO_RTREE_PCTFREE",
"SDO_INDEX_PARTITION",
"SDO_PARTITIONED",
"SDO_RTREE_QUALITY",
"SDO_INDEX_VERSION",
"SDO_INDEX_GEODETIC",
"SDO_INDEX_STATUS",
"SDO_NL_INDEX_TABLE",
"SDO_DML_BATCH_SIZE",
"SDO_RTREE_ENT_XPND",
"SDO_NUM_ROWS",
"SDO_NUM_BLKS",
"SDO_OPTIMIZED_NODES",
"SDO_ROOT_MBR") AS
  select SDO_INDEX_OWNER, SDO_INDEX_TYPE,
        SDO_LEVEL, SDO_NUMTILES, SDO_MAXLEVEL, SDO_COMMIT_INTERVAL,
        SDO_INDEX_TABLE, SDO_INDEX_NAME, SDO_INDEX_PRIMARY, SDO_TSNAME,
        SDO_COLUMN_NAME, SDO_RTREE_HEIGHT, SDO_RTREE_NUM_NODES,
        SDO_RTREE_DIMENSIONALITY, SDO_RTREE_FANOUT, SDO_RTREE_ROOT,
        SDO_RTREE_SEQ_NAME, SDO_FIXED_META, SDO_TABLESPACE,
        SDO_INITIAL_EXTENT, SDO_NEXT_EXTENT, SDO_PCTINCREASE,
        SDO_MIN_EXTENTS, SDO_MAX_EXTENTS, SDO_INDEX_DIMS, SDO_LAYER_GTYPE,
        SDO_RTREE_PCTFREE, SDO_INDEX_PARTITION, SDO_PARTITIONED,
        SDO_RTREE_QUALITY, SDO_INDEX_VERSION, SDO_INDEX_GEODETIC,
        SDO_INDEX_STATUS,
        SDO_NL_INDEX_TABLE,
        SDO_DML_BATCH_SIZE, SDO_RTREE_ENT_XPND,
        SDO_NUM_ROWS,                                           --- bug9743250
        SDO_NUM_BLKS,
        SDO_OPTIMIZED_NODES,
        SDO_ROOT_MBR                                            --- bug2719909
 from SDO_INDEX_METADATA_TABLE
 where
 (exists
   (select index_name from all_indexes
    where index_name=sdo_index_name and
          owner = sdo_index_owner));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_INDEX_INFO" ("INDEX_NAME",
"TABLE_OWNER",
"TABLE_NAME",
"COLUMN_NAME",
"SDO_INDEX_TYPE",
"SDO_INDEX_TABLE",
"SDO_INDEX_STATUS") AS
  select SDO_INDEX_NAME index_name,  table_owner, table_name,
       REPLACE(sdo_column_name, '"') column_name,
       SDO_INDEX_TYPE, SDO_INDEX_TABLE, SDO_INDEX_STATUS
 from user_sdo_index_metadata,
     user_indexes
 where index_name = sdo_index_name;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_INDEX_INFO" ("SDO_INDEX_OWNER",
"INDEX_NAME",
"TABLE_OWNER",
"TABLE_NAME",
"COLUMN_NAME",
"SDO_INDEX_TYPE",
"SDO_INDEX_TABLE",
"SDO_INDEX_STATUS") AS
  select SDO_INDEX_OWNER, SDO_INDEX_NAME index_name,  table_owner, table_name,
       REPLACE(sdo_column_name, '"')  column_name,
       SDO_INDEX_TYPE, SDO_INDEX_TABLE, SDO_INDEX_STATUS
 from all_sdo_index_metadata,
     all_indexes
 where index_name = sdo_index_name and owner=sdo_index_owner;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_LRS_METADATA" ("TABLE_NAME",
"COLUMN_NAME",
"DIM_POS",
"DIM_UNIT") AS
  SELECT  SDO_TABLE_NAME  TABLE_NAME,
        SDO_COLUMN_NAME COLUMN_NAME,
        SDO_DIM_POS     DIM_POS,
        SDO_DIM_UNIT    DIM_UNIT
FROM SDO_LRS_METADATA_TABLE,
     (select sys_context('userenv', 'CURRENT_USER') username from dual)
WHERE  sdo_owner = username;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_LRS_METADATA" ("OWNER",
"TABLE_NAME",
"COLUMN_NAME",
"DIM_POS",
"DIM_UNIT") AS
  SELECT  SDO_OWNER       OWNER,
        SDO_TABLE_NAME  TABLE_NAME,
        SDO_COLUMN_NAME COLUMN_NAME,
        SDO_DIM_POS     DIM_POS,
        SDO_DIM_UNIT    DIM_UNIT
FROM SDO_LRS_METADATA_TABLE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_TOPO_INFO" ("OWNER",
"TOPOLOGY",
"TOPOLOGY_ID",
"TOLERANCE",
"SRID",
"TABLE_SCHEMA",
"TABLE_NAME",
"COLUMN_NAME",
"TG_LAYER_ID",
"TG_LAYER_TYPE",
"TG_LAYER_LEVEL",
"CHILD_LAYER_ID",
"DIGITS_RIGHT_OF_DECIMAL") AS
  SELECT SDO_OWNER OWNER,
       Topology,
       Topology_id,
       Tolerance,
       SRID,
       b.owner Table_Schema,
       b.Table_Name Table_Name,
       b.Column_Name Column_Name,
       b.Layer_ID TG_Layer_ID,
       b.Layer_Type TG_Layer_Type,
       b.Layer_Level TG_Layer_Level,
       b.Child_Layer_id Child_Layer_id,
       Digits_Right_Of_Decimal
FROM SDO_TOPO_METADATA_TABLE a,
     TABLE (a.Topo_Geometry_Layers) b
WHERE  sdo_owner = sys_context('userenv', 'CURRENT_SCHEMA');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_TOPO_INFO" ("OWNER",
"TOPOLOGY",
"TOPOLOGY_ID",
"TOLERANCE",
"SRID",
"TABLE_SCHEMA",
"TABLE_NAME",
"COLUMN_NAME",
"TG_LAYER_ID",
"TG_LAYER_TYPE",
"TG_LAYER_LEVEL",
"CHILD_LAYER_ID",
"DIGITS_RIGHT_OF_DECIMAL") AS
  SELECT SDO_OWNER OWNER,
       Topology,
       Topology_id,
       Tolerance,
       SRID,
       b.owner Table_Schema,
       b.Table_Name Table_Name,
       b.Column_Name Column_Name,
       b.Layer_ID TG_Layer_ID,
       b.Layer_Type TG_Layer_Type,
       b.Layer_Level TG_Layer_Level,
       b.Child_Layer_id Child_Layer_id,
       Digits_Right_Of_Decimal
FROM SDO_TOPO_METADATA_TABLE a,
     TABLE (a.Topo_Geometry_Layers) b
WHERE
(exists
   (select table_name from all_tables
    where table_name=topology || '_NODE$'
      and owner = sdo_owner
    union all
    select view_name from all_views
    where  view_name=topology || '_NODE$'
      and owner = sdo_owner));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_TOPO_METADATA" ("OWNER",
"TOPOLOGY",
"TOPOLOGY_ID",
"TOLERANCE",
"SRID",
"TABLE_SCHEMA",
"TABLE_NAME",
"COLUMN_NAME",
"TG_LAYER_ID",
"TG_LAYER_TYPE",
"TG_LAYER_LEVEL",
"CHILD_LAYER_ID",
"NODE_SEQUENCE",
"EDGE_SEQUENCE",
"FACE_SEQUENCE",
"TG_SEQUENCE",
"DIGITS_RIGHT_OF_DECIMAL") AS
  SELECT SDO_OWNER OWNER,
       Topology,
       Topology_id,
       Tolerance,
       SRID,
       b.owner Table_Schema,
       b.Table_Name Table_Name,
       b.Column_Name Column_Name,
       b.Layer_ID TG_Layer_ID,
       b.Layer_Type TG_Layer_Type,
       b.Layer_Level TG_Layer_Level,
       b.Child_Layer_id Child_Layer_id,
       Topology||'_NODE_S' Node_Sequence,
       Topology||'_EDGE_S' Edge_Sequence,
       Topology||'_FACE_S' Face_Sequence,
       Topology||'_TG_S' TG_Sequence,
       Digits_Right_Of_Decimal
FROM SDO_TOPO_METADATA_TABLE a,
     TABLE (a.Topo_Geometry_Layers) b
WHERE  sdo_owner = sys_context('userenv', 'CURRENT_SCHEMA');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_TOPO_METADATA" ("OWNER",
"TOPOLOGY",
"TOPOLOGY_ID",
"TOLERANCE",
"SRID",
"TABLE_OWNER",
"TABLE_NAME",
"COLUMN_NAME",
"TG_LAYER_ID",
"TG_LAYER_TYPE",
"TG_LAYER_LEVEL",
"CHILD_LAYER_ID",
"NODE_SEQUENCE",
"EDGE_SEQUENCE",
"FACE_SEQUENCE",
"TG_SEQUENCE",
"DIGITS_RIGHT_OF_DECIMAL") AS
  SELECT SDO_OWNER OWNER,
       Topology,
       Topology_id,
       Tolerance,
       SRID,
       b.owner Table_owner,
       b.Table_Name Table_Name,
       b.Column_Name Column_Name,
       b.Layer_ID TG_Layer_ID,
       b.Layer_Type TG_Layer_Type,
       b.Layer_Level TG_Layer_Level,
       b.Child_Layer_id Child_Layer_id,
       Topology||'_NODE_S' Node_Sequence,
       Topology||'_EDGE_S' Edge_Sequence,
       Topology||'_FACE_S' Face_Sequence,
       Topology||'_TG_S' TG_Sequence,
       Digits_Right_Of_Decimal
FROM SDO_TOPO_METADATA_TABLE a,
     TABLE (a.Topo_Geometry_Layers) b
WHERE
(exists
   (select table_name from all_tables
    where table_name=topology || '_NODE$'
      and owner = sdo_owner
    union all
    select view_name from all_views
    where  view_name=topology || '_NODE$'
      and owner = sdo_owner));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_TOPO_TRANSACT_DATA$" ("TOPOLOGY_ID",
"TOPO_ID",
"TOPO_TYPE",
"TOPO_OP",
"PARENT_ID") AS
  select TOPOLOGY_ID,TOPO_ID, TOPO_TYPE, TOPO_OP, PARENT_ID
       from SDO_TOPO_TRANSACT_DATA;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_RELATEMASK_TABLE" ("SDO_MASK",
"SDO_RELATION") AS
  select sdo_mask, sdo_relation from md$relate;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."DBA_GEOMETRY_COLUMNS" ("F_TABLE_SCHEMA",
"F_TABLE_NAME",
"F_GEOMETRY_COLUMN",
"G_TABLE_SCHEMA",
"G_TABLE_NAME",
"STORAGE_TYPE",
"GEOMETRY_TYPE",
"COORD_DIMENSION",
"MAX_PPR",
"SRID") AS
  select "F_TABLE_SCHEMA",
"F_TABLE_NAME",
"F_GEOMETRY_COLUMN",
"G_TABLE_SCHEMA",
"G_TABLE_NAME",
"STORAGE_TYPE",
"GEOMETRY_TYPE",
"COORD_DIMENSION",
"MAX_PPR",
"SRID" from OGIS_GEOMETRY_COLUMNS;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_GEOMETRY_COLUMNS" ("F_TABLE_SCHEMA",
"F_TABLE_NAME",
"F_GEOMETRY_COLUMN",
"G_TABLE_SCHEMA",
"G_TABLE_NAME",
"STORAGE_TYPE",
"GEOMETRY_TYPE",
"COORD_DIMENSION",
"MAX_PPR",
"SRID") AS
  select "F_TABLE_SCHEMA","F_TABLE_NAME","F_GEOMETRY_COLUMN","G_TABLE_SCHEMA","G_TABLE_NAME","STORAGE_TYPE","GEOMETRY_TYPE","COORD_DIMENSION","MAX_PPR","SRID" from OGIS_GEOMETRY_COLUMNS where
(exists (select table_name from all_tables
         where table_name=f_table_name and owner=f_table_schema)
 or
 exists (select view_name from all_views
         where view_name=f_table_name and owner=f_table_schema)
 or
 exists (select table_name from all_object_tables
         where table_name=f_table_name and owner=f_table_schema)
)
and
(exists (select table_name from all_tables
         where table_name=g_table_name and owner=g_table_schema)
 or
 exists (select view_name from all_views
         where view_name=g_table_name and owner=g_table_schema)
 or
 exists (select table_name from all_object_tables
         where table_name=g_table_name and owner=g_table_schema)
);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_GEOMETRY_COLUMNS" ("F_TABLE_SCHEMA",
"F_TABLE_NAME",
"F_GEOMETRY_COLUMN",
"G_TABLE_SCHEMA",
"G_TABLE_NAME",
"STORAGE_TYPE",
"GEOMETRY_TYPE",
"COORD_DIMENSION",
"MAX_PPR",
"SRID") AS
  select "F_TABLE_SCHEMA","F_TABLE_NAME","F_GEOMETRY_COLUMN","G_TABLE_SCHEMA","G_TABLE_NAME","STORAGE_TYPE","GEOMETRY_TYPE","COORD_DIMENSION","MAX_PPR","SRID" from OGIS_GEOMETRY_COLUMNS
where f_table_schema=user and g_table_schema=user;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_COORD_REF_SYSTEM" ("SRID",
"COORD_REF_SYS_NAME",
"COORD_REF_SYS_KIND",
"COORD_SYS_ID",
"DATUM_ID",
"GEOG_CRS_DATUM_ID",
"SOURCE_GEOG_SRID",
"PROJECTION_CONV_ID",
"CMPD_HORIZ_SRID",
"CMPD_VERT_SRID",
"INFORMATION_SOURCE",
"DATA_SOURCE",
"IS_LEGACY",
"LEGACY_CODE",
"LEGACY_WKTEXT",
"LEGACY_CS_BOUNDS",
"IS_VALID",
"SUPPORTS_SDO_GEOMETRY") AS
  SELECT "SRID",
"COORD_REF_SYS_NAME",
"COORD_REF_SYS_KIND",
"COORD_SYS_ID",
"DATUM_ID",
"GEOG_CRS_DATUM_ID",
"SOURCE_GEOG_SRID",
"PROJECTION_CONV_ID",
"CMPD_HORIZ_SRID",
"CMPD_VERT_SRID",
"INFORMATION_SOURCE",
"DATA_SOURCE",
"IS_LEGACY",
"LEGACY_CODE",
"LEGACY_WKTEXT",
"LEGACY_CS_BOUNDS",
"IS_VALID",
"SUPPORTS_SDO_GEOMETRY" FROM MDSYS.SDO_COORD_REF_SYS;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_AVAILABLE_NON_ELEM_OPS" ("SOURCE_SRID",
"COORD_OP_ID",
"TARGET_SRID",
"IS_IMPLEMENTED") AS
  SELECT SOURCE_SRID, COORD_OP_ID, TARGET_SRID, IS_IMPLEMENTED_FORWARD "IS_IMPLEMENTED" FROM MDSYS.SDO_COORD_OPS WHERE COORD_OP_TYPE = 'CONCATENATED OPERATION'
          UNION
          SELECT TARGET_SRID "SOURCE_SRID", -COORD_OP_ID, SOURCE_SRID "TARGET_SRID", IS_IMPLEMENTED_REVERSE "IS_IMPLEMENTED" FROM MDSYS.SDO_COORD_OPS WHERE COORD_OP_TYPE = 'CONCATENATED OPERATION' AND REVERSE_OP = 1
      ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_AVAILABLE_ELEM_OPS" ("SOURCE_SRID",
"COORD_OP_ID",
"TARGET_SRID",
"IS_IMPLEMENTED") AS
  (
            SELECT
              OPS.SOURCE_SRID,
              OPS.COORD_OP_ID             "COORD_OP_ID",
              OPS.TARGET_SRID,
              OPS.IS_IMPLEMENTED_FORWARD  "IS_IMPLEMENTED"
            FROM
              MDSYS.SDO_COORD_OPS         OPS
            WHERE
              NOT (OPS.COORD_OP_TYPE = 'CONCATENATED OPERATION')
          )
          UNION
          (
            SELECT
              OPS.TARGET_SRID "SOURCE_SRID",
              -OPS.COORD_OP_ID            "COORD_OP_ID",
              OPS.SOURCE_SRID "TARGET_SRID",
              OPS.IS_IMPLEMENTED_REVERSE  "IS_IMPLEMENTED"
            FROM
              MDSYS.SDO_COORD_OPS         OPS
            WHERE
              NOT (OPS.COORD_OP_TYPE = 'CONCATENATED OPERATION')
              AND
              OPS.REVERSE_OP = 1
          )
      ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_AVAILABLE_OPS" ("SOURCE_SRID",
"COORD_OP_ID",
"TARGET_SRID",
"IS_IMPLEMENTED") AS
  SELECT SOURCE_SRID, COORD_OP_ID, TARGET_SRID, IS_IMPLEMENTED FROM MDSYS.SDO_AVAILABLE_ELEM_OPS
          UNION
          SELECT SOURCE_SRID, COORD_OP_ID, TARGET_SRID, IS_IMPLEMENTED FROM MDSYS.SDO_AVAILABLE_NON_ELEM_OPS
      ;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."CS_SRS" ("CS_NAME",
"SRID",
"AUTH_SRID",
"AUTH_NAME",
"WKTEXT",
"CS_BOUNDS",
"WKTEXT3D") AS
  (SELECT "CS_NAME",
"SRID",
"AUTH_SRID",
"AUTH_NAME",
"WKTEXT",
"CS_BOUNDS",
"WKTEXT3D" FROM MDSYS.SDO_CS_SRS);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_DATUM_ENGINEERING" ("DATUM_ID",
"DATUM_NAME",
"ELLIPSOID_ID",
"PRIME_MERIDIAN_ID",
"INFORMATION_SOURCE",
"DATA_SOURCE",
"SHIFT_X",
"SHIFT_Y",
"SHIFT_Z",
"ROTATE_X",
"ROTATE_Y",
"ROTATE_Z",
"SCALE_ADJUST") AS
  SELECT
          DATUM_ID,
          DATUM_NAME,
          ELLIPSOID_ID,
          PRIME_MERIDIAN_ID,
          INFORMATION_SOURCE,
          DATA_SOURCE,
          SHIFT_X,
          SHIFT_Y,
          SHIFT_Z,
          ROTATE_X,
          ROTATE_Y,
          ROTATE_Z,
          SCALE_ADJUST
        FROM
          MDSYS.SDO_DATUMS
        WHERE
          DATUM_TYPE = 'ENGINEERING';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_DATUM_GEODETIC" ("DATUM_ID",
"DATUM_NAME",
"ELLIPSOID_ID",
"PRIME_MERIDIAN_ID",
"INFORMATION_SOURCE",
"DATA_SOURCE",
"SHIFT_X",
"SHIFT_Y",
"SHIFT_Z",
"ROTATE_X",
"ROTATE_Y",
"ROTATE_Z",
"SCALE_ADJUST") AS
  SELECT
          DATUM_ID,
          DATUM_NAME,
          ELLIPSOID_ID,
          PRIME_MERIDIAN_ID,
          INFORMATION_SOURCE,
          DATA_SOURCE,
          SHIFT_X,
          SHIFT_Y,
          SHIFT_Z,
          ROTATE_X,
          ROTATE_Y,
          ROTATE_Z,
          SCALE_ADJUST
        FROM
          MDSYS.SDO_DATUMS
        WHERE
          DATUM_TYPE = 'GEODETIC';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_DATUM_VERTICAL" ("DATUM_ID",
"DATUM_NAME",
"ELLIPSOID_ID",
"PRIME_MERIDIAN_ID",
"INFORMATION_SOURCE",
"DATA_SOURCE",
"SHIFT_X",
"SHIFT_Y",
"SHIFT_Z",
"ROTATE_X",
"ROTATE_Y",
"ROTATE_Z",
"SCALE_ADJUST") AS
  SELECT
          DATUM_ID,
          DATUM_NAME,
          ELLIPSOID_ID,
          PRIME_MERIDIAN_ID,
          INFORMATION_SOURCE,
          DATA_SOURCE,
          SHIFT_X,
          SHIFT_Y,
          SHIFT_Z,
          ROTATE_X,
          ROTATE_Y,
          ROTATE_Z,
          SCALE_ADJUST
        FROM
          MDSYS.SDO_DATUMS
        WHERE
          DATUM_TYPE = 'VERTICAL';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_CRS_COMPOUND" ("SRID",
"COORD_REF_SYS_NAME",
"CMPD_HORIZ_SRID",
"CMPD_VERT_SRID",
"INFORMATION_SOURCE",
"DATA_SOURCE") AS
  SELECT
          SRID,
          COORD_REF_SYS_NAME,
          CMPD_HORIZ_SRID,
          CMPD_VERT_SRID,
          INFORMATION_SOURCE,
          DATA_SOURCE
        FROM
          MDSYS.SDO_COORD_REF_SYS
        WHERE
          COORD_REF_SYS_KIND = 'COMPOUND';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_CRS_ENGINEERING" ("SRID",
"COORD_REF_SYS_NAME",
"COORD_SYS_ID",
"DATUM_ID",
"INFORMATION_SOURCE",
"DATA_SOURCE") AS
  SELECT
          SRID,
          COORD_REF_SYS_NAME,
          COORD_SYS_ID,
          DATUM_ID,
          INFORMATION_SOURCE,
          DATA_SOURCE
        FROM
          MDSYS.SDO_COORD_REF_SYS
        WHERE
          COORD_REF_SYS_KIND = 'ENGINEERING';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_CRS_GEOCENTRIC" ("SRID",
"COORD_REF_SYS_NAME",
"COORD_SYS_ID",
"DATUM_ID",
"INFORMATION_SOURCE",
"DATA_SOURCE") AS
  SELECT
          SRID,
          COORD_REF_SYS_NAME,
          COORD_SYS_ID,
          DATUM_ID,
          INFORMATION_SOURCE,
          DATA_SOURCE
        FROM
          MDSYS.SDO_COORD_REF_SYS
        WHERE
          COORD_REF_SYS_KIND = 'GEOCENTRIC';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_CRS_GEOGRAPHIC2D" ("SRID",
"COORD_REF_SYS_NAME",
"COORD_SYS_ID",
"DATUM_ID",
"INFORMATION_SOURCE",
"DATA_SOURCE") AS
  SELECT
          SRID,
          COORD_REF_SYS_NAME,
          COORD_SYS_ID,
          DATUM_ID,
          INFORMATION_SOURCE,
          DATA_SOURCE
        FROM
          MDSYS.SDO_COORD_REF_SYS
        WHERE
          COORD_REF_SYS_KIND = 'GEOGRAPHIC2D';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_CRS_GEOGRAPHIC3D" ("SRID",
"COORD_REF_SYS_NAME",
"COORD_SYS_ID",
"DATUM_ID",
"INFORMATION_SOURCE",
"DATA_SOURCE") AS
  SELECT
          SRID,
          COORD_REF_SYS_NAME,
          COORD_SYS_ID,
          DATUM_ID,
          INFORMATION_SOURCE,
          DATA_SOURCE
        FROM
          MDSYS.SDO_COORD_REF_SYS
        WHERE
          COORD_REF_SYS_KIND = 'GEOGRAPHIC3D';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_CRS_PROJECTED" ("SRID",
"COORD_REF_SYS_NAME",
"COORD_SYS_ID",
"SOURCE_GEOG_SRID",
"PROJECTION_CONV_ID",
"INFORMATION_SOURCE",
"DATA_SOURCE") AS
  SELECT
          SRID,
          COORD_REF_SYS_NAME,
          COORD_SYS_ID,
          SOURCE_GEOG_SRID,
          PROJECTION_CONV_ID,
          INFORMATION_SOURCE,
          DATA_SOURCE
        FROM
          MDSYS.SDO_COORD_REF_SYS
        WHERE
          COORD_REF_SYS_KIND = 'PROJECTED';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_CRS_VERTICAL" ("SRID",
"COORD_REF_SYS_NAME",
"COORD_SYS_ID",
"DATUM_ID",
"INFORMATION_SOURCE",
"DATA_SOURCE") AS
  SELECT
          SRID,
          COORD_REF_SYS_NAME,
          COORD_SYS_ID,
          DATUM_ID,
          INFORMATION_SOURCE,
          DATA_SOURCE
        FROM
          MDSYS.SDO_COORD_REF_SYS
        WHERE
          COORD_REF_SYS_KIND = 'VERTICAL';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."GEODETIC_SRIDS" ("SRID") AS
  select srid from MDSYS.CS_SRS where WKTEXT like 'GEOGCS%'
  minus
  select srid from MDSYS.SDO_COORD_REF_SYS where coord_ref_sys_kind = 'GEOCENTRIC';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_ANGLE_UNITS" ("SDO_UNIT",
"UNIT_NAME",
"CONVERSION_FACTOR") AS
  SELECT
    SHORT_NAME "SDO_UNIT",
    UNIT_OF_MEAS_NAME "UNIT_NAME",
    (FACTOR_B/FACTOR_C) "CONVERSION_FACTOR"
  FROM
    MDSYS.SDO_UNITS_OF_MEASURE
  WHERE
    nls_lower(UNIT_OF_MEAS_TYPE)='angle';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_AREA_UNITS" ("SDO_UNIT",
"UNIT_NAME",
"CONVERSION_FACTOR") AS
  SELECT
    SHORT_NAME "SDO_UNIT",
    UNIT_OF_MEAS_NAME "UNIT_NAME",
    (FACTOR_B/FACTOR_C) "CONVERSION_FACTOR"
  FROM
    MDSYS.SDO_UNITS_OF_MEASURE
  WHERE
    nls_lower(UNIT_OF_MEAS_TYPE)='area';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_DIST_UNITS" ("SDO_UNIT",
"UNIT_NAME",
"CONVERSION_FACTOR") AS
  SELECT
    SHORT_NAME "SDO_UNIT",
    UNIT_OF_MEAS_NAME "UNIT_NAME",
    (FACTOR_B/FACTOR_C) "CONVERSION_FACTOR"
  FROM
    MDSYS.SDO_UNITS_OF_MEASURE
  WHERE
    nls_lower(UNIT_OF_MEAS_TYPE)='length';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_ELLIPSOIDS_OLD_FORMAT" ("NAME",
"SEMI_MAJOR_AXIS",
"INVERSE_FLATTENING") AS
  SELECT
    ELLIPSOID_NAME "NAME",
    SEMI_MAJOR_AXIS "SEMI_MAJOR_AXIS",
    INV_FLATTENING "INVERSE_FLATTENING"
  FROM
    MDSYS.SDO_ELLIPSOIDS
  WHERE
    NOT (INV_FLATTENING IS NULL)
UNION
  SELECT
    ELLIPSOID_NAME "NAME",
    SEMI_MAJOR_AXIS "SEMI_MAJOR_AXIS",
    (SEMI_MAJOR_AXIS/(SEMI_MAJOR_AXIS - SEMI_MINOR_AXIS)) "INVERSE_FLATTENING"
  FROM
    MDSYS.SDO_ELLIPSOIDS
  WHERE
    (INV_FLATTENING IS NULL)
    AND
    (SEMI_MINOR_AXIS < SEMI_MAJOR_AXIS)
UNION
  SELECT
    ELLIPSOID_NAME "NAME",
    SEMI_MAJOR_AXIS "SEMI_MAJOR_AXIS",
    1000000000000 "INVERSE_FLATTENING"
  FROM
    MDSYS.SDO_ELLIPSOIDS
  WHERE
    (INV_FLATTENING IS NULL)
    AND
    NOT (SEMI_MINOR_AXIS < SEMI_MAJOR_AXIS);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_PROJECTIONS_OLD_FORMAT" ("NAME") AS
  (
  SELECT DISTINCT
    OP.COORD_OP_NAME "NAME"
  FROM
    MDSYS.SDO_COORD_REF_SYS CRS,
    MDSYS.SDO_COORD_OPS OP
  WHERE
    CRS.PROJECTION_CONV_ID = OP.COORD_OP_ID
UNION
  SELECT
    NAME
  FROM
    MDSYS.SDO_PROJECTIONS_OLD_SNAPSHOT);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."SDO_DATUMS_OLD_FORMAT" ("NAME",
"SHIFT_X",
"SHIFT_Y",
"SHIFT_Z",
"ROTATE_X",
"ROTATE_Y",
"ROTATE_Z",
"SCALE_ADJUST") AS
  SELECT
    DATUM_NAME "NAME",
    SHIFT_X,
    SHIFT_Y,
    SHIFT_Z,
    ROTATE_X,
    ROTATE_Y,
    ROTATE_Z,
    SCALE_ADJUST
  FROM
    MDSYS.SDO_DATUMS;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_LIGHTSOURCES" ("NAME",
"DESCRIPTION",
"TYPE",
"DEFINITION") AS
  SELECT NAME, DESCRIPTION, TYPE, DEFINITION
FROM SDO_LIGHTSOURCEs_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_USER');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_LIGHTSOURCES" ("OWNER",
"NAME",
"DESCRIPTION",
"TYPE",
"DEFINITION") AS
  SELECT SDO_OWNER OWNER, NAME, DESCRIPTION, TYPE, DEFINITION
FROM SDO_LIGHTSOURCEs_TABLE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_ANIMATIONS" ("NAME",
"DESCRIPTION",
"DEFINITION") AS
  SELECT NAME, DESCRIPTION,DEFINITION
FROM SDO_ANIMATIONS_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_USER');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_ANIMATIONS" ("OWNER",
"NAME",
"DESCRIPTION",
"DEFINITION") AS
  SELECT SDO_OWNER OWNER, NAME, DESCRIPTION,DEFINITION
FROM SDO_ANIMATIONS_TABLE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_VIEWFRAMES" ("NAME",
"DESCRIPTION",
"SCENE_NAME",
"DEFINITION") AS
  SELECT NAME, DESCRIPTION, SCENE_NAME, DEFINITION
FROM SDO_VIEWFRAMES_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_USER');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_VIEWFRAMES" ("OWNER",
"NAME",
"DESCRIPTION",
"SCENE_NAME",
"DEFINITION") AS
  SELECT SDO_OWNER OWNER, NAME, DESCRIPTION, SCENE_NAME, DEFINITION
FROM SDO_VIEWFRAMES_TABLE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_SCENES" ("NAME",
"DESCRIPTION",
"DEFINITION") AS
  SELECT NAME, DESCRIPTION,DEFINITION
FROM SDO_SCENES_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_USER');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_SCENES" ("OWNER",
"NAME",
"DESCRIPTION",
"DEFINITION") AS
  SELECT SDO_OWNER OWNER, NAME, DESCRIPTION,DEFINITION
FROM SDO_SCENES_TABLE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_3DTHEMES" ("NAME",
"DESCRIPTION",
"BASE_TABLE",
"THEME_COLUMN",
"STYLE_COLUMN",
"THEME_TYPE",
"DEFINITION") AS
  SELECT NAME, DESCRIPTION, BASE_TABLE, THEME_COLUMN, STYLE_COLUMN, THEME_TYPE, DEFINITION
FROM SDO_3DTHEMES_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_USER');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_3DTHEMES" ("OWNER",
"NAME",
"DESCRIPTION",
"BASE_TABLE",
"THEME_COLUMN",
"STYLE_COLUMN",
"THEME_TYPE",
"DEFINITION") AS
  SELECT SDO_OWNER OWNER, NAME, DESCRIPTION, BASE_TABLE,
                  THEME_COLUMN, STYLE_COLUMN, THEME_TYPE, DEFINITION
FROM SDO_3DTHEMES_TABLE
WHERE
(exists
   (select table_name from all_tables
    where table_name=base_table
      and owner = sdo_owner
    union all
      select table_name from all_object_tables
      where table_name=base_table
      and owner = sdo_owner
    union all
    select view_name table_name from all_views
    where  view_name=base_table
      and owner = sdo_owner));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_3DTXFMS" ("NAME",
"DESCRIPTION",
"TYPE",
"AFFINE_PARAMETERS",
"COORD_TXFM_SRC_SRID",
"COORD_TXFM_TGT_SRID",
"TXFM_SERIES_IDS") AS
  SELECT NAME, DESCRIPTION,
TYPE, AFFINE_PARAMETERS, COORD_TXFM_SRC_SRID,
COORD_TXFM_TGT_SRID, TXFM_SERIES_IDS
FROM SDO_3DTXFMS_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_USER');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_3DTXFMS" ("OWNER",
"NAME",
"DESCRIPTION",
"TYPE",
"AFFINE_PARAMETERS",
"COORD_TXFM_SRC_SRID",
"COORD_TXFM_TGT_SRID",
"TXFM_SERIES_IDS") AS
  SELECT SDO_OWNER OWNER, NAME, DESCRIPTION,
TYPE, AFFINE_PARAMETERS, COORD_TXFM_SRC_SRID,
COORD_TXFM_TGT_SRID, TXFM_SERIES_IDS
FROM SDO_3DTXFMS_TABLE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_MAPS" ("NAME",
"DESCRIPTION",
"DEFINITION") AS
  SELECT NAME, DESCRIPTION,DEFINITION
FROM SDO_MAPS_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_SCHEMA');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_MAPS" ("OWNER",
"NAME",
"DESCRIPTION",
"DEFINITION") AS
  SELECT SDO_OWNER OWNER, NAME, DESCRIPTION,DEFINITION
FROM SDO_MAPS_TABLE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."DBA_SDO_MAPS" ("OWNER",
"NAME",
"DESCRIPTION",
"DEFINITION") AS
  SELECT SDO_OWNER OWNER, NAME, DESCRIPTION,DEFINITION
FROM SDO_MAPS_TABLE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_STYLES" ("NAME",
"TYPE",
"DESCRIPTION",
"DEFINITION",
"IMAGE",
"GEOMETRY") AS
  SELECT NAME, TYPE, DESCRIPTION,DEFINITION, IMAGE,GEOMETRY
FROM SDO_STYLES_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_SCHEMA');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_STYLES" ("OWNER",
"NAME",
"TYPE",
"DESCRIPTION",
"DEFINITION",
"IMAGE",
"GEOMETRY") AS
  SELECT SDO_OWNER OWNER, NAME, TYPE, DESCRIPTION,DEFINITION,
IMAGE,GEOMETRY
FROM SDO_STYLES_TABLE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."DBA_SDO_STYLES" ("OWNER",
"NAME",
"TYPE",
"DESCRIPTION",
"DEFINITION",
"IMAGE",
"GEOMETRY") AS
  SELECT SDO_OWNER OWNER, NAME, TYPE, DESCRIPTION,DEFINITION,
IMAGE,GEOMETRY
FROM SDO_STYLES_TABLE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_THEMES" ("NAME",
"DESCRIPTION",
"BASE_TABLE",
"GEOMETRY_COLUMN",
"STYLING_RULES") AS
  SELECT NAME, DESCRIPTION, BASE_TABLE, GEOMETRY_COLUMN, STYLING_RULES
FROM SDO_THEMES_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_SCHEMA');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_THEMES" ("OWNER",
"NAME",
"DESCRIPTION",
"BASE_TABLE",
"GEOMETRY_COLUMN",
"STYLING_RULES") AS
  SELECT SDO_OWNER OWNER, NAME, DESCRIPTION, BASE_TABLE,
                  GEOMETRY_COLUMN, STYLING_RULES
FROM SDO_THEMES_TABLE
WHERE
(exists
   (select table_name from all_tables
    where table_name=base_table
      and owner = sdo_owner
    union all
      select table_name from all_object_tables
      where table_name=base_table
      and owner = sdo_owner
    union all
    select view_name table_name from all_views
    where  view_name=base_table
      and owner = sdo_owner));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."DBA_SDO_THEMES" ("OWNER",
"NAME",
"DESCRIPTION",
"BASE_TABLE",
"GEOMETRY_COLUMN",
"STYLING_RULES") AS
  SELECT SDO_OWNER OWNER, NAME, DESCRIPTION, BASE_TABLE,
              GEOMETRY_COLUMN, STYLING_RULES
FROM SDO_THEMES_TABLE
WHERE
(exists
   (select table_name from dba_tables
    where table_name=base_table
    union all
      select table_name from dba_object_tables
      where table_name=base_table
    union all
    select view_name table_name from dba_views
    where  view_name=base_table));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_CACHED_MAPS" ("NAME",
"DESCRIPTION",
"TILES_TABLE",
"IS_ONLINE",
"IS_INTERNAL",
"DEFINITION",
"BASE_MAP",
"MAP_ADAPTER") AS
  SELECT NAME, DESCRIPTION, tiles_table, is_online, is_internal, DEFINITION, base_map, map_adapter
FROM mdsys.SDO_CACHED_MAPS_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_SCHEMA');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_CACHED_MAPS" ("OWNER",
"NAME",
"DESCRIPTION",
"TILES_TABLE",
"IS_ONLINE",
"IS_INTERNAL",
"DEFINITION",
"BASE_MAP",
"MAP_ADAPTER") AS
  SELECT SDO_OWNER OWNER, NAME, DESCRIPTION, tiles_table, is_online, is_internal, DEFINITION, base_map, map_adapter
FROM mdsys.SDO_CACHED_MAPS_TABLE ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_ANNOTATION_TEXT_METADATA" ("TABLE_NAME",
"COLUMN_NAME",
"MAP_BASE_SCALE",
"TEXT_EXPRESSION",
"TEXT_ATTRIBUTES") AS
  SELECT F_TABLE_NAME TABLE_NAME, F_TEXT_COLUMN COLUMN_NAME,
               MAP_BASE_SCALE,
               TEXT_DEFAULT_EXPRESSION TEXT_EXPRESSION ,
               TEXT_DEFAULT_ATTRIBUTES TEXT_ATTRIBUTES
FROM SDO_ANNOTATION_TEXT_METADATA
WHERE F_TABLE_SCHEMA =  sys_context('userenv', 'CURRENT_SCHEMA');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_ANNOTATION_TEXT_METADATA" ("OWNER",
"TABLE_NAME",
"COLUMN_NAME",
"MAP_BASE_SCALE",
"TEXT_EXPRESSION",
"TEXT_ATTRIBUTES") AS
  SELECT F_TABLE_SCHEMA OWNER, F_TABLE_NAME TABLE_NAME,
               F_TEXT_COLUMN COLUMN_NAME,
               MAP_BASE_SCALE,
               TEXT_DEFAULT_EXPRESSION TEXT_EXPRESSION,
               TEXT_DEFAULT_ATTRIBUTES TEXT_ATTRIBUTES
FROM SDO_ANNOTATION_TEXT_METADATA, ALL_OBJECTS a
       where a.object_name = F_TABLE_NAME and a.owner = F_TABLE_SCHEMA
             and a.object_type in ('TABLE', 'SYNONYM', 'VIEW');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_GEOR_SYSDATA" ("OWNER",
"TABLE_NAME",
"COLUMN_NAME",
"METADATA_COLUMN_NAME",
"RDT_TABLE_NAME",
"RASTER_ID",
"OTHER_TABLE_NAMES") AS
  SELECT SDO_OWNER                 OWNER,
       GEORASTER_TABLE_NAME      TABLE_NAME,
       GEORASTER_COLUMN_NAME     COLUMN_NAME,
       GEOR_METADATA_COLUMN_NAME METADATA_COLUMN_NAME,
       RDT_TABLE_NAME            RDT_TABLE_NAME,
       RASTER_ID                 RASTER_ID,
       OTHER_TABLE_NAMES         OTHER_TABLE_NAMES
FROM SDO_GEOR_SYSDATA_TABLE
WHERE
(
    (sdo_owner = sys_context('userenv', 'CURRENT_USER'))
    or
    exists
    (
     select table_name from all_tables
     where table_name=georaster_table_name
     and owner = sdo_owner
     union all
     select table_name from all_object_tables
     where table_name=georaster_table_name
     and owner = sdo_owner
     union all
     select view_name table_name from all_views
     where  view_name=georaster_table_name
     and owner = sdo_owner
     )
);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_GEOR_SYSDATA" ("TABLE_NAME",
"COLUMN_NAME",
"METADATA_COLUMN_NAME",
"RDT_TABLE_NAME",
"RASTER_ID",
"OTHER_TABLE_NAMES") AS
  SELECT TABLE_NAME, COLUMN_NAME,METADATA_COLUMN_NAME,
              RDT_TABLE_NAME,RASTER_ID,OTHER_TABLE_NAMES
FROM ALL_SDO_GEOR_SYSDATA
WHERE owner = sys_context('userenv', 'CURRENT_USER');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_NETWORK_METADATA" ("NETWORK",
"NETWORK_ID",
"NETWORK_CATEGORY",
"GEOMETRY_TYPE",
"NETWORK_TYPE",
"NO_OF_HIERARCHY_LEVELS",
"NO_OF_PARTITIONS",
"LRS_TABLE_NAME",
"LRS_GEOM_COLUMN",
"NODE_TABLE_NAME",
"NODE_GEOM_COLUMN",
"NODE_COST_COLUMN",
"NODE_PARTITION_COLUMN",
"NODE_DURATION_COLUMN",
"LINK_TABLE_NAME",
"LINK_GEOM_COLUMN",
"LINK_DIRECTION",
"LINK_COST_COLUMN",
"LINK_PARTITION_COLUMN",
"LINK_DURATION_COLUMN",
"PATH_TABLE_NAME",
"PATH_GEOM_COLUMN",
"PATH_LINK_TABLE_NAME",
"SUBPATH_TABLE_NAME",
"SUBPATH_GEOM_COLUMN",
"PARTITION_TABLE_NAME",
"PARTITION_BLOB_TABLE_NAME",
"COMPONENT_TABLE_NAME",
"NODE_LEVEL_TABLE_NAME",
"TOPOLOGY",
"USER_DEFINED_DATA",
"EXTERNAL_REFERENCES",
"CHILD_NETWORK",
"HIERARCHY_TABLE_NAME") AS
  SELECT NETWORK,
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
  FROM SDO_NETWORK_METADATA_TABLE
        WHERE SDO_OWNER = sys_context('userenv','CURRENT_USER');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_NETWORK_METADATA" ("OWNER",
"NETWORK",
"NETWORK_ID",
"NETWORK_CATEGORY",
"GEOMETRY_TYPE",
"NETWORK_TYPE",
"NO_OF_HIERARCHY_LEVELS",
"NO_OF_PARTITIONS",
"LRS_TABLE_NAME",
"LRS_GEOM_COLUMN",
"NODE_TABLE_NAME",
"NODE_GEOM_COLUMN",
"NODE_COST_COLUMN",
"NODE_PARTITION_COLUMN",
"NODE_DURATION_COLUMN",
"LINK_TABLE_NAME",
"LINK_GEOM_COLUMN",
"LINK_DIRECTION",
"LINK_COST_COLUMN",
"LINK_PARTITION_COLUMN",
"LINK_DURATION_COLUMN",
"PATH_TABLE_NAME",
"PATH_GEOM_COLUMN",
"PATH_LINK_TABLE_NAME",
"SUBPATH_TABLE_NAME",
"SUBPATH_GEOM_COLUMN",
"PARTITION_TABLE_NAME",
"PARTITION_BLOB_TABLE_NAME",
"COMPONENT_TABLE_NAME",
"NODE_LEVEL_TABLE_NAME",
"TOPOLOGY",
"USER_DEFINED_DATA",
"EXTERNAL_REFERENCES",
"CHILD_NETWORK",
"HIERARCHY_TABLE_NAME") AS
  SELECT SDO_OWNER OWNER,
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
        FROM SDO_NETWORK_METADATA_TABLE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_NETWORK_CONSTRAINTS" ("CONSTRAINT",
"DESCRIPTION",
"CLASS_NAME",
"CLASS") AS
  SELECT  constraint, description, class_name, class
    FROM  sdo_network_constraints
    WHERE sdo_owner = sys_context('USERENV', 'CURRENT_USER');

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_NETWORK_CONSTRAINTS" ("OWNER",
"CONSTRAINT",
"DESCRIPTION",
"CLASS_NAME",
"CLASS") AS
  SELECT  sdo_owner owner, constraint, description, class_name, class     FROM  sdo_network_constraints     WHERE EXISTS       (SELECT  NULL         FROM  all_java_classes          WHERE owner = sdo_owner            AND name = class_name );

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_NETWORK_JAVA_OBJECTS" ("NAME",
"DESCRIPTION",
"CLASS_NAME",
"CLASS",
"JAVA_INTERFACE") AS
  SELECT  constraint name, description, class_name, class,java_interface
    FROM  sdo_network_constraints
    WHERE sdo_owner = sys_context('USERENV', 'CURRENT_USER');

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_NETWORK_JAVA_OBJECTS" ("OWNER",
"NAME",
"DESCRIPTION",
"CLASS_NAME",
"CLASS",
"JAVA_INTERFACE") AS
  SELECT  sdo_owner owner, constraint name, description, class_name, class,java_interface     FROM  sdo_network_constraints     WHERE EXISTS       (SELECT  NULL         FROM  all_java_classes          WHERE owner = sdo_owner            AND name = class_name );

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_NETWORK_LOCKS_WM" ("LOCK_ID",
"NETWORK",
"WORKSPACE",
"ORIGINAL_NODE_FILTER",
"ORIGINAL_LINK_FILTER",
"ORIGINAL_PATH_FILTER",
"ADJUSTED_NODE_FILTER",
"ADJUSTED_LINK_FILTER",
"ADJUSTED_PATH_FILTER") AS
  SELECT  lock_id, network, workspace, original_node_filter, original_link_filter, original_path_filter, adjusted_node_filter, adjusted_link_filter, adjusted_path_filter
    FROM  sdo_network_locks_wm
    WHERE sdo_owner = sys_context('USERENV', 'CURRENT_USER');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_NETWORK_LOCKS_WM" ("OWNER",
"LOCK_ID",
"NETWORK",
"WORKSPACE",
"ORIGINAL_NODE_FILTER",
"ORIGINAL_LINK_FILTER",
"ORIGINAL_PATH_FILTER",
"ADJUSTED_NODE_FILTER",
"ADJUSTED_LINK_FILTER",
"ADJUSTED_PATH_FILTER") AS
  SELECT  sdo_owner owner, lock_id, network, workspace,  original_node_filter,  original_link_filter,  original_path_filter, adjusted_node_filter, adjusted_link_filter, adjusted_path_filter
    FROM  sdo_network_locks_wm;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_NETWORK_USER_DATA" ("NETWORK",
"TABLE_TYPE",
"DATA_NAME",
"DATA_TYPE",
"DATA_LENGTH",
"CATEGORY_ID") AS
  SELECT  network, table_type, data_name, data_type,data_length, category_id
    FROM  sdo_network_user_data
    WHERE sdo_owner = sys_context('USERENV', 'CURRENT_USER');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_NETWORK_USER_DATA" ("OWNER",
"NETWORK",
"TABLE_TYPE",
"DATA_NAME",
"DATA_TYPE",
"DATA_LENGTH",
"CATEGORY_ID") AS
  SELECT  sdo_owner owner, network, table_type, data_name, data_type,data_length, category_id
    FROM  sdo_network_user_data;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_NETWORK_HISTORIES" ("NETWORK",
"NODE_HISTORY_TABLE",
"LINK_HISTORY_TABLE",
"NODE_TRIGGER",
"LINK_TRIGGER") AS
  SELECT  network, node_history_table, link_history_table, node_trigger, link_trigger
    FROM  sdo_network_histories
    WHERE owner = sys_context('USERENV', 'CURRENT_USER');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_NETWORK_HISTORIES" ("OWNER",
"NETWORK",
"NODE_HISTORY_TABLE",
"LINK_HISTORY_TABLE",
"NODE_TRIGGER",
"LINK_TRIGGER") AS
  SELECT  "OWNER","NETWORK","NODE_HISTORY_TABLE","LINK_HISTORY_TABLE","NODE_TRIGGER","LINK_TRIGGER"
    FROM  sdo_network_histories;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_NETWORK_TIMESTAMPS" ("NETWORK",
"TABLE_NAME",
"LAST_DML_TIME") AS
  SELECT  network, table_name, last_dml_time
    FROM  sdo_network_timestamps
    WHERE owner = sys_context('USERENV', 'CURRENT_USER');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_NETWORK_TIMESTAMPS" ("OWNER",
"NETWORK",
"TABLE_NAME",
"LAST_DML_TIME") AS
  SELECT  "OWNER","NETWORK","TABLE_NAME","LAST_DML_TIME"
    FROM  sdo_network_timestamps;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_NETWORK_FEATURE" ("OWNER",
"NETWORK",
"FEATURE_LAYER_NAME",
"FEATURE_LAYER_ID",
"FEATURE_LAYER_TYPE",
"FEATURE_TABLE_NAME",
"RELATION_TABLE_NAME",
"HIERARCHY_TABLE_NAME") AS
  SELECT
  SDO_OWNER OWNER,
  NETWORK,
  FEATURE_LAYER_NAME,
  FEATURE_LAYER_ID,
  FEATURE_LAYER_TYPE,
  FEATURE_TABLE_NAME,
  RELATION_TABLE_NAME,
  HIERARCHY_TABLE_NAME
FROM SDO_NETWORK_FEATURE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_NETWORK_FEATURE" ("NETWORK",
"FEATURE_LAYER_NAME",
"FEATURE_LAYER_ID",
"FEATURE_LAYER_TYPE",
"FEATURE_TABLE_NAME",
"RELATION_TABLE_NAME",
"HIERARCHY_TABLE_NAME") AS
  SELECT
  NETWORK,
  FEATURE_LAYER_NAME,
  FEATURE_LAYER_ID,
  FEATURE_LAYER_TYPE,
  FEATURE_TABLE_NAME,
  RELATION_TABLE_NAME,
  HIERARCHY_TABLE_NAME
FROM SDO_NETWORK_FEATURE
WHERE SDO_OWNER = sys_context('USERENV', 'CURRENT_USER');

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."CURRENTSESSIONTOKENMAP$" ("SESSIONID",
"TOKENID") AS
  select sessionId , tokenId from MDSYS.CurrentSessionTokenMap_t$ where sessionId in (select dbms_session.unique_session_id from dual);

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."TOKENSESSIONMAP$" ("SESSIONID",
"TOKENID",
"EXPIRYTIME",
"EXPIRYOFFSET") AS
  select sessionId , tokenId , expiryTime, expiryOffset from MDSYS.TokenSessionMap_t$ where (tokenId in (select tokenId from MDSYS.CurrentSessionTokenMap$ where sessionId in (select dbms_session.unique_session_id from dual))) or expiryTime < sysdate;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ROWTOKENMAP$" ("TOKENID",
"TABLENAME",
"RPOINTER",
"MARKEDDELETED") AS
  select tokenId , tableName , rpointer , markedDeleted from  MDSYS.RowTokenMap_t$  where tokenId in (select tokenId from mdsys.TokenSessionMap$) ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."ALL_SDO_TIN_PC_SYSDATA" ("OWNER",
"TABLE_NAME",
"COLUMN_NAME",
"DEP_TABLE_SCHEMA",
"DEP_TABLE_NAME") AS
  SELECT SDO_OWNER                 OWNER,
       TABLE_NAME,
       COLUMN_NAME,
       DEP_TABLE_SCHEMA,
       DEP_TABLE_NAME
FROM SDO_TIN_PC_SYSDATA_TABLE a
WHERE
(
    exists
    (
     select table_name from all_tables
     where table_name=a.table_name
     and owner = sdo_owner
     union all
     select table_name from all_object_tables
     where table_name=a.table_name
     and owner = sdo_owner
     union all
     select view_name table_name from all_views
     where  view_name=a.table_name
     and owner = sdo_owner
     )
);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MDSYS"."USER_SDO_TIN_PC_SYSDATA" ("OWNER",
"TABLE_NAME",
"COLUMN_NAME",
"DEP_TABLE_SCHEMA",
"DEP_TABLE_NAME") AS
  SELECT "OWNER","TABLE_NAME","COLUMN_NAME","DEP_TABLE_SCHEMA","DEP_TABLE_NAME"  FROM all_sdo_tin_pc_sysdata
WHERE owner = sys_context('userenv', 'CURRENT_SCHEMA');

