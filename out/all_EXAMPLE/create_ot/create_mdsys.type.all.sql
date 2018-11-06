CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_POINT_TYPE"

    AS OBJECT (
       X       NUMBER,
       Y       NUMBER,
       Z       NUMBER)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_ORDINATE_ARRAY"

AS VARRAY(1048576) OF NUMBER
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_ELEM_INFO_ARRAY"

AS VARRAY (1048576) of NUMBER
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_DIM_ELEMENT"

AS OBJECT (
          SDO_DIMNAME     VARCHAR(64),
          SDO_LB          NUMBER,
          SDO_UB          NUMBER,
          SDO_TOLERANCE   NUMBER )
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_VPOINT_TYPE"

AS VARRAY(64) OF NUMBER
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_ROWIDPAIR"
AS OBJECT (
        rowid1 varchar2(24),
        rowid2 varchar2(24))
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NUMBER_ARRAY"

AS VARRAY(1048576) OF NUMBER
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_STRING_ARRAY"

AS VARRAY(1048576) OF VARCHAR2(32)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_STRING2_ARRAY"

AS VARRAY(2147483647) OF VARCHAR2(4096)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_KEYWORDARRAY"

as VARRAY(10000) of VARCHAR2(9000)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_RANGE"

AS OBJECT (lb NUMBER, ub NUMBER)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_DOUBLE_PRECISION_ARRAY"

AS VARRAY(1048576) OF DOUBLE PRECISION
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_SRID_CHAIN"
   AS VARRAY(1048576) OF NUMBER
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_SRID_LIST"
   AS VARRAY(1048576) OF NUMBER
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_TFM_CHAIN"
   AS VARRAY(1048576) OF NUMBER
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_TRANSIENT_RULE"
     AS OBJECT (
       SOURCE_SRID NUMBER,
       TARGET_SRID NUMBER,
       TFM         NUMBER)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."EPSG_PARAM"
AS OBJECT (
  id  NUMBER,
  val NUMBER,
  uom NUMBER);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_TOPO_GEOMETRY_LAYER"

as object (
  OWNER        varchar2(64),
  Table_Name   varchar2(64),
  Column_Name  varchar2(32),
  Layer_id     number,
  Layer_Type   VARCHAR2(10),
  Layer_Level  number,
  Child_Layer_id number)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_LIST_TYPE"

as VARRAY (2147483647) of Number
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_TOPO_OBJECT"
as Object (topo_id number, topo_type number)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_TOPO_NSTD_TBL"

AS TABLE OF NUMBER
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_TGL_OBJECT"
as Object (tgl_id number, tg_id number)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."F81_INDEX_OBJECT" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
d
4e 85
ZWUadRLrQvBrxvqwEBWjnjobioMwg5n0dLhcuAN8X/7Sx1Lw4/6/m8Ayy8y4dCupwiFTrEzk
hpBzTHGUrHZqKl9ZLioy3eavqEqoa6+eOEo1/xxKNWCrQOzsPHSmYli2sw==
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."V81_INDEX_OBJECT" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
d
64 89
KXdN7gcGljXRAZGUJCLju8OaEBIwg5n0dLhc5wN8X/7Sx1Lw4/6/m8Ayy8y4dCupwiFTrEzk
hpBzTHGUrHZqKl9ZLioy3ea8SvNUotaEdoTm1pQVdtZuAHbWXyF0Kio7iKY+iYjD
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."H81_INDEX_OBJECT" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
d
7c 96
hHM88OECsBqvYYpWLWJxIXhsWYkwg5n0dLhcpUt8X/7Sx1Lw4/6/m8Ayy8y4dCupwiFTrEzk
hlXW5IQdbnNMcZSsdmoqX1kuKjLdBlRGz6TvS+M5B1dARjnVRq05rRJXOYjeBCcno4Kmpu53
LHA=
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."VERTEX_TYPE" as object
(X  number,
 Y  number,
 Z  number,
 W  number,
 v5 number,
 v6 number,
 v7 number,
 v8 number,
 v9 number,
 v10 number,
 v11 number,
 ID number,
 Constructor
 Function vertex_type(x  In number,
                     y  In number,
                     id In number)
 Return Self As Result,
Constructor
Function vertex_type(x In number,
                     y In number,
                     z In number,
                     w in number)
Return Self As Result,
Constructor
Function vertex_type(x In number,
                     y In number,
                     z In number,
                     w in number,
                     id in number)
Return Self As Result );
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."MBRCOORDLIST" AS VARRAY(100000) OF NUMBER;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NUMTAB" AS TABLE OF NUMBER;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_STAT" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
d
3d 69
c/lbb5uA+dlnpUpbm4c/amq5lWwwg5n0dLhcFtz60JbRoVbMuHQrpb+bwDLLzFClxyulmYEy
wLIlzLh0wDJGx+TkDlku9jmmSboviQ==
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDORIDLIST" as varray(1048576) of varchar2(24)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDORIDTAB" as table of varchar2(24)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDORIDTABLE" AS TABLE of VARCHAR2(24);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."Coordinate586_COLL" AS VARRAY(2147483647) OF VARCHAR2(4000 CHAR)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOR_METADATA"

AS OBJECT
(
   metaType     VARCHAR2(1024),
   metadata     SYS.XMLType)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOR_BLK_RANGE" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
d
89 81
LG9kPBvkjdG2eTc/81MEmJzkeHUwg5n0dLhcFtz60K6u15YYrpf6SpbyRwyuXLh0K6W/m8Ay
y7OPCaasykkkhEQWpZmBMsCyJcypoQQ4jbjUY2qIhAfhnOgqHaYApRyj
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOR_MOSAIC_0" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
d
1bc e3
/p3sKB05ygAUu7gMpFpTksi5pNIwgzLX154VfC82cHIQGABhj6iB/D6qcKK3wjFvekTMPgBa
3bwkFqw38r/iLIKEnP8Vz3Lez13qI4s6e1XxpoioTYw9NjJET1cdbLwk1W26zuGrxXxad1v0
mEWUUTpCGiVMb0QDTa1pdnDZLlIOV32uRnYRy3eSBxw8JObGbvhwFPpdNDodhmZi/Wkq+Nf9
++wrOg==
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."VECTOR_2D" as OBJECT ( x NUMBER, y NUMBER);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."NUM_ARRAY" as VARRAY(100) of NUMBER;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."STRING_ARRAY" AS VARRAY(1048576) OF VARCHAR2(256);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."NDM_VECTOR_2D" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
d
34 65
/mcSmEoB5pm1hTGqmFIghjBEYm0wg5n0dLhchQz68JYMLtH6lhh48sy4dCulv5vAMsvMUGnj
aaWZgTLAsiXM40bCITuIpuV/y2Q=
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NET_UPD_HIST"
    AS OBJECT (id             NUMBER,
               link_level     NUMBER,
               partition_id   NUMBER,
               operation      VARCHAR2(3))
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NET_UPD_HIST_N"
    AS OBJECT (id             NUMBER,
               link_level     NUMBER,
               partition_id   NUMBER,
               assigned_partition_id NUMBER,
               operation      VARCHAR2(3))
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NET_LINK"
    AS OBJECT (link_id             NUMBER,
               start_node_id       NUMBER,
               end_node_id         NUMBER,
               operation           VARCHAR2(3))
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NET_OP"
    AS OBJECT (id             NUMBER,
               operation      VARCHAR2(3))
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NET_FEAT_ELEM" AS OBJECT
    (
      feat_elem_type   NUMBER,
      net_elem_id      NUMBER,
      start_percentage NUMBER,
      end_percentage   NUMBER
    )
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NET_LAYER_FEAT" AS OBJECT
    (
      feature_layer_id NUMBER,
      feature_id       NUMBER
    )
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."OPENLS_ORDINATES" AS VARRAY(1048576) OF VARCHAR2(64);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."STRINGLIST" is varray(1000000) of varchar2(4000)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ROWPOINTERLIST" is table of varchar2(4000)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."WFSCOMPLEXTYPE" as object ( ns varchar2(30), name varchar2(30))
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDONUMLIST" is table of number
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOMETRY" AS OBJECT (
           SDO_GTYPE       NUMBER,
           SDO_SRID        NUMBER,
           SDO_POINT       SDO_POINT_TYPE,
           SDO_ELEM_INFO   SDO_ELEM_INFO_ARRAY,
           SDO_ORDINATES   SDO_ORDINATE_ARRAY,
           MEMBER FUNCTION  GET_GTYPE
           RETURN NUMBER DETERMINISTIC,
           MEMBER FUNCTION  GET_DIMS
           RETURN NUMBER DETERMINISTIC,
           MEMBER FUNCTION  GET_LRS_DIM
           RETURN NUMBER DETERMINISTIC)

  ALTER TYPE "MDSYS"."SDO_GEOMETRY"
  ADD MEMBER FUNCTION GET_WKB RETURN BLOB DETERMINISTIC,
  ADD MEMBER FUNCTION GET_WKT RETURN CLOB DETERMINISTIC,
  ADD MEMBER FUNCTION ST_CoordDim RETURN SMALLINT DETERMINISTIC,
  ADD MEMBER FUNCTION ST_IsValid RETURN INTEGER DETERMINISTIC,
  ADD CONSTRUCTOR FUNCTION SDO_GEOMETRY(wkt IN CLOB,
            srid IN INTEGER DEFAULT NULL) RETURN SELF AS RESULT,
  ADD CONSTRUCTOR FUNCTION SDO_GEOMETRY(wkt IN VARCHAR2,
            srid IN INTEGER DEFAULT NULL) RETURN SELF AS RESULT,
  ADD CONSTRUCTOR FUNCTION SDO_GEOMETRY(wkb IN BLOB,
            srid IN INTEGER DEFAULT NULL) RETURN SELF AS RESULT
  CASCADE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_DIM_ARRAY"

AS VARRAY(4) OF SDO_DIM_ELEMENT
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_MBR"

AS OBJECT (
        LOWER_LEFT MDSYS.SDO_VPOINT_TYPE,
        UPPER_RIGHT MDSYS.SDO_VPOINT_TYPE)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_ROWIDSET"
AS TABLE OF SDO_ROWIDPAIR
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_STRING2_ARRAYSET"

AS VARRAY(2147483647) OF SDO_STRING2_ARRAY
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEO_ADDR"

as object ( id                  NUMBER,
            addresslines        SDO_KEYWORDARRAY,
            placeName           VARCHAR2(200),
            streetName          VARCHAR2(200),
            intersectStreet     VARCHAR2(200),
            secUnit             VARCHAR2(200),
            settlement          VARCHAR2(200),
            municipality        VARCHAR2(200),
            region              VARCHAR2(200),
            country             VARCHAR2(100),
            postalCode          VARCHAR2(20),
            postalAddonCode     VARCHAR2(20),
            fullPostalCode      VARCHAR2(40),
            poBox               VARCHAR2(100),
            houseNumber         VARCHAR2(100),
            baseName            VARCHAR2(200),
            streetType          VARCHAR2(20),
            streetTypeBefore    VARCHAR2(1),
            streetTypeAttached  VARCHAR2(1),
            streetPrefix        VARCHAR2(20),
            streetSuffix        VARCHAR2(20),
            side                VARCHAR2(1),
            percent             NUMBER,
            edgeId              NUMBER,
            errorMessage        VARCHAR2(20),
            matchcode           NUMBER,
            matchmode           VARCHAR2(30),
            longitude           NUMBER,
            latitude            NUMBER,
  CONSTRUCTOR FUNCTION SDO_GEO_ADDR RETURN SELF AS RESULT DETERMINISTIC,
  CONSTRUCTOR FUNCTION SDO_GEO_ADDR(country VARCHAR2, lines SDO_KEYWORDARRAY,
   matchmode VARCHAR2) RETURN SELF AS RESULT DETERMINISTIC,
  CONSTRUCTOR FUNCTION SDO_GEO_ADDR(country VARCHAR2, matchmode VARCHAR2,
    street VARCHAR2, settlement VARCHAR2, municipality VARCHAR2,
   region VARCHAR2, postalcode VARCHAR2) RETURN SELF AS RESULT DETERMINISTIC)
 alter type "MDSYS"."SDO_GEO_ADDR" add attribute(matchVector VARCHAR2(20)) cascade
 alter type "MDSYS"."SDO_GEO_ADDR" add attribute(srid NUMBER) cascade
  alter type "MDSYS"."SDO_GEO_ADDR" add Constructor
  FUNCTION SDO_GEO_ADDR( id                  NUMBER,
 addresslines        SDO_KEYWORDARRAY, placeName           VARCHAR2,
 streetName          VARCHAR2, intersectStreet     VARCHAR2,
 secUnit             VARCHAR2, settlement          VARCHAR2,
 municipality        VARCHAR2, region              VARCHAR2,
 country             VARCHAR2, postalCode          VARCHAR2,
 postalAddonCode     VARCHAR2, fullPostalCode      VARCHAR2,
 poBox               VARCHAR2, houseNumber         VARCHAR2,
 baseName            VARCHAR2, streetType          VARCHAR2,
 streetTypeBefore    VARCHAR2,
 streetTypeAttached  VARCHAR2, streetPrefix        VARCHAR2,
 streetSuffix        VARCHAR2, side                VARCHAR2,
 percent             NUMBER, edgeId              NUMBER,
 errorMessage        VARCHAR2, matchcode           NUMBER,
 matchmode VARCHAR2, longitude  NUMBER, latitude   NUMBER)
  RETURN SELF as RESULT DETERMINISTIC CASCADE
  alter type "MDSYS"."SDO_GEO_ADDR" add Constructor
  FUNCTION SDO_GEO_ADDR( id                  NUMBER,
 addresslines        SDO_KEYWORDARRAY, placeName           VARCHAR2,
 streetName          VARCHAR2, intersectStreet     VARCHAR2,
 secUnit             VARCHAR2, settlement          VARCHAR2,
 municipality        VARCHAR2, region              VARCHAR2,
 country             VARCHAR2, postalCode          VARCHAR2,
 postalAddonCode     VARCHAR2, fullPostalCode      VARCHAR2,
 poBox               VARCHAR2, houseNumber         VARCHAR2,
 baseName            VARCHAR2, streetType          VARCHAR2,
 streetTypeBefore    VARCHAR2,
 streetTypeAttached  VARCHAR2, streetPrefix        VARCHAR2,
 streetSuffix        VARCHAR2, side                VARCHAR2,
 percent             NUMBER, edgeId              NUMBER,
 errorMessage        VARCHAR2, matchcode           NUMBER,
 matchmode VARCHAR2, longitude  NUMBER, latitude   NUMBER,
 matchVector VARCHAR2)
  RETURN SELF as RESULT DETERMINISTIC CASCADE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_RANGE_ARRAY"

AS VARRAY(1048576) OF SDO_RANGE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_TRANSIENT_RULE_SET"
   AS VARRAY(1048576) OF SDO_TRANSIENT_RULE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."TFM_PLAN"
AS OBJECT (
  THE_PLAN SDO_TFM_CHAIN,

  CONSTRUCTOR FUNCTION TFM_PLAN
      RETURN SELF AS RESULT,

  CONSTRUCTOR FUNCTION TFM_PLAN(
    source_srid NUMBER)
      RETURN SELF AS RESULT,

  MEMBER PROCEDURE ADD_STEP(
    srid_source  NUMBER,
    tfm         NUMBER,
    srid_target  NUMBER),

  MEMBER FUNCTION GET_NUM_STEPS
      RETURN NUMBER,

  MEMBER FUNCTION GET_STEP(
    num           IN NUMBER,
    source_srid   OUT NUMBER,
    target_srid   OUT NUMBER) RETURN NUMBER,

  MEMBER FUNCTION expand_concat_chain_element(
    source_srid   IN NUMBER,
    chain_element IN NUMBER,
    target_srid   IN NUMBER)
      RETURN TFM_PLAN,

  MEMBER PROCEDURE expand_for_chain_element_core(
    srid_source  IN NUMBER,
    chain_element IN NUMBER,
    srid_target  IN NUMBER),

  MEMBER PROCEDURE expand_inv_chain_element_core(
    srid_source  IN NUMBER,
    chain_element IN NUMBER,
    srid_target  IN NUMBER),

  MEMBER PROCEDURE expand_chain_element_core(
    srid_source  IN NUMBER,
    chain_element IN NUMBER,
    srid_target  IN NUMBER),

  MEMBER FUNCTION expand_concat_chain_elements
      RETURN TFM_PLAN
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."EPSG_PARAMS"
AS VARRAY(1048576) OF MDSYS.epsg_param;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_TOPO_GEOMETRY_LAYER_ARRAY"

as VARRAY (1000) of SDO_Topo_Geometry_Layer
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_TOPO_GEOMETRY_LAYER_TABLE"

as table of MDSYS.SDO_Topo_Geometry_Layer
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_EDGE_ARRAY"
as VARRAY(1000000) of SDO_NUMBER_ARRAY
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_TOPO_OBJECT_ARRAY"

 as VARRAY (1000000) of SDO_TOPO_OBJECT
  Alter type "MDSYS"."SDO_TOPO_OBJECT_ARRAY" modify limit 10000000
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_TGL_OBJECT_ARRAY"

 as VARRAY (1000000) of SDO_TGL_OBJECT
  alter type "MDSYS"."SDO_TGL_OBJECT_ARRAY" modify limit 10000000 cascade
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."F81_INDEX_OBJ_ARRAY" as VARRAY (1000000) of F81_index_object;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."F81_NT_IND_TYPE" as table of F81_index_object;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."V81_INDEX_OBJ_ARRAY" as VARRAY (1000000) of V81_index_object;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."V81_NT_IND_TYPE" as table of V81_index_object;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."H81_INDEX_OBJ_ARRAY" as VARRAY (1000000) of H81_index_object;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."H81_NT_IND_TYPE" as table of H81_index_object;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."VERTEX_SET_TYPE" as TABLE of vertex_type;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_STATTAB" AS TABLE OF sdo_stat;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."UnitOfMeasureType581_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","UnitOfMeasureType" "XDB"."XDB$ENUM_T","UnitOfMeasureId" NUMBER(20),"UnitOfMeasureFactor" NUMBER)NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."CoordinatesType585_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","Coordinate" "Coordinate586_COLL")NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ParentType589_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","HierarchyType" VARCHAR2(4000 CHAR),"ParentNode" VARCHAR2(4000 CHAR))NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."GridApplicationType591_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","sourceCrs" NUMBER(20),"Transformation" NUMBER(20),"targetCrs" NUMBER(20))NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOR_HISTOGRAM"

AS OBJECT
(
   cellValue     SDO_NUMBER_ARRAY,
   count         SDO_NUMBER_ARRAY)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOR_GRAYSCALE"

