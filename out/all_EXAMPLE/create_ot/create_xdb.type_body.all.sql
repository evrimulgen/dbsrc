CREATE OR REPLACE NONEDITIONABLE TYPE BODY "XDB"."XDBPI_IM"
is
  static function ODCIGetInterfaces(ilist OUT sys.ODCIObjectList)
    return number is
  begin
    ilist := sys.ODCIObjectList(sys.ODCIObject('SYS', 'ODCIINDEX2'));
    return ODCICONST.SUCCESS;
  end ODCIGetInterfaces;

  static function ODCIIndexCreate(ia sys.odciindexinfo, parms varchar2,
    env sys.ODCIEnv) return number as
  begin
    return ODCICONST.SUCCESS;
  end ODCIIndexCreate;

  static function ODCIIndexDrop(ia sys.odciindexinfo, env sys.ODCIEnv)
    return number
  is
  begin
    -- drop all the rows in the resource_view
    -- The drop is handled via the trigger xdb_pi_trig
    return ODCICONST.SUCCESS;
  end ODCIIndexDrop;

  STATIC FUNCTION ODCIIndexTruncate(ia sys.odciindexinfo, env sys.ODCIEnv)
    RETURN NUMBER
  is
  begin
    -- drop all the rows in the resource_view
    -- The truncate is handled via the trigger xdb_pi_trig
    return ODCICONST.SUCCESS;
  end ODCIIndexTruncate;

  static function ODCIIndexInsert(ia sys.ODCIIndexInfo, rid varchar2,
    newval sys.xmltype, env sys.ODCIEnv) return number
  is
  begin
    return ODCICONST.SUCCESS;
  end ODCIIndexInsert;

  static function ODCIIndexDelete(ia sys.ODCIIndexInfo, rid varchar2,
    oldval sys.xmltype, env sys.ODCIEnv) return number
  is
  begin
    -- For delete/update a trigger will be created per table when the table is
    -- enabled for hierarchy. The name of the trigger: <table_name>_XDB_PITRIG
    -- This is done is prvtxdbz.sql
    return ODCICONST.SUCCESS;
  end ODCIIndexDelete;

  static function ODCIIndexUpdate(ia sys.ODCIIndexInfo, rid varchar2,
    oldval sys.xmltype, newval sys.xmltype, env sys.ODCIEnv)
    return number
  is
  begin
    return ODCICONST.SUCCESS;
  end ODCIIndexUpdate;

  static function ODCIIndexStart(sctx IN OUT xdb.xdbpi_im,
      ia sys.odciindexinfo, op sys.odcipredinfo, qi sys.odciqueryinfo,
      strt number, stop number, pathstr varchar2, env sys.odcienv)
      return number
  is
  begin
    return ODCICONST.SUCCESS;
  end ODCIIndexStart;

  member function ODCIIndexFetch(nrows number, rids OUT sys.odciridlist,
     env sys.odcienv) return number
  is
  begin
    return ODCICONST.SUCCESS;
  end ODCIIndexFetch;

  member function ODCIIndexClose (env sys.odcienv) return number
  is
  begin
    return ODCICONST.SUCCESS;
  end ODCIIndexClose;

end;
/

CREATE OR REPLACE NONEDITIONABLE TYPE BODY "XDB"."XDBHI_IM" wrapped
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
e
598 1ea
vzxqgyC6VezCpDAswhivE4aANskwg2O3ACDWfC9A2k7VSB0UiagLzFvGvBrq8/0xgOxZ9+XL
11DtJJ35yFHIpmuytm47Ek8HAzpQZthfe91ywcaxKTCS/4U1OY9UfKFUv6NliLJgoYPKt8mg
9qizlHfIC3yk1tpT6VR4CniJdpcBEftw99oKNb8FlKNa8OpTqJCnXgfBnDc56Z3DXfnaZMoo
bCWe/tk0Vh7ZyEtm8J80uJDSz9HYUSvEXTLfBh/9DG2sLcpS6BgBJfZeNdWKPK/cVDrFisIY
Ok2/wTv57TTCb7E8A2uWuOj36YY9G/QQnwTDLM+b9ADQ6PChoWNFXKR1wrgQVTHof1Kjw5Pr
SjD/Z06UI34EqKrsyKCE2e9fp3c95yG8u6K2/rnEsvjZVFXaroRvA0TTGZBPX7JKh6lB5p54
8JKMhMPOsDVRE999o2yLiF+eR4hH3e6q21bMsViWPK6dE6XJSg==
/

CREATE OR REPLACE NONEDITIONABLE TYPE BODY "XDB"."FUNCSTATS" is
   static function ODCIGetInterfaces(ifclist OUT sys.ODCIObjectList)
       return number is
   begin
       ifclist := sys.ODCIObjectList(sys.ODCIObject('SYS','ODCISTATS2'));
       return ODCIConst.Success;
   end ODCIGetInterfaces;

