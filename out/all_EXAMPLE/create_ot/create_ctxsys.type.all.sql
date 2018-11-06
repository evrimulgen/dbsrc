CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."CTX_FEEDBACK_ITEM_TYPE" AS OBJECT
(text        VARCHAR2(80),
 cardinality NUMBER,
 score       NUMBER,
 MAP MEMBER FUNCTION rank RETURN REAL,
 PRAGMA RESTRICT_REFERENCES (rank, RNDS, WNDS, RNPS, WNPS)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."TEXTINDEXMETHODS" authid current_user as object
(
   key 		RAW(4),
   objid 	RAW(4),
   tmpobjid	RAW(4),

   static function ODCIGetInterfaces(ifclist OUT sys.ODCIObjectList)
            return number,
   static function ODCIIndexCreate(ia sys.odciindexinfo, parms varchar2,
            env sys.ODCIEnv)
            return number,
   static function ODCIIndexAlter(ia sys.odciindexinfo,
                          parms in out varchar2,
                          altopt number, env sys.ODCIEnv)
            return number,
   static function ODCIIndexTruncate(ia sys.odciindexinfo,
            env sys.ODCIEnv)
            return number,
   static function ODCIIndexDrop(ia sys.odciindexinfo,
            env sys.ODCIEnv)
            return number,
   static function ODCIIndexInsert(ia sys.odciindexinfo,
			   ridlist sys.odciridlist, env sys.ODCIEnv)
            return number,

   static function ODCIIndexDelete(ia sys.odciindexinfo,
			   ridlist sys.odciridlist, env sys.ODCIEnv)
            return number,

   static function ODCIIndexUpdate(ia sys.odciindexinfo,
			   ridlist sys.odciridlist, env sys.ODCIEnv)
            return number,

   static function ODCIIndexStart(sctx in out TextIndexMethods,
                          ia sys.odciindexinfo,
                          op sys.odcipredinfo,
                          qi sys.odciqueryinfo,
                          strt number, stop number, valarg varchar2,
                          env SYS.ODCIEnv)
            return number is language C
            name "start"
            library dr$lib
            with context
            parameters(
               context,
               sctx,
               sctx INDICATOR STRUCT,
               ia,
               ia INDICATOR STRUCT,
               op,
               op INDICATOR STRUCT,
               qi,
               qi INDICATOR STRUCT,
               strt,
               strt INDICATOR,
               stop,
               stop INDICATOR,
	       valarg,
	       valarg INDICATOR,
               valarg LENGTH,
               env,
               env INDICATOR STRUCT,
               return OCINumber
            ),

   static function ODCIIndexStart(sctx in out TextIndexMethods,
                          ia sys.odciindexinfo,
                          op sys.odcipredinfo,
                          qi sys.odciqueryinfo,
                          strt number, stop number, valarg clob,
                          env SYS.ODCIEnv)
            return number is language C
            name "start_clob"
            library dr$lib
            with context
            parameters(
               context,
               sctx,
               sctx INDICATOR STRUCT,
               ia,
               ia INDICATOR STRUCT,
               op,
               op INDICATOR STRUCT,
               qi,
               qi INDICATOR STRUCT,
               strt,
               strt INDICATOR,
               stop,
               stop INDICATOR,
	       valarg,
	       valarg INDICATOR,
               env,
               env INDICATOR STRUCT,
               return OCINumber
            ),
   member function ODCIIndexFetch(nrows number,
                          rids OUT sys.odciridlist, env SYS.ODCIEnv)
            return number is language C
            name "fetch"
            library dr$lib
            with context
            parameters(
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
   member function ODCIIndexClose(env sys.ODCIEnv)
            return number is language C
            name "close"
            library dr$lib
            with context
            parameters(
               context,
               self,
               self INDICATOR STRUCT,
               env,
               env INDICATOR STRUCT,
               return OCINumber
            ),
   static function ODCIIndexGetMetaData(ia        IN  sys.odciindexinfo,
					version   IN  varchar2,
                                        new_block OUT PLS_INTEGER,
                                        env       IN  sys.ODCIEnv)
            return varchar2,
   static function ODCIIndexUtilGetTableNames(ia        IN  sys.odciindexinfo,
                                              read_only IN  PLS_INTEGER,
                                              version   IN  varchar2,
                                              context   OUT PLS_INTEGER)
            return boolean,
   static procedure ODCIIndexUtilCleanup(context IN PLS_INTEGER),
   static function ODCIIndexSplitPartition(ia         IN SYS.ODCIIndexInfo,
                                           part_name1 IN SYS.ODCIPartInfo,
                                           part_name2 IN SYS.ODCIPartInfo,
                                           parms      IN varchar2,
                                           env        IN SYS.ODCIEnv)
            return number,
   static function ODCIIndexMergePartition(ia         IN SYS.ODCIIndexInfo,
                                           part_name1 IN SYS.ODCIPartInfo,
                                           part_name2 IN SYS.ODCIPartInfo,
                                           parms      IN varchar2,
                                           env        IN SYS.ODCIEnv)
            return number,
   static function ODCIIndexExchangePartition(ia  IN SYS.ODCIIndexInfo,
                                              ia1 IN SYS.ODCIIndexInfo,
                                              env IN SYS.ODCIEnv)
            return number,
   static function ODCIIndexUpdate(ia         sys.odciindexinfo,
			           ridlist    sys.odciridlist,
                                   oldvallist sys.odcicolarrayvallist,
                                   newvallist sys.odcicolarrayvallist,
                                   env        sys.ODCIEnv)
            return number
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."TEXTOPTSTATS" authid definer as object
(
   stats_ctx RAW(4),
   static function ODCIGetInterfaces(ifclist OUT sys.ODCIObjectList)
       return number,
   static function ODCIStatsCollect(idx sys.ODCIIndexInfo,
                                    options sys.ODCIStatsOptions,
                                    statistics OUT RAW,
                                    env sys.ODCIEnv)
            return number is language C
            name "st_coll"
            library dr$lib
            with context
            parameters(
               context,
               idx,
               idx INDICATOR STRUCT,
               options,
               options INDICATOR STRUCT,
               statistics,
               statistics INDICATOR,
               statistics LENGTH,
               env,
               env     INDICATOR STRUCT,
               return OCINumber
             ),

   static function ODCIStatsDelete(idx sys.ODCIIndexInfo, statistics OUT RAW,
                                   env sys.ODCIEnv)
            return number is language C
            name "st_delv2"
            library dr$lib
            with context
            parameters(
               context,
               idx,
               idx INDICATOR STRUCT,
               statistics,
               statistics INDICATOR,
               statistics LENGTH,
               env,
               env     INDICATOR STRUCT,
               return OCINumber
            ),

   static function ODCIStatsSelectivity(pred sys.ODCIPredInfo,
                                        sel  OUT NUMBER,
                                        args sys.ODCIArgDescList,
                                        strt NUMBER,
                                        stop NUMBER,
                                        colval varchar2,
                                        valarg varchar2,
                                        env  sys.ODCIEnv)
            return number is language C
            name "st_sel"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsSelectivity(pred sys.ODCIPredInfo,
                                        sel  OUT NUMBER,
                                        args sys.ODCIArgDescList,
                                        strt NUMBER,
                                        stop NUMBER,
                                        colval varchar2,
                                        valarg clob,
                                        env  sys.ODCIEnv)
            return number is language C
            name "st_sel_clob"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsSelectivity(pred sys.ODCIPredInfo,
                                        sel  OUT NUMBER,
                                        args sys.ODCIArgDescList,
                                        strt NUMBER,
                                        stop NUMBER,
                                        colval clob,
                                        valarg varchar2,
                                        env  sys.ODCIEnv)
            return number is language C
            name "st_sel"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsSelectivity(pred sys.ODCIPredInfo,
                                        sel  OUT NUMBER,
                                        args sys.ODCIArgDescList,
                                        strt NUMBER,
                                        stop NUMBER,
                                        colval clob,
                                        valarg clob,
                                        env  sys.ODCIEnv)
            return number is language C
            name "st_sel_clob"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsSelectivity(pred sys.ODCIPredInfo,
                                        sel  OUT NUMBER,
                                        args sys.ODCIArgDescList,
                                        strt NUMBER,
                                        stop NUMBER,
                                        colval blob,
                                        valarg varchar2,
                                        env  sys.ODCIEnv)
            return number is language C
            name "st_sel"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsSelectivity(pred sys.ODCIPredInfo,
                                        sel  OUT NUMBER,
                                        args sys.ODCIArgDescList,
                                        strt NUMBER,
                                        stop NUMBER,
                                        colval blob,
                                        valarg clob,
                                        env  sys.ODCIEnv)
            return number is language C
            name "st_sel_clob"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsSelectivity(pred sys.ODCIPredInfo,
                                        sel  OUT NUMBER,
                                        args sys.ODCIArgDescList,
                                        strt NUMBER,
                                        stop NUMBER,
                                        colval bfile,
                                        valarg varchar2,
                                        env  sys.ODCIEnv)
            return number is language C
            name "st_sel"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsSelectivity(pred sys.ODCIPredInfo,
                                        sel  OUT NUMBER,
                                        args sys.ODCIArgDescList,
                                        strt NUMBER,
                                        stop NUMBER,
                                        colval bfile,
                                        valarg clob,
                                        env  sys.ODCIEnv)
            return number is language C
            name "st_sel_clob"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsSelectivity(pred sys.ODCIPredInfo,
                                        sel  OUT NUMBER,
                                        args sys.ODCIArgDescList,
                                        strt NUMBER,
                                        stop NUMBER,
                                        colval sys.xmltype,
                                        valarg varchar2,
                                        env  sys.ODCIEnv)
            return number is language C
            name "st_sel"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsSelectivity(pred sys.ODCIPredInfo,
                                        sel  OUT NUMBER,
                                        args sys.ODCIArgDescList,
                                        strt NUMBER,
                                        stop NUMBER,
                                        colval sys.xmltype,
                                        valarg clob,
                                        env  sys.ODCIEnv)
            return number is language C
            name "st_sel_clob"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsSelectivity(pred sys.ODCIPredInfo,
                                        sel  OUT NUMBER,
                                        args sys.ODCIArgDescList,
                                        strt NUMBER,
                                        stop NUMBER,
                                        colval sys.uritype,
                                        valarg varchar2,
                                        env  sys.ODCIEnv)
            return number is language C
            name "st_sel"
            library dr$lib
            with context
            parameters(
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
               colval INDICATOR STRUCT,
               valarg,
               valarg INDICATOR,
               env,
               env INDICATOR STRUCT,
               return OCINumber
             ),

   static function ODCIStatsSelectivity(pred sys.ODCIPredInfo,
                                        sel  OUT NUMBER,
                                        args sys.ODCIArgDescList,
                                        strt NUMBER,
                                        stop NUMBER,
                                        colval sys.uritype,
                                        valarg clob,
                                        env  sys.ODCIEnv)
            return number is language C
            name "st_sel_clob"
            library dr$lib
            with context
            parameters(
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
               colval INDICATOR STRUCT,
               valarg,
               valarg INDICATOR,
               env,
               env INDICATOR STRUCT,
               return OCINumber
             ),

   static function ODCIStatsFunctionCost(func sys.ODCIFuncinfo,
                                         cost IN OUT sys.ODCICost,
                                         args sys.ODCIArgDescList,
                                         colval varchar2,
                                         valarg varchar2,
                                         env  sys.ODCIEnv)
            return number is language C
            name "st_fcost"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsFunctionCost(func sys.ODCIFuncinfo,
                                         cost IN OUT sys.ODCICost,
                                         args sys.ODCIArgDescList,
                                         colval varchar2,
                                         valarg clob,
                                         env  sys.ODCIEnv)
            return number is language C
            name "st_fcost_clob"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsFunctionCost(func sys.ODCIFuncinfo,
                                         cost IN OUT sys.ODCICost,
                                         args sys.ODCIArgDescList,
                                         colval clob,
                                         valarg varchar2,
                                         env  sys.ODCIEnv)
            return number is language C
            name "st_fcost"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsFunctionCost(func sys.ODCIFuncinfo,
                                         cost IN OUT sys.ODCICost,
                                         args sys.ODCIArgDescList,
                                         colval clob,
                                         valarg clob,
                                         env  sys.ODCIEnv)
            return number is language C
            name "st_fcost_clob"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsFunctionCost(func sys.ODCIFuncinfo,
                                         cost IN OUT sys.ODCICost,
                                         args sys.ODCIArgDescList,
                                         colval blob,
                                         valarg varchar2,
                                         env  sys.ODCIEnv)
            return number is language C
            name "st_fcost"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsFunctionCost(func sys.ODCIFuncinfo,
                                         cost IN OUT sys.ODCICost,
                                         args sys.ODCIArgDescList,
                                         colval blob,
                                         valarg clob,
                                         env  sys.ODCIEnv)
            return number is language C
            name "st_fcost_clob"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsFunctionCost(func sys.ODCIFuncinfo,
                                         cost IN OUT sys.ODCICost,
                                         args sys.ODCIArgDescList,
                                         colval bfile,
                                         valarg varchar2,
                                         env  sys.ODCIEnv)
            return number is language C
            name "st_fcost"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsFunctionCost(func sys.ODCIFuncinfo,
                                         cost IN OUT sys.ODCICost,
                                         args sys.ODCIArgDescList,
                                         colval bfile,
                                         valarg clob,
                                         env  sys.ODCIEnv)
            return number is language C
            name "st_fcost_clob"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsFunctionCost(func sys.ODCIFuncinfo,
                                         cost IN OUT sys.ODCICost,
                                         args sys.ODCIArgDescList,
                                         colval sys.xmltype,
                                         valarg varchar2,
                                         env  sys.ODCIEnv)
            return number is language C
            name "st_fcost"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsFunctionCost(func sys.ODCIFuncinfo,
                                         cost IN OUT sys.ODCICost,
                                         args sys.ODCIArgDescList,
                                         colval sys.xmltype,
                                         valarg clob,
                                         env  sys.ODCIEnv)
            return number is language C
            name "st_fcost_clob"
            library dr$lib
            with context
            parameters(
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
               return OCINumber
             ),

   static function ODCIStatsFunctionCost(func sys.ODCIFuncinfo,
                                         cost IN OUT sys.ODCICost,
                                         args sys.ODCIArgDescList,
                                         colval sys.uritype,
                                         valarg varchar2,
                                         env  sys.ODCIEnv)
            return number is language C
            name "st_fcost"
            library dr$lib
            with context
            parameters(
               context,
               func,
               func INDICATOR STRUCT,
               cost,
               cost INDICATOR STRUCT,
               args,
               args INDICATOR,
               colval,
               colval INDICATOR STRUCT,
               valarg,
               valarg INDICATOR,
               env,
               env INDICATOR STRUCT,
               return OCINumber
             ),

   static function ODCIStatsFunctionCost(func sys.ODCIFuncinfo,
                                         cost IN OUT sys.ODCICost,
                                         args sys.ODCIArgDescList,
                                         colval sys.uritype,
                                         valarg clob,
                                         env  sys.ODCIEnv)
            return number is language C
            name "st_fcost_clob"
            library dr$lib
            with context
            parameters(
               context,
               func,
               func INDICATOR STRUCT,
               cost,
               cost INDICATOR STRUCT,
               args,
               args INDICATOR,
               colval,
               colval INDICATOR STRUCT,
               valarg,
               valarg INDICATOR,
               env,
               env INDICATOR STRUCT,
               return OCINumber
             ),

   static function ODCIStatsIndexCost(idx sys.ODCIIndexInfo,
                                      sel NUMBER,
                                      cost IN OUT sys.ODCICost,
                                      qi sys.ODCIQueryInfo,
                                      pred sys.ODCIPredInfo,
                                      args sys.ODCIArgDescList,
                                      strt NUMBER,
                                      stop NUMBER,
                                      valarg varchar2,
                                      env  sys.ODCIEnv)
            return number is language C
            name "st_icost"
            library dr$lib
            with context
            parameters(
               context,
               idx,
               idx INDICATOR STRUCT,
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
               env    INDICATOR STRUCT,
               return OCINumber
             ),

   static function ODCIStatsIndexCost(idx sys.ODCIIndexInfo,
                                      sel NUMBER,
                                      cost IN OUT sys.ODCICost,
                                      qi sys.ODCIQueryInfo,
                                      pred sys.ODCIPredInfo,
                                      args sys.ODCIArgDescList,
                                      strt NUMBER,
                                      stop NUMBER,
                                      valarg clob,
                                      env  sys.ODCIEnv)
            return number is language C
            name "st_icost_clob"
            library dr$lib
            with context
            parameters(
               context,
               idx,
               idx INDICATOR STRUCT,
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
               env    INDICATOR STRUCT,
               return OCINumber
             ),

  pragma restrict_references(ODCIStatsSelectivity, WNDS, WNPS),
  pragma restrict_references(ODCIStatsFunctionCost, WNDS, WNPS),
  pragma restrict_references(ODCIStatsIndexCost, WNDS, WNPS)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."CATINDEXMETHODS" authid current_user as object
(
   key 		RAW(4),
   objid 	RAW(4),
   tmpobjid	RAW(4),

   static function ODCIGetInterfaces(ifclist OUT sys.ODCIObjectList)
            return number,
   static function ODCIIndexCreate(ia sys.odciindexinfo, parms varchar2,
            env sys.ODCIEnv)
            return number,
   static function ODCIIndexAlter(ia sys.odciindexinfo,
                          parms in out varchar2,
                          altopt number, env sys.ODCIEnv)
            return number,
   static function ODCIIndexTruncate(ia sys.odciindexinfo,
            env sys.ODCIEnv)
            return number,
   static function ODCIIndexDrop(ia sys.odciindexinfo,
            env sys.ODCIEnv)
            return number,
   static function ODCIIndexInsert(ia sys.odciindexinfo,
			   ridlist sys.odciridlist, env sys.ODCIEnv)
             return number,
   static function ODCIIndexDelete(ia sys.odciindexinfo,
			   ridlist sys.odciridlist, env sys.ODCIEnv)
            return number,
   static function ODCIIndexUpdate(ia sys.odciindexinfo,
			   ridlist sys.odciridlist, env sys.ODCIEnv)
            return number,
   static function ODCIIndexStart(sctx in out CatIndexMethods,
                          ia sys.odciindexinfo,
                          op sys.odcipredinfo,
                          qi sys.odciqueryinfo,
                          strt number, stop number, valarg varchar2,
                          valarg2 varchar2,
                          env sys.ODCIEnv)
            return number is language C
	name "catstart"
	library dr$lib
	with context
	parameters(
               context,
               sctx,
               sctx INDICATOR STRUCT,
               ia,
               ia INDICATOR STRUCT,
               op,
               op INDICATOR STRUCT,
               qi,
               qi INDICATOR STRUCT,
               strt,
               strt INDICATOR,
               stop,
               stop INDICATOR,
	       valarg,
	       valarg INDICATOR,
               valarg LENGTH,
	       valarg2,
	       valarg2 INDICATOR,
               valarg2 LENGTH,
               env,
               env INDICATOR STRUCT,
               return OCINumber
            ),
   static function ODCIIndexStart(sctx in out CatIndexMethods,
                          ia sys.odciindexinfo,
                          op sys.odcipredinfo,
                          qi sys.odciqueryinfo,
                          strt number, stop number, valarg clob,
                          valarg2 varchar2,
                          env sys.ODCIEnv)
            return number is language C
	name "catstart_clob"
	library dr$lib
	with context
	parameters(
               context,
               sctx,
               sctx INDICATOR STRUCT,
               ia,
               ia INDICATOR STRUCT,
               op,
               op INDICATOR STRUCT,
               qi,
               qi INDICATOR STRUCT,
               strt,
               strt INDICATOR,
               stop,
               stop INDICATOR,
	       valarg,
	       valarg INDICATOR,
	       valarg2,
	       valarg2 INDICATOR,
               valarg2 LENGTH,
               env,
               env INDICATOR STRUCT,
               return OCINumber
            ),
   member function ODCIIndexFetch(nrows number,
                          rids OUT sys.odciridlist, env SYS.ODCIEnv)
            return number is language C
            name "catfetch"
            library dr$lib
            with context
            parameters(
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
   member function ODCIIndexClose(env sys.ODCIEnv)
            return number is language C
            name "catclose"
            library dr$lib
            with context
            parameters(
               context,
               self,
               self INDICATOR STRUCT,
               env,
               env INDICATOR STRUCT,
               return OCINumber
            ),
   static function ODCIIndexGetMetaData(ia        IN  sys.odciindexinfo,
					version   IN  varchar2,
                                        new_block OUT PLS_INTEGER,
                                        env       IN  sys.ODCIEnv)
            return varchar2,
   static function ODCIIndexUtilGetTableNames(ia        IN  sys.odciindexinfo,
                                              read_only IN  PLS_INTEGER,
                                              version   IN  varchar2,
                                              context   OUT PLS_INTEGER)
            return boolean,
   static procedure ODCIIndexUtilCleanup(context IN PLS_INTEGER),
   static function ODCIIndexSplitPartition(ia         IN SYS.ODCIIndexInfo,
                                           part_name1 IN SYS.ODCIPartInfo,
                                           part_name2 IN SYS.ODCIPartInfo,
                                           parms      IN varchar2,
                                           env        IN SYS.ODCIEnv)
            return number,
   static function ODCIIndexMergePartition(ia         IN SYS.ODCIIndexInfo,
                                           part_name1 IN SYS.ODCIPartInfo,
                                           part_name2 IN SYS.ODCIPartInfo,
                                           parms      IN varchar2,
                                           env        IN SYS.ODCIEnv)
            return number,
   static function ODCIIndexExchangePartition(ia  IN SYS.ODCIIndexInfo,
                                              ia1 IN SYS.ODCIIndexInfo,
                                              env IN SYS.ODCIEnv)
            return number
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."RULEINDEXMETHODS" authid current_user as object
(
   key 		RAW(4),
   objid 	RAW(4),
   tmpobjid	RAW(4),

   static function ODCIGetInterfaces(ifclist OUT sys.ODCIObjectList)
            return number,
   static function ODCIIndexCreate(ia sys.odciindexinfo, parms varchar2,
            env sys.ODCIEnv)
            return number,
   static function ODCIIndexAlter(ia sys.odciindexinfo,
                          parms in out varchar2,
                          altopt number, env sys.ODCIEnv)
            return number,
   static function ODCIIndexTruncate(ia sys.odciindexinfo,
            env sys.ODCIEnv)
            return number,
   static function ODCIIndexDrop(ia sys.odciindexinfo,
            env sys.ODCIEnv)
            return number,
   static function ODCIIndexInsert(ia sys.odciindexinfo,
			   ridlist sys.odciridlist, env sys.ODCIEnv)
            return number,

   static function ODCIIndexDelete(ia sys.odciindexinfo,
			   ridlist sys.odciridlist, env sys.ODCIEnv)
            return number,

   static function ODCIIndexUpdate(ia sys.odciindexinfo,
			   ridlist sys.odciridlist, env sys.ODCIEnv)
            return number,

   static function ODCIIndexStart(sctx in out RuleIndexMethods,
                          ia sys.odciindexinfo,
                          op sys.odcipredinfo,
                          qi sys.odciqueryinfo,
                          strt number, stop number, valarg varchar2,
                          env SYS.ODCIEnv)
            return number is language C
	name "rulestart"
	library dr$lib
	with context
	parameters(
               context,
               sctx,
               sctx INDICATOR STRUCT,
               ia,
               ia INDICATOR STRUCT,
               op,
               op INDICATOR STRUCT,
               qi,
               qi INDICATOR STRUCT,
               strt,
               strt INDICATOR,
               stop,
               stop INDICATOR,
	       valarg,
	       valarg INDICATOR,
               valarg LENGTH,
               env,
               env INDICATOR STRUCT,
               return OCINumber
            ),
	static function ODCIIndexStart(sctx in out RuleIndexMethods,
                          ia sys.odciindexinfo,
        	          op sys.odcipredinfo,
                	  qi sys.odciqueryinfo,
                          strt number, stop number, valarg clob,
                          env SYS.ODCIEnv)
            return number is language C
	name "rulecstart"
	library dr$lib
	with context
	parameters(
               context,
               sctx,
               sctx INDICATOR STRUCT,
               ia,
               ia INDICATOR STRUCT,
               op,
               op INDICATOR STRUCT,
               qi,
               qi INDICATOR STRUCT,
               strt,
               strt INDICATOR,
               stop,
               stop INDICATOR,
	       valarg,
	       valarg INDICATOR,
               env,
               env INDICATOR STRUCT,
               return OCINumber
            ),
   member function ODCIIndexFetch(nrows number,
                          rids OUT sys.odciridlist, env SYS.ODCIEnv)
            return number is language C
            name "rulefetch"
            library dr$lib
            with context
            parameters(
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
   member function ODCIIndexClose(env sys.ODCIEnv)
            return number is language C
            name "ruleclose"
            library dr$lib
            with context
            parameters(
               context,
               self,
               self INDICATOR STRUCT,
               env,
               env INDICATOR STRUCT,
               return OCINumber
            ),
   static function ODCIIndexGetMetaData(ia        IN  sys.odciindexinfo,
					version   IN  varchar2,
                                        new_block OUT PLS_INTEGER,
                                        env       IN  sys.ODCIEnv)
            return varchar2,
   static function ODCIIndexUtilGetTableNames(ia        IN  sys.odciindexinfo,
                                              read_only IN  PLS_INTEGER,
                                              version   IN  varchar2,
                                              context   OUT PLS_INTEGER)
            return boolean,
   static procedure ODCIIndexUtilCleanup(context IN PLS_INTEGER),
   static function ODCIIndexSplitPartition(ia         IN SYS.ODCIIndexInfo,
                                           part_name1 IN SYS.ODCIPartInfo,
                                           part_name2 IN SYS.ODCIPartInfo,
                                           parms      IN varchar2,
                                           env        IN SYS.ODCIEnv)
            return number,
   static function ODCIIndexMergePartition(ia         IN SYS.ODCIIndexInfo,
                                           part_name1 IN SYS.ODCIPartInfo,
                                           part_name2 IN SYS.ODCIPartInfo,
                                           parms      IN varchar2,
                                           env        IN SYS.ODCIEnv)
            return number,
   static function ODCIIndexExchangePartition(ia  IN SYS.ODCIIndexInfo,
                                              ia1 IN SYS.ODCIIndexInfo,
                                              env IN SYS.ODCIEnv)
            return number
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."XPATHINDEXMETHODS" authid current_user as object
(
   key 		RAW(4),
   objid 	RAW(4),
   tmpobjid	RAW(4),

   static function ODCIGetInterfaces(ifclist OUT sys.ODCIObjectList)
            return number,
   static function ODCIIndexCreate(ia sys.odciindexinfo, parms varchar2,
            env sys.ODCIEnv)
            return number,
   static function ODCIIndexAlter(ia sys.odciindexinfo,
                          parms in out varchar2,
                          altopt number, env sys.ODCIEnv)
            return number,
   static function ODCIIndexTruncate(ia sys.odciindexinfo,
            env sys.ODCIEnv)
            return number,
   static function ODCIIndexDrop(ia sys.odciindexinfo,
            env sys.ODCIEnv)
            return number,
   static function ODCIIndexInsert(ia sys.odciindexinfo,
			   ridlist sys.odciridlist, env sys.ODCIEnv)
            return number,
   static function ODCIIndexDelete(ia sys.odciindexinfo,
			   ridlist sys.odciridlist, env sys.ODCIEnv)
            return number,
   static function ODCIIndexUpdate(ia sys.odciindexinfo,
			   ridlist sys.odciridlist, env sys.ODCIEnv)
            return number,
   static function ODCIIndexStart(sctx in out XpathIndexMethods,
                          ia sys.odciindexinfo,
                          op sys.odcipredinfo,
                          qi sys.odciqueryinfo,
                          strt number, stop number, valarg varchar2,
                          env SYS.ODCIEnv)
            return number is language C
	name "start"
	library dr$lib
	with context
	parameters(
               context,
               sctx,
               sctx INDICATOR STRUCT,
               ia,
               ia INDICATOR STRUCT,
               op,
               op INDICATOR STRUCT,
               qi,
               qi INDICATOR STRUCT,
               strt,
               strt INDICATOR,
               stop,
               stop INDICATOR,
	       valarg,
	       valarg INDICATOR,
               valarg LENGTH,
               env,
               env INDICATOR STRUCT,
               return OCINumber
            ),
   member function ODCIIndexFetch(nrows number,
                          rids OUT sys.odciridlist, env SYS.ODCIEnv)
            return number is language C
            name "fetch"
            library dr$lib
            with context
            parameters(
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
   member function ODCIIndexClose(env sys.ODCIEnv)
            return number is language C
            name "close"
            library dr$lib
            with context
            parameters(
               context,
               self,
               self INDICATOR STRUCT,
               env,
               env INDICATOR STRUCT,
               return OCINumber
            ),
   static function ODCIIndexGetMetaData(ia        IN  sys.odciindexinfo,
					version   IN  varchar2,
                                        new_block OUT PLS_INTEGER,
                                        env       IN  sys.ODCIEnv)
            return varchar2,
   static function ODCIIndexUtilGetTableNames(ia        IN  sys.odciindexinfo,
                                              read_only IN  PLS_INTEGER,
                                              version   IN  varchar2,
                                              context   OUT PLS_INTEGER)
            return boolean,
   static procedure ODCIIndexUtilCleanup(context IN PLS_INTEGER),
   static function ODCIIndexSplitPartition(ia         IN SYS.ODCIIndexInfo,
                                           part_name1 IN SYS.ODCIPartInfo,
                                           part_name2 IN SYS.ODCIPartInfo,
                                           parms      IN varchar2,
                                           env        IN SYS.ODCIEnv)
            return number,
   static function ODCIIndexMergePartition(ia         IN SYS.ODCIIndexInfo,
                                           part_name1 IN SYS.ODCIPartInfo,
                                           part_name2 IN SYS.ODCIPartInfo,
                                           parms      IN varchar2,
                                           env        IN SYS.ODCIEnv)
            return number,
   static function ODCIIndexExchangePartition(ia  IN SYS.ODCIIndexInfo,
                                              ia1 IN SYS.ODCIIndexInfo,
                                              env IN SYS.ODCIEnv)
            return number
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."DR$NUMTABLE" as table of number;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."DR$TRC_REC" as object (
  trc_id          number,
  trc_value       number
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."CTX_CENTROID" as object (
  attribute_name varchar2(30),
  mean           number,
  mode_value     varchar2(4000),
  variance       number
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."DR$MAPDOC_T" as object(
  map_docid number,
  map_data  varchar2(4000)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."DR$SUBSTRING" as object
(
  part_1 varchar2(61),
  part_2 varchar2(64)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."DR$SUBSTRING2" as object
(
  part_1 varchar2(64),
  part_2 varchar2(64)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."CTX_FEEDBACK_TYPE" AS TABLE OF ctx_feedback_item_type
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."DR$SESSION_STATE_T" as object(
  logfile   varchar2(2000),
  logfile_overwrite number,
  dumpederrors dr$numtable,
  events    number,
  traces    number
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."DR$TRC_TAB" as table of dr$trc_rec;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."CTX_CENTROIDS" as table of ctx_centroid;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."DR$MAPDOC_SET_T" as table of dr$mapdoc_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."DR$SUBSTRING_SET" as table of dr$substring;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."DR$SUBSTRING_SET2" as table of dr$substring2;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."DR$OPTIM_STATE_T" as object(
  session_state   dr$session_state_t,
  optmode         varchar2(256),
  maxtime         varchar2(256),
  maxhash         number,
  ttype           number,
  background      number
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."DR$POPINDEX_STATE_T" as object(
  session_state   dr$session_state_t,
  opcode          varchar2(128),
  index_memory    varchar2(256),
  tstamp          varchar2(256),
  direct_path     varchar2(10),
  maxtime         varchar2(10)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "CTXSYS"."DR$CREATEINDEX_STATE_T" as object(
  session_state   dr$session_state_t,
  index_memory    number,
  populate        varchar2(1),
  import          varchar2(1),
  params          varchar2(1000)
);
/

