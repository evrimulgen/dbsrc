ALTER TABLE "XDB"."XDB$TTSET" ADD UNIQUE ("OBJ#")
  USING INDEX  ENABLE;

ALTER TABLE "XDB"."XDB$TTSET" ADD CONSTRAINT "XDB$TTSET_UNIQ" UNIQUE ("TOKSUF")
  USING INDEX  ENABLE;

ALTER TABLE "XDB"."XDB$H_LINK" ADD CONSTRAINT "XDB_PK_H_LINK" PRIMARY KEY ("PARENT_OID", "NAME")
  USING INDEX  ENABLE;

ALTER TABLE "XDB"."APP_USERS_AND_ROLES" ADD UNIQUE ("NAME")
  USING INDEX  ENABLE;

ALTER TABLE "XDB"."XDB$DBFS_VIRTUAL_FOLDER" ADD CONSTRAINT "SNGLEROW" UNIQUE ("HIDDEN_DEF")
  USING INDEX  ENABLE;

ALTER TABLE "XDB"."SYS_NT/ZrP7FfoSKngQ7ap6Ar7bw==" ADD PRIMARY KEY ("NESTED_TABLE_ID", "SYS_NC_ARRAY_INDEX$")
  USING INDEX  ENABLE;

ALTER TABLE "XDB"."XDB$CHECKOUTS" ADD CONSTRAINT "COKEY" PRIMARY KEY ("VCRUID", "WORKSPACEID")
  USING INDEX  ENABLE;

ALTER TABLE "XDB"."XDB$DXPTAB" ADD CONSTRAINT "XDB$DXPTABPK" PRIMARY KEY ("IDXOBJ#")
  USING INDEX  ENABLE;

ALTER TABLE "XDB"."XDB$XIDX_PART_TAB" ADD CONSTRAINT "XDB$XIDX_PART_TAB_PK" PRIMARY KEY ("IDXOBJ#", "PART_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "XDB"."XDB$XTAB" ADD CONSTRAINT "XDB$XTABPK" PRIMARY KEY ("IDXOBJ#", "GROUPNAME", "XMLTABOBJ#")
  USING INDEX  ENABLE;

ALTER TABLE "XDB"."XDB$STATS" ADD CONSTRAINT "STATS_PK" PRIMARY KEY ("XMLDATA"."RESOID")
  USING INDEX  ENABLE;
