ALTER TABLE "DBSRC_U"."DBSRC" ADD CONSTRAINT "FK_DBSRC_01" FOREIGN KEY ("CFG_NAME", "DDL_TYPE")
	  REFERENCES "DBSRC_U"."DBSRC_CFG_DBSCRIPT" ("CFG_NAME", "DDL_TYPE") DISABLE;

