ALTER TABLE "DBSRC_U"."DBSRC" ADD CONSTRAINT "CK_DBSRC_01" CHECK (
    dbscript_include_flag in ('Y', 'N')) ENABLE;

