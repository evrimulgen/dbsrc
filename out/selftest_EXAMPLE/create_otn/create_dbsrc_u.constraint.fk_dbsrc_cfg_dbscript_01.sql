ALTER TABLE "DBSRC_U"."DBSRC_CFG_DBSCRIPT" ADD CONSTRAINT "FK_DBSRC_CFG_DBSCRIPT_01" FOREIGN KEY ("CFG_NAME")
	  REFERENCES "DBSRC_U"."DBSRC_CFG" ("CFG_NAME") ENABLE;
