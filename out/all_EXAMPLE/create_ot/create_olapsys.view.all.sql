-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$OLAP2_AW_CATALOGS" ("AW_OWNER",
"AW_NAME",
"CATALOG_ID",
"CATALOG_NAME",
"PARENT_CATALOG_NAME",
"DESCRIPTION") AS
  SELECT AW.AWOWNER as AW_OWNER,
       AW.AWNAME as AW_NAME,
       AW.COL5 as CATALOG_ID,
       AW.COL1 as CATALOG_NAME,
       AW.COL4 as PARENT_CATALOG_NAME,
       AW.COL2 as DESCRIPTION
FROM
TABLE(CAST(OLAP_TABLE('SYS.AWMD duration query', 'olapsys.ALL_OLAP2_AW_METADATA_T',
                       'ACTIVE_CATALOG ''ALL_CATALOGS'' ''ALL''',
                       'MEASURE AWOWNER FROM sys.awmd!CAT_AWOWNER
                        MEASURE AWNAME FROM sys.awmd!CAT_AWNAME
                        MEASURE COL5 FROM sys.awmd!CAT_CATALOG_ID
                        MEASURE COL1 FROM sys.awmd!CAT_MEASFOLDERNAME
                        MEASURE COL2 FROM sys.awmd!CAT_MEASFOLDERDESC
                        MEASURE COL4 FROM sys.awmd!CAT_PARENTFOLDERNAME
                        DIMENSION AWMDKEY FROM sys.awmd!AWMDKEY_CAT')
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$OLAP2_AW_CATALOG_MEASURES" ("AW_OWNER",
"AW_NAME",
"CATALOG_ID",
"CATALOG_NAME",
"ENTITY_OWNER",
"ENTITY_NAME",
"CHILD_ENTITY_NAME") AS
  SELECT AW.AWOWNER as AW_OWNER,
       AW.AWNAME as AW_NAME,
       AW.COL5 as CATALOG_ID,
       AW.COL4 as CATALOG_NAME,
       AW.COL1 as ENTITY_OWNER,
       AW.COL2 as ENTITY_NAME,
       AW.COL3 as CHILD_ENTITY_NAME
FROM
TABLE(CAST(OLAP_TABLE('SYS.AWMD duration query', 'olapsys.ALL_OLAP2_AW_METADATA_T',
                       'ACTIVE_CATALOG ''ALL_CATALOG_MEASURES'' ''ALL''',
                       'MEASURE AWOWNER FROM sys.awmd!CATM_AWOWNER
                        MEASURE AWNAME FROM sys.awmd!CATM_AWNAME
                        MEASURE COL5 FROM sys.awmd!CATM_CATALOG_ID
                        MEASURE COL1 FROM sys.awmd!CATM_AWOWNER
                        MEASURE COL2 FROM sys.awmd!CATM_CUBE_NAME
                        MEASURE COL3 FROM sys.awmd!CATM_MEASURE_NAME
                        MEASURE COL4 FROM sys.awmd!CATM_MEASFOLDERNAME
                        DIMENSION AWMDKEY FROM sys.awmd!AWMDKEY_CATM')
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$OLAP2_AW_PHYS_OBJ" ("AW_OWNER",
"AW_NAME",
"AW_OBJECT_NAME",
"AW_OBJECT_TYPE",
"AW_OBJECT_DATATYPE") AS
  SELECT AW.AWOWNER as AW_OWNER,
       AW.AWNAME as AW_NAME,
       AW.AWOBJECT as AW_OBJECT_NAME,
       AW.COL1 as AW_OBJECT_TYPE,
       AW.COL2 as AW_OBJECT_DATATYPE
FROM
TABLE(CAST (OLAP_TABLE('SYS.AWMD duration query', 'olapsys.ALL_OLAP2_AW_METADATA_T',
                       'ACTIVE_CATALOG ''ALL_OLAP2_AW_PHYS_OBJ'' ''ALL''',
                       'MEASURE AWOWNER FROM sys.awmd!AWOWNER
                        MEASURE AWNAME FROM sys.awmd!AWNAME
                        MEASURE AWOBJECT FROM sys.awmd!AWOBJECT
                        MEASURE COL1 FROM sys.awmd!AWOBJECTTYPE
                        MEASURE COL2 FROM sys.awmd!AWOBJECTDATATYPE
                        DIMENSION AWMDKEY FROM sys.awmd!AWMDKEY')
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$OLAP2_AW_PHYS_OBJ_PROP" ("AW_OWNER",
"AW_NAME",
"AW_OBJECT_NAME",
"AW_PROP_NAME",
"AW_PROP_VALUE") AS
  SELECT AW.AWOWNER as AW_OWNER,
       AW.AWNAME as AW_NAME,
       AW.AWOBJECT as AW_OBJECT_NAME,
       AW.COL1 as AW_PROP_NAME,
       AW.COL2 as AW_PROP_VALUE
FROM
TABLE(CAST (OLAP_TABLE('SYS.AWMD duration query', 'olapsys.ALL_OLAP2_AW_METADATA_T',
                       'ACTIVE_CATALOG ''ALL_OLAP2_AW_PHYS_OBJ_PROP'' ''ALL''',
                         'MEASURE AWOWNER FROM sys.awmd!PROPS_AWOWNER
                          MEASURE AWNAME FROM sys.awmd!PROPS_AWNAME
                          MEASURE AWOBJECT FROM sys.awmd!PROPS_AWOBJECT
                          MEASURE COL1 FROM sys.awmd!PROPS_AWOBJECTPROPNAME
                          MEASURE COL2 FROM sys.awmd!PROPS_AWOBJECTPROPVALUE
                          DIMENSION AWMDKEY FROM sys.awmd!AWMDKEY_PROPS')
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$OLAP2_AW_DIMENSIONS" ("AW_OWNER",
"AW_NAME",
"AW_LOGICAL_NAME",
"AW_PHYSICAL_OBJECT",
"SOURCE_OWNER",
"SOURCE_NAME") AS
  SELECT AW.AWOWNER as AW_OWNER,
       AW.AWNAME as AW_NAME,
       AW.AWOBJECT as AW_LOGICAL_NAME,
       AW.COL3 as AW_PHYSICAL_OBJECT,
       AW.COL1 as SOURCE_OWNER,
       AW.COL2 as SOURCE_NAME
FROM
TABLE(CAST (OLAP_TABLE('SYS.AWMD duration query', 'olapsys.ALL_OLAP2_AW_METADATA_T',
                       'ACTIVE_CATALOG ''ALL_DIMENSIONS'' ''ALL''',
                       'MEASURE AWOWNER FROM SYS.AWMD!DIM_OWNER
                        MEASURE AWNAME FROM SYS.AWMD!DIM_AWNAME
                        MEASURE AWOBJECT FROM SYS.AWMD!DIM_DIMENSION_NAME
                        MEASURE COL1 FROM SYS.AWMD!DIM_SOURCE_OWNER
                        MEASURE COL2 FROM SYS.AWMD!DIM_SOURCE_NAME
                        MEASURE COL3 from SYS.AWMD!DIM_AW_PHYSICAL_OBJECT
                        DIMENSION AWMDKEY FROM SYS.AWMD!AWMDKEY_DIM'
                        )
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$OLAP2_AW_ATTRIBUTES" ("AW_OWNER",
"AW_NAME",
"AW_DIMENSION_NAME",
"AW_LOGICAL_NAME",
"AW_PHYSICAL_OBJECT",
"DISPLAY_NAME",
"DESCRIPTION",
"ATTRIBUTE_TYPE",
"SOURCE_OWNER",
"SOURCE_DIMENSION_NAME",
"SOURCE_NAME") AS
  SELECT AW.AWOWNER as AW_OWNER,
       AW.AWNAME as AW_NAME,
       AW.COL4 as AW_DIMENSION_NAME,
       AW.AWOBJECT as AW_LOGICAL_NAME,
       AW.COL3 as AW_PHYSICAL_OBJECT,
       AW.COL7 as DISPLAY_NAME,
       AW.COL8 as DESCRIPTION,
       AW.COL9 as ATTRIBUTE_TYPE,
       AW.COL1 as SOURCE_OWNER,
       AW.COL6 as SOURCE_DIMENSION_NAME,
       AW.COL2 as SOURCE_NAME
FROM
TABLE(CAST (OLAP_TABLE('SYS.AWMD duration query', 'olapsys.ALL_OLAP2_AW_METADATA_T',
                       'ACTIVE_CATALOG ''ALL_ATTRIBUTES'' ''ALL''',
                       'MEASURE AWOWNER FROM SYS.AWMD!ATTR_OWNER
                        MEASURE AWNAME FROM SYS.AWMD!ATTR_AWNAME
                        MEASURE AWOBJECT FROM SYS.AWMD!ATTR_ATTRIBUTE_NAME
                        MEASURE COL1 FROM SYS.AWMD!ATTR_SOURCE_OWNER
                        MEASURE COL2 FROM SYS.AWMD!ATTR_SOURCE_NAME
                        MEASURE COL3 from SYS.AWMD!ATTR_AW_PHYSICAL_OBJECT
                        MEASURE COL6 FROM SYS.AWMD!ATTR_DIMENSION_SOURCE_NAME
                        MEASURE COL4 FROM SYS.AWMD!ATTR_DIMENSION_NAME
                        MEASURE COL7 FROM SYS.AWMD!ATTR_DISPLAY_NAME
                        MEASURE COL8 FROM SYS.AWMD!ATTR_DESCRIPTION
                        MEASURE COL9 FROM SYS.AWMD!ATTR_CF_TYPE
                        DIMENSION AWMDKEY FROM SYS.AWMD!AWMDKEY_ATTR'
                        )
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$OLAP2_AW_CUBES" ("AW_OWNER",
"AW_NAME",
"AW_LOGICAL_NAME",
"AW_PHYSICAL_OBJECT",
"SOURCE_OWNER",
"SOURCE_NAME") AS
  SELECT AW.AWOWNER as AW_OWNER,
       AW.AWNAME as AW_NAME,
       AW.AWOBJECT as AW_LOGICAL_NAME,
       AW.COL3 as AW_PHYSICAL_OBJECT,
       AW.COL1 as SOURCE_OWNER,
       AW.COL2 as SOURCE_NAME
FROM
TABLE(CAST (OLAP_TABLE('SYS.AWMD duration query', 'olapsys.ALL_OLAP2_AW_METADATA_T',
                       'ACTIVE_CATALOG ''ALL_CUBES'' ''ALL''',
                       'MEASURE AWOWNER FROM SYS.AWMD!CUBE_OWNER
                        MEASURE AWNAME FROM SYS.AWMD!CUBE_AWNAME
                        MEASURE AWOBJECT FROM SYS.AWMD!CUBE_CUBE_NAME
                        MEASURE COL1 FROM SYS.AWMD!CUBE_SOURCE_OWNER
                        MEASURE COL2 FROM SYS.AWMD!CUBE_SOURCE_NAME
                        MEASURE COL3 FROM SYS.AWMD!CUBE_AW_PHYSICAL_OBJECT
                        DIMENSION AWMDKEY FROM SYS.AWMD!AWMDKEY_CUBE'
                        )
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$OLAP2_AW_CUBE_DIM_USES" ("AW_OWNER",
"AW_NAME",
"AW_LOGICAL_NAME",
"DIMENSION_AW_OWNER",
"DIMENSION_AW_NAME",
"DIMENSION_SOURCE_OWNER",
"DIMENSION_SOURCE_NAME") AS
  SELECT AW.AWOWNER as AW_OWNER,
       AW.AWNAME as AW_NAME,
       AW.AWOBJECT as AW_LOGICAL_NAME,
       AW.COL1 as DIMENSION_AW_OWNER,
       AW.COL2 as DIMENSION_AW_NAME,
       AW.COL3 as DIMENSION_SOURCE_OWNER,
       AW.COL4 as DIMENSION_SOURCE_NAME
FROM
TABLE(CAST (OLAP_TABLE('SYS.AWMD duration query', 'olapsys.ALL_OLAP2_AW_METADATA_T',
                       'ACTIVE_CATALOG ''ALL_CUBE_DIM_USES'' ''ALL''',
                       'MEASURE AWOWNER FROM SYS.AWMD!CDU_OWNER
                        MEASURE AWNAME FROM SYS.AWMD!CDU_AWNAME
                        MEASURE AWOBJECT FROM SYS.AWMD!CDU_CUBE_NAME
                        MEASURE COL1 FROM SYS.AWMD!CDU_DIMENSION_OWNER
                        MEASURE COL2 FROM SYS.AWMD!CDU_DIMENSION_NAME
                        MEASURE COL3 FROM SYS.AWMD!CDU_DIMENSION_SOURCE_OWNER
                        MEASURE COL4 FROM SYS.AWMD!CDU_DIMENSION_SOURCE_NAME
                        DIMENSION AWMDKEY FROM SYS.AWMD!AWMDKEY_CDU'
                        )
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$AW_DIM_ENABLED_VIEWS" ("AW_OWNER",
"AW_NAME",
"DIMENSION_NAME",
"HIERARCHY_NAME",
"SYSTEM_VIEWNAME",
"USER_VIEWNAME") AS
  SELECT AW.AWOWNER as AW_OWNER,
         AW.AWNAME as AW_NAME,
         AW.COL1 as DIMENSION_NAME,
         AW.COL2 as HIERARCHY_NAME,
         AW.COL3 as SYSTEM_VIEWNAME,
         AW.COL4 as USER_VIEWNAME
  FROM
    TABLE(CAST(OLAP_TABLE('SYS.AWMD duration query',
                          'olapsys.ALL_OLAP2_AW_METADATA_T',
                          'ACTIVE_CATALOG ''ALL_AW_DIM_ENABLED_VIEWS'' ''ALL''',
                          'MEASURE AWOWNER FROM SYS.AWMD!AWOWNER
                           MEASURE AWNAME FROM SYS.AWMD!AWNAME
                           MEASURE COL1 FROM SYS.AWMD!DIMENSION_NAME
                           MEASURE COL2 FROM SYS.AWMD!HIERARCHY_NAME
                           MEASURE COL3 FROM SYS.AWMD!VIEWNAME
                           MEASURE COL4 FROM SYS.AWMD!USERVIEWNAME
                           DIMENSION AWMDKEY FROM SYS.AWMD!AWMDKEY')
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$AW_CUBE_ENABLED_VIEWS" ("AW_OWNER",
"AW_NAME",
"CUBE_NAME",
"HIERCOMBO_NUM",
"HIERCOMBO_STR",
"SYSTEM_VIEWNAME",
"USER_VIEWNAME") AS
  SELECT AW.AWOWNER as AW_OWNER,
         AW.AWNAME as AW_NAME,
         AW.COL1 as CUBE_NAME,
         AW.COL5 as HIERCOMBO_NUM,
         AW.COL6 as HIERCOMBO_STR,
         AW.COL3 as SYSTEM_VIEWNAME,
         AW.COL4 as USER_VIEWNAME
  FROM
    TABLE(CAST(OLAP_TABLE('SYS.AWMD duration query',
                          'olapsys.ALL_OLAP2_AW_METADATA_T',
                          'ACTIVE_CATALOG ''ALL_AW_CUBE_ENABLED_VIEWS'' ''ALL''',
                          'MEASURE AWOWNER FROM SYS.AWMD!AWOWNER
                           MEASURE AWNAME FROM SYS.AWMD!AWNAME
                           MEASURE COL1 FROM SYS.AWMD!CUBE_NAME
                           MEASURE COL5 FROM SYS.AWMD!HIERCOMBO_NUM
                           MEASURE COL6 FROM SYS.AWMD!HIERCOMBO_STR
                           MEASURE COL3 FROM SYS.AWMD!VIEWNAME
                           MEASURE COL4 FROM SYS.AWMD!USERVIEWNAME
                           DIMENSION AWMDKEY FROM SYS.AWMD!AWMDKEY')
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$AW_CUBE_ENABLED_HIERCOMBO" ("AW_OWNER",
"AW_NAME",
"CUBE_NAME",
"HIERCOMBO_NUM",
"HIERCOMBO_STR") AS
  SELECT AW.AWOWNER as AW_OWNER,
         AW.AWNAME as AW_NAME,
         AW.COL1 as CUBE_NAME,
         AW.COL5 as HIERCOMBO_NUM,
         AW.COL3 as HIERCOMBO_STR
  FROM
    TABLE(CAST(OLAP_TABLE('SYS.AWMD duration query',
                          'olapsys.ALL_OLAP2_AW_METADATA_T',
                          'ACTIVE_CATALOG ''ALL_AW_CUBE_ENABLED_HIERCOMBO'' ''ALL''',
                          'MEASURE AWOWNER FROM SYS.AWMD!AWOWNER
                           MEASURE AWNAME FROM SYS.AWMD!AWNAME
                           MEASURE COL1 FROM SYS.AWMD!CUBE_NAME
                           MEASURE COL5 FROM SYS.AWMD!HIERCOMBO_NUM
                           MEASURE COL3 FROM SYS.AWMD!HIERCOMBO_STR
                           DIMENSION AWMDKEY FROM SYS.AWMD!AWMDKEY')
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$OLAP2_AW_DIM_LEVELS" ("AW_OWNER",
"AW_NAME",
"AW_LOGICAL_NAME",
"LEVEL_NAME",
"DISPLAY_NAME",
"DESCRIPTION") AS
  SELECT AW.AWOWNER as AW_OWNER,
       AW.AWNAME as AW_NAME,
       AW.AWOBJECT as AW_LOGICAL_NAME,
       AW.COL1 as LEVEL_NAME,
       AW.COL2 as DISPLAY_NAME,
       AW.COL3 as DESCRIPTION
FROM
TABLE(CAST (OLAP_TABLE('SYS.AWMD duration query', 'olapsys.ALL_OLAP2_AW_METADATA_T',
                       'ACTIVE_CATALOG ''ALL_DIM_LEVELS'' ''ALL''',
                       'MEASURE AWOWNER FROM SYS.AWMD!DL_OWNER
                        MEASURE AWNAME FROM SYS.AWMD!DL_AWNAME
                        MEASURE AWOBJECT FROM SYS.AWMD!DL_DIMENSION_NAME
                        MEASURE COL1 FROM SYS.AWMD!DL_LEVEL_NAME
                        MEASURE COL2 FROM SYS.AWMD!DL_DISPLAY_NAME
                        MEASURE COL3 FROM SYS.AWMD!DL_DESCRIPTION
                        DIMENSION AWMDKEY FROM SYS.AWMD!AWMDKEY_DL'
                        )
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$OLAP2_AW_DIM_HIER_LVL_ORD" ("AW_OWNER",
"AW_NAME",
"AW_DIMENSION_NAME",
"AW_HIERARCHY_NAME",
"IS_DEFAULT_HIER",
"AW_LEVEL_NAME",
"POSITION") AS
  SELECT AW.AWOWNER as AW_OWNER,
       AW.AWNAME as AW_NAME,
       AW.AWOBJECT as AW_DIMENSION_NAME,
       AW.COL1 as AW_HIERARCHY_NAME,
       AW.COL2 as IS_DEFAULT_HIER,
       AW.COL3 as AW_LEVEL_NAME,
       AW.COL5 as POSITION
FROM
TABLE(CAST (OLAP_TABLE('SYS.AWMD duration query', 'olapsys.ALL_OLAP2_AW_METADATA_T',
                       'ACTIVE_CATALOG ''ALL_DIM_HIER_LVL_ORD'' ''ALL''',
                       'MEASURE AWOWNER FROM SYS.AWMD!DHLO_OWNER
                        MEASURE AWNAME FROM SYS.AWMD!DHLO_AWNAME
                        MEASURE AWOBJECT FROM SYS.AWMD!DHLO_DIMENSION_NAME
                        MEASURE COL1 FROM SYS.AWMD!DHLO_HIERARCHY_NAME
                        MEASURE COL2 FROM SYS.AWMD!DHLO_IS_DFLT_HIER
                        MEASURE COL3 FROM SYS.AWMD!DHLO_LEVEL_NAME
                        MEASURE COL5 FROM SYS.AWMD!DHLO_HIER_LVL_POS
                        DIMENSION AWMDKEY FROM SYS.AWMD!AWMDKEY_DHLO'
                        )
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$OLAP2_AW_CUBE_MEASURES" ("AW_OWNER",
"AW_NAME",
"AW_CUBE_NAME",
"AW_MEASURE_NAME",
"AW_PHYSICAL_OBJECT",
"MEASURE_SOURCE_NAME",
"DISPLAY_NAME",
"DESCRIPTION",
"IS_AGGREGATEABLE") AS
  SELECT AW.AWOWNER as AW_OWNER,
       AW.AWNAME as AW_NAME,
       AW.AWOBJECT as AW_CUBE_NAME,
       AW.COL1 as AW_MEASURE_NAME,
       AW.COL6 as AW_PHYSICAL_OBJECT,
       AW.COL2 as MEASURE_SOURCE_NAME,
       AW.COL3 as DISPLAY_NAME,
       AW.COL4 as DESCRIPTION,
       AW.COL7 as IS_AGGREGATEABLE
FROM
TABLE(CAST (OLAP_TABLE('SYS.AWMD duration query', 'olapsys.ALL_OLAP2_AW_METADATA_T',
                       'ACTIVE_CATALOG ''ALL_CUBE_MEASURES'' ''ALL''',
                       'MEASURE AWOWNER FROM SYS.AWMD!CM_OWNER
                        MEASURE AWNAME FROM SYS.AWMD!CM_AWNAME
                        MEASURE AWOBJECT FROM SYS.AWMD!CM_CUBE_NAME
                        MEASURE COL1 FROM SYS.AWMD!CM_MEASURE_NAME
                        MEASURE COL2 FROM SYS.AWMD!CM_SOURCE_NAME
                        MEASURE COL3 FROM SYS.AWMD!CM_DISPLAY_NAME
                        MEASURE COL4 FROM SYS.AWMD!CM_DESCRIPTION
                        MEASURE COL6 FROM SYS.AWMD!CM_AW_PHYSICAL_OBJECT
                        MEASURE COL7 FROM SYS.AWMD!CM_ISAGGREGATEABLE
                        DIMENSION AWMDKEY FROM SYS.AWMD!AWMDKEY_CM'
                        )
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$OLAP2_AW_CUBE_AGG_SPECS" ("AW_OWNER",
"AW_NAME",
"AW_CUBE_NAME",
"AW_AGGSPEC_NAME") AS
  SELECT AW.AWOWNER as AW_OWNER,
       AW.AWNAME as AW_NAME,
       AW.AWOBJECT as AW_CUBE_NAME,
       AW.COL1 as AW_AGGSPEC_NAME
FROM
TABLE(CAST (OLAP_TABLE('SYS.AWMD duration query', 'olapsys.ALL_OLAP2_AW_METADATA_T',
                       'ACTIVE_CATALOG ''ALL_CUBE_AGGSPECS'' ''ALL''',
                       'MEASURE AWOWNER FROM SYS.AWMD!OWNER
                        MEASURE AWNAME FROM SYS.AWMD!AWNAME
                        MEASURE AWOBJECT FROM SYS.AWMD!CUBE_NAME
                        MEASURE COL1 FROM SYS.AWMD!AGGSPEC_NAME
                        DIMENSION AWMDKEY FROM SYS.AWMD!AWMDKEY'
                        )
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$OLAP2_AW_CUBE_AGG_MEAS" ("AW_OWNER",
"AW_NAME",
"AW_CUBE_NAME",
"AW_AGGSPEC_NAME",
"AW_MEASURE_NAME") AS
  SELECT AW.AWOWNER as AW_OWNER,
       AW.AWNAME as AW_NAME,
       AW.AWOBJECT as AW_CUBE_NAME,
       AW.COL1 as AW_AGGSPEC_NAME,
       AW.COL2 as AW_MEASURE_NAME
FROM
TABLE(CAST (OLAP_TABLE('SYS.AWMD duration query', 'olapsys.ALL_OLAP2_AW_METADATA_T',
                       'ACTIVE_CATALOG ''ALL_CUBE_AGGSPECS_MEASURES'' ''ALL''',
                       'MEASURE AWOWNER FROM SYS.AWMD!OWNER
                        MEASURE AWNAME FROM SYS.AWMD!AWNAME
                        MEASURE AWOBJECT FROM SYS.AWMD!CUBE_NAME
                        MEASURE COL1 FROM SYS.AWMD!AGGSPEC_NAME
                        MEASURE COL2 FROM SYS.AWMD!MEASURE_NAME
                        DIMENSION AWMDKEY FROM SYS.AWMD!AWMDKEY'
                        )
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$OLAP2_AW_CUBE_AGG_LVL" ("AW_OWNER",
"AW_NAME",
"AW_CUBE_NAME",
"AW_AGGSPEC_NAME",
"AW_DIMENSION_NAME",
"AW_LEVEL_NAME") AS
  SELECT AW.AWOWNER as AW_OWNER,
       AW.AWNAME as AW_NAME,
       AW.AWOBJECT as AW_CUBE_NAME,
       AW.COL1 as AW_AGGSPEC_NAME,
       AW.COL2 as AW_DIMENSION_NAME,
       AW.COL3 as AW_LEVEL_NAME
FROM
TABLE(CAST (OLAP_TABLE('SYS.AWMD duration query', 'olapsys.ALL_OLAP2_AW_METADATA_T',
                       'ACTIVE_CATALOG ''ALL_CUBE_AGGSPECS_LEVELS'' ''ALL''',
                       'MEASURE AWOWNER FROM SYS.AWMD!OWNER
                        MEASURE AWNAME FROM SYS.AWMD!AWNAME
                        MEASURE AWOBJECT FROM SYS.AWMD!CUBE_NAME
                        MEASURE COL1 FROM SYS.AWMD!AGGSPEC_NAME
                        MEASURE COL2 FROM SYS.AWMD!DIMENSION_NAME
                        MEASURE COL3 FROM SYS.AWMD!LEVEL_NAME
                        DIMENSION AWMDKEY FROM SYS.AWMD!AWMDKEY'
                        )
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLAPSYS"."ALL$OLAP2_AW_CUBE_AGG_OP" ("AW_OWNER",
"AW_NAME",
"AW_CUBE_NAME",
"AW_MEASURE_NAME",
"AW_AGGSPEC_NAME",
"AW_DIMENSION_NAME",
"OPERATOR") AS
  SELECT AW.AWOWNER as AW_OWNER,
       AW.AWNAME as AW_NAME,
       AW.AWOBJECT as AW_CUBE_NAME,
       NULL as AW_MEASURE_NAME,
       AW.COL1 as AW_AGGSPEC_NAME,
       AW.COL2 as AW_DIMENSION_NAME,
       AW.COL3 as OPERATOR
FROM
TABLE(CAST (OLAP_TABLE('SYS.AWMD duration query', 'olapsys.ALL_OLAP2_AW_METADATA_T',
                       'ACTIVE_CATALOG ''ALL_CUBE_AGGSPECS_OPERATORS'' ''ALL''',
                       'MEASURE AWOWNER FROM SYS.AWMD!OWNER
                        MEASURE AWNAME FROM SYS.AWMD!AWNAME
                        MEASURE AWOBJECT FROM SYS.AWMD!CUBE_NAME
                        MEASURE COL1 FROM SYS.AWMD!AGGSPEC_NAME
                        MEASURE COL2 FROM SYS.AWMD!DIMENSION_NAME
                        MEASURE COL3 FROM SYS.AWMD!OPERATOR
                        DIMENSION AWMDKEY FROM SYS.AWMD!AWMDKEY'
                        )
                        AS olapsys.ALL_OLAP2_AW_METADATA_T)) AW;

