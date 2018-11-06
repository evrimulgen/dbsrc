CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$LINK_T" AS OBJECT
(
    parent_oid    raw(16),
    child_oid     raw(16),
    name          varchar2(256),
    flags         raw(4),
    link_sn       raw(16),
    child_acloid  raw(16),
    child_ownerid raw(16),
    parent_rids   raw(2000)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$XMLTYPE_REF_LIST_T"
                                       as varray(2147483647) of ref sys.xmltype;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$QNAME"
as object
(
    prefix_code     raw(4), /* Index into schema extras */
    name            varchar2(2000)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$STRING_LIST_T"
as VARRAY(2147483647) of varchar2(4000);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$RAW_LIST_T"
as varray(2147483647) of raw(2000);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$ENUM_T"
as object
(
    value       raw(1),

member function lookupValue RETURN VARCHAR2,
       pragma restrict_references (lookupValue, wnds, wnps, rnps, rnds),
member procedure setValue(val IN VARCHAR2),
       pragma restrict_references (setValue, wnds, wnps, rnps, rnds)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$ENUM2_T"
as object
(
    value       raw(2),

member function lookupValue RETURN VARCHAR2,
       pragma restrict_references (lookupValue, wnds, wnps, rnps, rnds),
member procedure setValue(val IN VARCHAR2),
       pragma restrict_references (setValue, wnds, wnps, rnps, rnds)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$ENUM_VALUES_T"
as VARRAY(1000) of varchar2(1024);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$DERIVATIONCHOICE"
                                       as object
(
    value       raw(2),

member function lookupValue RETURN VARCHAR2,
       pragma restrict_references (lookupValue, wnds, wnps, rnps, rnds),
member procedure setValue(val IN VARCHAR2),
       pragma restrict_references (setValue, wnds, wnps, rnps, rnds)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$FORMCHOICE"
as object
(
    value       raw(1),

member function lookupValue RETURN VARCHAR2,
       pragma restrict_references (lookupValue, wnds, wnps, rnps, rnds),
member procedure setValue(val IN VARCHAR2),
       pragma restrict_references (setValue, wnds, wnps, rnps, rnds)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$WHITESPACECHOICE" as object
(
    value       raw(1),

member function lookupValue RETURN VARCHAR2,
       pragma restrict_references (lookupValue, wnds, wnps, rnps, rnds),
member procedure setValue(val IN VARCHAR2),
       pragma restrict_references (setValue, wnds, wnps, rnps, rnds)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$JAVATYPE"
as object
(
    value       raw(2),

member function lookupValue RETURN VARCHAR2,
       pragma restrict_references (lookupValue, wnds, wnps, rnps, rnds),
member procedure setValue(val IN VARCHAR2),
       pragma restrict_references (setValue, wnds, wnps, rnps, rnds)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$USECHOICE"
as object
(
    value       raw(1),

member function lookupValue RETURN VARCHAR2,
       pragma restrict_references (lookupValue, wnds, wnps, rnps, rnds),
member procedure setValue(val IN VARCHAR2),
       pragma restrict_references (setValue, wnds, wnps, rnps, rnds)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$PROCESSCHOICE" as object
(
    value       raw(1),

member function lookupValue RETURN VARCHAR2,
       pragma restrict_references (lookupValue, wnds, wnps, rnps, rnds),
member procedure setValue(val IN VARCHAR2),
       pragma restrict_references (setValue, wnds, wnps, rnps, rnds)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$TRANSIENTCHOICE" as object
(
    value       raw(1),

member function lookupValue RETURN VARCHAR2,
       pragma restrict_references (lookupValue, wnds, wnps, rnps, rnds),
member procedure setValue(val IN VARCHAR2),
       pragma restrict_references (setValue, wnds, wnps, rnps, rnds)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$EXTRA_LIST_T" as varray(65535) of varchar2(2000);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$NLOCKS_T"
 AS OBJECT
(
    PARENT_OID  RAW(16),
    CHILD_NAME  VARCHAR2(256),
    RAWTOKEN    RAW(18)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$PREDECESSOR_LIST_T" AS varray(1000) of raw(16);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$OID_LIST_T" AS varray(65535) of raw(16);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB_PRIVILEGES"
as varray(1000) of VARCHAR2(200)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."LOCKTOKENLISTTYPE" as varray(2147483647) of VARCHAR2(128)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."DBMS_XMLSCHEMA_TABMD" as OBJECT (
        schema_name varchar2(700),
	element_name varchar2(30),
	table_name varchar2(30),
	table_oid raw(16)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."DBMS_XMLSCHEMA_RESMD" as OBJECT (
        path_name varchar2(4000),
	path_oid raw(16)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDBPI_IM"
   authid definer as object(
  notused    RAW(4),


  static function ODCIGetInterfaces (ilist OUT sys.ODCIObjectList) return number,

  static function ODCIIndexCreate(ia sys.odciindexinfo, parms varchar2,
      env sys.odcienv)  return number,

  static function ODCIIndexDrop(ia sys.odciindexinfo, env sys.ODCIEnv)
    return number,

  STATIC FUNCTION ODCIIndexTruncate(ia sys.odciindexinfo, env sys.ODCIEnv)
    RETURN NUMBER,

  static function ODCIIndexInsert(ia sys.odciindexinfo, rid varchar2,
        newval sys.xmltype, env sys.ODCIEnv) return number,

  static function ODCIIndexDelete(ia sys.odciindexinfo, rid varchar2,
    oldval sys.xmltype, env sys.ODCIEnv) return number,

  static function ODCIIndexUpdate(ia sys.odciindexinfo, rid varchar2,
    oldval sys.xmltype, newval sys.xmltype, env sys.ODCIEnv)
    return number,

  static function ODCIIndexStart(sctx IN OUT xdb.xdbpi_im,
      ia sys.odciindexinfo, op sys.odcipredinfo, qi sys.odciqueryinfo,
      strt number, stop number, pathstr varchar2, env sys.odcienv)
      return number,

  member function ODCIIndexFetch(nrows number, rids OUT sys.odciridlist,
     env sys.odcienv) return number,

  member function ODCIIndexClose (env sys.odcienv) return number
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."PATH_LINKINFO" wrapped
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
79 aa
g0V6zG8egE2xYLkdFQIyNY27Wowwg5n0dLhcFlpW+uNy+kfZ/0cM2cHAdCulv5vAMsvuJY8J
aee4dAhpqal8xsoXKMbK77KEHe+2RC9eXltNFTFq68aVcrOxlKEC9yaI5jWpC8gKD1o0nbBt
5sgLU0BrWBucGx2mqUqkyQ==
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDBHI_IM" wrapped
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
b6a 353
lDJslGdXRJYMNHRBXxviC442370wg80r2tAFfHS5bg81aF2m1PuxJmdJ6cnglGFdWsMctzcG
QBlQ7SSdieQnBsZsv4j2ykvpJSz60E+O677mzk6STrG6czMSRMp6Q8UdKTvpLg2/ETVXfBMs
Fj7upkkCp/XhvNhXG5o8KcVUocjxS4GKXmDW+hqDqD4uEcTmUdailJfzBK6P/7mtNiEOrzQ5
bV07Oc3ZsoOTWmOCeqFtrHzMUVsYyWPEGwLytCWvNVRYmfgqTDU0aSyScD+HalwiVFkWnrng
f08lLS0eoJnq29gulIIyXF8efje5cEkD6OwmgasQKkCHG+bepx3XDrqnLq6m0nQRehyi8w9X
jUQtaNQCaD0sb1fac/SrWfcAIZ1kZQgx5HhSwP71tK9qUjjHYSN6ARMX+UPlK0N88SklLj26
1W2TC2gKGVP+EXKzg+5Xwnfqi+P7RelAlENz5dOJx4pGVxkxp3l1wGnn7U7gB8o1bdPuPjOj
xhlBDmn91YqtYfaziCBsPFsCxuwAYoXMUuklpUL1UUveiAJ4yiwMTGI7IH1KQjRUfCZY8axf
spASrUbF9zkJF3PoGNL/kv7FZQAeKKKwslUQR2fgcLxDqqWf/6f4OOdE/KRDaiPk8oJ67z1D
IcY3ei1gYQMCxOuKLTwp7zbkynP/2b9WtC1psMuLBdKSmw9L0JSKgDJU4DBBUO5voYv0YYt9
Iy6l+rnRIoe0L7xxRWGntQnmUIlW4Oi60C0B6fXAEWMpS7To13lAnLQPg2jik7JV6NfNg4HL
Bb8JYpmGL/HQLR8PP1YStbjEZ0xdjxzTKx67D/nhjaAlYw==
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."ChildName6_COLL" AS VARRAY(2147483647) OF VARCHAR2(4000 CHAR)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XMLINDEXMETHODS"

  authid current_user as object
(
  -- cursor set by IndexStart and used in IndexFetch
  scanctx RAW(8),

  -- DCLs
  static function ODCIGetInterfaces (ilist OUT sys.ODCIObjectList)
         return NUMBER,

  -- DDLs
  static function ODCIIndexCreate   (idxinfo  sys.ODCIIndexInfo,
                                     idxparms VARCHAR2,
                                     idxenv   sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_CREATE" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       idxinfo, idxinfo  INDICATOR struct,
       idxparms,idxparms INDICATOR,
       idxenv,  idxenv   INDICATOR struct,
       RETURN OCINumber),

  static function ODCIIndexDrop     (idxinfo sys.ODCIIndexInfo,
                                     idxenv  sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_DROP" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       idxinfo, idxinfo INDICATOR struct,
       idxenv,  idxenv  INDICATOR struct,
       RETURN OCINumber),

  static function ODCIIndexAlter    (idxinfo          sys.ODCIIndexInfo,
                                     idxparms  IN OUT VARCHAR2,
                                     opt              NUMBER,
                                     idxenv           sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_ALTER" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       idxinfo, idxinfo  INDICATOR struct,
       idxparms,idxparms INDICATOR,
       opt,     opt      INDICATOR,
       idxenv,  idxenv   INDICATOR struct,
       RETURN OCINumber),

  static function ODCIIndexTruncate (idxinfo sys.ODCIIndexInfo,
                                     idxenv  sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_TRUNC" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       idxinfo, idxinfo INDICATOR struct,
       idxenv,  idxenv  INDICATOR struct,
       RETURN OCINumber),

  --- DMLs ---
  static function ODCIIndexInsert (idxinfo sys.ODCIIndexInfo,
                                   rid     VARCHAR2,
                                   doc     sys.xmltype,
                                   idxenv  sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_INSERT" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       idxinfo, idxinfo INDICATOR struct,
       rid,     rid     INDICATOR,
       doc,     doc     INDICATOR,
       idxenv,  idxenv  INDICATOR struct,
       RETURN OCINumber),

  static function ODCIIndexDelete (idxinfo sys.ODCIIndexInfo,
                                   rid     VARCHAR2,
                                   doc     sys.xmltype,
                                   idxenv  sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_DELETE" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       idxinfo, idxinfo INDICATOR struct,
       rid,     rid     INDICATOR,
       doc,     doc     INDICATOR,
       idxenv,  idxenv  INDICATOR struct,
       RETURN OCINumber),

  static function ODCIIndexUpdate (idxinfo sys.ODCIIndexInfo,
                                   rid     VARCHAR2,
                                   olddoc  sys.xmltype,
                                   newdoc  sys.xmltype,
                                   idxenv  sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_UPDATE" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       idxinfo, idxinfo INDICATOR struct,
       rid,     rid     INDICATOR,
       olddoc,  olddoc  INDICATOR,
       newdoc,  newdoc  INDICATOR,
       idxenv,  idxenv  INDICATOR struct,
       RETURN OCINumber),

  --- Query ---
  static function ODCIIndexStart (ictx    IN OUT "XDB"."XMLINDEXMETHODS" ,
                                  idxinfo        sys.ODCIIndexInfo,
                                  opi            sys.ODCIPredInfo,
                                  oqi            sys.ODCIQueryInfo,
                                  strt           NUMBER,
                                  stop           NUMBER,
                                  pathstr        varchar2,
                                  idxenv         sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_START" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       ictx,    ictx    INDICATOR struct,
       idxinfo, idxinfo INDICATOR struct,
       opi,     opi     INDICATOR struct,
       oqi,     oqi     INDICATOR struct,
       strt,    strt    INDICATOR,
       stop,    stop    INDICATOR,
       pathstr, pathstr LENGTH,
       idxenv,  idxenv  INDICATOR struct,
       return OCINumber),

  member function ODCIIndexFetch (nrows      NUMBER,
                                  rids   OUT sys.ODCIRidList,
                                  idxenv     sys.ODCIEnv)
         return  NUMBER
  is language C name "QMIX_FETCH" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       self,     self INDICATOR struct,
       nrows,   nrows INDICATOR,
       rids,     rids INDICATOR,
       idxenv, idxenv INDICATOR struct,
       return OCINumber),

  member function ODCIIndexClose (idxenv sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_CLOSE" LIBRARY XDB.XMLINDEX_LIB
     with context parameters (
       context,
       self,     self INDICATOR struct,
       idxenv, idxenv INDICATOR struct,
       return OCINumber),

  static function ODCIIndexExchangePartition (idxPinfo sys.ODCIIndexInfo,
                                              idxTinfo sys.ODCIIndexInfo,
                                              idxenv   sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_EXCHANGE" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       idxPinfo, idxPinfo INDICATOR struct,
       idxTinfo, idxTinfo INDICATOR struct,
       idxenv,   idxenv   INDICATOR struct,
       RETURN OCINumber),

  static function ODCIIndexUpdPartMetadata(ixdxinfo sys.ODCIIndexInfo,
                                           palist   sys.ODCIPartInfoList,
                                           idxenv   sys.ODCIEnv)
         return NUMBER,

--- MOVE / TRANSPORTABLE TBS / IM/EXPORT ---
  static function ODCIIndexGetMetadata(idxinfo  IN  sys.ODCIIndexInfo,
                                       expver   IN  VARCHAR2,
                                       newblock OUT number,
                                       idxenv   IN  sys.ODCIEnv)
         return VARCHAR2,

  -- path table and secondary indexes on it are already exported in schema-mode
  -- this routine should only expose them for Transportable Tablespaces,
  -- via DataPump

  static FUNCTION ODCIIndexUtilGetTableNames(ia IN sys.ODCIIndexInfo,
                                      read_only IN PLS_INTEGER,
                                      version IN varchar2,
                                      context OUT PLS_INTEGER)
  RETURN BOOLEAN,

/*
  static function ODCIIndexUtilGetTableNames(idxinfo   IN sys.ODCIIndexInfo,
                                             read_only IN PLS_INTEGER,
                                             version   IN varchar2,
                                             ctx       OUT PLS_INTEGER)
         return BOOLEAN
  is language C name "QMIX_GETTABNAMES" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       idxinfo,  idxinfo   INDICATOR struct,
       read_only,read_only INDICATOR,
       version,  version   INDICATOR,
       ctx,      ctx       INDICATOR,
       RETURN INDICATOR sb4),
*/
  static PROCEDURE ODCIIndexUtilCleanup (context  IN PLS_INTEGER)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XMLIDXSTATSMETHODS"

  authid current_user as object
(
  -- user-defined function cost and selectivity functions
  cost number,

  -- DCLs
  static function ODCIGetInterfaces (ilist OUT sys.ODCIObjectList)
         return NUMBER,

  --- STATISTICs ---
  static function ODCIStatsTableFunction(funcInfo IN  sys.ODCIFuncInfo,
                                         tfStats  OUT sys.ODCITabFuncStats,
                                         args     IN  sys.ODCIArgDescList)
         return NUMBER
  is language C name "QMIX_TABFUN_STATS" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       funcInfo, funcInfo INDICATOR struct,
       tfStats,  tfStats  INDICATOR struct,
       args,     args     INDICATOR,
       return OCINumber),

  static function ODCIStatsCollect(colinfo   sys.ODCIColInfo,
                                   options   sys.ODCIStatsOptions,
                                   stats OUT RAW,
                                   idxenv    sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_COL_STATS" LIBRARY XDB.XMLINDEX_LIB
     with context parameters (
       context,
       colinfo, colinfo INDICATOR struct,
       options, options INDICATOR struct,
       stats,   stats   INDICATOR, stats LENGTH,
       idxenv,  idxenv  INDICATOR struct,
       return OCINumber),

  static function ODCIStatsCollect(idxinfo   sys.ODCIIndexInfo,
                                   options   sys.ODCIStatsOptions,
                                   stats OUT RAW,
                                   idxenv    sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_IDX_STATS" LIBRARY XDB.XMLINDEX_LIB
     with context parameters (
       context,
       idxinfo, idxinfo INDICATOR struct,
       options, options INDICATOR struct,
       stats,   stats   INDICATOR, stats LENGTH,
       idxenv,  idxenv  INDICATOR struct,
       return OCINumber),

  static function ODCIStatsDelete(colinfo   sys.ODCIColInfo,
                                  statistics OUT RAW,
                                  idxenv    sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_DEL_COLSTATS" LIBRARY XDB.XMLINDEX_LIB
     with context parameters (
       context,
       colinfo,    colinfo    INDICATOR struct,
       statistics, statistics INDICATOR, statistics LENGTH,
       idxenv,     idxenv     INDICATOR struct,
       return OCINumber),

  static function ODCIStatsDelete(idxinfo   sys.ODCIIndexInfo,
                                  statistics OUT RAW,
                                  idxenv    sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_DEL_IDXSTATS" LIBRARY XDB.XMLINDEX_LIB
     with context parameters (
       context,
       idxinfo,    idxinfo    INDICATOR struct,
       statistics, statistics INDICATOR, statistics LENGTH,
       idxenv,     idxenv     INDICATOR struct,
       return OCINumber),

  static function ODCIStatsSelectivity(predinfo sys.ODCIPredInfo,
                                       sel  OUT number,
                                       args     sys.ODCIArgDescList,
                                       strt     number,
                                       stop     number,
                                       expr     VARCHAR2,
                                       datai    VARCHAR2,
                                       idxenv   sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_SELECTIVITY" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       predinfo,predinfo INDICATOR struct,
       sel,     sel      INDICATOR,
       args,    args     INDICATOR,
       strt,    strt     INDICATOR,
       stop,    stop     INDICATOR,
       expr,    expr     INDICATOR,
       datai,   datai    INDICATOR,
       idxenv,  idxenv   INDICATOR struct,
       return OCINumber),

  static function ODCIStatsFunctionCost(funcinfo sys.ODCIFuncInfo,
                                        cost OUT sys.ODCICost,
                                        args     sys.ODCIArgDescList,
                                        expr     VARCHAR2,
                                        datai    VARCHAR2,
                                        idxenv   sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_FUN_COST" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       funcinfo,funcinfo INDICATOR struct,
       cost,    cost     INDICATOR struct,
       args,    args     INDICATOR,
       expr,    expr     INDICATOR,
       datai,   datai    INDICATOR,
       idxenv,  idxenv   INDICATOR struct,
       return OCINumber),

  static function ODCIStatsIndexCost(idxinfo  sys.ODCIIndexInfo,
                                     sel      number,
                                     cost OUT sys.ODCICost,
                                     qi       sys.ODCIQueryInfo,
                                     pred     sys.ODCIPredInfo,
                                     args     sys.ODCIArgDescList,
                                     strt     number,
                                     stop     number,
                                     datai    varchar2,
                                     idxenv   sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_IDX_COST" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       idxinfo, idxinfo INDICATOR struct,
       sel,     sel     INDICATOR,
       cost,    cost    INDICATOR struct,
       qi,      qi      INDICATOR struct,
       pred,    pred    INDICATOR struct,
       args,    args    INDICATOR,
       strt,    strt    INDICATOR,
       stop,    stop    INDICATOR,
       datai,   datai   INDICATOR,
       idxenv,  idxenv  INDICATOR struct,
       return OCINumber),

  static function ODCIStatsExchangePartition(idxinfo sys.ODCIIndexInfo,
                                             tabinfo sys.ODCIIndexInfo,
                                             idxenv  sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_EXCHANGE_STATS" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       idxinfo, idxinfo INDICATOR struct,
       tabinfo, tabinfo INDICATOR struct,
       idxenv,  idxenv  INDICATOR struct,
       return OCINumber),

  static function ODCIStatsUpdPartStatistics(idxinfo sys.ODCIIndexInfo,
                                             palist  sys.ODCIPartInfoList,
                                             idxenv  sys.ODCIEnv)
         return NUMBER
  is language C name "QMIX_UPD_PARTSTATS" library XDB.XMLINDEX_LIB
     with context
     parameters (
       context,
       idxinfo, idxinfo INDICATOR struct,
       palist,  palist  INDICATOR,
       idxenv,  idxenv  INDICATOR struct,
       return OCINumber)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XMLINDEXLOAD_T" as object
(
  RID    VARCHAR2(18),
  PID    RAW(8),
  OK     RAW(1000),
  LOC    RAW(2000),
  VALUE  VARCHAR2(4000)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."FUNCSTATS"

authid definer as object
(
  -- user-defined function cost and selectivity functions
  j number,

  static function ODCIGetInterfaces(ifclist OUT sys.ODCIObjectList)
    return number,

  -- function to collect index statistics
  static function ODCIStatsCollect(ia sys.ODCIIndexInfo,
                                   options sys.ODCIStatsOptions,
                                   statistics OUT RAW,
                                   env sys.ODCIEnv)
  return number
  is language C
  name "STATSCOLL_XDBHI"
  library XDB.RESOURCE_VIEW_LIB
  with context
  parameters (
    context,
    ia,
    ia INDICATOR STRUCT,
    options,
    options INDICATOR STRUCT,
    statistics,
    statistics INDICATOR,
    statistics LENGTH,
    env,
    env INDICATOR STRUCT,
    return OCINumber),

  -- funtion to delete index statistics
  static function ODCIStatsDelete(ia sys.ODCIIndexInfo,
                                  statistics OUT RAW,
                                  env sys.ODCIEnv)
  return number
  is language C
  name "STATSDEL_XDBHI"
  library XDB.RESOURCE_VIEW_LIB
  with context
  parameters (
    context,
    ia,
    ia INDICATOR STRUCT,
    statistics,
    statistics INDICATOR,
    statistics LENGTH,
    env,
    env INDICATOR STRUCT,
    return OCINumber),

  -- index cost
  static function ODCIStatsIndexCost(ia sys.ODCIIndexInfo,
                                     sel number,
                                     cost OUT sys.ODCICost,
                                     qi sys.ODCIQueryInfo,
                                     pred sys.ODCIPredInfo,
                                     args sys.ODCIArgDescList,
                                     strt number,
                                     stop number,
                                     depth number,
                                     valarg varchar2,
                                     env sys.ODCIenv)
  return number
  is language C
  name "STATSINDCOST_XDBHI"
  library XDB.RESOURCE_VIEW_LIB
  with context
  parameters (
    context,
    ia,
    ia INDICATOR STRUCT,
    sel,
    sel INDICATOR,
    cost,
    cost INDICATOR STRUCT,
    qi,
    qi INDICATOR STRUCT,
    pred,
    pred INDICATOR STRUCT,
    args,
    args INDICATOR,
    strt,
    strt INDICATOR,
    stop,
    stop INDICATOR,
    depth,
    depth INDICATOR,
    valarg,
    valarg INDICATOR,
    env,
    env INDICATOR STRUCT,
    return OCINumber),

  static function ODCIStatsIndexCost(ia sys.ODCIIndexInfo,
                                     sel number,
                                     cost OUT sys.ODCICost,
                                     qi sys.ODCIQueryInfo,
                                     pred sys.ODCIPredInfo,
                                     args sys.ODCIArgDescList,
                                     strt number,
                                     stop number,
                                     valarg varchar2,
                                     env sys.ODCIenv)
  return number
  is language C
  name "STATSINDCOST1_XDBHI"
  library XDB.RESOURCE_VIEW_LIB
  with context
  parameters (
    context,
    ia,
    ia INDICATOR STRUCT,
    sel,
    sel INDICATOR,
    cost,
    cost INDICATOR STRUCT,
    qi,
    qi INDICATOR STRUCT,
    pred,
    pred INDICATOR STRUCT,
    args,
    args INDICATOR,
    strt,
    strt INDICATOR,
    stop,
    stop INDICATOR,
    valarg,
    valarg INDICATOR,
    env,
    env INDICATOR STRUCT,
    return OCINumber),

  -- function cost

  static function ODCIStatsFunctionCost(func sys.ODCIFuncInfo,
                                        cost OUT sys.ODCICost,
                                        args sys.ODCIArgDescList,
                                        colval xmltype,
                                        depth number,
                                        valarg varchar2,
                                        env  sys.ODCIEnv)
  return number
  is language C
  name "STATSFUNCCOST_XDBHI"
  library XDB.RESOURCE_VIEW_LIB
  with context
  parameters (
    context,
    func,
    func INDICATOR STRUCT,
    cost,
    cost INDICATOR STRUCT,
    args,
    args INDICATOR,
    colval,
    colval INDICATOR,
    depth,
    depth INDICATOR,
    valarg,
    valarg INDICATOR,
    env,
    env INDICATOR STRUCT,
    return OCINumber),

  static function ODCIStatsFunctionCost(func sys.ODCIFuncInfo,
                                        cost OUT sys.ODCICost,
                                        args sys.ODCIArgDescList,
                                        colval xmltype,
                                        valarg varchar2,
                                        env  sys.ODCIEnv)
  return number
  is language C
  name "STATSFUNCCOST1_XDBHI"
  library XDB.RESOURCE_VIEW_LIB
  with context
  parameters (
    context,
    func,
    func INDICATOR STRUCT,
    cost,
    cost INDICATOR STRUCT,
    args,
    args INDICATOR,
    colval,
    colval INDICATOR,
    valarg,
    valarg INDICATOR,
    env,
    env INDICATOR STRUCT,
    return OCINumber),

   static function ODCIStatsSelectivity(pred sys.ODCIPredInfo,
                                        sel OUT number,
                                        args sys.ODCIArgDescList,
                                        strt number,
                                        stop number,
                                        colval xmltype,
                                        depth number,
                                        valarg varchar2,
                                       env sys.ODCIenv)
  return number
  is language C
  name "STATSSEL_XDBHI"
  library XDB.RESOURCE_VIEW_LIB
  with context
  parameters (
    context,
    pred,
    pred INDICATOR STRUCT,
    sel,
    sel INDICATOR,
    args,
    args INDICATOR,
    strt,
    strt INDICATOR,
    stop,
    stop INDICATOR,
    colval,
    colval INDICATOR,
    depth,
    depth INDICATOR,
    valarg,
    valarg INDICATOR,
    env,
    env INDICATOR STRUCT,
    return OCINumber),

 -- selectivity for under_path_func1
  static function ODCIStatsSelectivity(pred sys.ODCIPredInfo,
                                       sel OUT number,
                                       args sys.ODCIArgDescList,
                                       strt number,
                                       stop number,
                                       colval xmltype,
                                       valarg varchar2,
                                       env sys.ODCIenv)
  return number
  is language C
  name "STATSSEL1_XDBHI"
  library XDB.RESOURCE_VIEW_LIB
  with context
  parameters (
    context,
    pred,
    pred INDICATOR STRUCT,
    sel,
    sel INDICATOR,
    args,
    args INDICATOR,
    strt,
    strt INDICATOR,
    stop,
    stop INDICATOR,
    colval,
    colval INDICATOR,
    valarg,
    valarg INDICATOR,
    env,
    env INDICATOR STRUCT,
    return OCINumber)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XMLTYPE_REF_TABLE_T" IS TABLE of REF XMLTYPE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$APPINFO_T"
as object
(
  sys_xdbpd$      xdb.xdb$raw_list_t,
  anypart         varchar2(4000),
  source          varchar2(4000)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$DOCUMENTATION_T" as object
(
  sys_xdbpd$      xdb.xdb$raw_list_t,
  anypart         varchar2(4000),
  source          varchar2(4000),
  lang            varchar2(4000)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$RCLIST_T" AS OBJECT
(
  OID    XDB$OID_LIST_T
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."DBMS_XMLSCHEMA_TABMDARR" AS VARRAY(65536) OF xdb.DBMS_XMLSCHEMA_TABMD;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."DBMS_XMLSCHEMA_RESMDARR" AS VARRAY(65536) OF xdb.DBMS_XMLSCHEMA_RESMD;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."PATH_ARRAY"
as varray(32000) of xdb.path_linkinfo
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB_LINK_TYPE" AS OBJECT ("SYS_XDBPD$" "XDB$RAW_LIST_T","ParentName" VARCHAR2(256 CHAR),"ChildName" VARCHAR2(1024 CHAR),"Name" VARCHAR2(256 CHAR),"Flags" RAW(4),"ParentOid" RAW(16),"ChildOid" RAW(16),"LinkType" "XDB$ENUM_T")FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."ListingTyp5_T" AS OBJECT ("SYS_XDBPD$" "XDB$RAW_LIST_T","name" VARCHAR2(4000 CHAR),"size" NUMBER(38),"ChildName" "ChildName6_COLL")NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XMLINDEXTAB_T" as TABLE of XDB.XMLIndexLoad_t
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."ContainerStats17_T" AS OBJECT ("SYS_XDBPD$" "XDB$RAW_LIST_T","RESOID" RAW(32),"TotalRows" NUMBER,"TotalContainers" NUMBER,"FanOut" NUMBER(38),"ImmediateContainers" NUMBER(38),"LastAnalyzedDate" TIMESTAMP)FINAL INSTANTIABLE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$APPINFO_LIST_T" as varray(1000) of xdb.xdb$appinfo_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$DOCUMENTATION_LIST_T"
  as varray(1000) of xdb.xdb$documentation_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$RESOURCE_T" as object
(
  VERSIONID           INTEGER,
  CREATIONDATE        TIMESTAMP,
  MODIFICATIONDATE    TIMESTAMP,
  AUTHOR              VARCHAR2(128),
  DISPNAME            VARCHAR2(128),
  RESCOMMENT          VARCHAR2(128),
  LANGUAGE            VARCHAR2(128),
  CHARSET             VARCHAR2(128),
  CONTYPE             VARCHAR2(128),
  REFCOUNT            RAW(4),
  LOCKS               RAW(2000),
  ACLOID              RAW(16),
  OWNERID             RAW(16),
  CREATORID           RAW(16),
  LASTMODIFIERID      RAW(16),
  ELNUM               INTEGER,
  SCHOID              RAW(16),
  XMLREF              REF SYS.XMLTYPE,
  XMLLOB              BLOB,
  FLAGS               RAW(4),
  RESEXTRA            CLOB,
  ACTIVITYID          INTEGER,
  VCRUID              RAW(16),
  PARENTS             XDB.XDB$PREDECESSOR_LIST_T,
  SBRESEXTRA          XDB.XDB$XMLTYPE_REF_LIST_T,
  SNAPSHOT            RAW(6),
  ATTRCOPY            BLOB,
  CTSCOPY             BLOB,
  NODENUM             RAW(6),
  SIZEONDISK          INTEGER,
  RCLIST              XDB.XDB$RCLIST_T,
  CHECKEDOUTBYID      RAW(16),
  BASEVERSION         RAW(16)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XMLINDEXLOAD_IMP_T"
  authid current_user as object
(
  key RAW(8),

  static function ODCITableStart(sctx IN OUT XDB.XMLIndexLoad_Imp_t)
         return PLS_INTEGER
    is language C name "QMIX_INSSTART" library XDB.XMLINDEX_LIB
    with context
    parameters (
      context,
      sctx,        sctx        INDICATOR STRUCT,
      return INT
    ),

  static function ODCITableStart(sctx IN OUT XDB.XMLIndexLoad_Imp_t,
                                 load_cursor SYS_REFCURSOR,
                                 flags IN Number)
         return PLS_INTEGER
    is language C name "QMIX_LOADSTART" library XDB.XMLINDEX_LIB
    with context
    parameters (
      context,
      sctx,        sctx        INDICATOR STRUCT,
      load_cursor, load_cursor INDICATOR,
      flags,
      return INT
    ),

  member function ODCITableFetch(self IN OUT XDB.XMLIndexLoad_Imp_t,
                                 nrows    IN Number,
                                 xmlrws  OUT XDB.XMLIndexTab_t)
         return PLS_INTEGER
    as language C name "QMIX_LOADFETCH" library XDB.XMLINDEX_LIB
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT,
      nrows,
      xmlrws OCIColl, xmlrws INDICATOR sb2, xmlrws DURATION OCIDuration,
      return INT
    ),

  member function ODCITableClose(self IN XDB.XMLIndexLoad_Imp_t)
         return PLS_INTEGER
    as language C name "QMIX_LOADCLOSE" library XDB.XMLINDEX_LIB
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT,
      return INT
    )
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$ANNOTATION_T" as object
(
  sys_xdbpd$      xdb.xdb$raw_list_t,
  appinfo         xdb.xdb$appinfo_list_t,
  documentation   xdb.xdb$documentation_list_t
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$ANNOTATION_LIST_T" as
   varray(65535) of xdb.xdb$annotation_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$FACET_T"
as object                 /* String Facet */
(
   sys_xdbpd$       xdb.xdb$raw_list_t,
   annotation       xdb.xdb$annotation_t,
   value            varchar2(2000),
   fixed            raw(1),
   id               varchar2(256)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$NUMFACET_T"
as object              /* Number Facet */
(
    sys_xdbpd$      xdb.xdb$raw_list_t,
    annotation      xdb.xdb$annotation_t,
    value           integer,
    fixed           raw(1),
    id              varchar2(256)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$TIMEFACET_T" as object               /* Time Facet */
(
    sys_xdbpd$      xdb.xdb$raw_list_t,
    annotation      xdb.xdb$annotation_t,
    value           date,
    fixed           raw(1),
    id              varchar2(256)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$WHITESPACE_T" as object        /* Whitespace facet */
(
    sys_xdbpd$  xdb.xdb$raw_list_t,
    annotation  xdb.xdb$annotation_t,
    value       xdb.xdb$whitespaceChoice,
    fixed       raw(1),
    id          varchar2(256)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$NOTATION_T"

as object
(
  sys_xdbpd$      xdb.xdb$raw_list_t,
  annotation      xdb.xdb$annotation_t,
  name            varchar2(2000),                    /* name of the notation */
  publicval       varchar2(4000),
  system          varchar2(4000)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$XPATHSPEC_T"

as object
(
  sys_xdbpd$      xdb.xdb$raw_list_t,
  annotation      xdb.xdb$annotation_t,
  xpath           varchar2(4000)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$LIST_T" as
object
(
    sys_xdbpd$      xdb.xdb$raw_list_t,
    annotation      xdb.xdb$annotation_t,
    item_type       xdb.xdb$qname,                               /* item of list */
    type_ref        ref sys.xmltype,          /* LATER - ref to list item type */
    simple_type     ref sys.xmltype            /* locally declared simple type */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$UNION_T" as
object
(
    sys_xdbpd$         xdb.xdb$raw_list_t,
    annotation      xdb.xdb$annotation_t,
    member_types       varchar2(4000),                 /* members of union */
    simple_types       xdb.xdb$xmltype_ref_list_t,       /* local simple types */

    /* LATER - refs to all constituents of the union type */
    type_refs          xdb.xdb$xmltype_ref_list_t
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$GROUP_DEF_T" as object
(
    sys_xdbpd$      xdb.xdb$raw_list_t,
    parent_schema   ref sys.xmltype,
    name            varchar2(2000),                /* name of the group */
    /*
     * only one of the foll. can be non-null
     */
    all_kid         ref sys.xmltype,
    choice_kid      ref sys.xmltype,
    sequence_kid    ref sys.xmltype,

    annotation      xdb.xdb$annotation_t,
    id              varchar2(256)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$GROUP_REF_T" as object
(
    sys_xdbpd$      xdb.xdb$raw_list_t,
    parent_schema   ref sys.xmltype,
    min_occurs      integer,
    max_occurs      varchar2(20), /* in string format incl. "unbounded" */

    groupref_name   xdb.xdb$qname,       /* name of the group being referenced */
    groupref_ref    ref sys.xmltype,   /* REF of the group being referenced */

    annotation      xdb.xdb$annotation_t,
    id              varchar2(256)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$ATTRGROUP_DEF_T" as object
(
    sys_xdbpd$      xdb.xdb$raw_list_t,
    parent_schema   ref sys.xmltype,
    name            varchar2(2000),               /* name of the attr group */

    attributes      xdb.xdb$xmltype_ref_list_t,  /* list of attrs within group */
    any_attrs       xdb.xdb$xmltype_ref_list_t,  /* list of anyAttribute decls. */
    attr_groups     xdb.xdb$xmltype_ref_list_t,          /* list of attr groups */

    annotation      xdb.xdb$annotation_t,
    id              varchar2(256)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$ATTRGROUP_REF_T" as object
(
    sys_xdbpd$      xdb.xdb$raw_list_t,
    parent_schema   ref sys.xmltype,

    attrgroup_name  xdb.xdb$qname,   /* name of the attribute group being ref-ed */
    attrgroup_ref   ref sys.xmltype,   /* ref of the attr group being ref-ed */

    annotation      xdb.xdb$annotation_t,
    id              varchar2(256)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$MODEL_T" as
object
(
    sys_xdbpd$      xdb.xdb$raw_list_t,
    parent_schema   ref sys.xmltype,
    min_occurs      integer,
    max_occurs      varchar2(20), /* in string format incl. "unbounded" */

    elements        xdb.xdb$xmltype_ref_list_t,
    choice_kids     xdb.xdb$xmltype_ref_list_t,
    sequence_kids   xdb.xdb$xmltype_ref_list_t,
    anys            xdb.xdb$xmltype_ref_list_t,
    groups          xdb.xdb$xmltype_ref_list_t,

    annotation      xdb.xdb$annotation_t,
    id              varchar2(256)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$COMPLEX_DERIVATION_T" as object
(
    sys_xdbpd$      xdb.xdb$raw_list_t,
    base            xdb.xdb$qname,

    attributes      xdb.xdb$xmltype_ref_list_t,
    any_attrs       xdb.xdb$xmltype_ref_list_t,
    attr_groups     xdb.xdb$xmltype_ref_list_t,

    /*
     * only one of the foll. can be non-null
     */
    all_kid         ref sys.xmltype,
    choice_kid      ref sys.xmltype,
    sequence_kid    ref sys.xmltype,
    group_kid       ref sys.xmltype,

    annotation      xdb.xdb$annotation_t,
    id              varchar2(256)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$SIMPLECONT_EXT_T" as object
(
    sys_xdbpd$      xdb.xdb$raw_list_t,
    base            xdb.xdb$qname,
    id              varchar2(256),

    attributes      xdb.xdb$xmltype_ref_list_t,
    any_attrs       xdb.xdb$xmltype_ref_list_t,
    attr_groups     xdb.xdb$xmltype_ref_list_t,
    annotation      xdb.xdb$annotation_t
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$PROPERTY_T"

AS OBJECT
(
    sys_xdbpd$      xdb.xdb$raw_list_t,
    parent_schema   ref sys.xmltype,
    prop_number     integer,
    /* Note that name does not need to be a QName since its namespace
    must always equal the target namespace for the schema */
    name            varchar2(256),
    typename        xdb.xdb$qname,
    mem_byte_length raw(2),       /* buffer size--NULL for variable size*/
    mem_type_code   raw(2),
    system          raw(1),
    mutable         raw(1),
    form            xdb.xdb$formChoice,          /* form choice - qualified/not */
    sqlname         varchar2(30),
    sqltype         varchar2(30),
    sqlschema       varchar2(30),
    java_type       xdb.xdb$javatype,
    default_value   varchar2(4000),
    smpl_type_decl  ref sys.xmltype,          /* Locally declared type */
    type_ref        ref sys.xmltype,          /* Globally declared type */
    /* The following two fields are relevant if the attr/element is defined
     * by a ref to a global attr/element
     */
    propref_name    xdb.xdb$qname,               /* name of global attr/element */
    propref_ref     ref sys.xmltype,           /* REF of global attr/element */
    attr_use        xdb.xdb$useChoice,             /* only applicable for attrs */
    fixed_value     varchar2(2000),
    global          raw(1),     /* TRUE for global attr/element declarations */
    annotation      xdb.xdb$annotation_t,
    sqlcolltype     varchar2(30),                   /* collection type name */
    sqlcollschema   varchar2(30),
    hidden          raw(1),
    transient       xdb.xdb$transientChoice,    /* = none/generated/manifested ? */
    id              varchar2(256),
    baseprop        raw(1) /* are there generated props based on this prop ? */
)
 alter type     "XDB"."XDB$PROPERTY_T" modify attribute
(sqlname         varchar2(128),
 sqltype         varchar2(128),
 sqlschema       varchar2(128),
 sqlcolltype     varchar2(128),
 sqlcollschema   varchar2(128)
) cascade
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$INCLUDE_T"
as object
(
    sys_xdbpd$          xdb.xdb$raw_list_t,
    schema_location     varchar2(700),
    annotation          xdb.xdb$annotation_t,
    id                  varchar2(256)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$IMPORT_T"
as object
(
    sys_xdbpd$          xdb.xdb$raw_list_t,
    namespace           varchar2(700),
    schema_location     varchar2(700),
    annotation          xdb.xdb$annotation_t,
    id                  varchar2(256)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$FACET_LIST_T" as
VARRAY(65535) of xdb.xdb$facet_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$NOTATION_LIST_T"

as varray(1000) of xdb.xdb$notation_t
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$XPATHSPEC_LIST_T"

as varray(1000) of xdb.xdb$xpathspec_t
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$CONTENT_T"
as object
(
    sys_xdbpd$      xdb.xdb$raw_list_t,
    mixed           raw(1),

    /* only one of the foll. can be non-null */
    restriction     xdb.xdb$complex_derivation_t,
    extension       xdb.xdb$complex_derivation_t,

    annotation      xdb.xdb$annotation_t,
    id              varchar2(256)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$ANY_T" as object
(
  property         xdb.xdb$property_t,
  namespace        varchar2(2000),
  process_contents xdb.xdb$processChoice,
  min_occurs       integer,
  max_occurs       varchar2(20)   /* in string format incl. "unbounded" */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$INCLUDE_LIST_T" as varray(65535) of xdb.xdb$include_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$IMPORT_LIST_T" as varray(65535) of xdb.xdb$import_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$KEYBASE_T"

as object
(
  sys_xdbpd$      xdb.xdb$raw_list_t,
  annotation      xdb.xdb$annotation_t,
  name            varchar2(1000),               /* name of unique/key/keyref */
  refer           xdb.xdb$qname,             /* applicable ONLY for "keyref" */
  selector        xdb.xdb$xpathspec_t,
  fields          xdb.xdb$xpathspec_list_t
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$SIMPLE_DERIVATION_T" AS OBJECT
(
    sys_xdbpd$      xdb.xdb$raw_list_t,
    base_type       ref sys.xmltype,
    base            xdb.xdb$qname,
    lcl_smpl_decl   ref sys.xmltype,        /* locally declared simple type */

    /* Facets */
    fractiondigits  xdb.xdb$numfacet_t,
    totaldigits     xdb.xdb$numfacet_t,
    minlength       xdb.xdb$numfacet_t,
    maxlength       xdb.xdb$numfacet_t,
    length          xdb.xdb$numfacet_t,
    whitespace      xdb.xdb$whitespace_t,
    period          xdb.xdb$timefacet_t,
    duration        xdb.xdb$timefacet_t,
    min_inclusive   xdb.xdb$facet_t,
    max_inclusive   xdb.xdb$facet_t,
    min_exclusive   xdb.xdb$facet_t,
    max_exclusive   xdb.xdb$facet_t,
    pattern         xdb.xdb$facet_list_t,
    enumeration     xdb.xdb$facet_list_t,
    annotation      xdb.xdb$annotation_t,
    id              varchar2(256)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$SIMPLECONT_RES_T" AS OBJECT
(
    sys_xdbpd$      xdb.xdb$raw_list_t,
    base            xdb.xdb$qname,
    id              varchar2(256),
    lcl_smpl_decl   ref sys.xmltype,        /* locally declared simple type */
    attributes      xdb.xdb$xmltype_ref_list_t,
    any_attrs       xdb.xdb$xmltype_ref_list_t,
    attr_groups     xdb.xdb$xmltype_ref_list_t,
    annotation      xdb.xdb$annotation_t,

    /* Facets */
    fractiondigits  xdb.xdb$numfacet_t,
    totaldigits     xdb.xdb$numfacet_t,
    minlength       xdb.xdb$numfacet_t,
    maxlength       xdb.xdb$numfacet_t,
    whitespace      xdb.xdb$whitespace_t,
    period          xdb.xdb$timefacet_t,
    duration        xdb.xdb$timefacet_t,
    min_inclusive   xdb.xdb$facet_t,
    max_inclusive   xdb.xdb$facet_t,
    pattern         xdb.xdb$facet_list_t,
    enumeration     xdb.xdb$facet_list_t,
    min_exclusive   xdb.xdb$facet_t,
    max_exclusive   xdb.xdb$facet_t,
    length          xdb.xdb$numfacet_t
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$SCHEMA_T"
as object
(
    schema_url          varchar2(700), /* Maximum key length for an index*/
    target_namespace    varchar2(2000),
    version             varchar2(4000),
    num_props           integer, /* Total # of properties */
    final_default       xdb.xdb$derivationChoice,
    block_default       xdb.xdb$derivationChoice,
    element_form_dflt   xdb.xdb$formChoice,
    attribute_form_dflt xdb.xdb$formChoice,
    elements            xdb.xdb$xmltype_ref_list_t,
    simple_type         xdb.xdb$xmltype_ref_list_t,
    complex_types       xdb.xdb$xmltype_ref_list_t,
    attributes          xdb.xdb$xmltype_ref_list_t,
    imports             xdb.xdb$import_list_t,
    includes            xdb.xdb$include_list_t,
    flags               raw(4),
    sys_xdbpd$          xdb.xdb$raw_list_t,
    annotations         xdb.xdb$annotation_list_t,
    map_to_nchar        raw(1),   /* map strings to NCHAR/NVARCHAR2/NCLOB ? */
    map_to_lob          raw(1),           /* map unbounded strings to LOB ? */
    groups              xdb.xdb$xmltype_ref_list_t,
    attrgroups          xdb.xdb$xmltype_ref_list_t,
    id                  varchar2(256),
    varray_as_tab       raw(1),     /* should varrays be stored as tables ? */
    schema_owner        varchar2(30),
    notations           xdb.xdb$notation_list_t,
    lang                varchar2(4000)
)
 alter type     "XDB"."XDB$SCHEMA_T" modify attribute
(schema_owner varchar2(128)) cascade
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$KEYBASE_LIST_T"

as varray(1000) of xdb.xdb$keybase_t
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$SIMPLE_T"

AS OBJECT
(
    sys_xdbpd$      xdb.xdb$raw_list_t,
    parent_schema   ref sys.xmltype,
    /* Note that name does not need to be a QName since its namespace
    must always equal the target namespace for the schema */
    name            varchar2(256),
    abstract        raw(1),   /* boolean, obsoleted */
    /* Only one of the foll. fields is non-null */
    restriction     xdb.xdb$simple_derivation_t,
    list_type       xdb.xdb$list_t,
    union_type      xdb.xdb$union_t,

    annotation      xdb.xdb$annotation_t,
    id              varchar2(256),
    final_info      xdb.xdb$derivationChoice,
    typeid          integer,
    sqltype         varchar2(30)
)
 alter type     "XDB"."XDB$SIMPLE_T" modify attribute sqltype varchar2(128) cascade
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$SIMPLECONTENT_T"
as object
(
    sys_xdbpd$      xdb.xdb$raw_list_t,

    /* only one of the foll. can be non-null */
    restriction     xdb.xdb$simplecont_res_t,
    extension       xdb.xdb$simplecont_ext_t,

    annotation      xdb.xdb$annotation_t,
    id              varchar2(256)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$COMPLEX_T"

AS OBJECT
(
    sys_xdbpd$      xdb.xdb$raw_list_t,
    parent_schema   ref sys.xmltype,
    base_type       ref sys.xmltype,      /* applicable for derived types */
    name            varchar2(256),
    abstract        raw(1),
    mixed           raw(1),
    final_info      xdb.xdb$derivationChoice,
    block           xdb.xdb$derivationChoice,

    attributes      xdb.xdb$xmltype_ref_list_t,
    any_attrs       xdb.xdb$xmltype_ref_list_t,
    attr_groups     xdb.xdb$xmltype_ref_list_t,

    /*
     * only one of the foll. can be non-null, else all have to be null.
     */
    all_kid         ref sys.xmltype,
    choice_kid      ref sys.xmltype,
    sequence_kid    ref sys.xmltype,
    group_kid       ref sys.xmltype,

    complexcontent  xdb.xdb$content_t,

    annotation      xdb.xdb$annotation_t,

    sqltype         varchar2(30),                 /* Name of corr. SQL type */
    sqlschema       varchar2(30),     /* Name of schema containing SQL type */
    maintain_dom    raw(1),
    subtype_refs    xdb.xdb$xmltype_ref_list_t,     /* List of refs to subtypes */
    id              varchar2(256),
    simplecont      xdb.xdb$simplecontent_t,
    typeid          integer
)
 alter type     "XDB"."XDB$COMPLEX_T" modify attribute
(sqltype varchar2(128), sqlschema varchar2(128)) cascade
/

CREATE OR REPLACE NONEDITIONABLE TYPE "XDB"."XDB$ELEMENT_T"
as object
(
    property        xdb.xdb$property_t,
    subs_group      xdb.xdb$qname,
    num_cols        integer,
    nillable        raw(1),
    final_info      xdb.xdb$derivationChoice,
    block           xdb.xdb$derivationChoice,
    abstract        raw(1),
/* XDB extensions */
    mem_inline      raw(1),
    sql_inline      raw(1),
    java_inline     raw(1),
    maintain_dom    raw(1),
    default_table   varchar2(30),
    default_table_schema   varchar2(30),
    table_props     varchar2(2000),              /* table properties string */
    java_classname  varchar2(2000),
    bean_classname  varchar2(2000),
    base_sqlname    varchar2(61),
    cplx_type_decl  ref sys.xmltype,
    subs_group_refs xdb.xdb$xmltype_ref_list_t, /* REFs to all elements for which
                                             * this is the head element
                                             */
    default_xsl     varchar2(2000),     /* URL of default XSL to be applied */
    min_occurs      integer,
    max_occurs      varchar2(20),     /* in string format incl. "unbounded" */
    is_folder       raw(1),
    maintain_order  raw(1),
    col_props       varchar2(2000),             /* column properties string */
    default_acl     varchar2(2000),                   /* URL of default ACL */
    head_elem_ref  ref sys.xmltype,    /* REF to head element of subs. group */
    uniques        xdb.xdb$keybase_list_t,
    keys           xdb.xdb$keybase_list_t,
    keyrefs        xdb.xdb$keybase_list_t,
    is_translatable raw(1),                  /* Is this element translatable */
    xdb_max_occurs  varchar2(20)                            /* xdb:maxOccurs */
)
 alter type     "XDB"."XDB$ELEMENT_T" modify attribute
(default_table          varchar2(128),
 default_table_schema   varchar2(128)
) cascade
/

