CREATE UNIQUE INDEX "DBSRC_U"."PK_DBSRC_CFG" ON "DBSRC_U"."DBSRC_CFG" ("CFG_NAME")
  ;

CREATE UNIQUE INDEX "DBSRC_U"."PK_DBSRC_CFG_POST_PRCS_01" ON "DBSRC_U"."DBSRC_CFG_POST_PRCS" ("CFG_NAME", "ORDER_NO")
  ;

CREATE UNIQUE INDEX "DBSRC_U"."UK_DBSRC_CFG_FILTER_01" ON "DBSRC_U"."DBSRC_CFG_FILTER" ("CFG_NAME", "FILTER_NAME", "FILTER_VALUE", "OBJECT_TYPE_PATH")
  ;

CREATE UNIQUE INDEX "DBSRC_U"."UK_DBSRC_CFG_TRANSFORM_01" ON "DBSRC_U"."DBSRC_CFG_TRANSFORM" ("CFG_NAME", "TRANSFORM_NAME", "TRANSFORM_VALUE", "OBJECT_TYPE_PATH")
  ;

CREATE UNIQUE INDEX "DBSRC_U"."PK_DBSRC_CFG_DBSCRIPT" ON "DBSRC_U"."DBSRC_CFG_DBSCRIPT" ("CFG_NAME", "DDL_TYPE")
  ;

CREATE UNIQUE INDEX "DBSRC_U"."PK_DBSRC" ON "DBSRC_U"."DBSRC" ("DBSRC_SET_NO", "CFG_NAME", "ORDER_NO")
  ;

CREATE INDEX "DBSRC_U"."X_DBSRC_01" ON "DBSRC_U"."DBSRC" ("DBSCRIPT_INCLUDE_FLAG")
   LOCAL
 (PARTITION "P_FIRST" ) ;

CREATE INDEX "DBSRC_U"."X_DBSRC_02" ON "DBSRC_U"."DBSRC" ("CFG_NAME")
   LOCAL
 (PARTITION "P_FIRST" ) ;

CREATE INDEX "DBSRC_U"."X_DBSRC_03" ON "DBSRC_U"."DBSRC" ("DDL_TYPE", "OBJECT_NAME")
   LOCAL
 (PARTITION "P_FIRST" ) ;

CREATE INDEX "DBSRC_U"."X_DBSRC_04" ON "DBSRC_U"."DBSRC" ("ORDER_NO")
   LOCAL
 (PARTITION "P_FIRST" ) ;

