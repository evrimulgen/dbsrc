ALTER TABLE "DBSRC_U"."DBSRC_CFG_POST_PRCS" ADD CONSTRAINT "FK_DBSRC_CFG_POST_PRCS_01" FOREIGN KEY ("CFG_NAME")
	  REFERENCES "DBSRC_U"."DBSRC_CFG" ("CFG_NAME") ENABLE;