end;
/

CREATE OR REPLACE NONEDITIONABLE TYPE BODY "XDB"."XMLINDEXMETHODS"
is
  static function ODCIGetInterfaces(ilist OUT sys.ODCIObjectList)
    return number is
  begin
    ilist := sys.ODCIObjectList(sys.ODCIObject('SYS','ODCIINDEX2'));
    return ODCICONST.SUCCESS;
  end ODCIGetInterfaces;

  static function ODCIIndexUpdPartMetadata(ixdxinfo sys.ODCIIndexInfo,
                                           palist   sys.ODCIPartInfoList,
                                           idxenv   sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_UPD_PARTMETA" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       ixdxinfo, ixdxinfo INDICATOR struct,
       palist,  palist  INDICATOR,
       idxenv,  idxenv  INDICATOR struct,
       RETURN OCINumber);

  static function ODCIIndexGetMetadata(idxinfo  IN  sys.ODCIIndexInfo,
                                       expver   IN  VARCHAR2,
                                       newblock OUT number,
                                       idxenv   IN  sys.ODCIEnv)
         return VARCHAR2
  is
  begin
    return XDB.ximetadata_pkg.getIndexMetadata(idxinfo, expver, newblock, idxenv);
  end ODCIIndexGetMetadata;

  -- path table and secondary indexes on it are already exported in schema-mode
  -- this routine should only expose them for Transportable Tablespaces,
  -- via DataPump
  static function ODCIIndexUtilGetTableNames(ia IN sys.ODCIIndexInfo,
                                             read_only IN PLS_INTEGER,
                                             version IN varchar2,
                                             context OUT PLS_INTEGER)
         return BOOLEAN
  is
  begin
    return XDB.ximetadata_pkg.utlgettablenames(ia);
  end ODCIIndexUtilGetTableNames;

  static procedure ODCIIndexUtilCleanup (context  PLS_INTEGER)
  is
  begin
    -- dummy routine
    return;
  end ODCIIndexUtilCleanup;

end;
/

CREATE OR REPLACE NONEDITIONABLE TYPE BODY "XDB"."XMLIDXSTATSMETHODS"
is
  static function ODCIGetInterfaces(ilist OUT sys.ODCIObjectList)
    return number is
  begin
    ilist := sys.ODCIObjectList(sys.ODCIObject('SYS','ODCISTATS2'));
    return ODCICONST.SUCCESS;
  end ODCIGetInterfaces;
end;
/

CREATE OR REPLACE NONEDITIONABLE TYPE BODY "XDB"."XDBPI_IM"
is
  static function ODCIGetInterfaces(ilist OUT sys.ODCIObjectList)
    return number is
  begin
    ilist := sys.ODCIObjectList(sys.ODCIObject('SYS', 'ODCIINDEX2'));
    return ODCICONST.SUCCESS;
  end ODCIGetInterfaces;

  static function ODCIIndexCreate(ia sys.odciindexinfo, parms varchar2,
    env sys.ODCIEnv) return number as
  begin
    return ODCICONST.SUCCESS;
  end ODCIIndexCreate;

  static function ODCIIndexDrop(ia sys.odciindexinfo, env sys.ODCIEnv)
    return number
  is
  begin
    -- drop all the rows in the resource_view
    -- The drop is handled via the trigger xdb_pi_trig
    return ODCICONST.SUCCESS;
  end ODCIIndexDrop;

  STATIC FUNCTION ODCIIndexTruncate(ia sys.odciindexinfo, env sys.ODCIEnv)
    RETURN NUMBER
  is
  begin
    -- drop all the rows in the resource_view
    -- The truncate is handled via the trigger xdb_pi_trig
    return ODCICONST.SUCCESS;
  end ODCIIndexTruncate;

  static function ODCIIndexInsert(ia sys.ODCIIndexInfo, rid varchar2,
    newval sys.xmltype, env sys.ODCIEnv) return number
  is
  begin
    return ODCICONST.SUCCESS;
  end ODCIIndexInsert;

  static function ODCIIndexDelete(ia sys.ODCIIndexInfo, rid varchar2,
    oldval sys.xmltype, env sys.ODCIEnv) return number
  is
  begin
    -- For delete/update a trigger will be created per table when the table is
    -- enabled for hierarchy. The name of the trigger: <table_name>_XDB_PITRIG
    -- This is done is prvtxdbz.sql
    return ODCICONST.SUCCESS;
  end ODCIIndexDelete;

  static function ODCIIndexUpdate(ia sys.ODCIIndexInfo, rid varchar2,
    oldval sys.xmltype, newval sys.xmltype, env sys.ODCIEnv)
    return number
  is
  begin
    return ODCICONST.SUCCESS;
  end ODCIIndexUpdate;

  static function ODCIIndexStart(sctx IN OUT xdb.xdbpi_im,
      ia sys.odciindexinfo, op sys.odcipredinfo, qi sys.odciqueryinfo,
      strt number, stop number, pathstr varchar2, env sys.odcienv)
      return number
  is
  begin
    return ODCICONST.SUCCESS;
  end ODCIIndexStart;

  member function ODCIIndexFetch(nrows number, rids OUT sys.odciridlist,
     env sys.odcienv) return number
  is
  begin
    return ODCICONST.SUCCESS;
  end ODCIIndexFetch;

  member function ODCIIndexClose (env sys.odcienv) return number
  is
  begin
    return ODCICONST.SUCCESS;
  end ODCIIndexClose;