AS OBJECT
(
   cellValue     SDO_NUMBER_ARRAY,
   gray          SDO_NUMBER_ARRAY)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOR_COLORMAP"

AS OBJECT
(
   cellValue     SDO_NUMBER_ARRAY,
   red           SDO_NUMBER_ARRAY,
   green         SDO_NUMBER_ARRAY,
   blue          SDO_NUMBER_ARRAY,
   alpha         SDO_NUMBER_ARRAY)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOR_GCP"

AS OBJECT
(
   pointID            VARCHAR2(32),
   description        VARCHAR2(256),
  -- can not use binary_integer
   pointType          NUMBER,
   cellDimension      NUMBER,
   cellCoordinates    SDO_NUMBER_ARRAY,
   modelDimension     NUMBER,
   modelCoordinates   SDO_NUMBER_ARRAY,
   accuracy           SDO_NUMBER_ARRAY,
   status             NUMBER,

   CONSTRUCTOR FUNCTION SDO_GEOR_GCP(SELF IN OUT NOCOPY SDO_GEOR_GCP)
     RETURN SELF AS RESULT
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOR_BLK_RANGETAB" AS TABLE OF sdo_geor_blk_range;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOR_MOSAIC_TAB0" as TABLE OF sdo_geor_mosaic_0;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NET_UPD_HIST_TBL" IS TABLE OF SDO_NET_UPD_HIST
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NET_UPD_HIST_NTBL" IS TABLE OF SDO_NET_UPD_HIST_N
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NET_LINK_NTBL" IS TABLE OF SDO_NET_LINK
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NET_OP_NTBL" IS TABLE OF SDO_NET_OP
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NET_FEAT_ELEM_ARRAY" AS VARRAY(1024) OF SDO_NET_FEAT_ELEM
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NET_LAYER_FEAT_ARRAY" AS VARRAY(1024) OF SDO_NET_LAYER_FEAT
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NETWORK_MANAGER_T"
  AUTHID current_user
AS OBJECT(
  object_id INTEGER,

  NOT INSTANTIABLE MEMBER FUNCTION all_paths(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    goal_node_id    NUMBER,
    depth_limit     NUMBER,
    cost_limit      NUMBER,
    no_of_solutions NUMBER,
    constraint      VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION find_connected_components(
    net_mem   VARCHAR2
  ) RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION find_reachable_nodes(
    net_mem          VARCHAR2,
    source_node_id   NUMBER,
    constraint       VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION find_reaching_nodes(
    net_mem VARCHAR2, target_node_id NUMBER, constraint VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  -- parameter lists
  --   constraint: the name of the Network Constraint.  Set to NULL if no
  --               constraint is desired.
  NOT INSTANTIABLE MEMBER FUNCTION is_reachable(
    net_mem          VARCHAR2,
    source_node_id   NUMBER,
    target_node_id   NUMBER,
    constraint       VARCHAR2 := NULL
  )
  RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION mcst_link(
    net_mem   VARCHAR2
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  NOT INSTANTIABLE MEMBER FUNCTION nearest_neighbors(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    no_of_neighbors NUMBER,
    constraint      VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION shortest_path(
    net_mem       VARCHAR2,
    start_node_id NUMBER,
    goal_node_id  NUMBER,
    constraint    VARCHAR2 := NULL
  ) RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION shortest_path_dijkstra(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    goal_node_id    NUMBER,
    constraint      VARCHAR2 := NULL
  ) RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION tsp_path(
    net_mem          VARCHAR2,
    nd_array         SDO_NUMBER_ARRAY,
    is_closed        VARCHAR2,
    use_exact_cost   VARCHAR2,
    constraint       VARCHAR2 := NULL
  ) RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION within_cost(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    cost_limit      NUMBER,
    constraint      VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION list_networks RETURN VARCHAR2 DETERMINISTIC,


  NOT INSTANTIABLE MEMBER PROCEDURE create_logical_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,   is_directed           VARCHAR2,
    node_table_name VARCHAR2,        node_cost_column      VARCHAR2,
    link_table_name VARCHAR2,        link_cost_column      VARCHAR2,
    path_table_name VARCHAR2,        path_link_table_name  VARCHAR2,
    is_complex VARCHAR2
  ),

  NOT INSTANTIABLE MEMBER PROCEDURE create_lrs_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2,  srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_cost_column VARCHAR2,
    link_table_name VARCHAR2, link_cost_column VARCHAR2,
    lrs_table_name  VARCHAR2, lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE create_sdo_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_geom_column VARCHAR2,
    node_cost_column VARCHAR2, link_table_name VARCHAR2,
    link_geom_column VARCHAR2, link_cost_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE read_network(
    net_mem        VARCHAR2,
    allow_updates  VARCHAR2
  ),

  NOT INSTANTIABLE MEMBER PROCEDURE write_network(net_mem VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE drop_network(net_mem VARCHAR2),

  --- register given network constraint into user_sdo_network_constraints
  --- directory_name must be the name of a valid Oracle directory object
  --- class_name should be given without suffix ".class"
  --- Deprecated. Use SDO_NET.REGISTER_CONSTRAINT instead.
  NOT INSTANTIABLE MEMBER PROCEDURE register_constraint(
    constraint_name VARCHAR2, class_name  VARCHAR2,
    directory_name VARCHAR2,  description VARCHAR2),

  --- deregister given constraint from user_sdo_network_constraints
  --- Deprecated. Use SDO_NET.DEREGISTER_CONSTRAINT instead.
  NOT INSTANTIABLE MEMBER PROCEDURE deregister_constraint(
    constraint_name  VARCHAR2),

  NOT INSTANTIABLE MEMBER FUNCTION validate_network_schema(network VARCHAR2)
      RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER PROCEDURE create_ref_constraints(network VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE enable_ref_constraints(network VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE disable_ref_constraints(network VARCHAR2)

) NOT INSTANTIABLE NOT FINAL
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_T" ADD
   NOT INSTANTIABLE MEMBER FUNCTION is_versioned_wm(net_mem IN VARCHAR2)
      RETURN BOOLEAN DETERMINISTIC CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_T" ADD
   NOT INSTANTIABLE MEMBER PROCEDURE enable_versioning_wm(net_mem IN VARCHAR2) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_T" ADD
   NOT INSTANTIABLE MEMBER PROCEDURE disable_versioning_wm(net_mem IN VARCHAR2) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_T" ADD
   NOT INSTANTIABLE MEMBER FUNCTION lock_rows_wm(net_mem IN VARCHAR2,
    wspace_name IN VARCHAR2, sql_node_filter IN VARCHAR2 DEFAULT NULL,
    sql_link_filter IN VARCHAR2 DEFAULT NULL,
    sql_path_filter IN VARCHAR2 DEFAULT NULL)
    RETURN NUMBER DETERMINISTIC CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_T" ADD
   NOT INSTANTIABLE MEMBER PROCEDURE unlock_rows_wm(net_mem IN VARCHAR2,
    wspace_name IN VARCHAR2, lock_id IN NUMBER) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_T" ADD
       NOT INSTANTIABLE MEMBER PROCEDURE read_network(
         net_mem        VARCHAR2,
         network         VARCHAR2,
         xmin           NUMBER,
         ymin           NUMBER,
         xmax           NUMBER,
         ymax           NUMBER,
         allow_updates  VARCHAR2) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_T" DROP
   NOT INSTANTIABLE MEMBER PROCEDURE create_sdo_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_geom_column VARCHAR2,
    node_cost_column VARCHAR2, link_table_name VARCHAR2,
    link_geom_column VARCHAR2, link_cost_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_T" ADD
   NOT INSTANTIABLE MEMBER PROCEDURE create_sdo_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2 DEFAULT NULL,
    node_geom_column VARCHAR2 DEFAULT NULL,
    node_cost_column VARCHAR2 DEFAULT NULL,
    link_table_name VARCHAR2  DEFAULT NULL,
    link_geom_column VARCHAR2 DEFAULT NULL,
    link_cost_column VARCHAR2 DEFAULT NULL,
    path_table_name  VARCHAR2 DEFAULT NULL,
    path_geom_column VARCHAR2 DEFAULT NULL,
    path_link_table_name VARCHAR2 DEFAULT NULL,
    sub_path_table_name VARCHAR2 DEFAULT NULL,
    sub_path_geom_column VARCHAR2 DEFAULT NULL,
    is_complex VARCHAR2 DEFAULT 'FALSE') CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_T" DROP
   NOT INSTANTIABLE MEMBER PROCEDURE create_lrs_network(
    network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER,
    node_table_name VARCHAR2, node_cost_column VARCHAR2,
    link_table_name VARCHAR2, link_cost_column VARCHAR2,
    lrs_table_name  VARCHAR2, lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2
   ) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_T" ADD
   NOT INSTANTIABLE MEMBER PROCEDURE create_lrs_network(
    network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2,
    srid NUMBER, no_of_dims NUMBER,
    node_table_name VARCHAR2 DEFAULT NULL,
    node_cost_column VARCHAR2 DEFAULT NULL,
    link_table_name VARCHAR2 DEFAULT NULL,
    link_cost_column VARCHAR2 DEFAULT NULL,
    lrs_table_name  VARCHAR2,
    lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2 DEFAULT NULL,
    path_geom_column VARCHAR2 DEFAULT NULL,
    path_link_table_name VARCHAR2 DEFAULT NULL,
    sub_path_table_name VARCHAR2 DEFAULT NULL,
    sub_path_geom_column VARCHAR2 DEFAULT NULL,
    is_complex VARCHAR2 DEFAULT 'FALSE'
   ) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_T" DROP
   NOT INSTANTIABLE MEMBER PROCEDURE create_logical_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,   is_directed           VARCHAR2,
    node_table_name VARCHAR2,        node_cost_column      VARCHAR2,
    link_table_name VARCHAR2,        link_cost_column      VARCHAR2,
    path_table_name VARCHAR2,        path_link_table_name  VARCHAR2,
    is_complex VARCHAR2
  ) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_T" ADD
   NOT INSTANTIABLE MEMBER PROCEDURE create_logical_network(
    network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2,
    node_table_name VARCHAR2 DEFAULT NULL,
    node_cost_column VARCHAR2 DEFAULT NULL,
    link_table_name VARCHAR2 DEFAULT NULL,
    link_cost_column VARCHAR2 DEFAULT NULL,
    path_table_name VARCHAR2 DEFAULT NULL,
    path_link_table_name VARCHAR2 DEFAULT NULL,
    sub_path_table_name VARCHAR2 DEFAULT NULL,
    is_complex VARCHAR2 DEFAULT 'FALSE'
   ) CASCADE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."STRINGLISTLIST" as varray(1000000) OF StringList
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_SMPL_GEOMETRY"

AS OBJECT (
        orig_area number,
        cur_area number,
        orig_len number,
        cur_len number,
        geometry mdsys.sdo_geometry)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_REGION"

AS OBJECT (
        id number,
        geometry mdsys.sdo_geometry)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_REGAGGR"
AS OBJECT (
        region_id varchar2(24),
        geometry mdsys.sdo_geometry,
        aggregate_value number)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_ADDR_ARRAY" as VARRAY(1000) of SDO_GEO_ADDR
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOMETRY_ARRAY"

     AS VARRAY(10485760) OF SDO_GEOMETRY
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_GEOMETRY"
                                         AS OBJECT (
  GEOM SDO_GEOMETRY,
  MEMBER FUNCTION GET_SDO_GEOM RETURN SDO_GEOMETRY DETERMINISTIC,
  MEMBER FUNCTION GET_WKB RETURN BLOB DETERMINISTIC,
  MEMBER FUNCTION GET_WKT RETURN CLOB DETERMINISTIC,
  MEMBER FUNCTION ST_CoordDim RETURN SMALLINT DETERMINISTIC,
  MEMBER FUNCTION ST_IsValid RETURN INTEGER DETERMINISTIC,
  MEMBER FUNCTION ST_SRID RETURN INTEGER,
  MEMBER FUNCTION ST_SRID(asrid INTEGER) RETURN ST_Geometry,
  STATIC FUNCTION FROM_WKT(wkt CLOB) RETURN ST_GEOMETRY DETERMINISTIC,
  STATIC FUNCTION FROM_WKT(wkt VARCHAR2) RETURN ST_GEOMETRY DETERMINISTIC,
  STATIC FUNCTION FROM_WKB(wkb BLOB) RETURN ST_GEOMETRY DETERMINISTIC,
  STATIC FUNCTION FROM_WKT(wkt CLOB, asrid INTEGER)
            RETURN ST_GEOMETRY DETERMINISTIC,
  STATIC FUNCTION FROM_WKT(wkt VARCHAR2, asrid INTEGER)
            RETURN ST_GEOMETRY DETERMINISTIC,
  STATIC FUNCTION FROM_WKB(wkb BLOB, asrid INTEGER)
            RETURN ST_GEOMETRY DETERMINISTIC,
  STATIC FUNCTION FROM_SDO_GEOM(ageometry SDO_GEOMETRY)
            RETURN ST_GEOMETRY DETERMINISTIC) NOT FINAL

  ALTER TYPE "MDSYS"."ST_GEOMETRY" ADD
  MEMBER FUNCTION ST_IsEmpty RETURN Integer DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Envelope RETURN ST_Geometry DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Boundary RETURN ST_GEOMETRY DETERMINISTIC,
  ADD MEMBER FUNCTION ST_GeometryType RETURN VARCHAR2 DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Buffer(d NUMBER) RETURN ST_Geometry DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Equals(g2 ST_Geometry) RETURN Integer DETERMINISTIC,
  ADD MEMBER FUNCTION ST_SymmetricDifference(g2 ST_Geometry)
              RETURN ST_Geometry DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Distance(g2 ST_Geometry) RETURN NUMBER DETERMINISTIC,
  ADD MEMBER FUNCTION ST_IsSimple RETURN Integer DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Intersects(g2 ST_Geometry)
        RETURN Integer DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Relate(g2 ST_Geometry, PatternMatrix VARCHAR2)
              RETURN Integer DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Dimension RETURN Integer DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Cross(g2 ST_Geometry) RETURN Integer DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Disjoint(g2 ST_Geometry) RETURN Integer DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Touch(g2 ST_Geometry) RETURN Integer DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Within(g2 ST_Geometry) RETURN Integer DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Overlap(g2 ST_Geometry) RETURN Integer DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Contains(g2 ST_Geometry) RETURN Integer DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Intersection(g2 ST_Geometry)
            RETURN ST_Geometry DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Difference(g2 ST_Geometry)
             RETURN ST_Geometry DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Union(g2 ST_Geometry) RETURN ST_Geometry DETERMINISTIC,
  ADD MEMBER FUNCTION ST_ConvexHull RETURN ST_Geometry DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Centroid RETURN ST_Geometry DETERMINISTIC
    CASCADE

  ALTER TYPE "MDSYS"."ST_GEOMETRY"
ADD MEMBER FUNCTION ST_SymDifference(g2 ST_Geometry)
              RETURN ST_Geometry DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Touches(g2 ST_Geometry) RETURN Integer DETERMINISTIC,
  ADD MEMBER FUNCTION ST_Crosses(g2 ST_Geometry) RETURN Integer DETERMINISTIC,
  ADD MEMBER FUNCTION ST_GetTolerance RETURN NUMBER DETERMINISTIC
   CASCADE

    ALTER TYPE "MDSYS"."ST_GEOMETRY"
      ADD STATIC FUNCTION ST_AsText(ageometry ST_GEOMETRY) RETURN CLOB DETERMINISTIC,
      ADD STATIC FUNCTION ST_AsBinary(ageometry ST_GEOMETRY) RETURN BLOB DETERMINISTIC,
      ADD STATIC FUNCTION ST_GeomFromText(wkt CLOB) RETURN ST_GEOMETRY DETERMINISTIC,
      ADD STATIC FUNCTION ST_GeomFromWKB(wkb BLOB) RETURN ST_GEOMETRY DETERMINISTIC,
      ADD STATIC FUNCTION ST_GeomFromText(wkt CLOB, asrid INTEGER) RETURN ST_GEOMETRY DETERMINISTIC,
      ADD STATIC FUNCTION ST_GeomFromWKB(wkb BLOB, asrid INTEGER) RETURN ST_GEOMETRY DETERMINISTIC
      CASCADE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_TOPO_GEOMETRY"

AUTHID current_user as Object
  (TG_Type  NUMBER,
   TG_ID NUMBER,
   TG_Layer_ID NUMBER,
   Topology_ID   NUMBER,
   Constructor Function SDO_Topo_Geometry(TG_Type number,
                                    TG_id NUMBER,
                                    TG_layer_id NUMBER,
                                    Topology_ID NUMBER)
     return SELF as RESULT DETERMINISTIC,
   Constructor Function SDO_Topo_Geometry(topology varchar2,
                                    TG_Type number,
                                    TG_layer_id NUMBER,
                                    Topo_ids SDO_TGL_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC,
   Constructor Function SDO_Topo_Geometry(topology varchar2,
                                    Table_Name  varchar2,
                                    Column_Name varchar2,
                                    TG_Type number,
                                    Topo_ids SDO_TGL_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC,
   Constructor Function SDO_Topo_Geometry(topology varchar2,
                                    TG_Type number,
                                    TG_layer_id NUMBER,
                                    add_Topo_ids SDO_TGL_OBJECT_ARRAY,
                                    delete_Topo_ids SDO_TGL_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC,
   Constructor Function SDO_Topo_Geometry(topology varchar2,
                                    Table_Name  varchar2,
                                    Column_Name varchar2,
                                    TG_Type number,
                                    add_Topo_ids SDO_TGL_OBJECT_ARRAY,
                                    delete_Topo_ids SDO_TGL_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC,

   Member Function Get_Geometry
     return SDO_GEOMETRY DETERMINISTIC )
  alter type "MDSYS"."SDO_TOPO_GEOMETRY" add
   Constructor Function SDO_Topo_Geometry(topology varchar2,
                                    TG_Type number,
                                    TG_layer_id NUMBER,
                                    Topo_ids SDO_TOPO_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC,
   add Constructor Function SDO_Topo_Geometry(topology varchar2,
                                    TG_Type number,
                                    TG_layer_id NUMBER,
                                    add_Topo_ids SDO_TOPO_OBJECT_ARRAY,
                                    delete_Topo_ids SDO_TOPO_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC,
   add Constructor Function SDO_Topo_Geometry(topology varchar2,
                                    Table_Name  varchar2,
                                    Column_Name varchar2,
                                    TG_Type number,
                                    Topo_ids SDO_TOPO_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC,
   add Constructor Function SDO_Topo_Geometry(topology varchar2,
                                    Table_Name  varchar2,
                                    Column_Name varchar2,
                                    TG_Type number,
                                    add_Topo_ids SDO_TOPO_OBJECT_ARRAY,
                                    delete_Topo_ids SDO_TOPO_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC,
 add   Member Function Get_Topo_Elements
     return SDO_TOPO_OBJECT_ARRAY DETERMINISTIC  CASCADE
  alter type "MDSYS"."SDO_TOPO_GEOMETRY" add member function Get_TGL_Objects  return SDO_TGL_OBJECT_ARRAY DETERMINISTIC CASCADE
  alter type "MDSYS"."SDO_TOPO_GEOMETRY" add   Constructor Function SDO_Topo_Geometry(tg_id number, topology varchar2,
                                    TG_Type number,
                                    TG_layer_id NUMBER,
                                    Topo_ids SDO_TOPO_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC CASCADE
  alter type "MDSYS"."SDO_TOPO_GEOMETRY" add  Constructor Function SDO_Topo_Geometry(tg_id number, topology varchar2,
                                    TG_Type number,
                                    TG_layer_id NUMBER,
                                    add_Topo_ids SDO_TOPO_OBJECT_ARRAY,
                                    delete_Topo_ids SDO_TOPO_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC CASCADE
  alter type "MDSYS"."SDO_TOPO_GEOMETRY" add  Constructor Function SDO_Topo_Geometry(tg_id number, topology varchar2,
                                    Table_Name  varchar2,
                                    Column_Name varchar2,
                                    TG_Type number,
                                    Topo_ids SDO_TOPO_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC CASCADE
  alter type "MDSYS"."SDO_TOPO_GEOMETRY" add  Constructor Function SDO_Topo_Geometry(tg_id number, topology varchar2,
                                    Table_Name  varchar2,
                                    Column_Name varchar2,
                                    TG_Type number,
                                    add_Topo_ids SDO_TOPO_OBJECT_ARRAY,
                                    delete_Topo_ids SDO_TOPO_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC CASCADE
  alter type "MDSYS"."SDO_TOPO_GEOMETRY" add  Constructor Function SDO_Topo_Geometry(tg_id number, topology varchar2,
                                    TG_Type number,
                                    TG_layer_id NUMBER,
                                    Topo_ids SDO_TGL_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC CASCADE
  alter type "MDSYS"."SDO_TOPO_GEOMETRY" add  Constructor Function SDO_Topo_Geometry(tg_id number, topology varchar2,
                                    Table_Name  varchar2,
                                    Column_Name varchar2,
                                    TG_Type number,
                                    Topo_ids SDO_TGL_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC CASCADE
  alter type "MDSYS"."SDO_TOPO_GEOMETRY" add  Constructor Function SDO_Topo_Geometry(tg_id number, topology varchar2,
                                    TG_Type number,
                                    TG_layer_id NUMBER,
                                    add_Topo_ids SDO_TGL_OBJECT_ARRAY,
                                    delete_Topo_ids SDO_TGL_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC CASCADE
  alter type "MDSYS"."SDO_TOPO_GEOMETRY" add  Constructor Function SDO_Topo_Geometry(tg_id number, topology varchar2,
                                    Table_Name  varchar2,
                                    Column_Name varchar2,
                                    TG_Type number,
                                    add_Topo_ids SDO_TGL_OBJECT_ARRAY,
                                    delete_Topo_ids SDO_TGL_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC CASCADE
  alter type "MDSYS"."SDO_TOPO_GEOMETRY" add  MAP MEMBER FUNCTION to_string RETURN VARCHAR2 CASCADE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."RTREE_INDEX_METHOD" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
d
7f3 254
uHVBUckLLxC016Gz6c1Q/4KOWy0wg+1cACCGfHTtMZ2sjB0EeI7EMgkURcw4DNHpbNcaY/u5
QPY3UYSqP954uJL7/cDI2i7fAZsAACWuNLsvQQ9BKAfSwQjupez5HIc/JACpGDQtOfUU5sY+
ORRp++SSbyofAcymNjtxJc8oGp9DZFw9B1QtPWmAsDEjWxkREtZ+pO898gsWeTv9/QTPkef4
pQO1Bu0RLIeh8IZmXVrLcX6x4QBcaHvW/jy92kAl5S1df4f4nlpKLVwaeBjixVf7WZYHmDsn
DioQDXDPJ7HD+0XNVIdBsE0rlXZc1rJlhxgmIEedZuW9lIaJ6JBR31bDKhM8dNUbvdel7NRU
ptPagh0IJqHBM01Xx+dtmZd6STcnXQeQacrW1l8H8TpLSM7XnE0qpkmasvXc7ZKWB6fwGenm
IN6A/NtGdUBVd2YgNPo4x+J+vP1Oe+a3E58XxqCY46By15lZLOzvZKydGuraHvFU/ur4+k/Q
tjMBNI1dpljUpl7nUISgV3F7mqgnke0+pDpMBLbbLxWwHlnhc0ynqO7hDG4aGv0s29hlDJQK
Hiwgw9OvRQ==
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."RTREEJOIN_IMP_T" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
d
614 1de
m6AnvBP6K6LpBd7sk1+vbHLl52Ewg823JPZqfC+V2vheaBGEFiH1HhQMF1Hbp0dVJqEbLoh7
0ihsmk/y0YkhU/DW2jy3VggZAEE/8RDQZ8b+ajhzktLTzU66eqyewsI59crmSX980xY5D2TM
DMxvpv1oHSZ5Qg9iJSxt0wprvdxtgcs0syvDVeB7yj6T2cvPL8qo2w3E0YPi0MKFtqn+dr0T
oJGumVqfHyIKud1F2JjX1tiCUwPiCOug2VLNASa7XpmhHubqhhoOkAbwXT+3/Mz3hz6j3ASR
VGb+Ta4BcEvMa40h7XlJMBrmC64R2Cusx18lKtFJV1xPMi/yDrcYJckHQgAVYNZR6mwLBZGx
zHp2OmIPsUKbOImvSvDQ+t3soMxMlC7EQQjVg5PYxwrgXft0aANGI4XStab5j/tHrD8cfSSv
AKxQpjK8zp02EsvrHZea4XNKx8wAaM+mzXpppQ==
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDOAGGRTYPE" as Object (
Geometry mdsys.sdo_geometry,
Tolerance  NUMBER)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."AGGRCONCAT" AUTHID current_user as Object
(
  context raw(4),
  static function odciaggregateinitialize(sctx IN OUT AggrConcat)
              return PLS_INTEGER,
  member function odciaggregateiterate(self IN OUT AggrConcat,
               geom IN mdsys.SDO_GEOMETRY) return PLS_INTEGER,
  member function odciaggregateterminate(self IN AggrConcat,
                                 returnValue OUT mdsys.sdo_geometry,
                                 flags IN number)
                     return PLS_INTEGER,
  member function odciaggregatemerge(self IN OUT AggrConcat,
                    sctx2 IN  AggrConcat) return PLS_INTEGER);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_ANNOTATIONTEXTELEMENT"

    AS OBJECT (
      privateValue  VARCHAR2(4000),
      privateLocation SDO_GEOMETRY,
      privateLeaderLine SDO_GEOMETRY,
      privateTextAttributes VARCHAR2(4000),
      MEMBER FUNCTION Value Return VARCHAR2,
    MEMBER FUNCTION Value(Value VARCHAR2)  RETURN ST_ANNOTATIONTEXTELEMENT,
    MEMBER FUNCTION Location Return SDO_GEOMETRY,
    MEMBER FUNCTION Location(Location SDO_GEOMETRY)
                  RETURN ST_ANNOTATIONTEXTELEMENT,
    MEMBER FUNCTION LeaderLine Return SDO_GEOMETRY,
    MEMBER FUNCTION LeaderLine(LeaderLine SDO_GEOMETRY)
         RETURN ST_ANNOTATIONTEXTELEMENT,
    MEMBER FUNCTION TextAttributes Return VARCHAR2,
    MEMBER FUNCTION TextAttributes(TextAttributes VARCHAR2)
       RETURN ST_ANNOTATIONTEXTELEMENT)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."GridNodeType584_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","Offset" "CoordinatesType585_T","OffsetPrecision" "CoordinatesType585_T")NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."GridApplication592_COLL" AS VARRAY(2147483647) OF "GridApplicationType591_T"
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."GridPropertiesType593_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","MinCoords" "CoordinatesType585_T","MaxCoords" "CoordinatesType585_T","CoordSpacing" "CoordinatesType585_T","CoordinateUnitOfMeasure" "UnitOfMeasureType581_T")NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."Parent596_COLL" AS VARRAY(2147483647) OF "ParentType589_T"
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEORASTER"

      AS OBJECT
      (
        rasterType        NUMBER,
        spatialExtent     MDSYS.SDO_GEOMETRY,
        rasterDataTable   VARCHAR2(32),
        rasterID          NUMBER,
        metadata          SYS.XMLType
      )
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_RASTER"

AS OBJECT
(
   rasterID          NUMBER,
   pyramidLevel      NUMBER,
   bandBlockNumber   NUMBER,
   rowBlockNumber    NUMBER,
   columnBlockNumber NUMBER,
   blockMBR          MDSYS.SDO_GEOMETRY,
   rasterBlock       BLOB)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOR_GCP_COLLECTION"

AS VARRAY(1048576) OF SDO_GEOR_GCP
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NETWORK_MANAGER_I"
  AUTHID current_user
  UNDER SDO_NETWORK_MANAGER_T
(
  ------------
  -- all_paths
  ------------
  STATIC FUNCTION all_paths_s(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    goal_node_id    NUMBER,
    depth_limit     NUMBER,
    cost_limit      NUMBER,
    no_of_solutions NUMBER,
    constraint      VARCHAR2
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.allPaths(
     java.lang.String,  oracle.sql.NUMBER, oracle.sql.NUMBER,
     oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER, java.lang.String)
     return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION all_paths(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    goal_node_id    NUMBER,
    depth_limit     NUMBER,
    cost_limit      NUMBER,
    no_of_solutions NUMBER,
    constraint      VARCHAR2 :=NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  ----------------------------
  -- find_connected_components
  ----------------------------
  STATIC FUNCTION find_connected_components_s(
    net_mem   VARCHAR2
  )
    RETURN NUMBER DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.findConnectedComponents(
     java.lang.String) return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION find_connected_components(
    net_mem   VARCHAR2
  )
    RETURN NUMBER DETERMINISTIC,

  -----------------------
  -- find_reachable_nodes
  -----------------------
  STATIC FUNCTION find_reachable_nodes_s(
    net_mem         VARCHAR2,
    source_node_id  NUMBER,
    constraint      VARCHAR2
  )
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.findReachableNodes(
     java.lang.String, oracle.sql.NUMBER, java.lang.String)
     return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION find_reachable_nodes(
    net_mem   VARCHAR2, source_node_id NUMBER, constraint VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  ------------------------
  -- find_reaching_nodes_s
  ------------------------
  STATIC FUNCTION find_reaching_nodes_s(
    net_mem VARCHAR2, target_node_id NUMBER, constraint VARCHAR2
  )
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.findReachingNodes(
     java.lang.String, oracle.sql.NUMBER, java.lang.String)
     return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION find_reaching_nodes(
    net_mem  VARCHAR2,  target_node_id   NUMBER, constraint VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  ---------------
  -- is_reachable
  ---------------
  STATIC FUNCTION is_reachable_s(
    net_mem          VARCHAR2,
    source_node_id   NUMBER,
    target_node_id   NUMBER,
    constraint       VARCHAR2
  )
    RETURN VARCHAR2 DETERMINISTIC
    AS LANGUAGE JAVA NAME
      'oracle.spatial.type.NetworkWrapper.isReachable(
     java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, java.lang.String)
     return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_reachable(
    net_mem          VARCHAR2,
    source_node_id   NUMBER,
    target_node_id   NUMBER,
    constraint       VARCHAR2 := NULL
  ) RETURN VARCHAR2 DETERMINISTIC,

  -------------------------------------------------------------
  -- mcst_link: Minimal Cost Spanning Tree in the form of links
  -------------------------------------------------------------
  STATIC FUNCTION mcst_link_s(
    net_mem VARCHAR2
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.mcstLinkArray(java.lang.String)
     return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION mcst_link(
    net_mem   VARCHAR2
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  --------------------
  -- nearest_meighbors
  --------------------
  STATIC FUNCTION nearest_neighbors_s(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    no_of_neighbors NUMBER,
    constraint      VARCHAR2
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.nearestNeighbors(
     java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, java.lang.String)
     return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION nearest_neighbors(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    no_of_neighbors NUMBER,
    constraint      VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  ----------------
  -- shortest_path
  ----------------
  STATIC FUNCTION shortest_path_s(net_map VARCHAR2,
    start_node_id NUMBER, goal_node_id NUMBER, constraint VARCHAR2
    ) RETURN NUMBER DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.shortestPath(
     java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, java.lang.String)
     return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION shortest_path(net_mem VARCHAR2,
      start_node_id NUMBER, goal_node_id NUMBER, constraint VARCHAR2 := NULL
    ) RETURN NUMBER DETERMINISTIC,

  -------------------------
  -- shortest_path_dijkstra
  -------------------------
  STATIC FUNCTION shortest_path_dijkstra_s(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    goal_node_id    NUMBER,
    constraint      VARCHAR2
  ) RETURN NUMBER DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.shortestPathDijkstra(
     java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, java.lang.String)
     return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION shortest_path_dijkstra(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    goal_node_id    NUMBER,
    constraint      VARCHAR2 := NULL
  ) RETURN NUMBER DETERMINISTIC,

  STATIC FUNCTION tsp_path_s(
    net_mem     VARCHAR2,  nd_array SDO_NUMBER_ARRAY,
    is_closed   VARCHAR2,  use_exact_cost   VARCHAR2, constraint VARCHAR2
  ) RETURN NUMBER DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.tspPath(
     java.lang.String, oracle.spatial.type.SdoNumberArray, java.lang.String,
     java.lang.String, java.lang.String)  return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION tsp_path(
    net_mem   VARCHAR2,  nd_array  SDO_NUMBER_ARRAY,
    is_closed VARCHAR2,  use_exact_cost   VARCHAR2, constraint VARCHAR2 := NULL
  ) RETURN NUMBER DETERMINISTIC,

  --------------
  -- within_cost
  --------------
  STATIC FUNCTION within_cost_s(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    cost_limit      NUMBER,
    constraint      VARCHAR2
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.withinCost(
     java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, java.lang.String)
     return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION within_cost(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    cost_limit      NUMBER,
    constraint      VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  STATIC PROCEDURE create_logical_network_s(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,   is_directed           VARCHAR2,
    node_table_name VARCHAR2,        node_cost_column      VARCHAR2,
    link_table_name VARCHAR2,        link_cost_column      VARCHAR2,
    path_table_name VARCHAR2,        path_link_table_name  VARCHAR2,
    is_complex VARCHAR2
  )
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.createLogicalNetwork(java.lang.String,
     oracle.sql.NUMBER, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String)',

  OVERRIDING MEMBER PROCEDURE create_logical_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,   is_directed           VARCHAR2,
    node_table_name VARCHAR2,        node_cost_column      VARCHAR2,
    link_table_name VARCHAR2,        link_cost_column      VARCHAR2,
    path_table_name VARCHAR2,        path_link_table_name  VARCHAR2,
    is_complex VARCHAR2
  ),

  STATIC PROCEDURE create_lrs_network_s(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2,  srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_cost_column VARCHAR2,
    link_table_name VARCHAR2, link_cost_column VARCHAR2,
    lrs_table_name  VARCHAR2, lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2)
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.createLRSNetwork(java.lang.String,
     oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
     oracle.sql.NUMBER, java.lang.String, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String, java.lang.String,
     java.lang.String)',

  OVERRIDING MEMBER PROCEDURE create_lrs_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2,  srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_cost_column VARCHAR2,
    link_table_name VARCHAR2, link_cost_column VARCHAR2,
    lrs_table_name  VARCHAR2, lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2),

  STATIC PROCEDURE create_sdo_network_s(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_geom_column VARCHAR2,
    node_cost_column VARCHAR2, link_table_name VARCHAR2,
    link_geom_column VARCHAR2, link_cost_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2)
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.createSDONetwork(java.lang.String,
     oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER,
     java.lang.String, java.lang.String, java.lang.String,
     java.lang.String, java.lang.String, java.lang.String,
     java.lang.String, java.lang.String, java.lang.String,
     java.lang.String)',

  OVERRIDING MEMBER PROCEDURE create_sdo_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_geom_column VARCHAR2,
    node_cost_column VARCHAR2, link_table_name VARCHAR2,
    link_geom_column VARCHAR2, link_cost_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2),

  ---------------
  -- read_network
  ---------------
  STATIC PROCEDURE read_network_s(
    net_mem  VARCHAR2,
    allow_updates VARCHAR2)
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.readMap(
     java.lang.String, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE read_network(
    net_mem   VARCHAR2,
    allow_updates  VARCHAR2
  ),


  ------------
  -- list_networks
  ------------
  STATIC FUNCTION list_networks_s RETURN VARCHAR2 DETERMINISTIC
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.listMaps()
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION list_networks
   RETURN VARCHAR2 DETERMINISTIC,

  STATIC PROCEDURE write_network_s(net_mem VARCHAR2)
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.writeMap(java.lang.String)',

  OVERRIDING MEMBER PROCEDURE write_network(net_mem VARCHAR2),


  STATIC PROCEDURE drop_network_s(net_mem VARCHAR2)
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.dropMap(java.lang.String)',

  OVERRIDING MEMBER PROCEDURE drop_network(
    net_mem VARCHAR2),

  STATIC FUNCTION validate_network_schema_s(network VARCHAR2)
    RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.validateNetworkSchema(
     java.lang.String)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION validate_network_schema(network VARCHAR2)
    RETURN VARCHAR2 DETERMINISTIC,

  STATIC PROCEDURE create_ref_constraints_s(network VARCHAR2)
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.createRefConstraints(
     java.lang.String)',

  OVERRIDING MEMBER PROCEDURE create_ref_constraints(network VARCHAR2),


  STATIC PROCEDURE enable_ref_constraints_s(network VARCHAR2)
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.enableRefConstraints(java.lang.String)',

  OVERRIDING MEMBER PROCEDURE enable_ref_constraints(network VARCHAR2),


  STATIC PROCEDURE disable_ref_constraints_s(network VARCHAR2)
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.disableRefConstraints(
     java.lang.String)',

  OVERRIDING MEMBER PROCEDURE disable_ref_constraints(network VARCHAR2),

  --- register given network constraint into user_sdo_network_constraints
  OVERRIDING MEMBER PROCEDURE register_constraint(
    constraint_name VARCHAR2, class_name VARCHAR2,
    directory_name VARCHAR2,  description VARCHAR2),

  --- deregister given constraint from user_sdo_network_constraints
  OVERRIDING MEMBER PROCEDURE deregister_constraint(constraint_name VARCHAR2),

  MEMBER FUNCTION read_constraint(constraint_name VARCHAR2)
    RETURN VARCHAR2 DETERMINISTIC

)
  ALTER TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" NOT INSTANTIABLE NOT FINAL CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  STATIC PROCEDURE get_net_tab_names(net_mem IN VARCHAR2,
    link_tab_name OUT VARCHAR2, node_tab_name OUT VARCHAR2,
    path_tab_name OUT VARCHAR2, plink_tab_name OUT VARCHAR2) CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  STATIC FUNCTION is_versioned_tab(tab_name IN VARCHAR2)
    RETURN BOOLEAN CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  STATIC FUNCTION is_versioned_s(net_mem IN VARCHAR2)
    RETURN BOOLEAN DETERMINISTIC CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  STATIC FUNCTION adjust_node_filter(tab_name IN VARCHAR2,
    sql_node_filter IN VARCHAR2, lock_id IN NUMBER)
  RETURN VARCHAR2 CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  STATIC FUNCTION adjust_link_filter(tab_name IN VARCHAR2,
    node_filter IN VARCHAR2, sql_link_filter IN VARCHAR2, lock_id IN NUMBER)
  RETURN VARCHAR2 CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  STATIC FUNCTION adjust_path_filter(path_tab IN VARCHAR2,
    plink_tab IN VARCHAR2, link_filter IN VARCHAR2,
    sql_path_filter IN VARCHAR2, lock_id IN NUMBER)
  RETURN VARCHAR2 CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  STATIC PROCEDURE register_lock(lock_id IN NUMBER, net_mem IN VARCHAR2,
    wspace_name IN VARCHAR2, original_node_filter IN VARCHAR2,
    original_link_filter IN VARCHAR2, original_path_filter IN VARCHAR2,
    adjusted_node_filter IN VARCHAR2, adjusted_link_filter IN VARCHAR2,
    adjusted_path_filter IN VARCHAR2) CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  STATIC PROCEDURE deregister_lock(lock_id IN NUMBER) CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  STATIC FUNCTION get_lock_id
    RETURN NUMBER CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  STATIC PROCEDURE get_lock_info(lock_id IN NUMBER,
    net_mem OUT VARCHAR2, wspace_name OUT VARCHAR2,
    original_node_filter OUT VARCHAR2,
    original_link_filter OUT VARCHAR2, original_path_filter OUT VARCHAR2,
    adjusted_node_filter OUT VARCHAR2, adjusted_link_filter OUT VARCHAR2,
    adjusted_path_filter OUT VARCHAR2) CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  OVERRIDING  MEMBER FUNCTION is_versioned_wm(net_mem IN VARCHAR2)
      RETURN BOOLEAN DETERMINISTIC CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  OVERRIDING  MEMBER PROCEDURE enable_versioning_wm(net_mem IN VARCHAR2) CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  OVERRIDING  MEMBER PROCEDURE disable_versioning_wm(net_mem IN VARCHAR2) CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  OVERRIDING  MEMBER FUNCTION lock_rows_wm(net_mem IN VARCHAR2,
    wspace_name IN VARCHAR2, sql_node_filter IN VARCHAR2 DEFAULT NULL,
    sql_link_filter IN VARCHAR2 DEFAULT NULL,
    sql_path_filter IN VARCHAR2 DEFAULT NULL)
    RETURN NUMBER DETERMINISTIC CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  OVERRIDING  MEMBER PROCEDURE unlock_rows_wm(net_mem IN VARCHAR2,
    wspace_name IN VARCHAR2, lock_id IN NUMBER) CASCADE
  ALTER TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" INSTANTIABLE  CASCADE
  ALTER TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" NOT INSTANTIABLE NOT FINAL CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  OVERRIDING MEMBER PROCEDURE read_network(
        net_mem         VARCHAR2,
        network         VARCHAR2,
        xmin            NUMBER,
        ymin            NUMBER,
        xmax            NUMBER,
        ymax            NUMBER,
        allow_updates   VARCHAR2) CASCADE
  ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD  STATIC PROCEDURE read_network_s(
        net_mem         VARCHAR2,
        network         VARCHAR2,
        xmin            NUMBER,
        ymin            NUMBER,
        xmax            NUMBER,
        ymax            NUMBER,
        allow_updates   VARCHAR2)
      AS LANGUAGE JAVA NAME
      'oracle.spatial.type.NetworkWrapper.readMap(
       java.lang.String, java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER,
      oracle.sql.NUMBER, oracle.sql.NUMBER, java.lang.String)' CASCADE
  ALTER TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" INSTANTIABLE  CASCADE
  ALTER TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" NOT INSTANTIABLE NOT FINAL CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" DROP
   OVERRIDING MEMBER PROCEDURE create_sdo_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_geom_column VARCHAR2,
    node_cost_column VARCHAR2, link_table_name VARCHAR2,
    link_geom_column VARCHAR2, link_cost_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD
   OVERRIDING MEMBER PROCEDURE create_sdo_network(
    network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,
    is_directed VARCHAR2,
    srid NUMBER,
    no_of_dims NUMBER,
    node_table_name VARCHAR2 DEFAULT NULL,
    node_geom_column VARCHAR2 DEFAULT NULL,
    node_cost_column VARCHAR2 DEFAULT NULL,
    link_table_name VARCHAR2  DEFAULT NULL,
    link_geom_column VARCHAR2 DEFAULT NULL,
    link_cost_column VARCHAR2 DEFAULT NULL,
    path_table_name  VARCHAR2 DEFAULT NULL,
    path_geom_column VARCHAR2 DEFAULT NULL,
    path_link_table_name VARCHAR2 DEFAULT NULL,
    sub_path_table_name VARCHAR2 DEFAULT NULL,
    sub_path_geom_column VARCHAR2 DEFAULT NULL,
    is_complex VARCHAR2 DEFAULT 'FALSE') CASCADE
 ALTER TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" DROP STATIC PROCEDURE
   create_sdo_network_s(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_geom_column VARCHAR2,
    node_cost_column VARCHAR2, link_table_name VARCHAR2,
    link_geom_column VARCHAR2, link_cost_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2) CASCADE
 ALTER TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD STATIC PROCEDURE
   create_sdo_network_s(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,
    is_directed VARCHAR2,
    srid NUMBER,
    no_of_dims NUMBER,
    node_table_name VARCHAR2, node_geom_column VARCHAR2,
    node_cost_column VARCHAR2, link_table_name VARCHAR2,
    link_geom_column VARCHAR2, link_cost_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2,
    sub_path_table_name VARCHAR2,
    sub_path_geom_column VARCHAR2,
    is_complex VARCHAR2
     ) AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.createSDONetwork(java.lang.String,
      oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
      oracle.sql.NUMBER,  java.lang.String,
      java.lang.String, java.lang.String,
      java.lang.String, java.lang.String, java.lang.String,
      java.lang.String, java.lang.String, java.lang.String,
      java.lang.String, java.lang.String, java.lang.String)'
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" DROP
   OVERRIDING MEMBER PROCEDURE create_lrs_network(
    network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER,
    node_table_name VARCHAR2, node_cost_column VARCHAR2,
    link_table_name VARCHAR2, link_cost_column VARCHAR2,
    lrs_table_name  VARCHAR2, lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD
   OVERRIDING MEMBER PROCEDURE create_lrs_network(
    network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,
    is_directed VARCHAR2,
    srid NUMBER, no_of_dims NUMBER,
    node_table_name VARCHAR2 DEFAULT NULL,
    node_cost_column VARCHAR2 DEFAULT NULL,
    link_table_name VARCHAR2 DEFAULT NULL,
    link_cost_column VARCHAR2 DEFAULT NULL,
    lrs_table_name  VARCHAR2,
    lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2 DEFAULT NULL,
    path_geom_column VARCHAR2 DEFAULT NULL,
    path_link_table_name VARCHAR2 DEFAULT NULL,
    sub_path_table_name VARCHAR2 DEFAULT NULL,
    sub_path_geom_column VARCHAR2 DEFAULT NULL,
    is_complex VARCHAR2 DEFAULT 'FALSE'
  ) CASCADE
 ALTER TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" DROP STATIC PROCEDURE
   create_lrs_network_s(
    network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2,
    srid NUMBER, no_of_dims NUMBER,
    node_table_name VARCHAR2,
    node_cost_column VARCHAR2,
    link_table_name VARCHAR2,
    link_cost_column VARCHAR2,
    lrs_table_name  VARCHAR2,
    lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2,
    path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2,
    is_complex VARCHAR2
  ) CASCADE
 ALTER TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD STATIC PROCEDURE
  create_lrs_network_s(
    network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,
    is_directed VARCHAR2,
    srid NUMBER,
    no_of_dims NUMBER,
    node_table_name VARCHAR2,
    node_cost_column VARCHAR2,
    link_table_name VARCHAR2,
    link_cost_column VARCHAR2,
    lrs_table_name  VARCHAR2,
    lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2,
    path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2,
    sub_path_table_name VARCHAR2,
    sub_path_geom_column VARCHAR2,
    is_complex VARCHAR2
     ) AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.createLRSNetwork(
      java.lang.String, oracle.sql.NUMBER, java.lang.String,
      oracle.sql.NUMBER, oracle.sql.NUMBER, java.lang.String,
      java.lang.String, java.lang.String, java.lang.String,
      java.lang.String, java.lang.String, java.lang.String,
      java.lang.String, java.lang.String, java.lang.String,
      java.lang.String, java.lang.String)'
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" DROP
   OVERRIDING MEMBER PROCEDURE create_logical_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,   is_directed           VARCHAR2,
    node_table_name VARCHAR2,        node_cost_column      VARCHAR2,
    link_table_name VARCHAR2,        link_cost_column      VARCHAR2,
    path_table_name VARCHAR2,        path_link_table_name  VARCHAR2,
    is_complex VARCHAR2
   ) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD
   OVERRIDING MEMBER PROCEDURE create_logical_network(network_name VARCHAR2,
     no_of_hierarchy_levels NUMBER,
     is_directed VARCHAR2,
     node_table_name VARCHAR2 DEFAULT NULL,
     node_cost_column VARCHAR2 DEFAULT NULL,
     link_table_name VARCHAR2 DEFAULT NULL,
     link_cost_column VARCHAR2  DEFAULT NULL,
     path_table_name VARCHAR2 DEFAULT NULL,
     path_link_table_name  VARCHAR2 DEFAULT NULL,
     sub_path_table_name VARCHAR2 DEFAULT NULL,
     is_complex VARCHAR2 DEFAULT 'FALSE'
   ) CASCADE
 ALTER TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" DROP STATIC PROCEDURE
   create_logical_network_s(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,   is_directed           VARCHAR2,
    node_table_name VARCHAR2,        node_cost_column      VARCHAR2,
    link_table_name VARCHAR2,        link_cost_column      VARCHAR2,
    path_table_name VARCHAR2,        path_link_table_name  VARCHAR2,
    is_complex VARCHAR2  )
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.createLogicalNetwork(java.lang.String,
     oracle.sql.NUMBER, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String)'
 ALTER TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD STATIC PROCEDURE
   create_logical_network_s(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,   is_directed           VARCHAR2,
    node_table_name VARCHAR2,        node_cost_column      VARCHAR2,
    link_table_name VARCHAR2,        link_cost_column      VARCHAR2,
    path_table_name VARCHAR2,        path_link_table_name  VARCHAR2,
    sub_path_table_name VARCHAR2,    is_complex VARCHAR2  )
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.createLogicalNetwork(java.lang.String,
     oracle.sql.NUMBER, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String)'
 ALTER TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" ADD STATIC FUNCTION
  get_default_value_s(
    parameter   VARCHAR2,
    default_val VARCHAR2) RETURN VARCHAR2
  ALTER TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" INSTANTIABLE  CASCADE
  ALTER TYPE "MDSYS"."SDO_NETWORK_MANAGER_I" INSTANTIABLE CASCADE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NODE_T"
  AUTHID current_user
  AS OBJECT(
  object_id INTEGER,

  NOT INSTANTIABLE MEMBER FUNCTION get_cost(
    net_mem   VARCHAR2, node_id   NUMBER
  ) RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_hierarchy_level(
   net_mem   VARCHAR2, node_id   NUMBER
  ) RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_state(
   net_mem   VARCHAR2, node_id   NUMBER
  ) RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_type(
   net_mem   VARCHAR2, node_id   NUMBER
  ) RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_name(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_partition_id(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_component_no(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_in_link_ids(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_out_link_ids(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_incident_link_ids(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_child_node_ids(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_adjacent_node_ids(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_sibling_node_ids(
    net_mem VARCHAR2, id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_geometry(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_GEOMETRY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_geom_id(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  ----------------
  -- DEPRECATED --
  ----------------
  NOT INSTANTIABLE MEMBER FUNCTION get_external_node_id(
    net_mem VARCHAR2, id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  ----------------
  -- DEPRECATED --
  ----------------
  NOT INSTANTIABLE MEMBER FUNCTION get_external_network_id(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  ----------------
  -- DEPRECATED --
  ----------------
  NOT INSTANTIABLE MEMBER FUNCTION get_external_network_name(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_parent_node_id(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_measure(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER PROCEDURE set_cost(
    net_mem VARCHAR2, node_id NUMBER, cost NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_hierarchy_level(
    net_mem VARCHAR2, node_id NUMBER,    level NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_type(
    net_mem VARCHAR2, node_id NUMBER, type VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE set_name(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE set_state(
    net_mem VARCHAR2, node_id NUMBER, state VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE set_component_no(
    net_mem VARCHAR2, node_id NUMBER,    no NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_parent_node(
    net_mem VARCHAR2, node_id NUMBER,    parent_node_id NUMBER),

  ----------------
  -- DEPRECATED --
  ----------------
  NOT INSTANTIABLE MEMBER PROCEDURE set_external_node_id(
    net_mem VARCHAR2, node_id NUMBER,    external_node_id NUMBER),

  ----------------
  -- DEPRECATED --
  ----------------
  NOT INSTANTIABLE MEMBER PROCEDURE set_external_network_id(
    net_mem VARCHAR2, node_id NUMBER,    external_network_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_geometry(
    net_mem VARCHAR2, node_id NUMBER,    geom SDO_GEOMETRY),

  NOT INSTANTIABLE MEMBER PROCEDURE set_geom_id(
    net_mem VARCHAR2, node_id NUMBER,    geom_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_measure(
    net_mem VARCHAR2, node_id NUMBER,    measure NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE make_temporary(
    net_mem VARCHAR2, node_id NUMBER),

  NOT INSTANTIABLE MEMBER FUNCTION is_temporary(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION is_active(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION is_logical(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION link_exists(
    net_mem VARCHAR2, node_id1 NUMBER, node_id2 NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  ----------------
  -- DEPRECATED --
  ----------------
  NOT INSTANTIABLE MEMBER FUNCTION is_external_node(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_in_degree(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_out_degree(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_degree(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC


) NOT INSTANTIABLE NOT FINAL
 ALTER  TYPE "MDSYS"."SDO_NODE_T" DROP
   NOT INSTANTIABLE MEMBER FUNCTION get_external_network_id(
    net_mem VARCHAR2, node_id NUMBER) RETURN NUMBER CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_T" DROP
    NOT INSTANTIABLE MEMBER PROCEDURE set_external_network_id(
    net_mem VARCHAR2, node_id NUMBER,    external_network_id NUMBER) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_T" DROP
   NOT INSTANTIABLE MEMBER FUNCTION get_external_node_id(
    net_mem VARCHAR2, id NUMBER) RETURN NUMBER CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_T" DROP
    NOT INSTANTIABLE MEMBER PROCEDURE set_external_node_id(
    net_mem VARCHAR2, node_id NUMBER,    external_node_id NUMBER) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_T" DROP
      NOT INSTANTIABLE MEMBER FUNCTION get_external_network_name(
         net_mem VARCHAR2, node_id NUMBER) RETURN VARCHAR2 CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_T" DROP
     NOT INSTANTIABLE MEMBER FUNCTION is_external_node(
     net_mem VARCHAR2, node_id NUMBER) RETURN VARCHAR2 CASCADE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_LINK_T"
  AUTHID current_user
  AS OBJECT(
  object_id INTEGER,

  NOT INSTANTIABLE MEMBER FUNCTION get_cost(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_level(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_state(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_type(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_name(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_start_node_id(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_end_node_id(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_parent_link_id(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_child_links(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_co_link_ids(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_sibling_link_ids(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_geometry(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN SDO_GEOMETRY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_geom_id(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_end_measure(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_start_measure(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER PROCEDURE make_temporary(
    net_mem VARCHAR2, link_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_cost(
    net_mem VARCHAR2, link_id NUMBER, cost NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_level(
    net_mem VARCHAR2, link_id NUMBER,    level NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_type(
    net_mem VARCHAR2, link_id NUMBER, type VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE set_name(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE set_state(
    net_mem VARCHAR2, link_id NUMBER, state VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE set_start_node(
    net_mem VARCHAR2, link_id NUMBER,    start_node_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_end_node(
    net_mem VARCHAR2, link_id NUMBER,    end_node_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_parent_link(
    net_mem VARCHAR2, link_id NUMBER,    parent_link_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_geometry(
    net_mem VARCHAR2, link_id NUMBER,    geom SDO_GEOMETRY),

  NOT INSTANTIABLE MEMBER PROCEDURE set_geom_id(
    net_mem VARCHAR2, link_id NUMBER,    geom_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_measure(
    net_mem VARCHAR2, link_id NUMBER, start_measure NUMBER, end_measure NUMBER),

  NOT INSTANTIABLE MEMBER FUNCTION is_temporary(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION is_active(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION is_logical(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  ----------------
  -- DEPRECATED --
  ----------------
  NOT INSTANTIABLE MEMBER FUNCTION is_external_link(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC

) NOT INSTANTIABLE NOT FINAL
 ALTER  TYPE "MDSYS"."SDO_LINK_T" DROP
       NOT INSTANTIABLE MEMBER FUNCTION is_external_link(
         net_mem VARCHAR2, link_id NUMBER) RETURN VARCHAR2 CASCADE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_PATH_T"
  AUTHID current_user
  AS OBJECT(

  object_id   INTEGER,

  NOT INSTANTIABLE MEMBER FUNCTION get_cost(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_no_of_links(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_type(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_name(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_start_node_id(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_end_node_id(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_geometry(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN SDO_GEOMETRY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_node_ids(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_link_ids(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER PROCEDURE set_type(
    net_mem VARCHAR2, path_id NUMBER, type VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE set_name(
    net_mem VARCHAR2, path_id NUMBER, path_name VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE set_path_id(
    net_mem VARCHAR2, path_id NUMBER, new_path_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_geometry(
    net_mem VARCHAR2, path_id NUMBER,    geom SDO_GEOMETRY),

  NOT INSTANTIABLE MEMBER FUNCTION is_closed(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION is_connected(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION is_simple(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION is_temporary(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION is_logical(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION is_active(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER PROCEDURE compute_geometry(
    net_mem VARCHAR2, path_id NUMBER,    tolerance NUMBER)
) NOT INSTANTIABLE NOT FINAL
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NETWORK_T"
  AUTHID current_user
  AS OBJECT(

  object_id  INTEGER,

  --NOT INSTANTIABLE MEMBER PROCEDURE add_node(
  --  net_mem VARCHAR2, node_id NUMBER),

  --NOT INSTANTIABLE MEMBER PROCEDURE add_node(
  --  net_mem VARCHAR2, node_id NUMBER, node_name String),

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  NOT INSTANTIABLE MEMBER PROCEDURE add_node(
    net_mem VARCHAR2, node_id NUMBER, node_name String,
    external_network_id NUMBER, external_node_id NUMBER),

  -- NOT INSTANTIABLE MEMBER PROCEDURE add_node(
  --  net_mem VARCHAR2, node_id NUMBER, x NUMBER, y NUMBER,
  --  external_network_id NUMBER, external_node_id NUMBER),

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  NOT INSTANTIABLE MEMBER PROCEDURE add_sdo_node(
      net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER,
      external_network_id NUMBER, external_node_id NUMBER),

  --NOT INSTANTIABLE MEMBER PROCEDURE add_sdo_node(
  --  net_mem VARCHAR2, node_id NUMBER, x NUMBER, y NUMBER),

  --NOT INSTANTIABLE MEMBER PROCEDURE add_sdo_node(
  --  net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER),

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  NOT INSTANTIABLE MEMBER PROCEDURE add_lrs_node(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, geom_id NUMBER,
    measure NUMBER, geom SDO_GEOMETRY, external_network_id NUMBER,
    external_node_id NUMBER),

  --NOT INSTANTIABLE MEMBER PROCEDURE add_lrs_node(
  --  net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, geom_id NUMBER,
  --  measure NUMBER, geom SDO_GEOMETRY),

  NOT INSTANTIABLE MEMBER PROCEDURE delete_node(
    net_mem VARCHAR2, node_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE add_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, cost NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE add_lrs_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, cost NUMBER, geom_id NUMBER, start_measure NUMBER,
    end_measure NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE add_sdo_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, geom SDO_GEOMETRY,    cost NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE delete_link(
    net_mem VARCHAR2, link_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE add_path(
    net_mem VARCHAR2, path_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE add_path(
    net_mem VARCHAR2, path_ids SDO_NUMBER_ARRAY),

  NOT INSTANTIABLE MEMBER PROCEDURE delete_path(
    net_mem VARCHAR2, path_id NUMBER)
) NOT INSTANTIABLE NOT FINAL
 ALTER  TYPE "MDSYS"."SDO_NETWORK_T" ADD
   NOT INSTANTIABLE MEMBER FUNCTION get_max_link_id(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_T" ADD
   NOT INSTANTIABLE MEMBER FUNCTION get_max_node_id(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_T" ADD
   NOT INSTANTIABLE MEMBER FUNCTION get_max_path_id(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_T" ADD
   NOT INSTANTIABLE MEMBER FUNCTION get_max_subpath_id(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_T" DROP
   NOT INSTANTIABLE MEMBER PROCEDURE add_sdo_node(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER,
    external_network_id NUMBER, external_node_id NUMBER) CASCADE
 ALTER TYPE "MDSYS"."SDO_NETWORK_T" ADD NOT INSTANTIABLE MEMBER PROCEDURE add_sdo_node(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER,
    srid NUMBER, external_network_id NUMBER, external_node_id NUMBER)
    CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_T" DROP
   NOT INSTANTIABLE MEMBER PROCEDURE add_node(
    net_mem VARCHAR2, node_id NUMBER, node_name String,
    external_network_id NUMBER, external_node_id NUMBER) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_T" ADD
   NOT INSTANTIABLE MEMBER PROCEDURE add_node(
    net_mem VARCHAR2, node_id NUMBER,  node_name VARCHAR2,
    geom SDO_GEOMETRY DEFAULT NULL, external_network_id NUMBER,
    external_node_id NUMBER) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_T" DROP
   NOT INSTANTIABLE MEMBER PROCEDURE add_lrs_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, cost NUMBER, geom_id NUMBER, start_measure NUMBER,
    end_measure NUMBER) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_T" ADD
   NOT INSTANTIABLE MEMBER PROCEDURE add_lrs_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, cost NUMBER, geom_id NUMBER, start_measure NUMBER,
    end_measure NUMBER, geom SDO_GEOMETRY) CASCADE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOM_PATH_ELEM" as object ( path mdsys.StringList, geom mdsys.sdo_geometry, arrIndex number )
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_ORGSCL_TYPE"

    AS OBJECT (
       extent           SDO_MBR,
       scale            SDO_VPOINT_TYPE,
       ord_cmp_type     SDO_VPOINT_TYPE)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."POINTINPOLYGON_IMP_T" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
d
ab0 250
hWKMWrA1t8iFkAndYEv03fg/toEwgzuNrgzbfC+VALuwdQsfoqI0QvLrJv15gjhlzBKXzDZV
gY+VICAJsSSPrFXfAgK5iULr/hMfxdaEuJiwzRMxRVVO+IZI/dfZ9s8dlJELq1A3iDvbj/c1
Qg6SOQ3Y5ZTdxXNIUqYr/j1DkvXku4HUM7iwVCCOD8Ocwb7Lytb4uhkMMMzgIaCvJ3+RN6t5
oj2k330qE6vVYC5o2y3njjbkj3KJpPHFQRsCtWRdZnjp1N9VIwbeebFaEFlKr1R9E3o9eI7H
lAIH3qvmTEjEa2RSBlSwVIEivxDz1jm6lHuhZUzE3GZf086AMp5glmvRqcD7/wlaF+AAXzNa
7Ep/3nBDDXpfpmLewB1XZStfMneysZGMKUyJoWRsG50uOS1P9xerBSUauUITFktGhjqcLoE/
KAtNbc3gOiKnkErmBwsZMVTPISUdp3IBFPdD+HVqUn+vCzGNLoHjpUnr6XzR9JH3Z//0hnd8
M3UgKMh+zNLom7QNARaj6BKqifAh64zk+YXf8sPF11KbWPTgSIutxSnyv10IBbOo/ao26h4K
tyh0aiJC
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_REGIONSET"

AS TABLE OF SDO_REGION
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_REGAGGRSET"
AS TABLE OF SDO_REGAGGR
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_GEOMETRY_ARRAY"

AS VARRAY(1048576) OF ST_GEOMETRY
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_POINT"
                                        UNDER ST_GEOMETRY (
  CONSTRUCTOR FUNCTION ST_Point(xcoord DOUBLE PRECISION,
           ycoord DOUBLE PRECISION) RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_Point(xcoord DOUBLE PRECISION,
            ycoord DOUBLE PRECISION, asrid INTEGER) RETURN SELF AS RESULT,
  OVERRIDING MEMBER FUNCTION ST_Dimension RETURN Integer DETERMINISTIC,
  MEMBER FUNCTION ST_X RETURN DOUBLE PRECISION DETERMINISTIC,
  MEMBER FUNCTION ST_X(xcoord DOUBLE PRECISION) RETURN ST_Point,
  MEMBER FUNCTION ST_Y RETURN DOUBLE PRECISION DETERMINISTIC,
  MEMBER FUNCTION ST_Y(ycoord DOUBLE PRECISION) RETURN ST_Point,
  MEMBER FUNCTION ST_ExplicitPoint
            RETURN ST_DOUBLE_PRECISION_ARRAY DETERMINISTIC)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_SURFACE_ARRAY"

AS VARRAY(1048576) OF ST_GEOMETRY
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_INDEX_METHOD_10I"

AUTHID current_user  AS OBJECT
(
  scan_ctx raw(4),
  STATIC function ODCIGetInterfaces(ifclist OUT sys.ODCIObjectList)
         return number,
  STATIC function ODCIIndexCreate (ia sys.odciindexinfo, parms varchar2,
                                   env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexDrop  (ia sys.odciindexinfo, env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexTruncate (ia sys.odciindexinfo, env sys.ODCIEnv)
          return number,
  STATIC function ODCIIndexCoalescePartition(ia sys.odciindexinfo,
                                             env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexExchangePartition(ia sys.odciindexinfo,
                                             ia1 sys.odciindexinfo,
                                             env sys.ODCIEnv)
          return number,
  STATIC function ODCIIndexMergePartition(ia sys.odciindexinfo,
                                          part_name1 sys.odcipartinfo,
                                          part_name2 sys.odcipartinfo,
                                          params varchar2,
                                          env sys.ODCIEnv)
          return number,
  STATIC function ODCIIndexSplitPartition(ia sys.odciindexinfo,
                                          part_name1 sys.odcipartinfo,
                                          part_name2 sys.odcipartinfo,
                                          params varchar2,
                                          env sys.ODCIEnv)
          return number,
  STATIC function ODCIIndexInsert (ia sys.odciindexinfo, rid varchar2,
                                   newval mdsys.sdo_geometry,
                                   env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexDelete (ia sys.odciindexinfo, rid varchar2,
                                   oldval mdsys.sdo_geometry,
                                   env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexUpdate (ia sys.odciindexinfo, rid varchar2,
                                   oldval mdsys.sdo_geometry,
                                   newval mdsys.sdo_geometry,
                                   env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexAlter (ia sys.odciindexinfo,
                                  params IN OUT varchar2,
                                  alter_option number,
                                  env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexStart (SCTX IN OUT sdo_index_method_10i,
                                  ia sys.odciindexinfo,
                                  op sys.OdciPredInfo,
                                  qi sys.OdciQueryInfo,
                                  strt varchar2, stop varchar2,
                                  win_obj mdsys.sdo_geometry,
                                  params varchar2,
                                  env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexStart (SCTX IN OUT sdo_index_method_10i,
                                  ia sys.odciindexinfo,
                                  op sys.OdciPredInfo,
                                  qi sys.OdciQueryInfo,
                                  strt varchar2, stop varchar2,
                                  win_obj mdsys.sdo_geometry, rid ROWID,
                                  params varchar2,
                                  idx_tab1 varchar2, idx_tab2 varchar2,
                                  sdo_level number, sdo_ntiles number,
                                  win_ndim number,
                                  env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexStart (SCTX IN OUT sdo_index_method_10i,
                                  ia sys.odciindexinfo,
                                  op sys.OdciPredInfo,
                                  qi sys.OdciQueryInfo,
                                  strt varchar2, stop varchar2,
                                  win_obj mdsys.sdo_geometry,
                                  env sys.ODCIEnv)
         return number,
  member function ODCIIndexFetch (nrows number,
                                  rids OUT sys.odciridlist,
                                  env sys.ODCIEnv)
        return number
        IS LANGUAGE C
        name "md_idx_fetch"
        library ORDMD_IDX_LIBS
        with context
        parameters (
           context,
           self,
           self INDICATOR STRUCT,
           nrows,
           nrows INDICATOR,
           rids,
           rids INDICATOR,
           env,
           env INDICATOR STRUCT,
           return OCINumber
      ),
  member function ODCIIndexClose (env sys.ODCIEnv)
   return number
   IS LANGUAGE C
   name "md_idx_close"
   library ORDMD_IDX_LIBS
   with context
   parameters (
     context,
     self,
     self INDICATOR STRUCT,
     env,
     env INDICATOR STRUCT,
     return OCINumber
   ),
  STATIC function ODCIIndexRewrite(ia1 sys.ODCIIndexInfo,
                                   ia2 sys.ODCIIndexInfo,
                                   cor1 VARCHAR2, cor2 VARCHAR2,
                                   op sys.ODCIPredInfo, qi sys.ODCIQueryInfo,
                                   strt VARCHAR2, stop VARCHAR2,
                                   params varchar2, rstr OUT varchar2,
                                   env sys.ODCIEnv)
      return number,
  STATIC function ODCIIndexGetMetadata(ia sys.odciindexinfo,
                                       expversion VARCHAR2,
                                       newblock OUT PLS_INTEGER,
                                     env sys.ODCIEnv)
      return varchar2,
   static function ODCIIndexUtilGetTableNames(ia        IN  sys.odciindexinfo,
                                              read_only IN  PLS_INTEGER,
                                              version   IN  varchar2,
                                              context   OUT PLS_INTEGER)
            return boolean,
   static procedure ODCIIndexUtilCleanup(context IN PLS_INTEGER),

 STATIC function ODCIIndexInsert (ia sys.odciindexinfo, rid varchar2,
                                   newval mdsys.sdo_topo_geometry,
                                   env sys.ODCIEnv)
         return number,
 STATIC function ODCIIndexDelete (ia sys.odciindexinfo, rid varchar2,
                                   oldval mdsys.sdo_topo_geometry,
                                   env sys.ODCIEnv)
         return number,
 STATIC function ODCIIndexUpdate (ia sys.odciindexinfo, rid varchar2,
                                   oldval mdsys.sdo_topo_geometry,
                                   newval mdsys.sdo_topo_geometry,
                                   env sys.ODCIEnv)
         return number,
 STATIC function ODCIIndexStart (SCTX IN OUT sdo_index_method_10i,
                                  ia sys.odciindexinfo,
                                  op sys.OdciPredInfo,
                                  qi sys.OdciQueryInfo,
                                  strt varchar2, stop varchar2,
                                  win_obj mdsys.sdo_topo_geometry,
                                  params varchar2,
                                  env sys.ODCIEnv)
         return number,
 STATIC function ODCIIndexStart (SCTX IN OUT sdo_index_method_10i,
                                  ia sys.odciindexinfo,
                                  op sys.OdciPredInfo,
                                  qi sys.OdciQueryInfo,
                                  strt varchar2, stop varchar2,
                                  win_obj mdsys.sdo_topo_geometry,
                                  env sys.ODCIEnv)
         return number,
 STATIC function ODCIIndexStart (SCTX IN OUT sdo_index_method_10i,
                                  ia sys.odciindexinfo,
                                  op sys.OdciPredInfo,
                                  qi sys.OdciQueryInfo,
                                  strt varchar2, stop varchar2,
                                  win_obj mdsys.sdo_topo_object_array,
                                  env sys.ODCIEnv)
   RETURN number )
 alter type "MDSYS"."SDO_INDEX_METHOD_10I" add STATIC FUNCTION execute_index_ptn_drop(ia in SYS.ODCIIndexInfo)  RETURN number
 alter type "MDSYS"."SDO_INDEX_METHOD_10I" add STATIC FUNCTION index_update (ia sys.odciindexinfo, rid varchar2,  oldval mdsys.sdo_geometry, newval mdsys.sdo_geometry,  env sys.ODCIEnv) RETURN NUMBER
 alter type "MDSYS"."SDO_INDEX_METHOD_10I" add STATIC FUNCTION insert_delete(ia sys.odciindexinfo, rid varchar2, val mdsys.sdo_geometry, upd_type varchar2, env sys.ODCIEnv)  RETURN number
  alter type "MDSYS"."SDO_INDEX_METHOD_10I" add STATIC function ODCIIndexInsert (ia sys.odciindexinfo,  rid varchar2, newval mdsys.st_geometry, env sys.ODCIEnv)  return number
  alter type "MDSYS"."SDO_INDEX_METHOD_10I" add STATIC function ODCIIndexDelete (ia sys.odciindexinfo,   rid varchar2, oldval mdsys.st_geometry, env sys.ODCIEnv)      return number
  alter type "MDSYS"."SDO_INDEX_METHOD_10I" add STATIC function ODCIIndexUpdate (ia sys.odciindexinfo,   rid varchar2, oldval mdsys.st_geometry, newval mdsys.st_geometry,  env sys.ODCIEnv)  return number
  alter type "MDSYS"."SDO_INDEX_METHOD_10I" add STATIC function ODCIIndexStart (SCTX IN OUT sdo_index_method_10i, ia sys.odciindexinfo,op sys.OdciPredInfo, qi sys.OdciQueryInfo,  strt varchar2, stop varchar2,win_obj mdsys.st_geometry,  env sys.ODCIEnv)  return number
  alter type "MDSYS"."SDO_INDEX_METHOD_10I" add STATIC function ODCIIndexStart (SCTX IN OUT sdo_index_method_10i, ia sys.odciindexinfo,op sys.OdciPredInfo, qi sys.OdciQueryInfo,  strt varchar2, stop varchar2,win_obj mdsys.st_geometry,  params varchar2, env sys.ODCIEnv)  return number
  alter type "MDSYS"."SDO_INDEX_METHOD_10I" add STATIC function ODCIIndexRewrite(ia1 sys.ODCIIndexInfo,  ia2 sys.ODCIIndexInfo, cor1 VARCHAR2, cor2 VARCHAR2,  op sys.ODCIPredInfo, qi sys.ODCIQueryInfo, strt VARCHAR2,  stop VARCHAR2, rstr OUT varchar2, env sys.ODCIEnv) return number
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_STATISTICS" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
d
1a19 2c9
3aym82YwdT6svuiDLaq3Eb8MRKcwg811LseMfHRAEv9kUPdHfACKMq7iYgm/rC6R96e2A+uH
I/yoOrUDYbdpn9nmYevPb8t006dWHIfannGU5wqcxCMN+Q0/TDsPT+rK8ryxnpGhRkAeJag3
uHC7HGmbFFimV2+KJ7BWdWWdhPLtIB4808IlWjw8qVwJcsgNOBpZWvX0/11x2jm6ZVOXVUDz
EzSvAIGt5DWFbFjudy2e3sHHLEERsxR3YO6331gueDp+8+ZxxyTUeZA+yDBfSlS3eAlnA37U
kh5pPQ9sgZQauEpfVYHd6A4EHs/OtdyDeGRq3TWWKuqhNU3sfq8Rs6WGBtgFoMoRM0rU/Z5M
z4AmTxgEp6xd7Q4sr6CVmL7p/ZqkXcUUuHFyUIuFw2NLDifBK2FDljb0aA0lSNMyej+c0+TM
yHVDFZqbQ976KjhAh7A1TExWCTAhlwLH7uix4VIaKmdtgJUQPmrzK8F7dpS/V+OAGjL0TYP5
jNkeJTcQVGsXDWe/HN6kSa8RGJ5gbeAEpYDVpHYAfCQxSHbh3PiIZDf/B2Kq2z2+O9Cjq0aC
8t5yb+799t4ge0mU60IDe82uaGMtrQVMPj9MbUsjIvtAP8ex9vnWBeZ4Sun0ww1RmNoxqCXt
kB7zxKA5UMTBI3Cy/qm84JdqBX3n0utn/uSMkpVGSetPeJ371+1qcg==
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDOAGGR" AUTHID current_user as Object
(
  Geometry mdsys.sdo_geometry,
  Diminfo mdsys.sdo_dim_array,
  call_count  number,
  call_method varchar2(128),
  call_type   number,
  call_value  number,
  static function odciaggregateinitialize(sctx OUT SDOAggr) return number,
  member function odciaggregateiterate(self IN OUT SDOAggr,
               geom IN mdsys.SDOAggrType) return number,
  member function odciaggregateterminate(self IN SDOAggr,
                                         returnValue OUT mdsys.sdo_geometry,
                                          flags IN number)
                     return number,
  member function odciaggregatemerge(self IN OUT SDOAggr,
                    valueB IN  SDOAggr) return number)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."AGGRUNION" AUTHID current_user as Object
(
  context raw(4),
  static function odciaggregateinitialize(sctx IN OUT AggrUnion) return number,
  member function odciaggregateiterate(self IN OUT AggrUnion,
               geom IN mdsys.SDOAggrType) return number,
  member function odciaggregateterminate(self IN AggrUnion,
                                 returnValue OUT mdsys.sdo_geometry,
                                 flags IN number)
                     return number,
  member function odciaggregatemerge(self IN OUT AggrUnion,
                    sctx2 IN  AggrUnion) return number,
  member function sdoaggregateiterate(self IN OUT AggrUnion,
               geom IN mdsys.sdo_geometry, dim IN mdsys.SDO_DIM_ARRAY)
  return number);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_ANNOT_TEXTELEMENT_ARRAY"

      AS VARRAY (100000000) OF ST_ANNOTATIONTEXTELEMENT
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."GridNode587_COLL" AS VARRAY(2147483647) OF "GridNodeType584_T"
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."GridApplicationsType590_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","GridApplication" "GridApplication592_COLL")NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."HierarchyParticipation595_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","Parent" "Parent596_COLL")FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_RASTERSET"

AS TABLE of SDO_RASTER
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOR_GCPGEOREFTYPE"

AS OBJECT
(
   FFMethodType          VARCHAR2(32),
   numberGCP             NUMBER,
   GCPs                  SDO_GEOR_GCP_COLLECTION,
   solutionAccuracy      SDO_NUMBER_ARRAY,

   CONSTRUCTOR FUNCTION SDO_GEOR_GCPGEOREFTYPE(SELF IN OUT NOCOPY SDO_GEOR_GCPGEOREFTYPE)
     RETURN SELF AS RESULT

)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEORASTER_ARRAY"

     AS VARRAY(10485760) OF SDO_GEORASTER
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_PATH_I"
  AUTHID current_user
  UNDER SDO_PATH_T(

  STATIC FUNCTION get_cost_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathCost(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_cost(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_no_of_links_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathNoOfLinks(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_no_of_links(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_type_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathType(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION get_type(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION get_name_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathName(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION get_name(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION get_start_node_id_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathStartNodeId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_start_node_id(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_end_node_id_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathEndNodeId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_end_node_id(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_geometry_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN SDO_GEOMETRY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathGeometry(
    java.lang.String, oracle.sql.NUMBER)
    return     oracle.spatial.type.SdoGeometry',

  OVERRIDING MEMBER FUNCTION get_geometry(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN SDO_GEOMETRY DETERMINISTIC,

  STATIC FUNCTION get_node_ids_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathNodeIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_node_ids(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_link_ids_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathLinkIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_link_ids(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC PROCEDURE set_type_s(net_mem VARCHAR2, path_id NUMBER, type VARCHAR2)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setPathType(
    java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE set_type(
    net_mem VARCHAR2, path_id NUMBER, type VARCHAR2),


  STATIC PROCEDURE set_name_s(net_mem VARCHAR2, path_id NUMBER,
   path_name VARCHAR2)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setPathName(
    java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE set_name(
    net_mem VARCHAR2, path_id NUMBER, path_name VARCHAR2),


  STATIC PROCEDURE set_path_id_s(net_mem VARCHAR2, path_id NUMBER,
   new_path_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setPathPathId(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_path_id(
    net_mem VARCHAR2, path_id NUMBER, new_path_id NUMBER),


  STATIC PROCEDURE set_geometry_s(
   net_mem VARCHAR2, path_id NUMBER, geom SDO_GEOMETRY)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setPathGeometry(
    java.lang.String, oracle.sql.NUMBER,     oracle.spatial.type.SdoGeometry)',

  OVERRIDING MEMBER PROCEDURE set_geometry(
    net_mem VARCHAR2, path_id NUMBER,    geom SDO_GEOMETRY),


  STATIC FUNCTION is_closed_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.pathIsClosed(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_closed(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_connected_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.pathIsConnected(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_connected(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_simple_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.pathIsSimple(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_simple(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_temporary_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.pathIsTemporary(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_temporary(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_logical_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.pathIsLogical(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_logical(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_active_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.pathIsActive(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_active(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC PROCEDURE compute_geometry_s(
   net_mem VARCHAR2, path_id NUMBER, tolerance NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.computeGeometry(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE compute_geometry(
    net_mem VARCHAR2, path_id NUMBER,    tolerance NUMBER)
)
  ALTER TYPE "MDSYS"."SDO_PATH_I" INSTANTIABLE CASCADE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NETWORK_I"
  AUTHID current_user
  UNDER SDO_NETWORK_T(

  -- STATIC PROCEDURE add_node_s(net_mem VARCHAR2, node_id NUMBER)
  -- AS LANGUAGE JAVA NAME
  -- 'oracle.spatial.type.NetworkWrapper.addNode(
  --  java.lang.String, oracle.sql.NUMBER)',

  -- OVERRIDING MEMBER PROCEDURE add_node(net_mem VARCHAR2, node_id NUMBER),


  -- STATIC PROCEDURE add_node_s(net_mem VARCHAR2,node_id NUMBER,node_name String)
  -- AS LANGUAGE JAVA NAME
  -- 'oracle.spatial.type.NetworkWrapper.addNode(
  --  java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  -- OVERRIDING MEMBER PROCEDURE add_node(
  --  net_mem VARCHAR2, node_id NUMBER, node_name String),

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  STATIC PROCEDURE add_node_s(net_mem VARCHAR2,node_id NUMBER,node_name String,
   external_network_id NUMBER, external_node_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addNode(
    java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
    oracle.sql.NUMBER)',

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  OVERRIDING MEMBER PROCEDURE add_node(
    net_mem VARCHAR2, node_id NUMBER, node_name String,
    external_network_id NUMBER, external_node_id NUMBER),


  -- STATIC PROCEDURE add_node_s(net_mem VARCHAR2, node_id NUMBER, x NUMBER,
  -- y NUMBER, external_network_id NUMBER, external_node_id NUMBER)
  -- AS LANGUAGE JAVA NAME
  -- 'oracle.spatial.type.NetworkWrapper.addNode(
  --  java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER,
  --  oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  -- OVERRIDING MEMBER PROCEDURE add_node(
  --  net_mem VARCHAR2, node_id NUMBER, x NUMBER, y NUMBER,
  --  external_network_id NUMBER, external_node_id NUMBER),

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  STATIC PROCEDURE add_sdo_node_s(net_mem VARCHAR2, node_id NUMBER,
   node_name VARCHAR2, x NUMBER, y NUMBER,
   external_network_id NUMBER, external_node_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addSdoNode(
    java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
    oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  OVERRIDING MEMBER PROCEDURE add_sdo_node(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER,
    external_network_id NUMBER, external_node_id NUMBER),

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  STATIC PROCEDURE add_lrs_node_s(net_mem VARCHAR2, node_id NUMBER,
   node_name VARCHAR2, geom_id NUMBER, measure NUMBER, geom SDO_GEOMETRY,
   external_network_id NUMBER, external_node_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addLRSNode(
    java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
    oracle.sql.NUMBER, oracle.spatial.type.SdoGeometry, oracle.sql.NUMBER,
    oracle.sql.NUMBER)',

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  OVERRIDING MEMBER PROCEDURE add_lrs_node(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, geom_id NUMBER,
    measure NUMBER, geom SDO_GEOMETRY, external_network_id NUMBER,
    external_node_id NUMBER),


  -- STATIC PROCEDURE add_lrs_node_s(net_mem VARCHAR2, node_id NUMBER,
  -- node_name VARCHAR2,    geom_id NUMBER, measure NUMBER, geom SDO_GEOMETRY)
  -- AS LANGUAGE JAVA NAME
  -- 'oracle.spatial.type.NetworkWrapper.addLRSNode(
  --  java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
  --  oracle.sql.NUMBER, oracle.spatial.type.SdoGeometry)',

  -- OVERRIDING MEMBER PROCEDURE add_lrs_node(
  --  net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, geom_id NUMBER,
  --  measure NUMBER, geom SDO_GEOMETRY),


  STATIC PROCEDURE delete_node_s(net_mem VARCHAR2, node_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.deleteNode(
    java.lang.String, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE delete_node(
    net_mem VARCHAR2, node_id NUMBER),


  STATIC PROCEDURE add_link_s(net_mem VARCHAR2, link_id NUMBER,
   link_name VARCHAR2, start_node_id NUMBER, end_node_id NUMBER, cost NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addLink(
    java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
    oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE add_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, cost NUMBER),


  STATIC PROCEDURE add_lrs_link_s(net_mem VARCHAR2, link_id NUMBER,
   link_name VARCHAR2, start_node_id NUMBER, end_node_id NUMBER, cost NUMBER,
   geom_id NUMBER, start_measure NUMBER, end_measure NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addLink(
    java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
    oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER,
    oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE add_lrs_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, cost NUMBER,   geom_id NUMBER, start_measure NUMBER,
    end_measure NUMBER),


  STATIC PROCEDURE add_sdo_link_s(net_mem VARCHAR2, link_id NUMBER,
   link_name VARCHAR2,    start_node_id NUMBER, end_node_id NUMBER,
   geom SDO_GEOMETRY,    cost NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addLink(
    java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
    oracle.sql.NUMBER, oracle.spatial.type.SdoGeometry, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE add_sdo_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, geom SDO_GEOMETRY, cost NUMBER),


  STATIC PROCEDURE delete_link_s(net_mem VARCHAR2, link_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.deleteLink(
    java.lang.String, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE delete_link(
    net_mem VARCHAR2, link_id NUMBER),


  STATIC PROCEDURE add_path_s(net_mem VARCHAR2, path_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addPath(
    java.lang.String, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE add_path(
    net_mem VARCHAR2, path_id NUMBER),


  STATIC PROCEDURE add_path_s(net_mem VARCHAR2, path_ids SDO_NUMBER_ARRAY)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addPath(
    java.lang.String, oracle.spatial.type.SdoNumberArray)',

  OVERRIDING MEMBER PROCEDURE add_path(
    net_mem VARCHAR2, path_ids SDO_NUMBER_ARRAY),


  STATIC PROCEDURE delete_path_s(net_mem VARCHAR2, path_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.deletePath(
    java.lang.String, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE delete_path(
    net_mem VARCHAR2, path_id NUMBER)
)
  ALTER TYPE "MDSYS"."SDO_NETWORK_I" NOT INSTANTIABLE NOT FINAL CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_I" ADD
   STATIC FUNCTION get_max_link_id_s(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC
      AS LANGUAGE JAVA NAME
      'oracle.spatial.type.NetworkWrapper.getMaxLinkID(java.lang.String)
      return oracle.spatial.NUMBER'
 ALTER TYPE "MDSYS"."SDO_NETWORK_I" ADD
   OVERRIDING MEMBER FUNCTION get_max_link_id(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC
 ALTER  TYPE "MDSYS"."SDO_NETWORK_I" ADD
   STATIC FUNCTION get_max_node_id_s(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC
      AS LANGUAGE JAVA NAME
      'oracle.spatial.type.NetworkWrapper.getMaxNodeID(java.lang.String)
      return oracle.spatial.NUMBER'
 ALTER  TYPE "MDSYS"."SDO_NETWORK_I" ADD
   OVERRIDING MEMBER FUNCTION get_max_node_id(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC
 ALTER  TYPE "MDSYS"."SDO_NETWORK_I" ADD
   STATIC FUNCTION get_max_path_id_s(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC
      AS LANGUAGE JAVA NAME
      'oracle.spatial.type.NetworkWrapper.getMaxPathID(java.lang.String)
      return oracle.spatial.NUMBER'
 ALTER  TYPE "MDSYS"."SDO_NETWORK_I" ADD
   OVERRIDING MEMBER FUNCTION get_max_path_id(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC
 ALTER  TYPE "MDSYS"."SDO_NETWORK_I" ADD
   STATIC FUNCTION get_max_subpath_id_s(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC
      AS LANGUAGE JAVA NAME
      'oracle.spatial.type.NetworkWrapper.getMaxSubPathID(java.lang.String)
      return oracle.spatial.NUMBER'
 ALTER  TYPE "MDSYS"."SDO_NETWORK_I" ADD
   OVERRIDING MEMBER FUNCTION get_max_subpath_id(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC
  ALTER TYPE "MDSYS"."SDO_NETWORK_I" INSTANTIABLE  CASCADE
  ALTER TYPE "MDSYS"."SDO_NETWORK_I" NOT INSTANTIABLE NOT FINAL CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_I" DROP
   OVERRIDING MEMBER PROCEDURE add_sdo_node(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER,
    external_network_id NUMBER, external_node_id NUMBER) CASCADE
 ALTER TYPE "MDSYS"."SDO_NETWORK_I" ADD OVERRIDING MEMBER PROCEDURE add_sdo_node(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER,
    srid NUMBER, external_network_id NUMBER, external_node_id NUMBER)
    CASCADE
 ALTER TYPE "MDSYS"."SDO_NETWORK_I" DROP STATIC PROCEDURE add_sdo_node_s(net_mem VARCHAR2,
    node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER, external_network_id NUMBER,
    external_node_id NUMBER) CASCADE
 ALTER TYPE "MDSYS"."SDO_NETWORK_I" ADD STATIC PROCEDURE add_sdo_node_s(net_mem VARCHAR2,
   node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER, srid NUMBER,
   external_network_id NUMBER, external_node_id NUMBER) AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addSdoNode(java.lang.String,
    oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER,
    oracle.sql.NUMBER, oracle.sql.NUMBER,  oracle.sql.NUMBER)'
 ALTER  TYPE "MDSYS"."SDO_NETWORK_I" DROP
   OVERRIDING MEMBER PROCEDURE add_node(
    net_mem VARCHAR2, node_id NUMBER, node_name String,
    external_network_id NUMBER, external_node_id NUMBER) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_I" ADD
    OVERRIDING MEMBER PROCEDURE add_node(
    net_mem VARCHAR2,
    node_id NUMBER,
    node_name VARCHAR2,
    geom SDO_GEOMETRY DEFAULT NULL,
    external_network_id NUMBER,
    external_node_id NUMBER) CASCADE
 ALTER TYPE "MDSYS"."SDO_NETWORK_I" DROP
    STATIC PROCEDURE add_node_s(net_mem VARCHAR2,node_id NUMBER,
    node_name String, external_network_id NUMBER,
    external_node_id NUMBER) CASCADE
 ALTER TYPE "MDSYS"."SDO_NETWORK_I" ADD
    STATIC PROCEDURE add_node_s(net_mem VARCHAR2,node_id NUMBER,
    node_name VARCHAR2, geom SDO_GEOMETRY, external_network_id NUMBER,
    external_node_id NUMBER) AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addNode(
    java.lang.String, oracle.sql.NUMBER, java.lang.String,
    oracle.spatial.type.SdoGeometry,oracle.sql.NUMBER, oracle.sql.NUMBER)'
  ALTER TYPE "MDSYS"."SDO_NETWORK_I" INSTANTIABLE CASCADE
  ALTER TYPE "MDSYS"."SDO_NETWORK_I" NOT INSTANTIABLE NOT FINAL CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_I" DROP
   OVERRIDING MEMBER PROCEDURE add_lrs_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, cost NUMBER,   geom_id NUMBER, start_measure NUMBER,
    end_measure NUMBER) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NETWORK_I" ADD
   OVERRIDING MEMBER PROCEDURE add_lrs_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, cost NUMBER,   geom_id NUMBER, start_measure NUMBER,
    end_measure NUMBER, geom SDO_GEOMETRY) CASCADE
 ALTER TYPE "MDSYS"."SDO_NETWORK_I" DROP
   STATIC PROCEDURE add_lrs_link_s(net_mem VARCHAR2, link_id NUMBER,
   link_name VARCHAR2, start_node_id NUMBER, end_node_id NUMBER, cost NUMBER,
   geom_id NUMBER, start_measure NUMBER, end_measure NUMBER) CASCADE
 ALTER TYPE "MDSYS"."SDO_NETWORK_I" ADD
   STATIC PROCEDURE add_lrs_link_s(net_mem VARCHAR2, link_id NUMBER,
   link_name VARCHAR2, start_node_id NUMBER, end_node_id NUMBER, cost NUMBER,
   geom_id NUMBER, start_measure NUMBER, end_measure NUMBER, geom SDO_GEOMETRY)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addLink(
    java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
    oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER,
    oracle.sql.NUMBER, oracle.spatial.type.SdoGeometry)'
  ALTER TYPE "MDSYS"."SDO_NETWORK_I" INSTANTIABLE  CASCADE
  ALTER TYPE "MDSYS"."SDO_NETWORK_I" INSTANTIABLE CASCADE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_NODE_I"
  AUTHID current_user
  UNDER SDO_NODE_T
(
 STATIC FUNCTION get_cost_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeCost(
    java.lang.String, oracle.sql.NUMBER) return oracle.sql.NUMBER',

 OVERRIDING MEMBER FUNCTION get_cost(
    net_mem   VARCHAR2,
    node_id   NUMBER
 )  RETURN NUMBER DETERMINISTIC,

 STATIC FUNCTION get_hierarchy_level_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeHierarchyLevel(
    java.lang.String, oracle.sql.NUMBER) return oracle.sql.NUMBER',

 OVERRIDING MEMBER FUNCTION get_hierarchy_level(
   net_mem   VARCHAR2,
   node_id   NUMBER
 ) RETURN NUMBER DETERMINISTIC,

 STATIC FUNCTION get_state_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeState(
    java.lang.String, oracle.sql.NUMBER) return java.lang.String',

 OVERRIDING MEMBER FUNCTION get_state(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC,

 STATIC FUNCTION get_type_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeType(
    java.lang.String, oracle.sql.NUMBER) return java.lang.String',

 OVERRIDING MEMBER FUNCTION get_type(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC,

  STATIC FUNCTION get_name_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeName(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION get_name(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION get_partition_id_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodePartitionId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_partition_id(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_component_no_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeComponentNo(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_component_no(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_in_link_ids_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeInLinkIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_in_link_ids(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_out_link_ids_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeOutLinkIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_out_link_ids(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_incident_link_ids_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeIncidentLinkIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_incident_link_ids(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_child_node_ids_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeChildNodeIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_child_node_ids(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_adjacent_node_ids_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeAdjacentNodeIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_adjacent_node_ids(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_sibling_node_ids_s(net_mem VARCHAR2, id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeSiblingNodeIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_sibling_node_ids(
    net_mem VARCHAR2, id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  STATIC FUNCTION get_geometry_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN SDO_GEOMETRY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeGeometry(
    java.lang.String, oracle.sql.NUMBER)
    return     oracle.spatial.type.SdoGeometry',

  OVERRIDING MEMBER FUNCTION get_geometry(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_GEOMETRY DETERMINISTIC,


  STATIC FUNCTION get_geom_id_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeGeomId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_geom_id(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  ----------------
  -- DEPRECATED --
  ----------------
  STATIC FUNCTION get_external_node_id_s(net_mem VARCHAR2, id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeExternalNodeId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  ----------------
  -- DEPRECATED --
  ----------------
  OVERRIDING MEMBER FUNCTION get_external_node_id(
    net_mem VARCHAR2, id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  ----------------
  -- DEPRECATED --
  ----------------
  STATIC FUNCTION get_external_network_id_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeExternalNetworkId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  ----------------
  -- DEPRECATED --
  ----------------
  OVERRIDING MEMBER FUNCTION get_external_network_id(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  ----------------
  -- DEPRECATED --
  ----------------
  STATIC FUNCTION get_external_network_name_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeExternalNetworkName(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  ----------------
  -- DEPRECATED --
  ----------------
  OVERRIDING MEMBER FUNCTION get_external_network_name(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION get_parent_node_id_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeParentNodeId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_parent_node_id(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_measure_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeMeasure(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_measure(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC PROCEDURE set_cost_s(net_mem VARCHAR2, node_id NUMBER, cost NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeCost(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_cost(
    net_mem VARCHAR2, node_id NUMBER, cost NUMBER),


  STATIC PROCEDURE set_hierarchy_level_s(net_mem VARCHAR2, node_id NUMBER,
    level NUMBER)
    AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeHierarchyLevel(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_hierarchy_level(
    net_mem VARCHAR2, node_id NUMBER,    level NUMBER),


  STATIC PROCEDURE set_type_s(net_mem VARCHAR2, node_id NUMBER, type VARCHAR2)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeType(
    java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE set_type(
    net_mem VARCHAR2, node_id NUMBER, type VARCHAR2),


  STATIC PROCEDURE set_name_s(net_mem VARCHAR2, node_id NUMBER,
   node_name VARCHAR2)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeName(
    java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE set_name(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2),


  STATIC PROCEDURE set_state_s(net_mem VARCHAR2, node_id NUMBER, state VARCHAR2)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeState(
    java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE set_state(
    net_mem VARCHAR2, node_id NUMBER, state VARCHAR2),


  STATIC PROCEDURE set_component_no_s(net_mem VARCHAR2,node_id NUMBER,no NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeComponentNo(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_component_no(
    net_mem VARCHAR2, node_id NUMBER,    no NUMBER),


  STATIC PROCEDURE set_parent_node_s(net_mem VARCHAR2, node_id NUMBER,
   parent_node_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeParentNode(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_parent_node(
    net_mem VARCHAR2, node_id NUMBER,    parent_node_id NUMBER),

  ----------------
  -- DEPRECATED --
  ----------------
  STATIC PROCEDURE set_external_node_id_s(net_mem VARCHAR2, node_id NUMBER,
   external_node_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeExternalNodeId(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  ----------------
  -- DEPRECATED --
  ----------------
  OVERRIDING MEMBER PROCEDURE set_external_node_id(
    net_mem VARCHAR2, node_id NUMBER,    external_node_id NUMBER),

  ----------------
  -- DEPRECATED --
  ----------------
  STATIC PROCEDURE set_external_network_id_s(net_mem VARCHAR2, node_id NUMBER,
   external_network_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeExternalNetworkId(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  ----------------
  -- DEPRECATED --
  ----------------
  OVERRIDING MEMBER PROCEDURE set_external_network_id(
    net_mem VARCHAR2, node_id NUMBER,    external_network_id NUMBER),


  STATIC PROCEDURE set_geometry_s(net_mem VARCHAR2, node_id NUMBER,
   geom SDO_GEOMETRY)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeGeometry(
    java.lang.String, oracle.sql.NUMBER, oracle.spatial.type.SdoGeometry)',

  OVERRIDING MEMBER PROCEDURE set_geometry(
    net_mem VARCHAR2, node_id NUMBER,    geom SDO_GEOMETRY),


  STATIC PROCEDURE set_geom_id_s(net_mem VARCHAR2, node_id NUMBER,
   geom_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeGeomId(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_geom_id(
    net_mem VARCHAR2, node_id NUMBER,    geom_id NUMBER),


  STATIC PROCEDURE set_measure_s(net_mem VARCHAR2, node_id NUMBER,
   measure NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeMeasure(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_measure(
    net_mem VARCHAR2, node_id NUMBER,    measure NUMBER),


  STATIC PROCEDURE make_temporary_s(net_mem VARCHAR2, node_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.nodeMakeTemporary(
    java.lang.String, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE make_temporary(
    net_mem VARCHAR2, node_id NUMBER),


  STATIC FUNCTION is_temporary_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.nodeIsTemporary(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_temporary(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_active_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.nodeIsActive(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_active(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_logical_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.nodeIsLogical(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_logical(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION link_exists_s(net_mem VARCHAR2, node_id1 NUMBER, node_id2 NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.linkExists(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)
       return java.lang.String',

  OVERRIDING MEMBER FUNCTION link_exists(
    net_mem VARCHAR2, node_id1 NUMBER, node_id2 NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  ----------------
  -- DEPRECATED --
  ----------------
  STATIC FUNCTION is_external_node_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.nodeIsExternalNode(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  ----------------
  -- DEPRECATED --
  ----------------
  OVERRIDING MEMBER FUNCTION is_external_node(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  STATIC FUNCTION get_in_degree_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeInDegree(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_in_degree(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_out_degree_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeOutDegree(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_out_degree(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  STATIC FUNCTION get_degree_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeDegree(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_degree(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC

)
  ALTER TYPE "MDSYS"."SDO_NODE_I" NOT INSTANTIABLE NOT FINAL CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_I" DROP
    STATIC  FUNCTION get_external_network_id_s(
    net_mem VARCHAR2, node_id NUMBER) RETURN NUMBER CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_I" DROP
    OVERRIDING MEMBER FUNCTION get_external_network_id(
    net_mem VARCHAR2, node_id NUMBER) RETURN NUMBER CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_I" DROP
     STATIC PROCEDURE set_external_network_id_s(net_mem VARCHAR2, node_id NUMBER,
     external_network_id NUMBER) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_I" DROP
     OVERRIDING MEMBER PROCEDURE set_external_network_id(
     net_mem VARCHAR2, node_id NUMBER,    external_network_id NUMBER) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_I" DROP
    STATIC  FUNCTION get_external_node_id_s(
    net_mem VARCHAR2, id NUMBER) RETURN NUMBER CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_I" DROP
    OVERRIDING MEMBER FUNCTION get_external_node_id(
    net_mem VARCHAR2, id NUMBER) RETURN NUMBER CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_I" DROP
     STATIC PROCEDURE set_external_node_id_s(net_mem VARCHAR2, node_id NUMBER,
   external_node_id NUMBER) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_I" DROP
     OVERRIDING MEMBER PROCEDURE set_external_node_id(
     net_mem VARCHAR2, node_id NUMBER,    external_node_id NUMBER) CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_I" DROP
     STATIC FUNCTION get_external_network_name_s(net_mem VARCHAR2, node_id NUMBER)
     RETURN VARCHAR2 CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_I" DROP
     OVERRIDING MEMBER FUNCTION get_external_network_name(
        net_mem VARCHAR2, node_id NUMBER) RETURN VARCHAR2 CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_I" DROP
     STATIC FUNCTION is_external_node_s(net_mem VARCHAR2, node_id NUMBER)
     RETURN VARCHAR2  CASCADE
 ALTER  TYPE "MDSYS"."SDO_NODE_I" DROP
      OVERRIDING MEMBER FUNCTION is_external_node(
      net_mem VARCHAR2, node_id NUMBER) RETURN VARCHAR2 CASCADE
  ALTER TYPE "MDSYS"."SDO_NODE_I" INSTANTIABLE CASCADE
  ALTER TYPE "MDSYS"."SDO_NODE_I" INSTANTIABLE CASCADE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_LINK_I"
  AUTHID current_user
  UNDER SDO_LINK_T(

  STATIC FUNCTION get_cost_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkCost(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_cost(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_level_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkLevel(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_level(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_state_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkState(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION get_state(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION get_type_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkType(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION get_type(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION get_name_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkName(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION get_name(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION get_start_node_id_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkStartNodeId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_start_node_id(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_end_node_id_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkEndNodeId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_end_node_id(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_parent_link_id_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkParentLinkId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_parent_link_id(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_child_links_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkChildLinkIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_child_links(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_co_link_ids_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkCoLinkIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_co_link_ids(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_sibling_link_ids_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkSiblingLinkIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_sibling_link_ids(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_geometry_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN SDO_GEOMETRY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkGeometry(
    java.lang.String, oracle.sql.NUMBER)
    return     oracle.spatial.type.SdoGeometry',

  OVERRIDING MEMBER FUNCTION get_geometry(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN SDO_GEOMETRY DETERMINISTIC,


  STATIC FUNCTION get_geom_id_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkGeomId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_geom_id(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_end_measure_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkEndMeasure(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_end_measure(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_start_measure_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkStartMeasure(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_start_measure(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  STATIC PROCEDURE make_temporary_s(net_mem VARCHAR2, link_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.linkMakeTemporary(java.lang.String,
    oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE make_temporary(
    net_mem VARCHAR2, link_id NUMBER),

  STATIC PROCEDURE set_cost_s(net_mem VARCHAR2, link_id NUMBER, cost NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkCost(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_cost(
    net_mem VARCHAR2, link_id NUMBER, cost NUMBER),


  STATIC PROCEDURE set_level_s(net_mem VARCHAR2,link_id NUMBER,level NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkLevel(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_level(
    net_mem VARCHAR2, link_id NUMBER,    level NUMBER),


  STATIC PROCEDURE set_type_s(net_mem VARCHAR2, link_id NUMBER, type VARCHAR2)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkType(
    java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE set_type(
    net_mem VARCHAR2, link_id NUMBER, type VARCHAR2),


  STATIC PROCEDURE set_name_s(
   net_mem VARCHAR2,link_id NUMBER,link_name VARCHAR2)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkName(
    java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE set_name(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2),


  STATIC PROCEDURE set_state_s(net_mem VARCHAR2, link_id NUMBER, state VARCHAR2)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkState(
    java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE set_state(
    net_mem VARCHAR2, link_id NUMBER, state VARCHAR2),


  STATIC PROCEDURE set_start_node_s(
    net_mem VARCHAR2, link_id NUMBER, start_node_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkStartNode(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_start_node(
    net_mem VARCHAR2, link_id NUMBER,    start_node_id NUMBER),


  STATIC PROCEDURE set_end_node_s(
   net_mem VARCHAR2, link_id NUMBER, end_node_id NUMBER)
  AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkEndNode(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_end_node(
    net_mem VARCHAR2, link_id NUMBER,    end_node_id NUMBER),


  STATIC PROCEDURE set_parent_link_s(
   net_mem VARCHAR2, link_id NUMBER,    parent_link_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkParentLink(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_parent_link(
    net_mem VARCHAR2, link_id NUMBER,    parent_link_id NUMBER),


  STATIC PROCEDURE set_geometry_s(
   net_mem VARCHAR2, link_id NUMBER,    geom SDO_GEOMETRY)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkGeometry(
    java.lang.String, oracle.sql.NUMBER,     oracle.spatial.type.SdoGeometry)',

  OVERRIDING MEMBER PROCEDURE set_geometry(
    net_mem VARCHAR2, link_id NUMBER,    geom SDO_GEOMETRY),


  STATIC PROCEDURE set_geom_id_s(
   net_mem VARCHAR2, link_id NUMBER,    geom_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkGeomId(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_geom_id(
    net_mem VARCHAR2, link_id NUMBER,    geom_id NUMBER),


  STATIC PROCEDURE set_measure_s(
   net_mem VARCHAR2, link_id NUMBER, start_measure NUMBER, end_measure NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkMeasure(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER,oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_measure(
    net_mem VARCHAR2, link_id NUMBER, start_measure NUMBER, end_measure NUMBER),


  STATIC FUNCTION is_temporary_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.linkIsTemporary(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_temporary(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_active_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.linkIsActive(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_active(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_logical_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.linkIsLogical(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_logical(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  ----------------
  -- DEPRECATED --
  ----------------
  STATIC FUNCTION is_external_link_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.linkIsExternalLink(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  ----------------
  -- DEPRECATED --
  ----------------
  OVERRIDING MEMBER FUNCTION is_external_link(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC
)
  ALTER TYPE "MDSYS"."SDO_LINK_I" NOT INSTANTIABLE NOT FINAL CASCADE
 ALTER  TYPE "MDSYS"."SDO_LINK_I" DROP
      STATIC FUNCTION is_external_link_s(net_mem VARCHAR2, link_id NUMBER)
      RETURN VARCHAR2 CASCADE
 ALTER  TYPE "MDSYS"."SDO_LINK_I" DROP
       OVERRIDING MEMBER FUNCTION is_external_link(
       net_mem VARCHAR2, link_id NUMBER) RETURN VARCHAR2 CASCADE
  ALTER TYPE "MDSYS"."SDO_LINK_I" INSTANTIABLE CASCADE
  ALTER TYPE "MDSYS"."SDO_LINK_I" INSTANTIABLE CASCADE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOM_PATH_INFO" as table of mdsys.sdo_geom_path_elem
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_PC_BLK"

    AS OBJECT (
       obj_id           NUMBER ,
       blk_id           NUMBER,
       blk_extent       sdo_geometry,
       blk_domain       sdo_orgscl_type,
       pcblk_min_res    NUMBER,
       pcblk_max_res    NUMBER,
       num_points       NUMBER,
       num_unsorted_points NUMBER,
       pt_sort_dim      NUMBER,
       points           BLOB)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_PC"

    AS OBJECT (
       base_table           VARCHAR2(70),
       base_table_col       VARCHAR2(1024),
       pc_id                NUMBER,
       blk_table            VARCHAR2(70),
       ptn_params           VARCHAR2(1024),
       pc_extent            sdo_geometry,
       pc_tol               NUMBER,
       pc_tot_dimensions    NUMBER,
       pc_domain            sdo_orgscl_type,
       pc_val_attr_tables   SDO_STRING_ARRAY,
       pc_other_attrs       SYS.XMLTYPE)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_TIN_BLK"

    AS OBJECT (
       obj_id           NUMBER ,
       blk_id           NUMBER,
       blk_extent       sdo_geometry,
       blk_domain       sdo_orgscl_type,
       pcblk_min_res    NUMBER,
       pcblk_max_res    NUMBER,
       num_points       NUMBER,
       num_unsorted_points NUMBER,
       pt_sort_dim      NUMBER,
       points           BLOB,
       tr_lvl           NUMBER,
       tr_res           NUMBER,
       num_triangles    NUMBER,
       tr_sort_dim      NUMBER,
       triangles        BLOB)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_TIN"

    AS OBJECT (
       base_table            VARCHAR2(70),
       base_table_col        VARCHAR2(1024),
       tin_id                NUMBER,
       blk_table             VARCHAR2(70),
       ptn_params            VARCHAR2(1024),
       tin_extent            sdo_geometry,
       tin_tol               NUMBER,
       tin_tot_dimensions    NUMBER,
       tin_domain            sdo_orgscl_type,
       tin_break_lines       SDO_GEOMETRY,
       tin_stop_lines        SDO_GEOMETRY,
       tin_void_rgns         SDO_GEOMETRY,
       tin_val_attr_tables   SDO_STRING_ARRAY,
       tin_other_attrs       SYS.XMLTYPE)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_POINT_ARRAY"

AS VARRAY(1048576) OF ST_Point
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_SURFACE"
                                       UNDER ST_GEOMETRY (
  OVERRIDING MEMBER FUNCTION ST_Dimension RETURN Integer DETERMINISTIC,
  MEMBER FUNCTION ST_PointOnSurface RETURN ST_Point DETERMINISTIC,
  MEMBER FUNCTION ST_Area RETURN NUMBER DETERMINISTIC) NOT FINAL
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_GEOMCOLLECTION"
                                       UNDER ST_GEOMETRY (
  CONSTRUCTOR FUNCTION ST_GEOMCOLLECTION(ageometry ST_GEOMETRY) RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_GEOMCOLLECTION(ageometryarray ST_GEOMETRY_ARRAY) RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_GEOMCOLLECTION(ageometry ST_GEOMETRY, asrid INTEGER) RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_GEOMCOLLECTION(ageometryarray ST_GEOMETRY_ARRAY, asrid INTEGER) RETURN SELF AS RESULT,

  OVERRIDING MEMBER FUNCTION ST_Dimension RETURN Integer DETERMINISTIC,
  MEMBER FUNCTION ST_GEOMETRIES RETURN ST_GEOMETRY_ARRAY DETERMINISTIC,
  MEMBER FUNCTION ST_GEOMETRIES(ageometryarray ST_GEOMETRY_ARRAY) RETURN ST_GEOMCOLLECTION) NOT FINAL
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."AGGRMBR" AUTHID current_user as Object
(
  context mdsys.SDOAggr,
  static function odciaggregateinitialize(sctx OUT AggrMBR) return number,
  member function odciaggregateiterate(self IN OUT AggrMBR,
               geom IN mdsys.sdo_geometry) return number,
  member function odciaggregateterminate(self IN AggrMBR,
                                        returnValue OUT mdsys.sdo_geometry,
                                          flags IN number)
                     return number,
  member function odciaggregatemerge(self IN OUT AggrMBR,
                    valueB IN  AggrMBR) return number);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."AGGRLRSCONCAT" AUTHID current_user as Object
(
  context mdsys.SDOAggr,
  static function odciaggregateinitialize(sctx OUT AggrLRSConcat) return number,
  member function odciaggregateiterate(self IN OUT AggrLRSConcat,
                                       geom IN mdsys.SDOAggrType) return number,
  member function odciaggregateterminate(self IN AggrLRSConcat,
                                        returnValue OUT mdsys.sdo_geometry,
                                          flags IN number)
                     return number,
  member function odciaggregatemerge(self   IN OUT AggrLRSConcat,
                                     valueB IN  AggrLRSConcat) return number);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."AGGRLRSCONCAT3D" AUTHID current_user as Object
(
  context mdsys.SDOAggr,
  static function odciaggregateinitialize(sctx OUT AggrLRSConcat3D) return number,
  member function odciaggregateiterate(self IN OUT AggrLRSConcat3D,
                                       geom IN mdsys.SDOAggrType) return number,
  member function odciaggregateterminate(self IN AggrLRSConcat3D,
                                           returnValue OUT mdsys.sdo_geometry,
                                          flags IN number)
                     return number,
  member function odciaggregatemerge(self   IN OUT AggrLRSConcat3D,
                                     valueB IN  AggrLRSConcat3D) return number);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."AGGRCONVEXHULL" AUTHID current_user as Object
(
  context mdsys.SDOAggr,
  static function odciaggregateinitialize(sctx OUT AggrConvexHull) return number,
  member function odciaggregateiterate(self IN OUT AggrConvexHull,
                                       geom IN mdsys.SDOAggrType) return number,
  member function odciaggregateterminate(self IN AggrConvexHull,
                                         returnValue OUT mdsys.sdo_geometry,
                                          flags IN number)
                     return number,
  member function odciaggregatemerge(self   IN OUT AggrConvexHull,
                                     valueB IN  AggrConvexHull) return number);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."AGGRCENTROID" AUTHID current_user as Object
(
  context mdsys.SDOAggr,
  static function odciaggregateinitialize(sctx OUT AggrCentroid) return number,
  member function odciaggregateiterate(self IN OUT AggrCentroid,
                                       geom IN mdsys.SDOAggrType) return number,
  member function odciaggregateterminate(self IN AggrCentroid,
                                         returnValue OUT mdsys.sdo_geometry,
                                          flags IN number)
                     return number,
  member function odciaggregatemerge(self   IN OUT AggrCentroid,
                                     valueB IN  AggrCentroid) return number);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_ANNOTATIONTEXTELEMENT_ARRAY"

    AS OBJECT (
     privateArray  ST_ANNOT_TEXTELEMENT_ARRAY ,
    MEMBER FUNCTION ElementN ( aposition INTEGER)
          RETURN ST_ANNOTATIONTEXTELEMENT,
    MEMBER FUNCTION ElementN ( element ST_ANNOTATIONTEXTELEMENT, aposition INTEGER)  RETURN ST_ANNOTATIONTEXTELEMENT_ARRAY )
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."GridLineType583_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","GridNode" "GridNode587_COLL")NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOR_SRS"

AS OBJECT
(
   isReferenced        VARCHAR2(5),
   isRectified         VARCHAR2(5),
   isOrthoRectified    VARCHAR2(5),
   srid                NUMBER,
   spatialResolution   SDO_NUMBER_ARRAY,
   spatialTolerance    NUMBER,
   coordLocation       NUMBER,
   rowOff              NUMBER,
   columnOff           NUMBER,
   xOff                NUMBER,
   yOff                NUMBER,
   zOff                NUMBER,
   rowScale            NUMBER,
   columnScale         NUMBER,
   xScale              NUMBER,
   yScale              NUMBER,
   zScale              NUMBER,
   rowRMS              NUMBER,
   columnRMS           NUMBER,
   totalRMS            NUMBER,
   rowNumerator        SDO_NUMBER_ARRAY,
   rowDenominator      SDO_NUMBER_ARRAY,
   columnNumerator     SDO_NUMBER_ARRAY,
   columnDenominator   SDO_NUMBER_ARRAY)
 ALTER TYPE "MDSYS"."SDO_GEOR_SRS" ADD
    CONSTRUCTOR FUNCTION SDO_GEOR_SRS(SELF IN OUT NOCOPY SDO_GEOR_SRS)
    RETURN SELF AS RESULT
 ALTER TYPE "MDSYS"."SDO_GEOR_SRS" ADD attribute (
   xRMS                NUMBER,
   yRMS                NUMBER,
   zRMS                NUMBER,
   modelTotalRMS       NUMBER,
   GCPgeoreferenceModel SDO_GEOR_GCPGEOREFTYPE)
 ALTER TYPE "MDSYS"."SDO_GEOR_SRS" ADD
     CONSTRUCTOR FUNCTION SDO_GEOR_SRS(
   isReferenced        VARCHAR2,
   isRectified         VARCHAR2,
   isOrthoRectified    VARCHAR2,
   srid                NUMBER,
   spatialResolution   SDO_NUMBER_ARRAY,
   spatialTolerance    NUMBER,
   coordLocation       NUMBER,
   rowOff              NUMBER,
   columnOff           NUMBER,
   xOff                NUMBER,
   yOff                NUMBER,
   zOff                NUMBER,
   rowScale            NUMBER,
   columnScale         NUMBER,
   xScale              NUMBER,
   yScale              NUMBER,
   zScale              NUMBER,
   rowRMS              NUMBER,
   columnRMS           NUMBER,
   totalRMS            NUMBER,
   rowNumerator        SDO_NUMBER_ARRAY,
   rowDenominator      SDO_NUMBER_ARRAY,
   columnNumerator     SDO_NUMBER_ARRAY,
   columnDenominator   SDO_NUMBER_ARRAY)
   RETURN SELF AS RESULT
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SAMCLUST_IMP_T" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
d
45a 1ba
KIXBuOjXpnr6fh0ukLJHufDyFeEwg2MJNdxqfC9dbuqKf/fFFC943P/JhLJKpEKxecfCU169
9Juqdu9E5cMaYrxCO4hyil90APuduQjNToYvgfkAHGdEkx45fDCuK+Bwmw4EcXNZFumTpjRQ
pod52QcnjUhW8iHm/VYYn29x1qPDeRYAMD6IAVt78NapMn2S+1QyEeEMd0wsAUT0ke6RIgp7
q1jfl4ajOvg9ZcuQvuE9JkxH4fpO5w1rCvpP+1kc8CLhNYQ7nmCPuX4TEIPs/xPkYyMGLa91
J+CbFK+151lOSpvETiGj03GcWehMWmojxO2037eR3Ehx0tKJP9y3/NMQEXbrGrtUd259orvA
VVTmc7uX3o1sdM/a5etha5BhO7pnTOvsQjjJK/vcfmIHOs0yf1AkRHGOM1itH+mBME5E8oDO
Kg==
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOM_PATH_INFO_ELEM" as object (pathInfo mdsys.sdo_geom_path_info, pkcol varchar2(4000), tableName varchar2(61))
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_PC_BLK_TYPE"

    AS TABLE of MDSYS.SDO_PC_BLK
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_TIN_BLK_TYPE"

    AS TABLE of MDSYS.SDO_TIN_BLK
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_CURVE"
                                        UNDER ST_GEOMETRY (
  OVERRIDING MEMBER FUNCTION ST_Dimension RETURN Integer DETERMINISTIC,
  MEMBER FUNCTION ST_Points RETURN ST_Point_Array DETERMINISTIC,
  MEMBER FUNCTION ST_NumPoints RETURN INTEGER DETERMINISTIC,
  MEMBER FUNCTION ST_PointN(aposition INTEGER) RETURN ST_Point DETERMINISTIC,
  MEMBER FUNCTION ST_IsClosed RETURN Integer DETERMINISTIC,
  MEMBER FUNCTION ST_MidPointRep RETURN ST_Point_Array DETERMINISTIC,
  MEMBER FUNCTION ST_StartPoint RETURN ST_Point DETERMINISTIC,
  MEMBER FUNCTION ST_EndPoint RETURN ST_Point DETERMINISTIC,
  OVERRIDING MEMBER FUNCTION ST_IsSimple RETURN Integer DETERMINISTIC,
  MEMBER FUNCTION ST_IsRing RETURN Integer DETERMINISTIC,
  MEMBER FUNCTION ST_Length RETURN NUMBER DETERMINISTIC) NOT FINAL
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_MULTIPOINT"
                                       UNDER ST_GEOMCOLLECTION (
  CONSTRUCTOR FUNCTION ST_MULTIPOINT(apointarray ST_Point_Array) RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_MULTIPOINT(apointarray ST_Point_Array, asrid INTEGER) RETURN SELF AS RESULT,

  OVERRIDING MEMBER FUNCTION ST_Dimension RETURN Integer DETERMINISTIC,
  OVERRIDING MEMBER FUNCTION ST_IsSimple RETURN Integer DETERMINISTIC)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_MULTISURFACE"
                                       UNDER ST_GEOMCOLLECTION (
  CONSTRUCTOR FUNCTION ST_MULTISURFACE(asurfacearray ST_SURFACE_ARRAY)
   RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_MULTISURFACE(asurfacearray ST_SURFACE_ARRAY,
                  asrid INTEGER) RETURN SELF AS RESULT,

  OVERRIDING MEMBER FUNCTION ST_Dimension RETURN Integer DETERMINISTIC,
  MEMBER FUNCTION ST_PointOnSurface RETURN ST_Point DETERMINISTIC,
  MEMBER FUNCTION ST_Area RETURN NUMBER DETERMINISTIC) NOT FINAL
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_ANNOTATION_TEXT"

    AS OBJECT (
       PrivateEnvelope     SDO_GEOMETRY,
       PrivateElement_Array    ST_ANNOTATIONTEXTELEMENT_ARRAY,
       CONSTRUCTOR FUNCTION ST_ANNOTATION_TEXT(anTextArray ST_ANNOTATIONTEXTELEMENT_ARRAY ) RETURN SELF AS RESULT,
       MEMBER FUNCTION CONCAT (anText ST_ANNOTATION_TEXT)
             RETURN ST_ANNOTATION_TEXT,
      MEMBER FUNCTION Envelope RETURN SDO_GEOMETRY,
      MEMBER FUNCTION Element_Array RETURN ST_ANNOTATIONTEXTELEMENT_ARRAY)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."GridRow588_COLL" AS VARRAY(2147483647) OF "GridLineType583_T"
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."SDO_GEOM_PATH_INFO_LIST" as table of mdsys.sdo_geom_path_info_elem
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_CURVE_ARRAY"

AS VARRAY(1048576) OF ST_CURVE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_LINESTRING"

UNDER ST_CURVE (
  CONSTRUCTOR FUNCTION ST_LINESTRING(apointarray ST_Point_Array)
               RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_LINESTRING(apointarray ST_Point_Array, asrid INTEGER)
 RETURN SELF AS RESULT,
  OVERRIDING MEMBER FUNCTION ST_IsSimple RETURN Integer DETERMINISTIC,
  MEMBER FUNCTION ST_Points(apointarray ST_Point_Array) RETURN ST_LineString)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_CIRCULARSTRING"
                                       UNDER ST_CURVE (
  CONSTRUCTOR FUNCTION ST_CIRCULARSTRING(apointarray ST_Point_Array)
           RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_CIRCULARSTRING(apointarray ST_Point_Array,
            asrid INTEGER) RETURN SELF AS RESULT,

  MEMBER FUNCTION ST_Points(apointarray ST_Point_Array)
           RETURN ST_CircularString)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."GridDataType582_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","GridRow" "GridRow588_COLL")NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_CURVEPOLYGON"
                                       UNDER ST_SURFACE (
  CONSTRUCTOR FUNCTION ST_CURVEPOLYGON(acurve ST_CURVE) RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_CURVEPOLYGON(acurve ST_CURVE, acurvearray
    ST_CURVE_ARRAY) RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_CURVEPOLYGON(acurve ST_CURVE, asrid INTEGER)
              RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_CURVEPOLYGON(acurve ST_CURVE, acurvearray
             ST_CURVE_ARRAY, asrid INTEGER) RETURN SELF AS RESULT,
  MEMBER FUNCTION ST_ExteriorRing RETURN ST_Curve DETERMINISTIC,
  MEMBER FUNCTION ST_ExteriorRing(acurve ST_Curve)
            RETURN ST_CurvePolygon DETERMINISTIC,
  MEMBER FUNCTION ST_InteriorRings RETURN ST_Curve_Array DETERMINISTIC,
  MEMBER FUNCTION ST_InteriorRings(acurvearray ST_Curve_Array)
          RETURN ST_CurvePolygon DETERMINISTIC,
  MEMBER FUNCTION ST_NumInteriorRing RETURN INTEGER DETERMINISTIC,
  MEMBER FUNCTION ST_InteriorRingN(aposition INTEGER)
     RETURN ST_Curve DETERMINISTIC
--  MEMBER FUNCTION ST_CurvePolyToPoly RETURN ST_Polygon
) NOT FINAL
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_LINESTRING_ARRAY"

AS VARRAY(1048576) OF ST_LINESTRING
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_MULTICURVE"
                                       UNDER ST_GEOMCOLLECTION (
  CONSTRUCTOR FUNCTION ST_MULTICURVE(acurvearray ST_CURVE_ARRAY) RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_MULTICURVE(acurvearray ST_CURVE_ARRAY, asrid INTEGER) RETURN SELF AS RESULT,

  OVERRIDING MEMBER FUNCTION ST_Dimension RETURN Integer DETERMINISTIC,
  OVERRIDING MEMBER FUNCTION ST_IsSimple RETURN Integer DETERMINISTIC,
  MEMBER FUNCTION ST_Length RETURN NUMBER DETERMINISTIC,
  MEMBER FUNCTION ST_IsClosed RETURN Integer DETERMINISTIC) NOT FINAL
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_COMPOUNDCURVE"
                                       UNDER ST_CURVE (
  CONSTRUCTOR FUNCTION ST_COMPOUNDCURVE(acurve ST_CURVE) RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_COMPOUNDCURVE(acurvearray ST_CURVE_ARRAY)
           RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_COMPOUNDCURVE(acurve ST_CURVE, asrid INTEGER)
           RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_COMPOUNDCURVE(acurvearray ST_CURVE_ARRAY,
            asrid INTEGER) RETURN SELF AS RESULT,

  MEMBER FUNCTION ST_Curves RETURN ST_Curve_Array DETERMINISTIC,
  MEMBER FUNCTION ST_Curves(acurvearray ST_Curve_Array) RETURN ST_CompoundCurve,
  MEMBER FUNCTION ST_NumCurves RETURN INTEGER DETERMINISTIC,
  MEMBER FUNCTION ST_CurveN(aposition INTEGER) RETURN ST_Curve DETERMINISTIC)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."GridType594_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","GridProperties" "GridPropertiesType593_T","GridData" "GridDataType582_T","HierarchyParticipation" "HierarchyParticipation595_T")NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_POLYGON"

UNDER ST_CURVEPOLYGON (
  CONSTRUCTOR FUNCTION ST_POLYGON(alinestring ST_LineString)
       RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_POLYGON(alinestring ST_LineString,
      alinestringarray ST_LineString_Array) RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_POLYGON(alinestring ST_LineString, asrid INTEGER)
    RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_POLYGON(alinestring ST_LineString,
   alinestringarray ST_LineString_Array, asrid INTEGER) RETURN SELF AS RESULT,

  OVERRIDING MEMBER FUNCTION ST_ExteriorRing RETURN ST_LineString DETERMINISTIC,
  OVERRIDING MEMBER FUNCTION ST_ExteriorRing(acurve ST_Curve)
             RETURN ST_Polygon DETERMINISTIC,
  MEMBER FUNCTION ST_InteriorRingsP RETURN ST_LineString_Array DETERMINISTIC,
  MEMBER FUNCTION ST_InteriorRingsP(acurvearray ST_Curve_Array)
     RETURN ST_Polygon DETERMINISTIC,
  OVERRIDING MEMBER FUNCTION ST_InteriorRingN(aposition INTEGER)
             RETURN ST_LineString DETERMINISTIC,
  STATIC FUNCTION ST_BdPolyFromText(awkt CLOB) RETURN ST_Polygon DETERMINISTIC,
  STATIC FUNCTION ST_BdPolyFromText(awkt CLOB, asrid INTEGER)
        RETURN ST_Polygon DETERMINISTIC,
  STATIC FUNCTION ST_BdPolyFromWKB(awkb BLOB) RETURN ST_Polygon DETERMINISTIC,
  STATIC FUNCTION ST_BdPolyFromWKB(awkb BLOB, asrid INTEGER)
        RETURN ST_Polygon DETERMINISTIC)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_MULTILINESTRING"
                                       UNDER ST_MULTICURVE (
  CONSTRUCTOR FUNCTION ST_MULTILINESTRING(alinestringarray ST_LINESTRING_ARRAY)
          RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_MULTILINESTRING(alinestringarray ST_LINESTRING_ARRAY,
             asrid INTEGER) RETURN SELF AS RESULT)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."Grid597_T" UNDER "GridType594_T"("gridName" VARCHAR2(4000 CHAR),"id" VARCHAR2(4000 CHAR),"creation" TIMESTAMP,"update" TIMESTAMP)FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_POLYGON_ARRAY"

AS VARRAY(1048576) OF ST_POLYGON
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."Grid600_COLL" AS VARRAY(2147483647) OF "Grid597_T"
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."ST_MULTIPOLYGON"
                                       UNDER ST_MULTISURFACE (
  CONSTRUCTOR FUNCTION ST_MultiPolygon(apolygonarray ST_POLYGON_ARRAY)
           RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_MultiPolygon(apolygonarray ST_POLYGON_ARRAY,
            asrid INTEGER) RETURN SELF AS RESULT,

  STATIC FUNCTION ST_BdMPolyFromText(awkt CLOB)
           RETURN ST_MultiPolygon DETERMINISTIC,
  STATIC FUNCTION ST_BdMPolyFromText(awkt CLOB, asrid INTEGER)
           RETURN ST_MultiPolygon DETERMINISTIC,
  STATIC FUNCTION ST_BdMPolyFromWKB(awkb BLOB)
           RETURN ST_MultiPolygon DETERMINISTIC,
  STATIC FUNCTION ST_BdMPolyFromWKB(awkb BLOB, asrid INTEGER)
           RETURN ST_MultiPolygon DETERMINISTIC)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."Grids599_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","Grid" "Grid600_COLL")FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."GridFileType598_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","Grids" "Grids599_T")NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "MDSYS"."GridFile601_T" UNDER "GridFileType598_T"("creation" TIMESTAMP,"update" TIMESTAMP)FINAL INSTANTIABLE
/

