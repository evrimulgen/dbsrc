CREATE USER "XDB" IDENTIFIED BY VALUES 'S:F195C02BB0C2FDED4B94EB977CC6E3B9C3C232325C0F9255C12077F40655;H:F1B9BB1E7ED6B7F53646120CC22B4788;T:651BCDAD7D0D45F3CF52D5273A9A03FF2F7977D4BC74A4F3DE2BC1D732E5AF545CC50516A2E385CA5C489BDDE2A5AF31A01193D47E250D85C3BCC79DB1CAE1AD32453C84D15A2692E9D1C06DD01654C9;FD6C945857807E3C'
      DEFAULT TABLESPACE "SYSAUX"
      TEMPORARY TABLESPACE "TEMP"
      PASSWORD EXPIRE
      ACCOUNT LOCK;

ALTER USER "XDB" DEFAULT ROLE ALL;
CREATE SEQUENCE  "XDB"."STATEID_RESTART_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "XDB"."CLIENTID_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "XDB"."XDB$NAMESUFF_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 641 CACHE 20 NOORDER  CYCLE  NOPARTITION ;
CREATE SEQUENCE  "XDB"."XDB$TYPEID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 160 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "XDB"."XDB$PROPNUM_SEQ"  MINVALUE 3986 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4026 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
GRANT SELECT ON "XDB"."XDB$NAMESUFF_SEQ" TO PUBLIC;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."DBMS_XDBTRANS_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."XMLSCHEMA_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."DBMSXSCHLSB_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."PATH_INDEX_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."SECURITY_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."DBMS_XDBZ_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."DBMS_XSLPROCESSOR_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."DBMS_XMLDOM_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."DBMS_XMLPARSER_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."DBMS_XDBRESOURCE_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."DBMS_XDB_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."DBMSXLSB_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."RESOURCE_VIEW_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."PATH_VIEW_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."DBMS_XDB_VERSION_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."XMLINDEX_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."XMLTM_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."DBMS_RC_LIB" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "XDB"."DBMS_XDBEVENT_LIB" TRUSTED AS STATIC ;
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

GRANT EXECUTE ON "XDB"."XDB$LINK_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$XMLTYPE_REF_LIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$QNAME" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$STRING_LIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$RAW_LIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$ENUM_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$ENUM2_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$ENUM_VALUES_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$DERIVATIONCHOICE" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$FORMCHOICE" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$WHITESPACECHOICE" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$JAVATYPE" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$USECHOICE" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$PROCESSCHOICE" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$TRANSIENTCHOICE" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$APPINFO_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$APPINFO_LIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$DOCUMENTATION_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$DOCUMENTATION_LIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$ANNOTATION_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$ANNOTATION_LIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$FACET_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$FACET_LIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$NUMFACET_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$TIMEFACET_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$WHITESPACE_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$NOTATION_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$NOTATION_LIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$XPATHSPEC_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$XPATHSPEC_LIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$KEYBASE_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$KEYBASE_LIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$LIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$UNION_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$SIMPLE_DERIVATION_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$GROUP_REF_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$SIMPLE_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$GROUP_DEF_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$ATTRGROUP_DEF_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$ATTRGROUP_REF_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$MODEL_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$COMPLEX_DERIVATION_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$CONTENT_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$SIMPLECONT_RES_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$SIMPLECONT_EXT_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$SIMPLECONTENT_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$COMPLEX_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$ELEMENT_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$PROPERTY_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$ANY_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$INCLUDE_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$INCLUDE_LIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$IMPORT_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$IMPORT_LIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$EXTRA_LIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$SCHEMA_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$NLOCKS_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$PREDECESSOR_LIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$OID_LIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$RCLIST_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB$RESOURCE_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XDB_PRIVILEGES" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."LOCKTOKENLISTTYPE" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XMLSCHEMA_TABMD" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XMLSCHEMA_TABMDARR" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XMLSCHEMA_RESMD" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XMLSCHEMA_RESMDARR" TO PUBLIC;
GRANT EXECUTE ON "XDB"."XDBPI_IM" TO PUBLIC;
GRANT EXECUTE ON "XDB"."PATH_LINKINFO" TO PUBLIC;
GRANT EXECUTE ON "XDB"."PATH_ARRAY" TO PUBLIC;
GRANT EXECUTE ON "XDB"."XDBHI_IM" TO PUBLIC;
GRANT EXECUTE ON "XDB"."XDB_LINK_TYPE" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."ChildName6_COLL" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."ListingTyp5_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."FUNCSTATS" TO PUBLIC;
GRANT EXECUTE ON "XDB"."ContainerStats17_T" TO PUBLIC WITH GRANT OPTION;
GRANT EXECUTE ON "XDB"."XMLTYPE_REF_TABLE_T" TO PUBLIC;
GRANT EXECUTE ON "XDB"."XDB_PRIVILEGES" TO PUBLIC WITH GRANT OPTION;
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

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/XDBSchema.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB'); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/XDBResource.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB'); END;

BEGIN dbms_xmlschema.registerSchema('http://www.w3.org/2001/csx.xml.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB', options=> DBMS_XMLSCHEMA.REGISTER_BINARYXML); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/csx.xmltr.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB', options=> DBMS_XMLSCHEMA.REGISTER_BINARYXML); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/acl.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB', options=> DBMS_XMLSCHEMA.REGISTER_BINARYXML); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/xdbconfig.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB', options=> DBMS_XMLSCHEMA.REGISTER_BINARYXML); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/stats.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB'); END;

BEGIN dbms_xmlschema.registerSchema('http://www.w3.org/2001/csx.XInclude.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB', options=> DBMS_XMLSCHEMA.REGISTER_BINARYXML); END;

BEGIN dbms_xmlschema.registerSchema('http://www.w3.org/1999/csx.xlink.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB', options=> DBMS_XMLSCHEMA.REGISTER_BINARYXML); END;

BEGIN dbms_xmlschema.registerSchema('http://www.w3.org/1999/xlink.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB'); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/XDBFolderListing.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB'); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/xmltr.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB'); END;

BEGIN dbms_xmlschema.registerSchema('http://www.w3.org/2001/xml.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB'); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/XDBStandard.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB'); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/XDBResConfig.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB', options=> DBMS_XMLSCHEMA.REGISTER_BINARYXML); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/dav.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB', options=> DBMS_XMLSCHEMA.REGISTER_BINARYXML); END;

CREATE TABLE "XDB"."XDB$ROOT_INFO"
   (	"RESOURCE_ROOT" ROWID,
	"RCLIST" RAW(2000),
	"FTP_PORT" NUMBER(5,0),
	"FTP_PROTOCOL" VARCHAR2(4000),
	"HTTP_PORT" NUMBER(5,0),
	"HTTP_PROTOCOL" VARCHAR2(4000),
	"HTTP_HOST" VARCHAR2(4000),
	"HTTP2_PORT" NUMBER(5,0),
	"HTTP2_PROTOCOL" VARCHAR2(4000),
	"HTTP2_HOST" VARCHAR2(4000),
	"NFS_PORT" NUMBER(5,0),
	"NFS_PROTOCOL" VARCHAR2(4000)
   ) ;

CREATE TABLE "XDB"."XDB$CDBPORTS"
   (	"PDB" NUMBER,
	"SERVICE" NUMBER,
	"PORT" NUMBER
   ) ;

CREATE TABLE "XDB"."XDB$IMPORT_TT_INFO"
   (	"GUID" RAW(16),
	"NMSPCID" RAW(8),
	"LOCALNAME" VARCHAR2(2000),
	"FLAGS" RAW(4),
	"ID" RAW(8)
   ) ;

CREATE TABLE "XDB"."XDB$TTSET"
   (	"GUID" RAW(16),
	"TOKSUF" VARCHAR2(26),
	"FLAGS" NUMBER,
	"OBJ#" NUMBER
   ) ;

CREATE TABLE "XDB"."XDB$D_LINK"
   (	"SOURCE_ID" RAW(16),
	"TARGET_ID" RAW(16),
	"TARGET_PATH" VARCHAR2(4000),
	"FLAGS" RAW(8)
   ) ;

CREATE TABLE "XDB"."XDB$PATH_INDEX_PARAMS"
   (	"MOUNT_POINT" VARCHAR2(2000),
	"ENUM_COL_CLAUSE" VARCHAR2(2000),
	"NAME" VARCHAR2(128),
	"CONNECT_CLAUSE" VARCHAR2(2000)
   ) ;

CREATE TABLE "XDB"."X$NM7UJB7VOLFE92KV0GUML7K0LVSF"
   (	"NMSPCURI" VARCHAR2(2000),
	"ID" RAW(8)
   ) ;

CREATE TABLE "XDB"."X$QN7UJB7VOLFE92KV0GUML7K0LVSF"
   (	"NMSPCID" RAW(8),
	"LOCALNAME" VARCHAR2(2000),
	"FLAGS" RAW(4),
	"ID" RAW(8)
   ) ;

CREATE TABLE "XDB"."X$PT7UJB7VOLFE92KV0GUML7K0LVSF"
   (	"PATH" RAW(2000),
	"ID" RAW(8)
   ) ;

CREATE TABLE "XDB"."APP_USERS_AND_ROLES"
   (	"GUID" RAW(16),
	"NAME" VARCHAR2(1024),
	"ISROLE" VARCHAR2(3)
   ) ;

CREATE TABLE "XDB"."APP_ROLE_MEMBERSHIP"
   (	"ROLE_GUID" RAW(16),
	"MEMBER_GUID" RAW(16)
   ) ;

CREATE TABLE "XDB"."XDB$DBFS_VIRTUAL_FOLDER"
   (	"HIDDEN_DEF" NUMBER DEFAULT 1,
	"MOUNT_PATH" VARCHAR2(4000)
   ) ;

CREATE TABLE "XDB"."XDB$CHECKOUTS"
   (	"VCRUID" RAW(16),
	"WORKSPACEID" NUMBER(*,0),
	"VERSION" RAW(16),
	"ACTID" NUMBER(*,0)
   ) ;

CREATE TABLE "XDB"."XDB$XIDX_PART_TAB"
   (	"IDXOBJ#" NUMBER,
	"PART_NAME" VARCHAR2(128),
	"TABLESPACE" VARCHAR2(128),
	"PARTITION_ATTRS" VARCHAR2(4000)
   ) ;

CREATE TABLE "XDB"."XDB$XTABNMSP"
   (	"IDXOBJ#" NUMBER,
	"GROUPNAME" NVARCHAR2(128),
	"XMLTABOBJ#" NUMBER,
	"PREFIX" NVARCHAR2(128),
	"NAMESPACE" NVARCHAR2(2000),
	"FLAGS" NUMBER
   ) ;

CREATE TABLE "XDB"."XDB$XTABCOLS"
   (	"IDXOBJ#" NUMBER,
	"GROUPNAME" NVARCHAR2(128),
	"XMLTABOBJ#" NUMBER,
	"COLNAME" NVARCHAR2(2000),
	"COLTYPE" NVARCHAR2(100),
	"XPATH" VARCHAR2(4000),
	"FLAGS" NUMBER
   ) ;

CREATE TABLE "XDB"."XDB$NONCEKEY"
   (	"NONCEKEY" CHAR(32)
   ) ;

CREATE TABLE "XDB"."XDB$MOUNTS"
   (	"DOBJ#" NUMBER,
	"DPATH" VARCHAR2(4000),
	"SOBJ#" NUMBER,
	"SPATH" VARCHAR2(4000),
	"FLAGS" NUMBER
   ) ;

CREATE TABLE "XDB"."XDB_INDEX_DDL_CACHE"
   (	"ROOT_TABLE_NAME" VARCHAR2(128),
	"ROOT_TABLE_OWNER" VARCHAR2(128),
	"ROOT_COL_NAME" VARCHAR2(128),
	"TABLE_NAME" VARCHAR2(128),
	"TABLE_OWNER" VARCHAR2(128),
	"IDX_OWNER" VARCHAR2(128),
	"IDX_TABLE_NAME" VARCHAR2(128),
	"IDX_NAME" VARCHAR2(128),
	"IDX_TYPE" VARCHAR2(27),
	"CONSTR_NAME" VARCHAR2(128),
	"CONSTR_OWNER" VARCHAR2(128)
   ) ;

CREATE TABLE "XDB"."MIGR9202STATUS"
   (	"N" NUMBER(*,0)
   ) ;

CREATE TABLE "XDB"."XDB$XDB_READY"
   (	"DATA" CLOB
   ) ;

CREATE TABLE "XDB"."XDB$H_INDEX"
   (	"OID" RAW(16),
	"ACL_ID" RAW(16),
	"OWNER_ID" RAW(16),
	"FLAGS" RAW(4),
	"CHILDREN" BLOB
   ) ;

CREATE TABLE "XDB"."XDB$H_LINK" OF "XDB"."XDB$LINK_T"
 ;

CREATE TABLE "XDB"."XDB$COLUMN_INFO"
   (	"SCHEMA_REF" REF "SYS"."XMLTYPE" ,
	"ELNUM" NUMBER(*,0),
	"COLNUM" NUMBER(*,0),
	"PROPINFO" RAW(2000)
   ) ;

CREATE TABLE "XDB"."XDB$SIMPLE_TYPE" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBSchema.xsd" ELEMENT "simpleType" ID 22
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."FRACTIONDIGITS"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."FRACTIONDIGITS"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."FRACTIONDIGITS"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."FRACTIONDIGITS"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."TOTALDIGITS"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."TOTALDIGITS"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."TOTALDIGITS"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."TOTALDIGITS"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MINLENGTH"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MINLENGTH"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MINLENGTH"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MINLENGTH"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MAXLENGTH"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MAXLENGTH"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MAXLENGTH"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MAXLENGTH"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."LENGTH"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."LENGTH"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."LENGTH"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."LENGTH"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."WHITESPACE"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."WHITESPACE"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."WHITESPACE"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."WHITESPACE"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."PERIOD"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."PERIOD"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."PERIOD"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."PERIOD"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."DURATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."DURATION"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."DURATION"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."DURATION"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MIN_INCLUSIVE"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MIN_INCLUSIVE"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MIN_INCLUSIVE"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MIN_INCLUSIVE"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MAX_INCLUSIVE"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MAX_INCLUSIVE"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MAX_INCLUSIVE"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MAX_INCLUSIVE"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MIN_EXCLUSIVE"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MIN_EXCLUSIVE"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MIN_EXCLUSIVE"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MIN_EXCLUSIVE"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MAX_EXCLUSIVE"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MAX_EXCLUSIVE"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MAX_EXCLUSIVE"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."MAX_EXCLUSIVE"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."PATTERN" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."ENUMERATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RESTRICTION"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."LIST_TYPE"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."LIST_TYPE"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."LIST_TYPE"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."LIST_TYPE"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."UNION_TYPE"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."UNION_TYPE"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."UNION_TYPE"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."UNION_TYPE"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."UNION_TYPE"."SIMPLE_TYPES" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."UNION_TYPE"."TYPE_REFS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB ;


  ALTER TABLE "XDB"."XDB$SIMPLE_TYPE" ADD REF ("XMLDATA"."PARENT_SCHEMA") WITH ROWID;


  ALTER TABLE "XDB"."XDB$SIMPLE_TYPE" ADD REF ("XMLDATA"."RESTRICTION"."BASE_TYPE") WITH ROWID;


  ALTER TABLE "XDB"."XDB$SIMPLE_TYPE" ADD REF ("XMLDATA"."RESTRICTION"."LCL_SMPL_DECL") WITH ROWID;


  ALTER TABLE "XDB"."XDB$SIMPLE_TYPE" ADD REF ("XMLDATA"."LIST_TYPE"."TYPE_REF") WITH ROWID;


  ALTER TABLE "XDB"."XDB$SIMPLE_TYPE" ADD REF ("XMLDATA"."LIST_TYPE"."SIMPLE_TYPE") WITH ROWID;

CREATE TABLE "XDB"."XDB$COMPLEX_TYPE" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBSchema.xsd" ELEMENT "complexType" ID 29
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ATTRIBUTES" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANY_ATTRS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ATTR_GROUPS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."RESTRICTION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."RESTRICTION"."ATTRIBUTES" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."RESTRICTION"."ANY_ATTRS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."RESTRICTION"."ATTR_GROUPS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."RESTRICTION"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."RESTRICTION"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."RESTRICTION"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."EXTENSION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."EXTENSION"."ATTRIBUTES" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."EXTENSION"."ANY_ATTRS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."EXTENSION"."ATTR_GROUPS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."EXTENSION"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."EXTENSION"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."EXTENSION"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEXCONTENT"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SUBTYPE_REFS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."ATTRIBUTES" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."ANY_ATTRS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."ATTR_GROUPS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."FRACTIONDIGITS"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."FRACTIONDIGITS"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."FRACTIONDIGITS"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."FRACTIONDIGITS"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."TOTALDIGITS"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."TOTALDIGITS"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."TOTALDIGITS"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."TOTALDIGITS"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MINLENGTH"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MINLENGTH"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MINLENGTH"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MINLENGTH"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MAXLENGTH"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MAXLENGTH"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MAXLENGTH"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MAXLENGTH"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."WHITESPACE"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."WHITESPACE"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."WHITESPACE"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."WHITESPACE"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."PERIOD"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."PERIOD"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."PERIOD"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."PERIOD"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."DURATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."DURATION"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."DURATION"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."DURATION"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MIN_INCLUSIVE"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MIN_INCLUSIVE"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MIN_INCLUSIVE"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MIN_INCLUSIVE"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MAX_INCLUSIVE"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MAX_INCLUSIVE"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MAX_INCLUSIVE"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MAX_INCLUSIVE"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."PATTERN" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."ENUMERATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MIN_EXCLUSIVE"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MIN_EXCLUSIVE"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MIN_EXCLUSIVE"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MIN_EXCLUSIVE"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MAX_EXCLUSIVE"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MAX_EXCLUSIVE"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MAX_EXCLUSIVE"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."MAX_EXCLUSIVE"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."LENGTH"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."LENGTH"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."LENGTH"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."RESTRICTION"."LENGTH"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."EXTENSION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."EXTENSION"."ATTRIBUTES" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."EXTENSION"."ANY_ATTRS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."EXTENSION"."ATTR_GROUPS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."EXTENSION"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."EXTENSION"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."EXTENSION"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLECONT"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB ;


  ALTER TABLE "XDB"."XDB$COMPLEX_TYPE" ADD REF ("XMLDATA"."PARENT_SCHEMA") WITH ROWID;


  ALTER TABLE "XDB"."XDB$COMPLEX_TYPE" ADD REF ("XMLDATA"."BASE_TYPE") WITH ROWID;


  ALTER TABLE "XDB"."XDB$COMPLEX_TYPE" ADD REF ("XMLDATA"."ALL_KID") WITH ROWID;


  ALTER TABLE "XDB"."XDB$COMPLEX_TYPE" ADD REF ("XMLDATA"."CHOICE_KID") WITH ROWID;


  ALTER TABLE "XDB"."XDB$COMPLEX_TYPE" ADD REF ("XMLDATA"."SEQUENCE_KID") WITH ROWID;


  ALTER TABLE "XDB"."XDB$COMPLEX_TYPE" ADD REF ("XMLDATA"."GROUP_KID") WITH ROWID;


  ALTER TABLE "XDB"."XDB$COMPLEX_TYPE" ADD REF ("XMLDATA"."COMPLEXCONTENT"."RESTRICTION"."ALL_KID") WITH ROWID;


  ALTER TABLE "XDB"."XDB$COMPLEX_TYPE" ADD REF ("XMLDATA"."COMPLEXCONTENT"."RESTRICTION"."CHOICE_KID") WITH ROWID;


  ALTER TABLE "XDB"."XDB$COMPLEX_TYPE" ADD REF ("XMLDATA"."COMPLEXCONTENT"."RESTRICTION"."SEQUENCE_KID") WITH ROWID;


  ALTER TABLE "XDB"."XDB$COMPLEX_TYPE" ADD REF ("XMLDATA"."COMPLEXCONTENT"."RESTRICTION"."GROUP_KID") WITH ROWID;


  ALTER TABLE "XDB"."XDB$COMPLEX_TYPE" ADD REF ("XMLDATA"."COMPLEXCONTENT"."EXTENSION"."ALL_KID") WITH ROWID;


  ALTER TABLE "XDB"."XDB$COMPLEX_TYPE" ADD REF ("XMLDATA"."COMPLEXCONTENT"."EXTENSION"."CHOICE_KID") WITH ROWID;


  ALTER TABLE "XDB"."XDB$COMPLEX_TYPE" ADD REF ("XMLDATA"."COMPLEXCONTENT"."EXTENSION"."SEQUENCE_KID") WITH ROWID;


  ALTER TABLE "XDB"."XDB$COMPLEX_TYPE" ADD REF ("XMLDATA"."COMPLEXCONTENT"."EXTENSION"."GROUP_KID") WITH ROWID;


  ALTER TABLE "XDB"."XDB$COMPLEX_TYPE" ADD REF ("XMLDATA"."SIMPLECONT"."RESTRICTION"."LCL_SMPL_DECL") WITH ROWID;

CREATE TABLE "XDB"."XDB$ALL_MODEL" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBSchema.xsd" ELEMENT "all" ID 111
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ELEMENTS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."CHOICE_KIDS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SEQUENCE_KIDS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANYS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."GROUPS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB ;


  ALTER TABLE "XDB"."XDB$ALL_MODEL" ADD REF ("XMLDATA"."PARENT_SCHEMA") WITH ROWID;

CREATE TABLE "XDB"."XDB$CHOICE_MODEL" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBSchema.xsd" ELEMENT "choice" ID 112
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ELEMENTS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."CHOICE_KIDS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SEQUENCE_KIDS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANYS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."GROUPS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB ;


  ALTER TABLE "XDB"."XDB$CHOICE_MODEL" ADD REF ("XMLDATA"."PARENT_SCHEMA") WITH ROWID;

CREATE TABLE "XDB"."XDB$SEQUENCE_MODEL" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBSchema.xsd" ELEMENT "sequence" ID 113
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ELEMENTS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."CHOICE_KIDS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SEQUENCE_KIDS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANYS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."GROUPS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB ;


  ALTER TABLE "XDB"."XDB$SEQUENCE_MODEL" ADD REF ("XMLDATA"."PARENT_SCHEMA") WITH ROWID;

CREATE TABLE "XDB"."XDB$ELEMENT" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBSchema.xsd" ELEMENT "element" ID 67
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."PROPERTY"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."PROPERTY"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."PROPERTY"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."PROPERTY"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SUBS_GROUP_REFS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."UNIQUES" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."KEYS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."KEYREFS" STORE AS SECUREFILE LOB ;


  ALTER TABLE "XDB"."XDB$ELEMENT" ADD REF ("XMLDATA"."PROPERTY"."PARENT_SCHEMA") WITH ROWID;


  ALTER TABLE "XDB"."XDB$ELEMENT" ADD REF ("XMLDATA"."PROPERTY"."SMPL_TYPE_DECL") WITH ROWID;


  ALTER TABLE "XDB"."XDB$ELEMENT" ADD REF ("XMLDATA"."PROPERTY"."TYPE_REF") WITH ROWID;


  ALTER TABLE "XDB"."XDB$ELEMENT" ADD REF ("XMLDATA"."PROPERTY"."PROPREF_REF") WITH ROWID;


  ALTER TABLE "XDB"."XDB$ELEMENT" ADD REF ("XMLDATA"."CPLX_TYPE_DECL") WITH ROWID;


  ALTER TABLE "XDB"."XDB$ELEMENT" ADD REF ("XMLDATA"."HEAD_ELEM_REF") WITH ROWID;

CREATE TABLE "XDB"."XDB$ATTRIBUTE" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBSchema.xsd" ELEMENT "attribute" ID 48
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB ;


  ALTER TABLE "XDB"."XDB$ATTRIBUTE" ADD REF ("XMLDATA"."PARENT_SCHEMA") WITH ROWID;


  ALTER TABLE "XDB"."XDB$ATTRIBUTE" ADD REF ("XMLDATA"."SMPL_TYPE_DECL") WITH ROWID;


  ALTER TABLE "XDB"."XDB$ATTRIBUTE" ADD REF ("XMLDATA"."TYPE_REF") WITH ROWID;


  ALTER TABLE "XDB"."XDB$ATTRIBUTE" ADD REF ("XMLDATA"."PROPREF_REF") WITH ROWID;

CREATE TABLE "XDB"."XDB$ANYATTR" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBSchema.xsd" ELEMENT "anyAttribute" ID 129
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."PROPERTY"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."PROPERTY"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."PROPERTY"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."PROPERTY"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB ;


  ALTER TABLE "XDB"."XDB$ANYATTR" ADD REF ("XMLDATA"."PROPERTY"."PARENT_SCHEMA") WITH ROWID;


  ALTER TABLE "XDB"."XDB$ANYATTR" ADD REF ("XMLDATA"."PROPERTY"."SMPL_TYPE_DECL") WITH ROWID;


  ALTER TABLE "XDB"."XDB$ANYATTR" ADD REF ("XMLDATA"."PROPERTY"."TYPE_REF") WITH ROWID;


  ALTER TABLE "XDB"."XDB$ANYATTR" ADD REF ("XMLDATA"."PROPERTY"."PROPREF_REF") WITH ROWID;

CREATE TABLE "XDB"."XDB$ANY" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBSchema.xsd" ELEMENT "any" ID 127
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."PROPERTY"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."PROPERTY"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."PROPERTY"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."PROPERTY"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB ;


  ALTER TABLE "XDB"."XDB$ANY" ADD REF ("XMLDATA"."PROPERTY"."PARENT_SCHEMA") WITH ROWID;


  ALTER TABLE "XDB"."XDB$ANY" ADD REF ("XMLDATA"."PROPERTY"."SMPL_TYPE_DECL") WITH ROWID;


  ALTER TABLE "XDB"."XDB$ANY" ADD REF ("XMLDATA"."PROPERTY"."TYPE_REF") WITH ROWID;


  ALTER TABLE "XDB"."XDB$ANY" ADD REF ("XMLDATA"."PROPERTY"."PROPREF_REF") WITH ROWID;

CREATE TABLE "XDB"."XDB$GROUP_DEF" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBSchema.xsd" ELEMENT "group" ID 192
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB ;


  ALTER TABLE "XDB"."XDB$GROUP_DEF" ADD REF ("XMLDATA"."PARENT_SCHEMA") WITH ROWID;


  ALTER TABLE "XDB"."XDB$GROUP_DEF" ADD REF ("XMLDATA"."ALL_KID") WITH ROWID;


  ALTER TABLE "XDB"."XDB$GROUP_DEF" ADD REF ("XMLDATA"."CHOICE_KID") WITH ROWID;


  ALTER TABLE "XDB"."XDB$GROUP_DEF" ADD REF ("XMLDATA"."SEQUENCE_KID") WITH ROWID;

CREATE TABLE "XDB"."XDB$GROUP_REF" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBSchema.xsd" ELEMENT "group" ID 165
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB ;


  ALTER TABLE "XDB"."XDB$GROUP_REF" ADD REF ("XMLDATA"."PARENT_SCHEMA") WITH ROWID;


  ALTER TABLE "XDB"."XDB$GROUP_REF" ADD REF ("XMLDATA"."GROUPREF_REF") WITH ROWID;

CREATE TABLE "XDB"."XDB$ATTRGROUP_DEF" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBSchema.xsd" ELEMENT "attributeGroup" ID 193
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ATTRIBUTES" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANY_ATTRS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ATTR_GROUPS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB ;


  ALTER TABLE "XDB"."XDB$ATTRGROUP_DEF" ADD REF ("XMLDATA"."PARENT_SCHEMA") WITH ROWID;

CREATE TABLE "XDB"."XDB$ATTRGROUP_REF" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBSchema.xsd" ELEMENT "attributeGroup" ID 169
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."APPINFO" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATION"."DOCUMENTATION" STORE AS SECUREFILE LOB ;


  ALTER TABLE "XDB"."XDB$ATTRGROUP_REF" ADD REF ("XMLDATA"."PARENT_SCHEMA") WITH ROWID;


  ALTER TABLE "XDB"."XDB$ATTRGROUP_REF" ADD REF ("XMLDATA"."ATTRGROUP_REF") WITH ROWID;

CREATE TABLE "XDB"."XDB$SCHEMA" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBSchema.xsd" ELEMENT "schema" ID 81
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ELEMENTS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SIMPLE_TYPE" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."COMPLEX_TYPES" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ATTRIBUTES" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."IMPORTS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."INCLUDES" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ANNOTATIONS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."GROUPS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."ATTRGROUPS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."NOTATIONS" STORE AS SECUREFILE LOB ;

CREATE TABLE "XDB"."XDB$RESOURCE" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBResource.xsd" ELEMENT "Resource" ID 734
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."PARENTS" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."SBRESEXTRA" STORE AS SECUREFILE LOB
 VARRAY "XMLDATA"."RCLIST"."OID" STORE AS SECUREFILE LOB ;


  ALTER TABLE "XDB"."XDB$RESOURCE" ADD REF ("XMLDATA"."XMLREF") WITH ROWID;


  ALTER TABLE "XDB"."XDB$RESOURCE" ADD REF ("XMLDATA"."XMLREF") ALLOW PRIMARY KEY;

CREATE TABLE "XDB"."XDB$NLOCKS" OF "XDB"."XDB$NLOCKS_T"
 ;

CREATE TABLE "XDB"."XDB$ACL" OF XMLTYPE
   XMLSCHEMA "http://xmlns.oracle.com/xdb/acl.xsd" ELEMENT "acl" ID 2036 DISALLOW NONSCHEMA
  ;

CREATE TABLE "XDB"."XDB$RESCONFIG" OF XMLTYPE
   XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBResConfig.xsd" ELEMENT "ResConfig" ID 2067 DISALLOW NONSCHEMA
  ;

CREATE TABLE "XDB"."Folder7_TAB" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/XDBFolderListing.xsd" ELEMENT "Folder" ID 2158
 VARRAY "XMLDATA"."ChildName" STORE AS TABLE "SYS_NT/ZrP7FfoSKngQ7ap6Ar7bw=="
 RETURN AS LOCATOR
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB "NAMESPACES10_L"
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB "EXTRADATA9_L"
 VARRAY "XMLDATA"."SYS_XDBPD$" STORE AS SECUREFILE LOB "SYS_XDBPD$8_L";

CREATE TABLE "XDB"."XDB$DXPTAB"
   (	"IDXOBJ#" NUMBER,
	"PATHTABOBJ#" NUMBER,
	"FLAGS" NUMBER,
	"RAWSIZE" NUMBER,
	"PARAMETERS" "SYS"."XMLTYPE" ,
	"PENDTABOBJ#" NUMBER,
	"SNAPSHOT" RAW(20),
	"TABLESPACE" VARCHAR2(128),
	"TABLE_ATTRS" VARCHAR2(4000),
	"NBPENDTABOBJ#" NUMBER,
	"NBERRTABOBJ#" NUMBER
   ) ;

CREATE GLOBAL TEMPORARY TABLE "XDB"."XDB$XIDX_IMP_T"
   (	"INDEX_NAME" VARCHAR2(138),
	"SCHEMA_NAME" VARCHAR2(138),
	"ID" VARCHAR2(40),
	"DATA" CLOB,
	"GRPPOS" NUMBER
   ) ON COMMIT PRESERVE ROWS ;

CREATE TABLE "XDB"."XDB$XIDX_PARAM_T"
   (	"USERID" NUMBER,
	"PARAM_NAME" VARCHAR2(128),
	"PARAMSTR" CLOB
   ) ;

CREATE TABLE "XDB"."XDB$XTAB"
   (	"IDXOBJ#" NUMBER,
	"GROUPNAME" NVARCHAR2(128),
	"XMLTABOBJ#" NUMBER,
	"PTABOBJ#" NUMBER,
	"XPATH" VARCHAR2(4000),
	"XQUERY" CLOB,
	"FLAGS" NUMBER,
	"PARAMETERS" "SYS"."XMLTYPE" ,
	"GRPPOS" NUMBER,
	"DEPGRPPOS" NUMBER,
	"SEGATTRS" VARCHAR2(4000)
   ) ;

CREATE TABLE "XDB"."XDB$STATS" OF XMLTYPE
  XMLSCHEMA "http://xmlns.oracle.com/xdb/stats.xsd" ELEMENT "ContainerStats" ID 2204
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB "NAMESPACES20_L"
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB "EXTRADATA19_L"
 VARRAY "XMLDATA"."SYS_XDBPD$" STORE AS SECUREFILE LOB "SYS_XDBPD$18_L";

CREATE TABLE "XDB"."XDB$CONFIG" OF XMLTYPE
   XMLSCHEMA "http://xmlns.oracle.com/xdb/xdbconfig.xsd" ELEMENT "xdbconfig" ID 2297 DISALLOW NONSCHEMA
  ;

CREATE TABLE "XDB"."XDB$REPOS"
   (	"OBJ#" NUMBER,
	"FLAGS" NUMBER,
	"ROOTINFO#" NUMBER,
	"HINDEX#" NUMBER,
	"HLINK#" NUMBER,
	"RESOURCE#" NUMBER,
	"ACL#" NUMBER,
	"CONFIG#" NUMBER,
	"DLINK#" NUMBER,
	"NLOCKS#" NUMBER,
	"STATS#" NUMBER,
	"CHECKOUTS#" NUMBER,
	"RESCONFIG#" NUMBER,
	"WKSPC#" NUMBER,
	"VERSHIST#" NUMBER,
	"PARAMS" "SYS"."XMLTYPE"
   ) ;

GRANT UPDATE ON "XDB"."XDB$IMPORT_TT_INFO" TO PUBLIC;
GRANT SELECT ON "XDB"."XDB$IMPORT_TT_INFO" TO PUBLIC;
GRANT INSERT ON "XDB"."XDB$IMPORT_TT_INFO" TO PUBLIC;
GRANT DELETE ON "XDB"."XDB$IMPORT_TT_INFO" TO PUBLIC;
GRANT SELECT ON "XDB"."XDB$SIMPLE_TYPE" TO PUBLIC WITH GRANT OPTION;
GRANT SELECT ON "XDB"."XDB$COMPLEX_TYPE" TO PUBLIC WITH GRANT OPTION;
GRANT SELECT ON "XDB"."XDB$ALL_MODEL" TO PUBLIC WITH GRANT OPTION;
GRANT SELECT ON "XDB"."XDB$CHOICE_MODEL" TO PUBLIC WITH GRANT OPTION;
GRANT SELECT ON "XDB"."XDB$SEQUENCE_MODEL" TO PUBLIC WITH GRANT OPTION;
GRANT SELECT ON "XDB"."XDB$ELEMENT" TO PUBLIC WITH GRANT OPTION;
GRANT SELECT ON "XDB"."XDB$ATTRIBUTE" TO PUBLIC WITH GRANT OPTION;
GRANT SELECT ON "XDB"."XDB$ANYATTR" TO PUBLIC WITH GRANT OPTION;
GRANT SELECT ON "XDB"."XDB$ANY" TO PUBLIC WITH GRANT OPTION;
GRANT SELECT ON "XDB"."XDB$GROUP_DEF" TO PUBLIC WITH GRANT OPTION;
GRANT SELECT ON "XDB"."XDB$GROUP_REF" TO PUBLIC WITH GRANT OPTION;
GRANT SELECT ON "XDB"."XDB$ATTRGROUP_DEF" TO PUBLIC WITH GRANT OPTION;
GRANT SELECT ON "XDB"."XDB$ATTRGROUP_REF" TO PUBLIC WITH GRANT OPTION;
GRANT SELECT ON "XDB"."XDB$SCHEMA" TO PUBLIC WITH GRANT OPTION;
GRANT UPDATE ON "XDB"."XDB$ACL" TO PUBLIC;
GRANT SELECT ON "XDB"."XDB$ACL" TO PUBLIC;
GRANT INSERT ON "XDB"."XDB$ACL" TO PUBLIC;
GRANT DELETE ON "XDB"."XDB$ACL" TO PUBLIC;
GRANT UPDATE ON "XDB"."XDB$RESCONFIG" TO PUBLIC;
GRANT SELECT ON "XDB"."XDB$RESCONFIG" TO PUBLIC;
GRANT INSERT ON "XDB"."XDB$RESCONFIG" TO PUBLIC;
GRANT DELETE ON "XDB"."XDB$RESCONFIG" TO PUBLIC;
GRANT SELECT ON "XDB"."XDB$XIDX_IMP_T" TO PUBLIC;
GRANT INSERT ON "XDB"."XDB$XIDX_IMP_T" TO PUBLIC;
GRANT DELETE ON "XDB"."XDB$XIDX_IMP_T" TO PUBLIC;
GRANT SELECT ON "XDB"."XDB_INDEX_DDL_CACHE" TO PUBLIC;
GRANT INSERT ON "XDB"."XDB_INDEX_DDL_CACHE" TO PUBLIC;
GRANT DELETE ON "XDB"."XDB_INDEX_DDL_CACHE" TO PUBLIC;
COMMENT ON COLUMN "XDB"."APP_USERS_AND_ROLES"."GUID" IS 'The GUID for user or role/workgroup';
COMMENT ON COLUMN "XDB"."APP_USERS_AND_ROLES"."NAME" IS 'The name of user or role/workgroup';
COMMENT ON COLUMN "XDB"."APP_USERS_AND_ROLES"."ISROLE" IS 'Whether user or role/workgroup';
COMMENT ON TABLE "XDB"."APP_USERS_AND_ROLES"  IS 'Application users and roles/workspaces';
COMMENT ON COLUMN "XDB"."APP_ROLE_MEMBERSHIP"."ROLE_GUID" IS 'The GUID for the role/workgroup';
COMMENT ON COLUMN "XDB"."APP_ROLE_MEMBERSHIP"."MEMBER_GUID" IS 'The GUID of the role member';
COMMENT ON TABLE "XDB"."APP_ROLE_MEMBERSHIP"  IS 'Application role membership';
CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XMLSCHEMA" authid current_user is
  ---------------------------------------------
  --  OVERVIEW
  --
  --  This package provides procedures to
  --  (*) register an XML schema
  --  (*) delete a previously registered XML schema
  --  (*) re-compile a previously registered XML schema
  --  (*) generate an XML schema
  --
  ---------------------------------------------

  ------------
  -- CONSTANTS
  --
  ------------
  DELETE_RESTRICT CONSTANT NUMBER := 1;
  DELETE_INVALIDATE CONSTANT NUMBER := 2;
  DELETE_CASCADE  CONSTANT NUMBER := 3;
  DELETE_CASCADE_FORCE CONSTANT NUMBER := 4;
  DELETE_MIGRATE CONSTANT NUMBER := 8;

  ENABLE_HIERARCHY_NONE CONSTANT PLS_INTEGER        := 1;
  ENABLE_HIERARCHY_CONTENTS CONSTANT PLS_INTEGER    := 2;
  ENABLE_HIERARCHY_RESMETADATA CONSTANT PLS_INTEGER := 3;
  ENABLE_HIERARCHY_VERSION  CONSTANT PLS_INTEGER    := 4;
  ENABLE_HIERARCHY_LINKS  CONSTANT PLS_INTEGER      := 8;

  REGISTER_NODOCID   CONSTANT NUMBER := 1;
  REGISTER_BINARYXML CONSTANT NUMBER := 2;
  REGISTER_NT_AS_IOT CONSTANT NUMBER := 4;

  REGISTER_CSID_NULL CONSTANT NUMBER := -1;

  COPYEVOLVE_BINARY_XML CONSTANT NUMBER := 1;

  INPLACE_EVOLVE CONSTANT NUMBER := 1;
  INPLACE_TRACE  CONSTANT NUMBER := 2;

  PRESERVE_PROP_NUMBERS CONSTANT NUMBER := 1;

  ------------
  -- TYPES
  ------------
  TYPE URLARR is VARRAY(1000) of VARCHAR2(1000);
  TYPE XMLARR is VARRAY(1000) of XMLType;
  TYPE UNAME_ARR is VARRAY(1000) of VARCHAR2(100);

  ---------------------------------------------
  -- PROCEDURE - registerSchema
  -- PARAMETERS -
  --  schemaURL
  --     A name that uniquely identifies the schema document.
  --  schemaDoc
  --     a valid XML schema document
  --  local
  --     Is this a local or global schema ? By default, all schemas
  --     are registered as local schemas i.e. under
  --       /sys/schemas/<username>/...
  --     If a schema is registered as global, it is added under
  --       /sys/schemas/PUBLIC/...
  --     You need write privileges on the above directory to be
  --     able to register a schema as global.
  --  genTypes
  --     Should the schema compiler generate object types ?
  --  genbean
  --     Should the schema compiler generate Java beans ?
  --  genTables
  --     Should the schema compiler generate default tables ?
  --  force
  --     Should the schema be created/stored even with errors?
  --       Setting this to TRUE will register the schema in the
  --       hierarchy even if there were compilation errors, but
  --       the schema cannot be used until it is made valid.
  --  csid
  --     Character set id of the input blob or bfile.
  --     The value REGISTER_CSID_NULL indicates that the CSID was
  --     not passed in. If users pass in REGISTER_CSID_NULL as the value
  --     of the csid parameter, then the behavior will be the same as
  --     when csid was not passed in.
  --  options
  --     Additional options to specify how the schema should be
  --     registered. The various options are represented as bits
  --     of an integer and the options parameter should be
  --     constructed by doing a bitor of the desired bits.
  --     The possible bits for this are:
  --       REGISTER_NODOCID :: this will suppress the creation
  --       of the DOCID column for out of line tables. This is a
  --       storage optimization which might be desirable when
  --       we do not need to join back to the document table (for example
  --       if we do not care about rewriting certain queries that could
  --       be rewritten by making use of the DOCID column)
  --       REGISTER_BINARYXML :: this scema is used for CSX
  --      REGISTER_NT_AS_IOT  :: this will store the
  --       nested tables as IOTs instead of heap (which is the default storage)
  --  enableHierarchy
  --     Specifies how the tables generated during schema registration
  --     should be hierarchically enabled. It must be one of the following:
  --     ENABLE_HIERARCHY_NONE : none of the tables will have hierarchy
  --     enabled on them
  --     ENABLE_HIERARCHY_CONTENTS : enables hierarchy for contents i.e.
  --     the tables can be used to store contents of resources
  --     ENABLE_HIERARCHY_RESMETADATA : enables hierarchy for resource metadata
  --     i.e. the tables can be used to store resource metadata
  --     ENABLE_HIERARCHY_VERSION : version-enable all table created during
  --     registration. Must be combined with either ENABLE_HIERARCHY_CONTENTS
  --     or ENABLE_HIERARCHY_RESMETADATA.
  --     ENABLE_HIERARCHY_LINKS : enable hierarchy and enable link processing on
  --     the table. Must be combined with ENABLE_HIERARCHY_CONTENTS
  --
  -- EXCEPTIONS
  --   ORA-31001: Invalid resource handle or path name
  --   todo
  ---------------------------------------------
  procedure registerSchema(schemaURL IN varchar2,
                           schemaDoc IN VARCHAR2,
                           local IN BOOLEAN := TRUE,
                           genTypes IN BOOLEAN := TRUE,
                           genbean IN BOOLEAN := FALSE,
                           genTables IN BOOLEAN := TRUE,
                           force IN BOOLEAN := FALSE,
                           owner IN VARCHAR2 := '',
                           enableHierarchy IN pls_integer :=
                           ENABLE_HIERARCHY_CONTENTS,
                           options IN pls_integer := 0);

  procedure registerSchema(schemaURL IN varchar2,
                           schemaDoc IN CLOB,
                           local IN BOOLEAN := TRUE,
                           genTypes IN BOOLEAN := TRUE,
                           genbean IN BOOLEAN := FALSE,
                           genTables IN BOOLEAN := TRUE,
                           force IN BOOLEAN := FALSE,
                           owner IN VARCHAR2 := '',
                           enableHierarchy IN pls_integer :=
                           ENABLE_HIERARCHY_CONTENTS,
                           options IN pls_integer := 0,
                           schemaoid IN RAW := NULL,
                           import_options IN pls_integer := 0);

  procedure registerSchema(schemaURL IN varchar2,
                           schemaDoc IN BLOB,
                           local IN BOOLEAN := TRUE,
                           genTypes IN BOOLEAN := TRUE,
                           genbean IN BOOLEAN := FALSE,
                           genTables IN BOOLEAN := TRUE,
                           force IN BOOLEAN := FALSE,
                           owner IN VARCHAR2 := '',
                           csid IN NUMBER := REGISTER_CSID_NULL,
                           enableHierarchy IN pls_integer :=
                           ENABLE_HIERARCHY_CONTENTS,
                           options IN pls_integer := 0);

  procedure registerSchema(schemaURL IN varchar2,
                           schemaDoc IN BFILE,
                           local IN BOOLEAN := TRUE,
                           genTypes IN BOOLEAN := TRUE,
                           genbean IN BOOLEAN := FALSE,
                           genTables IN BOOLEAN := TRUE,
                           force IN BOOLEAN := FALSE,
                           owner IN VARCHAR2 := '',
                           csid IN NUMBER := REGISTER_CSID_NULL,
                           enableHierarchy IN pls_integer :=
                           ENABLE_HIERARCHY_CONTENTS,
                           options IN pls_integer := 0);

  procedure registerSchema(schemaURL IN varchar2,
                           schemaDoc IN sys.XMLType,
                           local IN BOOLEAN := TRUE,
                           genTypes IN BOOLEAN := TRUE,
                           genbean IN BOOLEAN := FALSE,
                           genTables IN BOOLEAN := TRUE,
                           force IN BOOLEAN := FALSE,
                           owner IN VARCHAR2 := '',
                           enableHierarchy IN pls_integer :=
                           ENABLE_HIERARCHY_CONTENTS,
                           options IN pls_integer := 0);

  procedure registerSchema(schemaURL IN varchar2,
                           schemaDoc IN sys.UriType,
                           local IN BOOLEAN := TRUE,
                           genTypes IN BOOLEAN := TRUE,
                           genbean IN BOOLEAN := FALSE,
                           genTables IN BOOLEAN := TRUE,
                           force IN BOOLEAN := FALSE,
                           owner IN VARCHAR2 := '',
                           enableHierarchy IN pls_integer :=
                           ENABLE_HIERARCHY_CONTENTS,
                           options IN pls_integer := 0);

  ---------------------------------------------
  -- PROCEDURE - registerURI
  -- PARAMETERS -
  --  schemaURL
  --     A name that uniquely identifies the schema document.
  --  schemaDocURI
  --     A pathname (URI) corresponding to the physical location of the
  --     schema document. The URI path could be based on HTTP, FTP, DB or XDB
  --     protocols. This function constructs a URIType instance using
  --     the URIFactory - and invokes the regiserSchema function above.
  --  <all other paramaters> Same as above
  ---------------------------------------------
  procedure registerURI(schemaURL IN varchar2,
                        schemaDocURI IN varchar2,
                        local IN BOOLEAN := TRUE,
                        genTypes IN BOOLEAN := TRUE,
                        genbean IN BOOLEAN := FALSE,
                        genTables IN BOOLEAN := TRUE,
                        force IN BOOLEAN := FALSE,
                        owner IN VARCHAR2 := '',
                        enableHierarchy IN pls_integer :=
                        ENABLE_HIERARCHY_CONTENTS,
                        options IN pls_integer := 0);

  ---------------------------------------------
  -- PROCEDURE - deleteSchema
  -- PARAMETERS -
  --  schemaURL : Name identifying the schema to be deleted
  --  option : one of the following
  --    DELETE_RESTRICT ::
  --      Schema deletion fails if there are any tables or schemas that
  --      depend on this schema.
  --    DELETE_INVALIDATE :
  --      Schema deletion does not fail if there are any dependencies.
  --      Instead, it simply invalidates all dependent objects.
  --    DELETE_CASCADE ::
  --      Schema deletion will also drop all default SQL types and
  --      default tables. However the deletion fails if there are
  --      any stored instances conforming to this schema.
  --    DELETE_CASCADE_FORCE ::
  --      Similar to CASCADE except that it does not check for any stored
  --      instances conforming to this schema. Also it ignores any errors.
  --    DELETE_MIGRATE
  --      This delete is happening during migrate mode.
  --
  -- EXCEPTIONS
  --   ORA-31001: Invalid resource handle or path name
  --   todo
  ---------------------------------------------
  procedure deleteSchema(schemaURL IN varchar2,
                         delete_option IN pls_integer := DELETE_RESTRICT);
  PRAGMA SUPPLEMENTAL_LOG_DATA(deleteSchema, AUTO_WITH_COMMIT);

  ---------------------------------------------
  -- PROCEDURE - purgeSchema
  --  Purges a schema that was previously marked delete with hide mode
  -- PARAMETERS -
  --  schemaURL : Name identifying the schema to be purge
  --
  -- EXCEPTIONS
  --   ORA-31001: Invalid resource handle or path name
  --   todo
  ---------------------------------------------
  procedure purgeSchema(schema_id IN raw);
  PRAGMA SUPPLEMENTAL_LOG_DATA(purgeSchema, AUTO_WITH_COMMIT);

  ---------------------------------------------
  -- PROCEDURE - generateBean
  --  This procedure can be used to generate the Java bean code
  --  corresponding to a registered XML schema.
  --  Note that there is also an option to generate the beans
  --  as part of the registration procedure itself.
  -- PARAMETERS -
  --  schemaURL : Name identifying a registered XML schema.
  -- EXCEPTIONS
  --   ORA-31001: Invalid resource handle or path name
  --   todo
  ---------------------------------------------
  procedure generateBean(schemaURL IN varchar2);
  PRAGMA SUPPLEMENTAL_LOG_DATA(generateBean, AUTO_WITH_COMMIT);

  ---------------------------------------------
  -- PROCEDURE - compileSchema
  --  This procedure can be used to re-compile an already registered XML
  --  schema. This is useful for bringing a schema in an invalid
  --  state to a valid state.
  -- PARAMETERS -
  --  schemaURL : URL identifying the schema
  -- EXCEPTIONS
  --   ORA-31001: Invalid resource handle or path name
  ---------------------------------------------
  procedure compileSchema(schemaURL IN varchar2);
  PRAGMA SUPPLEMENTAL_LOG_DATA(compileSchema, AUTO_WITH_COMMIT);

  ---------------------------------------------
  -- FUNCTION - generateSchema(s)
  --  These functions generate XML schema(s) from
  --  an oracle type name.  generateSchemas returns a collection
  --  of XMLTypes, one XMLSchema document for each database schema.
  --  generateSchema inlines them all in one schema (XMLType).
  -- PARAMETERS -
  --  schemaName  : the name of the database schema containing the type
  --  typeName    : the name of the oracle type
  --  elementName : the name of the toplevel element in the XMLSchema
  --                defaults to typeName
  --  schemaURL   : specifies base URL where schemas will be stored,
  --                needed by top level schema for import statement
  --  recurse     : whether or not to also generate schema for all types
  --                referred to by the type specified
  --  annotate    : whether or not to put the SQL annotations in the XMLSchema
  --  embedColl   : whether you want collections embedded in the type which
  --                refers to them or you want them to have a complexType
  --                created, can not be false with annotations true
  -- EXCEPTIONS
  --  TBD
  ---------------------------------------------
  function generateSchemas( schemaName IN varchar2, typeName IN varchar2,
                            elementName IN varchar2 := NULL,
                            schemaURL IN varchar2 := NULL,
                            annotate IN BOOLEAN := TRUE,
                            embedColl IN BOOLEAN := TRUE )
    return sys.XMLSequenceType;

  function generateSchema( schemaName IN varchar2, typeName IN varchar2,
                           elementName IN varchar2 := NULL,
                           recurse IN BOOLEAN := TRUE,
                           annotate IN BOOLEAN := TRUE,
                           embedColl IN BOOLEAN := TRUE ) return sys.XMLType;

  procedure CopyEvolve(schemaURLs         IN XDB$STRING_LIST_T,
                       newSchemas         IN XMLSequenceType,
                       transforms         IN XMLSequenceType := NULL,
                       preserveOldDocs    IN BOOLEAN := FALSE,
                       mapTabName         IN VARCHAR2 := NULL,
                       generateTables     IN BOOLEAN := TRUE,
                       force              IN BOOLEAN := FALSE,
                       schemaOwners       IN XDB$STRING_LIST_T := NULL,
                       parallelDegree     IN PLS_INTEGER := 0,
                       options            IN PLS_INTEGER := 0);
  PRAGMA SUPPLEMENTAL_LOG_DATA(CopyEvolve, UNSUPPORTED_WITH_COMMIT);


  procedure InPlaceEvolve(schemaURL       IN VARCHAR2,
                          diffXML         IN SYS.XMLTYPE,
                          flags           IN NUMBER := 1);
  PRAGMA SUPPLEMENTAL_LOG_DATA(InPlaceEvolve, AUTO_WITH_COMMIT);

  ---------------------------------------------
  -- FUNCTION - convertToDate
  --  This function converts the string representation of the following
  --  specified XML Schema types into the Oracle DATE representation
  --  using a default reference date and format mask.
  -- PARAMETERS -
  --  strval : string representation of valid value (per XML Schema)
  --  xmltypename : Name of the XML Schema datatype.
  --                Has to be one of the following:
  --                 * gDay
  --                 * gMonth
  --                 * gYear
  --                 * gYearMonth
  --                 * gMonthDay
  --                 * date
  ---------------------------------------------
  function convertToDate(strval varchar2, xmltypename varchar2)
  return DATE deterministic parallel_enable;

  ---------------------------------------------
  -- FUNCTION - convertToTS
  --  This function converts the string representation of the following
  --  specified XML Schema types into the Oracle TIMESTAMP representation
  --  using a default reference date and format mask.
  -- PARAMETERS -
  --  strval : string representation of valid value (per XML Schema)
  --  xmltypename : Name of the XML Schema datatype.
  --                Has to be one of the following:
  --                 * dateTime
  --                 * time
  ---------------------------------------------
  function convertToTS(strval varchar2, xmltypename varchar2)
  return TIMESTAMP deterministic parallel_enable;

  ---------------------------------------------
  -- FUNCTION - convertToTSWithTZ
  --  This function converts the string representation of the following
  --  specified XML Schema types into the Oracle
  --  TIMESTAMP WITH TIMEZONE representation using a default reference
  --  date and format mask.
  -- PARAMETERS -
  --  strval : string representation of valid value (per XML Schema)
  --  xmltypename : Name of the XML Schema datatype.
  --                Has to be one of the following:
  --                 * gDay
  --                 * gMonth
  --                 * gYear
  --                 * gYearMonth
  --                 * gMonthDay
  --                 * date
  --                 * dateTime
  --                 * time
  ---------------------------------------------
  function convertToTSWithTZ(strval varchar2, xmltypename varchar2)
  return TIMESTAMP WITH TIME ZONE deterministic parallel_enable;

end dbms_xmlschema;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XDBZ" AUTHID CURRENT_USER IS

------------
-- CONSTANTS
--
------------
NAME_FORMAT_SHORT         CONSTANT pls_integer := 1;
NAME_FORMAT_DISTINGUISHED CONSTANT pls_integer := 2;
NAME_FORMAT_APPLICATION   CONSTANT pls_integer := 5;

ENABLE_CONTENTS           CONSTANT pls_integer := 1;
ENABLE_RESMETADATA        CONSTANT pls_integer := 2;
ENABLE_VERSION            CONSTANT pls_integer := 4;
ENABLE_LINKS              CONSTANT pls_integer := 8;

IS_ENABLED_CONTENTS       CONSTANT pls_integer := 1;
IS_ENABLED_RESMETADATA    CONSTANT pls_integer := 2;
IS_ENABLED_VERSION        CONSTANT pls_integer := 4;

DISABLE_VERSION           CONSTANT pls_integer := 1;
DISABLE_ALL               CONSTANT pls_integer := 2;
SKIP_SYSCONSACL_FLG       CONSTANT pls_integer := 0;

APPLICATION_USER          CONSTANT pls_integer := 0;
APPLICATION_ROLE          CONSTANT pls_integer := 1;

DELETE_APP_NOFORCE        CONSTANT pls_integer := 0;
DELETE_APP_FORCE          CONSTANT pls_integer := 1;

MODE_MEMBERSHIP_ADD       CONSTANT pls_integer := 0;
MODE_MEMBERSHIP_DELETE    CONSTANT pls_integer := 1;

----------------------------------------------------------------------------
-- PROCEDURE - enable_hierarchy
--     Enables XDB Hierarchy for a particular xmltype table/view
-- PARAMETERS -
--  object_schema
--     Schema name of the xmltype table/view
--  object_name
--     Object name of the xmltype table/view
--  hierarchy_type
--     How to enable the hierarchy. Must be one or a combination of the
--     following:
--     ENABLE_CONTENTS : enable hierarchy for contents i.e. this table will
--     store contents of resources in the repository. This flag cannot be
---    combined with ENABLE_RESMETADATA.
--     ENABLE_RESMETADATA : enable hierarchy for resource metadata i.e. this
--     table will store schema based custom metadata for resources. This flag
--     cannot be combined with ENABLE_CONTENTS.
--     ENABLE_VERSION  : version-enable the xmltype table/view. This flag
--     must be combined with either ENABLE_CONTENTS or ENABLE_RESMETADATA.
--  NOTE ON HIERARCHY TYPE: If a table is hierachy-enabled for contents or
--  resource metadata, then it can be additionally version-enabled by
--  calling this procedure. For example, a table that is hierarchy-enabled for
--  contents alone (ENABLE_CONTENTS) can be additionally version-enabled by
--  calling this procedure with hierarchy_type ENABLE_CONTENTS+ENABLE_VERSION.
--  A table that is hierarchy-enabled for contents, irrespective of whether it
--  is version-enabled or not, cannot be hierarchy-enabled for resource
--  metadata. Similarly, a table that is hierarchy-enabled for resource
--  metadata, irrespective of whether it is version-enabled or not, cannot be
--  hierarchy-enabled for contents. A table that is hierarchy-enabled and
--  version-enabled, irrespective of whether it is hierarchy-enabled for
--  contents or resource metadata, cannot be version-disabled by calling
--  this procedure.
--  NOTE ON VERSION-ENABLED TABLES: A resource that has REFs to schema-based
--  content or metadata tables/views can be version-controlled only if all its
--  REFs point to version-enabled tables/views. Thus, if its content REF is not
--  null, then the REF must point to an xmltype table/view that is version-
--  enabled and hierarchy enabled for contents. Similarly, if it has a
--  non-null schema-based metadata REF, then the REF must point to an xmltype
--  table/view that is version-enabled and hierarchy-enabled for resource
--  metadata.
--  schemareg
--     True iff called during schema registration (qmts.c).
----------------------------------------------------------------------------
PROCEDURE enable_hierarchy
(
   object_schema IN VARCHAR2,
   object_name VARCHAR2,
   hierarchy_type IN pls_integer := ENABLE_CONTENTS,
   schemareg IN BOOLEAN := FALSE
);
PRAGMA SUPPLEMENTAL_LOG_DATA(enable_hierarchy, AUTO_WITH_COMMIT);

----------------------------------------------------------------------------
-- PROCEDURE - disable_hierarchy
--     Disables XDB Hierarchy for a particular xmltype table/view
-- PARAMETERS -
--  object_schema
--     Schema name of the xmltype table/view
--  object_name
--     Object name of teh xmltype table/view
--  hierarchy_type
--     How should the hierarchy be disabled? The various options are
--     (1) DISABLE_VERSION : disable versioning on the table/view. If the table
--     or view is not version-enabled, do nothing. Otherwise, version-disable
--     the table. If the table or view has more than one version per version
--     history, throw error unless delete_old_versions is set to TRUE.
--     (2) DISABLE_ALL : disable hierarchy and disable versioning on the
--     table/view. If the table or view has more than one version per version
--     history, throw error unless delete_old_versions is set to TRUE.
--  delete_old_versions
--     Should old versions for a version history be deleted?
--     (1) TRUE : delete all versions in each version history other than the
--     one with the latest lastModifiedTime.
--     (2) FALSE : do not delete old versions. The user needs to ensure that
--     the table or view does not have more than one version per version
--     history; otherwise, an error is thrown.
----------------------------------------------------------------------------
PROCEDURE disable_hierarchy(object_schema IN VARCHAR2,
                            object_name VARCHAR2,
                            hierarchy_type IN PLS_INTEGER := DISABLE_ALL,
                            delete_old_versions IN BOOLEAN := FALSE);
PRAGMA SUPPLEMENTAL_LOG_DATA(disable_hierarchy, AUTO_WITH_COMMIT);

----------------------------------------------------------------------------
-- FUNCTION - is_hierarchy_enabled
--     Checks if the XDB Hierarchy is enabled for a given xmltype table/view
-- PARAMETERS -
--  object_schema
--     Schema name of the xmltype table/view
--  object_name
--     Object name of the xmltype table/view
--  hierarchy_type
--     The type of hierarchy to check for. Must be one of the following:
--     IS_ENABLED_CONTENTS : if table/view is hierarchy-enabled for contents
--     IS_ENABLED_RESMETADATA : if table/view is hierarchy-enabled for
--     resource metadata
--     IS_ENABLED_VERSION : if table/view is version-enabled
-- RETURN -
--     True, if given xmltype table/view has the XDB Hierarchy enabled of
--     the specified type
----------------------------------------------------------------------------
FUNCTION is_hierarchy_enabled(object_schema IN VARCHAR2,
                              object_name VARCHAR2,
                              hierarchy_type IN pls_integer
                                := IS_ENABLED_CONTENTS)
                              RETURN BOOLEAN;

---------------------------------------------
-- FUNCTION - purgeLdapCache
--     Purges ldap nickname cache
-- RETURNS
--     True if successful, false otherwise
---------------------------------------------
FUNCTION purgeLdapCache RETURN BOOLEAN;

----------------------------------------------------------------------------
-- FUNCTION - get_acloid
--     Get's an ACL OID given the XDB Hierarchy path for the ACL Resource
-- PARAMETERS -
--  acl_path
--     ACL Resource path in the XDB Hierarchy
--  acloid [OUT]
--     Returns the corresponding ACLOID to the given ACL Resource
-- RETURN -
--     True, if ACLOID is succesfully retrieved
--     The typical use of this function is to pass the acloid as an
--     argument to the SYS_CHECKACL sql operator.
----------------------------------------------------------------------------
FUNCTION get_acloid(aclpath IN VARCHAR2,
                    acloid OUT RAW) RETURN BOOLEAN;

----------------------------------------------------------------------------
-- FUNCTION - get_userid
--     Retrieves the userid for the given user name
-- PARAMETERS -
--  username
--     Name of the resource user
--  userid [OUT]
--     Returns the corresponding USERID for the given user name.
--  format (optional)
--     Format of the specified user name. By default, the name is assumed
--     to be either a database user name or a LDAP nickname. The following
--     are the allowed values for this argument :
--        DBMS_XDBZ.NAME_FORMAT_SHORT
--        DBMS_XDBZ.NAME_FORMAT_DISTINGUISHED
--        DBMS_XDBZ.NAME_FORMAT_APPLICATION
-- RETURN -
--     True, if USERID is succesfully retrieved
-- NOTE -
--     The user name is first looked up in the local database,
--     if it is not found there, and if an ldap server is available,
--     it is looked up in this latter one. In this case a GUID will be
--     returned in USERID.
--     The typical use of this function is to pass the userid as an
--     argument to the SYS_CHECKACL sql operator.
----------------------------------------------------------------------------
FUNCTION get_userid(username IN VARCHAR2,
                    userid OUT RAW,
                    format IN pls_integer := NAME_FORMAT_SHORT) RETURN BOOLEAN;

----------------------------------------------------------------------------
-- PROCEDURE - ValidateAcl
-- This function will validate the following aspects of the acl:
-- (1) Validate the security class for the acl. This validates the
--     security class and all its parents.
-- (2) Check for existence of the specified roles and users in each of the
--     aces.
-- (3) Validate that all custom privileges specified in the acl are
--     defined in the associated security class.
-- (4) Validate that security class of the parent acl is in the ancestor
--     tree of  the associated security class.
-- PARAMETERS -
--  acloid [in]
--     aclid of the acl to be validated
--     skip system constraining acls from certain validations(default false)
----------------------------------------------------------------------------
PROCEDURE ValidateAcl(acloid IN RAW,
                      skip_scacl IN pls_integer := SKIP_SYSCONSACL_FLG)
;

----------------------------------------------------------------------------
-- PROCEDURE - ValidateFusionAcl
-- This function will validate all aspects of the acl (covered by
-- ValidateAcl) plus the following
-- (1) For a given acl chain, it must have a system constraining acl at
--     its root.
-- (2) For any non-system constraining acl in this chain, all inheritance
--     relationships till the first system constraining acl up in its
--     chain should be constraining.
-- (3) For any acl in the system, which has a system constraining acl as its
--     parent, the inheritance relationship between the two should be
--     constraining.
-- PARAMETERS -
--  acloid [in]
--     aclid of the acl to be validated
----------------------------------------------------------------------------
PROCEDURE ValidateFusionAcl(acloid IN RAW);

----------------------------------------------------------------------------
-- FUNCTION - add_application_principal
--   Registers with XDB an Application user or workgroup/role.
-- PARAMETERS -
--   name - The name of the user or role/workgroup
--   flags - Whether user (if XDB.DBMS_XDBZ.APPLICATION_USER, default)
--           or role (XDB.DBMS_XDBZ.APPLICATION_ROLE)
-- RETURNS -
--   The status of the addition (TRUE if successful, FALSE otherwise)
----------------------------------------------------------------------------
FUNCTION add_application_principal(
         name IN VARCHAR2,
         flags IN PLS_INTEGER := XDB.DBMS_XDBZ.APPLICATION_USER)
 return BOOLEAN;
PRAGMA SUPPLEMENTAL_LOG_DATA(add_application_principal, UNSUPPORTED_WITH_COMMIT);

----------------------------------------------------------------------------
-- FUNCTION - change_application_membership
--   Adds or removes an Application user to/from a role/workgroup.
--   If either the user or the role/workgroup have not been
--     previously registered with XDB, registration is done.
-- PARAMETERS -
--   user_name - The name of the Application user/role
--   group_name - The name of the role/workgroup
--   op_mode - Whether the user/role is to be added (XDB.DBMS_XDBZ.MODE_MEMBERSHIP_ADD),
--             which is the default, or deleted (XDB.DBMS_XDBZ.MODE_MEMBERSHIP_DELETE)
--             to/from the workgroup/role.
--   user_flags - Whether user_name is the name of a user
--                (XDB.DBMS_XDBZ.APPLICATION_USER, default), or
--                group (XDB.DBMS_XDBZ.APPLICATION_ROLE). Currently,
--                only XDB.DBMS_XDBZ.APPLICATION_USER supported.
-- RETURNS -
--   The status of the operation (TRUE if successful, FALSE otherwise)
----------------------------------------------------------------------------
FUNCTION change_application_membership(
         user_name IN VARCHAR2,
         group_name IN VARCHAR2,
         op_mode IN PLS_INTEGER := XDB.DBMS_XDBZ.MODE_MEMBERSHIP_ADD,
         user_flags IN NUMBER := XDB.DBMS_XDBZ.APPLICATION_USER)
  return BOOLEAN;
PRAGMA SUPPLEMENTAL_LOG_DATA(change_application_membership, UNSUPPORTED_WITH_COMMIT);

----------------------------------------------------------------------------
-- FUNCTION - delete_application_principal
--   Delete all information about an Application user or role/workgroup.
-- PARAMETERS -
--  name - Name of the Application user or role/workgroup
--  op_mode - Whether to raise an error if deleting a role/workgroup with
--            active members (if XDB.DBMS_XDBZ.DELETE_APP_NOFORCE, default),
--            or to delete all group membership information otherwise
--            (if XDB.DBMS_XDBZ.DELETE_APP_FORCE).
--            Applies only in the case of role/workgroup names.
-- RETURNS -
--   The status of the deletion (TRUE if successful, FALSE otherwise)
--
----------------------------------------------------------------------------
FUNCTION delete_application_principal(
         name IN VARCHAR2,
         op_mode IN PLS_INTEGER := XDB.DBMS_XDBZ.DELETE_APP_NOFORCE)
 return BOOLEAN;
PRAGMA SUPPLEMENTAL_LOG_DATA(delete_application_principal, UNSUPPORTED_WITH_COMMIT);

----------------------------------------------------------------------------
-- FUNCTION - purgeApplicationCache
--  Purges the shared cache of GUIDs to Application user or roles names mappings.
--
-- RETURNS -
--   The status of the operation (TRUE if successful, FALSE otherwise)
----------------------------------------------------------------------------
FUNCTION purgeApplicationCache RETURN BOOLEAN;

-----------------------------------------------------------------------------
-- FUNCTION - set_application_principal
--  If the current user and schema are trusted (determined based on
--  XDB configuration document, allows the passed application user
--  to be set as the current user in the session, for the purpose of
--  XDB repository access. This API is to be used for local application
--  group membership scheme.
-- PARAMETERS -
--  principal_name - Name of the application user (mandatory if local
--       application store
--  principal_guid - GUID of the application user; mandatory only under
--       dynamic group membership scheme
--  allow_registration - Used only under local group scheme;
--        if true and the application user is not already
--        known to XDB, then the user is automatically registered with XDB.
--  group_membership - Used only under dynamic group scheme;
--        Concatenated list of GUIDs of all application
--        roles currently enabled for the application user.
-- RETURNS -
--  TRUE if the user was successfully set in the session (FALSE otherwise).
-----------------------------------------------------------------------------
FUNCTION set_application_principal(principal_name IN VARCHAR2 := NULL,
                                   allow_registration IN BOOLEAN := TRUE,
                                   principal_guid IN RAW := NULL,
                                   group_membership IN RAW := NULL)
RETURN BOOLEAN;
PRAGMA SUPPLEMENTAL_LOG_DATA(set_application_principal, UNSUPPORTED_WITH_COMMIT);

FUNCTION reset_application_principal RETURN BOOLEAN;

end dbms_xdbz;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XMLDOM" AUTHID CURRENT_USER IS

----------------------------------------------------------------------
-- DOM API
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Constants and Type Declarations
----------------------------------------------------------------------

--
-- DOM Node types (as returned by getNodeType)
--
ELEMENT_NODE CONSTANT PLS_INTEGER                := 1;
ATTRIBUTE_NODE CONSTANT PLS_INTEGER              := 2;
TEXT_NODE CONSTANT PLS_INTEGER                   := 3;
CDATA_SECTION_NODE CONSTANT PLS_INTEGER          := 4;
ENTITY_REFERENCE_NODE CONSTANT PLS_INTEGER       := 5;
ENTITY_NODE CONSTANT PLS_INTEGER                 := 6;
PROCESSING_INSTRUCTION_NODE CONSTANT PLS_INTEGER := 7;
COMMENT_NODE CONSTANT PLS_INTEGER                := 8;
DOCUMENT_NODE CONSTANT PLS_INTEGER               := 9;
DOCUMENT_TYPE_NODE CONSTANT PLS_INTEGER          := 10;
DOCUMENT_FRAGMENT_NODE CONSTANT PLS_INTEGER      := 11;
NOTATION_NODE CONSTANT PLS_INTEGER               := 12;

--
-- DOMException types
--
INDEX_SIZE_ERR              EXCEPTION;
DOMSTRING_SIZE_ERR          EXCEPTION;
HIERARCHY_REQUEST_ERR       EXCEPTION;
WRONG_DOCUMENT_ERR          EXCEPTION;
INVALID_CHARACTER_ERR       EXCEPTION;
NO_DATA_ALLOWED_ERR         EXCEPTION;
NO_MODIFICATION_ALLOWED_ERR EXCEPTION;
NOT_FOUND_ERR               EXCEPTION;
NOT_SUPPORTED_ERR           EXCEPTION;
INUSE_ATTRIBUTE_ERR         EXCEPTION;
INVALID_STATE_ERR           EXCEPTION;
SYNTAX_ERR                  EXCEPTION;
INVALID_MODIFICATION_ERR    EXCEPTION;
NAMESPACE_ERR               EXCEPTION;
INVALID_ACCESS_ERR          EXCEPTION;

--
-- DOM interface types
--
SUBTYPE domtype IS RAW(13);

TYPE DOMNode IS RECORD (id RAW(13));
TYPE DOMNamedNodeMap IS RECORD (id RAW(13));
TYPE DOMNodeList IS RECORD (id RAW(13));
TYPE DOMAttr IS RECORD (id RAW(13));
TYPE DOMCDataSection IS RECORD (id RAW(13));
TYPE DOMCharacterData IS RECORD (id RAW(13));
TYPE DOMComment IS RECORD (id RAW(13));
TYPE DOMDocumentFragment IS RECORD (id RAW(13));
TYPE DOMElement IS RECORD (id RAW(13));
TYPE DOMEntity IS RECORD (id RAW(13));
TYPE DOMEntityReference IS RECORD (id RAW(13));
TYPE DOMNotation IS RECORD (id RAW(13));
TYPE DOMProcessingInstruction IS RECORD (id RAW(13));
TYPE DOMText IS RECORD (id RAW(13));
TYPE DOMImplementation IS RECORD (id RAW(13));
TYPE DOMDocumentType IS RECORD (id RAW(13));
TYPE DOMDocument IS RECORD (id RAW(13));
TYPE DOMStreamHandle IS RECORD (id RAW(12));
/*
SUBTYPE DOMNode IS domtype;
SUBTYPE DOMNamedNodeMap IS domtype;
SUBTYPE DOMNodeList IS domtype;
SUBTYPE DOMAttr IS domtype;
SUBTYPE DOMCDataSection IS domtype;
SUBTYPE DOMCharacterData IS domtype;
SUBTYPE DOMComment IS domtype;
SUBTYPE DOMDocumentFragment IS domtype;
SUBTYPE DOMElement IS domtype;
SUBTYPE DOMEntity IS domtype;
SUBTYPE DOMEntityReference IS domtype;
SUBTYPE DOMNotation IS domtype;
SUBTYPE DOMProcessingInstruction IS domtype;
SUBTYPE DOMText IS domtype;
SUBTYPE DOMImplementation IS domtype;
SUBTYPE DOMDocumentType IS domtype;
SUBTYPE DOMDocument IS domtype;
*/

-----------------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------------

---------------------------------------------------------------------------
-- Interface DOMImplementation:
--
--    hasFeature
--    createDocument
--
--    implementation_isNull (Extension)
--
---------------------------------------------------------------------------


/**
 * DOM DOMImplementation interface methods
 * These methods implement the DOM DOMImplementation interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-102161490
 */
FUNCTION hasFeature(di DOMImplementation, feature IN VARCHAR2,
                    version IN VARCHAR2) RETURN BOOLEAN;

FUNCTION createDocument(namespaceURI IN VARCHAR2, qualifiedName IN VARCHAR2,
                        doctype IN DOMType := NULL) RETURN DOMDocument;

/**
 * DOM Node XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(di DOMImplementation) RETURN BOOLEAN;


---------------------------------------------------------------------------
-- DOM Node interface:
--
--    getNodeName
--    getNodeValue
--    setNodeValue
--    getNodeType
--    getParentNode
--    getChildNodes
--    getFirstChild
--    getLastChild
--    getPreviousSibling
--    getNextSibling
--    getAttributes
--    getOwnerDocument
--    getPrefix
--    setPrefix
--    insertBefore
--    replaceChild
--    removeChild
--    appendChild
--    hasChildNodes
--    cloneNode

--    node_isNull (Extension)
--    writeToFile (Extension)
--    node_writeToBuffer (Extension)
--    node_writeToClob (Extension)
--    getNodeFromFragment (Extension)
--    writeToFile (given charset, Extension)
--    writeToBuffer (given charset, Extension)
--    writeToClob (given charset, Extension)
--    makeAttr (Extension)
--    makeCDataSection (Extension)
--    makeCharacterData (Extension)
--    makeComment (Extension)
--    makeDocumentFragment (Extension)
--    makeDocumentType (Extension)
--    makeElement (Extension)
--    makeEntity (Extension)
--    makeEntityReference (Extension)
--    makeNotation (Extension)
--    makeProcessingInstruction (Extension)
--    makeText (Extension)
--    makeDocument (Extension)
--    getSchemaNode (Extension)
--    freeNode (Extension)

--    numChildNodes (available for C wrapper)
--    getQualifiedName (available for C wrapper)
--    getNodeNameSpace (available for C wrapper)
--    getNodePrefix (available for C wrapper)
--    getNodeLocal (available for C wrapper)
---------------------------------------------------------------------------
--

/**
 * DOM Node interface methods
 * These methods implement the DOM Node interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-1950641247
 */
FUNCTION getNodeName(n DOMNode) RETURN VARCHAR2;
FUNCTION getNodeValue(n domnode) RETURN VARCHAR2;
PROCEDURE setNodeValue(n DOMNode, nodeValue IN VARCHAR2);
FUNCTION getNodeType(n DOMNode) RETURN pls_INTEGER;
FUNCTION getParentNode(n DOMNode) RETURN DOMNode;

-- FUNCTION domnode_getChildNodes (n IN domnode) RETURN DOMNodeList;
FUNCTION getChildNodes(n DOMNode) RETURN DOMNodeList;

FUNCTION getFirstChild(n DOMNode) RETURN DOMNode;
FUNCTION getLastChild(n DOMNode) RETURN DOMNode;
FUNCTION getPreviousSibling(n DOMNode) RETURN DOMNode;
FUNCTION getNextSibling(n DOMNode) RETURN DOMNode;
FUNCTION getAttributes(n DOMNode) RETURN DOMNamedNodeMap;
FUNCTION getOwnerDocument(n DOMNode) RETURN DOMDocument;
FUNCTION getPrefix(n domnode) RETURN VARCHAR2;
FUNCTION getNodeFromFragment (fragment IN sys.xmltype) return DOMNode;
PROCEDURE setPrefix(n DOMNode, prefix IN VARCHAR2);
FUNCTION insertBefore(n DOMNode, newChild IN DOMNode, refChild IN DOMNode)
RETURN DOMNode;
FUNCTION replaceChild(n DOMNode, newChild IN DOMNode, oldChild IN DOMNode)
RETURN DOMNode;
FUNCTION removeChild(n DOMNode, oldChild IN DOMNode) RETURN DOMNode;
FUNCTION appendChild(n DOMNode, newChild IN DOMNode) RETURN DOMNode;
FUNCTION hasChildNodes(n DOMNode) RETURN BOOLEAN;
FUNCTION hasAttributes(n DOMNode) RETURN BOOLEAN;
FUNCTION cloneNode(n DOMNode, deep boolean) RETURN DOMNode;

/**
 * DOM Node XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(n DOMNode) RETURN BOOLEAN;

-- Write DOMNode object using the database character set
PROCEDURE writeToFile(n DOMNode, fileName VARCHAR2);
PROCEDURE writeToBuffer(n DOMNode, buffer IN OUT VARCHAR2);
PROCEDURE writeToClob(n DOMNode, cl IN OUT CLOB);

-- Write DOMNode object using database character set and Print Options
PROCEDURE writeToFile(n DOMNode, fileName VARCHAR2,
                      pflag IN NUMBER, indent IN NUMBER);
PROCEDURE writeToBuffer(n DOMNode, buffer IN OUT VARCHAR2,
                       pflag IN NUMBER, indent IN NUMBER);
PROCEDURE writeToClob(n DOMNode, cl IN OUT CLOB,
                      pflag IN NUMBER, indent IN NUMBER);

-- Write DOMNode object using the specified character set
PROCEDURE writeToFile(n DOMNode, fileName VARCHAR2, charset VARCHAR2);
PROCEDURE writeToBuffer(n DOMNode, buffer IN OUT VARCHAR2, charset VARCHAR2);
PROCEDURE writeToClob(n DOMNode, cl IN OUT CLOB, charset VARCHAR2);

-- Write DOMNode object using the specified character set and print options
PROCEDURE writeToFile(n DOMNode, fileName VARCHAR2, charset VARCHAR2,
                      pflag IN NUMBER, indent IN NUMBER);
PROCEDURE writeToBuffer(n DOMNode, buffer IN OUT VARCHAR2, charset VARCHAR2,
                       pflag IN NUMBER, indent IN NUMBER);
PROCEDURE writeToClob(n DOMNode, cl IN OUT CLOB, charset VARCHAR2,
                      pflag IN NUMBER, indent IN NUMBER);

-- Cast DOMNode objects
FUNCTION makeAttr(n DOMNode) RETURN DOMAttr;
FUNCTION makeCDataSection(n DOMNode) RETURN DOMCDataSection;
FUNCTION makeCharacterData(n DOMNode) RETURN DOMCharacterData;
FUNCTION makeComment(n DOMNode) RETURN DOMComment;
FUNCTION makeDocumentFragment(n DOMNode) RETURN DOMDocumentFragment;
FUNCTION makeDocumentType(n DOMNode) RETURN DOMDocumentType;
FUNCTION makeElement(n DOMNode) RETURN DOMElement;
FUNCTION makeEntity(n DOMNode) RETURN DOMEntity;
FUNCTION makeEntityReference(n DOMNode) RETURN DOMEntityReference;
FUNCTION makeNotation(n DOMNode) RETURN DOMNotation;
FUNCTION makeProcessingInstruction(n DOMNode) RETURN DOMProcessingInstruction;
FUNCTION makeText(n DOMNode) RETURN DOMText;
FUNCTION makeDocument(n DOMNode) RETURN DOMDocument;

FUNCTION  getSchemaNode(n DOMnode) RETURN DOMnode;
PROCEDURE getNamespace(n DOMnode, data IN OUT VARCHAR2);
PROCEDURE getLocalName(n DOMnode, data OUT VARCHAR2);
PROCEDURE getExpandedName(n DOMnode, data OUT VARCHAR2);
PROCEDURE freeNode(n DOMnode);



-------------------------------------------------------------------------------
-- The following functions and procedures are added to support the 4 Streaming
-- models defined for Large Node access
-------------------------------------------------------------------------------
-- Get-Pull methods
-------------------------------------------------------------------------------
FUNCTION getNodeValueAsBinaryStream (n in domnode)
                                        return sys.utl_BinaryInputStream;
FUNCTION getNodeValueAsCharacterStream (n      in domnode)
                                        return sys.utl_CharacterInputStream;
----------------------------------------------------------------------------
-- Get-Push methods
----------------------------------------------------------------------------
PROCEDURE getNodeValueAsBinaryStream (n         in domnode,
                                      pushValue in out sys.utl_BinaryOutputStream);
PROCEDURE getNodeValueAsCharacterStream (n         in domnode,
                                         pushValue in out sys.utl_CharacterOutputStream);
----------------------------------------------------------------------------
-- Set-Pull methods
----------------------------------------------------------------------------
PROCEDURE setNodeValueAsBinaryStream (n         in domnode,
                                      nodeValue in out sys.utl_BinaryInputStream);
PROCEDURE setNodeValueAsCharacterStream (n         in domnode,
                                      nodeValue in out sys.utl_CharacterInputStream);
----------------------------------------------------------------------------
-- "Deferred" Set-Pull
----------------------------------------------------------------------------
PROCEDURE setNodeValueAsDeferredBfile (n     in domnode,
                                       value in bfile);
PROCEDURE setNodeValueAsDeferredBlob (n     in domnode,
                                      value in blob);
PROCEDURE setNodeValueAsDeferredClob (n     in domnode,
                                      value in clob);
----------------------------------------------------------------------------
-- Set-Push methods
----------------------------------------------------------------------------
FUNCTION setNodeValueAsBinaryStream (n in domnode) return                                     sys.utl_BinaryOutputStream;
FUNCTION setNodeValueAsCharacterStream (n in domnode) return
                                     sys.utl_CharacterOutputStream;
----------------------------------------------------------------------------
-- Determining if use of Binary Stream is valid
----------------------------------------------------------------------------
FUNCTION useBinaryStream (n in domnode) return boolean;
FUNCTION xmld_useBinStream (n in raw) return boolean;
----------------------------------------------------------------------------
-- XMLBinaryInputStream methods
----------------------------------------------------------------------------
FUNCTION createXMLBinaryInputStream (n in raw) return raw;
FUNCTION BinaryInputStreamAvailable (handle in raw) return integer;
PROCEDURE readBytesFromBIS1 (   handle in RAW,
                                bytes in out raw
--                                offset in pls_integer,
--                                numBytes in pls_integer
);

FUNCTION readBinaryInputStream (handle   in raw,
                                numBytes in integer) return raw;
PROCEDURE readBinaryInputStream (handle   in            raw,
                                 bytes    in out nocopy raw,
                                 numBytes in out        integer);
PROCEDURE readBinaryInputStream (handle   in            raw,
                                 bytes    in out nocopy raw,
                                 offset   in            integer,
                                 numBytes in out        integer);
PROCEDURE closeBinaryInputStream (handle in raw);
----------------------------------------------------------------------------
-- XMLBinaryOutputStream methods
----------------------------------------------------------------------------
FUNCTION createXMLBinaryOutputStream (n in raw) return raw;
FUNCTION writeBinaryOutputStream (handle   in            raw,
                                  bytes    in out nocopy raw,
                                  numBytes in            integer)
                            return integer;
PROCEDURE writeBinaryOutputStream (handle   in            raw,
                                   bytes    in out nocopy raw,
                                   numBytes in out        integer);
PROCEDURE writeBinaryOutputStream (handle   in            raw,
                                   bytes    in out nocopy raw,
                                   offset   in            integer,
                                   numBytes in out        integer);
PROCEDURE flushBinaryOutputStream (handle in raw);
PROCEDURE closeBinaryOutputStream (handle in raw);
----------------------------------------------------------------------------
-- XMLCharacterInputStream methods
----------------------------------------------------------------------------
FUNCTION createXMLCharacterInputStream (n in raw) return raw;
FUNCTION CharacterInputStreamAvailable (handle in raw) return integer;
FUNCTION readCharacterInputStream (handle   in raw,
                                   numChars in integer,
                                   lineFeed in boolean) return varchar2;
PROCEDURE readCharacterInputStream (handle   in            raw,
                                    chars    in out nocopy varchar2,
                                    numChars in out        integer,
                                    lineFeed in            boolean);
PROCEDURE readCharacterInputStream (handle   in            raw ,
                                    chars    in out nocopy varchar2,
                                    offset   in            integer ,
                                    numChars in out        integer,
                                    lineFeed in            boolean);
PROCEDURE closeCharacterInputStream (handle in raw);
----------------------------------------------------------------------------
-- XMLCharacterOutputStream methods
----------------------------------------------------------------------------
FUNCTION createXMLCharacterOutputStream (n in raw) return raw;
FUNCTION writeCharacterOutputStream (handle   in            raw,
                                     chars    in out nocopy varchar2,
                                     numChars in            integer,
                                     lineFeed in            boolean) return integer;

PROCEDURE writeCharacterOutputStream (handle   in            raw,
                                      chars    in out nocopy varchar2,
                                      numChars in out        integer,
                                      lineFeed in            boolean);

PROCEDURE writeCharacterOutputStream (handle   in            raw,
                                      chars    in out nocopy varchar2,
                                      offset   in            integer,
                                      numChars in out        integer,
                                      lineFeed in            boolean);

PROCEDURE flushCharacterOutputStream (handle in raw);
PROCEDURE closeCharacterOutputStream (handle in raw);

----------------------------------------------------------------------------
-- isNull methods
----------------------------------------------------------------------------

FUNCTION StreamIsNull(handle raw)  RETURN BOOLEAN;

---------------------------------------------------------------------------
-- DOM NodeList interface:
--
--    nodelist_item
--    nodelist_getLength

--    nodelist_isNull (Extension)

--   freeNodeList (Extension)
---------------------------------------------------------------------------

/**
 * DOM NodeList interface methods
 * These methods implement the DOM NodeList interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-536297177
*/

 -- item:
 --
 -- Get the indexth item in the collection.  If index is greater than or
 -- equal to the number of nodes in the list, this returns null.
 --
 -- PARAMETERS
 --      nl       - input DOM node list
 --      idx      - index into the list
 -- RETURN
 --      indexed child node
 -- EXCEPTIONS
 --   <exception name> - <description>
 -- NOTES
 --
 --
 -- FUNCTION domnodel_item (nl IN DOMNodeList,
 --                         idx IN PLS_INTEGER) RETURN DOMNode;
FUNCTION item(nl DOMNodeList, idx IN PLS_INTEGER) RETURN DOMNode;

FUNCTION getLength(nl DOMNodeList) RETURN pls_INTEGER;

/**
 * DOM Node XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(nl DOMNodeList) RETURN BOOLEAN;


PROCEDURE freeNodeList(nl DOMNodeList);
---------------------------------------------------------------------------
-- DOM NamedNodeMap interface:
--
--    getNamedItem
--    setNamedItem
--    removeNamedItem
--    namednodemap_item
--    namednodemap_getLength

--    namednodemap_isNull (Extension)

---------------------------------------------------------------------------

/**
 * DOM Node interface methods
 * These methods implement the DOM Node interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-1950641247
 */

FUNCTION getNamedItem(nnm DOMNamedNodeMap, name IN VARCHAR2) RETURN DOMNode;
FUNCTION getNamedItem(nnm DOMNamedNodeMap, name IN VARCHAR2,
                      ns IN VARCHAR2) RETURN DOMNode;
FUNCTION setNamedItem(nnm DOMNamedNodeMap, arg IN DOMNode) RETURN DOMNode;
FUNCTION setNamedItem(nnm DOMNamedNodeMap, arg IN DOMNode,
                      ns IN VARCHAR2) RETURN DOMNode;
FUNCTION removeNamedItem(nnm DOMNamedNodeMap, name IN VARCHAR2) RETURN DOMNode;
FUNCTION removeNamedItem(nnm DOMNamedNodeMap, name IN VARCHAR2,
                         ns IN VARCHAR2) RETURN DOMNode;
FUNCTION item(nnm DOMNamedNodeMap, idx IN pls_integer)
                           RETURN domNode;
FUNCTION getLength(nnm DOMNamedNodeMap) RETURN pls_integer;

/**
 * DOM Node XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(nnm DOMNamedNodeMap) RETURN BOOLEAN;


---------------------------------------------------------------------------
-- DOM Character Data interface:
--
--    cdata_getData
--    cdata_setData
--    cdata_getLength
--    substringData
--    appendData
--    insertData
--    deleteData
--    replaceData
--
--    cdata_isNull (extension)
--    cdata_makeNode (extension)

---------------------------------------------------------------------------

/**
 * DOM CharacterData interface methods
 * These methods implement the DOM CharacterData interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-FF21A306
 */

 -- getData:
 --
 -- Get data for character node
 --
 -- PARAMETERS
 --      cd       - input DOM Character node
 -- RETURN
 --      data for character node
 -- EXCEPTIONS
 --   <exception name> - <description>
 -- NOTES
 --      Returns data for character node, or NULL if node isn't
 --      character-type.
 --
 -- PROCEDURE domcdata_getCharData (cd IN DOMNode, data OUT VARCHAR2);
FUNCTION getData(cd domcharacterdata) return VARCHAR2;

PROCEDURE setData(cd DOMCharacterData, data IN VARCHAR2);
FUNCTION getLength(cd DOMCharacterData) RETURN pls_integer;
FUNCTION substringData(cd DOMCharacterData, offset IN PLS_INTEGER,
                        cnt IN PLS_integer) RETURN VARCHAR2;
PROCEDURE appendData(cd DOMCharacterData, arg IN VARCHAR2);
PROCEDURE insertData(cd DOMCharacterData, offset IN PLS_INTEGER, arg IN VARCHAR2);
PROCEDURE deleteData(cd DOMCharacterData, offset IN PLS_INTEGER, cnt IN PLS_INTEGER);
PROCEDURE replaceData(cd DOMCharacterData, offset IN PLS_INTEGER,
                      cnt IN PLS_INTEGER, arg IN VARCHAR2);

/**
 * DOM Node XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(cd DOMCharacterData) RETURN BOOLEAN;

-- Cast
FUNCTION makeNode(cd DOMCharacterData) RETURN DOMNode;


---------------------------------------------------------------------------
-- DOM Attribute interface:
--
--    getName
--    getOwnerElement
--    getSpecified
--    getValue
--    setValue
--
--    attr_isNull (Extension)
--    attr_makeNode (Extension)
--    attr_getQualifiedName (Extension)
--    attr_getNamespace (Extension)
--    attr_getLocalName (Extension)
--    attr_getExpandedName (Extension)
--
---------------------------------------------------------------------------

/**
 * DOM interface methods
 * These methods implement the DOM Node interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-1950641247
 */

FUNCTION getName(a DOMAttr) return varchar2;
FUNCTION getOwnerElement(a DOMAttr) RETURN DOMElement;
FUNCTION getSpecified(a DOMAttr) RETURN BOOLEAN;
FUNCTION getValue (a IN DOMAttr) return varchar2;
PROCEDURE setValue(a DOMAttr, newvalue IN VARCHAR2);

/**
 * DOM XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(a DOMAttr) RETURN BOOLEAN;

-- Cast
FUNCTION makeNode(a DOMAttr) RETURN DOMNode;

FUNCTION getQualifiedName(a DOMAttr) return varchar2;
FUNCTION getNamespace(a DOMAttr) return varchar2;
FUNCTION getLocalName(a DOMAttr) return varchar2;
FUNCTION getExpandedName(a DOMAttr) return varchar2;


---------------------------------------------------------------------------
-- DOM Element interface:
--
--    getTagName
--    getAttribute
--    hasAttribute
--    setAttribute
--    removeAttribute
--    getAttributeNode
--    setAttributeNode
--    removeAttributeNode
--    element_getElementsByTagName
--
--    element_isNull (Extension)
--    element_makeNode (Extension)
--    normalize (extension)
--    element_getQualifiedName (extension)
--    element_getNamespace (extension)
--    element_getLocalName (extension)
--    element_getExpandedName (extension)
--    getChildrenByTagName (extension)
--    getChildrenByTagName (extension)
--    resolveNamespacePrefix (extension)
--    freeElement (extension)
--
---------------------------------------------------------------------------

/**
 * DOM Element interface methods
 * These methods implement the DOM Element interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-745549614
 */

FUNCTION getTagName(elem DOMElement) return varchar2;
FUNCTION getAttribute(elem DOMElement, name IN VARCHAR2) return varchar2;
FUNCTION getAttribute(elem DOMElement, name IN VARCHAR2,
                      ns IN VARCHAR2) return varchar2;
FUNCTION hasAttribute(elem DOMElement, name IN VARCHAR2) return BOOLEAN;
FUNCTION hasAttribute(elem DOMElement, name IN VARCHAR2,
                      ns IN VARCHAR2) return BOOLEAN;
PROCEDURE setAttribute(elem DOMElement, name IN VARCHAR2, newvalue IN VARCHAR2);
PROCEDURE setAttribute(elem DOMElement, name IN VARCHAR2, newvalue IN VARCHAR2,
                       ns IN VARCHAR2);
PROCEDURE removeAttribute(elem DOMElement, name IN VARCHAR2);
PROCEDURE removeAttribute(elem DOMElement, name IN VARCHAR2, ns IN VARCHAR2);
FUNCTION getAttributeNode(elem DOMElement, name IN VARCHAR2) RETURN DOMAttr;
FUNCTION getAttributeNode(elem DOMElement, name IN VARCHAR2,
                          ns IN VARCHAR2) RETURN DOMAttr;
FUNCTION setAttributeNode(elem DOMElement, newAttr IN DOMAttr) RETURN DOMAttr;
FUNCTION setAttributeNode(elem DOMElement, newAttr IN DOMAttr,
                          ns IN VARCHAR2) RETURN DOMAttr;
FUNCTION removeAttributeNode(elem DOMElement, oldAttr IN DOMAttr)
RETURN DOMAttr;
FUNCTION getElementsByTagName(elem DOMElement, name IN VARCHAR2)
                              RETURN DOMNodeList;
PROCEDURE freeElement(elem DOMElement);

/**
 * DOM XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(elem DOMElement) RETURN BOOLEAN;

-- Cast
FUNCTION makeNode(elem DOMElement) RETURN domnode;

PROCEDURE normalize(elem DOMElement);
FUNCTION getQualifiedName(elem DOMElement) return varchar2;
FUNCTION getNamespace(elem DOMElement) return varchar2;
FUNCTION getLocalName(elem DOMElement) return varchar2;
FUNCTION getExpandedName(elem DOMElement) return varchar2;
FUNCTION getChildrenByTagName(elem DOMElement, name varchar2)
                              return DOMNodeList;
FUNCTION getChildrenByTagName(elem DOMElement, name varchar2, ns varchar2)
                              return DOMNodeList;
FUNCTION getElementsByTagName(elem DOMElement, name IN VARCHAR2,
                                        ns varchar2) RETURN DOMNodeList;
PROCEDURE resolveNamespacePrefix(elem DOMElement, prefix varchar2,
                                                  data OUT VARCHAR2);
FUNCTION resolveNamespacePrefix(elem DOMElement, prefix varchar2)
                                return VARCHAR2;


---------------------------------------------------------------------------
-- Interface DOMText:
--
--    splitText
--
--    text_isNull (extension)
--    text_makeNode (extension)
---------------------------------------------------------------------------

/**
 * DOM Text interface methods
 * These methods implement the DOM Text interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-1312295772
*/

FUNCTION splitText(t DOMText, offset IN PLS_INTEGER) RETURN DOMText;

/**
 * DOM XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(t DOMText) RETURN BOOLEAN;

-- Cast
FUNCTION makeNode(t DOMText) RETURN DOMNode;


---------------------------------------------------------------------------
-- Interface DOMComment
--
--    comment_isNull (extension)
--    makeNode (extension)
--
---------------------------------------------------------------------------

/**
 * DOM XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(com DOMComment) RETURN BOOLEAN;

-- Cast
FUNCTION makeNode(com DOMComment) RETURN DOMNode;


---------------------------------------------------------------------------
-- Interface DOMCDATASection
--
--    cdatasection_isNull (extension)
--    makeNode (extension)
--
---------------------------------------------------------------------------

/**
 * DOM XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(cds DOMCDATASection) RETURN BOOLEAN;

-- Cast
FUNCTION makeNode(cds DOMCDATASection) RETURN DOMNode;


---------------------------------------------------------------------------
-- Interface Document Type:
--
--    getName
--    getEntities
--    getNotations
--    getpublicid (dom 2)
--    getsystemid (dom 2)
--
--    doctype_isNull (extension)
--    makeNode (extension)
--    findEntity (extension)
--    findNotation (extension)
--
---------------------------------------------------------------------------

/**
 * DOM DocumentType interface methods
 * These methods implement the DOM DocumentType interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-412266927
 */
FUNCTION getName(dt DOMDocumentType) return varchar2;
FUNCTION getEntities(dt DOMDocumentType) RETURN DOMNamedNodeMap;
FUNCTION getNotations(dt DOMDocumentType) RETURN DOMNamedNodeMap;

-- DOM 2
FUNCTION getPublicId(dt DOMDocumentType) return varchar2;
FUNCTION getSystemId(dt DOMDocumentType) return varchar2;

/**
 * DOM XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(dt DOMDocumentType) RETURN BOOLEAN;

-- Cast
FUNCTION makeNode(dt DOMDocumentType) RETURN DOMNode;

-- Other
FUNCTION findEntity(dt DOMDocumentType, name varchar2, par boolean)
                    return DOMEntity;
FUNCTION findNotation(dt DOMDocumentType, name varchar2) return DOMNotation;

---------------------------------------------------------------------------
-- Interface DOMNotation
--
--    getPublicId
--    getSystemId
--
--    notation_isNull (extension)
--    makeNode (extension)
--
---------------------------------------------------------------------------

/**
 * DOM Notation interface methods
 * These methods implement the DOM Notation interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-5431D1B9
 */

FUNCTION getPublicId(n DOMNotation) return varchar2;
FUNCTION getSystemId(n DOMNotation) return varchar2;

/**
 * DOM XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(n DOMNotation) RETURN BOOLEAN;

-- Cast
FUNCTION makeNode(n DOMNotation) RETURN DOMNode;


---------------------------------------------------------------------------
-- Interface DOMEntity:
--
--    getPublicID
--    getSystemID
--    getNotationName
--
--    entity_isNull (extension)
--    makeNode (extension)
--
---------------------------------------------------------------------------

/**
 * DOM Entity interface methods
 * These methods implement the DOM Entity interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-527DCFF2
 */
FUNCTION getPublicId(ent DOMEntity) return varchar2;
FUNCTION getSystemId(ent DOMEntity) return varchar2;
FUNCTION getNotationName(ent DOMEntity) return varchar2;

/**
 * DOM XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(ent DOMEntity) RETURN BOOLEAN;

-- Cast
FUNCTION makeNode(ent DOMEntity) RETURN DOMNode;


---------------------------------------------------------------------------
-- Interface DOMEntityReference
--
--    entityref_isNull (extension)
--    makeNode (extension)
--
---------------------------------------------------------------------------

/**
 * DOM XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(eref DOMEntityReference) RETURN BOOLEAN;

-- Cast
FUNCTION makeNode(eref DOMEntityReference) RETURN DOMNode;


---------------------------------------------------------------------------
-- Interface Processing Instruction:
--
--    pi_getData
--    getTarget
--    pi_setData
--
--    pi_isNull (extension)
--    pi_makeNode (extension)
--
---------------------------------------------------------------------------

/**
 * DOM ProcessingInstruction interface methods
 * These methods implement the DOM ProcessingInstruction interface as
 * specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-1004215813
 */

FUNCTION getData(pi DOMProcessingInstruction) return varchar2;
FUNCTION getTarget(pi DOMProcessingInstruction) return varchar2;
PROCEDURE setData(pi DOMProcessingInstruction, data IN VARCHAR2);

/**
 * DOM XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(pi DOMProcessingInstruction) RETURN BOOLEAN;

-- Cast
FUNCTION makeNode(pi DOMProcessingInstruction) RETURN DOMNode;


---------------------------------------------------------------------------
-- Interface DocumentFragment:
--
--    docfrag_isNull (extension)
--    makeNode (extension)
--
----------------------------------------------------------------------------

/**
 * DOM XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(df DOMDocumentFragment) RETURN BOOLEAN;

-- Cast
FUNCTION makeNode(df DOMDocumentFragment) RETURN DOMNode;

PROCEDURE writeToBuffer(df DOMDocumentFragment, buffer IN OUT VARCHAR2);

PROCEDURE writeToBuffer(df DOMDocumentFragment, buffer IN OUT VARCHAR2,
                        pflag IN NUMBER, indent IN NUMBER);

---------------------------------------------------------------------------
-- Interface DOMDocument:
--
--    getDoctype
--    setDoctype
--    getImplementation
--    getDocumentElement
--    createElement
--    createDocumentFragment
--    createComment
--    createTextNode
--    createCDATASection
--    createProcessingInstruction
--    createAttribute
--    createEntityReference
--    document_getElementsByTagName
--    importNode
--    adoptNode
--
--    document_isNull (extension)
--    document_makeNode (extension)
--    newDOMDocument (extension)
--    getVersion (extension)
--    setVersion (extension)
--    getCharset (extension)
--    setCharset (extension)
--    getStandalone (extension)
--    setStandalone (extension)
--    writeToFile (extension)
--    document_writeToBuffer (extension)
--    document_writeToClob (extension)
--    writeToFile (extension)
--    writeToBuffer (extension)
--    writeToClob (extension)
--    writeExternalDTDToFile (extension)
--    writeExternalDTDToBuffer (extension)
--    writeExternalDTDToClob (extension)
--    writeExternalDTDToFile (extension)
--    writeExternalDTDToBuffer (extension)
--    writeExternalDTDToClob (extension)
--    freeDocument (extension)
--
---------------------------------------------------------------------------

/**
 * DOM Document interface methods
 * These methods implement the DOM Document interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#i-Document
 */

FUNCTION getDoctype(doc DOMDocument) RETURN DOMDocumentType;
PROCEDURE setDoctype(doc DOMDocument, name VARCHAR2,
                     sysid VARCHAR2, pubid VARCHAR2);
FUNCTION getImplementation(doc DOMDocument) RETURN DOMImplementation;
FUNCTION getDocumentElement(doc DOMDocument) RETURN DOMElement;
FUNCTION createElement(doc DOMDocument, tagName IN VARCHAR2) RETURN DOMElement;
FUNCTION createElement(doc DOMDocument, tagName IN VARCHAR2,
                       ns IN VARCHAR2) RETURN DOMElement;
FUNCTION createDocumentFragment(doc DOMDocument) RETURN DOMDocumentFragment;
FUNCTION createTextNode(doc DOMDocument, data IN VARCHAR2) RETURN DOMText;
FUNCTION createComment(doc DOMDocument, data IN VARCHAR2) RETURN DOMComment;
FUNCTION createCDATASection(doc DOMDocument, data IN VARCHAR2)
                            RETURN DOMCDATASection;
FUNCTION createProcessingInstruction(doc DOMDocument, target IN VARCHAR2,
                                     data IN VARCHAR2)
                                     RETURN DOMProcessingInstruction;
FUNCTION createAttribute(doc DOMDocument, name IN VARCHAR2) RETURN DOMAttr;
FUNCTION createAttribute(doc DOMDocument, name IN VARCHAR2,
                         ns IN VARCHAR2) RETURN DOMAttr;
FUNCTION createEntityReference(doc DOMDocument, name IN VARCHAR2)
                               RETURN DOMEntityReference;

FUNCTION getElementsByTagName(doc DOMDocument, tagname IN VARCHAR2)
                                       RETURN DOMNodeList;
 -------------------------getDocElementsByTagName--------------------------
 -- Get element by tag name
 --
 -- PARAMETERS
 --      doc          - input DOM Document
 --      tagname      - tagname of new element.
 -- RETURN
 --      Elements list.
 -- EXCEPTIONS
 --   <exception name> - <description>
 -- NOTES
 --
 --
 -- FUNCTION domdoc_getElementsByTagName(doc IN DOMDocument,
 --                                      tagname IN VARCHAR2)
 --                                      RETURN DOMNodeList;

/**
 * DOM XDK interface methods
 */

-- Check validity of object
FUNCTION isNull(doc DOMDocument) RETURN BOOLEAN;

-- Cast
FUNCTION makeNode(doc DOMDocument) RETURN DOMNode;

-- New document
FUNCTION newDOMDocument RETURN domdocument;
FUNCTION newDOMDocument(xmldoc IN sys.xmltype) RETURN DOMDocument;
----------------------------------create----------------------------------
 -- Create domdocument given xmltype
 --
 -- PARAMETERS
 --      xmldoc       - input xmltype
 -- RETURN
 --      DOM Document
 -- EXCEPTIONS
 --   <exception name> - <description>
 -- NOTES
 --
 --
 -- FUNCTION domdoc_create(xmldoc IN sys.xmltype) RETURN DOMDocument;

FUNCTION newDOMDocument(cl IN clob) RETURN domdocument;
FUNCTION getxmltype(doc in DOMDocument) RETURN sys.xmltype;

FUNCTION getVersion(doc DOMDocument) return varchar2;
PROCEDURE setVersion(doc DOMDocument, version VARCHAR2);
FUNCTION getCharset(doc DOMDocument) return varchar2;
PROCEDURE setCharset(doc DOMDocument, charset VARCHAR2);
FUNCTION getStandalone(doc DOMDocument) return varchar2;
PROCEDURE setStandalone(doc DOMDocument, newvalue VARCHAR2);
PROCEDURE writeToFile(doc DOMDocument, fileName VARCHAR2);
PROCEDURE writeToBuffer(doc DOMDocument, buffer IN OUT VARCHAR2);
PROCEDURE writeToClob(doc DOMDocument, cl IN OUT CLOB);
PROCEDURE writeToFile(doc DOMDocument, fileName VARCHAR2,
                      pflag IN NUMBER, indent IN NUMBER);
PROCEDURE writeToBuffer(doc DOMDocument, buffer IN OUT VARCHAR2,
                         pflag IN NUMBER, indent IN NUMBER);
PROCEDURE writeToClob(doc DOMDocument, cl IN OUT CLOB,
                      pflag IN NUMBER, indent IN NUMBER);
PROCEDURE writeToFile(doc DOMDocument, fileName VARCHAR2, charset VARCHAR2);
PROCEDURE writeToBuffer(doc DOMDocument, buffer IN OUT VARCHAR2,
                        charset VARCHAR2);
PROCEDURE writeToClob(doc DOMDocument, cl IN OUT CLOB, charset VARCHAR2);
PROCEDURE writeToFile(doc DOMDocument, fileName VARCHAR2, charset VARCHAR2,
                      pflag IN NUMBER, indent IN NUMBER);
PROCEDURE writeToBuffer(doc DOMDocument, buffer IN OUT VARCHAR2,
                        charset VARCHAR2, pflag IN NUMBER, indent IN NUMBER);
PROCEDURE writeToClob(doc DOMDocument, cl IN OUT CLOB, charset VARCHAR2,
                         pflag IN NUMBER, indent IN NUMBER);
PROCEDURE writeExternalDTDToFile(doc DOMDocument, fileName varchar2);
PROCEDURE writeExternalDTDToBuffer(doc DOMDocument, buffer in out varchar2);
PROCEDURE writeExternalDTDToClob(doc DOMDocument, cl in out clob);
PROCEDURE writeExternalDTDToFile(doc DOMDocument, fileName varchar2,
                                 charset varchar2);
PROCEDURE writeExternalDTDToBuffer(doc DOMDocument, buffer in out varchar2,
                                   charset varchar2);
PROCEDURE writeExternalDTDToClob(doc DOMDocument, cl in out clob,
                                                  charset varchar2);

PROCEDURE freeDocument(doc IN DOMDocument);
PROCEDURE freeDocFrag(df IN DOMDocumentFragment);
PROCEDURE freeDocType(dt IN DOMDocumentType);
-- PROCEDURE domdoc_remove(doc IN domdocument);

FUNCTION importnode(doc DOMDocument, importednode domnode, deep boolean)
                    RETURN DOMNode;
FUNCTION adoptnode(doc DOMDocument, adoptednode domnode)
                   RETURN DOMNode;

end dbms_xmldom;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XDBRESOURCE" AUTHID CURRENT_USER IS

--------------------------------------------
-- TYPES
--
--------------------------------------------
SUBTYPE xdbrestype IS RAW(13);
TYPE XDBResource IS RECORD(id xdbrestype);

---------------------------------------------------------------------------
-- XDBResource related API
---------------------------------------------------------------------------

---------------------------------------------
-- FUNCTION - isNull
--    Checks if the input res is null.
-- PARAMETERS -
--    res - input resource
-- RETURNS -
--    TRUE if the input res is null.
---------------------------------------------
FUNCTION isNull(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- PROCEDURE - freeResource
--    Frees any memory associated with an XDBResource
-- PARAMETERS -
--    res - The XDBResource to free
---------------------------------------------
PROCEDURE freeResource (res IN XDBResource);

---------------------------------------------
-- FUNCTION - getACL
--    Given an XDBResource, returns its ACL as string.
-- PARAMETERS -
--    res - An XDBResource
-- RETURNS -
--    The ACL of the XDBResource as VARCHAR2
---------------------------------------------
FUNCTION getACL (res IN XDBResource) return VARCHAR2;

FUNCTION getACLDocFromRes(res IN XDBResource) return sys.xmltype;

---------------------------------------------
-- FUNCTION - getAuthor
--    Given an XDBResource, returns its author.
-- PARAMETERS -
--    res - An XDBResource
-- RETURNS -
--    The Author of the XDBResource.
---------------------------------------------
FUNCTION getAuthor(res IN XDBResource)  return VARCHAR2;

---------------------------------------------
-- FUNCTION - getCharacterSet
--    Given an XDBResource, returns its characterset.
-- PARAMETERS -
--    res - An XDBResource
-- RETURNS -
--    The character set of the XDBResource.
---------------------------------------------
FUNCTION getCharacterSet(res IN XDBResource)  return VARCHAR2;

---------------------------------------------
-- FUNCTION - getComment
--    Given an XDBResource, returns its comment.
-- PARAMETERS -
--    res - An XDBResource
-- RETURNS -
--    The Comment of the XDBResource.
---------------------------------------------
FUNCTION getComment(res IN XDBResource)  return VARCHAR2;

---------------------------------------------
-- FUNCTION - getContentType
--    Given an XDBResource, returns its content-type.
-- PARAMETERS -
--    res - An XDBResource
-- RETURNS -
--    The content type of the XDBResource.
---------------------------------------------
FUNCTION getContentType(res IN XDBResource)  return VARCHAR2;

---------------------------------------------
-- FUNCTION - getCreationDate
--    Given an XDBResource, returns its creation date.
-- PARAMETERS -
--    res - An XDBResource
-- RETURNS -
--    The creation date of the XDBResource.
---------------------------------------------
FUNCTION getCreationDate(res IN XDBResource) return TIMESTAMP;

---------------------------------------------
-- FUNCTION - getCreator
--    Given an XDBResource, returns its creator.
-- PARAMETERS -
--    res - An XDBResource
-- RETURNS -
--    The creator of the XDBResource.
---------------------------------------------
FUNCTION getCreator(res IN XDBResource) return VARCHAR2;

---------------------------------------------
-- FUNCTION - getDisplayName
--    Given an XDBResource, returns its display name.
-- PARAMETERS -
--    res - An XDBResource
-- RETURNS -
--    The display name of the XDBResource.
---------------------------------------------
FUNCTION getDisplayName(res IN XDBResource)  return VARCHAR2;

---------------------------------------------
-- FUNCTION - getLanguage
--    Given an XDBResource, returns its language.
-- PARAMETERS -
--    res - An XDBResource
-- RETURNS -
--    The language of the XDBResource.
---------------------------------------------
FUNCTION getLanguage (res IN XDBResource) return VARCHAR2;

---------------------------------------------
-- FUNCTION - getLastModifier
--    Given an XDBResource, returns its last modifier.
-- PARAMETERS -
--    res - An XDBResource
-- RETURNS -
--    The last modifier of the XDBResource.
---------------------------------------------
FUNCTION getLastModifier(res IN XDBResource)  return VARCHAR2;

---------------------------------------------
-- FUNCTION - getModificationDate
--    Given an XDBResource, returns its modification date.
-- PARAMETERS -
--    res - An XDBResource
-- RETURNS -
--    The modification date of the XDBResource.
---------------------------------------------
FUNCTION getModificationDate(res IN XDBResource)  return TIMESTAMP;

---------------------------------------------
-- FUNCTION - getOwner
--    Given an XDBResource, returns its owner.
-- PARAMETERS -
--    res - An XDBResource
-- RETURNS -
--    The owner of the XDBResource.
---------------------------------------------
FUNCTION getOwner(res IN XDBResource)  return VARCHAR2;

---------------------------------------------
-- FUNCTION - getRefCount
--    Given an XDBResource, returns its reference count.
-- PARAMETERS -
--    res - An XDBResource
-- RETURNS -
-- The reference count of the XDBResource.
---------------------------------------------
FUNCTION getRefCount (res IN XDBResource) return PLS_INTEGER;

---------------------------------------------
-- FUNCTION - getVersionId
--    Given an XDBResource, returns its version id.
-- PARAMETERS -
--    res - An XDBResource
-- RETURNS -
--    The version id of the XDBResource.
---------------------------------------------
FUNCTION getVersionId(res IN XDBResource)  return PLS_INTEGER;

---------------------------------------------
-- PROCEDURE - setAuthor
--    Sets the author of the given XDBResource to the specified varchar2.
-- PARAMETERS -
--    res    - An XDBResource
--    author - The new author
--
---------------------------------------------
PROCEDURE setAuthor(res IN OUT XDBResource, author IN VARCHAR2);

---------------------------------------------
-- PROCEDURE - setACL
--    Sets the acl of the given XDBResource to the path specified varchar2.
-- PARAMETERS -
--    res     - An XDBResource
--    ACLPath - The absolute path of the new acl
---------------------------------------------
PROCEDURE setACL(res IN OUT XDBResource, ACLPath IN VARCHAR2);

---------------------------------------------
-- PROCEDURE - setCharacterSet
--   Sets the character set of the given XDBResource to the specified varchar2.
-- PARAMETERS -
--    res     - An XDBResource
--    charset - The new charset
---------------------------------------------
PROCEDURE setCharacterSet(res IN OUT XDBResource, charSet IN VARCHAR2);

---------------------------------------------
-- PROCEDURE - setComment
--    Sets the comment of the given XDBResource to the specified varchar2.
-- PARAMETERS -
--    res     - An XDBResource
--    comment - The new comment
---------------------------------------------
PROCEDURE setComment(res IN OUT XDBResource, comment IN VARCHAR2);

---------------------------------------------
-- PROCEDURE - setContentType
--    Sets the content-type of the given XDBResource to the specified varchar2.
-- PARAMETERS -
--    res      - An XDBResource
--    conttype - The new content-type
---------------------------------------------
PROCEDURE setContentType(res IN OUT XDBResource, conttype IN VARCHAR2);

---------------------------------------------
-- PROCEDURE - setDisplayName
--    Sets the display name of the given XDBResource to the specified varchar2.
-- PARAMETERS -
--    res     - An XDBResource
--    name    - The new display name
---------------------------------------------
PROCEDURE setDisplayName(res IN OUT XDBResource, name IN VARCHAR2);

---------------------------------------------
-- PROCEDURE - setLanguage
--    Sets the language of the given XDBResource to the specified varchar2.
-- PARAMETERS -
--    res     - An XDBResource
--    lang    - The new language
---------------------------------------------
PROCEDURE setLanguage(res IN OUT XDBResource, lang IN VARCHAR2);

---------------------------------------------
-- PROCEDURE - setOwner
--    Sets the owner of the given XDBResource to the specified varchar2.
-- PARAMETERS -
--    res     - An XDBResource
--    owner   - The new owner
---------------------------------------------
PROCEDURE setOwner(res IN OUT XDBResource, owner IN VARCHAR2);

---------------------------------------------
-- FUNCTION - hasAuthorChanged
--    Returns TRUE if the author of the given resource has changed,
--         FALSE otherwise.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
--
---------------------------------------------
FUNCTION hasAuthorChanged(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- FUNCTION - hasCharacterSetChanged
--     Returns TRUE if the charset of the given resource has changed,
--         FALSE otherwise.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
-- TRUE if the charset of the given resource has changed,
--         FALSE otherwise.
---------------------------------------------
FUNCTION hasCharacterSetChanged(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- FUNCTION - hasCommentChanged
--     Returns TRUE if the comment of the given resource has changed,
--         FALSE otherwise.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
-- TRUE if the comment of the given resource has changed,
--         FALSE otherwise.
---------------------------------------------
FUNCTION hasCommentChanged(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- FUNCTION - hasContentTypeChanged
--     Returns TRUE if the content-type of the given resource has changed,
--         FALSE otherwise.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
-- TRUE if the content-type of the given resource has changed,
--         FALSE otherwise.
---------------------------------------------
FUNCTION hasContentTypeChanged(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- FUNCTION - hasContentChanged
--     Returns TRUE if the contents of the given resource has changed,
--         FALSE otherwise.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
-- TRUE if the contents of the given resource has changed,
--         FALSE otherwise.
---------------------------------------------
FUNCTION hasContentChanged(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- FUNCTION - hasCreationDateChanged
--     Returns TRUE if the creation date of the given resource has changed,
--         FALSE otherwise.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
-- TRUE if the creation date of the given resource has changed,
--         FALSE otherwise.
---------------------------------------------
FUNCTION hasCreationDateChanged(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- FUNCTION - hasCreatorChanged
--     Returns TRUE if the creator of the given resource has changed,
--         FALSE otherwise.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
-- TRUE if the creator of the given resource has changed,
--         FALSE otherwise.
---------------------------------------------
FUNCTION hasCreatorChanged(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- FUNCTION - hasDisplayName
--     Returns TRUE if the display name of the given resource has changed,
--         FALSE otherwise.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
-- TRUE if the display name of the given resource has changed,
--         FALSE otherwise.
---------------------------------------------
FUNCTION hasDisplayNameChanged(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- FUNCTION - hasLanguageChanged
--     Returns TRUE if the language of the given resource has changed,
--         FALSE otherwise.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
-- TRUE if the language of the given resource has changed,
--         FALSE otherwise.
---------------------------------------------
FUNCTION hasLanguageChanged(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- FUNCTION - hasLastModifierChanged
--     Returns TRUE if the last modifier of the given resource has changed,
--         FALSE otherwise.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
-- TRUE if the last modifier of the given resource has changed,
--         FALSE otherwise.
---------------------------------------------
FUNCTION hasLastModifierChanged(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- FUNCTION - hasModificationDate
--    Returns TRUE if the modification date of the given resource has changed,
--         FALSE otherwise.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
-- TRUE if the modification date of the given resource has changed,
--         FALSE otherwise.
---------------------------------------------
FUNCTION hasModificationDateChanged(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- FUNCTION - hasOwnerChanged
--     Returns TRUE if the owner of the given resource has changed,
--         FALSE otherwise.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
-- TRUE if the owner of the given resource has changed,
--         FALSE otherwise.
---------------------------------------------
FUNCTION hasOwnerChanged(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- FUNCTION - hasRefCountChanged
--     Returns TRUE if the reference count of the given resource has changed,
--         FALSE otherwise.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
-- TRUE if the reference count of the given resource has changed,
--         FALSE otherwise.
---------------------------------------------
FUNCTION hasRefCountChanged(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- FUNCTION - hasVersionId
--     Returns TRUE if the version id of the given resource has changed,
--         FALSE otherwise.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
-- TRUE if the version id of the given resource has changed,
--         FALSE otherwise.
---------------------------------------------
FUNCTION hasVersionIdChanged(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- FUNCTION - hasACLChanged
--     Returns TRUE if the ACL of the given resource has changed,
--         FALSE otherwise.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
-- TRUE if the ACL of the given resource has changed,
--         FALSE otherwise.
---------------------------------------------
FUNCTION hasACLChanged(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- FUNCTION - isFolder
--    Checks if the given resource is a folder or not.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
-- TRUE if the given resource is a folder,
--         FALSE otherwise.
---------------------------------------------
FUNCTION isFolder(res IN XDBResource) return BOOLEAN;

---------------------------------------------
-- FUNCTION - getContentClob
--    Returns the contents of the resource as a clob.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
--    The contents as CLOB.
---------------------------------------------
FUNCTION getContentClob(res IN XDBResource)  return CLOB;

---------------------------------------------
-- FUNCTION - getContentBlob
--    Returns the contents of the resource as a blob.
-- PARAMETERS -
--    res        - An XDBResource
--    csid - OUT - The character set id of the blob returned.
-- RETURNS -
--    The contents as BLOB.
---------------------------------------------
FUNCTION getContentBlob(res IN XDBResource, csid OUT PLS_INTEGER) return BLOB;

---------------------------------------------
-- FUNCTION - getContentXML
--    Returns the contents of the resource as an XMLType.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
--    The contents as XMLType.
---------------------------------------------
FUNCTION getContentXML(res IN XDBResource)  return SYS.XMLType;

---------------------------------------------
-- FUNCTION - getContentVarchar2
--    Returns the contents of the resource as an Varchar2.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
--    The contents as Varchar2.
---------------------------------------------
FUNCTION getContentVarchar2(res IN XDBResource)  return VARCHAR2;

---------------------------------------------
-- FUNCTION - getContentRef
--    Returns the contents of the resource as a Ref.
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
--    The contents as an XMLTypeRef.
---------------------------------------------
FUNCTION getContentRef(res IN XDBResource)  return REF SYS.XMLType;

---------------------------------------------
-- PROCEDURE - setContent
--    Replaces the contents of the given resource with the given clob.
-- PARAMETERS -
--    res     - An XDBResource
--    data    - The clob
---------------------------------------------
PROCEDURE setContent(res IN OUT XDBResource, data IN CLOB);

---------------------------------------------
-- PROCEDURE -
--    Replaces the contents of the given resource with the given blob.
-- PARAMETERS -
--    res     - An XDBResource
--    data    - The blob
--    csid    - The character-set id of the blob
---------------------------------------------
PROCEDURE setContent(res IN OUT XDBResource, data IN BLOB, csid IN PLS_INTEGER);

---------------------------------------------
-- PROCEDURE -
--    Replaces the contents of the given resource with the given XMLType.
-- PARAMETERS -
--    res     - An XDBResource
--    data    - The XMLType
---------------------------------------------
PROCEDURE setContent(res IN OUT XDBResource, data IN SYS.XMLType);

---------------------------------------------
-- PROCEDURE -
--    Replaces the contents of the given resource with the given string.
-- PARAMETERS -
--    res     - An XDBResource
--    data    - The input string
---------------------------------------------
PROCEDURE setContent(res IN OUT XDBResource, data IN VARCHAR2);

---------------------------------------------
-- PROCEDURE -
--    Replaces the contents of the given resource with the given REF to XMLType.
-- PARAMETERS -
--    res     - An XDBResource
--    data    - The REF to XMLType
---------------------------------------------
PROCEDURE setContent(res IN OUT XDBResource, data IN REF SYS.XMLType,
                     sticky IN BOOLEAN := TRUE);

---------------------------------------------
-- PROCEDURE -
--    Replaces the contents of the given resource with the given BFILE.
-- PARAMETERS -
--    res     - An XDBResource
--    data    - The input bfile
--    csid_bfile  - The character set id of the bfile
---------------------------------------------
PROCEDURE setContent(res IN OUT XDBResource, data IN BFILE,
                     csid_bfile IN PLS_INTEGER);

---------------------------------------------
-- PROCEDURE - save
--    Updates the resource with any modifications that were done on it.
-- PARAMETERS -
--    res     - An XDBResource
---------------------------------------------
PROCEDURE save(res IN XDBResource);

---------------------------------------------
-- FUNCTION - makeDocument
--    Converts the XDBResource to DOMDocument. This can be used in
--      XMLDOM APIs. (Please refer to the XMLDOM package).
-- PARAMETERS -
--    res     - An XDBResource
-- RETURNS -
--    The DOMDocument for this resource.
---------------------------------------------
FUNCTION makeDocument(res IN XDBResource) return DBMS_XMLDOM.DOMDocument;

FUNCTION hasChanged(res IN XDBResource, xpath IN VARCHAR2,
                    bnamespace IN VARCHAR2) return BOOLEAN;

FUNCTION getCustomMetadata(res IN XDBResource, xpath IN VARCHAR2,
                           namespace IN VARCHAR2) return SYS.XMLType;

FUNCTION hasCustomMetadataChanged(res IN XDBResource) return BOOLEAN;

PROCEDURE setCustomMetadata(res IN XDBResource, xpath IN VARCHAR2,
                            namespace IN VARCHAR2, newMetadata IN SYS.XMLType);
end dbms_xdbresource;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XDB" AUTHID CURRENT_USER IS

------------
-- CONSTANTS
--
------------
DELETE_RESOURCE        CONSTANT NUMBER := 1;
DELETE_RECURSIVE       CONSTANT NUMBER := 2;
DELETE_FORCE           CONSTANT NUMBER := 3;
DELETE_RECURSIVE_FORCE CONSTANT NUMBER := 4;

DELETE_RES_METADATA_CASCADE   CONSTANT NUMBER := 1;
DELETE_RES_METADATA_NOCASCADE CONSTANT NUMBER := 2;

-- Constant number for 1st argument of setListenerEndPoint
XDB_ENDPOINT_HTTP  CONSTANT NUMBER := 1;
XDB_ENDPOINT_HTTP2 CONSTANT NUMBER := 2;
XDB_ENDPOINT_HTTPS CONSTANT NUMBER := 2;

-- Constant number for 4th argument of setListenerEndPoint
XDB_PROTOCOL_TCP   CONSTANT NUMBER := 1;
XDB_PROTOCOL_TCPS  CONSTANT NUMBER := 2;

DEFAULT_LOCK_TIMEOUT CONSTANT PLS_INTEGER := (60*60);

LINK_TYPE_HARD        CONSTANT NUMBER := 1;
LINK_TYPE_WEAK        CONSTANT NUMBER := 2;
LINK_TYPE_SYMBOLIC    CONSTANT NUMBER := 3;

ON_DENY_NEXT_CUSTOM   CONSTANT NUMBER := 1;
ON_DENY_BASIC         CONSTANT NUMBER := 2;

---------------------------------------------
-- FUNCTION - LockResource
--     Gets a webdav-like lock for XDB resource given its path
-- PARAMETERS -
--  abspath
--     Absolute path in the Hierarchy of the resource
--  depthzero
--     depth zero boolean
--  shared
--     shared boolean
-- RETURNS -
--     Returns TRUE if successful
---------------------------------------------
FUNCTION LockResource(abspath IN VARCHAR2, depthzero IN BOOLEAN,
                                           shared IN boolean)
              RETURN boolean;

---------------------------------------------
-- FUNCTION - LockResource
--     Gets a webdav-like lock for XDB resource given its path
-- PARAMETERS -
--  abspath
--     Absolute path in the Hierarchy of the resource
--  depthzero
--     depth zero boolean
--  shared
--     shared boolean
--  token
--     generated token
--  timeout
--     time (in seconds) after which lock expires
-- RETURNS -
--     Returns TRUE if successful
---------------------------------------------
FUNCTION LockResource(abspath IN VARCHAR2, depthzero IN BOOLEAN,
                      shared IN boolean, token OUT VARCHAR2,
                      timeout IN PLS_INTEGER := DEFAULT_LOCK_TIMEOUT)
              RETURN boolean;

---------------------------------------------
-- PROCEDURE - RefreshLock
--     Refreshes a webdav-like lock for XDB resource given its path
-- PARAMETERS -
--  abspath
--     Absolute path in the Hierarchy of the resource
--  token
--     token corresponding to the lock to be refreshed
--  newTimeout
--     new timeout (in seconds) after which lock will expire
-- NOTE -
--     If the timeout is less than the remaining time to expiry,
--     lock will not be refreshed
---------------------------------------------

PROCEDURE RefreshLock(abspath IN VARCHAR2, token IN VARCHAR2,
                     newTimeout IN  PLS_INTEGER := DEFAULT_LOCK_TIMEOUT);

---------------------------------------------
-- FUNCTION - LockDiscovery
--     Gets Locks element on resource defined by abspath
-- PARAMETERS -
--  abspath
--     Absolute path in the Hierarchy of the resource
-- RETURNS -
--     the Locks element as XMLType
---------------------------------------------
FUNCTION LockDiscovery(abspath IN VARCHAR2)
               RETURN SYS.XMLType;

---------------------------------------------
-- PROCEDURE - GetLockToken
--     Gets lock token for current user for XDB resource given its path
-- PARAMETERS -
--  abspath
--     Absolute path in the Hierarchy of the resource
--  locktoken (OUT)
--     Returns lock token
---------------------------------------------
PROCEDURE GetLockToken(abspath IN VARCHAR2, locktoken OUT VARCHAR2);

---------------------------------------------
-- FUNCTION - Unlock
--     Removes lock for XDB resource given lock token
-- PARAMETERS -
--  abspath
--     Absolute path in the Hierarchy of the resource
--  delToken
--     Lock token name to be removed
-- RETURNS -
--     Returns TRUE if successful
---------------------------------------------
FUNCTION UnlockResource(abspath IN VARCHAR2, deltoken IN VARCHAR2 := NULL)
                        RETURN boolean;

---------------------------------------------
-- PROCEDURE - AddToLockTokenList
--     Adds specified token to the session lock token list
-- PARAMETERS -
--  token
--     token to be added to token list
---------------------------------------------
PROCEDURE AddToLockTokenList(token IN VARCHAR2);

---------------------------------------------
-- FUNCTION - DeleteFromLockTokenList
--     Deletes specified token from the session lock token list
-- PARAMETERS -
--  token
--     token to be deleted from token list
-- RETURNS -
--     returns TRUE if delete was successful
---------------------------------------------
FUNCTION DeleteFromLockTokenList(token IN VARCHAR2)
                        RETURN boolean;

---------------------------------------------
-- FUNCTION - GetLockTokenList
--     Gets the session lock token list
-- PARAMETERS -
--  None
-- RETURNS -
--  The session lock token list
---------------------------------------------
FUNCTION GetLockTokenList RETURN LockTokenListType;

---------------------------------------------
-- FUNCTION - ExistsResource(VARCHAR2)
--     Given a string, returns true if the resource exists in the hierarchy.
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
-- RETURNS -
--     Returns TRUE if resource was found in the hierarchy.
---------------------------------------------
FUNCTION ExistsResource(abspath IN VARCHAR2) RETURN BOOLEAN;

---------------------------------------------
-- FUNCTION - CreateResource(VARCHAR2, VARCHAR2, VARCHAR2, VARCHAR2)
--     Given a string, inserts a new resource into the hierarchy with
--     the string as the contents.
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
--  data
--     String buffer containing the resource contents
--  schemaurl
--     for XML data, schema URL data conforms to (default null)
--  elem
--     element name (default null)
-- RETURNS -
--     Returns TRUE if resource was successfully inserted or updated
---------------------------------------------
FUNCTION CreateResource(abspath IN VARCHAR2,
                        data IN VARCHAR2,
                        schemaurl IN VARCHAR2 := NULL,
                        elem IN VARCHAR2 := NULL) RETURN BOOLEAN;

---------------------------------------------
-- FUNCTION - CreateResource(VARCHAR2, SYS.XMLTYPE, VARCHAR2, VARCHAR2)
--     Given an XMLTYPE and a schema URL, inserts a new resource
--     into the hierarchy with the XMLTYPE as the contents.
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
--  data
--     XMLTYPE containing the resource contents
--  schemaurl
--     schema URL the XmlType conforms to (default null)
--  elem
--     element name (default null)
-- RETURNS -
--     Returns TRUE if resource was successfully inserted or updated
---------------------------------------------
FUNCTION CreateResource(abspath IN VARCHAR2,
                        data IN SYS.XMLTYPE,
                        schemaurl IN VARCHAR2 := NULL,
                        elem IN VARCHAR2 := NULL) RETURN BOOLEAN;


---------------------------------------------
-- FUNCTION - CreateResource(VARCHAR2, REF SYS.XMLTYPE, BOOLEAN, BOOLEAN)
--     Given a PREF to an existing XMLType row, inserts a new resource
--     whose contents point directly at that row.  That row should
--     not already exist inside another resource.
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
--  data
--     REF to the XMLType row containing the resource contents
--  sticky
--     If TRUE creates a sticky REF, otherwise non-sticky.
--     Default is TRUE (for backwards compatibility).
--  calcSize
--     If true, calculate the content size of the resource. Default is
--     false for performance reasons.
-- RETURNS -
--     Returns TRUE if resource was successfully inserted or updated
---------------------------------------------
FUNCTION CreateResource(abspath IN VARCHAR2,
                        data IN REF SYS.xmltype,
                        sticky IN BOOLEAN := TRUE,
                        calcSize IN BOOLEAN := FALSE) RETURN BOOLEAN;

---------------------------------------------
-- FUNCTION - CreateResource(VARCHAR2, CLOB)
--     Given a CLOB, inserts a new resource into the hierarchy with
--     the CLOB as the contents.
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
--  data
--     CLOB containing the resource contents
-- RETURNS -
--     Returns TRUE if resource was successfully inserted or updated
---------------------------------------------
FUNCTION CreateResource(abspath IN VARCHAR2,
                        data IN CLOB) RETURN BOOLEAN;

---------------------------------------------
-- FUNCTION - CreateResource(VARCHAR2, BFILE, NUMBER)
--     Given a BFILE, inserts a new resource into the hierarchy with
--     the contents loaded from the BFILE.
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
--  data
--     BFILE containing the resource contents
--  csid
--     character set id of the input bfile
-- RETURNS -
--     Returns TRUE if resource was successfully inserted or updated
---------------------------------------------
FUNCTION CreateResource(abspath IN VARCHAR2,
                        data IN BFILE,
                        csid IN NUMBER := 0) RETURN BOOLEAN;

---------------------------------------------
-- FUNCTION - CreateResource(VARCHAR2, BLOB, NUMBER)
--     Given a BLOB, inserts a new resource into the hierarchy with
--     the BLOB as the contents.
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
--  data
--     BLOB containing the resource contents
--  csid
--     character set id of the input blob
-- RETURNS -
--     Returns TRUE if resource was successfully inserted or updated
---------------------------------------------
FUNCTION CreateResource(abspath IN VARCHAR2,
                        data IN BLOB,
                        csid IN NUMBER := 0) RETURN BOOLEAN;


---------------------------------------------
-- FUNCTION - CreateFolder
--     Creates a folder in the Repository
-- PARAMETERS -
--  abspath
--     Absolute path iin the Hierarchy were the resource will be stored
-- RETURNS -
--     Returns TRUE if folder was created succesfully in Repository
---------------------------------------------
FUNCTION CreateFolder(abspath IN VARCHAR2) RETURN BOOLEAN;

---------------------------------------------
-- FUNCTION - AddResource(VARCHAR2, VARCHAR2)
--     Given a string, inserts a new resource into the hierarchy with
--     the string as the contents.
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
--  data
--     String buffer containing the resource contents
-- RETURNS -
--     Returns 2 if resource already exists
--             1 if resource was successfully inserted
--             0 otherwise
---------------------------------------------
FUNCTION AddResource(abspath IN VARCHAR2,
                        data IN VARCHAR2) RETURN NUMBER;

---------------------------------------------
-- PROCEDURE - DeleteResource
--     Deletes a resource from the Hierarchy
-- PARAMETERS -
--  abspath
--     Absolute path in the Hierarchy for resource to be deleted
--  delete_option : one of the following
--    DELETE_RESOURCE ::
--      delete the resource alone. Fails if the resource has children
--    DELETE_RECURSIVE ::
--      delete the resource with the children, if any.
--    DELETE_FORCE ::
--      delete the resource even if the object it contains is invalid.
--    DELETE_RECURSIVE_FORCE ::
--      delete the resource and all children, ignoring any errors raised
--      by contained objects being invalid
---------------------------------------------
PROCEDURE DeleteResource(abspath IN VARCHAR2,
                         delete_option IN pls_integer := DELETE_RESOURCE);

---------------------------------------------
-- PROCEDURE - Link
--     Creates a link from a specified folder to a specified resource.
-- PARAMETERS -
--  srcpath
--     Path name of the resource to which a link is created.
--  linkfolder
--     Folder in which the new link is placed.
--  linkname
--     Name of the new link.
--  linktype
--     Type of link to be created.
--     One of the following:
--         DBMS_XDB.LINK_TYPE_HARD (default)
--         DBMS_XDB.LINK_TYPE_WEAK
--         DBMS_XDB.LINK_TYPE_SYMBOLIC
---------------------------------------------
PROCEDURE Link(srcpath IN VARCHAR2, linkfolder IN VARCHAR2,
               linkname IN VARCHAR2,
               linktype IN PLS_INTEGER := DBMS_XDB.LINK_TYPE_HARD);

---------------------------------------------
-- PROCEDURE - Rename
--     Renames a XDB resource
-- PARAMETERS -
--  srcpath
--     Absolute path in the Hierarchy of the source resource
--  destfolder
--     Absolute path in the Hierarchy of the dest folder
--  newname
--     Name of the child in the destination folder
---------------------------------------------
PROCEDURE RenameResource(srcpath IN VARCHAR2, destfolder IN VARCHAR2,
                         newname IN VARCHAR2);

---------------------------------------------
-- FUNCTION - getAclDoc
--     gets acl document that protects resource given in path
-- PARAMETERS -
--  abspath
--     Absolute path in the Hierarchy of the resource whose acl doc is required
-- RETURNS -
--     Returns xmltype for acl document
---------------------------------------------
FUNCTION getAclDocument(abspath IN VARCHAR2) RETURN sys.xmltype;

---------------------------------------------
-- FUNCTION - getPrivileges
--     Gets all system and user privileges granted to the current user
--     on the given XDB resource
-- PARAMETERS -
--  res_path
--     Absolute path in the Hierarchy for XDB resource
-- RETURNS -
--     Returns a XMLType instance of <privilege> element
--     which contains the list of all (leaf) privileges
--     granted on this resource to the current user.
--     It includes all granted system and user privileges.
--     Example :
--       <privilege xmlns="http://xmlns.oracle.com/xdb/acl.xsd"
--                  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
--                  xsi:schemaLocation="http://xmlns.oracle.com/xdb/acl.xsd
--                                      http://xmlns.oracle.com/xdb/acl.xsd"
--                  xmlns:dav="DAV:"
--                  xmlns:emp="http://www.example.com/emp.xsd">
--          <read-contents/>
--          <read-properties/>
--          <resolve/>
--          <dav:read-acl/>
--          <emp:Hire/>
--       </privilege>
---------------------------------------------
FUNCTION getPrivileges(res_path IN VARCHAR2) RETURN sys.xmltype;

---------------------------------------------
-- FUNCTION - changePrivileges
--     change access privileges on given XDB resource
-- PARAMETERS -
--  res_path
--     Absolute path in the Hierarchy for XDB resource
--  ace
--     an XMLType instance of the <ace> element which specifies
--     the <principal>, the operation <grant> and the list of
--     privileges.
--     If no ACE with the same principal and the same operation
--     (grant/deny) already exists in the ACL, the new ACE is added
--     at the end of the ACL.
--  replace
--    This argument determines the result of changePrivileges if
--    an ACE with the same principal and same operation (grant/deny)
--    already exists in the ACL.
--
--    If set to TRUE,
--       the old ACE is replaced with the new one.
--    else
--       the privileges of the old and new ACEs are combined into a
--       single ACE.
--
-- RETURNS -
--     Returns positive integer if ACL was successfully modified
---------------------------------------------
FUNCTION changePrivileges(res_path IN VARCHAR2,
                          ace      IN xmltype)
                          RETURN pls_integer;

---------------------------------------------
-- FUNCTION - checkPrivileges
--     checks access privileges granted on specified XDB resource
-- PARAMETERS -
--  res_path
--     Absolute path in the Hierarchy for XDB resource
--  privs
--     Requested set of access privileges
--     This argument is a XMLType instance of the <privilege> element.
-- RETURNS -
--     Returns positive integer if all requested privileges granted
---------------------------------------------
FUNCTION checkPrivileges(res_path IN VARCHAR2,
                         privs IN xmltype)
                         RETURN pls_integer;

---------------------------------------------
-- PROCEDURE - setFTPPort
--     sets the FTP port to new value
-- PARAMETERS -
--     new_port
--         value that the ftp port will be set to
---------------------------------------------

PROCEDURE setFTPPort(new_port IN NUMBER);

---------------------------------------------
-- FUNCTION - getFTPPort
--     gets the current value of FTP port
-- PARAMETERS -
--     none
-- RETURNS
--     ftp_port
--         current value of ftp-port
---------------------------------------------

FUNCTION getFTPPort RETURN NUMBER;

---------------------------------------------
-- PROCEDURE - setHTTPPort
--     sets the HTTP port to new value
-- PARAMETERS -
--     new_port
--         value that the http port will be set to
---------------------------------------------

PROCEDURE setHTTPPort(new_port IN NUMBER);

---------------------------------------------
-- FUNCTION - getHTTPPort
--     gets the current value of HTTP port
-- PARAMETERS -
--     none
-- RETURNS
--     http_port
--         current value of http-port
---------------------------------------------

FUNCTION getHTTPPort RETURN NUMBER;

---------------------------------------------
-- PROCEDURE setListenerEndPoint(endpoint IN number, host IN varchar2,
--                               port IN number, protocol IN number);

-- This procedure sets the parameters of a listener end point corresponding
-- to the XML DB HTTP server. Both HTTP and HTTP2 end points can be set by
-- invoking this procedure.

--   (a) endpoint - The end point to be set. Its value can be
--       XDB_ENDPOINT_HTTP or XDB_ENDPOINT_HTTP2.
--   (b) host - The interface on which the listener end point is to listen.
--       Its value can be 'localhost,' null, or a hostname. If its value is
--       'localhost,' then the listener end point is permitted to only listen
--       on the localhost interface. If its value is null or hostname, then
--       the listener end point is permitted to listen on both localhost and
--       non-localhost interfaces.
--   (c) port - The port on which the listener end point is to listen.
--   (d) protocol - The transport protocol that the listener end point is to
--       accept. Its value can be XDB_PROTOCOL_TCP or XDB_PROTOCOL_TCPS.
---------------------------------------------

PROCEDURE setListenerEndPoint(endpoint IN number, host IN varchar2,
                              port IN number, protocol IN number);

---------------------------------------------
--  PROCEDURE getListenerEndPoint(endpoint IN NUMBER, host OUT VARCHAR2,
--                                port OUT NUMBER, protocol OUT NUMBER);

-- This procedure retrieves the parameters of a listener end point
-- corresponding to the XML DB HTTP server. The parameters of both HTTP
-- and HTTP2 end points can be retrieved by invoking this procedure.

--  (a) endpoint - The end point whose parameters are to be retrieved. Its
--      value can be XDB_ENDPOINT_HTTP or XDB_ENDPOINT_HTTP2.
--  (b) host - The interface on which the listener end point listens.
--  (c) port - The port on which the listener end point listens.
--  (d) protocol - The transport protocol accepted by the listener end point.
---------------------------------------------

PROCEDURE getListenerEndPoint(endpoint IN NUMBER, host OUT VARCHAR2,
                              port OUT NUMBER, protocol OUT NUMBER);

---------------------------------------------
-- PROCEDURE setListenerLocalAccess(l_access boolean);
-- This procedure restricts all listener end points of the XML DB HTTP server
-- to listen only on the localhost interface (when l_access is TRUE) or
-- allows all listener end points of the XML DB HTTP server to listen on
-- both localhost and non-localhost interfaces (when l_access is FALSE).

--  (a) l_access - TRUE or FALSE. See description of procedure above.
---------------------------------------------
PROCEDURE setListenerLocalAccess(l_access boolean);

---------------------------------------------
-- PROCEDURE - setacl
--     sets the ACL on given XDB resource to be the specified in the acl path
-- PARAMETERS -
--  res_path
--     Absolute path in the Hierarchy for XDB resource
--  acl_path
--     Absolute path in the Hierarchy for XDB acl
---------------------------------------------
PROCEDURE setacl(res_path IN VARCHAR2, acl_path IN VARCHAR2);

---------------------------------------------
-- FUNCTION - AclCheckPrivileges
--     checks access privileges granted by specified ACL document
-- PARAMETERS -
--  acl_path
--     Absolute path in the Hierarchy for ACL document
--  owner
--     Resource owner name. The pseudo user "XDBOWNER" is replaced
--     by this user during ACL privilege resolution
--  privs
--     Requested set of access privileges
--     This argument is a XMLType instance of the <privilege> element.
-- RETURNS -
--     Returns positive integer if all requested privileges granted
---------------------------------------------
FUNCTION AclCheckPrivileges(acl_path IN VARCHAR2,
                            owner IN VARCHAR2,
                            privs IN xmltype)
                            RETURN pls_integer;

---------------------------------------------
-- PROCEDURE - refresh
--     Refreshes the session configuration with the latest configuration
---------------------------------------------
PROCEDURE cfg_refresh;

---------------------------------------------
-- FUNCTION - get
--     retrieves the xdb configuration
-- RETURNS -
--     XMLType for xdb configuration
---------------------------------------------
FUNCTION cfg_get RETURN sys.xmltype;

---------------------------------------------
-- PROCEDURE - update
--     Updates the xdb configuration with the input xmltype document
-- PARAMETERS -
--  xdbconfig
---     XMLType for xdb configuration
--------------------------------------------
PROCEDURE cfg_update(xdbconfig IN sys.xmltype);

---------------------------------------------
-- FUNCTION - GetResOID(abspath VARCHAR2)
--     Returns the OID of the resource, given its absolute path
--
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
-- RETURNS -
--     OID of resource if present, NULL otherwise
---------------------------------------------
FUNCTION GetResOID(abspath IN VARCHAR2) RETURN RAW;

---------------------------------------------
-- FUNCTION - CreateOIDPath(oid RAW)
--     Returns the OID-based virtual path to the resource
--
-- PARAMETERS -
--  OID
--     OID of the resource
-- RETURNS -
--     the OID-based virtual path to the resource
---------------------------------------------
FUNCTION CreateOIDPath(oid IN RAW) RETURN VARCHAR2;

-----------------------------------------------------------
-- PROCEDURE - appendResourceMetadata
--     Appends the given piece of metadata to the resource
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
--  data
--     Metadata (can be schema based or NSB). SB metadata
--     will be stored in its own table.
-- RETURNS -
--     Nothing
-----------------------------------------------------------
PROCEDURE appendResourceMetadata(abspath IN VARCHAR2,
                                 data IN SYS.xmltype);

-----------------------------------------------------------
-- PROCEDURE - appendResourceMetadata
--     Appends the given piece of metadata identified by a REF
--     to the resource
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
--  data
--     REF to the piece of metadata (schema based)
-- RETURNS -
--     Nothing
-----------------------------------------------------------
PROCEDURE appendResourceMetadata(abspath IN VARCHAR2,
                                 data IN REF SYS.xmltype);

-----------------------------------------------------------
-- PROCEDURE - deleteResourceMetadata
--     Deletes metadata from a resource (can only be used for SB metadata)
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
--  metadata
--     REF to the piece of metadata (schema based) to be deleted
--  delete_option
--     Can be one of the following:
--     DELETE_RES_METADATA_CASCADE : deletes the corresponding row
--     in the metadata table
--     DELETE_RES_METADATA_NOCASCADE : does not delete the row in
--     the metadata table
-- RETURNS -
--     Nothing
-----------------------------------------------------------
PROCEDURE deleteResourceMetadata(abspath IN VARCHAR2,
                                 metadata IN REF SYS.XMLTYPE,
                                 delete_option IN pls_integer :=
                                  DELETE_RES_METADATA_CASCADE);

-----------------------------------------------------------
-- PROCEDURE - deleteResourceMetadata
--     Deletes metadata from a resource (can be used for SB or
--     NSB metadata)
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
--  metadatans
--     Namespace of the metadata fragment to be removed
--  metadataname
--     Local name of the metadata fragment to be removed
--  delete_option
--     This is only applicable for SB metadata.
--     Can be one of the following:
--     DELETE_RES_METADATA_CASCADE : deletes the corresponding row
--     in the metadata table
--     DELETE_RES_METADATA_NOCASCADE : does not delete the row in
--     the metadata table
-- RETURNS -
--     Nothing
-----------------------------------------------------------
procedure deleteResourceMetadata(abspath IN VARCHAR2,
                                 metadatans IN VARCHAR2,
                                 metadataname IN VARCHAR2,
                                 delete_option IN pls_integer :=
                                 DELETE_RES_METADATA_CASCADE);

-----------------------------------------------------------
-- PROCEDURE - updateResourceMetadata
--     Updates metadata for a resource (can be used to update SB
--     metadata only). The new metadata must be SB.
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
--  oldmetadata
--     REF to the old piece of metadata
--  newmetadata
--     REF to the new piece of metadata to replace it with
-- RETURNS -
--     Nothing
-----------------------------------------------------------
PROCEDURE updateResourceMetadata(abspath  IN VARCHAR2,
                                 oldmetadata IN REF SYS.XMLTYPE,
                                 newmetadata IN REF SYS.XMLTYPE);

-----------------------------------------------------------
-- PROCEDURE - updateResourceMetadata
--     Updates metadata for a resource (can be used to update SB
--     metadata only). The new metadata can be either SB or NSB
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
--  oldmetadata
--     REF to the old piece of metadata
--  newmetadata
--     New piece of metadata (can be either SB or NSB)
-- RETURNS -
--     Nothing
-----------------------------------------------------------
PROCEDURE updateResourceMetadata(abspath  IN VARCHAR2,
                                 oldmetadata IN REF SYS.XMLTYPE,
                                 newmetadata IN XMLTYPE);

-----------------------------------------------------------
-- PROCEDURE - updateResourceMetadata
--     Updates metadata for a resource - can be used for both
--     SB or NSB metadata.
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
--  oldns, oldname
--     namespace and local name pair identifying old metadata
--  newmetadata
--     New piece of metadata (can be either SB or NSB)
-- RETURNS -
--     Nothing
-----------------------------------------------------------
PROCEDURE updateResourceMetadata(abspath  IN VARCHAR2,
                                 oldns IN VARCHAR2,
                                 oldname IN VARCHAR,
                                 newmetadata IN XMLTYPE);

-----------------------------------------------------------
-- PROCEDURE - updateResourceMetadata
--     Updates metadata for a resource - can be used for both
--     SB or NSB metadata. New metadata must be SB.
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
--  oldns, oldname
--     namespace and local name pair identifying old metadata
--  newmetadata
--     REF to new metadata
-- RETURNS -
--     Nothing
-----------------------------------------------------------
PROCEDURE updateResourceMetadata(abspath  IN VARCHAR2,
                                 oldns IN VARCHAR2,
                                 oldname IN VARCHAR,
                                 newmetadata IN REF SYS.XMLTYPE);

-----------------------------------------------------------
-- PROCEDURE - purgeResourceMetadata
--     Deletes all user metadata from a resource
--     SB metadata is removed in cascade mode i.e. the rows
--     are deleted from the corresponding metadata tables
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
-- RETURNS -
--     Nothing
-----------------------------------------------------------
PROCEDURE purgeResourceMetadata(abspath  IN VARCHAR2);

---------------------------------------------
-- FUNCTION - getResource
--    Given a path in the repository, returns the XDBResource
-- PARAMETERS -
--    abspath - absolute path in the repository
-- RETURNS -
--    The XDBResource.
---------------------------------------------
FUNCTION getResource(abspath IN VARCHAR2) return dbms_xdbresource.XDBResource;

-----------------------------------------------------------
-- PROCEDURE - refreshContentSize
--     Recompute the content size of the specified resource,
--     disregarding the existing content size. Store it in the Size
--     element in the resource schema, and set the SizeAccurate flag
--     appropriately.
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource. If the path is a folder, then
--     use the recurse flag as below.
--  recurse (IN)
--     Used only if abspath specifies a folder. If true, refresh the
--     size of all resources in the resource tree rooted at the
--     specified resource. If false, compute the size of all
--     documents/subfolders in this folder only.
-- RETURNS -
--     Nothing.
-----------------------------------------------------------
PROCEDURE refreshContentSize ( abspath IN VARCHAR2,
			       recurse IN BOOLEAN := FALSE );

-----------------------------------------------------------
-- PROCEDURE - ProcessLinks
--     Process document links in the specified resource,
--     looking at the current resource configuration parameters.
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource. If the path is a folder, then
--     use the recurse flag as below.
--  recurse (IN)
--     Used only if abspath specifies a folder. If true, process
--     links of all resources in the resource tree rooted at the
--     specified resource. If false, process links of all
--     documents in this folder only.
-- RETURNS -
--     Nothing.
-----------------------------------------------------------
PROCEDURE ProcessLinks (abspath IN VARCHAR2,
                        recurse IN BOOLEAN := FALSE );

-----------------------------------------------------------
-- FUNCTION - isFolder
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource.
-- RETURNS -
--     True if the resource is a folder / container.
-----------------------------------------------------------
FUNCTION isFolder (
        abspath IN VARCHAR2
) return BOOLEAN;

-----------------------------------------------------------
-- PROCEDURE - touchResource
--  Change the last mod time of the resource to the current time.
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource.
-----------------------------------------------------------
PROCEDURE touchResource ( abspath IN VARCHAR2 );

-----------------------------------------------------------
-- PROCEDURE - changeOwner
--  Change the owner of the resource to the given user.
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource.
--  owner (IN)
--     Owner
--  recurse (IN)
--     If true, recursively change owner of all resources in the
--     folder tree.
-----------------------------------------------------------
PROCEDURE changeOwner ( abspath IN VARCHAR2,
                        owner   IN VARCHAR2,
                        recurse IN BOOLEAN := FALSE );

-----------------------------------------------------------
-- XDB Config Update APIs
-- PROCEDURE ADDMIMEMAPPING         Add a mime mapping
-- PROCEDURE DELETEMIMEMAPPING      Delete a mime mapping
-- PROCEDURE ADDXMLEXTENSION        Add an xml extension
-- PROCEDURE DELETEXMLEXTENSION     Delete an xml extension
-- PROCEDURE ADDSERVLETMAPPING      Add a servlet mapping
-- PROCEDURE DELETESERVLETMAPPING   Delete a servlet mapping
-- PROCEDURE ADDSCHEMALOCMAPPING    Add a schema location mapping
-- PROCEDURE DELETESCHEMALOCMAPPING Delete a schema location mapping
-- PROCEDURE ADDSERVLET             Add a servlet
-- PROCEDURE DELETESERVLET          Delete a servlet
-- PROCEDURE ADDSERVLETSECROLE      Add a security role ref to a servlet
-- PROCEDURE DELETESERVLETSECROLE   Delete a security role ref from a servlet
-----------------------------------------------------------

procedure ADDMIMEMAPPING (
	extension IN VARCHAR2,
	mimetype  IN VARCHAR2
);

procedure DELETEMIMEMAPPING (
	extension IN VARCHAR2
);

procedure ADDXMLEXTENSION (
	extension IN VARCHAR2
);

procedure DELETEXMLEXTENSION (
	extension IN VARCHAR2
);

procedure ADDSERVLETMAPPING (
 	pattern IN VARCHAR2,
 	name    IN VARCHAR2
);

procedure DELETESERVLETMAPPING (
 	name IN VARCHAR2
);

procedure ADDSERVLET (
	name     IN VARCHAR2,
	language IN VARCHAR2,
	dispname IN VARCHAR2,
	icon     IN VARCHAR2 := NULL,
	descript IN VARCHAR2 := NULL,
	class    IN VARCHAR2 := NULL,
	jspfile  IN VARCHAR2 := NULL,
	plsql    IN VARCHAR2 := NULL,
	schema   IN VARCHAR2 := NULL
);

procedure DELETESERVLET (
 	name IN VARCHAR2
);

procedure ADDSERVLETSECROLE (
 	servname IN VARCHAR2,
 	rolename IN VARCHAR2,
 	rolelink IN VARCHAR2,
 	descript IN VARCHAR2 := NULL
);

procedure DELETESERVLETSECROLE (
	servname IN VARCHAR2,
	rolename IN VARCHAR2
);

procedure ADDSCHEMALOCMAPPING (
	namespace IN VARCHAR2,
	element   IN VARCHAR2,
	schemaURL IN VARCHAR2
);

procedure DELETESCHEMALOCMAPPING (
	schemaURL IN VARCHAR2
);

-----------------------------------------------------------
-- FUNCTION - hascharcontent
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource.
-- RETURNS -
--     True if the resource has character content.
-----------------------------------------------------------
function HASCHARCONTENT (
	abspath IN VARCHAR2
) return BOOLEAN;

-----------------------------------------------------------
-- FUNCTION - hasxmlcontent
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource.
-- RETURNS -
--     True if the resource has xml content.
-----------------------------------------------------------
function HASXMLCONTENT (
	abspath IN VARCHAR2
) return BOOLEAN;

-----------------------------------------------------------
-- FUNCTION - hasxmlreference
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource.
-- RETURNS -
--     True if the resource has a ref to xml content.
-----------------------------------------------------------
function HASXMLREFERENCE (
	abspath IN VARCHAR2
) return BOOLEAN;

-----------------------------------------------------------
-- FUNCTION - hasblobcontent
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource.
-- RETURNS -
--     True if the resource has blob content.
-----------------------------------------------------------
function HASBLOBCONTENT (
	abspath IN VARCHAR2
) return BOOLEAN;

---------------------------------------------
-- FUNCTION - getContentClob
--    Returns the contents of the resource as a clob.
-- PARAMETERS -
--    abspath - Absolute path of the resource
-- RETURNS -
--    The contents as CLOB.
---------------------------------------------
FUNCTION getContentClob(
	abspath IN VARCHAR2
) return CLOB;

---------------------------------------------
-- FUNCTION - getContentBlob
--    Returns the contents of the resource as a blob.
-- PARAMETERS -
--    abspath - Absolute path of the resource.
--    csid - OUT - The character set id of the blob returned.
--    locksrc - if true, lock and return the source lob. If false,
--    return a temp lob copy.
-- RETURNS -
--    The contents as BLOB.
---------------------------------------------
FUNCTION getContentBlob (
	abspath IN VARCHAR2,
	csid OUT PLS_INTEGER,
	locksrc IN BOOLEAN := FALSE
) return BLOB;

---------------------------------------------
-- FUNCTION - getContentXMLType
--    Returns the contents of the resource as an XMLType.
-- PARAMETERS -
--    abspath - Absolute path of the resource.
-- RETURNS -
--    The contents as XMLType.
---------------------------------------------
FUNCTION getContentXMLType (
	abspath IN VARCHAR2
) return SYS.XMLType;

---------------------------------------------
-- FUNCTION - getContentVarchar2
--    Returns the contents of the resource as an Varchar2.
-- PARAMETERS -
--    abspath - Absolute path of the resource.
-- RETURNS -
--    The contents as Varchar2.
---------------------------------------------
FUNCTION getContentVarchar2 (
	abspath IN VARCHAR2
) return VARCHAR2;

---------------------------------------------
-- FUNCTION - getContentXMLRef
--    Returns the contents of the resource as a ref to an xmltype.
-- PARAMETERS -
--    abspath - Absolute path of the resource.
-- RETURNS -
--    The contents as a ref to an xmltype if the resource is ref
--    based, else null.
---------------------------------------------
FUNCTION getContentXMLRef (
	abspath IN VARCHAR2
) return ref SYS.XMLType;


---------------------------------------------
-- FUNCTION - getxdb_tablespace
--     Returns the current tablespace of xdb, on the assumption
--     that that is the tablespace of XDB.XDB$RESOURCE.
-- PARAMETERS - None.
--
-- NOTE: Currently used by DBMS_XDBT, which is AUTHID CURRENT_USER
--       package, so this API will not be moved to DBMS_XDB_ADMIN.
--       This API is useful if we envision having XDB's objects
--       span multiple tablespaces. Otherwise, DBA_USERS can be queried.
---------------------------------------------
FUNCTION getxdb_tablespace RETURN VARCHAR2;


----------------------------------------------------------------------------------
-- PROCEDURE - addHttpExpireMapping
--    Adds to xdb$config a mapping of the URL pattern to an
--     expiration date. This will control the Expire headers
--     for URLs matching the pattern.
-- PARAMETERS -
--     pattern  -- URL pattern (only * accepted as wildcards)
--     expire   -- expiration directive, follows the ExpireDefault
--                 in Apache's mod_expires, i.e.,
--                 base [plus] (num type)*
--                 -- base: now | modification
--                 -- type: year|years|month|months|week|weeks|day|days|
--                          minute|minutess|second|seconds
-- EXAMPLE
--  dbms_xdb.addHttpExpireMapping('/public/test1/*', 'now plus 4 weeks');
--  dbms_xdb.addHttpExpireMapping('/public/test2/*', 'modification plus 1 day 30 seconds');
----------------------------------------------------------------------------------
procedure addHttpExpireMapping(pattern IN VARCHAR2,
                               expire IN VARCHAR2);

----------------------------------------------------------------------------------
-- PROCEDURE - deleteHttpExpireMapping
--    Deletes from xdb$config all mappings of the URL pattern to an
--     expiration date.
-- PARAMETERS -
--     pattern  -- URL pattern (only * accepted as wildcards)
----------------------------------------------------------------------------------
procedure deleteHttpExpireMapping(pattern IN VARCHAR2);

----------------------------------------------------------------------------------
-- FUNCTION - getHTTPRequestHeader
--    If called during an HTTP request serviced by XDB, it returns the values
--    of the passed header. It returns NULL in case the header is not present
--    in the request, or for AUTHENTICATION, for security reasons.
--    Expected to be used by routines that implement custom authentication.
----------------------------------------------------------------------------------
function getHTTPRequestHeader(header_name IN VARCHAR2)
  return VARCHAR2;

end dbms_xdb;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XDB_CONFIG" AUTHID CURRENT_USER IS

------------
-- CONSTANTS
--
------------
-- Constant number for 1st argument of setListenerEndPoint
XDB_ENDPOINT_HTTP  CONSTANT NUMBER := 1;
XDB_ENDPOINT_HTTP2 CONSTANT NUMBER := 2;
-- Permit https instead of http2, bug 17213197
XDB_ENDPOINT_HTTPS CONSTANT NUMBER := 2;

-- Constant number for 4th argument of setListenerEndPoint
XDB_PROTOCOL_TCP   CONSTANT NUMBER := 1;
XDB_PROTOCOL_TCPS  CONSTANT NUMBER := 2;

-- Constant number for 1st argument of xdb_validate_port
-- Constant for service id, compatible with xdb.xdb$cdbports
XDB_SERVICE_FTP   CONSTANT NUMBER := 1;
XDB_SERVICE_HTTP  CONSTANT NUMBER := 2;
XDB_SERVICE_HTTP2 CONSTANT NUMBER := 3;
-- Following is not used, reserve the value anyway.
XDB_SERVICE_NFS   CONSTANT NUMBER := 4;

ON_DENY_NEXT_CUSTOM   CONSTANT NUMBER := 1;
ON_DENY_BASIC         CONSTANT NUMBER := 2;

---------------------------------------------
-- PROCEDURE - usedport
--     return the protocol port numbers of all pdbs
-- PARAMETERS -
---------------------------------------------
FUNCTION usedport RETURN sys.xmltype;

---------------------------------------------
-- PROCEDURE - setFTPPort
--     sets the FTP port to new value
-- PARAMETERS -
--     new_port
--         value that the ftp port will be set to
---------------------------------------------

PROCEDURE setFTPPort(new_port IN NUMBER);

---------------------------------------------
-- FUNCTION - getFTPPort
--     gets the current value of FTP port
-- PARAMETERS -
--     none
-- RETURNS
--     ftp_port
--         current value of ftp-port
---------------------------------------------

FUNCTION getFTPPort RETURN NUMBER;

---------------------------------------------
-- PROCEDURE - setHTTPPort
--     sets the HTTP port to new value
-- PARAMETERS -
--     new_port
--         value that the http port will be set to
---------------------------------------------

PROCEDURE setHTTPPort(new_port IN NUMBER);

---------------------------------------------
-- FUNCTION - getHTTPPort
--     gets the current value of HTTP port
-- PARAMETERS -
--     none
-- RETURNS
--     http_port
--         current value of http-port
---------------------------------------------

FUNCTION getHTTPPort RETURN NUMBER;

---------------------------------------------
-- PROCEDURE - setHTTPsPort
--     sets the HTTPs port to new value
--
-- PARAMETERS -
--     new_port
--         value that the https port will be set to.
--
-- NOTE
--     The HTTPS port will be set using the second
--     HTTP end point
---------------------------------------------

PROCEDURE setHTTPsPort(new_port IN NUMBER);

---------------------------------------------
-- FUNCTION - getHTTPsPort
--     gets the current value of HTTPs port
-- PARAMETERS -
--     none
-- RETURNS
--     https_port
--         current value of https-port. Return NULL
--         if none has been configured
---------------------------------------------

FUNCTION getHTTPsPort RETURN NUMBER;

---------------------------------------------
-- PROCEDURE setListenerEndPoint(endpoint IN number, host IN varchar2,
--                               port IN number, protocol IN number);

-- This procedure sets the parameters of a listener end point corresponding
-- to the XML DB HTTP server. Both HTTP and HTTP2 end points can be set by
-- invoking this procedure.

--   (a) endpoint - The end point to be set. Its value can be
--       XDB_ENDPOINT_HTTP or XDB_ENDPOINT_HTTP2.
--   (b) host - The interface on which the listener end point is to listen.
--       Its value can be 'localhost,' null, or a hostname. If its value is
--       'localhost,' then the listener end point is permitted to only listen
--       on the localhost interface. If its value is null or hostname, then
--       the listener end point is permitted to listen on both localhost and
--       non-localhost interfaces.
--   (c) port - The port on which the listener end point is to listen.
--   (d) protocol - The transport protocol that the listener end point is to
--       accept. Its value can be XDB_PROTOCOL_TCP or XDB_PROTOCOL_TCPS.
---------------------------------------------

PROCEDURE setListenerEndPoint(endpoint IN number, host IN varchar2,
                              port IN number, protocol IN number);

---------------------------------------------
--  PROCEDURE getListenerEndPoint(endpoint IN NUMBER, host OUT VARCHAR2,
--                                port OUT NUMBER, protocol OUT NUMBER);

-- This procedure retrieves the parameters of a listener end point
-- corresponding to the XML DB HTTP server. The parameters of both HTTP
-- and HTTP2 end points can be retrieved by invoking this procedure.

--  (a) endpoint - The end point whose parameters are to be retrieved. Its
--      value can be XDB_ENDPOINT_HTTP or XDB_ENDPOINT_HTTP2.
--  (b) host - The interface on which the listener end point listens.
--  (c) port - The port on which the listener end point listens.
--  (d) protocol - The transport protocol accepted by the listener end point.
---------------------------------------------

PROCEDURE getListenerEndPoint(endpoint IN NUMBER, host OUT VARCHAR2,
                              port OUT NUMBER, protocol OUT NUMBER);

---------------------------------------------
-- PROCEDURE setListenerLocalAccess(l_access boolean);
-- This procedure restricts all listener end points of the XML DB HTTP server
-- to listen only on the localhost interface (when l_access is TRUE) or
-- allows all listener end points of the XML DB HTTP server to listen on
-- both localhost and non-localhost interfaces (when l_access is FALSE).

--  (a) l_access - TRUE or FALSE. See description of procedure above.
---------------------------------------------
PROCEDURE setListenerLocalAccess(l_access boolean);

---------------------------------------------
-- PROCEDURE - refresh
--     Refreshes the session configuration with the latest configuration
---------------------------------------------
PROCEDURE cfg_refresh;

---------------------------------------------
-- FUNCTION - get
--     retrieves the xdb configuration
-- RETURNS -
--     XMLType for xdb configuration
---------------------------------------------
FUNCTION cfg_get RETURN sys.xmltype;

---------------------------------------------
-- PROCEDURE - update
--     Updates the xdb configuration with the input xmltype document
-- PARAMETERS -
--  xdbconfig
---     XMLType for xdb configuration
--------------------------------------------
PROCEDURE cfg_update(xdbconfig IN sys.xmltype);

-----------------------------------------------------------
-- XDB Config Update APIs
-- PROCEDURE ADDMIMEMAPPING         Add a mime mapping
-- PROCEDURE DELETEMIMEMAPPING      Delete a mime mapping
-- PROCEDURE ADDXMLEXTENSION        Add an xml extension
-- PROCEDURE DELETEXMLEXTENSION     Delete an xml extension
-- PROCEDURE ADDSERVLETMAPPING      Add a servlet mapping
-- PROCEDURE DELETESERVLETMAPPING   Delete a servlet mapping
-- PROCEDURE ADDSCHEMALOCMAPPING    Add a schema location mapping
-- PROCEDURE DELETESCHEMALOCMAPPING Delete a schema location mapping
-- PROCEDURE ADDSERVLET             Add a servlet
-- PROCEDURE DELETESERVLET          Delete a servlet
-- PROCEDURE ADDSERVLETSECROLE      Add a security role ref to a servlet
-- PROCEDURE DELETESERVLETSECROLE   Delete a security role ref from a servlet
-----------------------------------------------------------

procedure ADDMIMEMAPPING (
	extension IN VARCHAR2,
	mimetype  IN VARCHAR2
);

procedure DELETEMIMEMAPPING (
	extension IN VARCHAR2
);

procedure ADDXMLEXTENSION (
	extension IN VARCHAR2
);

procedure DELETEXMLEXTENSION (
	extension IN VARCHAR2
);

procedure ADDSERVLETMAPPING (
 	pattern IN VARCHAR2,
 	name    IN VARCHAR2
);

procedure DELETESERVLETMAPPING (
 	name IN VARCHAR2
);

procedure ADDSERVLET (
	name     IN VARCHAR2,
	language IN VARCHAR2,
	dispname IN VARCHAR2,
	icon     IN VARCHAR2 := NULL,
	descript IN VARCHAR2 := NULL,
	class    IN VARCHAR2 := NULL,
	jspfile  IN VARCHAR2 := NULL,
	plsql    IN VARCHAR2 := NULL,
	schema   IN VARCHAR2 := NULL
);

procedure DELETESERVLET (
 	name IN VARCHAR2
);

procedure ADDSERVLETSECROLE (
 	servname IN VARCHAR2,
 	rolename IN VARCHAR2,
 	rolelink IN VARCHAR2,
 	descript IN VARCHAR2 := NULL
);

procedure DELETESERVLETSECROLE (
	servname IN VARCHAR2,
	rolename IN VARCHAR2
);

procedure ADDSCHEMALOCMAPPING (
	namespace IN VARCHAR2,
	element   IN VARCHAR2,
	schemaURL IN VARCHAR2
);

procedure DELETESCHEMALOCMAPPING (
	schemaURL IN VARCHAR2
);

---------------------------------------------
-- PROCEDURE - addAuthenticationMapping
--     Adds a mapping from the authentication method name to a
--      URL pattern (in xdb$onfig).
-- PARAMETERS -
--     pattern - URL pattern
--     name    - authentication method name
---------------------------------------------
procedure addAuthenticationMapping(pattern IN VARCHAR2,
                                   name IN VARCHAR2,
                                   user_prefix IN VARCHAR2 := NULL,
                                   on_deny IN NUMBER := NULL);
PRAGMA SUPPLEMENTAL_LOG_DATA(addAuthenticationMapping, UNSUPPORTED_WITH_COMMIT);

---------------------------------------------
-- PROCEDURE - deleteAuthenticationMapping
--     Deletes a mapping from the authentication method name to a
--      URL pattern (from xdb$onfig).
-- PARAMETERS -
--     pattern - URL pattern
--     name    - authentication method name
---------------------------------------------
procedure deleteAuthenticationMapping(pattern IN VARCHAR2,
                                      name IN VARCHAR2);
PRAGMA SUPPLEMENTAL_LOG_DATA(deleteAuthenticationMapping, UNSUPPORTED_WITH_COMMIT);

---------------------------------------------
-- PROCEDURE - addAuthenticationMethod
--     Adds to xdb$config a custom authentication method entry.
-- PARAMETERS -
--     name    - authentication method name (the name the
--               custom authentication routine will be known to XDB)
--     description - some note on the authentication method
--     implement_schema - the owner of the routine that implements
--                        the authentication
--     implement_method - the name of the routine that implements
--                        the authentication
--     language         - the language in which the implementation
--                        routine is written (currently only PL/SQL)
---------------------------------------------
procedure addAuthenticationMethod(name IN VARCHAR2,
                                  description IN VARCHAR2,
                                  implement_schema IN VARCHAR2,
                                  implement_method IN VARCHAR2,
                                  language  IN VARCHAR2 := 'PL/SQL');
PRAGMA SUPPLEMENTAL_LOG_DATA(addAuthenticationMethod, UNSUPPORTED_WITH_COMMIT);

---------------------------------------------
-- PROCEDURE - deleteAuthenticationMethod
--    Deletes from  xdb$config a custom authentication method entry.
-- PARAMETERS -
--     name    - authentication method name (the name the
--               custom authentication routine will be known to XDB)
---------------------------------------------
procedure deleteAuthenticationMethod(name IN VARCHAR2);
PRAGMA SUPPLEMENTAL_LOG_DATA(deleteAuthenticationMethod, UNSUPPORTED_WITH_COMMIT);

procedure addTrustScheme(name IN VARCHAR2,
                         description IN VARCHAR2,
                         session_user IN VARCHAR2,
                         parsing_schema IN VARCHAR2,
                         system_level IN BOOLEAN := TRUE,
                         require_parsing_schema IN BOOLEAN := TRUE,
                         allow_registration IN BOOLEAN := TRUE);
PRAGMA SUPPLEMENTAL_LOG_DATA(addTrustScheme, UNSUPPORTED_WITH_COMMIT);

procedure deleteTrustScheme(name IN VARCHAR2,
                            system_level IN BOOLEAN := TRUE);
PRAGMA SUPPLEMENTAL_LOG_DATA(deleteTrustScheme, UNSUPPORTED_WITH_COMMIT);

procedure addTrustMapping(pattern IN VARCHAR2,
                          auth_name IN VARCHAR2,
                          trust_name IN VARCHAR2,
                          user_prefix IN VARCHAR2 := NULL);
PRAGMA SUPPLEMENTAL_LOG_DATA(addTrustMapping, UNSUPPORTED_WITH_COMMIT);

procedure deleteTrustMapping(pattern IN VARCHAR2,
                             name IN VARCHAR2);
PRAGMA SUPPLEMENTAL_LOG_DATA(deleteTrustMapping, UNSUPPORTED_WITH_COMMIT);

procedure enableCustomAuthentication;
PRAGMA SUPPLEMENTAL_LOG_DATA(enableCustomAuthentication, UNSUPPORTED_WITH_COMMIT);

procedure enableCustomTrust;
PRAGMA SUPPLEMENTAL_LOG_DATA(enableCustomTrust, UNSUPPORTED_WITH_COMMIT);

procedure setDynamicGroupStore(is_dynamic IN BOOLEAN := TRUE);
PRAGMA SUPPLEMENTAL_LOG_DATA(setDynamicGroupStore, UNSUPPORTED_WITH_COMMIT);

procedure enableDigestAuthentication;
PRAGMA SUPPLEMENTAL_LOG_DATA(enableDigestAuthentication, UNSUPPORTED_WITH_COMMIT);

function getHttpConfigRealm
  return VARCHAR2;

procedure setHttpConfigRealm(realm IN VARCHAR2);

-----------------------------------------------------------
-- PROCEDURE - addDefaultTypeMappings
--  creats a default-type-mappings entry in xdbconfig.
--  Default is pre-11.2
--
-- PARAMETERS -
--  version (IN) - Accepted values: "pre-11.2" or "post-11.2"
--                 Default is pre-11.2
-----------------------------------------------------------
PROCEDURE addDefaultTypeMappings ( version IN VARCHAR2 := 'pre-11.2');


-----------------------------------------------------------
-- PROCEDURE - deleteDefaultTypeMappings
--  deletes the default type mappings from xdbconfig.
--
-- PARAMETERS -
-----------------------------------------------------------
PROCEDURE deleteDefaultTypeMappings;

-----------------------------------------------------------
-- PROCEDURE - setDefaultTypeMappings
--  sets the value of default-type-mappings in xdbconfig
--
-- PARAMETERS -
--  type (IN) - Accepted values: "pre-11.2" or "post-11.2"
-----------------------------------------------------------
PROCEDURE setDefaultTypeMappings ( version IN VARCHAR2 );


-------------------------------------------------------------------------------
-- PROCEDURE - addHttpExpireMapping
--    Adds to xdb$config a mapping of the URL pattern to an
--     expiration date. This will control the Expire headers
--     for URLs matching the pattern.
-- PARAMETERS -
--     pattern  -- URL pattern (only * accepted as wildcards)
--     expire   -- expiration directive, follows the ExpireDefault
--                 in Apache's mod_expires, i.e.,
--                 base [plus] (num type)*
--                 -- base: now | modification
--                 -- type: year|years|month|months|week|weeks|day|days|
--                          minute|minutess|second|seconds
-- EXAMPLE
--  dbms_xdb.addHttpExpireMapping('/public/test1/*', 'now plus 4 weeks');
--  dbms_xdb.addHttpExpireMapping('/public/test2/*',
--                                'modification plus 1 day 30 seconds');
-------------------------------------------------------------------------------
procedure addHttpExpireMapping(pattern IN VARCHAR2,
                               expire IN VARCHAR2);

-------------------------------------------------------------------------------
-- PROCEDURE - deleteHttpExpireMapping
--    Deletes from xdb$config all mappings of the URL pattern to an
--     expiration date.
-- PARAMETERS -
--     pattern  -- URL pattern (only * accepted as wildcards)
-------------------------------------------------------------------------------
procedure deleteHttpExpireMapping(pattern IN VARCHAR2);

-------------------------------------------------------------------------------
-- FUNCTION - getHTTPRequestHeader
--    If called during an HTTP request serviced by XDB, it returns the values
--    of the passed header. It returns NULL in case the header is not present
--    in the request, or for AUTHENTICATION, for security reasons.
--    Expected to be used by routines that implement custom authentication.
-------------------------------------------------------------------------------
function getHTTPRequestHeader(header_name IN VARCHAR2)
  return VARCHAR2;

end dbms_xdb_config;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XDB_REPOS" AUTHID CURRENT_USER IS

------------
-- CONSTANTS
--
------------
DELETE_RESOURCE        CONSTANT NUMBER := 1;
DELETE_RECURSIVE       CONSTANT NUMBER := 2;
DELETE_FORCE           CONSTANT NUMBER := 3;
DELETE_RECURSIVE_FORCE CONSTANT NUMBER := 4;

DELETE_RES_METADATA_CASCADE   CONSTANT NUMBER := 1;
DELETE_RES_METADATA_NOCASCADE CONSTANT NUMBER := 2;


DEFAULT_LOCK_TIMEOUT CONSTANT PLS_INTEGER := (60*60);

LINK_TYPE_HARD        CONSTANT NUMBER := 1;
LINK_TYPE_WEAK        CONSTANT NUMBER := 2;
LINK_TYPE_SYMBOLIC    CONSTANT NUMBER := 3;


---------------------------------------------
-- FUNCTION - LockResource
--     Gets a webdav-like lock for XDB resource given its path
-- PARAMETERS -
--  abspath
--     Absolute path in the Hierarchy of the resource
--  depthzero
--     depth zero boolean
--  shared
--     shared boolean
-- RETURNS -
--     Returns TRUE if successful
---------------------------------------------
FUNCTION LockResource(abspath IN VARCHAR2, depthzero IN BOOLEAN,
                                           shared IN boolean)
              RETURN boolean;

---------------------------------------------
-- FUNCTION - LockResource
--     Gets a webdav-like lock for XDB resource given its path
-- PARAMETERS -
--  abspath
--     Absolute path in the Hierarchy of the resource
--  depthzero
--     depth zero boolean
--  shared
--     shared boolean
--  token
--     generated token
--  timeout
--     time (in seconds) after which lock expires
-- RETURNS -
--     Returns TRUE if successful
---------------------------------------------
FUNCTION LockResource(abspath IN VARCHAR2, depthzero IN BOOLEAN,
                      shared IN boolean, token OUT VARCHAR2,
                      timeout IN PLS_INTEGER := DEFAULT_LOCK_TIMEOUT)
              RETURN boolean;

---------------------------------------------
-- PROCEDURE - RefreshLock
--     Refreshes a webdav-like lock for XDB resource given its path
-- PARAMETERS -
--  abspath
--     Absolute path in the Hierarchy of the resource
--  token
--     token corresponding to the lock to be refreshed
--  newTimeout
--     new timeout (in seconds) after which lock will expire
-- NOTE -
--     If the timeout is less than the remaining time to expiry,
--     lock will not be refreshed
---------------------------------------------

PROCEDURE RefreshLock(abspath IN VARCHAR2, token IN VARCHAR2,
                     newTimeout IN  PLS_INTEGER := DEFAULT_LOCK_TIMEOUT);

---------------------------------------------
-- FUNCTION - LockDiscovery
--     Gets Locks element on resource defined by abspath
-- PARAMETERS -
--  abspath
--     Absolute path in the Hierarchy of the resource
-- RETURNS -
--     the Locks element as XMLType
---------------------------------------------
FUNCTION LockDiscovery(abspath IN VARCHAR2)
               RETURN SYS.XMLType;

---------------------------------------------
-- PROCEDURE - GetLockToken
--     Gets lock token for current user for XDB resource given its path
-- PARAMETERS -
--  abspath
--     Absolute path in the Hierarchy of the resource
--  locktoken (OUT)
--     Returns lock token
---------------------------------------------
PROCEDURE GetLockToken(abspath IN VARCHAR2, locktoken OUT VARCHAR2);

---------------------------------------------
-- FUNCTION - Unlock
--     Removes lock for XDB resource given lock token
-- PARAMETERS -
--  abspath
--     Absolute path in the Hierarchy of the resource
--  delToken
--     Lock token name to be removed
-- RETURNS -
--     Returns TRUE if successful
---------------------------------------------
FUNCTION UnlockResource(abspath IN VARCHAR2, deltoken IN VARCHAR2 := NULL)
                        RETURN boolean;

---------------------------------------------
-- PROCEDURE - AddToLockTokenList
--     Adds specified token to the session lock token list
-- PARAMETERS -
--  token
--     token to be added to token list
---------------------------------------------
PROCEDURE AddToLockTokenList(token IN VARCHAR2);

---------------------------------------------
-- FUNCTION - DeleteFromLockTokenList
--     Deletes specified token from the session lock token list
-- PARAMETERS -
--  token
--     token to be deleted from token list
-- RETURNS -
--     returns TRUE if delete was successful
---------------------------------------------
FUNCTION DeleteFromLockTokenList(token IN VARCHAR2)
                        RETURN boolean;

---------------------------------------------
-- FUNCTION - GetLockTokenList
--     Gets the session lock token list
-- PARAMETERS -
--  None
-- RETURNS -
--  The session lock token list
---------------------------------------------
FUNCTION GetLockTokenList RETURN LockTokenListType;

---------------------------------------------
-- FUNCTION - ExistsResource(VARCHAR2)
--     Given a string, returns true if the resource exists in the hierarchy.
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
-- RETURNS -
--     Returns TRUE if resource was found in the hierarchy.
---------------------------------------------
FUNCTION ExistsResource(abspath IN VARCHAR2) RETURN BOOLEAN;

---------------------------------------------
-- FUNCTION - CreateResource(VARCHAR2, VARCHAR2, VARCHAR2, VARCHAR2)
--     Given a string, inserts a new resource into the hierarchy with
--     the string as the contents.
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
--  data
--     String buffer containing the resource contents
--  schemaurl
--     for XML data, schema URL data conforms to (default null)
--  elem
--     element name (default null)
-- RETURNS -
--     Returns TRUE if resource was successfully inserted or updated
---------------------------------------------
FUNCTION CreateResource(abspath IN VARCHAR2,
                        data IN VARCHAR2,
                        schemaurl IN VARCHAR2 := NULL,
                        elem IN VARCHAR2 := NULL) RETURN BOOLEAN;

---------------------------------------------
-- FUNCTION - CreateResource(VARCHAR2, SYS.XMLTYPE, VARCHAR2, VARCHAR2)
--     Given an XMLTYPE and a schema URL, inserts a new resource
--     into the hierarchy with the XMLTYPE as the contents.
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
--  data
--     XMLTYPE containing the resource contents
--  schemaurl
--     schema URL the XmlType conforms to (default null)
--  elem
--     element name (default null)
-- RETURNS -
--     Returns TRUE if resource was successfully inserted or updated
---------------------------------------------
FUNCTION CreateResource(abspath IN VARCHAR2,
                        data IN SYS.XMLTYPE,
                        schemaurl IN VARCHAR2 := NULL,
                        elem IN VARCHAR2 := NULL) RETURN BOOLEAN;


---------------------------------------------
-- FUNCTION - CreateResource(VARCHAR2, REF SYS.XMLTYPE, BOOLEAN, BOOLEAN)
--     Given a PREF to an existing XMLType row, inserts a new resource
--     whose contents point directly at that row.  That row should
--     not already exist inside another resource.
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
--  data
--     REF to the XMLType row containing the resource contents
--  sticky
--     If TRUE creates a sticky REF, otherwise non-sticky.
--     Default is TRUE (for backwards compatibility).
--  calcSize
--     If true, calculate the content size of the resource. Default is
--     false for performance reasons.
-- RETURNS -
--     Returns TRUE if resource was successfully inserted or updated
---------------------------------------------
FUNCTION CreateResource(abspath IN VARCHAR2,
                        data IN REF SYS.xmltype,
                        sticky IN BOOLEAN := TRUE,
                        calcSize IN BOOLEAN := FALSE) RETURN BOOLEAN;

---------------------------------------------
-- FUNCTION - CreateResource(VARCHAR2, CLOB)
--     Given a CLOB, inserts a new resource into the hierarchy with
--     the CLOB as the contents.
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
--  data
--     CLOB containing the resource contents
-- RETURNS -
--     Returns TRUE if resource was successfully inserted or updated
---------------------------------------------
FUNCTION CreateResource(abspath IN VARCHAR2,
                        data IN CLOB) RETURN BOOLEAN;

---------------------------------------------
-- FUNCTION - CreateResource(VARCHAR2, BFILE, NUMBER)
--     Given a BFILE, inserts a new resource into the hierarchy with
--     the contents loaded from the BFILE.
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
--  data
--     BFILE containing the resource contents
--  csid
--     character set id of the input bfile
-- RETURNS -
--     Returns TRUE if resource was successfully inserted or updated
---------------------------------------------
FUNCTION CreateResource(abspath IN VARCHAR2,
                        data IN BFILE,
                        csid IN NUMBER := 0) RETURN BOOLEAN;

---------------------------------------------
-- FUNCTION - CreateResource(VARCHAR2, BLOB, NUMBER)
--     Given a BLOB, inserts a new resource into the hierarchy with
--     the BLOB as the contents.
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
--  data
--     BLOB containing the resource contents
--  csid
--     character set id of the input blob
-- RETURNS -
--     Returns TRUE if resource was successfully inserted or updated
---------------------------------------------
FUNCTION CreateResource(abspath IN VARCHAR2,
                        data IN BLOB,
                        csid IN NUMBER := 0) RETURN BOOLEAN;


---------------------------------------------
-- FUNCTION - CreateFolder
--     Creates a folder in the Repository
-- PARAMETERS -
--  abspath
--     Absolute path iin the Hierarchy were the resource will be stored
-- RETURNS -
--     Returns TRUE if folder was created succesfully in Repository
---------------------------------------------
FUNCTION CreateFolder(abspath IN VARCHAR2) RETURN BOOLEAN;

---------------------------------------------
-- FUNCTION - AddResource(VARCHAR2, VARCHAR2)
--     Given a string, inserts a new resource into the hierarchy with
--     the string as the contents.
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
--  data
--     String buffer containing the resource contents
-- RETURNS -
--     Returns 2 if resource already exists
--             1 if resource was successfully inserted
--             0 otherwise
---------------------------------------------
FUNCTION AddResource(abspath IN VARCHAR2,
                        data IN VARCHAR2) RETURN NUMBER;

---------------------------------------------
-- PROCEDURE - DeleteResource
--     Deletes a resource from the Hierarchy
-- PARAMETERS -
--  abspath
--     Absolute path in the Hierarchy for resource to be deleted
--  delete_option : one of the following
--    DELETE_RESOURCE ::
--      delete the resource alone. Fails if the resource has children
--    DELETE_RECURSIVE ::
--      delete the resource with the children, if any.
--    DELETE_FORCE ::
--      delete the resource even if the object it contains is invalid.
--    DELETE_RECURSIVE_FORCE ::
--      delete the resource and all children, ignoring any errors raised
--      by contained objects being invalid
---------------------------------------------
PROCEDURE DeleteResource(abspath IN VARCHAR2,
                         delete_option IN pls_integer := DELETE_RESOURCE);

---------------------------------------------
-- PROCEDURE - Link
--     Creates a link from a specified folder to a specified resource.
-- PARAMETERS -
--  srcpath
--     Path name of the resource to which a link is created.
--  linkfolder
--     Folder in which the new link is placed.
--  linkname
--     Name of the new link.
--  linktype
--     Type of link to be created.
--     One of the following:
--         DBMS_XDB.LINK_TYPE_HARD (default)
--         DBMS_XDB.LINK_TYPE_WEAK
--         DBMS_XDB.LINK_TYPE_SYMBOLIC
---------------------------------------------
PROCEDURE Link(srcpath IN VARCHAR2, linkfolder IN VARCHAR2,
               linkname IN VARCHAR2,
               linktype IN PLS_INTEGER := DBMS_XDB.LINK_TYPE_HARD);

---------------------------------------------
-- PROCEDURE - Rename
--     Renames a XDB resource
-- PARAMETERS -
--  srcpath
--     Absolute path in the Hierarchy of the source resource
--  destfolder
--     Absolute path in the Hierarchy of the dest folder
--  newname
--     Name of the child in the destination folder
---------------------------------------------
PROCEDURE RenameResource(srcpath IN VARCHAR2, destfolder IN VARCHAR2,
                         newname IN VARCHAR2);

---------------------------------------------
-- FUNCTION - getAclDoc
--     gets acl document that protects resource given in path
-- PARAMETERS -
--  abspath
--     Absolute path in the Hierarchy of the resource whose acl doc is required
-- RETURNS -
--     Returns xmltype for acl document
---------------------------------------------
FUNCTION getAclDocument(abspath IN VARCHAR2) RETURN sys.xmltype;

---------------------------------------------
-- FUNCTION - getPrivileges
--     Gets all system and user privileges granted to the current user
--     on the given XDB resource
-- PARAMETERS -
--  res_path
--     Absolute path in the Hierarchy for XDB resource
-- RETURNS -
--     Returns a XMLType instance of <privilege> element
--     which contains the list of all (leaf) privileges
--     granted on this resource to the current user.
--     It includes all granted system and user privileges.
--     Example :
--       <privilege xmlns="http://xmlns.oracle.com/xdb/acl.xsd"
--                  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
--                  xsi:schemaLocation="http://xmlns.oracle.com/xdb/acl.xsd
--                                      http://xmlns.oracle.com/xdb/acl.xsd"
--                  xmlns:dav="DAV:"
--                  xmlns:emp="http://www.example.com/emp.xsd">
--          <read-contents/>
--          <read-properties/>
--          <resolve/>
--          <dav:read-acl/>
--          <emp:Hire/>
--       </privilege>
---------------------------------------------
FUNCTION getPrivileges(res_path IN VARCHAR2) RETURN sys.xmltype;

---------------------------------------------
-- FUNCTION - changePrivileges
--     change access privileges on given XDB resource
-- PARAMETERS -
--  res_path
--     Absolute path in the Hierarchy for XDB resource
--  ace
--     an XMLType instance of the <ace> element which specifies
--     the <principal>, the operation <grant> and the list of
--     privileges.
--     If no ACE with the same principal and the same operation
--     (grant/deny) already exists in the ACL, the new ACE is added
--     at the end of the ACL.
--  replace
--    This argument determines the result of changePrivileges if
--    an ACE with the same principal and same operation (grant/deny)
--    already exists in the ACL.
--
--    If set to TRUE,
--       the old ACE is replaced with the new one.
--    else
--       the privileges of the old and new ACEs are combined into a
--       single ACE.
--
-- RETURNS -
--     Returns positive integer if ACL was successfully modified
---------------------------------------------
FUNCTION changePrivileges(res_path IN VARCHAR2,
                          ace      IN xmltype)
                          RETURN pls_integer;

---------------------------------------------
-- FUNCTION - checkPrivileges
--     checks access privileges granted on specified XDB resource
-- PARAMETERS -
--  res_path
--     Absolute path in the Hierarchy for XDB resource
--  privs
--     Requested set of access privileges
--     This argument is a XMLType instance of the <privilege> element.
-- RETURNS -
--     Returns positive integer if all requested privileges granted
---------------------------------------------
FUNCTION checkPrivileges(res_path IN VARCHAR2,
                         privs IN xmltype)
                         RETURN pls_integer;


---------------------------------------------
-- PROCEDURE - setacl
--     sets the ACL on given XDB resource to be the specified in the acl path
-- PARAMETERS -
--  res_path
--     Absolute path in the Hierarchy for XDB resource
--  acl_path
--     Absolute path in the Hierarchy for XDB acl
---------------------------------------------
PROCEDURE setacl(res_path IN VARCHAR2, acl_path IN VARCHAR2);

---------------------------------------------
-- FUNCTION - AclCheckPrivileges
--     checks access privileges granted by specified ACL document
-- PARAMETERS -
--  acl_path
--     Absolute path in the Hierarchy for ACL document
--  owner
--     Resource owner name. The pseudo user "XDBOWNER" is replaced
--     by this user during ACL privilege resolution
--  privs
--     Requested set of access privileges
--     This argument is a XMLType instance of the <privilege> element.
-- RETURNS -
--     Returns positive integer if all requested privileges granted
---------------------------------------------
FUNCTION AclCheckPrivileges(acl_path IN VARCHAR2,
                            owner IN VARCHAR2,
                            privs IN xmltype)
                            RETURN pls_integer;

---------------------------------------------
-- FUNCTION - GetResOID(abspath VARCHAR2)
--     Returns the OID of the resource, given its absolute path
--
-- PARAMETERS -
--  abspath
--     Absolute path to the resource
-- RETURNS -
--     OID of resource if present, NULL otherwise
---------------------------------------------
FUNCTION GetResOID(abspath IN VARCHAR2) RETURN RAW;

---------------------------------------------
-- FUNCTION - CreateOIDPath(oid RAW)
--     Returns the OID-based virtual path to the resource
--
-- PARAMETERS -
--  OID
--     OID of the resource
-- RETURNS -
--     the OID-based virtual path to the resource
---------------------------------------------
FUNCTION CreateOIDPath(oid IN RAW) RETURN VARCHAR2;

-----------------------------------------------------------
-- PROCEDURE - appendResourceMetadata
--     Appends the given piece of metadata to the resource
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
--  data
--     Metadata (can be schema based or NSB). SB metadata
--     will be stored in its own table.
-- RETURNS -
--     Nothing
-----------------------------------------------------------
PROCEDURE appendResourceMetadata(abspath IN VARCHAR2,
                                 data IN SYS.xmltype);

-----------------------------------------------------------
-- PROCEDURE - appendResourceMetadata
--     Appends the given piece of metadata identified by a REF
--     to the resource
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
--  data
--     REF to the piece of metadata (schema based)
-- RETURNS -
--     Nothing
-----------------------------------------------------------
PROCEDURE appendResourceMetadata(abspath IN VARCHAR2,
                                 data IN REF SYS.xmltype);

-----------------------------------------------------------
-- PROCEDURE - deleteResourceMetadata
--     Deletes metadata from a resource (can only be used for SB metadata)
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
--  metadata
--     REF to the piece of metadata (schema based) to be deleted
--  delete_option
--     Can be one of the following:
--     DELETE_RES_METADATA_CASCADE : deletes the corresponding row
--     in the metadata table
--     DELETE_RES_METADATA_NOCASCADE : does not delete the row in
--     the metadata table
-- RETURNS -
--     Nothing
-----------------------------------------------------------
PROCEDURE deleteResourceMetadata(abspath IN VARCHAR2,
                                 metadata IN REF SYS.XMLTYPE,
                                 delete_option IN pls_integer :=
                                  DELETE_RES_METADATA_CASCADE);

-----------------------------------------------------------
-- PROCEDURE - deleteResourceMetadata
--     Deletes metadata from a resource (can be used for SB or
--     NSB metadata)
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
--  metadatans
--     Namespace of the metadata fragment to be removed
--  metadataname
--     Local name of the metadata fragment to be removed
--  delete_option
--     This is only applicable for SB metadata.
--     Can be one of the following:
--     DELETE_RES_METADATA_CASCADE : deletes the corresponding row
--     in the metadata table
--     DELETE_RES_METADATA_NOCASCADE : does not delete the row in
--     the metadata table
-- RETURNS -
--     Nothing
-----------------------------------------------------------
procedure deleteResourceMetadata(abspath IN VARCHAR2,
                                 metadatans IN VARCHAR2,
                                 metadataname IN VARCHAR2,
                                 delete_option IN pls_integer :=
                                 DELETE_RES_METADATA_CASCADE);

-----------------------------------------------------------
-- PROCEDURE - updateResourceMetadata
--     Updates metadata for a resource (can be used to update SB
--     metadata only). The new metadata must be SB.
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
--  oldmetadata
--     REF to the old piece of metadata
--  newmetadata
--     REF to the new piece of metadata to replace it with
-- RETURNS -
--     Nothing
-----------------------------------------------------------
PROCEDURE updateResourceMetadata(abspath  IN VARCHAR2,
                                 oldmetadata IN REF SYS.XMLTYPE,
                                 newmetadata IN REF SYS.XMLTYPE);

-----------------------------------------------------------
-- PROCEDURE - updateResourceMetadata
--     Updates metadata for a resource (can be used to update SB
--     metadata only). The new metadata can be either SB or NSB
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
--  oldmetadata
--     REF to the old piece of metadata
--  newmetadata
--     New piece of metadata (can be either SB or NSB)
-- RETURNS -
--     Nothing
-----------------------------------------------------------
PROCEDURE updateResourceMetadata(abspath  IN VARCHAR2,
                                 oldmetadata IN REF SYS.XMLTYPE,
                                 newmetadata IN XMLTYPE);

-----------------------------------------------------------
-- PROCEDURE - updateResourceMetadata
--     Updates metadata for a resource - can be used for both
--     SB or NSB metadata.
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
--  oldns, oldname
--     namespace and local name pair identifying old metadata
--  newmetadata
--     New piece of metadata (can be either SB or NSB)
-- RETURNS -
--     Nothing
-----------------------------------------------------------
PROCEDURE updateResourceMetadata(abspath  IN VARCHAR2,
                                 oldns IN VARCHAR2,
                                 oldname IN VARCHAR,
                                 newmetadata IN XMLTYPE);

-----------------------------------------------------------
-- PROCEDURE - updateResourceMetadata
--     Updates metadata for a resource - can be used for both
--     SB or NSB metadata. New metadata must be SB.
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
--  oldns, oldname
--     namespace and local name pair identifying old metadata
--  newmetadata
--     REF to new metadata
-- RETURNS -
--     Nothing
-----------------------------------------------------------
PROCEDURE updateResourceMetadata(abspath  IN VARCHAR2,
                                 oldns IN VARCHAR2,
                                 oldname IN VARCHAR,
                                 newmetadata IN REF SYS.XMLTYPE);

-----------------------------------------------------------
-- PROCEDURE - purgeResourceMetadata
--     Deletes all user metadata from a resource
--     SB metadata is removed in cascade mode i.e. the rows
--     are deleted from the corresponding metadata tables
--
-- PARAMETERS -
--  abspath
--     Absolute path of the resource
-- RETURNS -
--     Nothing
-----------------------------------------------------------
PROCEDURE purgeResourceMetadata(abspath  IN VARCHAR2);

---------------------------------------------
-- FUNCTION - getResource
--    Given a path in the repository, returns the XDBResource
-- PARAMETERS -
--    abspath - absolute path in the repository
-- RETURNS -
--    The XDBResource.
---------------------------------------------
FUNCTION getResource(abspath IN VARCHAR2) return dbms_xdbresource.XDBResource;

-----------------------------------------------------------
-- PROCEDURE - refreshContentSize
--     Recompute the content size of the specified resource,
--     disregarding the existing content size. Store it in the Size
--     element in the resource schema, and set the SizeAccurate flag
--     appropriately.
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource. If the path is a folder, then
--     use the recurse flag as below.
--  recurse (IN)
--     Used only if abspath specifies a folder. If true, refresh the
--     size of all resources in the resource tree rooted at the
--     specified resource. If false, compute the size of all
--     documents/subfolders in this folder only.
-- RETURNS -
--     Nothing.
-----------------------------------------------------------
PROCEDURE refreshContentSize ( abspath IN VARCHAR2,
			       recurse IN BOOLEAN := FALSE );

-----------------------------------------------------------
-- PROCEDURE - ProcessLinks
--     Process document links in the specified resource,
--     looking at the current resource configuration parameters.
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource. If the path is a folder, then
--     use the recurse flag as below.
--  recurse (IN)
--     Used only if abspath specifies a folder. If true, process
--     links of all resources in the resource tree rooted at the
--     specified resource. If false, process links of all
--     documents in this folder only.
-- RETURNS -
--     Nothing.
-----------------------------------------------------------
PROCEDURE ProcessLinks (abspath IN VARCHAR2,
                        recurse IN BOOLEAN := FALSE );

-----------------------------------------------------------
-- FUNCTION - isFolder
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource.
-- RETURNS -
--     True if the resource is a folder / container.
-----------------------------------------------------------
FUNCTION isFolder (
        abspath IN VARCHAR2
) return BOOLEAN;

-----------------------------------------------------------
-- PROCEDURE - touchResource
--  Change the last mod time of the resource to the current time.
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource.
-----------------------------------------------------------
PROCEDURE touchResource ( abspath IN VARCHAR2 );

-----------------------------------------------------------
-- PROCEDURE - changeOwner
--  Change the owner of the resource to the given user.
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource.
--  owner (IN)
--     Owner
--  recurse (IN)
--     If true, recursively change owner of all resources in the
--     folder tree.
-----------------------------------------------------------
PROCEDURE changeOwner ( abspath IN VARCHAR2,
                        owner   IN VARCHAR2,
                        recurse IN BOOLEAN := FALSE );

-----------------------------------------------------------
-- FUNCTION - hascharcontent
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource.
-- RETURNS -
--     True if the resource has character content.
-----------------------------------------------------------
function HASCHARCONTENT (
	abspath IN VARCHAR2
) return BOOLEAN;

-----------------------------------------------------------
-- FUNCTION - hasxmlcontent
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource.
-- RETURNS -
--     True if the resource has xml content.
-----------------------------------------------------------
function HASXMLCONTENT (
	abspath IN VARCHAR2
) return BOOLEAN;

-----------------------------------------------------------
-- FUNCTION - hasxmlreference
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource.
-- RETURNS -
--     True if the resource has a ref to xml content.
-----------------------------------------------------------
function HASXMLREFERENCE (
	abspath IN VARCHAR2
) return BOOLEAN;

-----------------------------------------------------------
-- FUNCTION - hasblobcontent
--
-- PARAMETERS -
--  abspath (IN)
--     Absolute path of the resource.
-- RETURNS -
--     True if the resource has blob content.
-----------------------------------------------------------
function HASBLOBCONTENT (
	abspath IN VARCHAR2
) return BOOLEAN;

---------------------------------------------
-- FUNCTION - getContentClob
--    Returns the contents of the resource as a clob.
-- PARAMETERS -
--    abspath - Absolute path of the resource
-- RETURNS -
--    The contents as CLOB.
---------------------------------------------
FUNCTION getContentClob(
	abspath IN VARCHAR2
) return CLOB;

---------------------------------------------
-- FUNCTION - getContentBlob
--    Returns the contents of the resource as a blob.
-- PARAMETERS -
--    abspath - Absolute path of the resource.
--    csid - OUT - The character set id of the blob returned.
--    locksrc - if true, lock and return the source lob. If false,
--    return a temp lob copy.
-- RETURNS -
--    The contents as BLOB.
---------------------------------------------
FUNCTION getContentBlob (
	abspath IN VARCHAR2,
	csid OUT PLS_INTEGER,
	locksrc IN BOOLEAN := FALSE
) return BLOB;

---------------------------------------------
-- FUNCTION - getContentXMLType
--    Returns the contents of the resource as an XMLType.
-- PARAMETERS -
--    abspath - Absolute path of the resource.
-- RETURNS -
--    The contents as XMLType.
---------------------------------------------
FUNCTION getContentXMLType (
	abspath IN VARCHAR2
) return SYS.XMLType;

---------------------------------------------
-- FUNCTION - getContentVarchar2
--    Returns the contents of the resource as an Varchar2.
-- PARAMETERS -
--    abspath - Absolute path of the resource.
-- RETURNS -
--    The contents as Varchar2.
---------------------------------------------
FUNCTION getContentVarchar2 (
	abspath IN VARCHAR2
) return VARCHAR2;

---------------------------------------------
-- FUNCTION - getContentXMLRef
--    Returns the contents of the resource as a ref to an xmltype.
-- PARAMETERS -
--    abspath - Absolute path of the resource.
-- RETURNS -
--    The contents as a ref to an xmltype if the resource is ref
--    based, else null.
---------------------------------------------
FUNCTION getContentXMLRef (
	abspath IN VARCHAR2
) return ref SYS.XMLType;


---------------------------------------------

---------------------------------------------
-- FUNCTION - getxdb_tablespace
--     Returns the current tablespace of xdb, on the assumption
--     that that is the tablespace of XDB.XDB$RESOURCE.
-- PARAMETERS - None.
--
-- NOTE: Currently used by DBMS_XDBT, which is AUTHID CURRENT_USER
--       package, so this API will not be moved to DBMS_XDB_ADMIN.
--       This API is useful if we envision having XDB's objects
--       span multiple tablespaces. Otherwise, DBA_USERS can be queried.
---------------------------------------------
FUNCTION getxdb_tablespace RETURN VARCHAR2;

end dbms_xdb_repos;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XDB_ADMIN" AUTHID CURRENT_USER IS
--------
PRAGMA SUPPLEMENTAL_LOG_DATA(default, UNSUPPORTED_WITH_COMMIT);

-- Procedure to create an XML Index on the repository
procedure CreateRepositoryXMLIndex;

-- Procedure to index resource at path 'path' or all resources in
-- the subtree rooted at 'path'.
procedure XMLIndexAddPath(path      IN VARCHAR2,
                          recurse   IN boolean := TRUE);

-- Procedure to remove resource at path 'path' from the Repository
-- XML Index or to remove all resources in the subtree rooted at
-- 'path' from the Repository XML Index.
procedure XMLIndexRemovePath(path        IN VARCHAR2,
                             recurse     IN boolean := TRUE);

-- Procedure to drop an XML Index on the repository
procedure DropRepositoryXMLIndex;

-- Procedure to unmark the indexed flags of the XML Index on the repository
procedure ClearRepositoryXMLIndex;

---------------------------------------------
-- PROCEDURE - CreateNonceKey
--     Insert the randomly generated nonce key into XDB$NONCEKEY table
-- NOTE: Should be called by DBA only, thus in this package
---------------------------------------------
procedure CreateNonceKey;

---------------------------------------------
-- PROCEDURE - movexdb_tablespace
--     Moves xdb in the specified tablespace. The move waits for all
--     concurrent XDB sessions to exit.
-- PARAMETERS - name of the tablespace where xdb is to be moved.
--            - trace: if TRUE, use set serveroutput on to display
--                     progress status information; default FALSE
--
---------------------------------------------
PROCEDURE movexdb_tablespace(new_tablespace IN VARCHAR2,
                             trace IN BOOLEAN := FALSE);

---------------------------------------------
-- PROCEDURE - RebuildHierarchicalIndex
--     Rebuilds the hierarchical Index; Used after
--     imp/exp since we do cannot export data from
--     xdb$h_index table since it contains rowids
-- PARAMETERS -
--
---------------------------------------------
PROCEDURE RebuildHierarchicalIndex;

-------------------------------------------------------------------------------
-- FUNCTION - installDefaultWallet
--    Install a certificate in the default xdb the wallet stored in
--    the default XDB wallet directory.
--    Directory name where the XDB wallet is stored is prefixed either
--    by ORACLE_BASE when it is defined else ORACLE_HOME.
--    Then it is followed by "/admin/<db_name>/xdb_wallet" where <db_name>
--    is the unique database name.
--    This function can be called if the xdb self-sign on and auto-login wallet
--    installed in the default location or if the existing one expired.
--
-- PARAMETERS
--    None
--
-- NOTE
--    - Only sys can intall/replace the default wallet
--    - This function replaces the wallet if one exists in the default
--      xdb wallet location.
--    - Two files are expected to be created in the default location:
--        - cwallet.sso
--        - ewallet.p12
-------------------------------------------------------------------------------
procedure installDefaultWallet;

end dbms_xdb_admin;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_CSX_ADMIN" AUTHID CURRENT_USER IS

 DEFAULT_LEVEL  CONSTANT BINARY_INTEGER := 0;
 TAB_LEVEL      CONSTANT BINARY_INTEGER := 1;
 TBS_LEVEL      CONSTANT BINARY_INTEGER := 2;
 NOREG_LEVEL    CONSTANT BINARY_INTEGER := 3;

 NO_CREATE      CONSTANT BINARY_INTEGER := 0;
 NO_INDEXES     CONSTANT BINARY_INTEGER := 1;
 WITH_INDEXES   CONSTANT BINARY_INTEGER := 2;

 DEFAULT_TOKS   CONSTANT BINARY_INTEGER := 0;
 NO_DEFAULT_TOKS  CONSTANT BINARY_INTEGER := 1;

---------------------------------------------
-- TTS support: multiple token repositories
----------------------------------------------
-- PROCEDURE RegisterTokenTableSet
--     Registers a token table set: adds an entry in XDB$TTSET corresponding
--     to the new token table set, and creates (if required) the token tables
--     (with the corresponding indexes).
-- PARAMETERS
--  tstabno  - tablespace/table number of the tablespace/table using
--           - the set of token table we register
--  guid     - globally unique identifier of the token table set
--           - if NULL, a new identifier is created, provided the user is SYS
--  flags    - TAB_LEVEL for table level,
--           - TBS_LEVEL for tablespace level
--           - NOREG_LEVEL if the TTSET table needs not be updated
--  tocreate - NO_CREATE if no token tables are created
--           - NO_INDEXES if token tables are created, but no indexes
--           - WITH_INDEXES if token tables and corresponding indexes are created
--  defaulttoks - if DEFAULT_TOKS, insert default token mappings
-- NOTE
--     It is an error if flags = DEFAULT_LEVEL since the default token table set
--     already exists if XDB is installed.
----------------------------------------------
 procedure RegisterTokenTableSet(tstabno IN NUMBER DEFAULT NULL,
                                 guid IN RAW DEFAULT NULL,
                                 flags IN NUMBER DEFAULT TBS_LEVEL,
                                 tocreate IN NUMBER DEFAULT WITH_INDEXES,
                                 defaulttoks IN NUMBER DEFAULT DEFAULT_TOKS);

 procedure CopyDefaultTokenTableSet(tsno IN NUMBER,
                                    qnametable OUT VARCHAR2,
                                    nmspctable OUT VARCHAR2,
                                    pttable OUT VARCHAR2);


-------------------------------------------------
-- PROCEDURE  GetTokenTableInfo
--           Given the table name and the owner, returns the guid of the
--           token table set where token mappings for this table can be found.
--           Returns also the names of the token tables, and whether the token
--           table set is the default one.
-- NOTE
--       It should be called only for CSX tables; otherwise, it will not return an
--       error, just the default guid and token table names.
--       Returns error if there is no default token table set.
--  Needs SYS privileges.
-------------------------------------------------
 procedure GetTokenTableInfo(ownername IN VARCHAR2, tablename IN VARCHAR2,
                             guid OUT RAW, qnametable OUT VARCHAR2, nmspctable OUT VARCHAR2,
                             level OUT NUMBER, tabno OUT NUMBER);

 function GetTokenTableInfo(tabno IN NUMBER, guid OUT RAW) return BOOLEAN;


---------------------------------------------------------------
-- PROCEDURE GetTokenTableInfoByTablespace
--     Given a tablespace number, returns the guid and the token
--     table names for this tablespace. If there is no entry
--     in XDB$TTSET for this tablespace, it assumes the default
--     guid is isued, and returns TRUE in isdefault.
--     containTokTabs is set to TRUE if the token tables for guid
--     are actually in this tablespace. (This is needed for procedural actions
--     for TTS.)
-- NOTE
--   Requires SYS privileges.
---------------------------------------------------------------

 procedure GetTokenTableInfoByTablespace(tsname IN VARCHAR2, tablespaceno IN NUMBER,
                                         guid OUT RAW, qnametable OUT VARCHAR2,
                                         nmspctable OUT VARCHAR2,
                                         isdefault OUT BOOLEAN,
                                         containTokTab OUT BOOLEAN);

  FUNCTION instance_info_exp(name       IN  VARCHAR2,
                             schema     IN  VARCHAR2,
                             prepost    IN  PLS_INTEGER,
                             isdba      IN  PLS_INTEGER,
                             version    IN  VARCHAR2,
                             new_block  OUT PLS_INTEGER) RETURN VARCHAR2;

-- returns default path-id token table
  function PathIdTable return varchar2;
-- returns default qname-id token table
  function QnameIdTable return varchar2;
-- returns default namespace-id token table
  function NamespaceIdTable return varchar2;
-- procedure to gather stats on default token tables
  procedure GatherTokenTableStats;
END dbms_csx_admin;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XLSB" AUTHID CURRENT_USER IS

PROCEDURE InsertResourceNXob(oid IN RAW, res IN CLOB,
                             flags IN NUMBER,
                             content IN BLOB);
PRAGMA SUPPLEMENTAL_LOG_DATA(InsertResourceNXob, AUTO);

PROCEDURE InsertResourceNXobClob(oid IN RAW, res IN CLOB,
                             flags IN NUMBER,
                             content IN CLOB);
PRAGMA SUPPLEMENTAL_LOG_DATA(InsertResourceNXobClob, AUTO);

PROCEDURE InsertResource(oid IN RAW, res IN CLOB,
                         flags IN NUMBER,
                         content IN CLOB);
PRAGMA SUPPLEMENTAL_LOG_DATA(InsertResource, AUTO);

PROCEDURE InsertResourceRef(oid IN RAW, res IN CLOB,
                            flags IN NUMBER,
                            content IN RAW);
PRAGMA SUPPLEMENTAL_LOG_DATA(InsertResourceRef, AUTO);

PROCEDURE LinkResource(parent_path IN VARCHAR2, name IN VARCHAR2,
                       child_path IN VARCHAR2, oid IN RAW,
                       linksn IN RAW, acloid IN RAW,
                       owner IN VARCHAR2, owner_format IN NUMBER,
                       flags IN NUMBER, types IN NUMBER);
PRAGMA SUPPLEMENTAL_LOG_DATA(LinkResource, AUTO);

PROCEDURE UnlinkResource(parent_path IN VARCHAR2,
                         name IN VARCHAR2, oid IN RAW,
                         flags IN NUMBER);
PRAGMA SUPPLEMENTAL_LOG_DATA(UnlinkResource, AUTO);

PROCEDURE DeleteResource(oid IN RAW, flags IN NUMBER);
PRAGMA SUPPLEMENTAL_LOG_DATA(DeleteResource, AUTO);

PROCEDURE SetRefcount(oid IN RAW, refcount IN NUMBER, flags IN NUMBER);
PRAGMA SUPPLEMENTAL_LOG_DATA(SetRefcount, AUTO);

PROCEDURE TouchOid(oid IN RAW, owner IN VARCHAR2, owner_format IN NUMBER,
                   mod_date IN RAW);
PRAGMA SUPPLEMENTAL_LOG_DATA(TouchOid, AUTO);

PROCEDURE UpdateResource(res IN CLOB,
                         flags IN NUMBER,
                         content IN CLOB, pref IN RAW);
PRAGMA SUPPLEMENTAL_LOG_DATA(UpdateResource, AUTO);

PROCEDURE UpdateResourceRef(res IN CLOB,
                            flags IN NUMBER,
                            content IN RAW, pref IN RAW);
PRAGMA SUPPLEMENTAL_LOG_DATA(UpdateResourceRef, AUTO);

PROCEDURE UpdateContentXob(content IN CLOB, pref IN RAW, flags IN NUMBER,
                           schema IN NUMBER);
PRAGMA SUPPLEMENTAL_LOG_DATA(UpdateContentXob, AUTO);

PROCEDURE SaveAcl(acloid IN RAW, resoid IN RAW, flags IN NUMBER,
                  schema IN VARCHAR2, name IN VARCHAR2, oid IN RAW);
PRAGMA SUPPLEMENTAL_LOG_DATA(SaveAcl, AUTO);

PROCEDURE UpdateLocks(oid IN RAW, lock_list IN CLOB, next_seq IN NUMBER,
                      flags IN NUMBER);
PRAGMA SUPPLEMENTAL_LOG_DATA(UpdateLocks, AUTO);

PROCEDURE UpdateNameLocks(oid IN RAW, name IN VARCHAR2,
                          token IN RAW, flags IN NUMBER);
PRAGMA SUPPLEMENTAL_LOG_DATA(UpdateNameLocks, AUTO);

PROCEDURE DelNameLocks(oid IN RAW, seq IN NUMBER, flags IN NUMBER);
PRAGMA SUPPLEMENTAL_LOG_DATA(DelNameLocks, AUTO);

PROCEDURE InsertToHTable(content IN CLOB, acloid IN RAW,
                         owner IN VARCHAR2, owner_format IN NUMBER,
                         oid IN RAW, flags IN NUMBER, schema IN NUMBER);
PRAGMA SUPPLEMENTAL_LOG_DATA(InsertToHTable, AUTO);

PROCEDURE InsertToUserHTab(content IN CLOB, acloid IN RAW,
                         owner IN VARCHAR2, owner_format IN NUMBER,
                         oid IN RAW, flags IN NUMBER, schoid IN RAW,
                         schema IN VARCHAR2, elnum IN NUMBER);
PRAGMA SUPPLEMENTAL_LOG_DATA(InsertToUserHTab, AUTO);

PROCEDURE UpdateRootInfo(content IN CLOB);
PRAGMA SUPPLEMENTAL_LOG_DATA(UpdateRootInfo, AUTO);

END dbms_xlsb;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XMLSCHEMA_LSB" authid current_user is

  procedure registerSchema_Str(schemaurl IN varchar2,
                           schemadoc IN varchar2,
                           local IN number,
                           gentypes IN number,
                           genbean IN number,
                           gentables IN number,
                           force IN number,
                           owner IN varchar2,
                           enablehierarchy IN number,
                           options IN number,
                           schemaoid IN RAW,
                           tabmd IN xdb.DBMS_XMLSCHEMA_TABMDARR,
                           resmd IN xdb.DBMS_XMLSCHEMA_RESMDARR);
  pragma supplemental_log_data (registerSchema_Str, AUTO);

  procedure registerSchema_Clob(schemaurl IN varchar2,
                           schemadoc IN CLOB,
                           local IN number,
                           gentypes IN number,
                           genbean IN number,
                           gentables IN number,
                           force IN number,
                           owner IN varchar2,
                           enableHierarchy IN number,
                           options IN number,
                           schemaoid IN RAW,
                           tabmd IN xdb.DBMS_XMLSCHEMA_TABMDARR,
                           resmd IN xdb.DBMS_XMLSCHEMA_RESMDARR);

  procedure registerSchema_Blob(schemaurl IN varchar2,
                           schemadoc IN BLOB,
                           local IN number,
                           gentypes IN number,
                           genbean IN number,
                           gentables IN number,
                           force IN number,
                           owner IN varchar2,
                           csid IN NUMBER,
                           enablehierarchy IN number,
                           options IN number,
                           schemaoid IN RAW,
                           tabmd IN xdb.DBMS_XMLSCHEMA_TABMDARR,
                           resmd IN xdb.DBMS_XMLSCHEMA_RESMDARR);
  pragma supplemental_log_data (registerSchema_Blob, AUTO);

  procedure registerSchema_XML(schemaurl IN varchar2,
                           schemadoc IN sys.xmltype,
                           local IN number,
                           gentypes IN number,
                           genbean IN number,
                           gentables IN number,
                           force IN number,
                           owner IN varchar2,
                           enablehierarchy IN number,
                           options IN number,
                           schemaoid IN RAW,
                           tabmd IN xdb.DBMS_XMLSCHEMA_TABMDARR,
                           resmd IN xdb.DBMS_XMLSCHEMA_RESMDARR);
  pragma supplemental_log_data (registerSchema_XML, AUTO);

  procedure registerSchema_OID(schemaurl IN varchar2,
                           schemadoc IN CLOB,
                           local IN number,
                           gentypes IN number,
                           genbean IN number,
                           gentables IN number,
                           force IN number,
                           owner IN varchar2,
                           enablehierarchy IN number,
                           options IN number,
                           schemaoid IN RAW,
                           elname IN varchar2,
                           elnum IN number,
                           import_options IN number,
                           tabmd IN xdb.DBMS_XMLSCHEMA_TABMDARR,
                           resmd IN xdb.DBMS_XMLSCHEMA_RESMDARR);
  pragma supplemental_log_data (registerSchema_OID, AUTO);

  procedure CopyEvolve(schemaurls         IN XDB$STRING_LIST_T,
                       newSchemas         IN XMLSequenceType,
                       transforms         IN XMLSequenceType,
                       preserveolddocs    IN NUMBER,
                       maptabname         IN VARCHAR2,
                       generatetables     IN NUMBER,
                       force              IN NUMBER,
                       schemaowners       IN XDB$STRING_LIST_T,
                       paralleldegree     IN NUMBER,
                       options            IN NUMBER,
                       tabmd IN xdb.DBMS_XMLSCHEMA_TABMDARR,
                       resmd IN xdb.DBMS_XMLSCHEMA_RESMDARR);
  pragma supplemental_log_data (CopyEvolve, AUTO);

  procedure compileSchema(schemaURL IN varchar2,
                          schemaoid IN RAW,
                          tabmd        IN xdb.DBMS_XMLSCHEMA_TABMDARR);

end dbms_xmlschema_lsb;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."XDB_PITRIG_PKG_01" authid definer AS
  procedure pitrig_del(owner varchar2, name varchar2, deloid raw, tbloid raw);
  procedure pitrig_upd(owner varchar2, name varchar2, deloid raw, tbloid raw,
                       cuser varchar2);
  procedure pitrig_delmetadata(owner varchar2, name varchar2, deloid raw,
                               tbloid raw, resid raw, cuser varchar2);
  procedure pitrig_updmetadata(owner varchar2, name varchar2, deloid raw,
                               tbloid raw, resid raw, cuser varchar2);
end XDB_PITRIG_PKG_01;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."XDB_PITRIG_PKG" authid current_user AS
  procedure pitrig_del(owner varchar2, name varchar2, deloid raw, tbloid raw);
  procedure pitrig_upd(owner varchar2, name varchar2, deloid raw, tbloid raw,
                       cuser varchar2);
  procedure pitrig_drop(owner varchar2, name varchar2);
  procedure pitrig_truncate(owner varchar2, name varchar2);
  procedure pitrig_delmetadata(owner varchar2, name varchar2, deloid raw,
                               tbloid raw, resid raw, cuser varchar2);
  procedure pitrig_updmetadata(owner varchar2, name varchar2, deloid raw,
                               tbloid raw, resid raw, cuser varchar2);
  procedure pitrig_dropmetadata(owner varchar2, name varchar2);
end XDB_PITRIG_PKG;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."XDBPI_FUNCIMPL" as
  function noop_func(res sys.xmltype) return number;
end;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XDBUTIL_INT" wrapped
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
9
eb1 4fd
F7wYzkMWn1Lqq78c+LkeLgLlAmQwgzsr+kpo3y+BKnOUNJOydOESSC2PHemNd0dpFNdjnLb7
ah8dn9FhN88/GIOjuvYU7xVwowzt6pXqmSY+EmtsyJZPnbXntT865B7BsSDuHiQkvYG528cV
NH/KTKVvdO4zuMqi/dFMY8DnrY53mYB18TzMKePSXECfLCLxvymFCeUY8nmJYQzUu+uFujD6
durTVU2KIHDiNr1Ae4W2z6eg4RVsrV5q3Hd6JKjgQ8KKIel28zjdQu+6sQtksfLK58UnkO57
4sQbWuycvuD32RmKTxF9SKuHvQ6+I+zN93jq1GwqxKhf9SedjfzN92gfakaX6OHgX9NW8sER
G8omtXIGyge16jVI9iSX2lzn0cyYmggMd+nUowWKYTZJ7lFLVLufQIcnjI0k2GA5vnhnxYfU
ZYzmDn4CzD0PcrsZsB59Plu2Z2Ni3mtfsVqchCMEiI4VBbdE9n9dUuREnQkb02zA5FiOMS26
UI9Me1sHdukK7blrKWRB8IhnqFCFNTKL1ELFnhQ2t1BHJ/zcjKD1GlgJUoEdFYBHRxb2UqZ6
GxBmwdnYioXuLbDMiMoviIh6SKPP//bAYn7dKTZsddqqwX9McR1vjV5UN/TfqUVb6KvFz6pu
lH04jQZCH4AoxpbckI/shePeikqG7A8zBftPxGYXdHMwopDHUKll8p+2tE7MirQQ18VBp/i/
ITu4ia18lJzji1YQPUPdLG41fsC0Rf0aQpX2u9PBDUQHah7p61O7k25W1QE/ILt/xRDORDpg
QUm22x6m6teyXTVvp70ZS2ICxYkjCEXzhf330r9OOZBdv/fhRC6SmMyty+zgJf9SfpUpgvYG
Y/vQEs4AFww5rTIhP0//2EMIwB/L7QO3+ztWv5dodHe2QJwt3+oX0yvATb9NI8nbuvHIi33z
7OwV9sbUVeYeCIESaR4DOe0sq2wTI2wMrXHNm8nSC8aOxW9m/Gv2AaQ6C2Uh6moVNlp0xUEa
kaGlZ0t5Khd8UhJ+T2EnqWKUZWu0DO9be/3fcwhLLqw1NQjy1YZWz5tXwMqoLrp+0E2ESA0k
Xu5rTFLaWOuTWYFriAqOA6yvRKPB1RxfgIFhwciILWpjzZXL1eLwEh0ljdHSQhkpDZP1HxU8
5Sct4FBY2i2ctgTnWWloHGC00a4M9OAwQaIFqT0hWevibCgJoP2x6BeAwEUrIMy6ExDxWEyD
y8Jl65TEz/EXjbKxek5KbQRZkoskUx+WQA==
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XDB_PRINT" wrapped
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
9
240 158
UgJszPEeHlHDDqGcJZP9CBL7gScwg/BQNQyEf3RbuHK7Xl1NjwHFhDO0qGTXyZMPuiWOiyZ8
nwgO4yOlhgWN7jkQthJWnV1PFA6Dj+xwnRJzR5r4TD+1MEL44VmbkSFN21ncwBjbcOCx+zbf
Q4TrnreNdrRb4EI5Q0yO9eHR8ISvbWxHkg8cdZHTVZBfTusnLc9XDlN/qILpT1TMYAG6/rRF
4BpWUKN117oQVAPijgWs+APMs9wach51Q3wxVwCQk7pfU+3K/LMYJmRfa1pJG+MUKp/S7OJq
lwarX9qnaNK1jcS4dO1pClaotVjr9+sOB3+LOxzAY3M9KNmpWKU=
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XDBNFS" wrapped
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
9
107 103
5QG3870YoD9NaXMixasqrO61ZQkwg0zwf8sVfHTpWBKe0Ong4NeJG9z9jej3zed1ZlyU/VZM
VyJr002lSdmau60n6x5vOEG5DD//64ZhqdwlQpkb8zjIbgS9euoTU45fzn9nuIpF76gSupjL
z6YlwQAv8lEyKz2uZvA5eWY2vDleU3/3ryOUzxENAAPe477POLMVJ16ONkMFd2j4zm/bthcs
NroaHefe1qoFUQee1kQFdG6WYT6eDRL7pM3moA==
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_CSX_INT" wrapped
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
9
b58 398
CHFQ7xlpnu9yhQD29TKizsguq2gwg+0r2eKDfC/Nb7zgpzXmXNlVlDLuxi9xdtqb1hWeJs3o
bZ/HmH3BsZ/TSPETZ6kKo+Oi+liCKHKIsBR+gMBGLJo/AE+8JLUAc+RzW+O/uq83QgtpvrfE
EWe0OnaphkAwKdzT/hb7dSs880OpnulHCBSJanqpJBBAKB6mv0bfUFPR3SQbVw227goyX8mG
lMfm1YWzzSrvd9mp2SV54w9NQUPTiwMxdCUSv1ZSpn8HLQHAD1Krmw0mHRaWQ2YxBPUZFkuA
+Plphdv/s2s+RtM8vZ+oj/CzAuvaw5OS0CIz20tifwoBTdpS/3Tpq16tlly08fDBdsj0+IvY
mnxznD1iNgNb2WFUL4Xl1bFWeydSYjnO2l83wiHsqP45NSdhDDFvogIZ3zEwikzxQm0adwG0
dgdcMeeNEbM11PTv7Y+nfPSqfv6Nn1syDRfrRWRSter+K/TnEwdvPBlVswveshFw5SnpO0fi
1USDU1uBwL78eMPWiHR5znvj+lz7MKJkADv8UY7TQmx3o2QZhTM/YvyeGbFUTCjSFjDN6U/V
OqkdBzxr4OyGH6d/Jt5uKghFRpxx//T1elCpo/6+VzxxoItR9NW+L8UgzD1WVi311I2veqIY
6CLh55A8Oi4s1Q9QIRvUazjK063wMu+hSLC4QQCWGXykINsh0k3+yX67Uz1SZen7yWKU0Yzi
O5r1q2HGzD7iKs4FNhBLFvJ5cTcbILrSZykyAqJBcBBGlmr605KWXNEJkRiOMOsE2Cizulnl
0DtwzCDOlDDFhF6FOj1/ImmLN2vTV5A/o2OrIAhQLRHD63pUKOzGEOK9QSuxiuu0MHMSzA0Z
tj4GyZHMj9b1VTV2WsxSj6BLsKVitixkmnMdwPNKbQ==
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XDBZ0" wrapped
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
9
e95 388
TIrXhnmz4AQtaBsPZ5zT4FTs1+kwgz3qLtATfC/NWA/uC8hRPeXGURw5gi941GF+ty4jLaCD
9q7tw3OBpLbThYsd3/rystPT4RLki+1YB3mplmvmMzOSHr/OTjOS/lg1hh9RcDQtb40o8ITZ
Rguh8QQKrW/w6RuJpR5mv1qMRpqRvQtS3fnF/ZXtUBgIRJtjLeABY5nLbMAgl1j/qlCEuNIN
OZ7UK3A64YqxrW330UxVw0QquRdjjANWktQz2ZH6V1RrFgiA+7ovAxwsNn4LnjAES0zXoxD9
GQqo0GscqDruuL+N5JoGuQAvlF3TauYO8O94XQQcO+FC77nrhcG3yTNw5NSiE8noDWXQlL7O
xLvrPJabg0TC/k+uTEpxXjZDVSEvBTRiK1Jzcfb0DgaDbFoH3mCO5uk0U9QE9CqVRIga4uGU
Vkf/wnsXKk05keyQw4wvuQNdUzXQ8zXolQ5ttB7pMWOeCdyiLXnlDgHzKxGkKpD9J07zBLei
epbUaZXt++d4BL5iqQZnvP2g9j2Y8kUSMus1hMzlmDa/Lo3cy+uIXkkFFtYZGPz5imPGfEpi
7ebpEU1dNDvDEFxbyxNKssEanHSSdKwG8ZkU63uqe+MdyhklXjbT1vUW6MyP7MKOHqFpXF4H
z4az7dUJ5Tvzbh2ZMn2Gu7GEj8qtAsjmOLrpY0YY1wYGIqcrDMYSVM2cgophThJq3pqQ5AwU
sx8jog1No7Lw4xbCDPgHH3mc/6awr+ogdiK8C1eAubOh+tMqo41504pZHJQIneE+GKZx/308
9XTvpW+HM0OL37neTNl9gIDyyyvwawavOzu+zkvQIReY/ll4vK5Oqf7Ni3+g8QmhBMNEUMx8
l325zFtqnmMCPs8g93IxnKqiUrb8
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XMLPARSER" AUTHID CURRENT_USER IS

/**
 * Parser interface type
 */
TYPE Parser IS RECORD (id dbms_xmldom.domtype);

/**
 * Internal error
 */
INTERNAL_ERR CONSTANT NUMBER := -20000;

/**
 * Other errors
 */
PARSE_ERR CONSTANT NUMBER := -20100;
FILE_ERR CONSTANT NUMBER := -20101;
CONN_ERR CONSTANT NUMBER := -20102;
NULL_ERR CONSTANT NUMBER := -20103;

/**
 * Return the release version of the Oracle XML Parser for PL/SQL
 */
FUNCTION getReleaseVersion RETURN VARCHAR2;

/**
 * Parses xml stored in the given url/file and returns the built DOM Document
 */
FUNCTION parse(url VARCHAR2, csid IN NUMBER := 0 )
 RETURN dbms_xmldom.DOMDocument;

/**
 * Returns a new parser instance
 */
FUNCTION newParser RETURN Parser;

PROCEDURE freeParser(p Parser);

/**
 * Parses xml stored in the given url/file
 */
PROCEDURE parse(p Parser, url VARCHAR2, csid IN NUMBER := 0);

/**
 * Parses xml stored in the given buffer
 */
PROCEDURE parseBuffer(p Parser, doc VARCHAR2);

/**
 * Parses xml stored in the given clob
 */
PROCEDURE parseClob(p Parser, doc CLOB);

/**
 * Parses the given dtd
 */
PROCEDURE parseDTD(p Parser, url VARCHAR2, root VARCHAR2, csid IN NUMBER :=0);

/**
 * Parses the given dtd
 */
PROCEDURE parseDTDBuffer(p Parser, dtd VARCHAR2, root VARCHAR2);

/**
 * Parses the given dtd
 */
PROCEDURE parseDTDClob(p Parser, dtd CLOB, root VARCHAR2);

/**
 * Sets base directory used to resolve relative urls
 */
PROCEDURE setBaseDir(p Parser, dir VARCHAR2);

/**
 * Gets base directory used to resolve relative urls
 */
FUNCTION getBaseDir(p Parser) return VARCHAR2;

/**
 * Sets warnings TRUE - on, FALSE - off
 */
PROCEDURE showWarnings(p Parser, yes BOOLEAN);

/**
 * Sets errors to be sent to the specified file
 */
PROCEDURE setErrorLog(p Parser, fileName VARCHAR2);

/**
 * Gets the error log file, if any
 */
FUNCTION getErrorLog(p Parser) RETURN VARCHAR2;

/**
 * Sets whitespace preserving mode TRUE - on, FALSE - off
 */
PROCEDURE setPreserveWhitespace(p Parser, yes BOOLEAN);

/**
 * Sets validation mode TRUE - validating, FALSE - non validation
 */
PROCEDURE setValidationMode(p Parser, yes BOOLEAN);

/**
 * Gets validation mode
 */
FUNCTION getValidationMode(p Parser) RETURN BOOLEAN;

/**
 * Sets DTD for validation purposes - MUST be before an xml document is parsed
 */
PROCEDURE setDoctype(p Parser, dtd dbms_xmldom.DOMDocumentType);

/**
 * Gets DTD parsed - MUST be called only after a dtd is parsed
 */
FUNCTION getDoctype(p Parser) RETURN dbms_xmldom.DOMDocumentType;

/**
 * Gets DOM Document built by the parser - MUST be called only after a
 * document is parsed
 */
FUNCTION getDocument(p Parser) RETURN dbms_xmldom.DOMDocument;

/**
 * Internal function: writes the errors to the errorlog file, if any
 */
PROCEDURE writeErrors(p Parser, err_num NUMBER, err_msg VARCHAR2);

/**********************************************************/
/* retainCDATASection is a no-op procedure added strictly */
/* for compatibility with XDK. In violation to the W3C    */
/* spec, XDK allows a CDATA section to be parsed. If the  */
/* appl does not want this behavior then a value of FALSE */
/* passed to this procedure. Since XDB will never parse   */
/* CDATA sections, calling this procedure has no effect.  */
/**********************************************************/
PROCEDURE retainCDATASection (p Parser, flag boolean);

end dbms_xmlparser;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XSLPROCESSOR" authid current_user as

/**
 * Processor interface type
 */
TYPE Processor IS RECORD (id dbms_xmldom.domtype);
/* SUBTYPE Processor IS RAW(8); */

/**
 * Stylesheet interface type
 */
TYPE Stylesheet IS RECORD (id dbms_xmldom.domtype);
/* SUBTYPE Stylesheet IS RAW(8); */

/**
 * Internal error
 */
INTERNAL_ERR CONSTANT NUMBER := -20000;

/**
 * Other errors
 */
PROCESSOR_ERR CONSTANT NUMBER := -20100;
FILE_ERR CONSTANT NUMBER := -20101;
CONN_ERR CONSTANT NUMBER := -20102;
NULL_ERR CONSTANT NUMBER := -20103;

/**
 * Read from a file to a clob, return clob
 */
function read2clob(flocation VARCHAR2, fname VARCHAR2, csid IN NUMBER := 0)
RETURN clob;

/**
 * Write from a clob to a file with given character encoding.
 * If csid is zero or not given then the file will be in the db charset.
 */
procedure clob2file(cl clob, flocation VARCHAR2, fname VARCHAR2,
                    csid IN NUMBER := 0);

/**
 * Returns a new processor instance
 */
FUNCTION newProcessor RETURN Processor;

/**
 * Free XSL Processor
 */
PROCEDURE freeProcessor(p Processor);

/**
 * Transforms input XML document using given DOMDocument and stylesheet
 */
FUNCTION processXSL(p Processor, ss Stylesheet, xmldoc dbms_xmldom.DOMDocument)
return dbms_xmldom.DOMDocumentFragment;

/**
 * Transforms input XML document using given Doc as CLOB
 */
FUNCTION processXSL(p Processor, ss Stylesheet, cl clob)
return dbms_xmldom.DOMDocumentFragment;

/**
 * Transforms input XML document using given DOMDocument and stylesheet
 * and writes output to a file
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
                   xmldoc dbms_xmldom.DOMDocument, dir varchar2, fileName varchar2);

/**
 * Transforms input XML document using given as URL and stylesheet
 * and writes output to a file
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
                   url varchar2, dir varchar2, fileName varchar2);

/**
 * Transforms input XML document using given DOMDocument and stylesheet
 * and writes output to a buffer
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
                    xmldoc dbms_xmldom.DOMDocument, buffer in out varchar2);

/**
 * Transforms input XML document using given DOMDocument and stylesheet
 * and writes output to a CLOB
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
                    xmldoc dbms_xmldom.DOMDocument, cl in out clob);

/**
 * Transforms input XML document using given DOMDocument and stylesheet
 * and writes output to a CLOB. Provides information if style sheet output
 * method is xml or not.
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
                     xmldoc dbms_xmldom.DOMDocument,
                     cl in out clob, isoutputxml out boolean);

/**
/**
 * Transforms input XML document fragment using given DOMDocumentFragment and
 * stylesheet
 */
FUNCTION processXSL(p Processor, ss Stylesheet,
                   xmldf dbms_xmldom.DOMDocumentFragment)
return dbms_xmldom.DOMDocumentFragment;

/**
 * Transforms input XML document fragment using given DOMDocumentFragment
 * and stylesheet and writes output to a file
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
            xmldf dbms_xmldom.DOMDocumentFragment, dir varchar2, fileName varchar2);

/**
 * Transforms input XML document fragment using given DOMDocumentFragment
 * and stylesheet and writes output to a buffer
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
                    xmldf dbms_xmldom.DOMDocumentFragment, buffer in out varchar2);

/**
 * Transforms input XML document fragment using given DOMDocumentFragment
 * and stylesheet and writes output to a CLOB
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
                    xmldf dbms_xmldom.DOMDocumentFragment, cl in out clob);

/**
 * Sets errors to be sent to the specified file
 */
PROCEDURE setErrorLog(p Processor, fileName VARCHAR2);

/**
 * Sets warnings TRUE - on, FALSE - off
 */
PROCEDURE showWarnings(p Processor, yes BOOLEAN);

/**
 * Create a new stylesheet using the given DOMDocument and base directory URL
 */
FUNCTION newStylesheet(xmldoc dbms_xmldom.DOMDocument, refurl varchar2)
return Stylesheet;

/**
 * Create a new stylesheet using the given input file and base directory URLs
 */
FUNCTION newStylesheet(inp varchar2, refurl varchar2) return Stylesheet;

PROCEDURE freeStylesheet(ss Stylesheet);

/**
 * Sets the value of a top-level stylesheet parameter.
 * The parameter value is expected to be a valid XPath expression (note
 * that string literal values would therefore have to be explicitly quoted).
 */
PROCEDURE setParam(ss Stylesheet, name VARCHAR2, val VARCHAR2);

/**
 * Remove a top-level stylesheet parameter.
 */
PROCEDURE removeParam(ss Stylesheet, name VARCHAR2);

/**
 * Resets the top-level stylesheet parameters.
 */
PROCEDURE resetParams(ss Stylesheet);

/**
 * Transforms a node in the tree using the given stylesheet
 */
FUNCTION transformNode(n dbms_xmldom.DOMNode, ss Stylesheet)
return dbms_xmldom.DOMDocumentFragment;

/**
 * Selects nodes from the tree which match the given pattern
 */
FUNCTION selectNodes(n dbms_xmldom.DOMNode, pattern VARCHAR2,
                     namespace IN VARCHAR2 := NULL)
return dbms_xmldom.DOMNodeList;

/**
 * Selects the first node from the tree that matches the given pattern
 */
FUNCTION selectSingleNode(n dbms_xmldom.DOMNode, pattern varchar2,
                          namespace IN VARCHAR2 := NULL)
return dbms_xmldom.DOMNode;

/**
 * Retrieves the value of the first node from the tree that matches the given
 * pattern
 */
PROCEDURE valueOf(n dbms_xmldom.DOMNode, pattern VARCHAR2, val OUT VARCHAR2,
                  namespace IN VARCHAR2 := NULL);
FUNCTION valueOf(n xmldom.DOMNode, pattern varchar2,
                 namespace IN VARCHAR2 := NULL) return VARCHAR2 ;
end dbms_xslprocessor;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_CLOBUTIL" wrapped
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
9
1c0 171
RB9ye544tgqrN2XYZyiSSO0m7Ukwg43IAPZqfC9A2vjqaBHWva8LLlsQbnbMk9NJTOxZrKAM
qGOEBbUPMUbIJdFM29kpQVsp8OYAGL3uQ9IzzEFyu7BkcrGC5//aCjV/85JxV6g3aZ5ewiWo
hQvr1JkwUMCMQ26XOJ/MaVWK+z8PGx8+VqxnEB2qr3tHTAteHXC0Cn7WB70DdMd8GzhIoXqh
33AAd3f7OMmbL0zFPBduyNS6d9s1Rcq6tjcD1dR7aFaA+sbj6iOTOjd/vjVicbJLHxqfrEAc
GlpNYlVZw+Vzd8QwQQFiwfk4Eo3lbfVzS8kVMmXDCwpo7BLOxBxhVbQOsUs8DVpXungZEB0u
BJ+D
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XMLDOM_ICD" wrapped
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
9
235 144
NhEGdSftRzXC1neO07GaHyVYvHcwg433LSfbfHRA2sE+IYuP6OJYw7pSRzHyyEMeeUDfDGtr
hJwiP3LGs9/q8vobL5oH+Q+27B17rDreQpYs2R7kYYmcwYh8Ho9idVbm2GxJ0913IRDJjD+R
uBrtnBrJpa9hdEE1pVJb5uxDZb/XFH1mQeryJYxrPIqxaOK6/UKg9dvIKcSl4+A5ifgkOw+K
8vyN4NnuJwXWxLB7rqiNxbgUtU9xpNXe2x3MDjBIyYSbLHd5SOnGBCY7HtevZKU7Tgm4Ymx5
+P946vDbb4qEWUOO1qQLCNSfv0+wwYkG
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XMLSCHEMA_INT" wrapped
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
9
2791 686
U7tZsAfGkxc0PaRAEW0PQkXVMVwwg82jDCCG3y+5k52s5yNL+4xnH+1DoswLE0zsw6E+9K7m
D2eZIe1+KHM6pBiJ6bPTYhLN128t98pvKoTLwfiLqMVsASwpOYUgnTQ/J/kQcx7rZKrk+ZLH
TsGatS+j6rqHLyv2ssInJx3suLcBRomjfxYnsqJqQBOeoDi6tLMC+F72NVMUrsMDYj0sK01/
OlKrAuADKkbgoJAk6vKmjaHusqO8lq9Gm11G5krmwYXqIR9qlAme9mOIR5QrciV7EOgXZ6MM
YXagjRm67Ql1QNme3w7rmY2U6iWixQwKFbLzw0gn2dNgFFX7Qme0/QdxC8VzcJU2clIxAEIx
vapbgIWCZGFGPm65Y8IJbD1XN2xHFdDiWq6rlchZ7NnXxY/pfHXwf2v/nQ+BV7/qYuMzZhMV
Co31EaAPkGTWPXvBH26z8t7gmyxKWeNMh7pY/1gwLc+gnnh0iBvDQcl9AIe85TAtqVV6cLiy
mdrCn4Ezf8c/hWh8h5sSNBSGbN50grQoDqDYvzr0pkK3tJea32Gj/g5Gv3KY0CoDeJqo4Z+G
/sj4LI0W24rozKCrUBQ1mv4cZ/6LudUYbohLPuocKhDcExuDyBPttjdEQ3YLzuLDRSfRrqZT
0BJt7OOSPWl6EwYVBLasmKH94a37wNbRLIJ3fz60kO8MEFar9wZBmLm+HvDA6kfa0npIoOGZ
sVcepxSNoGm1paapXnpXEotD4jEx1d/sJkz692L0VFhhg9USCp1fr0Tnw/LUYZwIrWZgecB4
h9W0R40e1FDYhIujsfEN76Q3bsKTzpNK4/J+Oa1tvIUPtDjgV0H85IpaTYnl5oJbPr2lzC1w
8kb0uIjcjGvlge6Tl92uKlo5n0k7dwTKkCR6FNTzfhud6Mz0DNfd2fTyPJgAacsOWiZA+SzD
vi+ndzb0YNs3nAkiyjyf0wDDzWNbGwDWHxXnGmJcs+O5+IlWGLTp8XadZpVJiOI3PYNH4rix
cP6t2D9yGrkO3kJ1Zik2lVG/qz7xkhPGQ2RoarfTrlCx0+v+7PE0jjrESAvj4ybsJ/F600EQ
Qat9KMdVGp9jJiG0GM3RJdEqBFCuDqI3eQoIg7B9vIxsYRhi3K/sSYw770sgghfRi4NHONWq
o9n+9WEeIZyp4B1g5y9EfiFnsCSwjIqrUGvtxxxnYrCrDOXVxNPoDCbWLdIS7amJW0NwVjt2
uJsOdl9jjQvyYcykfEiSMhHKjmLzf5Y/ov/TaPRxwYCufjhaQV4XyXGnrGXj6/qI9wJPrGSx
hffIx+4Ix+bHYn3UdDH8y6VJ9PyyvETqwfU+LZhzPOpbLKIGSNZzEvR+frUdkE3+cKvIeiVd
Vzqs9LkpP63M7YALBd6q6BN149xKJWPVEw/kp9DbSDrCT0GXoEs12W1EYOwFBXT5MzUFJHv/
eMGp0zEJx5CVA9Zkz1gtHl9rGNXfzfFvsZNLSmuDE/1hCYAp0dodR1YTu3i6jpSWIriaI2IG
TsjdLJBt6HYGwd6KPR2tmj4U3L0PXY5/MZTLy47R0HSg1hCgteYrpjOFRDO+1Hujauy0mq8K
5o21V8AnIe6bnwY5F3NZqizay82j8EpBpb54qoovYZiUF7rBltLZhni1++hqT4g=
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."XDB_FUNCIMPL" wrapped
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
9
29c 11f
uWG4peqUXpc5hxCiVwZLyLK8Sgowg9fxr54VfHRAAPiOrcWONWTaPd/irzsK3mZOd/6qmZgt
beMdr9YCXS/55PqA7NiYg2840sHAs31NrqRUjWccbmULiVGIiBYg+xsCUC81jIDR+vJ1mJ9f
iJvvLNS8t4DmHRy3NuODT/eyWRVWdL/Z0VQiiE3JLCwxMfalSk3/iJBfOcDXZ/M5jd4xhPBn
ApIyCs8pgwFtED1/GMBxntefAn3OStKk25Y+vN3dE4NIzXyqDDezneQVyU42QcdYuA==
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."XDB_ANCOP" wrapped
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
9
87e 160
Fjxc+LYCpqtxloJcyFg6+wpjIPEwgz2NLUoVfHRAWEKe0MpcdMRlvqEOPGPeQ1NQ3D1Vf8df
eiJ59y+E+/uE5hqiwnZz+XZzwPLDmlPfuGhzYST4nbUdDgc+3eXA8k24aVGReSwNXZHonpm8
CG17xCWJG/t58vrdXEInV4jREji0ygp0OtUpY2Bv7g4JEeldoCaNd73OuTbAacPhDdwfVf9N
YzTZ2IqSCYS2HYafGT4D9xhVY4PAidp6Tv1N7u5Axp55qVL3W2FXF0ghto3VQRSy10A81HyU
h2Xpln/d74LfeAUYlxyWgoCEWJLQKkd9aTRIFvm1QyJ5yiKG0sDA4Roa8/8=
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."XDB_RVTRIG_PKG" wrapped
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
9
11d d2
e7L5J9C9fKiefHIEHX1UEiLsvrcwg5DIf8sVfC82Jk4YYtaOzFDoZTP6YdOK65CkbI21tZkJ
UKkmEeraAyXCLW0IRlUA7H7pUSA0MHWj5vVLXEYJ3lyhL5RqpkuRDOKe7lXQoYCoAhwjBU/2
rXUbSz77E/P9X2hkTq5Qs5IsVDHwvjIR/O9dM6huuJK435iI8rkeRjqb4etbDJA=
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."XDB_DLTRIG_PKG" wrapped
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
9
71 a2
Rylw7VB4KnZlAhU1cPrLmBvGrpQwg0xH2p6pfC/pzPbqCPJEUh0m4MnnNdd0OnAJvrVMETgB
ECjqOwU7FyGDSHvynvk8VWqL81AUSiYb1OrlJV3yYOPIoy+V9J9dQbGfHGPVljD0NubCsX5g
StL9E+77PXkcPw==
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XDB_VERSION" authid current_user as

  SUBTYPE resid_type is RAW(16);
  TYPE resid_list_type is VARRAY(1000) of RAW(16);

  PROCEDURE makeversioned_int(pathname IN VARCHAR2, resid OUT resid_type);
  PRAGMA SUPPLEMENTAL_LOG_DATA(makeversioned_int, AUTO);

  FUNCTION makeversioned(pathname VARCHAR2) RETURN resid_type;

  PROCEDURE checkout(pathname VARCHAR2);
  PRAGMA SUPPLEMENTAL_LOG_DATA(checkout, AUTO);

  PROCEDURE checkin_int(pathname IN VARCHAR2, resid OUT resid_type);
  PRAGMA SUPPLEMENTAL_LOG_DATA(checkin_int, AUTO);

  FUNCTION checkin(pathname VARCHAR2) RETURN resid_type;

  PROCEDURE uncheckout_int(pathname IN VARCHAR2, resid OUT resid_type);
  PRAGMA SUPPLEMENTAL_LOG_DATA(uncheckout_int, AUTO);

  FUNCTION uncheckout(pathname VARCHAR2) RETURN resid_type;

  FUNCTION ischeckedout(pathname VARCHAR2) RETURN BOOLEAN;
  FUNCTION GetPredecessors(pathname VARCHAR2) RETURN resid_list_type;
  FUNCTION GetPredsByResId(resid resid_type) RETURN resid_list_type;
  FUNCTION GetSuccessors(pathname VARCHAR2) RETURN resid_list_type;
  FUNCTION GetSuccsByResId(resid resid_type) RETURN resid_list_type;
  FUNCTION GetResourceByResId(resid resid_type) RETURN XMLType;
  FUNCTION GetContentsBlobByResId(resid resid_type) RETURN BLOB;
  FUNCTION GetContentsClobByResId(resid resid_type) RETURN CLOB;
  FUNCTION GetContentsXmlByResId(resid resid_type) RETURN XMLType;

end DBMS_XDB_VERSION;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."XDB_PVTRIG_PKG" authid current_user AS

  procedure pvtrig_ins(res sys.xmltype, link sys.xmltype, path varchar2)
   is language C name "INSERT_XDBPV"
   library xdb.PATH_VIEW_LIB
   with context
   parameters (
    context,
    res, res INDICATOR,
    link, link INDICATOR,
    path, path INDICATOR, path LENGTH);

  procedure pvtrig_del(res sys.xmltype, link sys.xmltype, path varchar2)
   is language C name "DELETE_XDBPV"
   library xdb.PATH_VIEW_LIB
   with context
   parameters (
    context,
    res, res INDICATOR,
    link, link INDICATOR,
    path, path INDICATOR, path LENGTH );

  procedure pvtrig_upd(o_res sys.xmltype, n_res sys.xmltype,
                       o_link sys.xmltype, n_link sys.xmltype,
                       o_path varchar2, n_path varchar2)
   is language C name "UPDATE_XDBPV"
   library xdb.PATH_VIEW_LIB
   with context
   parameters (
    context,
    o_res, o_res INDICATOR, n_res, n_res INDICATOR,
    o_link, o_link INDICATOR, n_link, n_link INDICATOR,
    o_path, o_path INDICATOR, o_path LENGTH,
    n_path, n_path INDICATOR, n_path LENGTH);

end XDB_PVTRIG_PKG;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XMLINDEX" AUTHID CURRENT_USER AS

----------------------------------------------------------------------------
-- PROCEDURE - CreateNumberIndex
--     Creates an index for number values in the XMLIndex. The index
--     is created on the VALUE column of the XMLIndex path table on the
--     expression TO_BINARY_DOUBLE(VALUE).
-- PARAMETERS -
--  xml_index_schema
--     Schema of the XMLIndex: default is current user schema
--  xml_index_name
--     Name of the XMLIndex
--  num_index_name: default is system-generated
--     Name of the number index to create
--  num_index_clause
--     Storage clause for the number index. This would simply be appended
--     to the CREATE INDEX statement.
--  xmltypename
--     Xml type name corresponding to the number - one of the following:
--     float
--     double
--     decimal
--     integer
--     nonPositiveInteger
--     negativeInteger
--     long
--     int
--     short
--     byte
--     nonNegativeInteger
--     unsignedLong
--     unsignedInt
--     unsignedShort
--     unsignedByte
--     positiveInteger
--  column_name
--     Name of the path table column on which to create the number index.
----------------------------------------------------------------------------
PROCEDURE CreateNumberIndex(xml_index_schema IN VARCHAR2 := USER,
                            xml_index_name   IN VARCHAR2,
                            num_index_name   IN VARCHAR2 := NULL,
                            num_index_clause IN VARCHAR2 := NULL,
                            xmltypename      IN VARCHAR2 := NULL,
                            column_name      IN VARCHAR2 := NULL);
PRAGMA SUPPLEMENTAL_LOG_DATA(CreateNumberIndex, AUTO_WITH_COMMIT);

----------------------------------------------------------------------------
-- PROCEDURE - CreateDateIndex
--     Creates an index for date values in the XMLIndex. The user specifies
--     the XML type name (date, dateTime etc.) and the index is created
--     on SYS_XMLCONV(VALUE) which would always return a TIMESTAMP datatype.
-- PARAMETERS -
--  xml_index_schema
--     Schema of the XMLIndex: default is current user schema
--  xml_index_name
--     Name of the XMLIndex
--  date_index_name: default is system generated
--     Name of the date index to be created
--  xmltypename
--     XML type name - one of the following
--         dateTime
--         time
--         date
--         gDay
--         gMonth
--         gYear
--         gYearMonth
--         gMonthDay
--  date_index_clause
--     Storage clause for the date index. This would simply be appended
--     to the CREATE INDEX statement.
--  column_name
--     Name of the path table column on which to create the date index.
----------------------------------------------------------------------------
PROCEDURE CreateDateIndex(xml_index_schema  IN VARCHAR2 := USER,
                          xml_index_name    IN VARCHAR2,
                          date_index_name   IN VARCHAR2 := NULL,
                          xmltypename       IN VARCHAR2 := NULL,
                          date_index_clause IN VARCHAR2 := NULL,
                          column_name       IN VARCHAR2 := NULL);
PRAGMA SUPPLEMENTAL_LOG_DATA(CreateDateIndex, AUTO_WITH_COMMIT);

----------------------------------------------------------------------------
--    PROCEDURE SyncIndex(xml_index_schema IN VARCHAR2,
--                        xml_index_name   IN VARCHAR2,
--                        partition_name   IN VARCHAR2,
--			  reindex          IN BOOLEAN);

--    This procedure synchronizes an asynchronously maintained xmlindex.
--    It applies to the xmlindex changes that are logged in the pending
--    table, and brings the path table up-to-date with the base xmltype
--    column.
--
--    PARAMETERS
--    (a) xml_index_schema - Name of the owner of the XMLIndex.
--    (b) xml_index_name   - Name of the XMLIndex.
--    (c) partition_name   - Optional name of the partition to be synced.
--    (d) reindex          - If true drops and recreates secondary indexes
--				on path table. Default is false.
----------------------------------------------------------------------------
PROCEDURE SyncIndex(xml_index_schema IN VARCHAR2 default USER,
                    xml_index_name   IN VARCHAR2,
                    partition_name   IN VARCHAR2 default NULL,
		    reindex          IN BOOLEAN  default FALSE);
PRAGMA SUPPLEMENTAL_LOG_DATA(SyncIndex, AUTO_WITH_COMMIT);

PROCEDURE registerparameter(paramname       IN VARCHAR2,
                            paramstr        IN CLOB);
PRAGMA SUPPLEMENTAL_LOG_DATA(registerparameter, UNSUPPORTED_WITH_COMMIT);

PROCEDURE modifyparameter(paramname       IN VARCHAR2,
                          paramstr        IN CLOB);
PRAGMA SUPPLEMENTAL_LOG_DATA(modifyparameter, UNSUPPORTED_WITH_COMMIT);

PROCEDURE dropparameter(paramname       IN VARCHAR2);
PRAGMA SUPPLEMENTAL_LOG_DATA(dropparameter, UNSUPPORTED_WITH_COMMIT);

FUNCTION getparameter(paramname IN VARCHAR2) RETURN VARCHAR2;

----------------------------------------------------------------------------
--    PROCEDURE PROCESS_PENDING(xml_index_schema  IN  VARCHAR2,
--                              xml_index_name    IN  VARCHAR2,
--                              pending_row_count OUT BINARY_INTEGER,
--                              error_row_count   OUT BINARY_INTEGER);

--    This procedure executes DMLs required to complete a NONBLOCKING
--    alter index add_group/add_column operation.
--
--    PARAMETERS
--    (a) xml_index_schema  - Name of the owner of the XMLIndex.
--    (b) xml_index_name    - Name of the XMLIndex.
--    (c) pending_row_count - RETURNs number of rows that still have
--                            to be processed/indexed.
--    (d) error_row_count   - RETURNs number of rows for which indexing may
--                            have failed because of an error
----------------------------------------------------------------------------
PROCEDURE process_pending(xml_index_schema  IN   VARCHAR2,
                          xml_index_name    IN   VARCHAR2,
                          pending_row_count OUT  BINARY_INTEGER,
                          error_row_count   OUT  BINARY_INTEGER);
PRAGMA SUPPLEMENTAL_LOG_DATA(process_pending, AUTO_WITH_COMMIT);

end dbms_xmlindex;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XMLINDEX0" wrapped
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
9
3ad 164
SIbv3UxGB48nLG2hjdSTiRxDl38wg2PxrydqfHRAv/9efbSvywGxbsO6eUd+bIWbhdxAs6Q5
eZaY0gjBQDWIkwzxvXSnUHJJtSsHi0S/Nvj+huoiLChPsHPGQrJ1oFJvWdOoPG5mvXDYe96y
MRQ2YOeNVwKy9AsMc+UoIijEdi6E+69/NFF1OUM6JqzaUlxlOcUC+pcVtcQlMFZyEyo7vDLS
HW5qITuuN05Pl8YjkeJiwUANXljvF7Celorp/0pok2du/u/v6iCDxV26oK0z0RIVzQbw7cRk
RFfb3y3MsWWKWtqJJbAUnDM9yOmND+VlExu+b/wYtKxVRnWZeak7Hgcg4EX/mg==
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."XIMETADATA_PKG" AS
  FUNCTION getIndexMetadata (idxinfo  IN  sys.ODCIIndexInfo,
                           expver   IN  VARCHAR2,
                           newblock OUT number,
                           idxenv   IN  sys.ODCIEnv) return VARCHAR2;
  FUNCTION getIndexMetadataCallback (idxinfo  IN  sys.ODCIIndexInfo,
                                expver   IN  VARCHAR2,
                                newblock OUT number,
                                idxenv   IN  sys.ODCIEnv) return CLOB;
  FUNCTION utlgettablenames(idxinfo  IN  sys.ODCIIndexInfo) return BOOLEAN;
END ximetadata_pkg;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."XMLINDEX_FUNCIMPL" authid current_user is
  function xmlindex_noop(res sys.xmltype,
                         pathstr varchar2,
                         ia sys.odciindexctx,
                         sctx IN OUT XDB.XMLIndexMethods,
                         sflg number)
  return number;
end XMLIndex_FUNCIMPL;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_RESCONFIG" AUTHID CURRENT_USER IS

------------
-- CONSTANTS
--
------------
DELETE_RESOURCE        CONSTANT NUMBER := 1;
DELETE_RECURSIVE       CONSTANT NUMBER := 2;
APPEND_RESOURCE        CONSTANT NUMBER := 1;
APPEND_RECURSIVE       CONSTANT NUMBER := 2;

---------------------------------------------
-- FUNCTION - getResConfig
--     Returns the resource configuration at the specified position of the
--     target resource's configuration list.
-- PARAMETERS -
--  respath
--     Absolute path in the Hierarchy of the resource
--  pos
--     position of element to return. Position must be >= 0 and < the length of
--     the resource's configuration list.
-- RETURNS -
--     Returns contents of resource configuration.
---------------------------------------------
FUNCTION getResConfig(respath IN VARCHAR2, pos IN PLS_INTEGER)
  RETURN sys.XMLType;

---------------------------------------------
-- PROCEDURE - addResConfig
--      Inserts the resource configuration specified by rcpath at the given position in the target resource's configuration list.
--
-- PARAMETERS:
--     respath	- absolute path of the target resource.
--     rcpath	- absolute path of the resource configuration to be inserted. An exception is raised if rcpath already exists in the target's configuration list.
--     pos 	- index at which the new configuration is to be inserted. If this parameter is not specified then the new configuration is appended to the end of the list. An exception is raised if the index is out of range (i.e., pos < 0 or pos > the size of the target resource's configuration list).

---------------------------------------------

PROCEDURE addResConfig(respath IN VARCHAR2, rcpath IN VARCHAR2,
                       pos IN PLS_INTEGER := NULL);
PRAGMA SUPPLEMENTAL_LOG_DATA(addResConfig, AUTO);

---------------------------------------------
-- FUNCTION getResConfigPaths
--    Returns a list of resource configuration paths defined in the target resource's configuration list.
--

-- PARAMETERS:
--    respath	- absolute path of the target resource.
---------------------------------------------
Function getResConfigPaths(respath IN VARCHAR2) return XDB$STRING_LIST_T;

---------------------------------------------
-- PROCEDURE appendResConfig
-- Appends the resource configuration specified by rcpath to the target resource's configuration list if it is not already included in the list.

-- PARAMETERS
--   respath	- absolute path of the target resource.
--   rcpath	- absolute path of the resource configuration to be appended at the end of the target's configuration list. If rcpath already exists in the list then nothing is appended.
--   appendOption - either APPEND_RESOURCE or APPEND_RECURSIVE. If APPEND_RESOURCE is specified then only the target resource is affected. If APPEND_RECURSIVE is specified then the target resource and all its descendents will be affected.
---------------------------------------------
Procedure appendResConfig(respath IN VARCHAR2, rcpath IN VARCHAR2, appendOption IN PLS_INTEGER);
PRAGMA SUPPLEMENTAL_LOG_DATA(appendResConfig, AUTO);

---------------------------------------------
-- PROCEDURE deleteResConfig
-- Removes the configuration at the given position in the target resource's configuration list.
-- PARAMETERS
--   respath	- absolute path of the target resource.
--   pos 	- the index of the configuration to be removed. An exception is raised if the index is out of range (i.e., pos < 0 or pos >= the size of the target resource's configuration list.
---------------------------------------------
Procedure deleteResConfig(respath IN VARCHAR2, pos IN PLS_INTEGER);
PRAGMA SUPPLEMENTAL_LOG_DATA(deleteResConfig, AUTO);

---------------------------------------------
-- PROCEDURE deleteResConfig
-- Removes the configuration specified by rcpath from the target resource's configuration list. Shifts any subsequent elements to the left. Users must have write-config privilege on all affected resources to execute this.

-- PARAMETERS
--   respath	- absolute path of the target resource.
--   rcpath	- absolute path of the resource configuration to be deleted if found in list.
--   deleteOption - either DELETE_RESOURCE or DELETE_RECURSIVE. If DELETE_RESOURCE is specified then only the configuration list of the target resource is affected. If DELETE_RECURSIVE is specified then the configuration list of the target resource and all its descendents will be affected.

---------------------------------------------
Procedure deleteResConfig(respath IN VARCHAR2, rcpath IN VARCHAR2,
deleteOption IN PLS_INTEGER);
PRAGMA SUPPLEMENTAL_LOG_DATA(deleteResConfig, AUTO);

---------------------------------------------
-- FUNCTION getListeners
-- Returns the list of listeners applicable for a given resource. The value returned by this function is an XML document containing the <event-listeners> element of the XDBResconfig.xsd schema. It contains all the listeners applicable to the target resource, including repository-level listeners. From the returned XML document users can use the EXTRACT operator to retrieve the listeners defined for a specific event. Users must have the required access privilege on all resource configurations referenced by the repository and the target resource; otherwise, an error is returned.

-- PARAMETERS
-- path - absolute path of the target resource.
---------------------------------------------
function getListeners(path IN VARCHAR2) return SYS.XMLType;

---------------------------------------------
-- FUNCTION getRepositoryResConfig

-- Description:
-- Returns the resource configuration at the specified position of the repository's configuration list.  Users must have the required read privilege on the requested resource configuration; otherwise, an error is returned.
-- Parameters:
--     pos 	- index of element to return. An exception is raised if the index is out of range (i.e., pos < 0 or pos >= the size of the repository's configuration list).
---------------------------------------------
Function getRepositoryResConfig(pos IN PLS_INTEGER) return SYS.XMLType;

---------------------------------------------
-- FUNCTION getRepositoryResConfigPaths

--	Description:
--         Returns a list of resource configuration paths defined for the repository. Users must be able to access all the referenced resource configurations; otherwise, an error is returned.
---------------------------------------------
Function getRepositoryResConfigPaths return XDB$STRING_LIST_T;

---------------------------------------------
-- PROCEDURE addRepositoryResConfig

-- Description:
-- Inserts the resource configuration specified by rcpath at the given position of the repository's configuration list.  Shifts the element currently at that position (if any) and any subsequent elements to the right. An error is raised if the document referenced by rcpath is not based on XDBResConfig.xsd schema. Users must have XDBADMIN role and read privilege on the resource configuration to be inserted; otherwise, an error is returned.
-- Parameters:
--     rcpath	- absolute path of the resource configuration to be inserted. An exception is raised if rcpath already exists in the repository's configuration list.
--     pos 	- index at which the new configuration is to be inserted. If this parameter is not specified then the new configuration is appended to the end of the list. An exception is raised if the index is out of range (i.e., pos < 0 or pos > the size of the repository's configuration list).
---------------------------------------------
Procedure addRepositoryResConfig(rcpath IN VARCHAR2, pos IN PLS_INTEGER := NULL);
PRAGMA SUPPLEMENTAL_LOG_DATA(addRepositoryResConfig, AUTO_WITH_COMMIT);

---------------------------------------------
-- PROCEDURE deleteRepositoryResConfig

-- 	Description:
--        Removes the configuration at the given position in the repository's configuration list. Shifts any subsequent elements to the left.  Users must have XDBADMIN role to execute this.
--       This statement is treated as if it is a DDL statement. This means the system will implicitly commit before and after this statement.
-- Parameters:
--      pos 	- the index of the configuration to be removed. An exception is raised if the index is out of range (i.e., pos < 0 or pos >= the size of the repository's configuration list).
---------------------------------------------
Procedure deleteRepositoryResConfig(pos IN PLS_INTEGER);
PRAGMA SUPPLEMENTAL_LOG_DATA(deleteRepositoryResConfig, AUTO_WITH_COMMIT);

end dbms_resconfig;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XEVENT" AUTHID CURRENT_USER IS

------------
-- CONSTANTS
------------

--
-- Event ID
--
RENDER_EVENT                        CONSTANT PLS_INTEGER := 1;
PRE_CREATE_EVENT                    CONSTANT PLS_INTEGER := 2;
POST_CREATE_EVENT                   CONSTANT PLS_INTEGER := 3;
PRE_DELETE_EVENT                    CONSTANT PLS_INTEGER := 4;
POST_DELETE_EVENT                   CONSTANT PLS_INTEGER := 5;
PRE_UPDATE_EVENT                    CONSTANT PLS_INTEGER := 6;
POST_UPDATE_EVENT                   CONSTANT PLS_INTEGER := 7;
PRE_LOCK_EVENT                      CONSTANT PLS_INTEGER := 8;
POST_LOCK_EVENT                     CONSTANT PLS_INTEGER := 9;
PRE_UNLOCK_EVENT                    CONSTANT PLS_INTEGER := 10;
POST_UNLOCK_EVENT                   CONSTANT PLS_INTEGER := 11;
PRE_LINKIN_EVENT                    CONSTANT PLS_INTEGER := 12;
POST_LINKIN_EVENT                   CONSTANT PLS_INTEGER := 13;
PRE_LINKTO_EVENT                    CONSTANT PLS_INTEGER := 14;
POST_LINKTO_EVENT                   CONSTANT PLS_INTEGER := 15;
PRE_UNLINKIN_EVENT                  CONSTANT PLS_INTEGER := 16;
POST_UNLINKIN_EVENT                 CONSTANT PLS_INTEGER := 17;
PRE_UNLINKFROM_EVENT                CONSTANT PLS_INTEGER := 18;
POST_UNLINKFROM_EVENT               CONSTANT PLS_INTEGER := 19;
PRE_CHECKIN_EVENT                   CONSTANT PLS_INTEGER := 20;
POST_CHECKIN_EVENT                  CONSTANT PLS_INTEGER := 21;
PRE_CHECKOUT_EVENT                  CONSTANT PLS_INTEGER := 22;
POST_CHECKOUT_EVENT                 CONSTANT PLS_INTEGER := 23;
PRE_UNCHECKOUT_EVENT                CONSTANT PLS_INTEGER := 24;
POST_UNCHECKOUT_EVENT               CONSTANT PLS_INTEGER := 25;
PRE_VERSIONCONTROL_EVENT            CONSTANT PLS_INTEGER := 26;
POST_VERSIONCONTROL_EVENT           CONSTANT PLS_INTEGER := 27;
PRE_OPEN_EVENT                      CONSTANT PLS_INTEGER := 28;
POST_OPEN_EVENT                     CONSTANT PLS_INTEGER := 29;
PRE_INCONSISTENTUPDATE_EVENT        CONSTANT PLS_INTEGER := 30;
POST_INCONSISTENTUPDATE_EVENT       CONSTANT PLS_INTEGER := 31;

SUBTYPE XDBEventID IS PLS_INTEGER RANGE 1 .. 31;

--
-- NFS related constants
--
OPEN_ACCESS_READ           CONSTANT PLS_INTEGER := 1;
OPEN_ACCESS_WRITE          CONSTANT PLS_INTEGER := 2;
OPEN_ACCESS_READ_WRITE     CONSTANT PLS_INTEGER := 3;

OPEN_DENY_NONE             CONSTANT PLS_INTEGER := 0;
OPEN_DENY_READ             CONSTANT PLS_INTEGER := 1;
OPEN_DENY_READ_WRITE       CONSTANT PLS_INTEGER := 2;

--
-- Event interface types
--
SUBTYPE EventType IS RAW(32);
SUBTYPE XDBRepositoryEvent is RAW(32);

TYPE XDBEvent is RECORD (id RAW(32));
TYPE XDBHandlerList is RECORD (id RAW(32));
TYPE XDBHandler is RECORD (id RAW(32));
TYPE XDBPath is RECORD (id RAW(32));
TYPE XDBLink is RECORD (id RAW(32));
TYPE XDBLock is RECORD (id RAW(32));

---------------------------------------------
--        XDBEvent Methods
---------------------------------------------

---------------------------------------------
-- FUNCTION - getCurrentUser
-- PARAMETERS -
--  ev  - XDB Event object
-- RETURNS -
--  Name of the user executing the operation that triggers the event.
---------------------------------------------
FUNCTION getCurrentUser(ev IN XDBEvent) RETURN VARCHAR2;

---------------------------------------------
-- FUNCTION - getEvent
-- PARAMETERS -
--  ev  - XDB Event object
-- RETURNS -
--   The ID identifying the triggering event.
---------------------------------------------
FUNCTION getEvent(ev IN XDBEvent) RETURN XDBEventID;

---------------------------------------------
-- FUNCTION - isNull
-- PARAMETERS -
--  ev  - XDB Event object
-- RETURNS - TRUE if input argument is null.
---------------------------------------------
FUNCTION isNull(ev IN XDBEvent) RETURN BOOLEAN;

---------------------------------------------
--        XDBRepositoryEvent Methods
---------------------------------------------

---------------------------------------------
-- FUNCTION - getXDBEvent
--   Converts an XDBRepositoryEvent object to an  XDBEvent type.
-- PARAMETERS -
--  ev  - XDB Repository Event object
-- RETURNS -
--  The XDBEvent object
---------------------------------------------
FUNCTION getXDBEvent(ev IN XDBRepositoryEvent) RETURN XDBEvent;

---------------------------------------------
-- FUNCTION - getInterface
-- PARAMETERS -
--  ev  - XDB Repository Event object
-- RETURNS -
--  The top-level interface used to initiate the operation that
--  triggered the event. This could be "HTTP", "FTP" or "SQL".
---------------------------------------------
FUNCTION getInterface(ev IN XDBRepositoryEvent) RETURN VARCHAR2;

---------------------------------------------
-- FUNCTION - getApplicationData
-- PARAMETERS -
--  ev  - XDB Repository Event object
-- RETURNS -
--  The <applicationData> element extracted from the resource
--  configuration that defines the invoking handler.
---------------------------------------------
FUNCTION getApplicationData(ev IN XDBRepositoryEvent) RETURN SYS.XMLType;

---------------------------------------------
-- FUNCTION - getPath
-- PARAMETERS -
--  ev  - XDB Repository Event object
-- RETURNS -
--  The XDBPath object representing the path of the resource for which
--  the event was fired. From this object, functions are provided to get
--  the different path segments.
---------------------------------------------
FUNCTION getPath(ev IN XDBRepositoryEvent) RETURN XDBPath;

---------------------------------------------
-- FUNCTION - getResource
-- PARAMETERS -
--  ev  - XDB Repository Event object
-- RETURNS -
--  The target resource for the operation that fire the current event.
--  For a link* or unlink* event, this method returns the resource that
--  the link is pointing to.
--  For a create event, this method  returns the resource that is being created.
---------------------------------------------
FUNCTION getResource(ev IN XDBRepositoryEvent)
                RETURN DBMS_XDBResource.XDBResource;

---------------------------------------------
-- FUNCTION - getParent
-- PARAMETERS -
--  ev  - XDB Repository Event object
-- RETURNS -
--  The parent of the target resource.
---------------------------------------------
FUNCTION getParent(ev IN XDBRepositoryEvent)
                RETURN DBMS_XDBResource.XDBResource;

---------------------------------------------
-- FUNCTION - getHandlerList
-- PARAMETERS -
--  ev  - XDB Repository Event object
-- RETURNS -
--  The list of handlers that will be executed after the currently
--  executing handler.
---------------------------------------------
FUNCTION getHandlerList(ev IN XDBRepositoryEvent) RETURN XDBHandlerList;

---------------------------------------------
-- FUNCTION - getLink
-- PARAMETERS -
--  ev  - XDB Repository Event object
-- RETURNS -
--  an XDBLink object for the target resource.
---------------------------------------------
FUNCTION getLink(ev IN XDBRepositoryEvent) RETURN XDBLink;

---------------------------------------------
-- FUNCTION - getLock
-- PARAMETERS -
--  ev  - XDB Repository Event object
-- RETURNS -
--  This method is only valid for the lock and unlock events. It returns
--  the lock object corresponding to the current operation.
---------------------------------------------
FUNCTION getLock(ev IN XDBRepositoryEvent) RETURN XDBLock;

---------------------------------------------
-- FUNCTION - getParameter
-- PARAMETERS -
--  ev  - XDB Repository Event object
-- RETURNS -
--  The value of a request or session-specific parameter. Currently, the
--  only parameters supported are "Accept", "Accept-Language", "Accept-Charset"
--  and "Accept-Encoding".
--  The definition of these parameters can be found in RFC 2616 (HTTP/1.1).
---------------------------------------------
FUNCTION getParameter(ev IN XDBRepositoryEvent, key IN VARCHAR2)
                              RETURN VARCHAR2;

---------------------------------------------
-- FUNCTION - getOldResource
-- PARAMETERS -
--  ev  - XDB Repository Event object
-- RETURNS -
--  Returns the original XDBResource object before the current operation
--  started. This method applies only to Update event. For other events,
--   an error is returned.
---------------------------------------------
FUNCTION getOldResource(ev IN XDBRepositoryEvent)
                RETURN DBMS_XDBResource.XDBResource;

---------------------------------------------
-- FUNCTION - getOutputStream
-- PARAMETERS -
--  ev  - XDB Repository Event object
-- RETURNS -
--  This is only valid for the Render event. It returns the output BLOB in
--  which the handler can write the rendered data.
---------------------------------------------
FUNCTION getOutputStream(ev IN XDBRepositoryEvent) RETURN BLOB;

---------------------------------------------
-- PROCEDURE - setRenderStream
--  This is only valid for the Render event. Sets the BLOB from which the
--  rendered contents can be read. This should not be called after the
--  stream returned by getOutputStream() is written to or after
--  setRenderPath() is called; doing so will result in an error.
-- PARAMETERS -
--  ev  - XDB Repository Event object
--  istr - input stream to get the rendered contents from
---------------------------------------------
PROCEDURE setRenderStream(ev IN XDBRepositoryEvent, istr IN BLOB);

---------------------------------------------
-- PROCEDURE - setRenderPath
--  This is only valid for the Render event. Specifies the path of the
--  resource that contains the rendered contents. This should not be called
--  after the stream returned by getOutputStream() is written to or
--  after setRenderStream() is called; doing so will result in an error.
-- PARAMETERS -
--  ev  - XDB Repository Event object
--  path - path of the resource containing the rendered contents
---------------------------------------------
PROCEDURE setRenderPath(ev IN XDBRepositoryEvent, path IN VARCHAR2);

---------------------------------------------
-- FUNCTION - getUpdateByteOffset
-- PARAMETERS -
--  ev  - XDB Repository Event object
-- RETURNS -
-- This method is only valid for the inconsistent-update event. If the
-- current operation is a byte-range write, it returns the byte offset at
-- which the range begins
---------------------------------------------
FUNCTION getUpdateByteOffset(ev IN XDBRepositoryEvent) RETURN NUMBER;

---------------------------------------------
-- FUNCTION - getUpdateByteCount
-- PARAMETERS -
--  ev  - XDB Repository Event object
-- RETURNS -
--  This method is only valid for the inconsistent-update event. If the
--  current operation is a byte-range write, it returns the byte count.
---------------------------------------------
FUNCTION getUpdateByteCount(ev IN XDBRepositoryEvent) RETURN NUMBER;

---------------------------------------------
-- FUNCTION - getOpenAccessMode
-- PARAMETERS -
--  ev  - XDB Repository Event object
-- RETURNS -
--  This method is only valid for the open event. It returns the access mode
--  for the open operation, which could be one of:
--      OPEN_ACCESS_READ
--      OPEN_ACCESS_WRITE
--      OPEN_ACCESS_READ_WRITE
---------------------------------------------
FUNCTION getOpenAccessMode(ev IN XDBRepositoryEvent) RETURN PLS_INTEGER;

---------------------------------------------
-- FUNCTION - getOpenDenyMode
-- PARAMETERS -
--  ev  - XDB Repository Event object
-- RETURNS -
--  This method is only valid for the open event. It returns the deny mode
--  for the open operation, which could be one of:
--      OPEN_DENY_NONE
--      OPEN_DENY_READ
--      OPEN_DENY_READ_WRITE
---------------------------------------------
FUNCTION getOpenDenyMode(ev IN XDBRepositoryEvent) RETURN PLS_INTEGER;

---------------------------------------------
-- FUNCTION - isNull
-- PARAMETERS -
--  repev - XDB Repository event object
-- RETURNS - TRUE if input argument is null.
---------------------------------------------
FUNCTION isNull(repev IN XDBRepositoryEvent) RETURN BOOLEAN;

---------------------------------------------
--        XDBHandlerList Methods
---------------------------------------------

---------------------------------------------
-- FUNCTION - getFirst
-- PARAMETERS -
--  hl - XDB handler list.
-- RETURNS -
--  The first handler in the list.
---------------------------------------------
FUNCTION getFirst(hl IN XDBHandlerList) RETURN XDBHandler;

---------------------------------------------
-- FUNCTION - getNext
-- PARAMETERS -
--  hl - XDB handler list.
-- RETURNS -
--  Next handler in the list.
---------------------------------------------
FUNCTION getNext(hl IN XDBHandlerList) RETURN XDBHandler;

---------------------------------------------
-- FUNCTION - remove
-- Removes the given handler from the list.
-- PARAMETERS -
--  hl - XDB handler list.
--  handler - handler to be removed
---------------------------------------------
PROCEDURE remove(hl IN XDBHandlerList, handler IN XDBHandler);

---------------------------------------------
-- PROCEDURE - clear
-- Clears the handler list.
-- PARAMETERS -
--  hl - XDB handler list.
---------------------------------------------
PROCEDURE clear(hl IN XDBHandlerList);

---------------------------------------------
-- FUNCTION - isNull
-- PARAMETERS -
--  hl - XDB handler list.
-- RETURNS - TRUE if input argument is null.
---------------------------------------------
FUNCTION isNull(hl IN XDBHandlerList) RETURN BOOLEAN;

---------------------------------------------
--        XDBHandler Methods
---------------------------------------------

---------------------------------------------
-- FUNCTION - getSource
-- PARAMETERS -
--  handler - an XDBHandler object
-- RETURNS -
--  The name of the Java class, PL/SQL package or object type implementing
--  the handler.
---------------------------------------------
FUNCTION getSource (handler IN XDBHandler) RETURN VARCHAR2;

---------------------------------------------
-- FUNCTION - getSchema
-- PARAMETERS -
--  handler - an XDBHandler object
-- RETURNS -
--  the schema of the handler's source
---------------------------------------------
FUNCTION getSchema (handler IN XDBHandler) RETURN VARCHAR2;

---------------------------------------------
-- FUNCTION - getLanguage
-- PARAMETERS -
--  handler - an XDBHandler object
-- RETURNS -
--  The implementation language of the handler
---------------------------------------------
FUNCTION getLanguage (handler IN XDBHandler) RETURN VARCHAR2;

---------------------------------------------
-- FUNCTION - isNull
-- PARAMETERS -
--  handler - the handler
-- RETURNS - TRUE if input argument is null.
---------------------------------------------
FUNCTION isNull(handler IN XDBHandler) RETURN BOOLEAN;

---------------------------------------------
--        XDBPath Methods
---------------------------------------------

---------------------------------------------
-- FUNCTION - getName
-- PARAMETERS -
--  path - a XDBPath object
-- RETURNS -
--  the string representation of the path.
---------------------------------------------
FUNCTION getName (path IN XDBPath) RETURN VARCHAR2;

---------------------------------------------
-- FUNCTION - getName
-- PARAMETERS -
--  path - a XDBPath object
--  level - indicates the number of levels up the hierarchy. This value
--          must be greater than zero. Level 1 means the immediate parent.
--          If level exceeds the height of the tree then a null is returned.
-- RETURNS -
--  The parent's path.
---------------------------------------------
FUNCTION getParentPath (path IN XDBPath, level IN PLS_INTEGER) RETURN XDBPath;

---------------------------------------------
-- FUNCTION - isNull
-- PARAMETERS -
--  path - a XDBPath object
-- RETURNS - TRUE if input argument is null.
---------------------------------------------
FUNCTION isNull(path IN XDBPath) RETURN BOOLEAN;

---------------------------------------------
--        XDBLink Methods
---------------------------------------------

---------------------------------------------
-- FUNCTION - getParentName
-- PARAMETERS -
--  link - an XDBLink object
-- RETURNS -
--  the link's parent folder's name.
---------------------------------------------
FUNCTION getParentName (link IN XDBLink) RETURN VARCHAR2;

---------------------------------------------
-- FUNCTION - getParentOID
-- PARAMETERS -
--  link - an XDBLink object
-- RETURNS -
--  the link's parent folder's OID
---------------------------------------------
FUNCTION getParentOID (link IN XDBLink) RETURN RAW;

---------------------------------------------
-- FUNCTION - getChildOID
-- PARAMETERS -
--  link - an XDBLink object
-- RETURNS -
--  the OID of the resource that the link is pointing to.
---------------------------------------------
FUNCTION getChildOID (link IN XDBLink) RETURN RAW;

---------------------------------------------
-- FUNCTION - getLinkName
-- PARAMETERS -
--  link - an XDBLink object
-- RETURNS -
--  the name of the link
---------------------------------------------
FUNCTION getLinkName (link IN XDBLink) RETURN VARCHAR2;

---------------------------------------------
-- FUNCTION - isNull
-- PARAMETERS -
--  link - an XDBLink object
-- RETURNS - TRUE if input argument is null.
---------------------------------------------
FUNCTION isNull(link IN XDBLink) RETURN BOOLEAN;

---------------------------------------------
--        XDBLock Methods
---------------------------------------------
SCOPE_EXCLUSIVE CONSTANT PLS_INTEGER      := 0;
SCOPE_SHARED CONSTANT PLS_INTEGER         := 1;
TYPE_WRITE CONSTANT PLS_INTEGER           := 0;
TYPE_READ_WRITE CONSTANT PLS_INTEGER      := 1;

---------------------------------------------
-- FUNCTION - getLockMode
-- PARAMETERS -
--  lk - a XDBLock object
-- RETURNS -
--  the lock's mode (shared or exlusive).
---------------------------------------------
FUNCTION getLockMode (lk in XDBLock) RETURN PLS_INTEGER;

---------------------------------------------
-- FUNCTION - getLockType
-- PARAMETERS -
--  lk - a XDBLock object
-- RETURNS -
--  the lock's type (write or read-write)
---------------------------------------------
FUNCTION getLockType (lk in XDBLock) RETURN PLS_INTEGER;

---------------------------------------------
-- FUNCTION - getDAVToken
-- PARAMETERS -
--  lk - a XDBLock object
-- RETURNS -
--  the token id if this is a DAV lock. Otherwise null
---------------------------------------------
FUNCTION getDAVToken (lk in XDBLock) RETURN VARCHAR2;

---------------------------------------------
-- FUNCTION - getDAVOwner
-- PARAMETERS -
--  lk - a XDBLock object
-- RETURNS -
--  the DAV:owner if this is a DAV lock. Otherwise null
---------------------------------------------
FUNCTION getDAVOwner (lk in XDBLock) RETURN VARCHAR2;

---------------------------------------------
-- FUNCTION - getNFSNodeId
-- PARAMETERS -
--  lk - a XDBLock object
-- RETURNS -
--  the RAC node id if this is an NFSv4 lock. Otherwise null
---------------------------------------------
FUNCTION getNFSNodeId (lk in XDBLock) RETURN RAW;

---------------------------------------------
-- FUNCTION - getDepth
-- PARAMETERS -
--  lk - a XDBLock object
-- RETURNS -
--  the depth of the lock (either 0 or INFINITY_DEPTH)
---------------------------------------------
FUNCTION getDepth (lk in XDBLock) RETURN PLS_INTEGER;

---------------------------------------------
-- FUNCTION - getExpiry
-- PARAMETERS -
--  lk - a XDBLock object
-- RETURNS -
--  If DAV lock returns the date and time at which the lock will expire;
--  otherwise returns null.
---------------------------------------------
FUNCTION getExpiry (lk in XDBLock) RETURN TIMESTAMP;

---------------------------------------------
-- FUNCTION - isNull
-- PARAMETERS -
--  lk - a XDBLock object
-- RETURNS - TRUE if input argument is null.
---------------------------------------------
FUNCTION isNull(lk IN XDBLock) RETURN BOOLEAN;

end dbms_XEvent;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XMLTRANSLATIONS"
authid current_user is

function translatexml (
    doc  in xmltype,
    lang in varchar2
) return xmltype;

function getbasedocument (
    doc  in xmltype
) return xmltype;

function updatetranslation (
    doc   in xmltype,
    xpath in varchar2,
    lang  in varchar2,
    value in varchar2,
    namespace in varchar2 := null
) return xmltype;

function setsourcelang (
    doc   in xmltype,
    xpath in varchar2,
    lang  in varchar2,
    namespace in varchar2 := null
) return xmltype;

function extractxliff (
    doc   in xmltype,
    xpath in varchar2,
    namespace in varchar2 := null
) return xmltype;

function extractxliff (
    abspath in varchar2,
    xpath   in varchar2,
    namespace in varchar2 := null
) return xmltype;

function mergexliff (
    doc   in xmltype,
    xliff in xmltype
) return xmltype;

procedure mergexliff (
    xliff in xmltype
);

procedure enableTranslation;
procedure disableTranslation;

end dbms_xmltranslations;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XDBREPOS" AUTHID CURRENT_USER IS

  ---------------------------------------------
  --  OVERVIEW
  --
  --  This package provides procedures to
  --  (*) create a self-contained repository
  --  (*) delete a previously registered repository
  --  (*) alter a previously created repository
  --
  ---------------------------------------------

------------
-- CONSTANTS
--
------------
ACL_SECURITY        CONSTANT NUMBER := 1;
EVENTS              CONSTANT NUMBER := 2;
VERSIONING          CONSTANT NUMBER := 4;
CONFIG_FILE         CONSTANT NUMBER := 8;
DOCUMENT_LINKS      CONSTANT NUMBER := 16;
NFS_LOCKS           CONSTANT NUMBER := 32;

FULL_FEATURED       CONSTANT NUMBER := 63;

-------------
-- DEBUG MODE
--
-------------
DEBUG_MODE          NUMBER := 0;

---------------------------------------------
-- FUNCTION - CreateRepository
--     Creates a self-contained repository
-- PARAMETERS -
--  reposOwner
--     Owner of repository (database user)
--  reposName
--     Name of repository (same restrictions as table names)
--  reposOptions
--     Repository configuration options
---------------------------------------------
PROCEDURE CreateRepository(reposOwner IN VARCHAR2,
                  reposName IN VARCHAR2,
                  reposOptions IN PLS_INTEGER);

---------------------------------------------
-- FUNCTION - DropRepository
--     Drops repository and contents
-- PARAMETERS -
--  reposOwner
--     Owner of repository (database user)
--  reposName
--     Name of repository (same restrictions as table names)
---------------------------------------------
PROCEDURE DropRepository(reposOwner IN VARCHAR2,
                  reposName IN VARCHAR2);

---------------------------------------------
-- FUNCTION - SetCurrentRepository
--     Sets current repository for all subsequent resource
--     operations
-- PARAMETERS -
--  reposOwner
--     Owner of repository (database user)
--  reposName
--     Name of repository (same restrictions as table names)
---------------------------------------------
PROCEDURE SetCurrentRepository(reposOwner IN VARCHAR2,
                  reposName IN VARCHAR2);

---------------------------------------------
-- FUNCTION - MountRepository
--     Mounts specified repository at a given path in
--     source repository
-- PARAMETERS -
--  parentReposOwner
--     Owner of destination repository (database user)
--  parentReposName
--     Name of destination repository (same restrictions as table names)
--  parentMntPath
--     Path in the destination repository where mounting should occur
--  mountedReposOwner
--     Owner of source repository (database user)
--  mountedReposName
--     Name of source repository (same restrictions as table names)
--  mountedPath
--     Path in the source repository to mount
---------------------------------------------
PROCEDURE MountRepository(parentReposOwner IN VARCHAR2,
                  parentReposName IN VARCHAR2,
                  parentMntPath IN VARCHAR2,
                  mountedReposOwner IN VARCHAR2,
                  mountedReposName IN VARCHAR2,
                  mountedPath IN VARCHAR2  );

---------------------------------------------
-- FUNCTION - UnMountRepository
--     Unmounts repository from specified path
-- PARAMETERS -
--  parentReposOwner
--     Owner of destination repository (database user)
--  parentReposName
--     Name of destination repository (same restrictions as table names)
--  mountPath
--     Mount path in the destination repository to be removed
---------------------------------------------
PROCEDURE UnMountRepository(parentReposOwner IN VARCHAR2,
                  parentReposName IN VARCHAR2,
                  mountPath IN VARCHAR2  );

PROCEDURE Install_Repos(schema IN VARCHAR2, tables IN
                        XDB$STRING_LIST_T);
PROCEDURE Drop_Repos(schema IN VARCHAR2, tables IN
                     XDB$STRING_LIST_T);
end dbms_xdbrepos;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XDB_CONSTANTS" authid CURRENT_USER AS

  C_UTF8_ENCODING              constant VARCHAR2(32)
                  := 'AL32UTF8';
  C_WIN1252_ENCODING           constant VARCHAR2(32)
                  := 'WE8MSWIN1252';
  C_ISOLATIN1_ENCODING         constant VARCHAR2(32)
                  := 'WE8ISO8859P1';
  C_DEFAULT_ENCODING           constant VARCHAR2(32)
                  := C_UTF8_ENCODING;
  C_ORACLE_NAMESPACE           constant VARCHAR2(128)
                  := 'http://xmlns.oracle.com';
  C_ORACLE_XDB_NAMESPACE       constant VARCHAR2(128)
                  := C_ORACLE_NAMESPACE || '/xdb';
  C_XDBSCHEMA_NAMESPACE        constant VARCHAR2(128)
                  := C_ORACLE_XDB_NAMESPACE || '/XDBSchema.xsd';
  C_RESOURCE_NAMESPACE         constant VARCHAR2(128)
                  := C_ORACLE_XDB_NAMESPACE || '/XDBResource.xsd';
  C_ACL_NAMESPACE              constant VARCHAR2(128)
                  := C_ORACLE_XDB_NAMESPACE || '/acl.xsd';
  C_XMLSCHEMA_NAMESPACE        constant VARCHAR2(128)
                  := 'http://www.w3.org/2001/XMLSchema';
  C_XMLINSTANCE_NAMESPACE      constant VARCHAR2(128)
                  := 'http://www.w3.org/2001/XMLSchema-instance';
  C_RESOURCE_PREFIX_R          constant VARCHAR2(128)
                  := 'xmlns:r="'   || C_RESOURCE_NAMESPACE    || '"';
  C_ACL_PREFIX_ACL             constant VARCHAR2(128)
                  := 'xmlns:acl="' || C_ACL_NAMESPACE         || '"';
  C_XDBSCHEMA_PREFIX_XDB       constant VARCHAR2(128)
                  := 'xmlns:xdb="' || C_ORACLE_XDB_NAMESPACE  || '"';
  C_XMLSCHEMA_PREFIX_XSD       constant VARCHAR2(128)
                  := 'xmlns:xsd="' || C_XMLSCHEMA_NAMESPACE   || '"';
  C_XMLINSTANCE_PREFIX_XSI     constant VARCHAR2(128)
                  := 'xmlns:xsi="' || C_XMLINSTANCE_NAMESPACE || '"';
  C_XDBSCHEMA_LOCATION         constant VARCHAR2(128)
                  := C_ORACLE_XDB_NAMESPACE || '/XDBSchema.xsd';
  C_XDBCONFIG_LOCATION         constant VARCHAR2(128)
                  := C_ORACLE_XDB_NAMESPACE ||  '/xdbconfig.xsd';
  C_ACL_LOCATION               constant VARCHAR2(128)
                  := C_ORACLE_XDB_NAMESPACE || '/acl.xsd';
  C_RESOURCE_LOCATION          constant VARCHAR2(128)
                  := C_ORACLE_XDB_NAMESPACE || '/XDBResource.xsd';
  C_BINARY_CONTENT             constant VARCHAR2(128)
                  := C_XDBSCHEMA_LOCATION  || '#binary';
  C_TEXT_CONTENT               constant VARCHAR2(128)
                  := C_XDBSCHEMA_LOCATION  || '#text';
  C_ACL_CONTENT                constant VARCHAR2(128)
                  := C_ACL_LOCATION     || '#acl';
  C_XDBSCHEMA_PREFIXES         constant VARCHAR2(256)
                  := C_XMLSCHEMA_PREFIX_XSD || ' ' || C_XDBSCHEMA_PREFIX_XDB;
  C_EXIF_NAMESPACE             constant VARCHAR2(128)
                  := C_ORACLE_NAMESPACE || '/ord/meta/exif';
  C_IPTC_NAMESPACE             constant VARCHAR2(128)
                  := C_ORACLE_NAMESPACE || '/ord/meta/iptc';
  C_DICOM_NAMESPACE            constant VARCHAR2(128)
                  := C_ORACLE_NAMESPACE || '/ord/meta/dicomImage';
  C_ORDIMAGE_NAMESPACE         constant VARCHAR2(128)
                  := C_ORACLE_NAMESPACE || '/ord/meta/ordimage';
  C_XMP_NAMESPACE              constant VARCHAR2(128)
                  := C_ORACLE_NAMESPACE || '/ord/meta/xmp';
  C_XDBCONFIG_NAMESPACE        constant VARCHAR2(128)
                  := C_ORACLE_XDB_NAMESPACE ||  '/xdbconfig.xsd';
  C_EXIF_PREFIX_EXIF           constant VARCHAR2(128)
                  := 'xmlns:exif="'  || C_EXIF_NAMESPACE     || '"';
  C_IPTC_PREFIX_IPTC           constant VARCHAR2(128)
                  := 'xmlns:iptc="'  || C_IPTC_NAMESPACE     || '"';
  C_DICOM_PREFIX_DICOM         constant VARCHAR2(128)
                  := 'xmlns:dicom="' || C_DICOM_NAMESPACE    || '"';
  C_ORDIMAGE_PREFIX_ORD        constant VARCHAR2(128)
                  := 'xmlns:ord="'   || C_ORDIMAGE_NAMESPACE || '"';
  C_XMP_PREFIX_XMP             constant VARCHAR2(128)
                  := 'xmlns:xmp="'   || C_XMP_NAMESPACE      || '"';
  C_RESOURCE_CONFIG_NAMESPACE  constant VARCHAR2(128)
                  := C_ORACLE_XDB_NAMESPACE || '/XDBResConfig.xsd';
  C_XMLDIFF_NAMESPACE          constant VARCHAR2(128)
                  := C_ORACLE_XDB_NAMESPACE || '/xdiff.xsd';
  C_RESOURCE_CONFIG_PREFIX_RC  constant VARCHAR2(128)
                  := 'xmlns:rc="' || C_RESOURCE_CONFIG_NAMESPACE || '"';
  C_XMLDIFF_PREFIX_XD          constant VARCHAR2(128)
                  := 'xmlns:xd="' || C_XMLDIFF_NAMESPACE        || '"';
  C_NSPREFIX_XDBCONFIG_CFG     constant VARCHAR2(128)
                  := 'xmlns:cfg="' || C_XDBCONFIG_NAMESPACE        || '"';

  C_GROUP        constant VARCHAR2(32) := 'group';
  C_ELEMENT      constant VARCHAR2(32) := 'element';
  C_ATTRIBUTE    constant VARCHAR2(32) := 'attribute';
  C_COMPLEX_TYPE constant VARCHAR2(32) := 'complexType';

function ENCODING_UTF8        return varchar2 deterministic;
--        returns 'AL32UTF8'

function ENCODING_ISOLATIN1        return varchar2 deterministic;
--        returns 'WE8ISO8859P1'

function ENCODING_WIN1252     return varchar2 deterministic;
--        returns 'WE8MSWIN1252'

function ENCODING_DEFAULT     return varchar2 deterministic;
--        returns 'AL32UTF8'

function NAMESPACE_ORACLE_XDB        return varchar2 deterministic;
--        returns 'http://xmlns.oracle.com/xdb'

function NAMESPACE_RESOURCE          return varchar2 deterministic;
--        returns ' http://xmlns.oracle.com/xdb/XDBResource.xsd

function NAMESPACE_XDBSCHEMA          return varchar2 deterministic;
--        returns ' http://xmlns.oracle.com/xdb/XDBSchema.xsd

function NAMESPACE_ACL               return varchar2 deterministic;
--          returns ' http://xmlns.oracle.com/xdb/acl.xsd'

function NAMESPACE_ORACLE         return varchar2 deterministic;
--        returns 'http://xmlns.oracle.com'

function NAMESPACE_XMLSCHEMA         return varchar2 deterministic;
--        returns 'http://www.w3.org/2001/XMLSchema'

function NAMESPACE_XMLINSTANCE       return varchar2 deterministic;
--        returns 'http://www.w3.org/2001/XMLSchema-instance'

function NAMESPACE_RESOURCE_CONFIG   return varchar2 deterministic;
--           returns 'http://xmlns.oracle.com/xdb/XDBResConfig.xsd'

function NAMESPACE_XMLDIFF           return varchar2 deterministic;
--        returns 'http://xmlns.oracle.com/xdb/xdiff.xsd'

function NAMESPACE_XDBCONFIG          return varchar2 deterministic;
--        returns 'http://xmlns.oracle.com/xdb/xdbconfig.xsd'

function SCHEMAURL_XDBCONFIG          return varchar2 deterministic;
--        returns 'http://xmlns.oracle.com/xdb/xdbconfig.xsd'

function NSPREFIX_RESOURCE_R         return varchar2 deterministic;
--        returns 'xmlns:r="http://xmlns.oracle.com/XDBResource.xsd"'

function NSPREFIX_ACL_ACL              return varchar2 deterministic;
--        returns 'xmlns:acl= 'http://xmlns.oracle.com/acl.xsd"'

function NSPREFIX_XDB_XDB        return varchar2 deterministic;
--        returns 'xmlns:xdb= “http://xmlns.oracle.com/xdb" '

function NSPREFIX_XMLSCHEMA_XSD        return varchar2 deterministic;
--        returns 'xmlns:xsd="http://www.w3.org/2001/XMLSchema"'

function NSPREFIX_XMLINSTANCE_XSI      return varchar2 deterministic;
--        returns 'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '

function NSPREFIX_RESCONFIG_RC   return varchar2 deterministic;
--        returns 'xmlns:rc="' || NAMESPACE_RESOURCE_CONFIG

function NSPREFIX_XMLDIFF_XD           return varchar2 deterministic;
--        returns  xmlns:xd="' || NAMESPACE_XMLDIFF

function NSPREFIX_XDBCONFIG_CFG        return varchar2 deterministic;
--        returns xmlns:cfg="http://xmlns.oracle.com/xdb/xdbconfig.xsd"

function SCHEMAURL_XDBSCHEMA          return varchar2 deterministic;
--        returns 'http://xmlns.oracle.com/xdb/XDBSchema.xsd';

function SCHEMAURL_ACL                return varchar2 deterministic;
--        returns 'http://xmlns.oracle.com/xdb/acl.xsd';

function SCHEMAURL_RESOURCE           return varchar2 deterministic;
--        returns 'http://xmlns.oracle.com/xdb/XDBResource.xsd';

function SCHEMAELEM_RESCONTENT_BINARY              return varchar2 deterministic;
--        returns SCHEMAURL_XDBSCHEMA || '#binary'

function SCHEMAELEM_RESCONTENT_TEXT                return varchar2 deterministic;
--        returns SCHEMAURL_XDBSCHEMA || '#text'

function SCHEMAELEM_RES_ACL                 return varchar2 deterministic;
--        returns SCHEMAURL_XDBSCHEMA || '#acl'

function XSD_GROUP             return VARCHAR2 deterministic;
--        returns 'group'

function XSD_ELEMENT           return VARCHAR2 deterministic;
--        returns 'element'

function XSD_ATTRIBUTE         return VARCHAR2 deterministic;
--        returns 'attribute'

function XSD_COMPLEX_TYPE      return VARCHAR2 deterministic;
--        returns 'complexType'

function XDBSCHEMA_PREFIXES  return VARCHAR2 deterministic;
--        returns  DBMS_XDB_CONSTANTS.PREFIX_DEF_XDB || ' ' ||
--                 DBMS_XDB_CONSTANTS.PREFIX_DEF_XMLSCHEMA

END DBMS_XDB_CONSTANTS;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XMLSCHEMA_ANNOTATE" authid CURRENT_USER AS

  procedure printWarnings(value in BOOLEAN default TRUE);


  procedure addXDBNamespace(xmlschema in out XMLType);
  -- Adds the XDB namespace that is required for xdb annotation.
  -- This procedure is called implicitly by any other procedure that adds a
  -- schema annotation. Without further annotations the xdb namespace
  -- annotations does not make sense, therefore this procedure might mostly
  -- be called by other annotations procedures and not by the user directly.
  -- The procedure gets an XML Schema as XMLType, performs the annotation and
  -- returns it.

  procedure setDefaultTable(xmlschema in out XMLType,
                            globalElementName VARCHAR2,
                            tableName VARCHAR2,
                            overwrite BOOLEAN default TRUE);
  -- Sets the name of the default table for a given global element that is
  -- specified by its name

  procedure removeDefaultTable(xmlschema in out XMLType,
                              globalElementName VARCHAR2);
  -- Removes the default table attribute for the given element.
  -- After calling this
  -- function system generated table names will be used. The procedure will
  -- always overwrite.

  procedure setTableProps(xmlschema in out XMLType,
                          globalElementName VARCHAR2,
                          tableProps VARCHAR2,
                          overwrite BOOLEAN default TRUE);
  -- Specifies the TABLE storage clause that is appended to the default
  -- CREATE TABLE statement.

  procedure removeTableProps(xmlschema in out XMLType,
                            globalElementName VARCHAR2);
  -- removes the table storage props.

  procedure setTableProps(xmlschema in out XMLType,
                          globalObject VARCHAR2,
                          globalObjectName VARCHAR2,
                          localElementName VARCHAR2,
                          tableProps VARCHAR2,
                          overwrite BOOLEAN default TRUE);
  -- Specifies the TABLE storage clause that is appended to the
  -- default CREATE TABLE statement.

  procedure removeTableProps(xmlschema in out XMLType,
                          globalObject VARCHAR2,
                          globalObjectName VARCHAR2,
                          localElementName VARCHAR2);
  -- Removes the TABLE storage clause that is appended to the
  -- default CREATE TABLE statement.

  procedure disableDefaultTableCreation(xmlschema in out XMLType,
                                         globalElementName VARCHAR2);
  -- Add a default table attribute with an empty value to the
  -- top level element with the specified name.
  -- No table will be created for that element.
  -- The procedure will always overwrite.


  procedure disableDefaultTableCreation(xmlschema in out XMLType);
  -- Add a default table attribute with an empty value to ALL top level
  -- elements that have no defined default table name.
  -- The procedure will never overwrite existing annotations since this
  -- would lead to no table creation at all.
  -- This is the way to prevent XDB from creating many and unused tables
  -- for elements that are no root elements of
  -- instance documents.
 /* TODO This function
  * This functions should test that at least one default table with a given
  * name exists. If no default table name is assigned calling this
  * disableTopLevelTableCreation would lead to no table creation at all. */

  procedure enableDefaultTableCreation(xmlschema in out XMLType,
                                        globalElementName VARCHAR2);
  -- Enables the creation of top level tables by removing the empty default
  -- table name annotation.

  procedure enableDefaultTableCreation(xmlschema in out XMLType);
  -- Enables the creation of ALL top level tables by removing the empty
  -- default table name annotation.

  procedure setSQLName (xmlschema in out XMLType,
                        globalObject VARCHAR2,
                        globalObjectName VARCHAR2,
                        localObject VARCHAR2,
                        localObjectName VARCHAR2,
                        sqlName VARCHAR2,
                        overwrite BOOLEAN default TRUE);
  -- assigns a sqlname to an element

  procedure removeSQLName (xmlschema in out XMLType,
                           globalObject VARCHAR2,
                           globalObjectName VARCHAR2,
                           localObject VARCHAR2,
                           localObjectName VARCHAR2);
  -- removes a sqlname from a global element

  procedure setSQLType (xmlschema in out XMLType,
                        globalElementName VARCHAR2,
                        sqlType VARCHAR2,
                        overwrite BOOLEAN default TRUE);
  -- assigns a sqltype to a global element

  procedure removeSQLType (xmlschema in out XMLType,
                           globalElementName VARCHAR2);
  -- removes a sqltype from a global element

  procedure setSQLType(xmlschema in out XMLType,
                       globalObject VARCHAR2,
                       globalObjectName VARCHAR2,
                       localObject VARCHAR2,
                       localObjectName VARCHAR2,
                       sqlType VARCHAR2,
                       overwrite BOOLEAN default TRUE);
  -- assigns a sqltype inside a complex type (local)

  procedure removeSQLType    (xmlschema in out XMLType,
                              globalObject VARCHAR2,
                              globalObjectName VARCHAR2,
                              localObject VARCHAR2,
                              localObjectName VARCHAR2);
  -- removes a sqltype inside a complex type (local)

  procedure setSQLTypeMapping(xmlschema in out XMLType,
                              schemaTypeName VARCHAR2,
                              sqlTypeName VARCHAR2,
                              overwrite BOOLEAN default TRUE);
  -- defines a mapping of schema type and sqltype.
  -- The addSQLType procedure do not have to be called on all instances of
  -- the schema type instead the schema is traversed and the
  -- sqltype is assigned automatically.

  procedure removeSQLTypeMapping(xmlschema in out XMLType,
                                 schemaTypeName VARCHAR2);
  -- removes the sqltype mapping for the given schema type.

  procedure setTimeStampWithTimeZone(xmlschema in out xmlType,
                                     overwrite BOOLEAN default TRUE);
  -- sets the TimeStampWithTimeZone datatype to dateTime typed element.

  procedure removeTimeStampWithTimeZone(xmlschema in out xmlType);
  -- removes the TimeStampWithTimeZone datatype to dateTime typed element.

  procedure setAnyStorage (xmlschema in out XMLType,
                           complexTypeName VARCHAR2,
                           sqlTypeName VARCHAR2,
                           overwrite BOOLEAN default TRUE);
  -- sets the sqltype of any

  procedure removeAnyStorage (xmlschema in out XMLType,
                              complexTypeName VARCHAR2);
  -- removes the sqltype of any

  procedure setSQLCollType(xmlschema in out XMLType,
                           elementName VARCHAR2,
                           sqlCollType VARCHAR2,
                           overwrite BOOLEAN default TRUE);
  -- sets the name of the SQL collection type that corresponds
  -- to this XML element

  procedure removeSQLCollType(xmlschema in out XMLType,
                              elementName VARCHAR2);
  -- removes the sql collection type

  procedure setSQLCollType(xmlschema in out XMLType,
                           globalObject VARCHAR2,
                           globalObjectName VARCHAR2,
                           localElementName VARCHAR2,
                           sqlCollType VARCHAR2,
                           overwrite BOOLEAN default TRUE );
  -- Name of the SQL collection type that corresponds to this
  -- XML element. inside a complex type.

  procedure removeSQLCollType(xmlschema in out XMLType,
                              globalObject VARCHAR2,
                              globalObjectName VARCHAR2,
                              localElementName VARCHAR2);
  -- removes the sql collection type

  procedure disableMaintainDom(xmlschema in out XMLType,
                               overwrite BOOLEAN default TRUE);
  -- sets dom fidelity to FALSE to ALL complex types irregardless
  -- of their names

  procedure enableMaintainDom(xmlschema in out XMLType,
                              overwrite BOOLEAN default TRUE);
  -- sets dom fidelity to TRUE to ALL complex types irregardless
  -- of their names

  procedure disableMaintainDom(xmlschema in out XMLType,
                               complexTypeName VARCHAR2,
                               overwrite BOOLEAN default TRUE);
  -- sets the dom fidelity attribute for the given complex type name to FALSE.

  procedure enableMaintainDom(xmlschema in out XMLType,
                              complexTypeName VARCHAR2,
                              overwrite BOOLEAN default TRUE);
  -- sets the dom fidelity attribute for the given complex type name to TRUE

  procedure removeMaintainDom(xmlschema in out XMLType);
  -- removes all maintain dom annotations from given schema

  procedure setOutOfLine(xmlschema in out XMLType,
                          elementName VARCHAR2,
                          elementType VARCHAR2,
                          defaultTableName VARCHAR2,
                          overwrite BOOLEAN default TRUE);
  -- set the sqlInline attribute to false and forces the out of line storage
  -- for the element specified by its name.

  procedure removeOutOfLine(xmlschema in out XMLType,
                            elementName VARCHAR2,
                            elementType VARCHAR2);
  -- removes the sqlInline attribute for the element specified by its name.

  procedure setOutOfLine (xmlschema in out XMLType,
                           globalObject VARCHAR2,
                           globalObjectName VARCHAR2,
                           localElementName VARCHAR2,
                           defaultTableName VARCHAR2,
                           overwrite BOOLEAN default TRUE);
  -- set the sqlInline attribute to false and forces the out of line storage
  -- for the element specified by its   local and global name

  procedure removeOutOfLine (xmlschema in out XMLType,
                             globalObject VARCHAR2,
                             globalObjectName VARCHAR2,
                             localElementName VARCHAR2);
  -- removes the sqlInline attribute for the element specified by its
  -- global and local name

  procedure setOutOfLine(xmlschema in out XMLType,
                          reference VARCHAR2,
                          defaultTableName VARCHAR2,
                          overwrite BOOLEAN default TRUE);
  -- sets the default table name and sqlinline attribute for all references
  -- to a particular global Element

  procedure removeOutOfLine(xmlschema in out XMLType, reference VARCHAR2);
  -- removes the the sqlInline attribute for the global element



  function getSchemaAnnotations(xmlschema xmlType) return XMLType;
  --  creates a diff of the annotated xml schema and the
  --  non-annotated  xml schema.
  --  This diff can be used to apply all annotation again on a
  --  non-annotated schema.
  --  A user calls this function to save all annotations in one document.

  procedure setSchemaAnnotations(xmlschema in out xmlType, annotations XMLTYPE);
  -- Will take the annotations
  -- (diff result from call to 'getSchemaAnnotations'
  -- and will patch in provided XML schema.




END DBMS_XMLSCHEMA_ANNOTATE;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XMLSTORAGE_MANAGE" authid CURRENT_USER AS

  procedure renameCollectionTable (owner_name varchar2 default user,
                                   tab_name varchar2,
                                   col_name varchar2 default NULL,
                                   xpath varchar2,
                                   collection_table_name varchar2,
                                   namespaces IN VARCHAR2 default NULL);


  -- Renames a collection table from the system generated name
  -- to the given table name.
  -- This function is called AFTER registering the xml schema.
  -- NOTE: Since there is no direct schema annotation for this purpose
  -- this post registration
  -- function has to be used. Because all other functions are used before
  -- registration this
  -- function breaks the consistency. In addition, this is the only case
  -- where we encourage the
  -- user/dba to change a table/type name after registration.
  -- Since one goal of the schema annotation is to enable more readable
  -- query execution plans
  -- we recommend to derive the name of a collection table by its
  -- corresponding collection type name.
  -- Since we have an annotation for collection type we should use this one
  -- when creating the collection
  -- table. This might make the renameCollectionTable obsolete.


  procedure scopeXMLReferences;
  -- Will scope all XML references. Scoped REF types require
  -- less storage space and allow more
  -- efficient access than unscoped REF types.
  -- Note: This procedure does not need to be exposed
  -- to customer if called automatically from
  -- schema registration code.
  -- In this case we will either move the procedure into a prvt package
  -- or call the body of scopeXMLReferences from schema registration code
  -- directly so that the
  -- procedure would not be published at all.

  procedure indexXMLReferences( owner_name VARCHAR2 default user,
                             table_name VARCHAR2,
                             column_name VARCHAR2 default NULL,
                             index_name VARCHAR2);
  -- This procedure creates unique indexes on the ref columns
  -- of the given XML type tables or XML type column of a given table.
  -- In case of an XML type table the column name does not
  -- have to be specified.
  -- The index_name will be used to name the index- since multiple ref
  -- columns could be affected the table name gets a iterator concatenated
  -- at the end.
  -- For instance if two ref columns are getting indexed they will be named
  -- index_name_1 and index_name_2.
  -- The procdure indexXMLReferences will not recursively index refs in child
  -- tables of the table that this procedure is called on.
  -- If this is desired we recommend to call the
  -- procedure from within a loop  over the
  -- DBA|ALL|USER_ XML_OUT_OF_LINE_TABLES or
  -- DBA|ALL|USER_ XML_NESTED_TABLES view.
  -- The index_name could then be created from the current
  -- value of a view's column.
  -- Indexed refs lead to higher performance when joins between the
  -- child table and base table
  -- occur in the query plan. If the selectivity of the child table
  -- is higher than the join of one
  -- row in the child table with the base table leads to a full table
  -- scan of the base table if no indexes are present.
  -- This is the exact motivation for indexing the refs in the base table.
  -- If the base table has a higher selectivity than the child table there
  -- is no need to index the refs.
  -- Indexing the refs makes only sense if the refs are scoped.

  -- ** Bulkload functionality
procedure  disableIndexesAndConstraints(owner_name varchar2 default user,
                                        table_name varchar2,
                                        column_name varchar2 default NULL,
                                        clear Boolean default FALSE);


  -- This procedure will be used to drop the indexes and disable
  -- the constraints for both xmltype
  -- table (no P_COL_NAME) and xmltype columns.
  -- For xmltype tables, the user needs to pass the xmltype-table
  -- name on which the bulk load operation is to be performed.
  -- For xmltype columns, the user needs to pass
  -- the relational table_name and the corresponding xmltype column name.

procedure enableIndexesAndConstraints(owner_name varchar2 default user,
                                      table_name varchar2,
                                      column_name varchar2 default NULL);


  -- This procedure will rebuild all indexes and enable the constraints
  -- on the P_TABLE_NAME including its
  -- child and out of line tables.
  -- When P_COL_NAME is passed, it does the same for this xmltype column.


-- routine to disable constraints before exchange partition
procedure  ExchangePreProc(owner_name varchar2 default user,
                           table_name varchar2);
-- routine to enable constraints after exchange partition
procedure  ExchangePostProc(owner_name varchar2 default user,
                           table_name varchar2);


function xpath2TabColMapping(owner_name VARCHAR2 default user,
                             table_name IN VARCHAR2,
                             column_name IN VARCHAR2 default NULL,
                             xpath IN VARCHAR2,
                             namespaces IN VARCHAR2 default NULL) RETURN XMLTYPE;

function getSIDXDefFromView(viewName  IN VARCHAR2) RETURN CLOB;

--routine to get the type creation DDL for all CDB invalid types after PDB plugin
procedure GetTypeDDL ;

END DBMS_XMLSTORAGE_MANAGE;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."PRVT_DBMS_MANAGE_XMLSTORAGE" wrapped
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
9
137 eb
/e0W8RAwooIABognR9LW5cxkuoowg5BKAMvWfHQC2seeKKQYwzJ9l5GsOsy3yHs5Avr+nem2
RmmxPCX95OQ6MfvXmVus3QoRsUVNyxDfIa39AYtlalRcpnMG8FkDBzfbR9FU8sJEZgxKNLQ+
8kD/RUQAymKJZYFpiQsMD2p4RxSZElpM+IVFHFkxs/EKJeTHJLz+BFT31+PkNGq56YLxaus7
qs8aZpoqnCh8LK4R
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XDB_CONTENT" wrapped
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
9
622 24c
5sYyrcUMzBmjhtt5fgQJ0ijliv4wgw3DvsDWfC8u1+p+iHJTwPLFqGJUtqh/bZEolIJKXtQ+
BmZPLNveR+4a50PCu1AFjWXUD5OsuCIQz42awV46M0K+vA/i3W5VDPto82thY9n34adbL9rX
OyGriUfNx9SKHBpAHe+8F6AFpmsyGjWi3ocYFv8MSKCBdLydiW8KRQLKt4jFJsxG+5GRV56A
572jcldrVZJBdPryRxBVV5mDuLeUguaE9t7EpjW6ZDX3ZbNvNG0lb4g8KpNz3Mjftc0UcCZS
gzMWnGBaunxSbgtMzcXEQLpI4MayRi/dtGYcyBgn3HtYf6MqlhBuyDqonskTdCN3nhYq5tTx
taR1Uyf3PwV6kDzyTorK6pJzX8a9YcDMLXzN/9zaIbtNGylkr4RK+fIwfgRoOFgJaqfYff4G
pLoDVrYiLNTCAsshrKCSlV9FLMeku3aT6gQXo2Rv1AnuI+wQ8cdQnCnzp6O/gmWXw7onfbk/
Mxh49Cp65iXAyYQRHVkOFQKE4pFVDiuVbw2g89ANj2DYIw2TGIFgq2zoiN56IvU3o0auJJ+v
GF4=
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "XDB"."DBMS_XDBT"
IS

  ------------
  --  OVERVIEW
  --
  --    This package provides utilities for creating and managing conText
  --    indexes on the XDB repository.
  --
  --    The preferred mode of operation is as follows
  --    (a) drop any existing preferences. dbms_xdbt.dropPreferences
  --    (b) re-create preferences for the index
  --        (dbms_xdbt.createPreferences)
  --    (c) Create the index
  --        (dbms_xdbt.createIndex)
  --        Verify that things have gone smoothly using
  --          "select * from ctx_user_index_errors"
  --    (d) Setup automatic sync'ing of the index
  --        (dbms_xdbt.configureAutoSync)
  --    (e) Sit back and relax
  --
  --    The package spec contains a a list of package variables that
  --    describe the configuration settings. These are intended to
  --    cover some of the more basic customizations that installations
  --    might require, but is not intended to be a complete set.
  --
  --    There are 2 ways to customize this package.
  --    (a) Use a PL/SQL procedure to set the appropriate package variables
  --        that control the relevant configurations, and then execute
  --        the package. Obviously, this only applies to the set of existing
  --        package variables
  --    (b) The more general approach is to modify (in place, or as a copy)
  --        this package to introduce the appropriate customizations
  --
  --    For instance, if you need to change the amount of memory available
  --    for indexing, you could use option (a).
  --
  --    NOTES:
  --      If you're using this package as is, please note the following
  --    (a) Make sure that the LOG_DIRECTORY parameter is set using
  --        ctx_adm.set_parameter
  --        Alternately, turn off rowid logging by setting the
  --        'LogFile' package variable to NULL.
  --    (b) Make sure that the MAX_INDEX_MEMORY parameter is at least
  --        128M. Other change the package variable 'IndexMemory'
  --        appropriately
  --
  ------------

TYPE varcharset IS TABLE OF VARCHAR2(100);

-------------------------------------------------------------
-- CONSTANTS
-------------------------------------------------------------

----------------------
-- FILTERING OPTIONS
--
-- The following constants describe the kinds of filtering we may want
-- to do.
-- USE_NULL_FILTER simply sends the document over to the charset converter
-- USE_INSO_FILTER uses the IFILTER api of INSO to convert the document
--    into HTML
-- SKIP_DATA is used to completely ignore the document's contents for
-- filtering. (The document metadata is indexed, however)
----------------------

USE_NULL_FILTER            CONSTANT PLS_INTEGER := 1;
USE_INSO_FILTER            CONSTANT PLS_INTEGER := 2;
SKIP_DATA                  CONSTANT PLS_INTEGER := 3;

----------------------
-- Sync options
--
-- There are basically two mechanisms of automatic sync provided here.
-- SYNC_BY_PENDING_COUNT indicates that when the number of entries in the
--   pending queue reaches a threshold, it is time to sync up the index
-- SYNC_BY_TIME indicates that the index should be synced up at regular
--   intervals
-- SYNC_BY_PENDING_COUNT_AND_TIME is a combination of both these strategies
--
----------------------
SYNC_BY_PENDING_COUNT      CONSTANT PLS_INTEGER := 1;
SYNC_BY_TIME               CONSTANT PLS_INTEGER := 2;
SYNC_BY_PENDING_COUNT_AND_TIME CONSTANT PLS_INTEGER := 3;
SyncTimeOut                NUMBER := NULL;

-----------------------------------------------------------------------
-- CONFIGURATION SETTINGS
--
-- This section contains the default settings for the index. This
-- section should be changed as appropriate.
--
-----------------------------------------------------------------------
-- The name of the context index
IndexName         CONSTANT VARCHAR2(32) := 'XDB.XDB$CI';

-- The default memory to be used for index creation and sync
-- NOTE: This must be less than (or equal to) the MAX_INDEX_MEMORY
--       parameter
IndexMemory       CONSTANT VARCHAR2(32) := '50M';


-------------------------------------------------------------
-- SYNC OPTIONS
-------------------------------------------------------------
-- The following section describes the automatic sync policy.
-- By default, the auto-sync policy (once it has been configured)
-- is to sync based on the pending count.

-- Should we sync up based on pending count, or time or both ?
AutoSyncPolicy             PLS_INTEGER := SYNC_BY_PENDING_COUNT;

-- This parameter determines the maximum size of the pending queue
--   before the index is sync-ed. Applies only when the sync policy
--   is SYNC_BY_PENDING_COUNT or SYNC_BY_TIME_AND_PENDING_COUNT
--
MaxPendingCount            PLS_INTEGER := 2;

-- This parameter determines the interval - in minutes - at
-- which the "regular" sync should be performed on the index.
-- Applies only to the SYNC_BY_TIME and the SYNC_BY_PENDING_COUNT_AND_TIME
-- policies
SyncInterval               PLS_INTEGER := 60;

--
-- This parameter determines how frequently - in minutes - the pending
-- queue is polled. Applies only to the SYNC_BY_PENDING_COUNT
-- (and the SYNC_BY_PENDING_COUNT_AND_TIME) policies
--
CheckPendingCountInterval  PLS_INTEGER := 10;

----------------------------------------------------
-- LOGGING OPTIONS
--
-- Please ensure that the LOG_DIRECTORY parameter is
-- already set if you need rowid logging
----------------------------------------------------
--
-- Logging options. This parameter determines the logfile used - for
-- rowid logging during index creation etc.
-- Set this parameter to NULL to avoid rowid-logging
-- bug 16733810: by default, logging should be disallowed;
--   however, in createIndex, empty-string LogFile does not turn off
--   the logging. We should set the default value to NULL.
--   A user has to set the right logFile variable and LOG_DIRECTORY
--   parameter to enable log.
--
LogFile                    VARCHAR2(32) := NULL;

-------------------------------------
-- FILTER OPTIONS
--
-- The following classes determine the filtering options based on the
-- mime type of the document
--
-- The skipFilter_Types list contains a list of regular expressions
-- that describe mime types for which the document is *not* to be
-- filtered/indexed. (The document metadata, however, is still indexed)
-- Use this for document types that cannot really be indexed. Good
-- examples of this class are images, audio files etc
--
-- The NullFilter_Types list contains a list of regular expressions
-- that describe mime types of documents for which no INSO filtering
-- is required - these documents should be basically text formats
-- and the only filtering required should be character set conversion
-- (if needed)
--
-- For any given document, the skipFilter_Types list is first scanned
-- to determine if any regular expression in that list matches the
-- document's content type. If it does, then the document content is
-- not indexed.
-- Failing this, the NullFilter_Types list is then scanned. If any
-- regular expression in this list matches the document's content type,
-- the document is sent through character-set conversion
-- failing this, the document is filtered using the INSO filter (using the
-- IFILTER interfaces)
-------------------------------------
SkipFilter_Types varcharset := varcharset('image/%', 'audio/%', 'video/%',
                                          'model/%');
NullFilter_Types varcharset := varcharset('%text/plain', '%text/html',
                                          '%text/xml');

-------------------------------------
-- STOPWORD Settings
--
-- This list describes the set of stopwords over and above that
-- specified by the CTXSYS.DEFAULT_STOPLIST stoplist
--
-------------------------------------
StopWords        varcharset := varcharset('0','1','2','3','4','5','6',
                                          '7','8','9',
                                          'a','b','c','d','e','f','g','h','i',
                                          'j','k','l','m','n','o','p','q','r',
                                          's','t','u','v','w','x','y','z',
                                          'A','B','C','D','E','F','G','H','I',
                                          'J','K','L','M','N','O','P','Q','R',
                                          'S','T','U','V','W','X','Y','Z'
                                         );

--------------------------------------
-- LEXER preferences
--
-- This parameter determines if multi-language lexers can be
-- used.
-- Not supported currently, and this parameter should always be FALSE
--------------------------------------
UseMultiLexer   BOOLEAN := false;

--------------------------------------
-- SECTION GROUP
--
-- This parameter determines the sectioner to use.
-- By default, this is an HTML section group. No zone sections have been
-- created - (ie) WITHIN searches are not possible
-- If the vast majority of documents are XML or XML-like, consider using
-- the AUTO_SECTION_GROUP or the PATH_SECTION_GROUP or even a
-- NULL_SECTION_GROUP
--------------------------------------
SectionGroup    VARCHAR2(100) := 'HTML_SECTION_GROUP';

--------------------------------------
-- PUBLIC INTERFACES
--
-- The public APIs exposed by this package
--------------------------------------

  --
  -- This procedure drops all preferences required by the context index
  --
  PROCEDURE dropPreferences;

  --
  -- This procedure creates all preferences required by the context index
  -- on the XDB repository.
  -- The set of preferences include Datastore, Storage, Filter, Lexer,
  -- SectionGroup, Stoplist and Wordlist preferences
  -- NOTE: This will raise exceptions if any of the preferences already
  --       exist
  --
  PROCEDURE createPreferences;

  --
  -- Creates the datastore preference
  -- Will raise an exception if the datastore already exists
  PROCEDURE createDatastorePref;

  --
  -- Creates the storage preferences
  -- Will raise an exception if the preference already exists
  --
  PROCEDURE createStoragePref;

  --
  -- Creates the section group
  -- Will raise an exception if the preference already exists
  --
  PROCEDURE createSectiongroupPref;

  --
  -- Creates the filter preference
  -- Will raise an exception if the preference already exists
  --
  PROCEDURE createFilterPref;

  --
  -- Creates the lexer preference
  -- Will raise an exception if the preference already exists
  --
  PROCEDURE createLexerPref;

  --
  -- Creates the stoplist
  -- Will raise an exception if the preference already exists
  --
  PROCEDURE createStoplistPref;

  --
  -- Creates the wordlist
  -- Will raise an exception if the preference already exists
  --
  PROCEDURE createWordlistPref;

  --
  -- Creates the index
  -- This requires the above preferences to have already been created.
  -- (a) The LOG_DIRECTORY parameter must be set (to enable
  --     rowid logging during index creation)
  -- (b) Ensure that the memory size specified to index creation is less than
  --     the MAX_INDEX_MEMORY parameter
  --
  PROCEDURE createIndex;

  --
  -- Syncs up the index
  -- This can be used to explicitly sync up the index.
  -- The preferred mechanism is to set up automatic sync'ing with
  -- the "configureAutoSync" procedure
  --
  PROCEDURE syncIndex(myIndexName VARCHAR2 := Indexname,
                      myIndexMemory VARCHAR2 := IndexMemory);

  --
  -- Set a suggested time limit on the SYNC operation, in minutes.
  -- SYNC_INDEX will process as many documents in the queue as possible
  -- within the time limit.
  -- The maxtime value of NULL is equivalent to CTX_DDL.MAXTIME_UNLIMITED.
  --
  PROCEDURE setSyncTimeout(timeout IN INTEGER := NULL);

  --
  -- Optimizes the index
  --
  PROCEDURE optimizeIndex;

  --
  -- Configures for automatic sync of the index
  -- NOTE: The system must be configured for job queues. Also, the
  --   number of job queue processes must be non-zero
  --
  PROCEDURE configureAutoSync;

  --
  -- Procedure used by dbms_job to automatically sync up the context
  -- index
  -- Don't use this directly
  --
  PROCEDURE autoSyncJobByCount(myIndexName VARCHAR2, myMaxPendingCount NUMBER,
                               myIndexMemory VARCHAR2);
  --
  -- Procedure used by dbms_job to automatically sync up the context
  -- index
  -- Don't use this directly
  --
  PROCEDURE autoSyncJobByTime(myIndexName VARCHAR2, myIndexMemory VARCHAR2);

  --
  -- The user-datastore procedure
  -- Do *not* call this directly
  --
  PROCEDURE xdb_datastore_proc(rid IN ROWID, outlob IN OUT NOCOPY CLOB);

end dbms_xdbt;
/

GRANT EXECUTE ON "XDB"."DBMS_XMLSCHEMA" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XDBZ" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XMLDOM" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XDBRESOURCE" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XDB" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XDB_CONFIG" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XDB_REPOS" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XLSB" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XMLSCHEMA_LSB" TO PUBLIC;
GRANT EXECUTE ON "XDB"."XDB_PITRIG_PKG_01" TO PUBLIC;
GRANT EXECUTE ON "XDB"."XDB_PITRIG_PKG" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XDBUTIL_INT" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XDB_PRINT" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XDBNFS" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_CSX_INT" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XDBZ0" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XMLPARSER" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XSLPROCESSOR" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_CLOBUTIL" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XMLSCHEMA_INT" TO PUBLIC;
GRANT EXECUTE ON "XDB"."XDB_FUNCIMPL" TO PUBLIC;
GRANT EXECUTE ON "XDB"."XDB_ANCOP" TO PUBLIC;
GRANT EXECUTE ON "XDB"."XDB_RVTRIG_PKG" TO PUBLIC;
GRANT EXECUTE ON "XDB"."XDB_DLTRIG_PKG" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XDB_VERSION" TO PUBLIC;
GRANT EXECUTE ON "XDB"."XDB_PVTRIG_PKG" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XMLINDEX" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XMLINDEX0" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_RESCONFIG" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XEVENT" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XMLTRANSLATIONS" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XDB_CONSTANTS" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XMLSCHEMA_ANNOTATE" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XMLSTORAGE_MANAGE" TO PUBLIC;
GRANT EXECUTE ON "XDB"."PRVT_DBMS_MANAGE_XMLSTORAGE" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DBMS_XDB_CONTENT" TO PUBLIC;
CREATE OR REPLACE NONEDITIONABLE FUNCTION "XDB"."CONTENTSCHEMAIS" wrapped
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
8
1eb 154
7PCJFPfZ1LSmNAj4ehpET9E/1LAwg43IfyAVfC8C2v7qbnVnGARU2q2LykkxF/W8Z2XplOb8
4aSXterwtutN/Rm5QZqwEiCxwlyedMG7BXPAmMZOsUOSoSQMr+fbL/hTuTTr+amUNGr2ZJT+
cHbwtNSF6CM90MtzdkuXpjV5Aje6D4xdsund3My0V3CG82/fS2YeL3nWGXSOH49Nb+8A9QUj
kBUCK1bLgBXryIl/g/SgN37Njstg08XMhhbRsB5JczFg4Fx8YQ1s9iFa+jrjKMwCMA/w1oQZ
9oKyqrWZxcFiQHqOanfbqmoDX1jDK68l2FE9xgWWMHB5sw==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "XDB"."GET_XDB_TABLESPACE" wrapped
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
8
ed fb
2h/qaunBX7sFx0i5JhjdJGiRqSAwgwFKLcusfC9AkEIY/VlQlMbUa2IHcI8n4jvCKg7bla+i
OSyaxWC2LkhFtZi7+RW3n42oVygLU0+SfJ9zAVNMmIamX/+Cr4fC0WwXynnhacxKO7flYJi3
q/siOuCNYulRuF7MXegtVIyfpUMd+jmM21gkXq/o+yD31swFMJToiiatiYUIPfZ/iDzIYb7s
gqOGkwvF8ePtmbXjlQOeCdHJKIgPAIo=
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "XDB"."UNDER_PATH_FUNC" wrapped
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
8
49d 32f
rGbsDal492dkezaOt/8yklMr8Ugwg41ezCCDfC8Zgp0GHHvzFImy6Nxe8yioUt0JS+8FMX1e
otYKDrM2bDhpJiQ/F7bye95eHz7Airu5+M+aTBVGOhjAOQfgjAr1nUib0ghpkUrK013t9erZ
WlXGkef79D3hVMJu839GHDS19ABZ5Lm9qu70CC9NF/RCj16X4cKbPfy1zhTJpgHdtkQKcIsG
mA4+TMs1QLM07QYOSePyNvbEZ2OzfGOpT+N3P49YymsxDNEb5/hMWAx1+xrT6o8JGIK8c3t8
Fob7oVjEFCBQlguZQIlCs0QQRICGIG8qGaJGkPRy6pDSyZFKQ4Ev3yVMZBaZQshWCwcjuR43
bJ7JDFhR71JRcc/r42UG0ulCaEhwuoS1Q0Twv0Sy+fPNnOmMrtdsGc6K8ppqvZM4b+izUPUo
eQuhjjejj5V5hqMKJP0nFeFfE26WILZf/Nq3g/GzzZg+0mz042TKv22Bt0DG5c+s64vuG66/
BQZJXWl4HuU3hmH6qNnEmC6j4C3rJMn6JoHcF7J3cjKjkRtdi/JcKUV6w1hAC+LVso0N9p6/
sDWcbNVtFWl6emq8g6eUirGN0ewrucVMK84oWE2Q+WO/S7MyPMQqCARtM6hdFTynWpeLO3/o
kuNOztgf00OWfPFllWQLKi0E37qvKAtPtfdSlJtGRBcaguARuhcHLoqq/BNDspxSBRGD99BT
2w8G4BAXFPeenL6jV4vbSrJhgvQLZnZYR0svwcUqRrOl8a0EDtXBVxPeEhl5OoWHZuZVncvh
4rconfuJKhQy
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "XDB"."XDB$EXTNAME2INTNAME"
  (schemaURL IN VARCHAR2, schemaOwner IN VARCHAR2 := '')
return varchar2 authid current_user deterministic
is external name "EXT2INT_NAME" library XMLSCHEMA_LIB with context
parameters (context, schemaURL OCIString, schemaOwner OCIString,
            return INDICATOR sb4, return OCIString);
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "XDB"."XMLINDEXINSFUNC"
       return XDB.XMLIndexTab_t
authid current_user
pipelined using XDB.XMLIndexLoad_Imp_t;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "XDB"."XMLINDEXLOADFUNC" (p IN SYS_REFCURSOR,
                                                flags NUMBER)
       return XDB.XMLIndexTab_t
authid current_user
parallel_enable (partition p by ANY)
pipelined using XDB.XMLIndexLoad_Imp_t;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "XDB"."XMLROOT" (XML XMLType, PI VARCHAR2 DEFAULT NULL)
RETURN XMLType DETERMINISTIC
IS
  tempCLOB CLOB;
  tempXML XMLType;
BEGIN
  SELECT XMLParse(DOCUMENT '<?xml version="1.0" encoding="UTF-8"?>' || PI ||
                  XML.getClobVal() WELLFORMED)
    INTO tempXML
    FROM DUAL;
  RETURN tempXML;
END;
/

GRANT EXECUTE ON "XDB"."XDB$EXTNAME2INTNAME" TO PUBLIC;
GRANT EXECUTE ON "XDB"."GET_XDB_TABLESPACE" TO PUBLIC;
GRANT EXECUTE ON "XDB"."CONTENTSCHEMAIS" TO PUBLIC;
GRANT EXECUTE ON "XDB"."XMLINDEXLOADFUNC" TO PUBLIC;
GRANT EXECUTE ON "XDB"."XMLINDEXINSFUNC" TO PUBLIC;
GRANT EXECUTE ON "XDB"."XMLROOT" TO PUBLIC;
CREATE OR REPLACE NONEDITIONABLE PROCEDURE "XDB"."XDB$INITXDBSCHEMA"
 is language C name "INIT_XDBSCHEMA"
 library XMLSCHEMA_LIB;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "XDB"."XDB$PATCHUPDELETESCHEMA" wrapped
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
7
75b 2c9
PgsK4fTQHksnxgNZMRyt9YydDVwwg2NczPYFfC8ZA6qVAI7FAy/JKDw1g6lWTwuyBWXxWbdJ
szI3In5QB8uSTr9KXngIiqIxRvDwrv4pufi5ag0r4etg7zT5zj+B5KWbztL4rVX5aLx+14br
M7EdgmbqZUTXuxc10V5GRXzcK2/qTYTIG1q4bArKpn3i6Ny+6VSw+m651WuXRd0NAxOr+z5I
UOH/sQE1Bc5oIaH9UquCHb/KUy3Yfp7V3v2MVcGnr+ECRPIXZtK0T95cSrEbesK7xxToR9RX
XNqk1RuSYNNIuFuOCf1X6vp45dn6dx2N6ilXydcqKzz34VSbL0icUPTu9DrLwwjTocVNiQLl
Pp4o6FMp3maJePBxqPAyYde7UxH0sKcBRH6WAuP5ixRTWfQR3/PjHZbMUT45u9wvV8Ooq5wr
27ANeThKuAYDwEBtof4vY2xDX/3GU40rLnMoGQi/1/fyID1uYZe9t12FXrFRoCoP4InebRFc
jGET+77E2QANHCs60JPGETQN3ZyhegSB+ROaiSxuADUVbIYiPfrcFND3JEYYcm/fBBBY+wVz
o6elPjYTCw3ayY8C0YhZUC5LROtPt5TP6W+06cBxuumq1ckNVlhc3F1xgqPSoyoBrOyy0xe4
c0UPsTjnLO7Hz05D9gQcqrtg3pZq2qgA+pkY73+oA+lncpUHJHeYJi8=
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "XDB"."XDB$PATCHUPSCHEMA" wrapped
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
7
4c44 776
dL9Y7vdI5jbnsb2mxC2VcIYp+0Qwg81xBUqM3wS5MkEVH9WyWswhWAXeK8DdDMhXlBPcwAJh
BfISXt5j5Qksnd+wcHxhqDemExbv8KxzLJ21qS30BlDmn9PvpZpPqs+SCI3P+Pm70Kq8ELUe
u2Q5Ydx/kuG0LLyPVTH+hWzmukv77ST70vNKqf2pmjh+kHDkyeEfXuaJB6SjDg5zvK1mxrLf
iuGbyOmp8Bb45tN7bMo4rUMMdpLd3A7+3IDBmhTCqDWPfiy/0ru2n3OFhD7vdC+FEdOpdRz1
BGjpfGD7oT6tXYS4pq22e4qGolify/V/59PQwHmCRkbbuX9rnQ69U5OoXrt6az93bCKkPiXR
y++Otwwo6AaIZR4jh/wH35vozDx7AuIC6F3jsyC9nuhDvdaZhM2McatxHNsx9GoU8nnsg+jn
PW66evN4i1DegZjAdi7G4hSW2b5WgsnTpCck4OwqA26hOwtC4Yi0Kitk8jOmOTMNiyaJxQLN
T3sCJaP3v6fy2S6x8xOwdfDL9HHMQnrL2I7mMgoK8paBPJjW0u10UIbajtu+kWAxqy3U43VC
LBQnQlomoUh7CcxH2DIvyiKYCf/gYcr85/8ioY9A+w5EReQ1ZmaxYVkbjCae0qs2NudNbnwW
SbiiPn0RQnh1rYqM0F6SruZxlmPtzf81FLuJawJfNHJV4e6FBD/IfFrPhHBr48L1cj4LC+wF
Uf4ZrHNvNOwHcxI++mVwddq+fOzMpduxrXzoYAzVCipdhXOp2kiT7NNSGdqReBxHqRX66zqW
Tv0qdxyl3/RqKPKPS0/93UOrNw8k1rZ7t8ij3TBCEBB/IOIsjPvCXAuLbsq7bNgmTH5D4yfa
8sRnJGX0YTtNl+jZNrtytyuNHD3ZZILj7ojOfjjcuqLR63dFjLienRA8bD6ul6LaiEzegdYq
hlJevUPGe4cwRhykw4L6+ZWJmO2JNeuGY5NAZB10VCTNKUrxkbCCxZe+6tuzlvOiQ4JDo5B+
JcqWYdsett0Q5CPZTJ0G3qKZpn8VIeJW5gxHuedSf9G/nKjRV8ES9b0uvAsyU8GYd8b4WtXh
K7fC/8LItBeCh6gRWGSqIJhpjpqDIaEF78XyPcpSG0eStyvqm6bO10TMTDG+cvJ7tbQDRK8I
OMQpFpCtstWRp6NnK5BZsvMZbFn1Dp3jftWCkbXbmDa06xvLRDDuDp0H056FTlY8585A8+o2
/uZ86GyjMOgs6ZTz0pRfK7amxdbieHSnEzqAaaLvNiuj+13Ubr3kLPHawT8dez8YQd48zaoM
RTzcQ72zSaIsbmCUPb845+0S908BVYdn4USu9SKzvkVoMRdrn7m0dr8AMEAMNB552k9LzxXA
iynA7gLPR0m9AxJXSwYzm/SFTzb3c3JIhl1USCqViadEf3/k2+/RpMkRQZ1k+7RlMijNv8FM
DLfmSrIMjnBYVoV3FNtpcAgtw4S36GAv6oOOuwRw3y4AH7eJcWtumdQZrmnUdWc3180zJ6uw
Ei2HUUHbFuXrsHkakC+gXp/tV22Tiq07N1vtMoqt6SBjyOkiMOsZtTS+RVQhCg2vbdQd3AO2
1IFotCrtgyujuRs9epaHH5aMYo9yAaA8VxnszU7Zkj++wHbsNtJxU7N0feyQE8j61sZ2eBza
OtWMwrLqviOeuEsEtnsDn6a8zf+K4A0tE22WsO4THrMQF4xPuKRCsag650bY3xDHDdyBUo7e
18MczmQAYEOGGIJPGW1viSK0IbaQJfOkpyuIS8CVETt0csSzvGi0Knv84i08BCYSlboA4s/4
ogUI5KZC0giWcrgjKgCEC2kUKcgvdn+mQrb8nZ6izXQBBJ4AUXTpAmyAmZU5mlzb4AdO3lZR
3T+1Q6rZH6fY
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "XDB"."XDB_DATASTORE_PROC" (rid IN ROWID,
                                                   outlob IN OUT NOCOPY CLOB)
  AUTHID CURRENT_USER IS
BEGIN
  xdb.dbms_xdbt.xdb_datastore_proc(rid, outlob);
END;
/


ALTER FUNCTION "XDB"."XDB$EXTNAME2INTNAME"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:21'
/


ALTER FUNCTION "XDB"."GET_XDB_TABLESPACE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:34'
/


ALTER FUNCTION "XDB"."CONTENTSCHEMAIS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:39'
/


ALTER FUNCTION "XDB"."UNDER_PATH_FUNC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:39'
/


ALTER FUNCTION "XDB"."XMLINDEXLOADFUNC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:45'
/


ALTER FUNCTION "XDB"."XMLINDEXINSFUNC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:45'
/


ALTER FUNCTION "XDB"."XMLROOT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2018-10-12 12:12:11'
/


ALTER PROCEDURE "XDB"."XDB$INITXDBSCHEMA"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:21'
/


ALTER PROCEDURE "XDB"."XDB$PATCHUPSCHEMA"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:37'
/


ALTER PROCEDURE "XDB"."XDB$PATCHUPDELETESCHEMA"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:37'
/


ALTER PROCEDURE "XDB"."XDB_DATASTORE_PROC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:12:06'
/

CREATE UNIQUE INDEX "XDB"."XDB$TTSET_UNIQ" ON "XDB"."XDB$TTSET" ("TOKSUF")
  ;

CREATE INDEX "XDB"."XDB$H_INDEX_OID_I" ON "XDB"."XDB$H_INDEX" ("OID")
  ;

CREATE UNIQUE INDEX "XDB"."XDB_PK_H_LINK" ON "XDB"."XDB$H_LINK" ("PARENT_OID", "NAME")
  ;

CREATE INDEX "XDB"."XDB_H_LINK_CHILD_OID" ON "XDB"."XDB$H_LINK" ("CHILD_OID")
  ;

CREATE INDEX "XDB"."XDB$D_LINK_SOURCE_ID" ON "XDB"."XDB$D_LINK" ("SOURCE_ID")
  ;

CREATE INDEX "XDB"."XDB$D_LINK_TARGET_ID" ON "XDB"."XDB$D_LINK" ("TARGET_ID")
  ;

CREATE INDEX "XDB"."XDB$ELEMENT_PROPNUMBER" ON "XDB"."XDB$ELEMENT" ("XMLDATA"."PROPERTY"."PROP_NUMBER")
  ;

CREATE INDEX "XDB"."XDB$ELEMENT_PROPNAME" ON "XDB"."XDB$ELEMENT" ("XMLDATA"."PROPERTY"."NAME")
  ;

CREATE INDEX "XDB"."XDB$SCHEMA_URL" ON "XDB"."XDB$SCHEMA" ("XMLDATA"."SCHEMA_URL")
  ;

CREATE INDEX "XDB"."XDB$RESOURCE_ACLOID_IDX" ON "XDB"."XDB$RESOURCE" ("XMLDATA"."ACLOID")
  ;

CREATE INDEX "XDB"."XDB$NLOCKS_RAWTOKEN_IDX" ON "XDB"."XDB$NLOCKS" ("RAWTOKEN")
  ;

CREATE INDEX "XDB"."XDB$NLOCKS_CHILD_NAME_IDX" ON "XDB"."XDB$NLOCKS" ("CHILD_NAME")
  ;

CREATE INDEX "XDB"."XDB$NLOCKS_PARENT_OID_IDX" ON "XDB"."XDB$NLOCKS" ("PARENT_OID")
  ;

CREATE UNIQUE INDEX "XDB"."X$NN7UJB7VOLFE92KV0GUML7K0LVSF" ON "XDB"."X$NM7UJB7VOLFE92KV0GUML7K0LVSF" ("NMSPCURI")
  ;

CREATE UNIQUE INDEX "XDB"."X$NI7UJB7VOLFE92KV0GUML7K0LVSF" ON "XDB"."X$NM7UJB7VOLFE92KV0GUML7K0LVSF" ("ID")
  ;

CREATE INDEX "XDB"."X$QS7UJB7VOLFE92KV0GUML7K0LVSF" ON "XDB"."X$QN7UJB7VOLFE92KV0GUML7K0LVSF" ("NMSPCID")
  ;

CREATE UNIQUE INDEX "XDB"."X$QQ7UJB7VOLFE92KV0GUML7K0LVSF" ON "XDB"."X$QN7UJB7VOLFE92KV0GUML7K0LVSF" ("NMSPCID", "LOCALNAME", "FLAGS")
  ;

CREATE UNIQUE INDEX "XDB"."X$QI7UJB7VOLFE92KV0GUML7K0LVSF" ON "XDB"."X$QN7UJB7VOLFE92KV0GUML7K0LVSF" ("ID")
  ;

CREATE UNIQUE INDEX "XDB"."X$PP7UJB7VOLFE92KV0GUML7K0LVSF" ON "XDB"."X$PT7UJB7VOLFE92KV0GUML7K0LVSF" ("PATH")
  ;

CREATE UNIQUE INDEX "XDB"."X$PI7UJB7VOLFE92KV0GUML7K0LVSF" ON "XDB"."X$PT7UJB7VOLFE92KV0GUML7K0LVSF" ("ID")
  ;

CREATE UNIQUE INDEX "XDB"."SNGLEROW" ON "XDB"."XDB$DBFS_VIRTUAL_FOLDER" ("HIDDEN_DEF")
  ;

CREATE UNIQUE INDEX "XDB"."COKEY" ON "XDB"."XDB$CHECKOUTS" ("VCRUID", "WORKSPACEID")
  ;

CREATE INDEX "XDB"."XDB$CHECKOUTS_VCRUID_IDX" ON "XDB"."XDB$CHECKOUTS" ("VCRUID")
  ;

CREATE INDEX "XDB"."XDB$CHECKOUTS_WORKSPACEID_IDX" ON "XDB"."XDB$CHECKOUTS" ("WORKSPACEID")
  ;

CREATE UNIQUE INDEX "XDB"."XDB$DXPTABPK" ON "XDB"."XDB$DXPTAB" ("IDXOBJ#")
  ;

CREATE UNIQUE INDEX "XDB"."XDB$IDXPTAB" ON "XDB"."XDB$DXPTAB" ("PATHTABOBJ#")
  ;

CREATE UNIQUE INDEX "XDB"."XDB$XIDX_PART_TAB_PK" ON "XDB"."XDB$XIDX_PART_TAB" ("IDXOBJ#", "PART_NAME")
  ;

CREATE UNIQUE INDEX "XDB"."XDB$IDXPARAM" ON "XDB"."XDB$XIDX_PARAM_T" ("USERID", "PARAM_NAME")
  ;

CREATE UNIQUE INDEX "XDB"."XDB$XTABPK" ON "XDB"."XDB$XTAB" ("IDXOBJ#", "GROUPNAME", "XMLTABOBJ#")
  ;

CREATE INDEX "XDB"."XDB$IDXXTAB_1" ON "XDB"."XDB$XTAB" ("IDXOBJ#", "GROUPNAME", "PTABOBJ#")
  ;

CREATE INDEX "XDB"."XDB$IDXXTAB_2" ON "XDB"."XDB$XTAB" ("IDXOBJ#", "DEPGRPPOS", "XMLTABOBJ#")
  ;

CREATE INDEX "XDB"."XDB$IDXTABNMSP_1" ON "XDB"."XDB$XTABNMSP" ("IDXOBJ#", "GROUPNAME", "XMLTABOBJ#", "FLAGS")
  ;

CREATE INDEX "XDB"."XDB$IDXTABCOLS_1" ON "XDB"."XDB$XTABCOLS" ("IDXOBJ#", "GROUPNAME", "XMLTABOBJ#")
  ;

CREATE UNIQUE INDEX "XDB"."STATS_PK" ON "XDB"."XDB$STATS" ("XMLDATA"."RESOID")
  ;

CREATE INDEX "XDB"."XDB$COMPLEX_TYPE_SK" ON "XDB"."XDB$COMPLEX_TYPE" (SYS_OP_R2O("XMLDATA"."SEQUENCE_KID"))
  ;

CREATE INDEX "XDB"."XDB$COMPLEX_TYPE_CK" ON "XDB"."XDB$COMPLEX_TYPE" (SYS_OP_R2O("XMLDATA"."CHOICE_KID"))
  ;

CREATE INDEX "XDB"."XDB$COMPLEX_TYPE_AK" ON "XDB"."XDB$COMPLEX_TYPE" (SYS_OP_R2O("XMLDATA"."ALL_KID"))
  ;

CREATE INDEX "XDB"."XDB$ELEMENT_PS" ON "XDB"."XDB$ELEMENT" (SYS_OP_R2O("XMLDATA"."PROPERTY"."PARENT_SCHEMA"))
  ;

CREATE INDEX "XDB"."XDB$ELEMENT_PR" ON "XDB"."XDB$ELEMENT" (SYS_OP_R2O("XMLDATA"."PROPERTY"."PROPREF_REF"))
  ;

CREATE INDEX "XDB"."XDB$ELEMENT_TR" ON "XDB"."XDB$ELEMENT" (SYS_OP_R2O("XMLDATA"."PROPERTY"."TYPE_REF"))
  ;

CREATE INDEX "XDB"."XDB$ELEMENT_HER" ON "XDB"."XDB$ELEMENT" (SYS_OP_R2O("XMLDATA"."HEAD_ELEM_REF"))
  ;

CREATE UNIQUE INDEX "XDB"."XDB$RESOURCE_OID_INDEX" ON "XDB"."XDB$RESOURCE" (SYS_OP_R2O("XMLDATA"."XMLREF"))
  ;

CREATE UNIQUE INDEX "XDB"."X$PR7UJB7VOLFE92KV0GUML7K0LVSF" ON "XDB"."X$PT7UJB7VOLFE92KV0GUML7K0LVSF" (SYS_PATH_REVERSE("PATH"))
  ;

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

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "XDB"."XDB$RCLIST_V" ("RCLIST") AS
  (select rclist from xdb.xdb$root_info);

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "XDB"."XDB$ROOT_INFO_V" ("RESOURCE_ROOT",
"RCLIST",
"FTP_PORT",
"FTP_PROTOCOL",
"HTTP_PORT",
"HTTP_PROTOCOL",
"HTTP_HOST",
"HTTP2_PORT",
"HTTP2_PROTOCOL",
"HTTP2_HOST",
"NFS_PORT",
"NFS_PROTOCOL") AS
  select "RESOURCE_ROOT",
"RCLIST",
"FTP_PORT",
"FTP_PROTOCOL",
"HTTP_PORT",
"HTTP_PROTOCOL",
"HTTP_HOST",
"HTTP2_PORT",
"HTTP2_PROTOCOL",
"HTTP2_HOST",
"NFS_PORT",
"NFS_PROTOCOL" from xdb.xdb$root_info;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "XDB"."RESOURCE_VIEW" ("RES",
"ANY_PATH",
"RESID") AS
  select value(p) res, abspath(8888) any_path, sys_nc_oid$ resid
  from xdb.xdb$resource p
  where under_path(value(p), '/', 8888) = 1 ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "XDB"."PATH_VIEW" ("PATH",
"RES",
"LINK",
"RESID") AS
  select /*+ ORDERED */ t2.path path, t.res res,
      xmltype.createxml(xdb.xdb_link_type(NULL, r2.xmldata.dispname, t.name,
                        h.name, h.flags, h.parent_oid, h.child_oid,
                        decode(bitand(sys_op_rawtonum(h.flags), 1024), 1024,
                              xdb.xdb$enum_t(hextoraw('01')),
                              decode(bitand(sys_op_rawtonum(h.flags), 512), 512,
                                xdb.xdb$enum_t(hextoraw('02')),
                                xdb.xdb$enum_t(hextoraw('00'))))),
                   'http://xmlns.oracle.com/xdb/XDBStandard.xsd', 'LINK') link,
      t.resid
  from  ( select xdb.all_path(9999) paths, value(p) res, p.sys_nc_oid$ resid,
          decode(bitand(sys_op_rawtonum(p.xmldata.flags), 8388608), 8388608,
                 utl_raw.cast_to_varchar2(dbms_lob.substr(p.xmldata.xmllob, 4000)),
                 p.xmldata.dispname) name
          from xdb.xdb$resource p
          where xdb.under_path(value(p), '/', 9999)=1 ) t,
        TABLE( cast (t.paths as xdb.path_array) ) t2,
        xdb.xdb$h_link h, xdb.xdb$resource r2
   where t2.parent_oid = h.parent_oid and t2.childname = h.name and
         t2.parent_oid = r2.sys_nc_oid$;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "XDB"."DOCUMENT_LINKS" ("SOURCE_ID",
"TARGET_ID",
"TARGET_PATH",
"LINK_TYPE",
"LINK_FORM",
"SOURCE_TYPE") AS
  SELECT
dl.source_id,
dl.target_id,
dl.target_path,
decode(bitand(sys_op_rawtonum(dl.flags),1),1, 'Weak',
       decode(bitand(sys_op_rawtonum(dl.flags),2),2,'Symbolic','Hard')),
decode(bitand(sys_op_rawtonum(dl.flags),4),4, 'XInclude', 'XLink'),
decode(bitand(sys_op_rawtonum(dl.flags),8),8, 'Resource Metadata',
       'Resource Content')
from xdb.xdb$d_link dl, xdb.xdb$resource r
where dl.source_id = r.object_id
and sys_checkacl(r.xmldata.acloid, r.xmldata.ownerid,
xmltype('<privilege
      xmlns="http://xmlns.oracle.com/xdb/acl.xsd"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://xmlns.oracle.com/xdb/acl.xsd
                          http://xmlns.oracle.com/xdb/acl.xsd
                          DAV: http://xmlns.oracle.com/xdb/dav.xsd">
      <read-properties/>
      <read-contents/>
 </privilege>')) = 1;

GRANT SELECT ON "XDB"."XDB$RCLIST_V" TO PUBLIC;
GRANT SELECT ON "XDB"."XDB$ROOT_INFO_V" TO PUBLIC;
GRANT UPDATE ON "XDB"."RESOURCE_VIEW" TO PUBLIC;
GRANT DELETE ON "XDB"."RESOURCE_VIEW" TO PUBLIC;
GRANT INSERT ON "XDB"."RESOURCE_VIEW" TO PUBLIC;
GRANT SELECT ON "XDB"."RESOURCE_VIEW" TO PUBLIC;
GRANT UPDATE ON "XDB"."PATH_VIEW" TO PUBLIC;
GRANT DELETE ON "XDB"."PATH_VIEW" TO PUBLIC;
GRANT INSERT ON "XDB"."PATH_VIEW" TO PUBLIC;
GRANT SELECT ON "XDB"."PATH_VIEW" TO PUBLIC;
GRANT SELECT ON "XDB"."DOCUMENT_LINKS" TO PUBLIC;
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

CREATE BITMAP INDEX "XDB"."XDB$ELEMENT_GLOBAL" ON "XDB"."XDB$ELEMENT" ("XMLDATA"."PROPERTY"."GLOBAL")
  ;

CREATE OR REPLACE OPERATOR "XDB"."UNDER_PATH" BINDING
	("SYS"."XMLTYPE", NUMBER, VARCHAR2) RETURN NUMBER
	  WITH INDEX CONTEXT, SCAN CONTEXT "XDB"."XDBHI_IM"
	  COMPUTE ANCILLARY DATA
	   USING "XDB"."XDB_FUNCIMPL"."UNDER_PATH_FUNC",
	("SYS"."XMLTYPE", VARCHAR2) RETURN NUMBER
	  WITH INDEX CONTEXT, SCAN CONTEXT "XDB"."XDBHI_IM"
	  COMPUTE ANCILLARY DATA
	   USING "XDB"."XDB_FUNCIMPL"."UNDER_PATH_FUNC1";

CREATE OR REPLACE OPERATOR "XDB"."EQUALS_PATH" BINDING
	("SYS"."XMLTYPE", VARCHAR2) RETURN NUMBER
	  WITH INDEX CONTEXT, SCAN CONTEXT "XDB"."XDBHI_IM"
	  COMPUTE ANCILLARY DATA
	   USING "XDB"."XDB_FUNCIMPL"."EQUAL_PATH_FUNC";

CREATE OR REPLACE OPERATOR "XDB"."PATH" BINDING
	(NUMBER) RETURN VARCHAR2
	  ANCILLARY TO "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", NUMBER, VARCHAR2), "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", VARCHAR2)
	   USING "XDB"."XDB_ANCOP"."PATH_FUNC";

CREATE OR REPLACE OPERATOR "XDB"."DEPTH" BINDING
	(NUMBER) RETURN NUMBER
	  ANCILLARY TO "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", VARCHAR2), "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", NUMBER, VARCHAR2)
	   USING "XDB"."XDB_ANCOP"."DEPTH_FUNC";

CREATE OR REPLACE OPERATOR "XDB"."ABSPATH" BINDING
	(NUMBER) RETURN VARCHAR2
	  ANCILLARY TO "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", NUMBER, VARCHAR2), "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", VARCHAR2)
	   USING "XDB"."XDB_ANCOP"."ABSPATH_FUNC";

CREATE OR REPLACE OPERATOR "XDB"."ALL_PATH" BINDING
	(NUMBER) RETURN "XDB"."PATH_ARRAY"
	  ANCILLARY TO "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", NUMBER, VARCHAR2), "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", VARCHAR2)
	   USING "XDB_ANCOP"."ALLPATH_FUNC";

CREATE OR REPLACE OPERATOR "XDB"."XMLINDEX_NOOP" BINDING
	("SYS"."XMLTYPE", VARCHAR2) RETURN NUMBER
	  WITH INDEX CONTEXT, SCAN CONTEXT "XDB"."XMLINDEXMETHODS"
	   USING "XDB"."XMLINDEX_FUNCIMPL"."XMLINDEX_NOOP";

GRANT EXECUTE ON "XDB"."UNDER_PATH" TO PUBLIC;
GRANT EXECUTE ON "XDB"."EQUALS_PATH" TO PUBLIC;
GRANT EXECUTE ON "XDB"."PATH" TO PUBLIC;
GRANT EXECUTE ON "XDB"."DEPTH" TO PUBLIC;
GRANT EXECUTE ON "XDB"."ABSPATH" TO PUBLIC;
GRANT EXECUTE ON "XDB"."ALL_PATH" TO PUBLIC;
GRANT EXECUTE ON "XDB"."XMLINDEX_NOOP" TO PUBLIC;
CREATE OR REPLACE INDEXTYPE "XDB"."XDBHI_IDXTYP" FOR
	 "XDB"."EQUALS_PATH" ("SYS"."XMLTYPE", VARCHAR2),
	 "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", NUMBER, VARCHAR2),
	 "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", VARCHAR2)
	 USING "XDB"."XDBHI_IM" ;

CREATE OR REPLACE INDEXTYPE "XDB"."XMLINDEX" FOR
	 "XDB"."XMLINDEX_NOOP" ("SYS"."XMLTYPE", VARCHAR2)
	 USING "XDB"."XMLINDEXMETHODS"
	 WITHOUT ARRAY DML
	 WITH SYSTEM MANAGED STORAGE TABLES;

GRANT EXECUTE ON "XDB"."XDBHI_IDXTYP" TO PUBLIC;
GRANT EXECUTE ON "XDB"."XMLINDEX" TO PUBLIC;
CREATE INDEX "XDB"."XDBHI_IDX" ON "XDB"."XDB$RESOURCE" (OBJECT_VALUE)
   INDEXTYPE IS "XDB"."XDBHI_IDXTYP" ;

CREATE OR REPLACE NONEDITIONABLE TRIGGER "XDB"."XDBCONFIG_VALIDATE" before insert or update
on xdb.XDB$CONFIG for each row
declare
  xdoc xmltype;
begin
  xdoc := :new.sys_nc_rowinfo$;
  xmltype.schemaValidate(xdoc);
end;
/

ALTER TRIGGER "XDB"."XDBCONFIG_VALIDATE" ENABLE;
CREATE OR REPLACE NONEDITIONABLE TRIGGER "XDB"."XDB_PV_TRIG" INSTEAD OF insert or delete or update
on xdb.path_view for each row
begin
  if inserting then
    xdb.xdb_pvtrig_pkg.pvtrig_ins(:new.res, :new.link, :new.path);

    /* check that either the REF or the BLOB columns are filled, not both */
  end if;

  if deleting then
     xdb.xdb_pvtrig_pkg.pvtrig_del(:old.res, :old.link, :old.path);

    /* check if we get the correct values from two tables in a view */
  end if;

  if updating then
     xdb.xdb_pvtrig_pkg.pvtrig_upd(:old.res,    :new.res,
                               :old.link,   :new.link,
                               :old.path,   :new.path );
  end if;
end;
/

ALTER TRIGGER "XDB"."XDB_PV_TRIG" ENABLE;
CREATE OR REPLACE NONEDITIONABLE TRIGGER "XDB"."XDB_RV_TRIG" INSTEAD OF insert or delete or update
on xdb.resource_view for each row
begin
  if inserting then
    xdb_rvtrig_pkg.rvtrig_ins(:new.res, :new.any_path);


  end if;

  if deleting then
     xdb_rvtrig_pkg.rvtrig_del(:old.res, :old.any_path);


  end if;

  if updating then
     xdb_rvtrig_pkg.rvtrig_upd(:old.res,    :new.res,
                               :old.any_path,   :new.any_path );
  end if;
end;
/

ALTER TRIGGER "XDB"."XDB_RV_TRIG" ENABLE;