end;
/

CREATE OR REPLACE NONEDITIONABLE TYPE BODY "XDB"."XDBHI_IM" wrapped
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
e
598 1ea
vzxqgyC6VezCpDAswhivE4aANskwg2O3ACDWfC9A2k7VSB0UiagLzFvGvBrq8/0xgOxZ9+XL
11DtJJ35yFHIpmuytm47Ek8HAzpQZthfe91ywcaxKTCS/4U1OY9UfKFUv6NliLJgoYPKt8mg
9qizlHfIC3yk1tpT6VR4CniJdpcBEftw99oKNb8FlKNa8OpTqJCnXgfBnDc56Z3DXfnaZMoo
bCWe/tk0Vh7ZyEtm8J80uJDSz9HYUSvEXTLfBh/9DG2sLcpS6BgBJfZeNdWKPK/cVDrFisIY
Ok2/wTv57TTCb7E8A2uWuOj36YY9G/QQnwTDLM+b9ADQ6PChoWNFXKR1wrgQVTHof1Kjw5Pr
SjD/Z06UI34EqKrsyKCE2e9fp3c95yG8u6K2/rnEsvjZVFXaroRvA0TTGZBPX7JKh6lB5p54
8JKMhMPOsDVRE999o2yLiF+eR4hH3e6q21bMsViWPK6dE6XJSg==
/

CREATE OR REPLACE NONEDITIONABLE TYPE BODY "XDB"."XMLINDEXMETHODS"
is
  static function ODCIGetInterfaces(ilist OUT sys.ODCIObjectList)
    return number is
  begin
    ilist := sys.ODCIObjectList(sys.ODCIObject('SYS','ODCIINDEX2'));
    return ODCICONST.SUCCESS;
  end ODCIGetInterfaces;

  static function ODCIIndexUpdPartMetadata(ixdxinfo sys.ODCIIndexInfo,
                                           palist   sys.ODCIPartInfoList,
                                           idxenv   sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_UPD_PARTMETA" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       ixdxinfo, ixdxinfo INDICATOR struct,
       palist,  palist  INDICATOR,
       idxenv,  idxenv  INDICATOR struct,
       RETURN OCINumber);

  static function ODCIIndexGetMetadata(idxinfo  IN  sys.ODCIIndexInfo,
                                       expver   IN  VARCHAR2,
                                       newblock OUT number,
                                       idxenv   IN  sys.ODCIEnv)
         return VARCHAR2
  is
  begin
    return XDB.ximetadata_pkg.getIndexMetadata(idxinfo, expver, newblock, idxenv);
  end ODCIIndexGetMetadata;

  -- path table and secondary indexes on it are already exported in schema-mode
  -- this routine should only expose them for Transportable Tablespaces,
  -- via DataPump
  static function ODCIIndexUtilGetTableNames(ia IN sys.ODCIIndexInfo,
                                             read_only IN PLS_INTEGER,
                                             version IN varchar2,
                                             context OUT PLS_INTEGER)
         return BOOLEAN
  is
  begin
    return XDB.ximetadata_pkg.utlgettablenames(ia);
  end ODCIIndexUtilGetTableNames;

  static procedure ODCIIndexUtilCleanup (context  PLS_INTEGER)
  is
  begin
    -- dummy routine
    return;
  end ODCIIndexUtilCleanup;

end;
/

CREATE OR REPLACE NONEDITIONABLE TYPE BODY "XDB"."XMLIDXSTATSMETHODS"
is
  static function ODCIGetInterfaces(ilist OUT sys.ODCIObjectList)
    return number is
  begin
    ilist := sys.ODCIObjectList(sys.ODCIObject('SYS','ODCISTATS2'));
    return ODCICONST.SUCCESS;
  end ODCIGetInterfaces;
end;
/

CREATE OR REPLACE NONEDITIONABLE TYPE BODY "XDB"."FUNCSTATS" is
   static function ODCIGetInterfaces(ifclist OUT sys.ODCIObjectList)
       return number is
   begin
       ifclist := sys.ODCIObjectList(sys.ODCIObject('SYS','ODCISTATS2'));
       return ODCIConst.Success;
   end ODCIGetInterfaces;

end;
/

