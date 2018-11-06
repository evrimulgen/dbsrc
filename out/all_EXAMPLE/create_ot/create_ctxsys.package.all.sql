CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIOBJ" is

  CLASS_DATASTORE                     constant number := 1;
    OBJ_DIRECT_DATASTORE              constant number := 1;
    OBJ_DETAIL_DATASTORE              constant number := 2;
    OBJ_FILE_DATASTORE                constant number := 3;
    OBJ_URL_DATASTORE                 constant number := 4;
    OBJ_USER_DATASTORE                constant number := 5;
    OBJ_NESTED_DATASTORE              constant number := 6;
    OBJ_MULTI_COLUMN_DATASTORE        constant number := 7;
  CLASS_DATATYPE                      constant number := 2;
    OBJ_LONG_DATATYPE                 constant number := 1;
    OBJ_CHAR_DATATYPE                 constant number := 2;
    OBJ_LOB_DATATYPE                  constant number := 3;
    OBJ_NONE_DATATYPE                 constant number := 4;
    OBJ_XMLTYPE_DATATYPE              constant number := 5;
    OBJ_URITYPE_DATATYPE              constant number := 6;
  CLASS_DATAX                         constant number := 3;
    OBJ_SYNCH_DATAX                   constant number := 1;
    OBJ_ASYNCH_DATAX                  constant number := 2;
  CLASS_FILTER                        constant number := 4;
    OBJ_NULL_FILTER                   constant number := 1;
    OBJ_USER_FILTER                   constant number := 2;
    OBJ_CHARSET_FILTER                constant number := 4;
    OBJ_INSO_FILTER                   constant number := 5;
    OBJ_PROCEDURE_FILTER              constant number := 6;
    OBJ_MAIL_FILTER                   constant number := 7;
    OBJ_AUTO_FILTER                   constant number := 8;
  CLASS_SECTION_GROUP                 constant number := 5;
    OBJ_NULL_SECTION_GROUP            constant number := 1;
    OBJ_BASIC_SECTION_GROUP           constant number := 2;
    OBJ_HTML_SECTION_GROUP            constant number := 3;
    OBJ_XML_SECTION_GROUP             constant number := 5;
    OBJ_NEWS_SECTION_GROUP            constant number := 6;
    OBJ_AUTO_SECTION_GROUP            constant number := 7;
    OBJ_PATH_SECTION_GROUP            constant number := 8;
    OBJ_CTXXPATH_SECTION_GROUP        constant number := 9;
  CLASS_LEXER                         constant number := 6;
    OBJ_BASIC_LEXER                   constant number := 1;
    OBJ_JAPANESE_VGRAM_LEXER          constant number := 2;
    OBJ_KOREAN_LEXER                  constant number := 3;
    OBJ_CHINESE_VGRAM_LEXER           constant number := 4;
    OBJ_CHINESE_LEXER                 constant number := 5;
    OBJ_MULTI_LEXER                   constant number := 6;
    OBJ_KOREAN_MORPH_LEXER            constant number := 7;
    OBJ_JAPANESE_LEXER                constant number := 8;
    OBJ_NULL_LEXER                    constant number := 9;
    OBJ_USER_LEXER                    constant number := 10;
    OBJ_WORLD_LEXER                   constant number := 11;
    OBJ_AUTO_LEXER                    constant number := 12;
  CLASS_WORDLIST                      constant number := 7;
    OBJ_BASIC_WORDLIST                constant number := 1;
  CLASS_STOPLIST                      constant number := 8;
    OBJ_BASIC_STOPLIST                constant number := 1;
    OBJ_MULTI_STOPLIST                constant number := 3;
  CLASS_STORAGE                       constant number := 9;
    OBJ_BASIC_STORAGE                 constant number := 1;
    OBJ_ENTITY_STORAGE                constant number := 4;
  CLASS_INDEX_SET                     constant number := 10;
    OBJ_BASIC_INDEX_SET               constant number := 1;
  CLASS_CLASSIFIER                    constant number := 12;
    OBJ_RULE_CLASSIFIER               constant number := 1;
    OBJ_SVM_CLASSIFIER                constant number := 2;
  CLASS_CLUSTERING                    constant number := 99;
    OBJ_KMEAN_CLUSTERING              constant number := 1;
    OBJ_TEXTK_CLUSTERING              constant number := 2;
  CLASS_SECTION                       constant number := 24;
    OBJ_BASIC_SECTION                 constant number := 1;
  NUM_CLASS                           constant number := 13;

end driobj;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DR_DEF" as

  -- exceptions used by all components
  textile_error  EXCEPTION;
  -- Max word length for words in stop list
  max_word_length CONSTANT NUMBER := 64;

  type NAME_TAB  is table of varchar2(60) index by binary_integer;
  type ID_TAB    is table of binary_integer index by binary_integer;

type pref_rec is record (
  pre_id             number(38)
, pre_owner          varchar2(30)
, pre_owner#         number
, pre_name           varchar2(30)
, pre_obj_id         number(38)
, pre_cla_id         number(38)
, pre_valid          char(1)
, pre_extra1         number
);

type obj_rec is record (
  obj_cla_id         number(38)
, obj_id             number(38)
, obj_name           varchar2(30)
, obj_desc           varchar2(80)
, obj_system         char(1)
);

type idx_rec is record (
  IDX_ID              NUMBER(38)
, IDX_TYPE            NUMBER
, IDX_OWNER           VARCHAR2(30)
, IDX_OWNER#          NUMBER
, IDX_NAME            VARCHAR2(30)
, IDX_TABLE_OWNER     VARCHAR2(30)
, IDX_TABLE           VARCHAR2(30)
, IDX_TABLE#          NUMBER
, IDX_KEY_NAME        VARCHAR2(256)
, IDX_KEY_TYPE        NUMBER
, IDX_TEXT_NAME       VARCHAR2(256)
, IDX_TEXT_TYPE       NUMBER
, IDX_TEXT_LENGTH     NUMBER
, IDX_DOCID_COUNT     NUMBER
, IDX_STATUS          VARCHAR2(12)
, IDX_VERSION         NUMBER
, IDX_NEXTID          NUMBER
, IDX_LANGUAGE_COLUMN VARCHAR2(256)
, IDX_FORMAT_COLUMN   VARCHAR2(256)
, IDX_CHARSET_COLUMN  VARCHAR2(256)
, IDX_CONFIG_COLUMN   VARCHAR2(256)
, IDX_OPTION          VARCHAR2(40)
, IDX_OPT_TOKEN       VARCHAR2(64)
, IDX_OPT_TYPE        NUMBER
, IDX_OPT_COUNT       NUMBER
, IDX_SYNC_TYPE       VARCHAR2(20)
, IDX_SYNC_MEMORY     VARCHAR2(100)
, IDX_SYNC_PARA_DEGREE NUMBER
, IDX_SYNC_INTERVAL   VARCHAR2(4000)
);

type ixp_rec is record (
  IXP_ID              NUMBER(38)
, IXP_NAME            VARCHAR2(30)
, IXP_IDX_ID          NUMBER
, IXP_TABLE_PARTITION VARCHAR2(30)
, IXP_DOCID_COUNT     NUMBER
, IXP_STATUS          VARCHAR2(12)
, IXP_NEXTID          NUMBER
, IXP_OPTION          VARCHAR2(40)
, IXP_OPT_TOKEN       VARCHAR2(64)
, IXP_OPT_TYPE        NUMBER
, IXP_OPT_COUNT       NUMBER
, IXP_SYNC_TYPE       VARCHAR2(20)
, IXP_SYNC_MEMORY     VARCHAR2(100)
, IXP_SYNC_PARA_DEGREE NUMBER
, IXP_SYNC_INTERVAL    VARCHAR2(4000)
);

type ixp_tab is table of ixp_rec index by binary_integer;

type sec_rec is record (
  sec_id      number,
  sec_type    number,
  sec_tname   varchar2(10),
  sec_name    varchar2(30),
  sec_tag     varchar2(256),
  sec_fid     number,
  sec_visible varchar2(1),
  sec_datatype number,
  sec_oat_id number,
  sec_readonly varchar2(1)
);

type sec_tab is table of sec_rec index by binary_integer;

type rowid_tab is table of rowid index by binary_integer;

type vc256_tab is table of varchar2(256) index by binary_integer;
type vc500_tab is table of varchar2(500) index by binary_integer;
type vc30_tab  is table of varchar2(30)  index by binary_integer;

type ixo_rec is record (
  ixo_cla_id         number,
  ixo_cla_name       varchar2(30),
  ixo_obj_id         number,
  ixo_obj_name       varchar2(30),
  ixo_acnt           number
);

type ixo_tab is table of ixo_rec index by binary_integer;

type ixv_rec is record (
  ixv_oat_name       varchar2(30),
  ixv_value          varchar2(500)
);

type ixv_tab is table of ixv_rec index by binary_integer;

type spw_rec is record (
  spw_type           varchar2(10),
  spw_language       varchar2(30),
  spw_word           varchar2(80),
  spw_pattern        varchar2(512)
);

type spw_tab is table of spw_rec index by binary_integer;

type slx_rec is record (
  slx_language       varchar2(80),
  slx_lang_abbr      varchar2(30),
  slx_alt_value      varchar2(30),
  slx_obj_name       varchar2(30),
  slx_ixv            ixv_tab
);

type slx_tab is table of slx_rec index by binary_integer;

type ixx_rec is record (
  ixx_collist        varchar2(500),
  ixx_storage        varchar2(500)
);

type ixx_tab is table of ixx_rec index by binary_integer;

type ixc_rec is record (
  ixc_cnum           binary_integer,
  ixc_cname          varchar2(256),
  ixc_ctype          varchar2(30),
  ixc_clen           varchar2(20)
);

type ixc_tab is table of ixc_rec index by binary_integer;

type cdi_rec is record (
  cdi_column_position number,
  cdi_column_name     varchar2(256),
  cdi_column_type     varchar2(30),
  cdi_column_type#    number,
  cdi_column_length   number,
  cdi_section_name    varchar2(30),
  cdi_section_type    varchar2(5),
  cdi_section_id      number,
  cdi_sort_order      varchar2(8)
);

type cdi_tab is table of cdi_rec index by binary_integer;

end dr_def;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIG" as
   INTERNAL_ERROR                constant number :=   100;
   AC_TABLE_READ                 constant number := 10000;
   AC_RESULT_TABLE               constant number := 10001;
   AC_RESULT_INSERT              constant number := 10002;
   AC_OBJ_INVALID_FMT            constant number := 10011;
   AC_INVALID_ID                 constant number := 10015;
   AC_NOT_OWNER                  constant number := 10016;
   AC_NO_OP_PRIV                 constant number := 10017;
   AG_ILLEGAL                    constant number := 10100;
   AG_VALUE_MISSING              constant number := 10101;
   AG_MISSING                    constant number := 10102;
   AG_BAD_VALUE                  constant number := 10103;
   AM_INVALID_MASK               constant number := 10200;
   AM_SERVER_ADD                 constant number := 10202;
   AM_SERVER_NOTXIST             constant number := 10203;
   AM_SERVER_UPDATE              constant number := 10204;
   AM_SERVER_DELETE              constant number := 10205;
   AM_RECOVERY                   constant number := 10206;
   CO_TIMEOUT                    constant number := 10301;
   CO_INTERRUPT                  constant number := 10302;
   CO_NOQUEUE                    constant number := 10303;
   CO_UNEXPECTED_ERROR           constant number := 10304;
   CO_PIPE_FULL                  constant number := 10305;
   CO_SERVER_DIED                constant number := 10306;
   CO_NO_SERVERS_RUNNING         constant number := 10307;
   CO_NO_PMASK_SERVERS           constant number := 10308;
   CO_PARALLEL_TOO_HIGH          constant number := 10309;
   CO_SERVERS_SHUTDOWN           constant number := 10310;
   CO_REMOTE_SEND                constant number := 10311;
   CO_LOGFILE_NULL               constant number := 10312;
   CO_LOGGING_ON                 constant number := 10313;
   CO_LOGGING_OFF                constant number := 10314;
   CO_LOGGING_MTS                constant number := 10315;
   DL_CREATE_INDEX_FAILED        constant number := 10500;
   DL_INV_STOPWORD               constant number := 10501;
   DL_POLICY_NOTXIST             constant number := 10502;
   DL_NO_PRIMARY_KEY             constant number := 10503;
   DL_MD_PK_MISSING              constant number := 10504;
   DL_TABLE_NOTXIST              constant number := 10506;
   DL_DUP_POLICY_NAME            constant number := 10507;
   DL_INV_TEXT_COLUMN            constant number := 10509;
   DL_SW_MISSING                 constant number := 10510;
   DL_INDEX_NOT_FOUND            constant number := 10511;
   DL_DIC_LOAD_PREF_FAIL         constant number := 10513;
   DL_DDL_FAILED                 constant number := 10516;
   DL_INDEX_IS_VALID             constant number := 10517;
   DL_TEXT_INDEX_BUSY            constant number := 10518;
   DL_DROP_INDEX_FAIL            constant number := 10520;
   DL_REBUILD_MISSING            constant number := 10525;
   DL_INV_TK_DATATYPE            constant number := 10528;
   DL_PARALLEL                   constant number := 10531;
   DL_NO_PARTITION               constant number := 10532;
   DL_USER_NOTXIST               constant number := 10533;
   DL_OPTIMIZE_INDEX_FAIL        constant number := 10535;
   DL_OBJ_NAME_TOO_LONG          constant number := 10549;
   DL_ILL_POL_NAME               constant number := 10550;
   DL_ILL_COL_SPEC               constant number := 10553;
   DL_INVALID_INDEX              constant number := 10561;
   DL_MISSING_PARA               constant number := 10562;
   DL_TAB_COL_NOTXIST            constant number := 10569;
   DL_TEXT_INDEX_OBS             constant number := 10573;
   DL_UPG_INDEX_FAIL             constant number := 10574;
   DL_TXT_QUERY_NULL             constant number := 10579;
   DL_NO_PARALLEL                constant number := 10580;
   DL_INV_TEXT_TYPE              constant number := 10581;
   DL_INV_COLUMN                 constant number := 10582;
   DL_TRUNC_INDEX_FAILED         constant number := 10583;
   DL_FAILED_SQL                 constant number := 10584;
   DL_ALTER_INDEX_FAILED         constant number := 10595;
   DL_NO_ALTER_ONLINE            constant number := 10597;
   DL_INVALID_PARALLEL           constant number := 10598;
   DL_COLUMN_NOT_INDEXED         constant number := 10599;
   ML_DEREGISTER                 constant number := 10601;
   ML_QUEUE                      constant number := 10602;
   ML_SERVER_DMLQ                constant number := 10606;
   ML_MD_NOT_READY               constant number := 10607;
   ML_PK_NOT_AVAILABLE           constant number := 10608;
   ML_CANNOT_ENC_PK              constant number := 10609;
   ML_UNSUPP_OPER_PL_ON          constant number := 10610;
   PF_PREF_NOTXIST               constant number := 10700;
   PF_PREF_EXISTS                constant number := 10701;
   PF_CR_PRE_NOT_PRE_OWN         constant number := 10702;
   PF_INV_FRAMEWK_OBJ            constant number := 10703;
   PF_INV_ATTRIBUTE_NAME         constant number := 10704;
   PF_INV_ATTRIBUTE_VALUE        constant number := 10705;
   PF_PARAM_TOO_LARGE            constant number := 10706;
   PF_REQUIRED_MISSING           constant number := 10707;
   PF_INV_CLASS_ID               constant number := 10708;
   PF_PREF_REFERENCED            constant number := 10709;
   PF_SAVECOPY_INVALID           constant number := 10710;
   PF_INV_SAVECOPY_ATTR          constant number := 10711;
   PF_ATTR_VAL_SET               constant number := 10712;
   PF_NO_ATTR_VAL_SET            constant number := 10713;
   PF_NO_ADD_REM_BOOL_ATTR       constant number := 10714;
   PF_ATTR_VAL_INCOMPAT          constant number := 10715;
   PF_INV_PFX_NS_MAPPING         constant number := 10716;
   PF_UNKNOWN_PARAM              constant number := 10750;
   PF_INV_PARAM_VALUE            constant number := 10751;
   PF_DEF_MAX_INDEX_MEM          constant number := 10752;
   PF_INVALID_SIZE_STR           constant number := 10753;
   PF_SIZE_RANGE                 constant number := 10754;
   PF_JOIN_COMMON_VALUE          constant number := 10755;
   PF_TEXT_THEME_FALSE           constant number := 10756;
   PF_MAX_STOPWORDS              constant number := 10757;
   PF_INVALID_ROLE               constant number := 10758;
   PF_INVALID_ROLE_NAME          constant number := 10759;
   PF_PROC_INVALID_FMT           constant number := 10760;
   PF_PROC_NOTFOUND              constant number := 10761;
   PF_PROC_NO_EXECUTE            constant number := 10762;
   PF_INV_FNAME_CHARSET          constant number := 10763;
   PF_MUST_BE_SYS                constant number := 10764;
   PF_MAX_STOPPATTERNS           constant number := 10765;
   QE_FAILED                     constant number := 10800;
   QE_SQE_NOT_OWNER              constant number := 10801;
   QE_HIGHLIGHT                  constant number := 10816;
   QE_STOPWORD                   constant number := 10817;
   QE_OPEN_CONCUR_FAILED         constant number := 10819;
   QE_INV_CONCUR_ID              constant number := 10820;
   QE_CONCUR_NOT_OPEN            constant number := 10821;
   QE_DUP_QUERY_NAME             constant number := 10822;
   QE_INV_QUERY_NAME             constant number := 10823;
   QE_SQE_NOT_AVAILABLE          constant number := 10825;
   QE_NO_DOCUMENT                constant number := 10826;
   QE_NO_CONTAINS                constant number := 10827;
   QE_FEED_TOO_LONG              constant number := 10828;
   QE_FEED_ID_TOO_LONG           constant number := 10829;
   QE_FEED_SHARE_INVALID         constant number := 10830;
   QE_FEED_TABLE_INSERT          constant number := 10831;
   QE_FEED_TABLE_DELETE          constant number := 10832;
   QE_FEEDBACK                   constant number := 10833;
   QE_SEC_TOO_LONG               constant number := 10834;
   QE_WN_THEME                   constant number := 10835;
   QE_NESTED_WN                  constant number := 10836;
   QE_INV_SECTION                constant number := 10837;
   QE_NN_INV_SPAN                constant number := 10838;
   QE_NN_INV_ORDER               constant number := 10839;
   QE_ORBY_NOT_ALLOWED           constant number := 10840;
   QE_FZ_INV_SCORE               constant number := 10841;
   QE_FZ_INV_NUMRESULTS          constant number := 10842;
   QE_FZ_INV_WEIGHT              constant number := 10843;
   QE_CATSEARCH_NOMATCH          constant number := 10844;
   QE_CATSEARCH_INVCOL           constant number := 10845;
   QE_CATSEARCH_DIFFORD          constant number := 10846;
   QE_CATSEARCH_NOPREFIX         constant number := 10847;
   QE_CATSEARCH_INVALIDOP        constant number := 10848;
   QE_CATSEARCH_FUNCINV          constant number := 10849;
   QE_CTXRULE_INVALIDOP          constant number := 10850;
   QE_TMPLT_INVGRAMMAR           constant number := 10851;
   QE_TMPLT_INVSCORETYPE         constant number := 10852;
   QE_CATSEARCH_INV_TXTOP        constant number := 10853;
   QE_TMPLT_INVSCOREALG          constant number := 10854;
   QE_CTXRULE_INVALIDTOK         constant number := 10855;
   QE_INV_SDATA_SECTION          constant number := 10856;
   QE_INV_SDATA_LITERAL          constant number := 10857;
   QE_SDATA_IN_WITHIN            constant number := 10858;
   QE_TOOMANY_PREDEF             constant number := 10859;
   QE_WITHIN_DIFF_PREDEF         constant number := 10860;
   QE_COMP_NO_WITHIN             constant number := 10861;
   QE_CTXRULE_INVALIDATTR        constant number := 10862;
   QE_ND_INV_ORDER               constant number := 10863;
   QE_ND_INV_PROX                constant number := 10864;
   QE_INV_SC_DTYPE               constant number := 10865;
   QE_IGN_R_MINUS                constant number := 10866;
   QE_OCC_COMP_ABOUT             constant number := 10867;
   QE_MATCHES_FUNCINV            constant number := 10868;
   QE_N2_INV_SPAN                constant number := 10869;
   QE_N2_INV_WEIGHT              constant number := 10870;
   QE_NDATA_UNSUPPORTED          constant number := 10871;
   QE_INV_CHARS_OUT_QY           constant number := 10872;
   QE_INV_CHARS_BETW_ELEM        constant number := 10873;
   QE_TEMPLATE_SYNTAX_ERROR      constant number := 10874;
   QE_NOT_CLOSED_TAG             constant number := 10875;
   QE_INV_ELEM_ORDER             constant number := 10876;
   QE_QRY_TAG_NOT_FOUND          constant number := 10877;
   QE_INV_ORDER                  constant number := 10878;
   QE_INV_REPEAT                 constant number := 10879;
   QE_INV_NESTING                constant number := 10880;
   QE_INV_SAVESCORE              constant number := 10881;
   QE_INV_TOPN                   constant number := 10882;
   QE_INV_SAVESCORE_TOPN         constant number := 10883;
   QE_INV_TOPN_PARENT            constant number := 10884;
   QE_INV_ZERO_FCSIZE            constant number := 10885;
   QE_INV_TOPN_ORDERBY           constant number := 10886;
   QE_INDEX_NOREAD               constant number := 10887;
   QE_NN_INV_MINREQD             constant number := 10891;
   RC_OUT_OF_MEM                 constant number := 10900;
   PA_INV_KEYWORD                constant number := 11000;
   PA_MISSING_KEYWORD            constant number := 11001;
   PA_MISSING_VALUE              constant number := 11002;
   PA_INV_VALUE                  constant number := 11003;
   PA_DUP_VALUE                  constant number := 11004;
   PA_INV_CREATE_PARM            constant number := 11005;
   PA_INV_ALTER_PARM             constant number := 11006;
   PA_MULTI_STOPWORD             constant number := 11007;
   PA_INV_PART_PARM              constant number := 11008;
   GU_CONNECT_FAIL               constant number := 11100;
   GU_OPENFILE_FAIL              constant number := 11101;
   GU_LEX_LANGUAGE               constant number := 11102;
   GU_TEXTILE_ERROR              constant number := 11104;
   GU_USER_SESSION_TERM          constant number := 11106;
   GU_INV_PATH                   constant number := 11107;
   GU_INV_FILENAME               constant number := 11108;
   GU_LEX_UNSUP_OP               constant number := 11109;
   GU_GENERIC_ERROR              constant number := 11110;
   GU_RANGE_ERROR                constant number := 11111;
   GU_LENGTH_ERROR               constant number := 11112;
   GU_LIST_ERROR                 constant number := 11113;
   GU_RESTAB_FORMAT              constant number := 11114;
   GU_REQUIRED_NULL              constant number := 11115;
   GU_LESS_THAN_EQUAL            constant number := 11116;
   GU_CREATE_EXISTS              constant number := 11117;
   GU_DOES_NOT_EXIST             constant number := 11118;
   GU_IDXTYPE_NOT_SUP            constant number := 11119;
   GU_WRITEFILE_FAIL             constant number := 11120;
   GU_READFILE_FAIL              constant number := 11121;
   GU_SECTION_UNSUP              constant number := 11122;
   GU_THEME_UNSUP                constant number := 11123;
   GU_INV_VALUE                  constant number := 11124;
   GU_NOT_LOGFILE                constant number := 11125;
   GU_EMPTY_TRAIN_TABLE          constant number := 11126;
   GU_INCONSISTENT_POLICY        constant number := 11127;
   GU_INVALID_RULE_FORMAT        constant number := 11128;
   GU_EMPTY_RULE_TABLE           constant number := 11129;
   GU_NO_FEATURE_FOUND           constant number := 11130;
   GU_XMLPARSE_ERROR             constant number := 11131;
   GU_INV_LOGFILE_CHAR           constant number := 11132;
   GU_DATETIME_CNV_ERROR         constant number := 11133;
   GU_LOGFILE_IN_USE             constant number := 11134;
   GU_NOT_GENERALLY_AVAIL        constant number := 11135;
   GU_LEX_UNSUP_ENT              constant number := 11136;
   GU_TRACE_UNSUP_MTS            constant number := 11137;
   GU_TRACE_ENABLED              constant number := 11138;
   GU_TRACE_NOT_ENABLED          constant number := 11139;
   GU_INV_MDATA_SECTION          constant number := 11140;
   GU_READONLY_MDATA             constant number := 11141;
   GU_CANNOT_BE                  constant number := 11142;
   GU_DIAG_TOO_MANY              constant number := 11143;
   GU_INVALID_RADIUS             constant number := 11144;
   GU_INVALID_MAXLEN             constant number := 11145;
   GU_INVALID_USESAVEDCOPY       constant number := 11146;
   GU_INVLD_LEX_POL_STEMS        constant number := 11147;
   GU_INVLD_LEX_POL_NP           constant number := 11148;
   GU_INVLD_LEX_POL_POS          constant number := 11149;
   GU_REV_IDX_NOT_ENAB           constant number := 11150;
   FL_INSO_NOT_AVAIL             constant number := 11203;
   FL_CMD_TOO_LONG               constant number := 11204;
   FL_CMD_ILL_CHARS              constant number := 11205;
   FL_CMD_NOT_FOUND              constant number := 11206;
   FL_CMD_EXIT_ERR               constant number := 11207;
   FL_OHM_NOT_SET                constant number := 11208;
   FL_FNAME_TOO_LONG             constant number := 11209;
   FL_INV_FMTCOL_TYPE            constant number := 11210;
   FL_INV_CSETCOL_TYPE           constant number := 11211;
   FL_PROC_INVALID_FMT           constant number := 11212;
   FL_PROC_CTXSYS_FAILED         constant number := 11213;
   FL_PROC_EXECUTE_FAILED        constant number := 11214;
   FL_PROC_ACCESS_FAILED         constant number := 11215;
   FL_DS_TOO_LONG                constant number := 11216;
   FL_SAFE_CALL_FAILED           constant number := 11217;
   FL_MAIL_INV_LINE              constant number := 11218;
   FL_MAIL_INV_CON_LINE          constant number := 11219;
   FL_INSO_MEMORY                constant number := 11220;
   FL_INSO_CORRUPTED             constant number := 11221;
   FL_INSO_UNSUPPORTED           constant number := 11222;
   FL_INSO_PROTECTED             constant number := 11223;
   FL_INSO_CREATE_WRITE          constant number := 11224;
   FL_INSO_TIMEOUT               constant number := 11225;
   FL_INSO_INIT_ERROR            constant number := 11226;
   FL_INSO_UNDETECTED            constant number := 11227;
   FL_CHARSET_BINARY             constant number := 11228;
   FL_INV_CONFIGCOL_TYPE         constant number := 11229;
   D2_PER_DOC_IDX_ERR            constant number := 11301;
   D2_WARN_PARTIAL_IDX           constant number := 11302;
   D2_UNSUP_SECONDARY            constant number := 11303;
   D2_UNSUP_FUNCTIONAL           constant number := 11304;
   D2_INDEX_INPROGRESS           constant number := 11305;
   D2_ISPOL_NOT_IDX              constant number := 11306;
   D2_ISIDX_NOT_POL              constant number := 11307;
   D2_UNSUP_COL_EXPR             constant number := 11308;
   D2_INV_FILTER_COLUMN          constant number := 11309;
   D2_INV_ORDER_COLUMN           constant number := 11310;
   D2_INV_TOKEN_OPTMODE          constant number := 11311;
   D2_POL_SAME_OWNER             constant number := 11312;
   D2_POPULATE_PART_ERR          constant number := 11313;
   D2_TRANS_UNSYNCED_ROWS        constant number := 11314;
   D2_STAB_CANNOT_CREATE         constant number := 11316;
   D2_INVALID_ROWID              constant number := 11317;
   D2_SDATA_ERROR                constant number := 11318;
   D2_OPT_REB_NOT_SUPP2          constant number := 11319;
   D2_OPT_REB_NOT_SUPP3          constant number := 11320;
   D2_OPT_REB_NOT_SUPP4          constant number := 11321;
   D2_OPT_FAST_BIG_IO            constant number := 11322;
   D2_OPT_MERGE_NOT_SUP          constant number := 11323;
   D2_OPT_FAST_SEPOFF            constant number := 11324;
   D2_NRT_NOT_SUP                constant number := 11325;
   D2_SEPOFF_NOT_SUP             constant number := 11326;
   D2_BIGIO_NOT_SUP              constant number := 11327;
   D2_OPT_VLD_FAIL               constant number := 11328;
   D2_GT_ALREADY_SET             constant number := 11332;
   D2_GT_NOT_SET                 constant number := 11333;
   D2_BI_ALREADY_SET             constant number := 11334;
   D2_BI_NOT_SET                 constant number := 11335;
   D2_SO_ALREADY_SET             constant number := 11336;
   D2_SO_NOT_SET                 constant number := 11337;
   D2_POLICY_NOTXIST             constant number := 11338;
   D2_ATAB_CANNOT_CREATE         constant number := 11339;
   D2_FTAB_CANNOT_CREATE         constant number := 11340;
   D2_OPT_TOKEN_ERR              constant number := 11341;
   D2_OPT_REB_NOT_SUPP5          constant number := 11342;
   D2_OPT_REB_NOT_SUPP6          constant number := 11343;
   D2_SPL_ITAB_NOT_SUPP1         constant number := 11344;
   D2_OPT_INTERRUPT              constant number := 11345;
   D2_FWDIDX_NOT_SUP             constant number := 11346;
   D2_FWDIDX_NOT_ENABLED         constant number := 11347;
   D2_OPT_REB_NOT_SUPP7          constant number := 11348;
   D2_FC_NOT_SUP                 constant number := 11349;
   D2_SC_NOT_SUP                 constant number := 11350;
   D2_INV_PART_ID                constant number := 11351;
   D2_INV_PART_NAME              constant number := 11352;
   D2_XML_ENABLE_NOT_SUP         constant number := 11353;
   D2_SI_NO_TARGET_SIZE          constant number := 11354;
   D2_INV_PART_POS               constant number := 11355;
   D2_OPTINDX_NOT_PERM           constant number := 11356;
   D2_FWDIDX_PART_NOT_PERM       constant number := 11357;
   D2_SC_PART_NOT_PERM           constant number := 11358;
   CT_PARSE_FAILED               constant number := 11400;
   CT_PK_TOO_LONG                constant number := 11403;
   CT_PK_IS_NULL                 constant number := 11404;
   CT_INSERT_FAILED              constant number := 11410;
   CT_PARSER_ERR                 constant number := 11418;
   CT_LING_INIT_FAILED           constant number := 11422;
   CT_INV_GIST_LVL               constant number := 11425;
   CT_VALID_GIST_LVL             constant number := 11427;
   CT_INVALID_CHARS              constant number := 11428;
   CT_LEXICON_FERR               constant number := 11432;
   CT_PK_SPEC_INVALID            constant number := 11435;
   CT_IDX_NAME_TOO_LONG          constant number := 11439;
   CT_LANG_NOT_SUPP              constant number := 11440;
   CT_INV_GIST_NPR               constant number := 11441;
   CT_VALID_GIST_NPR             constant number := 11442;
   CT_INV_GIST_MPR               constant number := 11443;
   CT_VALID_GIST_MPR             constant number := 11444;
   CT_RID_SPEC_INVALID           constant number := 11445;
   CT_COMPANION_CD               constant number := 11446;
   CT_KBTC_MEM_ERR               constant number := 11480;
   CT_LING_NOT_ENAB              constant number := 11481;
   LD_EXPCOL                     constant number := 11500;
   LD_BADCOLNM                   constant number := 11501;
   LD_READFAIL                   constant number := 11502;
   LD_STMTLEN                    constant number := 11503;
   LD_LONGLEN                    constant number := 11504;
   LD_BADLONG                    constant number := 11505;
   LD_BADROW                     constant number := 11506;
   LD_BADLONGFILE                constant number := 11507;
   LD_MISSTKN                    constant number := 11508;
   LD_BADVAL                     constant number := 11509;
   LD_BADPARSE                   constant number := 11510;
   LD_NOLONGRAW                  constant number := 11511;
   LD_TSYNTAX                    constant number := 11512;
   LD_TBADDUMP                   constant number := 11513;
   LD_PRIV_NOT_FOUND             constant number := 11514;
   LD_NOT_ENOUGH_VALUES          constant number := 11515;
   LD_NOT_IN_ROLE                constant number := 11516;
   LD_VALPOL_FAILED              constant number := 11517;
   LD_NOLONG                     constant number := 11518;
   LD_EXP_FAILED                 constant number := 11519;
   LD_WRITE_FAILED               constant number := 11520;
   LD_UPD_FAILED                 constant number := 11521;
   LD_NO_DATA                    constant number := 11522;
   LD_CANNOT_LOCK                constant number := 11523;
   LD_NO_PK                      constant number := 11524;
   LD_COMMIT                     constant number := 11525;
   LD_FNAME_TOO_LONG             constant number := 11526;
   LD_NO_TEXTEND                 constant number := 11527;
   LD_NOLONG_STRUCT              constant number := 11528;
   LD_TOK_TOOLONG                constant number := 11529;
   LD_THS_TOOLONG                constant number := 11530;
   LD_NO_TEXTSTART               constant number := 11531;
   LD_NONWHITE                   constant number := 11532;
   LD_STR_TOOLONG                constant number := 11533;
   LD_WRONG_COLNAME              constant number := 11534;
   LD_PAGE_ERROR                 constant number := 11535;
   UR_DOC_MOVED                  constant number := 11600;
   UR_BAD_SYNTAX                 constant number := 11601;
   UR_UNAUTHORIZED               constant number := 11602;
   UR_PAY_REQUIRED               constant number := 11603;
   UR_ACCESS_DENIED              constant number := 11604;
   UR_NOT_FOUND                  constant number := 11605;
   UR_REQ_TIMEOUT                constant number := 11606;
   UR_BAD_RESPONSE               constant number := 11607;
   UR_BAD_HOST                   constant number := 11608;
   UR_UNKNOWN_FILE               constant number := 11609;
   UR_FILE_BAD_READ              constant number := 11610;
   UR_UNKNOWN_PROTOCOL           constant number := 11611;
   UR_UNKNOWN_HOST               constant number := 11612;
   UR_CONNECTION_REF             constant number := 11613;
   UR_TIMED_OUT                  constant number := 11614;
   UR_WRITE_FAILED               constant number := 11615;
   UR_TOO_MANY_REDIRS            constant number := 11616;
   UR_ADDR_TOO_BIG               constant number := 11617;
   UR_DOC_TOO_BIG                constant number := 11618;
   UR_ROW_EMPTY                  constant number := 11619;
   UR_THREAD_ERR                 constant number := 11620;
   UR_SOCKET_ERR                 constant number := 11621;
   UR_UNKNOWN_HTTP_ERR           constant number := 11622;
   UR_UNKNOWN_ERR                constant number := 11623;
   UR_INVALID_ATTR               constant number := 11624;
   UR_MAX_URL_BUFFER             constant number := 11625;
   UR_UNK_PROT_REDIR             constant number := 11626;
   UR_NOT_IMPLEMENTED            constant number := 11627;
   UR_BAD_GATEWAY                constant number := 11628;
   UR_SERVICE_UNAVAILABLE        constant number := 11629;
   UR_GATEWAY_TIMEOUT            constant number := 11630;
   TH_THES_EXIST                 constant number := 11700;
   TH_THES_NOTXIST               constant number := 11701;
   TH_THES_PARSE_ERR             constant number := 11702;
   TH_THES_PRIV_INSUF            constant number := 11703;
   TH_THES_PHR_NOTXIST           constant number := 11704;
   TH_MULTILEVEL_JUMP            constant number := 11705;
   TH_INVALID_RELATION           constant number := 11706;
   TH_RELATION_LIST              constant number := 11707;
   TH_TOO_MANY                   constant number := 11708;
   TH_TOO_MANY_TERMS             constant number := 11709;
   TH_TERM_TOO_LONG              constant number := 11710;
   TH_TERM_TOO_MUCH_DATA         constant number := 11711;
   TH_MANY_BTS                   constant number := 11712;
   TH_MANY_SYN_PTS               constant number := 11713;
   TH_DIFF_BTS                   constant number := 11714;
   TH_CHANGE_KB_TREES            constant number := 11715;
   TH_NON_PT_NT                  constant number := 11716;
   TH_NON_PT_RT                  constant number := 11717;
   TH_MANY_PTS                   constant number := 11718;
   TH_BT_TOO_DEEP                constant number := 11719;
   TH_TOO_MANY_SYN               constant number := 11720;
   TH_THES_EMPTY                 constant number := 11721;
   TH_THES_INVALID_FREL          constant number := 11722;
   TH_PHRASE_NULL                constant number := 11723;
   TH_PHRASE_EXIST               constant number := 11724;
   TH_NO_SYNONYMS                constant number := 11725;
   TH_NOT_PT                     constant number := 11726;
   TH_NO_RT                      constant number := 11727;
   TH_NO_BT                      constant number := 11728;
   TH_NO_NT                      constant number := 11729;
   TH_RELATION_DNE               constant number := 11730;
   TH_TRANSLATION_DNE            constant number := 11731;
   TH_PHRASE_NOTRANS             constant number := 11732;
   TH_TOO_MANY_TRANS             constant number := 11733;
   TH_MISSING_HOMOGRAPH          constant number := 11734;
   TH_MISSING_DISAMBIG           constant number := 11735;
   TH_EXTRA_TEXT                 constant number := 11736;
   HT_CONTINUE                   constant number := 11801;
   HT_SWITCHING                  constant number := 11802;
   HT_OK                         constant number := 11803;
   HT_CREATED                    constant number := 11804;
   HT_ACCEPTED                   constant number := 11805;
   HT_NON_AUTHORITATIVE          constant number := 11806;
   HT_NO_CONTENT                 constant number := 11807;
   HT_RESET                      constant number := 11808;
   HT_PARTIAL                    constant number := 11809;
   HT_PARTIAL_OK                 constant number := 11810;
   HT_MULTIPLE                   constant number := 11811;
   HT_MOVED                      constant number := 11812;
   HT_FOUND                      constant number := 11813;
   HT_METHOD                     constant number := 11814;
   HT_NOT_MOD_ERR                constant number := 11815;
   HT_USE_PROXY                  constant number := 11816;
   HT_PROXY_REDIRECT             constant number := 11817;
   HT_TEMP_REDIRECT              constant number := 11818;
   HT_BAD_REQUEST                constant number := 11819;
   HT_UNAUTHORIZED               constant number := 11820;
   HT_PAYMENT_REQUIRED           constant number := 11821;
   HT_FORBIDDEN                  constant number := 11822;
   HT_NOT_FOUND                  constant number := 11823;
   HT_NOT_ALLOWED                constant number := 11824;
   HT_NONE_ACCEPTABLE            constant number := 11825;
   HT_PROXY_UNAUTHORIZED         constant number := 11826;
   HT_TIMEOUT                    constant number := 11827;
   HT_CONFLICT                   constant number := 11828;
   HT_GONE                       constant number := 11829;
   HT_LENGTH_REQUIRED            constant number := 11830;
   HT_PRECON_FAILED              constant number := 11831;
   HT_TOO_BIG                    constant number := 11832;
   HT_URI_TOO_BIG                constant number := 11833;
   HT_UNSUPPORTED                constant number := 11834;
   HT_BAD_RANGE                  constant number := 11835;
   HT_EXPECTION_FAILED           constant number := 11836;
   HT_REAUTH                     constant number := 11837;
   HT_PROXY_REAUTH               constant number := 11838;
   HT_INTERNAL                   constant number := 11839;
   HT_NOT_IMPLEMENTED            constant number := 11840;
   HT_BAD_GATE                   constant number := 11841;
   HT_DOWN                       constant number := 11842;
   HT_GATE_TIMEOUT               constant number := 11843;
   HT_BAD_VERSION                constant number := 11844;
   HT_NO_PARTIAL_UPDATE          constant number := 11845;
   HT_STALE                      constant number := 11846;
   HT_REVALIDATION_FAILED        constant number := 11847;
   HT_DISCONNECTED_CACHE         constant number := 11848;
   HT_HEURISTIC_EXPIRED          constant number := 11849;
   HT_TRANSFORMED                constant number := 11850;
   HT_CACHE                      constant number := 11851;
   HT_NO_REMOTE_HOST             constant number := 11852;
   HT_NO_HOST                    constant number := 11853;
   HT_NO_FILE                    constant number := 11854;
   HT_FTP_SERVER                 constant number := 11855;
   HT_FTP_NO_RESPONSE            constant number := 11856;
   HT_TIME_OUT                   constant number := 11857;
   HT_GOPHER_SERVER              constant number := 11858;
   HT_INTERRUPTED                constant number := 11859;
   HT_CON_INTR                   constant number := 11860;
   HT_CSO_SERVER                 constant number := 11861;
   HT_HTTP09                     constant number := 11862;
   HT_BAD_REPLY                  constant number := 11863;
   HT_UNKNOWN_AA                 constant number := 11864;
   HT_NEWS_SERVER                constant number := 11865;
   HT_FILE_TO_FTP                constant number := 11866;
   HT_AUTO_REDIRECT              constant number := 11867;
   HT_MAX_REDIRECT               constant number := 11868;
   HT_EOF                        constant number := 11869;
   HT_WAIS_OVERFLOW              constant number := 11870;
   HT_WAIS_MODULE                constant number := 11871;
   HT_WAIS_NO_CONNECT            constant number := 11872;
   HT_SYSTEM                     constant number := 11873;
   HT_CLASS                      constant number := 11874;
   HT_ACCESS                     constant number := 11875;
   HT_LOGIN                      constant number := 11876;
   HT_CACHE_EXPIRED              constant number := 11877;
   HT_NO_AUTO_RULES              constant number := 11878;
   HT_NO_AUTO_PROXY              constant number := 11879;
   WK_UID                        constant number := 12001;
   WK_PROXY_UID                  constant number := 12002;
   WK_FTP_UID                    constant number := 12003;
   WK_PW                         constant number := 12004;
   WK_FILENAME                   constant number := 12005;
   WK_ACCOUNT                    constant number := 12006;
   WK_METHOD                     constant number := 12007;
   WK_MOVED                      constant number := 12008;
   WK_RULES                      constant number := 12009;
   WK_FILE_REPLACE               constant number := 12010;
   WK_RETRY_AUTHENTICATE         constant number := 12011;
   WK_RETRY_PROXY_AUTH           constant number := 12012;
   WK_REDO                       constant number := 12013;
   WK_BIG_PUT                    constant number := 12014;
   WK_SOURCE_MOVED               constant number := 12015;
   WK_DESTINATION_MOVED          constant number := 12016;
   WK_REDIRECTION                constant number := 12017;
   WK_PROXY                      constant number := 12018;
   SS_SGRP_EXISTS                constant number := 12201;
   SS_CREATE_SGRP_FAILED         constant number := 12202;
   SS_SGRP_DNE                   constant number := 12203;
   SS_DROP_SGRP_FAILED           constant number := 12204;
   SS_TAG_EXISTS                 constant number := 12206;
   SS_ADD_SEC_FAILED             constant number := 12210;
   SS_SEC_NOT_EXISTS             constant number := 12211;
   SS_DROP_SEC_FAILED            constant number := 12212;
   SS_CREATE_NOT_USER            constant number := 12213;
   SS_TAG_TOO_LONG               constant number := 12217;
   SS_SGRP_NAME_MISSING          constant number := 12218;
   SS_SEC_NAME_MISSING           constant number := 12219;
   SS_TAG_MISSING                constant number := 12220;
   SS_RESERVED_NAME              constant number := 12223;
   SS_USE_CREATE_SG              constant number := 12224;
   SS_NULL_SGROUP                constant number := 12225;
   SS_DUP_FIELD_NAME             constant number := 12226;
   SS_DUP_ZONE_NAME              constant number := 12227;
   SS_MAX_FIELD_EXISTS           constant number := 12228;
   SS_DUP_SPECIAL_NAME           constant number := 12229;
   SS_INV_SPECIAL_NAME           constant number := 12230;
   SS_DUP_ATTR_NAME              constant number := 12231;
   SS_ATTR_TAG_FORMAT            constant number := 12232;
   SS_XML_COEXIST                constant number := 12233;
   SS_COLUMN_EXISTS              constant number := 12234;
   SS_DUP_SDATA_NAME             constant number := 12235;
   SS_DUP_MDATA_NAME             constant number := 12236;
   SS_DUP_COLUMN_NAME            constant number := 12237;
   SS_MAX_MDATA_EXISTS           constant number := 12238;
   SS_MAX_SDATA_EXISTS           constant number := 12239;
   SS_ORDER_BY_NOT_SDATA         constant number := 12240;
   SS_INVALID_COLUMN_NAME        constant number := 12241;
   SS_COLVAL_TOO_LONG            constant number := 12242;
   SS_INV_DATATYPE               constant number := 12243;
   SS_DATA_CONV_ERROR            constant number := 12244;
   SS_SDATA_OPERATOR_ERROR       constant number := 12245;
   SS_SDATA_OPERAND_ERROR        constant number := 12246;
   SS_MAX_NDATA_EXISTS           constant number := 12247;
   SS_DUP_NDATA_NAME             constant number := 12248;
   SS_DUP_MVDATA_NAME            constant number := 12249;
   SS_MAX_MVDATA_EXISTS          constant number := 12250;
   SS_MVDATA_XML_GROUP_UNSUP     constant number := 12251;
   SS_MVDATA_INV_ROWIDS          constant number := 12252;
   IS_ADD_IDX_EXISTS             constant number := 12300;
   IS_IDX_NOT_EXISTS             constant number := 12301;
   IS_INVALID_COLLIST            constant number := 12302;
   IS_TOO_MANY                   constant number := 12303;
   IS_ISET_NOT_EXISTS            constant number := 12304;
   IS_INV_COLUMN_TYPE            constant number := 12305;
   IS_INV_COLUMN_LENGTH          constant number := 12306;
   IS_META_COL_NULL              constant number := 12307;
   IS_USE_CREATE_IS              constant number := 12308;
   IS_NOTUSE_ATTRLOB_COMP        constant number := 12309;
   CW_TP_EMPTY_TEMPLATE          constant number := 12400;
   CW_TP_QUERY_IN_LOOP           constant number := 12401;
   CW_TP_GENERIC_ERROR           constant number := 12402;
   CW_TP_NOT_FOUND               constant number := 12403;
   CW_TP_MULTIPLE_FOUND          constant number := 12404;
   CW_TP_REDIRECT_LABEL          constant number := 12405;
   CW_TP_INV_EXEC_ATTR           constant number := 12406;
   CW_TP_INV_REPEAT_ATTR         constant number := 12407;
   CW_TP_INVALID_VAR_REF         constant number := 12408;
   CW_TP_LABEL_SYN_ERROR         constant number := 12409;
   CW_TP_PROCESS_EXEC            constant number := 12410;
   CW_TP_SQL_PROC_ERROR          constant number := 12411;
   CW_TP_INVALID_CTX_ATTR        constant number := 12412;
   CW_VC_CLIENT_WRITE            constant number := 12422;
   CW_VC_ARG_MISSING             constant number := 12430;
   CW_VC_SECTION_INVALID         constant number := 12431;
   CW_VC_CONFIG_INVALID          constant number := 12432;
   CW_VC_JDBC_INVALID            constant number := 12433;
   CW_VC_CONFIG_ERROR            constant number := 12434;
   CW_VC_HTAB_ALLOC              constant number := 12435;
   CW_VC_DTAB_ALLOC              constant number := 12436;
   CW_VC_HTAB_RELEASE            constant number := 12437;
   CW_VC_DTAB_RELEASE            constant number := 12438;
   CW_VC_HTAB_READ               constant number := 12439;
   CW_VC_DTAB_READ               constant number := 12440;
   CW_VC_HTAB_COUNT              constant number := 12441;
   SL_STOPLIST_EXISTS            constant number := 12500;
   SL_STOPLIST_NULL              constant number := 12501;
   SL_CREATE_NOT_USER            constant number := 12502;
   SL_STOPLIST_FAILED            constant number := 12503;
   SL_STOPLIST_NOT_EXISTS        constant number := 12504;
   SL_ADD_STOPWORD_FAILED        constant number := 12505;
   SL_STOPWORD_NOT_EXISTS        constant number := 12506;
   SL_STOPWORD_EXISTS            constant number := 12507;
   SL_STOPWORD_NULL              constant number := 12508;
   SL_STOPWORD_TOO_LONG          constant number := 12509;
   SL_USE_CREATE_SL              constant number := 12511;
   SL_INVALID_STOP_CLASS         constant number := 12512;
   SL_VALID_STOP_CLASSES         constant number := 12513;
   SL_MULTI_NO_LANGUAGE          constant number := 12514;
   SL_BASIC_HAS_LANGUAGE         constant number := 12515;
   SL_NO_LANGCOL                 constant number := 12516;
   SL_MULTI_STOPTHEME            constant number := 12517;
   SL_INV_MIGRATE                constant number := 12518;
   SL_MIG_MISSING_LANGCOL        constant number := 12519;
   SL_MIG_INV_LANGCOL            constant number := 12520;
   SL_VAL_SPEC_NUMCLASS          constant number := 12521;
   UD_PROC_INVALID_FMT           constant number := 12600;
   UD_PROC_INVALID_NAME          constant number := 12601;
   UD_PROC_ACCESS_FAILED         constant number := 12602;
   UD_PROC_CTXSYS_FAILED         constant number := 12603;
   UD_PROC_EXECUTE_FAILED        constant number := 12604;
   UD_MULTI_TYPE_UNSUP           constant number := 12605;
   UD_MULTI_PARSE_ERR            constant number := 12606;
   UD_MULTI_SECURE_PREF          constant number := 12607;
   BW_SEED_FAILED                constant number := 12700;
   NT_NESTED_TYPE_FAILED         constant number := 12800;
   NT_INVALID_TYPE               constant number := 12801;
   NT_INVALID_COLUMN_TYPE        constant number := 12802;
   NT_INVALID_DATA_TYPE          constant number := 12803;
   LO_STARTED                    constant number := 12900;
   RL_OP_FAILED                  constant number := 13000;
   RL_WRONG_SUB_OWNER            constant number := 13001;
   RL_LEXER_NOT_MULTI            constant number := 13002;
   RL_SUB_NOT_LEXER              constant number := 13003;
   RL_INVALID_LANGUAGE           constant number := 13004;
   RL_ALT_IS_LANGUAGE            constant number := 13005;
   RL_SUB_LEXER_DNE              constant number := 13006;
   RL_DEFAULT_ALT_VALUE          constant number := 13007;
   RL_REMOVE_DEFAULT             constant number := 13008;
   RL_NO_DEFAULT                 constant number := 13009;
   RL_DUP_ALTVAL                 constant number := 13010;
   RL_NO_LANGCOL                 constant number := 13011;
   RL_INV_LANGCOL_TYPE           constant number := 13012;
   RL_DEFAULT_LANG               constant number := 13013;
   RL_INV_LANG_SYMBOL            constant number := 13014;
   RL_DUP_SLX                    constant number := 13015;
   PT_NOT_PART_IDX               constant number := 13100;
   PT_PART_NOTXIST               constant number := 13101;
   PT_NO_PART_NAME               constant number := 13102;
   PT_PART_EXIST                 constant number := 13103;
   PT_EXCH_NOT_EQUIV             constant number := 13104;
   KL_LOAD_DICT_FAIL             constant number := 13200;
   KL_DEPL                       constant number := 13201;
   UL_DOC_TOO_BIG                constant number := 13300;
   UL_XML_SYNTAX                 constant number := 13301;
   UL_WILD_NUM                   constant number := 13302;
   UL_WILD_VAL                   constant number := 13303;
   UL_NOT_WILD                   constant number := 13304;
   UL_OFF_VAL                    constant number := 13305;
   UL_LEN_VAL                    constant number := 13306;
   UL_OFF_LEN_RANGE              constant number := 13307;
   UL_ABOUT                      constant number := 13308;
   UL_NOTSUP                     constant number := 13309;
   UL_EXECUTE_PRIV               constant number := 13310;
   UL_PROC_INVALID_FMT           constant number := 13311;
   UL_PROC_CTXSYS_OWN            constant number := 13312;
   TM_ODM_NOT_INSTALLED          constant number := 13400;
   TM_TYPE_NOTSUPP               constant number := 13401;
   RI_NOT_WITH_REPLACE           constant number := 13500;
   RI_SHADOW_EXISTS              constant number := 13501;
   RI_NO_NOPOPULATE              constant number := 13502;
   RI_NO_POPULATE                constant number := 13503;
   RI_NO_SHADOW                  constant number := 13504;
   RI_ILLEGAL_KEYWORD            constant number := 13505;
   RI_NO_SHADOW_PART             constant number := 13506;
   RI_SWAP_NOPOPU                constant number := 13507;
   RI_CANNOT_SWAP_INDEX          constant number := 13508;
   RI_ERROR_SWAP                 constant number := 13509;
   RI_NO_SHADOW2                 constant number := 13510;
   RS_DESC_SYNTAX_ERROR          constant number := 13600;
   RS_ORDER_SYNTAX_ERROR         constant number := 13601;
   RS_NUM_PARSE_ERROR            constant number := 13602;
   RS_TOO_MANY_SORTKEYS          constant number := 13603;
   RS_TOO_MANY_SELECTS           constant number := 13604;
   RS_TOO_MANY_GROUPS            constant number := 13605;
   RS_STARTHIT_INV               constant number := 13606;
   RS_ENDHIT_INV                 constant number := 13607;
   RS_NO_LOB                     constant number := 13608;
   RS_NO_QUERY                   constant number := 13609;
   RS_NO_MVDATA_GC               constant number := 13610;
   RS_NO_MVDATA_ID               constant number := 13611;
   RS_NO_PATH                    constant number := 13612;
   RS_NO_INDEX_NAME              constant number := 13613;
   RS_SEC_POLICY                 constant number := 13614;
   RS_TOO_MANY_SNIPPETS          constant number := 13615;
   RS_GVTOPN_MVDATA_ID           constant number := 13616;
   RS_GVTOPN_GEZERO              constant number := 13617;
   RS_GVTOPN_NOVALUES_INFCT      constant number := 13618;
   RS_INV_SORTBY                 constant number := 13619;
   RS_INV_ORDER                  constant number := 13620;
   RS_GRPCNT_DUP                 constant number := 13621;
   EE_DESC_SYNTAX_ERROR          constant number := 13700;
   EE_RULE_INV_ID                constant number := 13701;
   EE_RULE_NOT_FOUND             constant number := 13702;
   EE_INV_TYPE                   constant number := 13703;
   EE_TYPELIST_ERROR             constant number := 13704;
   EE_NOT_EXTRACT_POLICY         constant number := 13705;
   EE_DOCSVC_ENT_POLICY          constant number := 13706;
   EE_SRM_RULE_ENGINE            constant number := 13707;
   EE_SRM_DICT                   constant number := 13708;
   EE_INV_LANG                   constant number := 13709;
   EE_DICT_SYNTAX_ERROR          constant number := 13710;
   EE_STOPENT_NOT_FOUND          constant number := 13711;
   EE_DUPL_USER_DICT             constant number := 13712;
   EE_DICT_NOT_FOUND             constant number := 13713;
   EE_DUP_STOPENT                constant number := 13714;
   EE_NULL_STOPENT               constant number := 13715;
   EE_NO_EVENT                   constant number := 13716;
   EE_NULL_DICT_ENT              constant number := 13717;
   EE_NULL_DICT_TYPE             constant number := 13718;
   EE_UDICT_FILE_DROP            constant number := 13719;
   EE_DUP_RM_STOPENT             constant number := 13720;
   EE_TYPELIST_DUP               constant number := 13721;
   EE_INV_BACKREF                constant number := 13722;
   EE_INV_ATT                    constant number := 13723;
   EE_INV_ATTVAL                 constant number := 13724;
   EE_INV_TYPE_LEN               constant number := 13725;
   EE_INV_TAG                    constant number := 13726;
   EE_REQ_TAG                    constant number := 13727;
   EE_REQ_ATT                    constant number := 13728;
   QE_INV_MVDATA_SECTION         constant number := 13800;
   QE_INV_MVDATA_LITERAL         constant number := 13801;
   SS_MVDATA_OPERAND_ERROR       constant number := 13802;
   SS_ILL_MVDATA_ERR             constant number := 13803;
   SS_TREE_EXIST_ERROR           constant number := 13804;
   SS_TREE_INV_NODE_NAME         constant number := 13805;
   SS_TREE_DUPLICATE_PATH        constant number := 13806;
   SS_TREE_NODE_ERROR            constant number := 13807;
   SS_TREE_EMPTY_PATH            constant number := 13808;
   SS_MVDATA_BIGIO_ERROR         constant number := 13809;
   SS_TREE_MVDATA_ERROR          constant number := 13810;
   SS_TREE_INVALID_PATH          constant number := 13811;
   SS_MVDATA_BIGIO_PART_ERR      constant number := 13812;
   AO_JOB_ALREADY_STARTED        constant number := 13900;
   AO_NOT_STAGE_ITAB             constant number := 13901;
   AO_INDEX_ALREADY_ADDED        constant number := 13902;
   AO_INDEX_NOT_ADDED            constant number := 13903;
   BU_TOO_LARGE_REQ              constant number := 50000;
   CO_LSF_ERROR                  constant number := 50100;
   CO_LEM_ERROR                  constant number := 50101;
   FI_INSO_INTERNAL_ERROR        constant number := 50200;
   DP_REPLY_ERR                  constant number := 50300;
   DP_GETCMD_ERR                 constant number := 50301;
   DP_GETOOB_ERR                 constant number := 50302;
   DP_BUFOUT_ERR                 constant number := 50303;
   DP_EXECUTE_ERR                constant number := 50304;
   DP_GETCMD_NULL_QARY           constant number := 50305;
   EN_LIKE_MAX_CANDS             constant number := 50400;
   EN_LIKEFAIL                   constant number := 50401;
   EN_VALIDATE_FAIL              constant number := 50402;
   EN_VALIDATE_MVDATA_FAIL       constant number := 50403;
   CL_RULE_ONLY                  constant number := 50500;
   CL_PREF_NOT_SPEC              constant number := 50501;
   CL_NOT_RULE                   constant number := 50502;
   CL_UNSUPPORTED_METHOD         constant number := 50503;
   CL_INVALID_COL_TYPE           constant number := 50504;
   GI_ASSERT_FAIL                constant number := 50600;
   GI_FATAL_ERROR                constant number := 50601;
   GI_BAD_CODE                   constant number := 50603;
   GI_NOCOLUMN                   constant number := 50607;
   GI_EOD                        constant number := 50608;
   GI_PIPE_ERR                   constant number := 50609;
   GI_GENERIC_ERROR              constant number := 50610;
   GI_INX_ERROR                  constant number := 50611;
   GI_INT_BIND_FIRST             constant number := 50612;
   GI_INT_UNSUP_MODEL            constant number := 50613;
   GI_INT_LIBRARY_LOAD           constant number := 50614;
   GI_INX_TIMEOUT                constant number := 50615;
   GI_STOP_OPT_LIST              constant number := 50616;
   GI_STRING_TOO_LONG            constant number := 50617;
   LS_UNKNOWN_CMD                constant number := 50700;
   LS_GET_CMD                    constant number := 50701;
   LS_SLEEP_ERR                  constant number := 50702;
   LS_START_ERR                  constant number := 50703;
   LS_EXTPROC_START              constant number := 50704;
   OC_OPEN                       constant number := 50800;
   OC_PARSE                      constant number := 50801;
   OC_BIND                       constant number := 50802;
   OC_DEFINE                     constant number := 50803;
   OC_EXEC                       constant number := 50804;
   OC_CLOSE                      constant number := 50805;
   OC_ROLLBACK                   constant number := 50806;
   OC_COMMIT                     constant number := 50807;
   OC_ERROR                      constant number := 50850;
   OC_EXECSQL                    constant number := 50851;
   OC_SQL_TRACE                  constant number := 50852;
   OC_FETCH_ERROR                constant number := 50853;
   OC_LOGOFF                     constant number := 50855;
   OC_DEBUG                      constant number := 50857;
   OC_OCI_ERROR                  constant number := 50858;
   OC_STMT_HANDLE                constant number := 50859;
   OC_PREPARE                    constant number := 50860;
   OC_TYPE_DESC                  constant number := 50861;
   OC_OBJECT_NEW                 constant number := 50862;
   OC_STRING_TEXT                constant number := 50863;
   OC_NUMBER_INT                 constant number := 50864;
   OC_APPEND_COLL                constant number := 50865;
   OC_STRING_RESIZE              constant number := 50866;
   OC_OBJECT_FREE                constant number := 50867;
   OC_STMT_HNDL_FREE             constant number := 50868;
   PE_GENERIC                    constant number := 50900;
   PE_SYNTAX                     constant number := 50901;
   PE_CHAR_INV                   constant number := 50902;
   PE_WT_INV                     constant number := 50903;
   PE_WT_RANGE                   constant number := 50904;
   PE_TH_INV                     constant number := 50905;
   PE_TH_INT                     constant number := 50906;
   PE_TH_RANGE                   constant number := 50907;
   PE_MX_INV                     constant number := 50908;
   PE_MX_INT                     constant number := 50909;
   PE_MX_RANGE                   constant number := 50910;
   PE_FR_INV                     constant number := 50911;
   PE_FR_INT                     constant number := 50912;
   PE_FR_RANGE                   constant number := 50913;
   PE_LT_INV                     constant number := 50914;
   PE_LT_INT                     constant number := 50915;
   PE_LT_RANGE                   constant number := 50916;
   PE_ESC_END                    constant number := 50917;
   PE_ESC_MIS                    constant number := 50918;
   PE_NR_TYP                     constant number := 50919;
   PE_PH_TYP                     constant number := 50920;
   PE_EQ_TYP                     constant number := 50921;
   PE_PLSQL_EXE                  constant number := 50922;
   PE_PLSQL_RW                   constant number := 50923;
   PE_PLSQL_REC                  constant number := 50924;
   PE_PLSQL_PRS                  constant number := 50925;
   PE_QR_INV                     constant number := 50926;
   PE_SLAX                       constant number := 50927;
   PE_RESERVED                   constant number := 50928;
   PE_INT                        constant number := 50929;
   PE_MEM                        constant number := 50930;
   PE_NOT_BOUND                  constant number := 50931;
   PE_PREF_INIT_FAIL             constant number := 50932;
   PE_HASH_INSERT                constant number := 50933;
   PE_HASH_CRE                   constant number := 50934;
   PE_COMP_FAIL                  constant number := 50935;
   PE_COMPLEX_WORD               constant number := 50936;
   PE_COMPLEX_QUERY              constant number := 50937;
   PE_ALR_BOUND                  constant number := 50938;
   PE_NOT_SET                    constant number := 50939;
   PE_NOT_PARSE                  constant number := 50940;
   PE_PLSQL_FUNC                 constant number := 50941;
   PE_PLSQL_ERR                  constant number := 50942;
   PE_TOKEN_LEN                  constant number := 50943;
   PE_NR_THEME                   constant number := 50944;
   PE_PH_THEME                   constant number := 50945;
   PE_INV_UNARY_THEME            constant number := 50946;
   PE_ABOUT_INVALID              constant number := 50947;
   PE_ABOUT_REQUIRED             constant number := 50948;
   PE_TOO_MANY_SQE               constant number := 50949;
   PE_CIRCULAR_SQE               constant number := 50950;
   PE_NO_PARENT_TAG              constant number := 50951;
   PE_NOT_PATH_SEC_GRP           constant number := 50952;
   PE_NO_SEC                     constant number := 50953;
   PE_NEED_THEME_INDEX           constant number := 50954;
   PE_MISSING_COMMA              constant number := 50955;
   PE_NEED_THM_IDX_TRAN          constant number := 50956;
   PE_MISSING_TQ                 constant number := 50957;
   PE_MISSING_QUOTE              constant number := 50958;
   PE_QUERY_TOO_LONG             constant number := 50959;
   PE_MN_TYP                     constant number := 50960;
   PE_MISSING_CLAUSE             constant number := 50961;
   PE_OP_NOT_ALLOWED             constant number := 50962;
   WL_COMP_FAIL                  constant number := 51002;
   WL_FMBUFFER                   constant number := 51017;
   WL_FMFILE                     constant number := 51019;
   WL_FMMEMORY                   constant number := 51020;
   WL_FMOTHER                    constant number := 51021;
   WL_MLOTHER                    constant number := 51022;
   WL_MLFILE                     constant number := 51023;
   WL_MLMEMORY                   constant number := 51024;
   WL_MLCHARSET                  constant number := 51025;
   WL_FMEXPFAIL                  constant number := 51028;
   WL_STEXPFAIL                  constant number := 51029;
   WL_WC_MAXTERMS                constant number := 51030;
   UA_INVALID_ARG_INDEX          constant number := 51100;
   UA_CALLBACK_FAIL              constant number := 51101;
   KM_OPEN_KEYMAP_FAIL           constant number := 51200;
   KM_DDL_FAIL                   constant number := 51201;
   KM_INV_MODE                   constant number := 51202;
   KE_BAD_IDS_IN_BATCH           constant number := 51203;
   DM_BADLOCK                    constant number := 51300;
   DM_BADUNLOCK                  constant number := 51301;
   DM_GET_BATCH                  constant number := 51309;
   DM_BATCH_DONE                 constant number := 51310;
   DM_LOCK_EXISTS                constant number := 51311;
   DM_LOCK_ERROR                 constant number := 51312;
   DM_LOCK_TIMEOUT               constant number := 51313;
   DM_PPND_IDX_NOT_EMPTY         constant number := 51314;
   DD_NO_NEW_IDXNAME             constant number := 51403;
   IO_INVALID_SEEK               constant number := 51801;
   IO_INVALID_READ               constant number := 51802;
   IO_INVALID_OPEN               constant number := 51803;
   IO_INVALID_WRITE              constant number := 51804;
   CI_INTERNAL_ERROR             constant number := 52100;
   CI_INVALID_SESSION            constant number := 52101;
   CI_INVALID_TRANS              constant number := 52102;
   CI_REFRESH_FAILED             constant number := 52103;
   CI_INIT_FAILED                constant number := 52104;
   CI_NO_DELETE_FN               constant number := 52105;
   CI_COMMIT_FAILED              constant number := 52106;
   CI_KB_ERR                     constant number := 52107;
   CI_KB_DEL_ERR                 constant number := 52108;
   CI_KB_READ_ERR                constant number := 52109;
   CI_KB_WRITE_ERR               constant number := 52110;
   CI_GXL_ERR                    constant number := 52111;
   CI_DRLLC_ZH_ERR               constant number := 52112;
   CI_DRLLC_JA_ERR               constant number := 52113;
   CI_DRLLC_KB_WRITE             constant number := 52114;
   CI_DRLLC_TH_TERM_WRITE        constant number := 52115;
   CI_DRLLC_TERM_DONE            constant number := 52116;
   CI_DRLLC_ID_WRITE             constant number := 52117;
   CI_DRLLC_TERM_WRITE           constant number := 52118;
   CI_DRLLC_READ                 constant number := 52119;
   CI_DRLLC_READ_TERM            constant number := 52120;
   IE_EXP_INVALID_STATE          constant number := 52200;
   IE_INVALID_VERSION            constant number := 52201;
   IE_INVALID_CLASS              constant number := 52202;
   IE_INVALID_OBJECT             constant number := 52203;
   IE_CREATE_INDEX_FAILED        constant number := 52204;
   IE_DUP_INDEX_OBJECT           constant number := 52205;
   IE_SET_OBJECT_FAILED          constant number := 52206;
   IE_INVALID_ATTRIBUTE          constant number := 52207;
   IE_DUP_ATTRIBUTE              constant number := 52208;
   IE_SET_ATT_FAILED             constant number := 52210;
   IE_CREATE_PART_FAILED         constant number := 52211;
   IE_CREATE_CDI_FAILED          constant number := 52212;
   QS_IDX_NOT_EXIST              constant number := 52300;
   QS_ALREADY_ENABLED            constant number := 52301;
   QS_NOT_ENABLED                constant number := 52302;
   QS_OPTION_STR_FULL            constant number := 52303;
   QS_NEED_TO_BE_ENABLED         constant number := 52304;
   QS_INVALID_STATTYPE           constant number := 52305;
   AL_DICT_EXISTS                constant number := 52400;
   AL_LANG_INV                   constant number := 52401;
   AL_DICT_NAME_INV              constant number := 52402;
   AL_DICT_NOT_EXIST             constant number := 52403;

end drig;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIACC" AS
--
-- NAME
--   split_spec - parse a spec into distinct parts
--
-- DESCRIPTION
--   This procedure takes an object spec and splits it into parts
--
-- ARGUMENTS
--   p_spec     (IN)     - the spec
--   p_type     (IN)     - COL, TABLE, POLICY, or PROC
--   p_owner    (OUT)    - the owner name
--   p_object   (OUT)    - the object or package name
--   p_function (OUT)    - the function name
--   p_link     (OUT)    - the db link name
--
-- NOTES
--
-- RETURN
--
PROCEDURE split_spec (
  p_spec     IN VARCHAR2,
  p_type     IN VARCHAR2,
  p_owner    IN OUT VARCHAR2,
  p_object   IN OUT VARCHAR2,
  p_function IN OUT VARCHAR2,
  p_link     IN OUT VARCHAR2
);
--
--
-- NAME
--   can - test whether user can access an object
--
-- DESCRIPTION
--   This function tests whether a user can access an object.
--   if the spec passed in is a synonym reference, will also
--   transform the spec to the base object.
--
-- ARGUMENTS
--   p_user     (IN)     - the user name
--   p_access   (IN)     - what kind of access (SELECT/EXECUTE/INSERT)
--   p_spec     (IN OUT) - spec of object
--
-- NOTES
--
-- RETURN
--   true if can access, false otherwise.
--
FUNCTION can (
  p_user     IN VARCHAR2,
  p_access   IN VARCHAR2,
  p_spec     IN OUT VARCHAR2
) RETURN BOOLEAN;
--
--
-- NAME
--   can_execute - test whether user can execute a function/procedure
--
-- DESCRIPTION
--   This function tests whether a user can execute a function/procedure.
--   if the spec passed in is a synonym reference, will also
--   transform the spec to the base object.
--
-- ARGUMENTS
--   p_user     (IN)     - the user name
--   p_spec     (IN)     - spec of object
--
-- NOTES
--
-- RETURN
--   fully qualified name if can access, empty string otherwise.
--
FUNCTION can_execute (
  p_user     IN VARCHAR2,
  p_spec     IN VARCHAR2
) RETURN VARCHAR2;
--
--
-- NAME
--   verify_colspec - verify a column spec
--
-- DESCRIPTION
--   This function takes a column spec, synonym-reduces, then
--   verifies that the column exists.
--
-- ARGUMENTS
--   p_colspec  (IN)     - the column spec
--   p_owner    (OUT)    - the owner
--   p_table    (OUT)    - the table name
--   p_column   (OUT)    - the column name
--   p_dblink   (OUT)    - the database link name
--
-- NOTES
--
-- RETURN
--   true if everything checks out, false otherwise.
--
FUNCTION verify_colspec (
  p_colspec    IN     VARCHAR2,
  p_owner      IN OUT VARCHAR2,
  p_table      IN OUT VARCHAR2,
  p_column     IN OUT VARCHAR2,
  p_link       IN OUT VARCHAR2
) RETURN BOOLEAN;
--
--
-- NAME
--   verify_procedure - verify a procedure
--
-- DESCRIPTION
--   This function takes package.procedure_name or procedure_name
--   verifies that it exists and that ctxsys owns the package/procedure
--   this is called from the user datastore validation
--
-- ARGUMENTS
--   p_spec     (IN)  - package.procedure or procedure name
--
-- NOTES
--
-- RETURN
--   true if everything checks out, false otherwise.
--
FUNCTION verify_procedure (
  p_spec       IN OUT     VARCHAR2
) RETURN BOOLEAN;
--
--
--
-- NAME
--   user_in_role - does a user have a specific role?
--
-- DESCRIPTION
--   This function takes a user name and a role name and
--   returns true if the user has that role
--
-- ARGUMENTS
--   p_user     (IN)     - the user
--   p_role     (IN)     - the role name
--
-- NOTES
--
-- RETURN
--   true if everything checks out, false otherwise.
--
FUNCTION user_in_role (
  p_user       IN     VARCHAR2,
  p_role       IN     VARCHAR2
) RETURN BOOLEAN;


--
-- NAME
--   ud_access
--
-- DESCRIPTION
--   This function takes the index owner name and ensures that the
--   index owner can execute the user datastore procedure.  It is called
--   from set_store_objects
--
-- ARGUMENTS
--   p_user     (IN)     - the index owner
--   p_spec     (IN)     - the user datastore procedure name
--
-- NOTES
--   normally, would just be able to use CAN, but in this case
--   if the user datastore has just PROCEDURE, then a user with
--   package CTXSYS and procedure PROCEDURE would be able to fool CAN
--
-- RETURN
--   true if everything checks out, false otherwise.
--
FUNCTION ud_access (
  p_user       IN     VARCHAR2,
  p_spec       IN     VARCHAR2
) RETURN BOOLEAN;

FUNCTION user_access (
  p_user     IN VARCHAR2,
  p_access   IN VARCHAR2,
  p_owner    IN VARCHAR2,
  p_object   IN VARCHAR2
) RETURN BOOLEAN;


END driacc;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRICON" as

/*---------------------------- set_datatype_obj ------------------------*/
/*
  NAME
    set_datatype_obj

  DESCRIPTION
    calculates which datatype object is needed

  RETURNS
    names of datatype preference and obj_id
*/
PROCEDURE set_datatype_obj(
  p_texttype      in  number,
  p_datatype_pref out varchar2,
  p_datatype_id   out number
);

/*---------------------------- set_store_obj ------------------------*/
/*
  NAME
    set_store_obj

  DESCRIPTION
    calculates which datastore objects are needed

  RETURNS
    names of store interface and store type to use
*/
PROCEDURE set_store_obj(
  p_dstore_pref   in  varchar2,
  p_texttype      in  number,
  p_idx_owner     in  varchar2,
  p_key_name      in  varchar2,
  p_storex_pref   out varchar2,
  p_datatype_pref out varchar2
);

/*---------------------------- get_data_type ------------------------*/
/*
  NAME
    get_data_type

  DESCRIPTION
    simple way to get the data type of a table column

  RETURNS
    datatype as a word.  type_num is the datatype as the oracle type id.

  NOTES
    all arguments should be UPPER'ed first
*/
FUNCTION get_data_type(
  p_owner   IN  varchar2,
  p_tabname IN  varchar2,
  p_colname IN  varchar2,
  type_num  OUT number,
  dtlength  OUT number,
  dtscale   OUT number
) return varchar2;

/*----------------------- get_type_data_type ------------------------*/
/*
  NAME
    get_type_data_type

  DESCRIPTION
    get the data type of a type table column

  RETURNS
    datatype as a word.  type_num is the datatype as the oracle type id.

  NOTES
    all arguments should be UPPER'ed first
*/
PROCEDURE get_type_data_type(
  p_typename IN  varchar2,    -- type name with owner prefix
  p_colname  IN  varchar2,    -- text column name with no owner prefix
  p_typenum  OUT number,      -- text column datatype
  p_dtlen    OUT number       -- text column data length
);

/*----------------------------- validate_tab -------------------------------*/
/*
  NAME
    validate_tab - VALIDATE TABle
  DESCRIPTION
    validate table exists

  NOTES
    Assumes that p_owner, p_table_name are NON-NULL
*/
PROCEDURE validate_tab(
  owner         in  varchar2,     -- owner of table
  tabname       in  varchar2      -- table name
);

/* ----------------- test if the table exists ------------------------ */
/* NAME
     exist_tab - test if table exists
   DESCRIPTION
     return true when table exists,
            false when table does not exist

   NOTES
    Assumes that p_owner, p_table_name are NON-NULL
*/
FUNCTION exist_tab(
	l_owner   IN VARCHAR2,
	l_tabname IN VARCHAR2) return boolean;

/*----------------------- validate_text_column ----------------------------*/
/*
  NAME
    validate_text_column

  DESCRIPTION
    validate column exists, get the type and length, and make sure
    we can index this type.

  NOTES
    Assumes that table exists
*/

procedure validate_text_column(
  p_idx_type    in     number,
  owner         in     varchar2,     -- owner of table
  tabname       in     varchar2,     -- table name
  column_name   in     varchar2,
  coltype       out    number,
  collen        out    number
);

/*----------------------- validate_meta_column ----------------------------*/
/*
  NAME
    validate_meta_column

  DESCRIPTION
    validate column exists, ensure type, normalize name

  NOTES
    Assumes that table exists
*/
PROCEDURE validate_meta_column(
  p_owner       in     varchar2,
  p_tabname     in     varchar2,
  p_langcol     in     varchar2,
  p_type_error  in     number,
  p_norm        in out varchar2
);

/*--------------------- get_primary_key -------------------------------*/
/*
  NAME
    get_primary_key

  DESCRIPTION
    detect the primary key columns, determine their type and number
*/
PROCEDURE get_primary_key(
  p_owner       in  varchar2,
  p_table_name  in  varchar2,
  keyname       out varchar2,
  keytype       out number
);

/*----------------------- validate_cdi ----------------------------*/
/*
  NAME
    validate_cdi

  DESCRIPTION
    validate column types, lengths, etc.
*/
PROCEDURE validate_cdi(
  p_owner       in varchar2,
  p_table_name  in varchar2,
  cols          in sys.odcicolinfolist,
  collen        in out nocopy dr_def.id_tab,
  coltype       in out nocopy dr_def.name_tab,
  coltype#      in out nocopy dr_def.id_tab
);

end dricon;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIDISP" is

  /*
   * NAME
   *   EXECTRUST - synchronous trust callout command
   *
   * RETURN
   *
   */
  procedure EXECTRUST(
                     idx_owner  in     varchar2,
                     idx_name   in     varchar2,
                     part_name  in     varchar2,
                     func_code  in     number,
  		     arg1       in     varchar2 default NULL,
  		     arg2       in     varchar2 default NULL,
  		     arg3       in     varchar2 default NULL,
  		     arg4       in     varchar2 default NULL,
  		     arg5       in     varchar2 default NULL,
  		     arg6       in     varchar2 default NULL,
  		     arg7       in     varchar2 default NULL,
  		     arg8       in     varchar2 default NULL,
  		     arg9       in     varchar2 default NULL,
  		     arg10      in     varchar2 default NULL
                    );

  /*
   * NAME
   *   EXECTRUST_RET - synchronous trust callout command with return
   *
   * RETURN
   *
   */
  procedure EXECTRUST_RET(
                     idx_owner  in     varchar2,
                     idx_name   in     varchar2,
                     part_name  in     varchar2,
                     func_code  in     number,
                     ret1       out    varchar2,
                     ret2       out    varchar2,
  		     arg1       in     varchar2 default NULL,
  		     arg2       in     varchar2 default NULL,
  		     arg3       in     varchar2 default NULL,
  		     arg4       in     varchar2 default NULL,
  		     arg5       in     varchar2 default NULL,
  		     arg6       in     varchar2 default NULL,
  		     arg7       in     varchar2 default NULL,
  		     arg8       in     varchar2 default NULL,
  		     arg9       in     varchar2 default NULL,
  		     arg10      in     varchar2 default NULL
                    );

  /*
   * NAME
   *   EXECTRUST_RET1 - synchronous trust callout command with 1 return
   *
   * RETURN
   *
   */
  function EXECTRUST_RET1(
                     idx_owner  in     varchar2,
                     idx_name   in     varchar2,
                     part_name  in     varchar2,
                     func_code  in     number,
  		     arg1       in     varchar2 default NULL,
  		     arg2       in     varchar2 default NULL,
  		     arg3       in     varchar2 default NULL,
  		     arg4       in     varchar2 default NULL,
  		     arg5       in     varchar2 default NULL,
  		     arg6       in     varchar2 default NULL,
  		     arg7       in     varchar2 default NULL,
  		     arg8       in     varchar2 default NULL,
  		     arg9       in     varchar2 default NULL,
  		     arg10      in     varchar2 default NULL
                    )
   return varchar2;

end dridisp;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIDML"
is

  LOCK_WAIT       constant number  := null;
  LOCK_NOWAIT     constant number  := 0;
  IGNORE_ERRORS   constant boolean := TRUE;

/*--------------------------- deregister --------------------------------*/
/*
  NAME
    DEREGISTER(cid) - deregister the given column with DML queue,

  DESCRIPTION
    This procedure discontinues queueing of updates to the DML
    queue.   It also flushes any pending requests, and waits for any
    in-progress requests to complete
  ARGUMENTS
    CID		- the column id to register
    unlock      - unlock DML afterwards?
    zap_online_pending -- clear dr$online_pending
*/
procedure DEREGISTER(cid number, unlock in boolean default TRUE,
                     part_id number default 0,
                     part_name in varchar2 default null,
                     zap_online_pending in boolean default TRUE);

/*------------------------------ lock_dml --------------------------------*/
/*
  NAME
    lock_dml

  DESCRIPTION
     lock dml for a column

  ARGUMENTS
     cid        -- cid to lock
     timeout    -- if non-null, timeout
     pid        -- partition id

  RETURNS
     0 on success, 1 on timeout

  NOTES
     This does not block out incoming DML reindex requests.
*/
function lock_dml_ret(
  cid        in number,
  pid        in number,
  timeout    in number
) return number;

procedure lock_dml(
  cid        in number,
  pid        in number,
  timeout    in number
);

/*------------------------- lock_dml_all_part ----------------------------*/
/* NOTE: gets multiple locks.  If fails, it's up to calling procedure to  */
/* release any locks it may have gotten                                   */
procedure lock_dml_all_part(
  cid        in number
);

/*----------------------------- unlock_dml ------------------------------*/
/*
  NAME
     UNLOCK_DML

  DESCRIPTION
     Unlock the DML queue

  ARGUMENTS
     ignore_errors	- don't flag any errors
*/
procedure unlock_dml(
  ignore_errors in boolean default false
);

/*------------------------ unlock_dml_all_part ---------------------------*/

procedure unlock_dml_all_part(
  ignore_errors in boolean default false
);

/* 5364449: Removed get_dml */

/*--------------------------- ClearOnlinePending ------------------------*/

procedure ClearOnlinePending(
  p_idxid in number,
  index_partition in varchar2 default NULL
);

/*--------------------------- ExchangePending ---------------------------*/
/* exchange all rows in dr$pending, dr$waiting, etc. for exchange partition */

procedure ExchangePending(
  p_idxid1 in number,
  p_ixpid1 in number,
  p_idxid2 in number
);

/*------------------------- delete_dup_waiting ----------------------------*/
/* eliminate duplicate dr$waiting rows */

procedure delete_dup_waiting(cid in number, pid in number);

/*------------------------- open_waiting_cur ----------------------------*/
/* open cursor on dr$waiting */

procedure open_waiting_cur(cid in number, pid in number);

/*------------------------- fetch_waiting_cur ----------------------------*/
/* fetch row from waiting cursor */

function fetch_waiting_cur(rid out rowid, wrid out urowid) return number;

/*------------------------- insert_pending -------------------------------*/
/* insert a row into dr$pending */

procedure insert_pending(
  cid  in number,
  pid  in number,
  rid  in rowid,
  wrid in urowid default null
);

/*-------------------------- DeletePending -------------------------*/

procedure DeletePending (
  p_idxid  in number,
  p_ixpid  in number,
  p_rid    in rowid
);

/*-------------------------- DeletePendingArr ----------------------*/

procedure DeletePendingArr (
  p_idxid  in number,
  p_ixpid  in number,
  p_rid    in dr_def.rowid_tab
);

/*-------------------------- SetLockFailed -------------------------*/

procedure SetLockFailed (
  p_idxid  in number,
  p_ixpid  in number,
  p_rid    in rowid
);

/*-------------------------- HasPending ----------------------------*/

function HasPending (
  p_idxid  in number,
  p_ixpid  in number
) return boolean;

/*-------------------------- CleanDelete ---------------------------*/

procedure CleanDelete (
  p_idxid  in number,
  p_ixpid  in number
);

/*-------------------------- PopulatePendingRowid ---------------------------*/

procedure PopulatePendingRowid (
  p_idxid in number,
  p_ixpid in number,
  p_rowid in varchar2
);

/*-------------------------- lock_autosync_ret --------------------------*/
function lock_autosync_ret(
  cid        in number,
  pid        in number,
  timeout    in number
) return number;

/*---------------------------- lock_autosync ----------------------------*/
procedure lock_autosync(
  cid        in number,
  pid        in number,
  timeout    in number
);

/*--------------------------- unlock_autosync ---------------------------*/
procedure unlock_autosync(
  ignore_errors in boolean default false
);

end dridml;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIDOC" AS

type theme_rec is record (
  theme  varchar2(2000),
  weight number
);
type theme_tab is table of theme_rec index by binary_integer;

type token_rec is record (
  token varchar2(64),
  offset number,
  length number
);
type token_tab is table of token_rec index by binary_integer;

type highlight_rec is record (
  offset number,
  length number
);
type highlight_tab is table of highlight_rec index by binary_integer;

pv_theme_tab     theme_tab;
pv_highlight_tab highlight_tab;
pv_clob          clob;
pv_token_tab     token_tab;

MODE_CLOB        constant number := 1;
MODE_BLOB        constant number := 2;
MODE_BFILE       constant number := 3;
MODE_VCHR2       constant number := 4;
direct_mode      number;
direct_clob      clob;
direct_blob      blob;
direct_bfile     bfile;
direct_vchr2     varchar2(32767);
direct_lang      varchar2(256);
direct_format    varchar2(256);
direct_cset      varchar2(256);

/*---------------------------- highlight_add -----------------------------*/
/* add a highlight to the internal result table -- called by C code */

PROCEDURE highlight_add(
  offset in number,
  length in number
);

/*---------------------------- theme_add ---------------------------------*/
/* add a theme to the internal result table -- called by C code */

PROCEDURE theme_add(
  theme  in varchar2,
  weight in number
);

/*---------------------------- token_add ---------------------------------*/
/* add a token to the internal result table -- called by C code */

PROCEDURE token_add(
  token  in varchar2,
  offset in number,
  length in number
);

/*---------------------------- text_new ----------------------------------*/
/* prepare the internal clob result -- called by dr0doc */

PROCEDURE text_new;

/*---------------------------- text_add ----------------------------------*/
/* add some text to the internal clob result -- called by C code */

PROCEDURE text_add(
  text   in varchar2
);

/*---------------------------- text_end ----------------------------------*/
/* clear the internal clob result -- called by dr0doc */

PROCEDURE text_end;

END dridoc;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIERR" authid definer as

/*-------------------------- AddODCIWarning -------------------------------*/

procedure AddODCIWarning(pretext IN boolean := FALSE);

/*---------------------------- RecordIndexError -------------------------*/
/* records an error to the dr$index_error table */

procedure RecordIndexError(
  p_idxid           in number,
  p_textkey         in varchar2,
  p_stack           in varchar2
);

procedure RecordIndexErrorId(
  p_idxid           in number,
  p_textkey         in varchar2,
  msgid             in binary_integer,
  arg1	            in varchar2	default NULL,
  arg2	            in varchar2	default NULL,
  arg3	            in varchar2	default NULL,
  arg4	            in varchar2	default NULL,
  arg5	            in varchar2	default NULL
);

end drierr;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIEXP" as

/*-----------------------  get_meta_data  ---------------------------*/
/*
  NAME
    get_meta_data
  DESCRIPTION
    see /vobs/rdbms/src/client/tools/exp/prvtpexp.sql and
    and /vobs/doc/release/rdbms/8.1/function_spec/expimp_extindex_fs.doc

    called during export time.

    construct statements to rebuild index meta-data.

    This procedure is called repeatedly from odcigetmetadata returning
    no more than varchar2(4000) at a time.

    Constructed statements to regenerate meta-data will be like this:
       ---------------------------------------------------------
       driimp.create_index(arguments here);

       driimp.set_object(cla_name1, obj_name1, attribute_count1);
       driimp.set_value(att_name1, att_value1);
       driimp.set_value(att_name2, att_value2);
       ...etc

       driimp.set_object(cla_name2, obj_name2, attribute_count2);
       driimp.set_value(att_name1, att_value1);
       driimp.set_value(att_name2, att_value2);
       ...etc

       ...etc

       commit;
       ----------------------------------------------------------
    because cla_id, obj_id and att_id can differ across version
    cla_name, obj_name and oat_name are being passed instead.
  ARGUMENTS
    see /vobs/rdbms/src/client/tools/exp/prvtpexp.sql and
    and /vobs/doc/release/rdbms/8.1/function_spec/expimp_extindex_fs.doc
  NOTES

  EXCEPTIONS

  RETURNS
*/
function get_meta_data(
  p_idx_owner in     varchar2,
  p_idx_name  in     varchar2,
  p_new_block in out PLS_INTEGER,
  IndexInfoFlags in number default NULL
)
return varchar2;

end driexp;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIIMP" as

/*--------------------------  create_index  ---------------------------*/
/*
  NAME
    create_index
  DESCRIPTION
    insert into dr$index during import.
  ARGUMENTS
    columns to dr$index, except id, owner and status.
  NOTES

  EXCEPTIONS

  RETURNS
*/
PROCEDURE create_index(
   p_idx_name        IN  varchar2,
   p_idx_table       IN  varchar2,
   p_idx_table_owner IN  varchar2,
   p_idx_key_name    IN  varchar2,
   p_idx_key_type    IN  varchar2,
   p_idx_text_name   IN  varchar2,
   p_idx_text_type   IN  varchar2,
   p_idx_text_length IN  varchar2,
   p_idx_docid_count IN  varchar2,
   p_idx_version     IN  varchar2,
   p_idx_nextid      IN  varchar2,
   p_idx_langcol     in  varchar2 default null,
   p_idx_fmtcol      in  varchar2 default null,
   p_idx_csetcol     in  varchar2 default null,
   p_idx_type        in  number   default 0,
   P_idx_option      in  varchar2 default null,
   p_idx_sync_type   in  varchar2 default null,
   p_idx_sync_memory      in varchar2 default null,
   p_idx_sync_para_degree in number   default null,
   p_idx_sync_interval    in varchar2 default null,
   p_idx_configcol   in  varchar2 default null
);

/*--------------------------  create_partition  ----------------------*/
/*
  NAME
    create_partition
  DESCRIPTION
    insert into dr$index_partition during import.
  ARGUMENTS
    p_ixp_id  :  partition ID
    p_ixp_name:  partition name
  NOTES

  EXCEPTIONS

  RETURNS
*/
PROCEDURE create_partition(
   p_ixp_id          IN  number,
   p_ixp_name        IN  varchar2,
   p_ixp_docid_count IN  number,
   p_ixp_nextid      IN  number,
   p_ixp_opt_token   IN  VARCHAR2,
   p_ixp_opt_type    IN  number,
   p_ixp_opt_count   IN  number,
   p_ixp_sync_type   IN  VARCHAR2 default null,
   p_ixp_sync_memory       IN  VARCHAR2 default null,
   p_ixp_sync_para_degree  IN  NUMBER default null,
   p_ixp_sync_interval     IN  VARCHAR2 default null
);

/*-------------------------- set_object ---------------------------*/
/*
  NAME
    set_object
  DESCRIPTION
    insert into dr$index_object for this class_name and object_name
  ARGUMENTS
    p_cla_name  (IN)  - class name
    p_obj_name  (IN)  - object name
    p_acnt      (IN)  - number of attributes
  NOTES

  EXCEPTIONS

  RETURNS
*/
PROCEDURE set_object(
  p_cla_name  IN  varchar2,
  p_obj_name  IN  varchar2,
  p_acnt      IN  varchar2
);

/*-------------------------- set_value ----------------------------*/
/*
  NAME
    set_value
  DESCRIPTION
    insert into dr$index_value
  ARGUMENTS
    p_att_name  (IN) - attribute name
    p_att_value (IN) - attribute value
  NOTES

  EXCEPTIONS

  RETURNS
*/
PROCEDURE set_value(
  p_att_name   IN   varchar2,
  p_att_value  IN   varchar2
);

/*-------------------------- set_sub_value ----------------------------*/
/*
  NAME
    set_sub_value
  DESCRIPTION
    insert into dr$index_value
  ARGUMENTS
    p_att_name  (IN) - attribute name
    p_att_value (IN) - attribute value
  NOTES

  EXCEPTIONS

  RETURNS
*/
PROCEDURE set_sub_value(
  p_att_name   IN   varchar2,
  p_sub_group  IN   number,
  p_sub_obj    IN   varchar2,
  p_sub_att    IN   varchar2,
  p_sub_value  IN   varchar2
);

/*-------------------------- add_pending ----------------------------*/
/*
  NAME
    add_pending
  DESCRIPTION
    insert into dr$pending
  ARGUMENTS
    p_pid    (IN) - partition id
    p_rowid  (IN) - rowid
  NOTES

  EXCEPTIONS

  RETURNS
*/
PROCEDURE add_pending(
  p_pid    IN   number,
  p_rowid  IN   rowid
);

/*-------------------------- add_cdicol ----------------------------*/
/*
  NAME
    add_cdicol
  DESCRIPTION
    insert into dr$index_cdi_column
  ARGUMENTS
    columns to dr$index_cdi_column, except id
  NOTES

  EXCEPTIONS

  RETURNS
*/
PROCEDURE add_cdicol(
  p_cdi_column_position    IN   number,
  p_cdi_column_name        IN   varchar2,
  p_cdi_column_type        IN   varchar2,
  p_cdi_column_type#       IN   number,
  p_cdi_column_length      IN   number,
  p_cdi_section_name       IN   varchar2,
  p_cdi_section_type       IN   number,
  p_cdi_section_id         IN   number,
  p_cdi_sort_order         IN   varchar2
);

/*-------------------------- add_user_extract_rule -------------------------*/
/*
  NAME
    add_user_extract_rule
  DESCRIPTION
    insert stoppatterns into dr$user_extract_rule
  ARGUMENTS
    columns of dr$user_extract_rule
  NOTES

  EXCEPTIONS

  RETURNS
*/
PROCEDURE add_user_extract_rule(
  p_erl_rule_id     IN  number,
  p_erl_language    IN  varchar2,
  p_erl_rule        IN  varchar2,
  p_erl_modifier    IN  varchar2,
  p_erl_type        IN  varchar2,
  p_erl_status      IN  number,
  p_erl_comments    IN  varchar2
);

end driimp;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIIXS" as

/*-------------------- create_index_set  ---------------------------*/

PROCEDURE create_index_set(
  set_name     in    varchar2,
  preference_implicit_commit in boolean
);

/*------------------------------ add_index -------------------------*/

PROCEDURE add_index(
  set_name       in    varchar2,
  column_list    in    varchar2,
  storage_clause in    varchar2 default null,
  preference_implicit_commit in boolean
);

/*-------------------- remove_index ---------------------------*/

PROCEDURE remove_index(
  set_name       in    varchar2,
  column_list    in    varchar2,
  preference_implicit_commit in boolean
);

/*-------------------- drop_index_set  ---------------------------*/

PROCEDURE drop_index_set(
  set_name     in    varchar2
);

/*---------------------- drop_user_index_sets ----------------------*/
PROCEDURE drop_user_index_sets(
  user_name in varchar2 := null
);

/*------------------------ copy_index_set ------------------------------*/

function copy_index_set(
  p_idx_id     in  number,
  p_indexset   in  varchar2,
  p_rcount     out number
)
return dr_def.pref_rec;

/*----------------------- GetIndexIndexSet --- -------------------------*/
/* get index set from already-existing index */

PROCEDURE GetIndexIndexSet(
  p_idx_id    in  number,
  o_ixx       in out nocopy dr_def.ixx_tab
);

/*----------------------- GetIndexIXSColumns -----------------------------*/
/* get index set columns from already-existing index */

PROCEDURE GetIndexIXSColumns(
  p_idx_id    in  number,
  o_cols      in out nocopy dr_def.ixc_tab
);

end driixs;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRILIST" is


  CMD_ADMIN_PING                 constant number := 0;
  CMD_ADMIN_LOG                  constant number := 1;
  CMD_ADMIN_MTS                  constant number := 2;
  CMD_ADMIN_VERSION              constant number := 3;
  CMD_ADMIN_EVENT                constant number := 4;
  CMD_ADMIN_MESSAGE_PRINT        constant number := 5;
  CMD_ADMIN_SET_STATE            constant number := 6;
  CMD_ADMIN_GET_STATE            constant number := 7;
  CMD_ADMIN_TRACE_CMD            constant number := 8;
  CMD_ADMIN_ORAEVENT             constant number := 9;

  CMD_INDEX_POPULATE             constant number := 10;
  CMD_INDEX_RESUME               constant number := 11;
  CMD_INDEX_SYNC                 constant number := 12;
  CMD_INDEX_OPT_FAST             constant number := 13;
  CMD_INDEX_OPT_FULL             constant number := 14;
  CMD_INDEX_ADD_SW               constant number := 15;
  CMD_INDEX_LEX_SW               constant number := 16;
  CMD_INDEX_OPT_TOKEN            constant number := 17;
  CMD_INDEX_CATSYNC              constant number := 18;
  CMD_INDEX_SLAVEID              constant number := 19;
  CMD_INDEX_SCAN_SQL             constant number := 20;
  CMD_INDEX_MARK_FAIL            constant number := 21;
  CMD_INDEX_SYNC_SQL             constant number := 22;
  CMD_INDEX_RES_SQL              constant number := 23;
  CMD_INDEX_OPT_FULL_PAR         constant number := 24;
  CMD_INDEX_RTOK                 constant number := 25;
  CMD_INDEX_OPT_TTYP             constant number := 26;
  CMD_INDEX_OPT_TTYP_PAR         constant number := 27;
  CMD_INDEX_PWAIT                constant number := 28;
  CMD_INDEX_OPT_SDATA            constant number := 29;

  CMD_DOC_HIGHLIGHT              constant number := 30;
  CMD_DOC_MARKUP                 constant number := 31;
  CMD_DOC_FILTER                 constant number := 32;
  CMD_DOC_GIST                   constant number := 33;
  CMD_DOC_THEMES                 constant number := 34;
  CMD_DOC_TOKENS                 constant number := 35;
  CMD_DOC_IFILTER                constant number := 36;
  CMD_DOC_KWIC                   constant number := 37;
  CMD_DOC_POLICYTOK              constant number := 38;
  CMD_DOC_POLICYTHM              constant number := 39;

  CMD_QUERY_COUNT                constant number := 40;
  CMD_QUERY_RESULT_SET           constant number := 41;
  CMD_QUERY_HFEEDBACK            constant number := 42;
  CMD_QUERY_XPATHCHK             constant number := 43;
  CMD_QUERY_FUNCTION             constant number := 44;
  CMD_QUERY_BROWSE               constant number := 45;

  CMD_INSO_SAFE_CALLOUT          constant number := 50;
  CMD_NEST_TEST                  constant number := 51;
  CMD_REPORT_OBJSIZE             constant number := 52;
  CMD_REPORT_STATS               constant number := 53;
  CMD_REPORT_TOKINFO             constant number := 54;

  CMD_CLASSIFY_TRAIN             constant number := 60;
  CMD_CLASSIFY_FVECTORS          constant number := 61;
  CMD_CLASSIFY_FEATURES          constant number := 62;
  CMD_CLUSTERING                 constant number := 65;
  CMD_ADMIN_QUERY_LOG            constant number := 66;
  CMD_REPORT_QUERY_LOG_SUMMARY   constant number := 67;
  CMD_ORACON_RWRTCHK             constant number := 68;
  CMD_ENTITY_PARSE_RULE          constant number := 69;
  CMD_ENTITY_EXTRACT             constant number := 70;
  CMD_ENTITY_PARSE_STOPENT       constant number := 71;
  CMD_INDEX_OPT_REBUILD          constant number := 72;
  CMD_INDEX_OPT_MERGE            constant number := 73;
  CMD_INDEX_SPLIT_ZONE_TOKENS    constant number := 75;
  CMD_INDEX_OPT_AUTO             constant number := 76;
  CMD_PURGE_AUTO_OPT_KGL         constant number := 77;
  CMD_DOC_STEMS                  constant number := 78;
  CMD_DOC_NOUN_PHRASES           constant number := 79;
  CMD_DOC_LANGUAGES              constant number := 80;
  CMD_DOC_POS                    constant number := 81;

  CMD_MVDATA_INSERT              constant number := 82;
  CMD_MVDATA_DELETE              constant number := 83;
  CMD_MVDATA_UPDATE_SET          constant number := 84;
  CMD_MVDATA_KGL_PURGE           constant number := 85;

  CMD_TREE_ADD_NODE              constant number := 86;
  CMD_TREE_GET_NODEID            constant number := 87;
  CMD_TREE_GET_NODEID_LIST       constant number := 88;
  CMD_TREE_GET_CHILDREN          constant number := 89;
  CMD_TREE_GET_ROOTS             constant number := 90;
  CMD_TREE_KGL_PURGE             constant number := 91;
  CMD_TREE_REMOVE_NODE           constant number := 92;

  CMD_INDEX_OPT_MVDTOK           constant number := 93;
  CMD_REPORT_VALIDATE            constant number := 94;

  CMD_SPLIT_ITAB                 constant number := 95;
  CMD_INDEX_MIG_FIELD_TO_MDATA   constant number := 96;
  CMD_INDEX_OPT_FULL_FTS         constant number := 97;
  CMD_INDEX_OPT_REB_FTS          constant number := 98;
  CMD_INDEX_OPTREB_EXCHANGE      constant number := 99;
  CMD_INDEX_OPT_PROCN            constant number := 100;
  CMD_CHECK_UPD_MDATA            constant number := 101;
  CMD_IMPORT_THESAURUS           constant number := 102;
  CMD_EXPORT_THESAURUS           constant number := 103;
  CMD_CHECK_SES                  constant number := 104;
  CMD_MARK_STOP_OPT              constant number := 105;
  CMD_UNMARK_STOP_OPT            constant number := 106;
  CMD_GET_FC_STATS               constant number := 107;
  CMD_ENTITY_PARSE_RULENOPOL     constant number := 108;
  CMD_FC_TXNAL_CC                constant number := 109;
  CMD_TOKEN_TYPE_MVDATA          constant number := 110;
  CMD_INDEX_OPT_AF_FULL          constant number := 111;
  CMD_INDEX_OPT_AF_TTYP          constant number := 112;
  CMD_VALIDATE_MVDATA_TOKENS     constant number := 113;
  CMD_SHADOW_IDX_OPERATIONS      constant number := 114;

  MS_GENERIC                 constant number := 0;
  MS_INDEX_BEG               constant number := 1;
  MS_INDEX_END               constant number := 2;
  MS_GENERIC_NONL            constant number := 3;

  MS_ORAEVENT_SET            constant number := 0;
  MS_ORAEVENT_GET            constant number := 1;

  MS_TRC_ADD                 constant number := 0;
  MS_TRC_REM                 constant number := 1;
  MS_TRC_ZRO                 constant number := 2;
  MS_TRC_GET                 constant number := 3;
  MS_TRC_LOG                 constant number := 4;
  MS_TRC_ALL                 constant number := 5;
  MS_TRC_SET_TP              constant number := 6;
  MS_TRC_SET_VAL             constant number := 7;

  MS_OPT_SDATA_FULL          constant number := 0;
  MS_OPT_SDATA_TTYP          constant number := 1;

  MS_SHADOW_IDX_CREATE       constant number := 0;
  MS_SHADOW_IDX_DROP         constant number := 1;
  MS_SHADOW_IDX_EXCHANGE     constant number := 2;
  MS_SHADOW_IDX_POPULATE     constant number := 3;
  MS_SHADOW_IDX_ONLINE       constant number := 4;

end drilist;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRILOAD" as

/*---------------------------- resolve_sqe --------------------------------*/
/*
  NAME
    resolve_sqe

  NOTES
    TODO: move this to a more appropriate place
*/
FUNCTION resolve_sqe( p_idx_id in number, p_sqe_name in varchar2)
return clob;

end driload;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIMLX" as

/*-------------------- add_sub_lexer ---------------------------*/

PROCEDURE add_sub_lexer(
  lexer_name     in   varchar2,
  language       in   varchar2,
  sub_lexer      in   varchar2,
  alt_value      in   varchar2 default NULL,
  language_dependent in boolean default TRUE,
  preference_implicit_commit in boolean
);

/*-------------------- remove_sub_lexer ---------------------------*/

PROCEDURE remove_sub_lexer(
  lexer_name     in   varchar2,
  language       in   varchar2,
  preference_implicit_commit in boolean
);

/*----------------------- copy_multi_lexer -------------------------------*/
procedure copy_multi_lexer(
  p_idx_id in  number,
  p_pref   in  dr_def.pref_rec,
  p_rcount out number
);

/*----------------------- GetIndexMultiLexer -----------------------------*/
procedure GetIndexMultiLexer(
  p_idx_id in  number,
  o_slx in out nocopy dr_def.slx_tab
);

/*-------------------------- IndexAddSLX  -------------------------------*/
procedure IndexAddSLX(
  ia        in sys.ODCIIndexInfo,
  idx       in dr_def.idx_rec,
  sub_lexer in varchar2,
  language  in varchar2,
  alt_value in varchar2,
  language_dependent in boolean default TRUE,
  add_ML_tokens out boolean,
  update_slx    in boolean
);

procedure IndexRemoveSLX(
  ia        in sys.ODCIIndexInfo,
  idx       in dr_def.idx_rec,
  sub_lexer in varchar2,
  rem_ML_tokens out boolean,
  update_slx    in boolean
);

procedure IndexUpdateSLX(
  ia             in sys.ODCIIndexInfo,
  idx            in dr_def.idx_rec,
  old_slx_symb   in varchar2,
  new_slx_pref   in varchar2
);

procedure GetSLXAltAbbr(
  idx_id    in number,
  sub_lexer in varchar2,
  language  in out varchar2,
  abbr      in out varchar2,
  alt       in out varchar2
);

/*-------------------- upd_sub_lexer ---------------------------*/
/* update a sub lexer in a multi-lexer preference */

PROCEDURE upd_sub_lexer(
  lexer_name     in   varchar2,
  language       in   varchar2,
  sub_lexer      in   varchar2,
  preference_implicit_commit in boolean
);

end drimlx;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIOPT" as

  p_inv_count number;

  LOCK_WAIT     constant number := null;
  LOCK_NOWAIT   constant number := 0;
  IGNORE_ERRORS constant boolean := TRUE;

/*------------------------------ lock_opt_AF-------------------------------*/

procedure lock_opt_AF(
  cid        in number,
  timeout    in number,
  retval     out number
);

/*------------------------------ lock_opt --------------------------------*/

procedure lock_opt(
  cid        in number,
  pid        in number,
  timeout    in number
);
function lock_opt_ret(
  cid        in number,
  pid        in number,
  timeout    in number
) return number;

/*------------------------- lock_opt_rebuild ------------------------------*/
/* Added for bug 5079472 */

procedure lock_opt_rebuild(
  cid        in number,
  pid        in number,
  lock_mode  in number,
  timeout    in number,
  release_on_commit in boolean default FALSE
);

/*------------------------- lock_opt_all_part ----------------------------*/
/* NOTE: gets multiple locks.  If fails, it's up to calling procedure to  */
/* release any locks it may have gotten                                   */
procedure lock_opt_all_part(
  cid        in number
);

/*--------------------------- lock_opt_mvdata ---------------------------*/
/* lock optimize mvdata against commit callback of update_mvdata
 * releases lock on commit */
procedure lock_opt_mvdata(
  cid in number,
  pid in number
);

/*----------------------------- unlock_opt ------------------------------*/

procedure unlock_opt(
  ignore_errors in boolean default false
);

/*----------------------------- unlock_opt_AF-----------------------------*/

procedure unlock_opt_AF(
  ignore_errors in boolean default false
);

/*------------------------- unlock_opt_rebuild ----------------------------*/
/* Added for bug 5079472 */

procedure unlock_opt_rebuild(
  ignore_errors in boolean default false
);

/*------------------------ unlock_opt_all_part ---------------------------*/

procedure unlock_opt_all_part(
  ignore_errors in boolean default false
);

/*---------------------------- start_timer ---------------------------*/
/*
  NAME
    start_timer

  DESCRIPTION
    start the optimization timer
*/
procedure start_timer;

/*---------------------------- get_timer ------------------------------*/
/*
  NAME
    get_timer

  DESCRIPTION
    get the amount of minutes since last start_timer call
*/
function get_timer return number;

/*---------------------------- get_state ------------------------------*/
/*
  NAME
    get_state

  DESCRIPTION
    get the current state of optimization
*/
procedure get_state(
  p_idx_id      in  number
, p_ixp_id      in  number
, p_opt_token   out varchar2
, p_opt_type    out number
);

/*---------------------------- set_state ------------------------------*/
/*
  NAME
    set_state

  DESCRIPTION
    set the new state of optimization for next time
*/
procedure set_state(
  p_idx_id      in  number
, p_ixp_id      in  number
, p_opt_token   in  varchar2
, p_opt_type    in  number
);

/*--------------------------- set_ddl_lock_timeout -------------------------*/
/* set_ddl_lock_timeout parameter for this session */
procedure set_ddl_lock_timeout(
  p_timeout in number default 1000000
);

/*--------------------------- get_ddl_lock_timeout -------------------------*/
/* get_ddl_lock_timeout parameter for this session */
function get_ddl_lock_timeout
return number;

/*---------------------- IndexOptimizeRebuild_Verify ------------------------*/
PROCEDURE IndexOptimizeRebuild_Verify(
  idx           in  dr_def.idx_rec,
  ixp           in  dr_def.ixp_rec,
  base_itab_obj in  varchar2,
  base_xidx_obj in varchar2,
  char_semantics out varchar2,
  ipart          out varchar2
  ) ;

/*------------------------- getSegmentInfo ---------------------------------*/
procedure getSegmentInfo(
  idxowner       in varchar2,
  base_itab_obj  in varchar2,
  blocks         out number,
  bytes          out number
);


end driopt;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIPARSE" authid definer as

type createRec is record (
  populate  boolean,
  swap      boolean,
  idxmem    number,
  langcol   varchar2(256),
  fmtcol    varchar2(256),
  csetcol   varchar2(256),
  datastore varchar2(65),
  filter    varchar2(65),
  section   varchar2(65),
  lexer     varchar2(65),
  wordlist  varchar2(65),
  stoplist  varchar2(65),
  storage   varchar2(65),
  indexset  varchar2(65),
  classifier      varchar2(65),
  txntional       varchar2(65),
  sync_type       varchar2(65),
  sync_memory     varchar2(100),
  sync_paradegree number,
  sync_interval   varchar2(4000),
  tree            boolean,
  sync_dpl        boolean,
  secname         varchar2(256),
  configcol varchar2(256)
);

type alterRec is record (
  operation  number,
  op_subtype varchar2(30),
  string1    varchar2(80),
  string2    varchar2(64),
  number1    number,
  flag1      boolean,
  idx_opt    createRec,
  num1       number
);

OP_NULL                 constant number := -1;
-- Deprecated operation
--OP_SYNC               constant number :=  1;
OP_RESUME               constant number :=  2;
OP_REPLACE              constant number :=  3;
OP_ADD_STOPWORD         constant number :=  4;
-- Deprecated operation
--OP_OPTIMIZE           constant number :=  5;
OP_ADD_SECTION          constant number :=  6;
-- internal only
OP_EXCHANGE             constant number :=  7;
-- end of internal only
OP_ADD_STAGE_ITAB       constant number := 8;
OP_REMOVE_STAGE_ITAB    constant number := 9;
OP_ADD_BIG_IO           constant number := 10;
OP_REMOVE_BIG_IO        constant number := 11;
OP_ADD_SEPARATE_OFFSETS constant number := 12;
OP_ADD_SUB_LEXER        constant number := 13;
OP_REM_SUB_LEXER        constant number := 14;
OP_REM_STOPWORD         constant number := 15;
OP_REM_STOPWORDS        constant number := 16;
OP_MIGRATE_TO_MULTISTOP   constant number := 17;
OP_MIGRATE_FIELD_TO_MDATA constant number := 18;
OP_UPD_SUB_LEXER        constant number := 19;
OP_READ_TRUE            constant number := 20;
OP_READ_FALSE           constant number := 21;
OP_WRITE_TRUE           constant number := 22;
OP_WRITE_FALSE          constant number := 23;


/* ======================================================================= */
/* ======================================================================= */
/*                               CONTEXT                                   */
/* ======================================================================= */
/* ======================================================================= */

/*----------------------- InitCreateRec  -----------------------*/
/*
  NAME
    InitCreateRec

  DESCRIPTION
    initialize createrec

  ARGUMENTS

  NOTES

  EXCEPTIONS

  RETURNS

*/
FUNCTION InitCreateRec return createRec;

/*----------------------- ParseCreate  -----------------------*/
/*
  NAME
    ParseCreate

  DESCRIPTION
    parse create index parameters string

  ARGUMENTS
    params       paramstring
    alter_op     zero unless called from ParseAlter
    opts         create index options (OUT)

  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE ParseCreate(
  params      in  varchar2,
  alter_op    in  number,
  opts        out createRec,
  metadataonly out boolean,
  isPart      in   boolean default FALSE
);

/*----------------------- ParsePartCreate  -----------------------*/
/*
  NAME
    ParsePartCreate

  DESCRIPTION
    parse create index (partition create) parameters string

  ARGUMENTS
    params       paramstring
    opts         create index options (OUT)

  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE ParsePartCreate(
  params      in  varchar2,
  alter_op    in  number,
  def_idxmem  in  number,
  opts        out createRec,
  metadataonly out boolean
);

/*----------------------- ParseAlter  -----------------------*/
/*
  NAME
    ParseAlter

  DESCRIPTION
    parse alter index parameters string

  ARGUMENTS
    idxid        index id
    params       paramstring
    opts         alter index options (OUT)
    isPart       if the index is partitioned -- only set in
                 recreate_index_online

  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE ParseAlter(
  idxid       in     number,
  params      in     varchar2,
  opts        in out alterRec,
  isPart      in     boolean default FALSE
);

/*----------------------- ParsePartAlter  -----------------------*/
/*
  NAME
    ParsePartAlter

  DESCRIPTION
    parse alter index partition parameters string

  ARGUMENTS
    idxid        index id
    params       paramstring
    opts         alter index options (OUT)

  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE ParsePartAlter(
  idxid       in     number,
  params      in     varchar2,
  opts        in out alterRec
);

/* ======================================================================= */
/* ======================================================================= */
/*                               CTXCAT                                    */
/* ======================================================================= */
/* ======================================================================= */

/*----------------------- ParseCreateCat  -----------------------*/
/*
  NAME
    ParseCreateCat

  DESCRIPTION
    parse create index parameters string for ctxcat indextype

  ARGUMENTS
    params       paramstring
    opts         create index options (OUT)

  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE ParseCreateCat(
  params      in  varchar2,
  opts        out createRec
);

/*----------------------- ParseAlterCat  -----------------------*/
/*
  NAME
    ParseAlterCat

  DESCRIPTION
    parse alter index parameters string for ctxcat indextype

  ARGUMENTS
    params       paramstring
    opts         create index options (OUT)

  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE ParseAlterCat(
  idxid       in  number,
  params      in  varchar2,
  opts        out alterRec
);

/*----------------------- normalize_column_list  -----------------------*/
/*
  NAME
    normalize_column_list

  DESCRIPTION
    normalize a column list

  ARGUMENTS
    column_list  column list

  NOTES

  EXCEPTIONS

  RETURNS
    normalized column list
*/
FUNCTION normalize_column_list(
  column_list in varchar2
) RETURN varchar2;




/* ======================================================================= */
/* ======================================================================= */
/*                               CTXRULE                                   */
/* ======================================================================= */
/* ======================================================================= */

/*----------------------- ParseCreateRule  -----------------------*/
/*
  NAME
    ParseCreateRule

  DESCRIPTION
    parse create index parameters string for ctxrule indextype

  ARGUMENTS
    params       paramstring
    alter_op     zero unless called from ParseAlter
    opts         create index options (OUT)

  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE ParseCreateRule(
  params      in  varchar2,
  alter_op    in  number,
  opts        out createRec
);

/*----------------------- ParseAlterRule  -----------------------*/
/*
  NAME
    ParseAlter

  DESCRIPTION
    parse alter index parameters string for ctxrule indextype

  ARGUMENTS
    idxid        index id
    params       paramstring
    opts         alter index options (OUT)

  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE ParseAlterRule(
  idxid       in     number,
  params      in     varchar2,
  opts        in out alterRec
);

/* ======================================================================= */
/* ======================================================================= */
/*                             CTXXPATH                                    */
/* ======================================================================= */
/* ======================================================================= */

/*----------------------- ParseCreateXPath  -----------------------*/
/*
  NAME
    ParseCreateXPath

  DESCRIPTION
    parse create index parameters string for ctxxpath indextype

  ARGUMENTS
    params       paramstring
    opts         create index options (OUT)

  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE ParseCreateXPath(
  params      in  varchar2,
  alter_op    in  number,
  opts        out createRec
);

/*----------------------- ParseAlterXPath  -----------------------*/
/*
  NAME
    ParseAlter

  DESCRIPTION
    parse alter index parameters string

  ARGUMENTS
    idxid        index id
    params       paramstring
    opts         alter index options (OUT)

  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE ParseAlterXPath(
  idxid       in     number,
  params      in     varchar2,
  opts        in out alterRec
);

PROCEDURE ParseMigrate (
  params  in out varchar2,
  opts    in out alterRec
);

end driparse;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIPREF" as

/*--------------------------- get_oat_id -------------------------*/
/*
  NAME
    get_oat_id

  DESCRIPTION
    given a class and object id and an attribute name, return oat_id
*/
function get_oat_id(
  class_id  in binary_integer,
  object_id in binary_integer,
  att_name  in varchar2
)
return binary_integer;

/*--------------------------- get_obj_info -------------------------*/
/*
  NAME
    get_obj_info

  DESCRIPTION
    given an object name, selects the object information and return
    the data as a record
*/
function get_obj_info(
  object_name   in  varchar2
)
return dr_def.obj_rec;

/*--------------------------- get_pref_info -------------------------*/
/*
  NAME
    get_pref_info

  DESCRIPTION
    given a preference name, selects the preference information and
    returns the data as a record.
*/
function get_pref_info(
  pre_name   in  varchar2,
  new_pref   in  boolean   default false,
  check_own  in  boolean   default false
)
return dr_def.pref_rec;

/*---------------------------- create_preference ----------------------------*/
/*
  NAME
    create_preference

  DESCRIPTION
    this procedure create a preference for the framework object whose name
    is specified in 'object_name'.

  ARGUMENTS
    preference_name -  preference name, this can be structured as
                       [OWNER.]PREFERENCE_NAME
    object_name     -  name of the object to apply the preference to.

*/
procedure create_preference(
  preference_name  in varchar2,
  object_name      in varchar2,
  preference_implicit_commit in boolean);

/*---------------------------- drop_preference ----------------------------*/
/*
  NAME
    drop_preference

  DESCRIPTION
    delete the preference specified in 'name' from TexTile dictionary.

  ARGUMENTS
    name    - preference name
*/
procedure drop_preference(preference_name  in varchar2,
                          preference_implicit_commit in boolean);

/*--------------------------- drop_user_preferences ----------------------*/
/*
  NAME
    drop_user_preferences

  DESCRIPTION
    deletes all preferences for the given user from the Text dictionary.
    If the user is null, then preferences from all dropped users will
    be deleted (called by ctx_adm.recover).

  ARGUMENTS
    user_name
*/
procedure drop_user_preferences(user_name in varchar2 := null);

/*------------------------------ set_attribute ---------------------------*/
/*
  NAME
    set_attribute

  DESCRIPTION
   set the specified attribute in the specified preference to the
   provided value. if a setting for this attribute already exists,
   this will override the old value for that attribute

  ARGUMENTS
*/
procedure set_attribute(
  preference_name in varchar2,
  attribute_name  in varchar2,
  attribute_value in varchar2,
  preference_implicit_commit in boolean
);

/*---------------------------- unset_attribute ---------------------------*/
/*
  NAME
    unset_attribute

  DESCRIPTION
    remove the value for the specified attribute in the specified preference

  ARGUMENTS
*/
procedure unset_attribute(
  preference_name in  varchar2,
  attribute_name  in  varchar2,
  preference_implicit_commit in boolean
);

/*========================================================================*/
/*========================================================================*/
/*                               INDEXING                                 */
/*========================================================================*/
/*========================================================================*/

/*--------------------------- set_preferences -------------------------*/
/*
  NAME
   set_preferences - Check all preferences used in a policy
*/
procedure set_preferences(
  idx_owner          in    varchar2,
  idx_id             in    number,
  idx_langcol        in    varchar2,
  prefnames          in    DR_DEF.NAME_TAB,
  new_sdata_section  out   boolean,
  ia                 in    sys.ODCIIndexInfo default NULL
);

/*--------------------------- rpl_preferences -------------------------*/
/*
  NAME
   rpl_preferences - replace preferences used in an index with the
                     supplied ones
*/
procedure rpl_preferences(
  idx_owner   in    varchar2,
  idx_id     in     number,
  idx_langcol in    varchar2,
  prefnames  in     DR_DEF.NAME_TAB,
  section_id in     number,
  alt_I      out    boolean,
  new_sdata_section  out boolean
);

/*--------------------------- copy_preferences -------------------------*/
/*
  NAME
   copy_preferences - copy prefs from one index to another
*/
procedure copy_preferences(
  source_idx_id in    number,
  dest_idx_id   in    number,
  all_prefs     in    boolean default FALSE
);

/*--------------------------- get_default_filter ------------------*/
/*
  NAME
    get_default_filter

  DESCRIPTION
    get the default value for the filter preference
*/
function get_default_filter(
  p_dstore_pref in varchar2,
  p_coltype     in number
)
return varchar2;

/*--------------------------- add_partition_storage ---------------*/
/*
  NAME
    add_partition_storage

  DESCRIPTION
    add a storage clause for the partition
*/
procedure add_partition_storage(
  p_idx_id       in number,
  p_part_id      in number,
  p_storage_pref in varchar2
);

/*--------------------------- remove_partition_storage -----------*/
/*
  NAME
    remove_partition_storage

  DESCRIPTION
    remove storage class values for the partition
*/
procedure remove_partition_storage(
  p_idx_id       in number,
  p_part_id      in number
);

/*--------------------------- get_attribute_value ------------------*/
/*
  NAME
    get_attribute_value

  DESCRIPTION
    given a preference record and an attribute name, returns the
    value of the attribute in the preference. used from drival.
*/
function get_attribute_value(
  pre_rec          dr_def.pref_rec,
  attribute_name   varchar2
)
return varchar2;

/*========================================================================*/
/*========================================================================*/
/*                          AFTER-INDEXING REPORT                         */
/*========================================================================*/
/*========================================================================*/

/*--------------------------- get_index_values ---------------------------*/
/* get the values for the class for the index */

PROCEDURE get_index_values(
  p_idx_id in number,
  p_cla_id in binary_integer,
  o_ixv    in out nocopy dr_def.ixv_tab
);

/*--------------------------- get_sub_index_values -----------------------*/
/* get the sub-values for the class for the index */

PROCEDURE get_sub_index_values(
  p_idx_id  in number,
  p_cla_id  in binary_integer,
  p_sub_grp in binary_integer,
  o_ixv     in out nocopy dr_def.ixv_tab
);

/*========================================================================*/
/*========================================================================*/
/*                              CLASSIFICATION                            */
/*========================================================================*/
/*========================================================================*/

/*---------------------------- GetPrefClaObj -----------------------------*/

procedure GetPrefClaObj(
  p_preid  in  number,
  o_claid  out number,
  o_objid  out number
);

/*---------------------------- GetObjDefault -----------------------------*/

procedure GetObjDefault(
  p_oatid   in  number,
  o_default out varchar2
);

/*---------------------------- OpenPrefValue ------------------------------*/

procedure OpenPrefValue(
  p_preid   in number
);

/*---------------------------- NextPrefValue ------------------------------*/

function NextPrefValue(
  o_value   out varchar2,
  o_oatid   out number
) return binary_integer;

end dripref;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIREC" as

/*--------------------------------- recover --------------------------------*/
/*
  NAME
  DESCRIPTION

  ARGUMENTS


  NOTES


  EXCEPTIONS

  RETURNS
    none
*/
PROCEDURE recover(component IN varchar2 default 'ALL');

/*------------------------------ recover_dict ------------------------------*/
/*
  NAME
    recover_dict - RECOVER textile DICTionary
  DESCRIPTION
    Remove policies and indexes that belong to an invalid user (i.e. one
    that has been dropped)

    Also removes indexes, or any other database objects created that are
    connected specifically to the policy

    Remove obsolete entries in dr$contains

    Remove thesaurus and sections groups that belongs to an invalid user

    If user_name is null, entries for all dropped users are removed.
  ARGUMENTS

  RETURNS

  NOTES
*/
PROCEDURE recover_dict(user_name in varchar2 := null);

end drirec;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIREP" as

  s75  constant varchar2(75) :=
 '                                                                           ';
  e75  constant varchar2(75) :=
 '===========================================================================';
  h75  constant varchar2(75) :=
 '---------------------------------------------------------------------------';


/*---------------------------- wl (writeln) -------------------------------*/
/* write a line to report output.  will automatically append a newline  */

procedure wl(lline in varchar2);

/*---------------------------- blankln ------------------------------------*/
/* write a blank line to report output.  */

procedure blankln;

/*------------------------------- title -----------------------------------*/
/* write a title section to the report.  by default, separator is 65 "=" */

procedure title(
  title  in varchar2 default null,
  title2 in varchar2 default null,
  sep    in varchar2 default null
);

/*---------------------------- initreport ---------------------------------*/
/* do pre-report initialization */

procedure initreport;

/*---------------------------- endreport ---------------------------------*/
/* do end of report cleanup */

procedure endreport(report in out nocopy clob);

/*------------------------ load_ttype_names ------------------------------*/
/* parse index meta-data and load a table of token type names */

procedure load_ttype_names (
  idx in dr_def.idx_rec,
  tt  in out nocopy dr_def.vc256_tab,
  fldonly in boolean default FALSE
);

/*---------------------------- bytestr -------------------------------*/
/* return a byte amount in readble form */

function bytestr (a in number) return varchar2;

/*---------------------------- numstr ---------------------------------*/
/* return a large number in readable form */

function numstr (a in number) return varchar2;

/*---------------------------- pctstr ---------------------------------*/
/* calculate and return a percentage in readable form */

function pctstr (fig in number, base in number, rnd in number default 2)
return varchar2;

end drirep;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIREPM" as

/*--------------------------- describe_index --------------------------------*/

procedure describe_index(
  index_name    in varchar2,
  report        in out nocopy clob,
  report_format in varchar2 DEFAULT 'TEXT'
);

/*--------------------------- describe_policy -------------------------------*/

procedure describe_policy(
  policy_name   in varchar2,
  report        in out nocopy clob,
  report_format in varchar2 DEFAULT 'TEXT'
);

/*-------------------------- create_index_script ----------------------------*/

procedure create_index_script(
  index_name      in varchar2,
  report          in out nocopy clob,
  prefname_prefix in varchar2 default null
);

/*-------------------------- create_policy_script ---------------------------*/

procedure create_policy_script(
  policy_name      in varchar2,
  report          in out nocopy clob,
  prefname_prefix in varchar2 default null
);

end drirepm;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIREPZ" as

/*--------------------------- index_size --------------------------------*/

procedure index_size(
  index_name    in varchar2,
  report        in out nocopy clob,
  part_name     in varchar2 default null,
  report_format in varchar2 DEFAULT 'TEXT'
);

/*------------------------ get_gtab_size ---------------------------------*/
procedure get_gtab_size (
  index_name in varchar2,
  partid in number,
  tka   in out number,
  tba   in out number,
  tku   in out number,
  tbu   in out number
);
end drirepz;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIRIO" as

  LOCK_WAIT     constant number := null;
  LOCK_NOWAIT   constant number := 0;
  IGNORE_ERRORS constant boolean := TRUE;

/*------------------------------ lock_rio --------------------------------*/

procedure lock_rio(
  cid        in number,
  pid        in number,
  timeout    in number
);

/*----------------------------- unlock_rio ------------------------------*/

procedure unlock_rio(
  ignore_errors in boolean default false
);

/*----------------------------- shadow_name ------------------------------*/
/* return the name of the shadow policy, given source policy id */

function shadow_name(
  idx_id in number,
  ixp_id in number default null
) return varchar2;

/*------------------------- lock_rio_all_part ----------------------------*/

procedure lock_rio_all_part(
  cid        in number
);

/*------------------------ unlock_rio_all_part ---------------------------*/

procedure unlock_rio_all_part(
  ignore_errors in boolean default false
);

procedure create_shadow(
  idx        dr_def.idx_rec,
  idx_shadow in out nocopy dr_def.idx_rec
);

procedure create_shadow_partMD(
   idx         dr_def.idx_rec,
   ixp_id      number
);

end dririo;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRISGP" as

  SEC_TYPE_UNKNOWN             constant number :=  0;
  SEC_TYPE_ZONE                constant number :=  1;
  SEC_TYPE_FIELD               constant number :=  2;
  SEC_TYPE_SPECIAL             constant number :=  3;
  SEC_TYPE_STOP                constant number :=  4;
  SEC_TYPE_ATTR                constant number :=  5;
  SEC_TYPE_XML                 constant number :=  6;
  SEC_TYPE_MDATA               constant number :=  7;
  SEC_TYPE_CSDATA              constant number :=  8;
  SEC_TYPE_CMDATA              constant number :=  9;
  SEC_TYPE_SDATA               constant number := 10;
  SEC_TYPE_NDATA               constant number := 11;
  SEC_TYPE_MVDATA              constant number := 12;

  SEC_DATATYPE_UNKNOWN         constant binary_integer :=  0;
  SEC_DATATYPE_NUMBER          constant binary_integer :=  2;
  SEC_DATATYPE_VARCHAR2        constant binary_integer :=  5;
  SEC_DATATYPE_DATE            constant binary_integer := 12;
  SEC_DATATYPE_RAW             constant binary_integer := 23;
  SEC_DATATYPE_CHAR            constant binary_integer := 96;

  SEC_ZONE_FID                 constant number :=  1;

  SEC_FIELD_LOW_MIN_FID        constant number :=  16;
  SEC_FIELD_LOW_MAX_FID        constant number :=  79;
  SEC_FIELD_HIGH_MIN_FID       constant number :=  1001;
  SEC_FIELD_HIGH_MAX_FID       constant number :=  1333;

  SEC_MDATA_LOW_MIN_FID        constant number := 400;
  SEC_MDATA_LOW_MAX_FID        constant number := 499;
  SEC_MDATA_HIGH_MIN_FID       constant number := 5000;
  SEC_MDATA_HIGH_MAX_FID       constant number := 5999;
  SEC_MAX_MDATA                constant number := 100;

  SEC_NDATA_MIN_FID            constant number := 200;
  SEC_NDATA_MAX_FID            constant number := 299;
  SEC_MAX_NDATA                constant number := 100;

  SEC_SDATA_MIN_FID            constant number := 101;
  SEC_SDATA_MAX_FID            constant number := 199;
  SEC_MAX_SDATA                constant number := 99;

  SEC_MVDATA_MIN_FID           constant number := 300;
  SEC_MVDATA_MAX_FID           constant number := 399;
  SEC_MAX_MVDATA               constant number := 100;

/*-------------------- create_section_group  ---------------------------*/
/* create a new section group */

PROCEDURE create_section_group(
  p_group_name   in    varchar2
, p_group_type   in    varchar2
,  preference_implicit_commit in boolean
);

/*-------------------- drop_section_group  ---------------------------*/
/* drop a section group */

PROCEDURE drop_section_group(
  p_group_name   in    varchar2,
  preference_implicit_commit in boolean
);

/*-------------------------- set_sec_grp_attr -------------------------------*/
/*
  NAME
    set_sec_grp_attr
  DESCRIPTION
    add a section group specific attribute to a section group identified by
    name
  ARGUMENTS
    group_name      - section group name
    attribute_name  - section group attribute name
    attribute_value - section group attribute value
  NOTES

  EXCEPTIONS

*/
procedure set_sec_grp_attr(group_name      in varchar2,
                           attribute_name  in varchar2,
                           attribute_value in varchar2);

/*----------------------- ins_sec_grp_attr_by_id ----------------------------*/
/*
  NAME
    ins_sec_grp_attr_by_id
  DESCRIPTION
    add a section group specific attribute to a a section group identified
    by an id
  ARGUMENTS
    sgp_name        - section group name
    sgp_id          - section group id
    attribute_name  - section group attribute name
    attribute_value - section group attribute value
    operation       - 'SET' or 'ADD' depending on whether the attribute
                      value is being set for the first time for this section
                      group or whether the attribute value is being added
                      to an already existing list of values for this section
                      group
  NOTES

  EXCEPTIONS

*/
procedure ins_sec_grp_attr_by_id(sgp_name        in varchar2,
                                 sgp_id          in number,
                                 attribute_name  in varchar2,
                                 attribute_value in varchar2,
                                 operation       in varchar2);

/*-------------------------- add_sec_grp_attr_val --------------------*/
/*
  NAME
    add_sec_grp_attr_val
  DESCRIPTION
    add a section group attribute value to the list of values of an already
    existing section group attribute.

  ARGUMENTS
    group_name      - section group name
    attribute_name  - section group attribute name
    attribute_value - section group attribute value
  NOTES

  EXCEPTIONS

*/
procedure add_sec_grp_attr_val(group_name      in varchar2,
                               attribute_name  in varchar2,
                               attribute_value in varchar2);

/*-------------------------- rem_sec_grp_attr_val --------------------*/
/*
  NAME
    rem_sec_grp_attr_val
  DESCRIPTION
    remove a specific section group attribute value from the list of values
    of an existing section group attribute.

  ARGUMENTS
    group_name      - section group name
    attribute_name  - section group attribute name
    attribute_value - section group attribute value
  NOTES

  EXCEPTIONS

*/
procedure rem_sec_grp_attr_val(group_name      in varchar2,
                               attribute_name  in varchar2,
                               attribute_value in varchar2);

/*---------------------- unset_sec_grp_attr ---------------------------------*/
/*
  NAME
    unset_sec_grp_attr
  DESCRIPTION
    remove a section group specific attribute
  ARGUMENTS
    group_name      - section group name
    attribute_name  - section group attribute name
  NOTES

  EXCEPTIONS

*/
procedure unset_sec_grp_attr(group_name      in varchar2,
                             attribute_name  in varchar2);

/*-------------------- drop_user_section_groups ----------------------*/
/* Drop section groups owned by a user */

PROCEDURE drop_user_section_groups(
  p_user_name in varchar2 := null
);

/*-------------------- add_section --------------------*/
/* add a section to a section group */

PROCEDURE add_section(
  p_group_name     in     varchar2,
  p_section_name   in     varchar2,
  p_tag            in     varchar2,
  p_section_type   in     binary_integer,
  p_visible        in     boolean,
  p_datatype       in     varchar2 default NULL,
  preference_implicit_commit in boolean
);

/*-------------------- remove_section ---------------------------*/

PROCEDURE remove_section(
  group_name    in    varchar2,
  section_name  in    varchar2,
  preference_implicit_commit in boolean
);

PROCEDURE remove_section(
  group_name     in    varchar2,
  section_id     in    number,
  preference_implicit_commit in boolean
);

/*--------------------------- get_default_section ------------------*/
/* get the default value for the section group preference */

function get_default_section(
  p_dstore_pref in varchar2,
  p_filter_pref in varchar2,
  p_dtype_pref  in varchar2
)
return varchar2;

/*--------------------------- get_sg_info -------------------------*/
/* get section group info */

function get_sg_info(
  p_sg_name    in  varchar2,
  f_new_sg     in  boolean   default false,
  f_check_own  in  boolean   default false
)
return dr_def.pref_rec;

/*------------------------ copy_section_group ------------------------------*/
/* copy section group info into index meta data */

function copy_section_group(
  p_idx_id     in  number,
  p_sgroup     in  varchar2,
  p_rcount     out number,
  alt_I        out boolean,
  p_new_sdata_section  out boolean,
  ia           in      sys.ODCIIndexInfo default NULL
)
return dr_def.pref_rec;

/*----------------------- IndexAddSection  ---------------------------*/
/* add a section to an already existing index */

PROCEDURE IndexAddSection(
  ia          in  sys.ODCIIndexInfo,
  idx         in  dr_def.idx_rec,
  sectype     in  varchar2,
  secname     in  varchar2,
  tag         in  varchar2,
  visible     in  number,
  NewSdataSec out boolean,
  dtype       in  number,
  alt_I       out boolean,
  skip_lk     in boolean
);

/*----------------------- LoadSectionMD  ---------------------------*/
/* load section metadata from the index values table */

PROCEDURE LoadSectionMD(
  p_idxid    in         number,
  p_fonly    in         boolean,
  o_sectab   out nocopy dr_def.sec_tab
);

/*----------------------- GetSection ------------------------------*/
/* return type of section given name */
FUNCTION GetSection(
  p_idxid    in         number,
  p_secname  in         varchar2
) return dr_def.sec_rec;

/*----------------------- GetSections ------------------------------*/
/* return sections associated with given index */
FUNCTION GetSections(
  p_idxid    in         number
) return dr_def.sec_tab;

/*----------------------- HasSectionType ------------------------------*/
/* return true if section group has section of given type */
FUNCTION HasSectionType(
  p_sec_grp  in         varchar2,
  p_sectype  in         number
) return boolean;

/*--------------------------- field_to_mdata ------------------------------*/
/* make the metadata changes to convert a field section to mdata */
PROCEDURE field_to_mdata(
  idx in dr_def.idx_rec,
  fsec in varchar2,
  read_only in boolean,
  ftyp out number,
  mdatatyp out number
);

/*----------------------- IndexRemSection  ---------------------------*/
/* Remove section from index metadata, used for doc lexer */
PROCEDURE IndexRemSection(
  ia          in  sys.ODCIIndexInfo,
  idx         in  dr_def.idx_rec,
  sectype     in  varchar2,
  secname     in  varchar2,
  sectag      in  varchar2,
  secfid      in  number,
  skip_lk     in  boolean
);

/*----------------------- SecIsMDATA -------------------------------*/
/* Returns true if given fid/ttype is MDATA   */
FUNCTION SecIsMDATA(
  sec_fid    in         number
) return boolean;

/*--------------------------- GetTkTypMVDATA ------------------------*/
/* check that it's an  MVDATA section and return token_type */
FUNCTION GetTkTypMVDATA(
  p_idx     in dr_def.idx_rec,
  p_secname in varchar2
) return binary_integer;

/*--------------------------- CheckUpdMdata ------------------------*/
/* check that mdata section is updateable, and return token_type */
FUNCTION CheckUpdMdata(
  p_idx     in dr_def.idx_rec,
  p_secname in varchar2
) return binary_integer;

/*---------------------------- set_section_attribute -----------------------*/
/*
  NAME
    set_section_attribute
  DESCRIPTION
    add a section specific attribute
  ARGUMENTS
    group_name      - section group name
    section_name    - section name
    attribute_name  - section attribute name
    attribute_value - section attribute value
  NOTES

  EXCEPTIONS

*/
procedure set_section_attribute(group_name      in varchar2,
                                section_name    in varchar2,
                                attribute_name  in varchar2,
                                attribute_value in varchar2,
                                preference_implicit_commit in boolean);

/*------------------------- set_section_attribute_by_id --------------------*/
procedure set_section_attribute_by_id(sgp_id in number,
                                      sec_id in number,
                                      attribute_name  in varchar2,
                                      attribute_value in varchar2);

/*-------------------------- unset_section_attribute -----------------------*/

procedure unset_section_attribute(group_name      in varchar2,
                                  section_name    in varchar2,
                                  attribute_name  in varchar2,
                                  preference_implicit_commit in boolean);

/*-------------------------- csv_to_section_attr -----------------------*/

procedure  csv_to_section_attr(p_idxid   in number,
                               p_sectype in varchar2,
                               p_csv     in varchar2);

/*-------------------------- IndexSetSectionAttribute -----------------------*/
procedure IndexSetSectionAttribute(idx_id          in number,
                                   sgp_obj_id      in number,
                                   section_id      in number,
                                   attribute_name  in varchar2,
                                   attribute_value in varchar2);

/*------------------------- IndexUnsetSectionAttribute ----------------------*/
procedure IndexUnsetSectionAttribute(idx_id        in number,
                                     section_name  in varchar2,
                                     section_tag   in varchar2,
                                     section_id   out number);

/*------------------------- IndexUpdateSectionAttribute ---------------------*/
procedure IndexUpdateSectionAttribute(idx_id          in number,
                                   section_id      in number,
                                   attribute_name  in varchar2,
                                   attribute_value in varchar2);

/*-------------------------- IndexGetSectionAttribute -----------------------*/
procedure IndexGetSectionAttribute(idx_id          in number,
                                   section_id      in number,
                                   attribute_name  in varchar2,
                                   attribute_value out varchar2);

/*--------------------------- IndexGetSectionId -------------------------*/
procedure IndexGetSectionId(idxid           in number,
                            section_name    in varchar2,
                            section_tag     in varchar2,
                            section_id      out number);

end drisgp;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRISPL" as

/*-------------------- create_stoplist --------------------------*/

PROCEDURE create_stoplist(
  stoplist_name  in   varchar2,
  stoplist_type  in   varchar2 default 'BASIC_STOPLIST',
  preference_implicit_commit in boolean
);

/*-------------------- drop_stoplist --------------------------*/

PROCEDURE drop_stoplist(
  stoplist_name  in   varchar2,
  preference_implicit_commit in boolean
);

/*-------------------- drop_user_stoplists ---------------------*/

PROCEDURE drop_user_stoplists(
  user_name in varchar2 := null
);

/*-------------------- add_stopobj --------------------------*/

PROCEDURE add_stopobj(
  stoplist_name  in   varchar2,
  obj_type       in   varchar2,
  stopword       in   varchar2,
  stoppattern    in   varchar2 default NULL,
  language       in   varchar2 default NULL,
  language_dependent in boolean default TRUE,
  preference_implicit_commit in boolean
);

/*-------------------- remove_stopobj --------------------------*/

PROCEDURE remove_stopobj(
  stoplist_name  in   varchar2,
  obj_type       in   varchar2,
  stopword       in   varchar2,
  language       in   varchar2 default NULL
);

/*------------------------ copy_stoplist -----------------------------------*/

function copy_stoplist(
  p_idx_id     in  number,
  p_stoplist   in  varchar2,
  p_section_id in  number,
  p_rcount     out number
)
return dr_def.pref_rec;

/*----------------------- IndexAddStopword  -------------------------*/
/* add a stopword to an already-existing index */

PROCEDURE IndexAddStopword(
  ia          in  sys.ODCIIndexInfo,
  idx         in  dr_def.idx_rec,
  stopword    in  varchar2,
  language    in  varchar2,
  language_dependent in boolean default TRUE,
  sectionid   in  number,
  add_ML_tokens     out boolean
);

/*----------------------- IndexRemStopword  -------------------------*/
/* remove a stopword from an already-existing index */

PROCEDURE IndexRemStopword(
  ia          in  sys.ODCIIndexInfo,
  idx         in  dr_def.idx_rec,
  stopword    in  varchar2,
  language    in  varchar2,
  for_all     in boolean default FALSE,
  rem_ML_tokens out boolean
);

/*----------------------- GetIndexStopwords  -------------------------*/
/* get stopwords from already-existing index */

PROCEDURE GetIndexStopwords(
  p_idx_id    in  number,
  p_obj_id    in  binary_integer,
  o_spw       in out nocopy dr_def.spw_tab
);

/*---------------------- MigrateToMultiStoplist ---------------------*/
/* Migrate from basic stoplist to multi stoplist */

PROCEDURE MigrateToMultiStoplist(
  ia      in sys.ODCIIndexInfo,
  idx     in dr_def.idx_rec,
  langcol in varchar2
);

PROCEDURE GetSPLLang(
  idx         in  dr_def.idx_rec,
  language    in  varchar2,
  language_dependent in boolean,
  out_lang    in out varchar2
);

end drispl;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRITHS" AS

   type phrtab is table of dr$ths_phrase%rowtype index by binary_integer;

/*--------------------------------- get_ths -------------------------------*/
/*
  NAME
    get_ths -- lookup thesaurus id and case-sensitivity

  ARGUMENTS
    tname  - thesaurus name
    tid    - thesaurus id (OUT)
    tcs    - thesaurus case sensitivity (OUT)
    modify - set to TRUE if you want to do ownership checking

  NOTES
    error if thesaurus does not exist
*/
PROCEDURE get_ths(
  tname  in  varchar2,
  tid    out number,
  tcs    out boolean,
  modify in  boolean  default FALSE
);

/*--------------------------------- parse_phrase ---------------------------*/
/*
  NAME
    parse_phrase

  DESCRIPTION
    This procedure parses a phrase into phrase and qualifier parts

  RETURN
*/

PROCEDURE parse_phrase (
  phrase in     varchar2,
  ppart  out    varchar2,
  qpart  out    varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(parse_phrase, AUTO);

/*--------------------------------- lookup -------------------------------*/
/*
  NAME
    lookup -- lookup phrase in a thesaurus

  DESCRIPTION
    This procedure looks up a phrase in the given thesaurus

  RETURN
    TRUE if phrase is found, FALSE otherwise
*/

FUNCTION lookup (
  tname  in     varchar2,
  phrase in     varchar2,
  resarr in out phrtab
) return boolean;


/*----------------------------- lookup_single-----------------------------*/
/*
  NAME
    lookup_single -- lookup a single phrase in a thesaurus

  DESCRIPTION
    This procedure looks up a phrase in the given thesaurus

  RETURN
    phrase id

  NOTES
    phrase must exist in thesaurus
    if hits multiple phrases, only the first is returned
*/
FUNCTION lookup_single (
  tid    in     number,
  phrase in     varchar2,
  qual   in     varchar2
) return number;


end driths;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRITHSC" AS

  -- last phrase id for TR
  pv_last_id number;

/*-------------------------- check_thesaurus_exists ------------------------*/
/*
  NAME
    check_thesaurus_exists

  DESCRIPTION
    check if thesaurus already exists

  ARGUMENTS
    tname    (IN) thesaurus name

  RETURN
    0 for thesaurus does not exist
    1 for thesaurus exists

  NOTES

*/
function check_thesaurus_exists (
  tname    in varchar2)
return number;

/*---------------------------- create_thesaurus -------------------------*/
/*
  NAME
    create_thesaurus

  DESCRIPTION
    create a new, empty thesaurus

  ARGUMENTS
    tname    (IN) thesaurus name
    casesens (IN) case-sensitivity

  RETURN
    new thesaurus ID

  NOTES
    error if thesaurus already exists
*/
function create_thesaurus(
  tname    in varchar2,
  casesens in boolean  default false)
return number;

procedure create_thesaurus_lsb(
  lv_id    in number,
  tname    in varchar2,
  casesens in boolean  default false
);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_thesaurus_lsb, AUTO);

/*---------------------------- drop_thesaurus -------------------------*/
/*
   NAME
     drop_thesaurus - drop a thesaurus

   DESCRIPTION
     This procedure drops an existing thesaurus with the indicated name

   ARGUMENTS
     tid  -- thesaurus id

   NOTES
     no error if the thesaurus does not exist
*/
procedure drop_thesaurus(tid in number);

/*------------------------ drop_user_thesauri -------------------------*/
/*
   NAME
     drop_user_thesauri - drops thesauri owner by a user

   DESCRIPTION
     This procedure drops all thesauri owned by the indicated user.  If
     the username is null, then all thesauri owned by non-existent users
     are dropped (called by ctx_adm.recover).

   ARGUMENTS
     user_name
*/
procedure drop_user_thesauri(user_name in varchar2 := null);

/*------------------------- trunc_thesaurus -------------------------*/
/*
   NAME
     trunc_thesaurus - truncate a thesaurus

   DESCRIPTION
     This procedure truncate a thesaurus

   ARGUMENTS
     tid     -- thesaurus id

   NOTES
*/
procedure trunc_thesaurus(tid in number);

/*------------------------- rename_thesaurus -------------------------*/
/*
   NAME
     rename_thesaurus - rename a thesaurus

   DESCRIPTION
     This procedure rename a thesaurus
     show

   ARGUMENTS
     tid     -- thesaurus id
     tname   -- new thesaurus name

   NOTES
*/
procedure rename_thesaurus(
   tid     in number,
   tname   in varchar2
);

/*---------------------------- create_phrase -------------------------*/
/*
   NAME
     create_phrase -- add a phrase to a thesaurus

   DESCRIPTION
     This procedure adds a phrase, or information about the phrase,
     to the thesaurus.

   ARGUMENTS
     tid      --  thesaurus id
     tcs      --  TRUE if thesaurus is case-sensitive
     phrase   --  phrase to add/modify
     rel      --  relationship type
     id       --  relationship id

   NOTES
     no error if the phrase already exists.
     note funny order of arguments.  PHRASE is the REL of RELID.
     Thus, create_phrase(123, 'animal', 'BT', <id of dog>)

   RETURN
     created phrase id
*/
function create_phrase (
  tid    in number,
  tcs    in boolean,
  phrase in varchar2,
  rel    in varchar2 default null,
  relid  in number   default null
) return number;

procedure create_phrase_lsb(
  tid    in number,
  tcs    in boolean,
  phrase in varchar2,
  rel    in varchar2 default null,
  relid  in number   default null,
  retval in out number
);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_phrase_lsb, AUTO);

/*---------------------------- drop_phrase -------------------------*/
/*
   NAME
     drop_phrase -- drop a phrase from a thesaurus

   DESCRIPTION
     This procedure drops a phrase from the thesaurus

   ARGUMENTS
     phrid       --  phrase id

   NOTES

   RETURN
*/
procedure drop_phrase (
  phrid  in number
);

/*--------------------------- rename_phrase -------------------------*/
/*
   NAME
     create_phrase -- rename a phrase in  a thesaurus

   DESCRIPTION
     This procedure renames a phrase

   ARGUMENTS
     phrid    --  phrase id
     phrase   --  phrase to add/modify

   NOTES

   RETURN

*/
procedure rename_phrase (
  phrid  in   number,
  phrase in   varchar2
);


/*------------------------------- make_pt -----------------------------*/
/*
   NAME
     make_pt -- name a phrase the preferred term

   DESCRIPTION
     This procedure makes a phrase the preferred term

   ARGUMENTS
     phrid    --  phrase id

   NOTES

   RETURN

*/
procedure make_pt (
  phrid  in   number
);

/*----------------------------- change_sn -----------------------------*/
/*
   NAME
     change_sn -- change the scope notes of a phrase

   DESCRIPTION
     This procedure changes the scope notes of a phrase

   ARGUMENTS
     phrid    --  phrase id
     sn       --  new scope notes

   NOTES

   RETURN

*/
procedure change_sn (
  phrid  in   number,
  sn     in   varchar2
);

/*------------------------------- create_tr -----------------------------*/
/*
   NAME
     create_tr -- add a translation to a thesaurus

   DESCRIPTION
     This procedure adds a translation to the thesaurus

   ARGUMENTS
     id1      --  phrase id 1
     lang     --  language
     trans    --  translation

   NOTES

   RETURN
*/
procedure create_tr(
  id1   in number,
  lang  in varchar2,
  trans in varchar2
);

/*------------------------------- drop_tr -----------------------------*/
/*
   NAME
     drop_tr -- drop a translation/s from a thesaurus

   DESCRIPTION
     This procedure drops a translation/s from the thesaurus

   ARGUMENTS
     id1      --  phrase id 1
     lang     --  language
     trans    --  translation

   NOTES

   RETURN
*/
procedure drop_tr(
  id1   in number,
  lang  in varchar2,
  trans in varchar2
);

/*------------------------------ update_tr -----------------------------*/
/*
   NAME
     update_tr -- update a translation

   DESCRIPTION
     This procedure updates a translation

   ARGUMENTS
     id1      --  phrase id 1
     lang     --  language
     trans    --  translation
     ntrans   --  new translation

   NOTES

   RETURN
*/
procedure update_tr(
  id1    in number,
  lang   in varchar2,
  trans  in varchar2,
  ntrans in varchar2
);

/*---------------------------- create_relation ------------------------*/
/*
   NAME
     create_relation -- add a relation to a thesaurus

   DESCRIPTION
     This procedure adds a relation to the thesaurus

   ARGUMENTS
     id1      --  phrase id 1
     rel      --  relationship type
     id2      --  phrase id 2

   NOTES
     opposite of create_phrase -- ID2 is the REL of ID1.

   RETURN
*/
PROCEDURE create_relation (
  id1    in number,
  rel    in varchar2,
  id2    in number
);

/*---------------------------- drop_relation ------------------------*/
/*
   NAME
     drop_relation -- drop a relation from a thesaurus

   DESCRIPTION
     This procedure drops a relation from the thesaurus

   ARGUMENTS
     id1      --  phrase id 1
     rel      --  relationship type
     id2      --  phrase id 2

   NOTES

   RETURN
*/
PROCEDURE drop_relation (
  id1    in number,
  rel    in varchar2,
  id2    in number
);

end drithsc;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRITHSD" AS

/*------------------------------- dump_thesaurus -------------------------*/
/*
  NAME
    dump_thesaurus

  DESCRIPTION
    initializes package for thesaurus dumping

  ARGUMENTS
    name    (IN) thesaurus name (if not specified, DEFAULT is used)
*/

PROCEDURE dump_thesaurus (
  tname in varchar2
);

/*------------------------------- next_dump_line -------------------------*/
/*
  NAME
    next_dump_line

  DESCRIPTION
    get next dump line

  ARGUMENTS

  RETURN
    line, or NULL at EOD

  NOTES
    MUST call dump_thesaurus first
*/
FUNCTION next_dump_line RETURN VARCHAR2;

end drithsd;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRITHSL" AS

/*---------------------------- create_thesaurus ---------------------------*/
/*
  NAME
    create_thesaurus

  DESCRIPTION
    specialized version of drithsc.create_thesaurus for thesaurus loader
*/

FUNCTION create_thesaurus (tname in varchar2, casesens in boolean)
return NUMBER;

/*---------------------------- create_phrase ---------------------------*/
/*
   NAME
     create_phrase

   DESCRIPTION
     Specialized version of drithsc.create_phrase for thesaurus loader
*/

function create_phrase (
  tid    in number,
  tcs    in boolean,
  phrase in varchar2,
  rel    in varchar2 default null,
  relid  in number   default null
) return number;

/*------------------------------- dump_thesaurus -------------------------*/
/*
  NAME
    dump_thesaurus

  DESCRIPTION
    Specialized version of drithsd.dump_thesaurus for thesaurus loader
*/

PROCEDURE dump_thesaurus (
  tname in varchar2
);

/*------------------------------- next_dump_line -------------------------*/
/*
  NAME
    next_dump_line

  DESCRIPTION
    Specialized version of drithsd.next_dump_line for thesaurus loader
*/
FUNCTION next_dump_line RETURN VARCHAR2;

/*------------------------------- allocate_ids  -------------------------*/
/*
  NAME
    allocate_ids

  DESCRIPTION
    allocate a list of thes ids and return the starting number of that list

  ARGUMENTS
    numalloc  (IN)  -- number of thesaurus id to be allocated
    start_id  (OUT) -- start id of the list of thesaurus id
*/
PROCEDURE allocate_ids (
  numalloc  in  number,
  start_id  out number
);
PRAGMA SUPPLEMENTAL_LOG_DATA(allocate_ids, AUTO);

/*------------------------------- insert_phrase -------------------------*/
PROCEDURE insert_phrase(
  phr_id        in  number,
  phr_thsid     in  number,
  phr_phrase    in  varchar2,
  phr_qualify   in  varchar2,
  phr_note      in  varchar2,
  phr_ringid    in  number
);
PRAGMA SUPPLEMENTAL_LOG_DATA(insert_phrase, AUTO);

PROCEDURE insert_bt(
  ths_thp_id  in number,
  ths_type    in varchar2,
  ths_bt      in number
);
PRAGMA SUPPLEMENTAL_LOG_DATA(insert_bt, AUTO);

PROCEDURE insert_fphrase(
  phr_thp_id    in number,
  phr_phrase    in varchar2,
  phr_type      in varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(insert_fphrase, AUTO);

PROCEDURE update_phrase(
  phr_thp_id   in number,
  phr_note     in varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(update_phrase, AUTO);

FUNCTION get_thsid_byname(
  thsname   in    varchar2
)
return number;

end drithsl;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRITHSX" AS

type exp_rec is record (
  xrel    varchar2(12),
  xlevel  number,
  xphrase varchar2(256)
);
type exp_tab is table of exp_rec index by binary_integer;

pv_exp_tab exp_tab;

/*---------------------------------- expand ----------------------------*/
/*
   NAME
     expand

   DESCRIPTION
     generic thesaurus query expansion function

   ARGUMENTS
     err     - error return code
     op      - operation. Must be one of:
                SYN, PT, TT, RT, BT, BTP, BTI, BTG, NT, NTP,
                NTI, NTG, TR, TRSYN
     phrase  - phrase
     level   - level limit for BT* / NT*, language for TR*
     tname   - thesaurus name
     restab  - restab mode?

   NOTES
*/

function expand(
  err    out number,
  op     in  varchar2,
  phrase in  varchar2,
  lvl    in  varchar2  default null,
  tname  in  varchar2  default 'DEFAULT',
  restab in  boolean   default FALSE
) return varchar2;

function expand0(
  err    out number,
  op     in  varchar2,
  phrase in  varchar2,
  tname  in  varchar2  default 'DEFAULT'
) return varchar2;

/*------------------------------- output_style -------------------------*/
/*
   NAME
     output_style

   DESCRIPTION
     set the output style for the expansion functions

   ARGUMENTS
     showlevel   -- show level in bt/nt expansions
     showqualify -- show phrase qualifiers
     showpt      -- show preferred terms with *
     showid      -- show phrase ids

   NOTES
     level is a number then a colon at the start of the phrase
     pt is an asterisk then a colon at the start of the phrase
     id is a colon, then the id at the end of the phrase
     qualify is in parens after a space at the end of the phrase
        but before id

   example:

     preferred term
     |
     |   phrase
     |   |
     |   |      qualifier
     |   |      |
     |   |      |      phraseid
     |   |      |      |
     V   V      V      V
    {*:TURKEY (BIRD):1234}

   RETURN
*/
PROCEDURE output_style (
  showlevel   in boolean default false
, showqualify in boolean default false
, showpt      in boolean default false
, showid      in boolean default false
);

/*------------------------------- sn -----------------------------------*/

function sn(phrase in varchar2,
            tname  in varchar2 default 'DEFAULT',
            i      in number   default '1')
return varchar2;

/*------------------------------- ttt -----------------------------------*/

procedure ttt(tname  in varchar2 default 'DEFAULT');

end drithsx;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIUTL" as

/*-------------------------------- get_dbid --------------------------------*/
/*
  NAME
   get_dbid - get database identifier
  DESCRIPTION
   returns a number which is unique to the database (in OPS, there are
   multiple databases sharing a disk)
*/
function get_dbid return number;
--  pragma restrict_references ( get_dbid, WNDS );

/*--------------------------- parse_object_name ----------------------------*/
/* parse object name user.name */

procedure parse_object_name(
  spec  in     varchar2,
  uname in out varchar2,
  oname in out varchar2
);

/*----------------------------- split_list --------------------------------*/
/*
  NAME
    split_list -

  DESCRIPTION
    A list can be contiguous or non-contiguous.

    list=1,500,   contiguous=1 is a contig. list
    list=1,4,5,6  contiguous=0 is a non-contig list

    if we required 20 in the first list, it will be splited into:
      lower_list=1,20
      upper_list=21,500

    if we required 2 in the second list, it will be splited into:
      lower_list=1,4
      upper_list=5,6

  ARGUMENTS
   list          (in)  the list
   contiguous    (in)  1= contig. 0=non-contig
   size_required (in)  list length
   lower_list    (out) lower list after splited
   upper_list    (out) upper list after splited

  NOTES
   None
  EXCEPTIONS

  RETURNS
    none
*/

procedure split_list(
  list in varchar2,
  contiguous    in number,
  size_required in number,
  lower_list    out varchar2,
  upper_list    out varchar2
);


/*-------------------------------- split -----------------------------------*/
/*
  NAME
    split

  DESCRIPTION
    Takes a list of values separated by a delimiter and return a
    array containing the values. a delimiter character preceded
    by a backslash will be treated as part of the value instead.

  ARGUMENTS
    vlist      -    list of values
    delimiter  -    the delimiter, one character only
    varr       -    array of values

  NOTES

  EXCEPTIONS

  RETURNS
*/
PROCEDURE split(
  vlist       in      varchar2
, delimiter   in      varchar2
, varr        in out  dr_def.vc256_tab
);

/*---------------------------------- genid ---------------------------------*/
/*
  NAME
    genid - generate an TexTile dictionary id number
  DESCRIPTION
    TexTile dict. id number is used to assigned to INDEX or PREFERENCE.

  ARGUMENTS
    None
  NOTES

  EXCEPTIONS

  RETURNS
    id number
*/
function genid return number;


/*---------------------------- pkey_toolong ---------------------------------*/
/*
  NAME
    pkey_toolong - check a length of a given primary key is too long or not
  DESCRIPTION
    as pkey can be an encoded composite pkey string, the checking need to be
    done on the overall length and the individual textkey length

  ARGUMENTS
    pk -- primary key string
  NOTES

  EXCEPTIONS

  RETURNS
    toolong boolean
*/
function pkey_toolong(pk in varchar2) return boolean;


/*---------------------------- get_user ------------------------------*/
/*
  NAME
    get_user - get the effective user

  DESCRIPTION
    returns the user name of user who directly calls  CTXSYS.(DR_% or
    (CTX_%)

    e.g.
    USER_B has CTXAPP priv, USER_A does not. USER_B grants execute on
    proc2 to USER_A.

    USER_A.proc1 -> USER_B.proc2 -> CTXSYS.(DR_% or CTX_%)

    the effective user is USER_B, not USER_A.

    Must call get_user to return the effective user to be passed to
    DRIACC.CAN

  ARGUMENTS

  NOTES

  EXCEPTIONS
*/
function get_user(ignore_anon in boolean default FALSE) return varchar2;

/*---------------------------- get_user_id ---------------------------*/
/*
  NAME
    get_user_id - get user# from sys.user$
*/
function get_user_id(p_username in varchar2) return number;

/*---------------------------- get_user_name ---------------------------*/
/* opposite of get_user_id */

function get_user_name(p_userid in binary_integer) return varchar2;

/*---------------------------- get_obj_id ---------------------------*/
/*
  NAME
    get_obj_id - get obj# from sys.obj$
*/
function get_obj_id(p_user_name in varchar2, p_object_name in varchar2,
                    p_partition_name in varchar2 default NULL)
return number;

/*---------------------------- is_ops ------------------------------*/
/*
  NAME
    is_ops

  DESCRIPTION
    returns TRUE when running in parallel server mode, FALSE otherwise
  ARGUMENTS

  NOTES

  EXCEPTIONS
*/
function is_ops return boolean;

/*---------------------------- mem_to_number --------------------------*/
/*
  NAME
    mem_to_number

  DESCRIPTION
    Converts inputs like 1k, 10G, 12M to their approriate value in bytes
  ARGUMENTS
    memstring - Input string, may be a number or one of these formats:
                10K, 10M, 10G
    llimit    - Lower limit to the number that memstring can represent
    ulimit    - Upper limit to the number that memstring can represent
  NOTES

  EXCEPTIONS
    Throw an error if memstring doesn't lie in range (llimit, ulimit)
*/
function mem_to_number(memstring in varchar2, llimit in number,
                       ulimit in number)
return number;

/*---------------------------- idxmem_to_number --------------------------*/
/*
  NAME
    idxmem_to_number

  DESCRIPTION
    a bit more specialized -- this converts an idxmem string to a number.
    if passed null it will return DEFAULT_INDEX_MEMORY.

  ARGUMENTS

  NOTES

  EXCEPTIONS
*/
function idxmem_to_number(memstring in varchar2) return number;

/*---------------------------- syncmem_to_number --------------------------*/
/*
  NAME
    syncmem_to_number

  DESCRIPTION
    a bit more specialized -- this converts an syncmem string to a number.
    if passed null it will return idexmem.

  ARGUMENTS

  NOTES

  EXCEPTIONS
*/
function syncmem_to_number(memstring in varchar2,
                           idxmem    in number)
return number;

/*--------------------------- make_pfx ------------------------------------*/
/*
  NAME
    make_pfx

  DESCRIPTION
    create propre index prefix

  ARGUMENTS

  NOTES

  EXCEPTIONS
*/

FUNCTION make_pfx (idx_owner in varchar2, idx_name in varchar2,
                   pfx_type  in varchar2 default '$',
                   part_id   in number default null,
                   constraint_pfx in boolean default FALSE)
return varchar2;

/*--------------------------- check_language -----------------------------*/
/*
  NAME
    check_language

  DESCRIPTION
    check a string to ensure it is a valid NLS language value
    returns NLS version of language name and abbreviation

  ARGUMENTS

  NOTES

  EXCEPTIONS
*/

FUNCTION check_language (
  lang     in  varchar2,
  nls_lang out varchar2,
  nls_abb  out varchar2,
  def_ok   in  boolean default TRUE
) return boolean;

/*--------------------------- lang_to_abbr -----------------------------*/
/*
  NAME
    lang_to_abbr

  DESCRIPTION
    given an NLS language name, return the NLS abbreviation

  ARGUMENTS

  NOTES
    callable from SQL.
    Must be a valid language, in uppercase.
    if lang is unknown, then NULL is returned.
  EXCEPTIONS
*/

FUNCTION lang_to_abbr (
  lang     in  varchar2
) return varchar2;
pragma restrict_references (lang_to_abbr, wnds, wnps, rnds, rnps);

/*---------------------------- keycomp_ok ----------------------------------*/
/* test database, return TRUE if key compressed indexes are enabled */

FUNCTION keycomp_ok return BOOLEAN;

/*---------------------- verify_np_index_tables ----------------------------*/

PROCEDURE verify_np_index_tables (
  idx_owner in varchar2,
  idx_name  in varchar2,
  idx_id    in number,
  idx_pid   in number
);

/*--------------------------- get_slave_id --------------------------------*/

PROCEDURE get_slave_id(
  slaveid     out  varchar2
);

/*--------------------------- get_default_prefname ----------------------*/
/* finding the default value by given the name of default preference */
FUNCTION get_default_value(
  defname       in   varchar2
) return varchar2;

/*---------------------------- bytestr -------------------------------*/
/* return a byte amount in readble form */

function bytestr (a in number) return varchar2;

/*---------------------------- numstr ---------------------------------*/
/* return a large number in readable form */

function numstr (a in number) return varchar2;

/*---------------------------- pctstr ---------------------------------*/
/* calculate and return a percentage in readable form */

function pctstr (fig in number, base in number, rnd in number default 2)
return varchar2;

/*---------------------------- NormalizeObjectName --------------------------*/
/* Normalize a name by stripping quotes and upper casing. */

DO_NOT_VALIDATE_SQL_NAME constant number := 0;
CHECK_QUALIFIED_SQL_NAME constant number := 1;

function NormalizeObjectName
(
  object_name in varchar2,
  validation  in number default DO_NOT_VALIDATE_SQL_NAME
) return varchar2;

procedure lock_index(idxid in number);

procedure lock_partition(idxid in number, ixpid in number);

/* ---------------------------- validate_storage ----------------------*/
/* Added for bug 7425113.  Validates the supplied storage clause string
 * and raises errors for suspect values (such as embedded comments) which
 * could be signs of potential SQL injection.  If there are no errors
 * then storage_clause is returned unchanged.
 */
function validate_storage(clause_value in varchar2,
                          clause_name in varchar2)
  return varchar2;

/*--------------------------- get_hash_area_size ---------------------------*/
function get_hash_area_size return number;
procedure set_hash_area_size(hashmem in number);

/*------------------------- CheckNumLangIndSLXSW --------------------------*/
/* This function checks the number of remaining language independent sublexers
 * and stopwords in the index.
 */
FUNCTION CheckNumLangIndSLXSW(
  idx_id in number
) return number;

/*---------------------------- get_ctx_doc_polstem --------------------------*/
/* get _ctx_doc_policy_stems parameter for this instance */
function get_ctx_doc_polstems
return boolean;

/*------------------------------ is_decimal_value --------------------------*/
/* Is this number a decimal value or not ? */
function is_decimal_value(value number)
return boolean;

/*---------------------------- is_shadow_index --------------------------*/
/* check if index being refered to is a shadow index */
function is_shadow_index(idx_name varchar2)
return boolean;

/*---------------------------- parse_shadow_index --------------------------*/
/* parse shadow index to get index id and partition id */
procedure parse_shadow_index(rio_idx_name in     varchar2,
                             idx_id       in out number,
                             idx_suffix   in out varchar2
);

/*---------------------------- get_shadow_index --------------------------*/
/* get shadow index given base index id */
function get_shadow_index(idx_name   in varchar2,
                          idx_suffix in varchar2
)
return varchar2;

end driutl;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIVAL" AS

function validate_pref(
  p_pref_name varchar2,
  p_class_id  number
) return dr_def.pref_rec;

procedure validate_attr(p_pref        in      dr_def.pref_rec,
                        p_attr_name   in      varchar2,
                        p_attr_value  in out  varchar2);

/*----------------------- ValidateCTXRULEOptions  -----------------------*/
/*
  NAME
    ValidateCTXRULEOptions

  DESCRIPTION
    Validate the attributes used during the construction of a CTXRULE index.
    The invalid attribute value are:
       * PREFIX_INDEX can not be set to TRUE
       * SUBSTRING_INDEX can not be set to TRUE

  ARGUMENTS
    opts - a creation record

  NOTES
    This function was added for Bug 5237224.

  EXCEPTIONS
    DRIG.QE_CTXRULE_INVALIDATTR is raised if an invalid attribute
    value is present.  It has two possible arguments.  These are
    'PREFIX_INDEX' or 'SUBSTRING_INDEX'.

  RETURNS
    0 if the attributes are acceptable
    1 if the attribute settings can not be used in a CTXRULE index.

*/
FUNCTION ValidateCTXRULEOptions (
  opts driparse.createrec
) return number;

end drival;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIXMD" authid definer is

  VERSION_LATEST constant number := 8130;
  VERSION_CEILING constant number   := 32000;

/*---------------------------- SetActiveIndex  ---------------------------*/

procedure SetActiveIndex(
  p_idxid           in number
);

/*---------------------------- CheckAccess  ------------------------------*/

procedure CheckAccess(
  p_invoker         in number,
  p_idxid           in number
);


/*------------------------- CheckIndexQueryable  -------------------------*/
/* call before attempting query operation on an index */

procedure CheckIndexQueryable(
  p_idxid           in number
);

/*---------------------------- GetIndexMD  -------------------------------*/
/* fetch selected dr$index column values into out variables */

procedure GetIndexMD(
  p_idxid           in  number,
  o_owner           out varchar2,
  o_owner#          out number,
  o_name            out varchar2,
  o_table_obj#      out number,
  o_table_dataobj#  out number,
  o_key_name        out varchar2,
  o_key_type        out binary_integer,
  o_text_name       out varchar2,
  o_text_type       out binary_integer,
  o_text_length     out binary_integer,
  o_lang_col        out varchar2,
  o_fmt_col         out varchar2,
  o_cset_col        out varchar2,
  o_idx_type        out binary_integer,
  o_idx_option      out varchar2,
  o_idx_sync_type   out varchar2,
  o_idx_sync_memory out binary_integer,
  o_idx_src_name  out varchar2,
  o_idx_src_id    out binary_integer,
  o_idx_version   out binary_integer,
  o_config_col      out varchar2
);

/*---------------------------- GetIndexID  -------------------------------*/
/* get index id by name */

FUNCTION GetIndexID(
  p_idx_name in varchar2
) return number;

/*---------------------------- FastGetIndexID  ---------------------------*/
/* get index id by owner, name */

FUNCTION FastGetIndexID(
  p_idx_owner in varchar2,
  p_idx_name  in varchar2
) return number;

/*--------------------------- GetIndexRec  -------------------------------*/
/* get index meta data as a record */

POL_INDEX_ONLY      constant number := 0;
POL_POLICY_ONLY     constant number := 1;
POL_INDEX_OR_POLICY constant number := 2;

SEC_NONE            constant number := 0;
SEC_CONTAINS        constant number := 1;
SEC_OWNER           constant number := 2;
SEC_ALTER           constant number := 3;
SEC_DROP            constant number := 4;

FUNCTION GetIndexRec(
  p_idx_name in varchar2,
  f_ispolicy in number    default POL_INDEX_ONLY,
  f_security in number    default SEC_CONTAINS
) return dr_def.idx_rec;

/*--------------------------- ImportingIndex  ----------------------------*/
/* return true if the index name is in import state */
/* note: pass in simple name.  owner is implied -SESSIONID */

FUNCTION ImportingIndex(
  p_idx_name  in varchar2
) return boolean;

/*----------------------- GetIndexStorage  -----------------------*/
/* get index storage clauses */

STO_I   constant number := 1;
STO_R   constant number := 2;
STO_K   constant number := 3;
STO_N   constant number := 4;
STO_P   constant number := 5;
STO_X   constant number := 6;
STO_RX  constant number := 7;
STO_S   constant number := 8;
STO_BI  constant number := 9;
STO_SO  constant number := 10;
STO_M   constant number := 11;
STO_RT  constant number := 12;
STO_G   constant number := 13;
STO_H   constant number := 14;
STO_A   constant number := 15;
STO_F   constant number := 16;
STO_FC  constant number := 17;
STO_FI  constant number := 18;
STO_O   constant number := 19;
STO_Z   constant number := 20;
STO_SC  constant number := 21;
STO_D   constant number := 22;
STO_SN  constant number := 23;
STO_SNIX   constant number := 24;
STO_E   constant number := 25;
STO_SITG   constant number := 26;
STO_SR  constant number := 27;
STO_W   constant number := 28;
STO_Y   constant number := 29;
STO_FP  constant number := 30;

PROCEDURE GetIndexStorage(
  p_idxid    in  number,
  p_ixpid    in  number,
  o_clause   in out dr_def.vc500_tab
);

/*------------------------- GetIndexRecByID  -----------------------------*/
/* get index meta data as a record */

FUNCTION GetIndexRecByID(
  p_idxid    in number
) return dr_def.idx_rec;

/*---------------------------- GetPartitionRec ---------------------------*/
/* get partition meta data as a record */

FUNCTION GetPartitionRec(
  p_ixp_name in varchar2,
  p_idx      in dr_def.idx_rec
) return dr_def.ixp_rec;

/*-------------------------- GetPartitionRecByID -------------------------*/
/* get partition meta data as a record */

FUNCTION GetPartitionRecByID(
  p_ixpid in number,
  p_idxid in number
) return dr_def.ixp_rec;

/*---------------------------- GetPartitionID ---------------------------*/
/* get partition ID */

FUNCTION GetPartitionID(
  p_ixp_name in varchar2,
  p_idxid    in number
) return number;

/*---------------------------- GetAllPartitionInfo ---------------------------*/
/* get all partition ids and names */

procedure GetAllPartitionInfo(
  p_idxid   in number,
  o_ids     out nocopy dr_def.id_tab,
  o_names   out nocopy dr_def.vc30_tab
);

/*---------------------------- GetAllPartitions ---------------------------*/
/* get all partition metadata in a table */

PROCEDURE GetAllPartitions(
  p_idxid    in number,
  p_idxtab#  in number,
  o_ixp      in out nocopy dr_def.ixp_tab
);

/*---------------------------- GetIndexPartition  -----------------------*/
/* get dr$index_partition information */

procedure GetIndexPartition(
  o_id               out number,
  o_tabpart_dataobj# out number,
  o_sync_type        out varchar2,
  o_sync_memory      out number,
  o_option           out varchar2,
  i_cid               in number,
  i_pname             in varchar2
);

/*---------------------------- OpenIndexMDScan ----------------------*/
/* open dr$index_object/dr$index_value cursors */

procedure OpenIndexMDScan(
  p_idxid           in  number
);

/*---------------------------- NextIndexObject ---------------------------*/
/* get next dr$index_object cursor */

function NextIndexObject(
  o_cla_id          out binary_integer,
  o_obj_id          out binary_integer,
  o_acnt            out binary_integer
) return binary_integer;

/*---------------------------- GetIndexObject ----------------------------*/
/* get a single object id */

PROCEDURE GetIndexObject(
  p_idxid           in  number,
  p_cla_id          in  binary_integer,
  o_obj_id          out binary_integer,
  o_acnt            out binary_integer
);

/*-------------------------- GetAllIndexObjects ----------------------------*/
/* get the index objects as a table */

PROCEDURE GetAllIndexObjects(
  p_idxid           in  number,
  o_objs            in out nocopy dr_def.ixo_tab
);

/*---------------------------- NextIndexValue ----------------------------*/
/* get next dr$index_value cursor */

function NextIndexValue(
  o_cla_id          out binary_integer,
  o_att_id          out binary_integer,
  o_datatype        out binary_integer,
  o_sub_group       out binary_integer,
  o_sub_att_id      out binary_integer,
  o_sub_datatype    out binary_integer,
  o_value           out varchar2
) return binary_integer;

/*---------------------------- NextIndexCDI ---------------------------*/
/* get next dr$index_cdi_column cursor */

function NextIndexCDI(
  o_cdi_pos         out binary_integer,
  o_cdi_type#       out binary_integer,
  o_cdi_len         out binary_integer,
  o_cdi_name        out varchar2,
  o_cdi_sec         out varchar2,
  o_cdi_stype       out binary_integer,
  o_cdi_id          out binary_integer
) return binary_integer;

/*---------------------------- GetDocidCount -----------------------------*/
/* get docid count */

function GetDocidCount(
  p_idxid           in number,
  p_ixpid           in number default null
) return number;

/*---------------------------- GetNextid  -----------------------------*/
/* get next docid */

function GetNextid(
  p_idxid           in number,
  p_ixpid           in number default null
) return number;

/*---------------------------- GetIndexStats -----------------------------*/
/* get index stats from dr$stats */

procedure GetIndexStats(
  p_idxid           in number,
  p_smplsz          in out nocopy number
);

/*---------------------------- GetBaseTableName --------------------------*/
/* get base table name */

procedure GetBaseTableName(
  p_idxid           in number,
  p_ixpid           in number,
  o_objname         out varchar2
);

/*---------------------------- IncrementDocCnt --------------------------*/
/* increment docid count */

procedure IncrementDocCnt(
  p_idxid           in number,
  p_ixpid           in number,
  p_delta           in number
);

/*---------------------------- DecrementDocCnt --------------------------*/
/* decrement docid count */

procedure DecrementDocCnt(
  p_idxid           in number,
  p_ixpid           in number,
  p_delta           in number
);

/*---------------------------- AllocateDocids ---------------------------*/
/* allocate docids */

procedure AllocateDocids(
  p_idxid           in  number,
  p_ixpid           in  number,
  p_allocsz         in  binary_integer,
  p_startid         out number
);

/*---------------------------- SetIndexStatus --------------------------*/
/* set index status */

  STATE_NO_INDEX       constant varchar2(10) := 'NO_INDEX';
  STATE_POPULATE       constant varchar2(10) := 'POPULATE';
  STATE_POPULATE_K     constant varchar2(10) := 'POPULATE_K';
  STATE_PART_BUILD     constant varchar2(10) := 'PARTBUILD';
  STATE_INDEXING       constant varchar2(10) := 'INDEXING';
  STATE_INDEXED        constant varchar2(10) := 'INDEXED';
  STATE_UPGRADING      constant varchar2(10) := 'UPGRADING';
  STATE_IMPORT         constant varchar2(10) := 'IMPORT';
  STATE_SCH_SYNC       constant varchar2(10) := 'SCHE_SYNC';
  STATE_POPULATE_P     constant varchar2(10) := 'POPULATE_P';

procedure SetIndexStatus(
  p_idxid           in  number,
  p_ixpid           in  number,
  p_status          in  varchar2,
  f_commit          in  boolean default TRUE
);

/*---------------------------- GetIndexStatus  -----------------------*/
/* get index status */

FUNCTION GetIndexStatus(
   p_idxid     in  number
 ) return VARCHAR2;

/*---------------------------- ChangeIndexOption -----------------------*/
/* modify the index option field */

  OPT_SET    constant number := 0;
  OPT_ADD    constant number := 1;
  OPT_REMOVE constant number := 2;

PROCEDURE ChangeIndexOption (
  p_idxid     in number,
  p_opt       in varchar2,
  p_action    in number,
  p_ixpid     in number default 0
);

/*----------------------------- AllocatePartId ---------------------------*/
/* Allocate index partition id                                            */

FUNCTION AllocatePartId(
  idxid           in    number
) return number;

/*----------------------------- CreatePartitionMD  -----------------------*/
/* set up partition meta-data */

PROCEDURE CreatePartitionMD(
  p_idxid         in     number,
  p_ixpid         in out number,
  p_idx_partition in     varchar2,
  p_table_owner   in     varchar2,
  p_table_name    in     varchar2,
  p_tab_partition in     varchar2,
  p_storage       in     varchar2,
  p_sync_type     in out varchar2,
  p_sync_memory   in out varchar2,
  p_sync_paradegree  in out number,
  p_sync_interval    in out varchar2,
  is_online          in boolean default FALSE,
  p_sync_dpl         in boolean default FALSE
);

/*----------------------------- DropPartitionMD  --------------------------*/
/* drop partition meta-data */

PROCEDURE DropPartitionMD(
  p_idxid         in     number,
  p_ixpid         in     number
);

/*---------------------------- PurgeKGL ----------------------------------*/
/* purge KGL metadata cache */

PROCEDURE PurgeKGL(p_idxid in number, ia sys.odciindexinfo,
                   isPart boolean default FALSE);

PROCEDURE PurgeKGL(p_idx in dr_def.idx_rec);

PROCEDURE PurgeKGL(p_idxid in number, owner in varchar2,
                   index_name in varchar2,
                   other_name in varchar2 default NULL);

/*---------------------------- CreatePolicy ------------------------------*/
/* create policy */

  IDX_TYPE_CONTEXT     constant number := 0;
  IDX_TYPE_CTXCAT      constant number := 1;
  IDX_TYPE_CTXRULE     constant number := 2;
  IDX_TYPE_CTXXPATH    constant number := 3;

PROCEDURE CreatePolicy(
    ia              in  sys.ODCIIndexInfo,
    p_idx_type      in  number,
    p_idx_owner     in  varchar2,
    p_idx_name      in  varchar2,
    p_tab_owner     in  varchar2,
    p_tab_name      in  varchar2,
    p_col_name      in  varchar2,
    p_col_type      in  varchar2,
    p_lang_col      in  varchar2,
    p_fmt_col       in  varchar2,
    p_cset_col      in  varchar2,
    p_idx_id        out number,
    p_dstore        in  varchar2 default null,
    p_filter        in  varchar2 default null,
    p_secgrp        in  varchar2 default null,
    p_lexer         in  varchar2 default null,
    p_wordlist      in  varchar2 default null,
    p_stoplist      in  varchar2 default null,
    p_storage       in  varchar2 default null,
    p_indexset      in  varchar2 default null,
    p_classifier    in  varchar2 default null,
    p_txntional     in  varchar2 default null,
    p_sync_type     in out varchar2,
    p_sync_memory   in out varchar2,
    p_sync_paradegree  in out number,
    p_sync_interval    in out varchar2,
    f_partitioned   in  boolean  default FALSE,
    f_functional    in  boolean  default FALSE,
    f_online        in  boolean  default FALSE,
    f_entity_policy in  boolean  default FALSE,
    f_tree          in  boolean  default FALSE,
    p_sync_dpl      in  boolean  default FALSE,
    p_config_col    in  varchar2 default null
);

/*---------------------------- CopyPolicy ----------------------------------*/
/* copy index-level meta-data */

PROCEDURE CopyPolicy(
    p_source_policy  in varchar2,
    p_pol_owner      in varchar2,
    p_pol_name       in varchar2
);

/*---------------------------- DropPolicy ----------------------------------*/
/* drop index-level meta-data */

PROCEDURE DropPolicy(
    p_idxid in number
);

/*---------------------------- DropUserPolicies ----------------------------*/

PROCEDURE DropUserPolicies(
  p_username in varchar2 := null
);

/*----------------------------- ResetIndexIDs  -----------------------------*/
/* reset owner and table id's during an import */

PROCEDURE ResetIndexIDs (
    p_idxid     out number,
    p_owner     in  varchar2,
    p_idx_name  in  varchar2,
    p_tab_owner in  varchar2,
    p_tab_name  in  varchar2,
    p_ipar_name in  varchar2 default null,
    p_tab_part  in  varchar2 default null
);

/*---------------------------- IndexHasPTable ------------------------------*/

FUNCTION IndexHasPTable(
  p_idxid in number)
RETURN boolean;

/*---------------------------- IndexHasSTable ------------------------------*/

FUNCTION IndexHasSTable(
  p_idxid in number)
RETURN boolean;

/*---------------------------- IndexHasMTable ------------------------------*/

FUNCTION IndexHasMTable(
  p_idxid in number)
RETURN boolean;

/*---------------------------- IndexHasFATables ----------------------------*/

FUNCTION IndexHasFATables(
  p_idxid in number)
RETURN boolean;

/*---------------------------- IndexHasMVDATA ------------------------------*/

FUNCTION IndexHasMVDATA(
  p_idxid in number)
RETURN boolean;

/*---------------------------- IsIndexReadable ------------------------------*/

FUNCTION IsIndexReadable(
  p_idxid in number,
  p_ixpid in number default NULL)
RETURN boolean;

/*---------------------------- IndexHasGTable ------------------------------*/

FUNCTION IndexHasGTable(
  p_idxid in number,
  p_ixpid in number default NULL)
RETURN boolean;

/*---------------------------- IndexHasOTable ------------------------------*/

FUNCTION IndexHasOTable(
  p_idxid in number)
RETURN boolean;

/*---------------------------- IndexHasDTable ------------------------------*/

FUNCTION IndexHasDTable(
  p_idxid in number)
RETURN boolean;

/*---------------------------- IndexHasETable ------------------------------*/

FUNCTION IndexHasETable(
  p_idxid in number)
RETURN boolean;

/*----------------------  CheckIndexesForExchange --------------------------*/
/* ensure that a global index and an index partition are compatible for */
/* exchange partition operation */

PROCEDURE CheckIndexesForExchange(
  p_idxp  in dr_def.idx_rec,
  p_idxn  in dr_def.idx_rec
);

/*--------------------------- ExchangeIndexMD ---------------------------*/
/* exchange meta data */

procedure ExchangeIndexMD(
  p_idxn   in dr_def.idx_rec,
  p_idxpid in number,
  p_ixpp   in dr_def.ixp_rec
);

/*--------------------------- RenameIndex -------------------------------*/
/* rename an index */

procedure RenameIndex(
  p_idxid   in number,
  p_ixpid   in number,
  p_newname in varchar2
);

/*--------------------------- RenameIndexCol ----------------------------*/
/* rename index column */

procedure RenameIndexCol(
  p_idxid   in number,
  p_newname in varchar2
);

/*--------------------------- GetAllPartitionIDs ------------------------*/
/* get all partition id's */

procedure GetAllPartitionIDs(
  p_idxid   in number,
  o_ids     out nocopy dr_def.id_tab
);

/*--------------------------- GetAllPartitionOPTs ------------------------*/
/* get all partition option's */

procedure GetAllPartitionOPTs(
  p_idxid   in number,
  o_opts    out nocopy dr_def.vc256_tab
);

/*--------------------------- GetAllPartitionNMs ------------------------*/
/* get all index partition names */

procedure GetAllPartitionNMs(
  p_idxid   in number,
  o_names   out nocopy dr_def.vc30_tab
);

/*--------------------------- SetIndexMD --------------------------------*/
/* change a field of index meta-data */

  MDF_LANGCOL constant number := 0;
  MDF_FMTCOL  constant number := 1;
  MDF_CSETCOL constant number := 2;
  MDF_CONFIGCOL constant number := 3;
  MDF_NEXTID  constant number := 4;
  MDF_SYNC_TYPE        constant  number := 5;
  MDF_SYNC_MEMSIZE     constant  number := 6;
  MDF_SYNC_PARADEGREE  constant  number := 7;
  MDF_SYNC_INTERVAL    constant  number := 8;

procedure SetIndexMD(
  p_idxid   in number,
  p_ixpid   in number,
  p_field   in binary_integer,
  p_newval  in varchar2,
  f_commit  in boolean default TRUE
);

/*--------------------------- CreateSQE ----------------------------------*/
/* create a new SQE (should be in its own package, like drisgp or drispl, */
/* but this is only two procedures)                                       */

procedure CreateSQE(
  p_sqe   in varchar2
 ,p_query in clob
 ,p_duration in number
);

/*--------------------------- DropSQE -----------------------------------*/
/* drop SQE */

procedure DropSQE(
  p_sqe   in varchar2
);

/*--------------------------- DropUserSQEs ---------------------------------*/
/* Drop SQE's owned by a user, or all unreferenced SQEs if p_username is    */
/* null                                                                     */

procedure DropUserSQEs(
  p_username in varchar2 := null
);


/*--------------------------- GetSysParam ----------------------------------*/
/* get value of system parameter (should be in something like driadm, but */
/* this is only one procedure... */

function GetSysParam (
  p_param in varchar2
) return varchar2;

/*---------------------------- RecordJob ----------------------------------*/
/*record the job name in dr$index                                          */

procedure RecordJob (
  idxid     in  number,
  ixpid     in  number default null,
  jobname   in  varchar2
);

/*--------------------------- GetJob ------------------------------------*/
/* Remove the job                                                         */
function GetJob (
  idxid    in number,
  ixpid    in number default NULL
) return varchar2;

/*--------------------------- SetSyncAttr-------------------------------*/
procedure SetSyncAttr(
  idxid   in number,
  ixpid   in number,
  sync_type       in varchar2,
  sync_memory     in varchar2,
  sync_paradegree in number,
  sync_interval   in varchar2
);

/*--------------------------- GetSyncAttr-------------------------------*/
procedure GetSyncAttr(
  idxid           in  number,
  ixpid           in  number default null,
  sync_type       out varchar2,
  sync_memory     out varchar2,
  sync_paradegree out number,
  sync_interval   out varchar2,
  sync_jobname    out varchar2
) ;

/*---------------------- CheckIndexForOraCon  -----------------------------*/
/*compare a policy and index and determine if they are close enough        */

function CheckIndexForOraCon (
  p_idxid   in  number,
  p_polid   in  number
) return number;


/*---------------------- OraConRewriteChk  -----------------------------*/
/* Checks to see if a Text index and Text query qualifies for           */
/* Ora:Contains() query rewrite.                                        */

function OraConRewriteChk (
  p_idxname   in  varchar2,
  p_idxown    in  varchar2,
  p_polname   in  varchar2,
  p_polown    in  varchar2,
  p_qry       in  varchar2
) return boolean;


/*---------------------- IndexHasPendingRows  --------------------------*/
/* Checks to see if a Text index currently has pending rows             */

function IndexHasPendingRows (
  p_idxid in number)
return boolean;

/*---------------------- GetMVFlag -------------------------------------*/
/*  checkto see if index is on Materialized view                        */

procedure GetMVFlag(
  table_id     in number,
  owner_name   in varchar2,
  opt          out binary_integer
);

/*---------------------------- CopyIndexMDRIO ---------------------------*/
/* copy index meta-data for Recreate Index Online */

PROCEDURE CopyIndexMDRIO(
    p_src  in dr_def.idx_rec,
    p_dst  in out nocopy dr_def.idx_rec,
    p_create  in boolean
);

PROCEDURE CopyPartMDRIO(
    ixp    in dr_def.ixp_rec,
    idx    in dr_def.idx_rec,
    p_create  in boolean
);

/*---------------------------- GetAllCDIColumns ---------------------------*/

PROCEDURE GetAllCDIColumns(
  p_idxid in number,
  o_cdi   in out nocopy dr_def.cdi_tab
);

/*---------------------------- UpdateSDATA ---------------------------*/

PROCEDURE UpdateSDATA(
  p_idxid    in number,
  p_ixpid    in number,
  p_docid    in number,
  p_sdata_id in number,
  p_dtype    in varchar2,
  p_nval     in sys.anydata
);

/*---------------------------- ChkIndexOption -----------------------------*/
/*
  Take in index id, and an option letter (see drdmlop() for a list of
  options), return 1 if the given option is set, 0 otherwise.
*/
function ChkIndexOption (
  p_idxid  in number,
  p_opt    in varchar2
) return number;

/*---------------------------- SelectUserAnlDictLob-----------------------------*/
/*
  Take index id and dictionary language as input and return user supplied
  dictionary lob to be used by ATG auto lexer
*/
function SelectUserAnlDictLob(
  p_idxid  in number,
  p_dictlang in varchar2
) return clob;

/*--------------------------- CompareIndexObjectValuesPref -----------------*/
/*
 * compare the attribute values of a single class between an index and a
 * preference name. return the actual differences in a table of type ixo_tab
*/

procedure CompareIndexObjectValuesPref(
  p_idxid in number,
  p_pref  in varchar2,
  p_cla_id in number,
  diffs   in out dr_def.ixv_tab
);

/*--------------------------- RemoveStageItab ------------------------------*/
/* remove stage_itab from dr$index_value without modifying storage pref */
procedure RemoveStageItab(
  p_idxid in number,
  p_ixpid in number default 0
);

/*--------------------------- AddStageItab ---------------------------------*/
/* add stage_itab from dr$index_value without modifying storage pref */
procedure AddStageItab(
  p_idxid in number,
  p_ixpid in number default 0
);

/*--------------------------- GetFieldFid ---------------------------------*/
/* Given a field section name and tag, find its FID */
procedure GetFieldFid(
  idxid in number,
  fld_name in varchar2,
  fld_tag in varchar2,
  fldfid out number);

/*--------------------------- RemZoneFromMD -------------------------------*/
/* Given an Index ID remove Zone sections from Index Metadata */
procedure RemZoneFromMD(
  idxid in number,
  zone_name in varchar2,
  zone_tag in varchar2);

/*--------------------------- check_auto_optimize --------------------------*/
/* is this index subject to auto_optimize */
CheckAutoOptimizeOK      constant number := 0;
CheckAutoOptimizeDisable constant number := 1;
CheckAutoOptimizeRunning constant number := 2;
CheckAutoOptimizeNotReg  constant number := 3;
CheckAutoOptimizeConcOpt constant number := 4;

function check_auto_optimize(p_idx in dr_def.idx_rec,
                             p_ixp in dr_def.ixp_rec,
                             p_override in boolean default false)
return number;

/*--------------------------- start_auto_optimize --------------------------*/
/* start an auto_optimize job */
procedure start_auto_optimize;

/*--------------------------- stop_auto_optimize ---------------------------*/
/* forcibly stop an auto_optimize job */
procedure stop_auto_optimize;

/*--------------------------- run_auto_optimize ---------------------------*/
/* actually run an auto_optimize job */
procedure run_auto_optimize;

/*--------------------------- add_auto_optimize ----------------------------*/
/* add an auto optimize index / partition */
procedure add_auto_optimize(p_idx in dr_def.idx_rec,
                            p_ixp in dr_def.ixp_rec);

/*--------------------------- remove_auto_optimize -------------------------*/
/* remove an auto optimize index / partition */
procedure remove_auto_optimize(p_idxid in number,
                               p_partname in varchar2 default null,
                               err_when_missing in boolean default FALSE);

/*--------------------------- reset_auto_optimize_status -------------------*/
/* reset the autoopt_status table */
procedure reset_auto_optimize_status;

/*--------------------------- autoopt_push_token --------------------------*/
/* autoopt_push_token - push a token to autooptimize */
procedure autoopt_push_token(p_message in raw);

/*--------------------------- autoopt_pop_token ----------------------------*/
/* autoopt_pop_token - pop a token for autooptimize */
procedure autoopt_pop_token(p_ret out number,
                            p_message out raw);

/*--------------------------- autoopt_cre_pipe -----------------------------*/
/* autoopt_cre_pipe - create a private pipe for autooptimize */
procedure autoopt_cre_pipe(p_ret out number);

/*--------------------------- TxnalGetKey --------------------------------*/
/* Return the key if it has been set.  Use second parameter to test if it
 * has not been set                                                       */

procedure TxnalGetKey(
  p_key in out raw
);

/*--------------------------- TxnalSetKey --------------------------------*/
/* Set the key.  Set flag                                                 */

procedure TxnalSetKey(
  p_key in raw
);

/*--------------------------- GetMultiblockReadCount -----------------------*/
function GetMultiblockReadCount return number;

/*------------------------ GetSLXMdataSecID ------------------------------*/
/* Get section id/token type for DR$ML MDATA section, doc level lexer     */

FUNCTION GetSLXMdataSecID(
  idxid in number
) return number;

/*--------------------------- isSES ----------------------------------------*/
/* This function checks whether we are running as SES */
FUNCTION isSES return boolean;

PROCEDURE GetAllSDATASecs(
  idxid     in number,
  sdata_secs in out dr_def.sec_tab
);

/*--------------------------- partid_to_partname -----------------------*/
/* Fetch partition name, given partition id and index id */

FUNCTION partid_to_partname(
  partid    in number,
  idxid     in number
) RETURN varchar2;

/* 14175174: ------------- SubstringEnabled ------------------------*/
FUNCTION SubstringEnabled(p_idxid in number) RETURN number;

end drixmd;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIFEAT" AUTHID CURRENT_USER AS
  FUNCTION dr$opr_track (track_info IN OUT NOCOPY CLOB)  RETURN INTEGER;
  FUNCTION dr$idx_track (track_info IN OUT NOCOPY CLOB)  RETURN INTEGER;
  FUNCTION dr$pac_track (track_info IN OUT NOCOPY CLOB)  RETURN INTEGER;
  PROCEDURE dr$feature_track
      (is_used OUT number, aux_count OUT number, sum_stat OUT clob);
END drifeat;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIENT" as

/*--------------------------- compile ---------------------------------------*/

PROCEDURE compile(
  idx            IN dr_def.idx_rec,
  compile_choice IN NUMBER,
  locking        IN NUMBER
);

/*--------------------------- chkextpol -------------------------------------*/
/* chkextpol - Check that policy is an extraction policy                     */
FUNCTION chkextpol(
  idx        IN dr_def.idx_rec
) return BOOLEAN;

PROCEDURE add_extract_rule(
  idx         IN  dr_def.idx_rec,
  rule_id     IN INTEGER,
  extraction_rule     IN VARCHAR2
);

PROCEDURE remove_extract_rule(
  idxid        IN NUMBER,
  remove_index IN BOOLEAN DEFAULT FALSE
);

end drient;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIENTL" AUTHID current_user as

/*------------------------- prep_dict -----------------------------------*/
/*
  NAME
    prep_dict

  DESCRIPTION
    prepare user dictionary for insertion
*/

FUNCTION prep_dict(
  p_policy IN VARCHAR2,
  locking  IN NUMBER
) return binary_integer;

/*------------------------- add_dict_entry-------------------------------*/
/*
  NAME
    add_dict_entry

  DESCRIPTION
    add a dictionary entry to the user dictionary

*/

PROCEDURE add_dict_entry(
  p_pid           IN NUMBER,
  p_eid           IN NUMBER,
  p_lang          IN VARCHAR2,
  p_mention       IN VARCHAR2,
  p_type          IN VARCHAR2,
  p_normid        IN NUMBER,
  p_altcnt        IN NUMBER
);

/*--------------------------- chkdupdict ------------------------------------*/
/*
  NAME
    chkdupdict
  DESCRIPTION
    Check whether a dictionary has already been loaded                       */

PROCEDURE chkdupdict;

/*----------------------- close_dict ----------------------------------*/
/*
  NAME
    close_dict

  DESCRIPTION
    run any closing procedures
*/

PROCEDURE close_dict;


/*--------------------------- drop_dict -------------------------------------*/
/*
  NAME
    drop_dict

  DESCRIPTION
    drop a user-defined dictionary
*/

PROCEDURE drop_dict;

end drientl;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVDISP" authid current_user is

  /*
   * NAME
   *   EXECTRUST - synchronous trust callout command
   *
   * RETURN
   *
   */
  procedure EXECTRUST(
                     idx_owner  in     varchar2,
                     idx_name   in     varchar2,
                     part_name  in     varchar2,
                     func_code  in     number,
  		     arg1       in     varchar2 default NULL,
  		     arg2       in     varchar2 default NULL,
  		     arg3       in     varchar2 default NULL,
  		     arg4       in     varchar2 default NULL,
  		     arg5       in     varchar2 default NULL,
  		     arg6       in     varchar2 default NULL,
  		     arg7       in     varchar2 default NULL,
  		     arg8       in     varchar2 default NULL,
  		     arg9       in     varchar2 default NULL,
  		     arg10      in     varchar2 default NULL
                    );

  /*
   * NAME
   *   EXECTRUST_RET - synchronous trust callout command with return
   *
   * RETURN
   *
   */
  procedure EXECTRUST_RET(
                     idx_owner  in     varchar2,
                     idx_name   in     varchar2,
                     part_name  in     varchar2,
                     func_code  in     number,
                     ret1       out    varchar2,
                     ret2       out    varchar2,
  		     arg1       in     varchar2 default NULL,
  		     arg2       in     varchar2 default NULL,
  		     arg3       in     varchar2 default NULL,
  		     arg4       in     varchar2 default NULL,
  		     arg5       in     varchar2 default NULL,
  		     arg6       in     varchar2 default NULL,
  		     arg7       in     varchar2 default NULL,
  		     arg8       in     varchar2 default NULL,
  		     arg9       in     varchar2 default NULL,
  		     arg10      in     varchar2 default NULL
                    );

  /*
   * NAME
   *   EXECTRUST_RET1 - synchronous trust callout command with 1 return
   *
   * RETURN
   *
   */
  function EXECTRUST_RET1(
                     idx_owner  in     varchar2,
                     idx_name   in     varchar2,
                     part_name  in     varchar2,
                     func_code  in     number,
  		     arg1       in     varchar2 default NULL,
  		     arg2       in     varchar2 default NULL,
  		     arg3       in     varchar2 default NULL,
  		     arg4       in     varchar2 default NULL,
  		     arg5       in     varchar2 default NULL,
  		     arg6       in     varchar2 default NULL,
  		     arg7       in     varchar2 default NULL,
  		     arg8       in     varchar2 default NULL,
  		     arg9       in     varchar2 default NULL,
  		     arg10      in     varchar2 default NULL
                    )
   return varchar2;

  /*
   * NAME
   *   EXECTRUST_ARRAY - synchronous trust callout command with arrays
   *
   * RETURN
   *
   */
  procedure EXECTRUST_ARRAY(
                     idx_owner  in     varchar2,
                     idx_name   in     varchar2,
                     part_name  in     varchar2,
                     func_code  in     number,
                     list1      in     sys.odcinumberlist,
                     list2      in     sys.odcinumberlist,
  		     arg1       in     varchar2 default NULL,
  		     arg2       in     varchar2 default NULL,
  		     arg3       in     varchar2 default NULL,
  		     arg4       in     varchar2 default NULL,
  		     arg5       in     varchar2 default NULL,
  		     arg6       in     varchar2 default NULL,
  		     arg7       in     varchar2 default NULL,
  		     arg8       in     varchar2 default NULL,
  		     arg9       in     varchar2 default NULL,
  		     arg10      in     varchar2 default NULL
                    );

  /*
   * NAME
   *   EXECASOWN - synchronous trust callout command
   *
   * RETURN
   *
   */
  procedure EXECASOWN(
                     idx_ownid  in     number,
                     idx_owner  in     varchar2,
                     idx_name   in     varchar2,
                     part_name  in     varchar2,
                     func_code  in     number,
  		     arg1       in     varchar2 default NULL,
  		     arg2       in     varchar2 default NULL,
  		     arg3       in     varchar2 default NULL,
  		     arg4       in     varchar2 default NULL,
  		     arg5       in     varchar2 default NULL,
  		     arg6       in     varchar2 default NULL,
  		     arg7       in     varchar2 default NULL,
  		     arg8       in     varchar2 default NULL,
  		     arg9       in     varchar2 default NULL,
  		     arg10      in     varchar2 default NULL,
  		     arg11      in     varchar2 default NULL
                    );

  /*
   * NAME
   *   EXECASOWN_CLOB - synchronous trust callout command w/ INOUT clob
   *
   * RETURN
   *
   */
  procedure EXECASOWN_CLOB(
                     idx_ownid  in     number,
                     idx_owner  in     varchar2,
                     idx_name   in     varchar2,
                     part_name  in     varchar2,
                     func_code  in     number,
                     argclob    in out nocopy clob,
  		     arg1       in     varchar2 default NULL,
  		     arg2       in     varchar2 default NULL,
  		     arg3       in     varchar2 default NULL,
  		     arg4       in     varchar2 default NULL,
  		     arg5       in     varchar2 default NULL,
  		     arg6       in     varchar2 default NULL,
  		     arg7       in     varchar2 default NULL,
  		     arg8       in     varchar2 default NULL,
  		     arg9       in     varchar2 default NULL,
  		     arg10      in     varchar2 default NULL,
  		     arg11      in     varchar2 default NULL
                    );

  /*
   * NAME
   *   EXECASOWN_IN_CLOB - synchronous trust callout command w/ IN clob
   *
   * RETURN
   *
   */
  procedure EXECASOWN_IN_CLOB(
                     idx_ownid  in     number,
                     idx_owner  in     varchar2,
                     idx_name   in     varchar2,
                     part_name  in     varchar2,
                     func_code  in     number,
                     argclob    in     clob,
  		     arg1       in     varchar2 default NULL,
  		     arg2       in     varchar2 default NULL,
  		     arg3       in     varchar2 default NULL,
  		     arg4       in     varchar2 default NULL,
  		     arg5       in     varchar2 default NULL,
  		     arg6       in     varchar2 default NULL,
  		     arg7       in     varchar2 default NULL,
  		     arg8       in     varchar2 default NULL,
  		     arg9       in     varchar2 default NULL,
  		     arg10      in     varchar2 default NULL
                    );

  /*
   * NAME
   *   EXECASOWN_IN_OUT_CLOBS -
   *     synchronous trust callout command w/
   *       one IN clob and one IN OUT clob.
   *
   * RETURN
   *
   */
  procedure EXECASOWN_IN_OUT_CLOBS(
                     idx_ownid  in     number,
                     idx_owner  in     varchar2,
                     idx_name   in     varchar2,
                     part_name  in     varchar2,
                     func_code  in     number,
                     argclob1   in     clob,
                     argclob2   in out nocopy clob,
  		     arg1       in     varchar2 default NULL,
  		     arg2       in     varchar2 default NULL,
  		     arg3       in     varchar2 default NULL,
  		     arg4       in     varchar2 default NULL,
  		     arg5       in     varchar2 default NULL,
  		     arg6       in     varchar2 default NULL,
  		     arg7       in     varchar2 default NULL,
  		     arg8       in     varchar2 default NULL,
  		     arg9       in     varchar2 default NULL,
  		     arg10      in     varchar2 default NULL,
  		     arg11      in     varchar2 default NULL
                    );

  /*
   * NAME
   *   EXECASOWN_IN_CLOB_RET - synchronous trust callout command with return
   *
   * RETURN
   *
   */
  procedure EXECASOWN_IN_CLOB_RET(
                     idx_ownid  in     number,
                     idx_owner  in     varchar2,
                     idx_name   in     varchar2,
                     part_name  in     varchar2,
                     func_code  in     number,
                     ret1       out    varchar2,
                     ret2       out    varchar2,
                     argclob    in     clob,
  		     arg1       in     varchar2 default NULL,
  		     arg2       in     varchar2 default NULL,
  		     arg3       in     varchar2 default NULL,
  		     arg4       in     varchar2 default NULL,
  		     arg5       in     varchar2 default NULL,
  		     arg6       in     varchar2 default NULL,
  		     arg7       in     varchar2 default NULL,
  		     arg8       in     varchar2 default NULL,
  		     arg9       in     varchar2 default NULL,
  		     arg10      in     varchar2 default NULL
                    );

  /*
   * NAME
   *   EXECASOWN_RET - synchronous trust callout command with return
   *
   * RETURN
   *
   */
  procedure EXECASOWN_RET(
                     idx_ownid  in     number,
                     idx_owner  in     varchar2,
                     idx_name   in     varchar2,
                     part_name  in     varchar2,
                     func_code  in     number,
                     ret1       out    varchar2,
                     ret2       out    varchar2,
  		     arg1       in     varchar2 default NULL,
  		     arg2       in     varchar2 default NULL,
  		     arg3       in     varchar2 default NULL,
  		     arg4       in     varchar2 default NULL,
  		     arg5       in     varchar2 default NULL,
  		     arg6       in     varchar2 default NULL,
  		     arg7       in     varchar2 default NULL,
  		     arg8       in     varchar2 default NULL,
  		     arg9       in     varchar2 default NULL,
  		     arg10      in     varchar2 default NULL
                    );

  /*
   * NAME
   *   EXECASOWN_RET1 - synchronous trust callout command with 1 return
   *
   * RETURN
   *
   */
  function EXECASOWN_RET1(
                     idx_ownid  in     number,
                     idx_owner  in     varchar2,
                     idx_name   in     varchar2,
                     part_name  in     varchar2,
                     func_code  in     number,
  		     arg1       in     varchar2 default NULL,
  		     arg2       in     varchar2 default NULL,
  		     arg3       in     varchar2 default NULL,
  		     arg4       in     varchar2 default NULL,
  		     arg5       in     varchar2 default NULL,
  		     arg6       in     varchar2 default NULL,
  		     arg7       in     varchar2 default NULL,
  		     arg8       in     varchar2 default NULL,
  		     arg9       in     varchar2 default NULL,
  		     arg10      in     varchar2 default NULL
                    )
   return varchar2;

/*--------------------------- tablefunc ----------------------------*/

FUNCTION tablefunc
(
  idxo      in  varchar2,
  idxn      in  varchar2,
  idxp      in  varchar2,
  cur       in  SYS_REFCURSOR,
  opcode    in  varchar2,
  memory    in  varchar2,
  tstamp    in  varchar2,
  direct_path in varchar2,
  maxtime     in varchar2
) return number;

/*--------------------------- tablefunc_asown ----------------------------*/

FUNCTION tablefunc_asown
(
  idxownid  in  number,
  idxo      in  varchar2,
  idxn      in  varchar2,
  idxp      in  varchar2,
  cur       in  SYS_REFCURSOR,
  opcode    in  varchar2,
  memory    in  varchar2,
  tstamp    in  varchar2,
  direct_path in varchar2,
  maxtime     in varchar2
) return number;

end drvdisp;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVDDL" authid current_user as

  pv_idx_mem            number;
  pv_is_import          boolean;
  pv_master_params      varchar2(2000);
  pv_partition_populate boolean;

  px_partition_error    EXCEPTION;

  PARALLEL_OP  constant number :=  1;
  CREATE_OP    constant number := 16;
  RESUME_OP    constant number := 32;

  P_CREATE_OP  constant number := 16 + 1;
  P_RESUME_OP  constant number := 32 + 1;
  P_SYNC_OP    constant number := 64 + 1;

  -- 10169701: Keep track of any tokens which had errors during optimize
  -- rebuild
  type text_tab is table of varchar2(64) index by binary_integer;
  type type_tab is table of number index by binary_integer;
  opt_rebuild_error_text text_tab;
  opt_rebuild_error_type type_tab;

/*----------------------- PartitionCreate  -----------------------*/

PROCEDURE PartitionCreate(
  ia              in  sys.ODCIIndexInfo,
  owner           in  varchar2,
  index_name      in  varchar2,
  index_partition in  varchar2,
  table_owner     in  varchar2,
  table_name      in  varchar2,
  table_partition in  varchar2,
  idxmem          in  number,
  storage         in  varchar2,
  populate        in  boolean default TRUE,
  sync_type       in  varchar2 default NULL,
  sync_memory     in  varchar2 default NULL,
  sync_paradegree in  number   default NULL,
  sync_interval   in  varchar2 default NULL,
  is_online       in  boolean default FALSE,
  sync_dpl        in  boolean default FALSE
);

/*----------------------- IndexCreate  -----------------------*/
/*
  NAME
    IndexCreate

  DESCRIPTION
    create an index

  ARGUMENTS
    owner        index owner
    index_name   index name
    table_owner  table owner
    table_name   table name
    column_name  text column name
    column_type  text column type (optional)
    populate     populate/nopopulate
    para         parallel degree
    langcol      language column
    fmtcol       format column name
    csetcol      charset column name
    configcol    charset column name
    idxmem       index memory
    datastore    datastore pref name
    filter       filter pref name
    section      section group pref name
    lexer        lexer pref name
    wordlist     wordlist pref name
    stoplist     stoplist pref name
    storage      storage pref name
    txntional    transactional pref name
    tree         supports ctx_tree

  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE IndexCreate(
  ia          in  sys.odciindexinfo,
  owner       in  varchar2,
  index_name  in  varchar2,
  index_part  in  varchar2,
  table_owner in  varchar2,
  table_name  in  varchar2,
  table_part  in  varchar2,
  column_name in  varchar2,
  column_type in varchar2,
  call_prop   in  number,
  populate    in  boolean,
  para        in  number,
  langcol     in  varchar2,
  fmtcol      in  varchar2,
  csetcol     in  varchar2,
  idxmem      in  number,
  datastore   in  varchar2,
  filter      in  varchar2,
  section     in  varchar2,
  lexer       in  varchar2,
  wordlist    in  varchar2,
  stoplist    in  varchar2,
  storage     in  varchar2,
  txntional   in  varchar2,
  sync_type   in  varchar2,
  sync_memory     in  varchar2,
  sync_paradegree in  number,
  sync_interval   in  varchar2,
  tree            in  boolean,
  sync_dpl        in  boolean,
  configcol     in  varchar2
);

/*----------------------- IndexDrop  -------------------------*/
/*
  NAME
    IndexDrop

  DESCRIPTION
    drop an index

  ARGUMENTS
    ia           index info
*/
PROCEDURE IndexDrop(
  ia          in  sys.ODCIIndexInfo,
  owner       in  varchar2,
  index_name  in  varchar2,
  call_prop   in  number
);

/*----------------------- IndexTruncate  ---------------------*/
/*
  NAME
    IndexTruncate

  DESCRIPTION
    truncate an index

  ARGUMENTS
    ia           index info
    owner        index owner
    index_name   index name
    ixp_name     index partition name
    call_prop    call property
*/
PROCEDURE IndexTruncate(
  ia           in sys.odciindexinfo,
  owner        in varchar2,
  index_name   in varchar2,
  ixp_name     in varchar2,
  call_prop    in number

);

/*----------------------- IndexTransport  -----------------------*/
/*
  NAME
    IndexTransport

  DESCRIPTION
    transport tablespace support

  ARGUMENTS
    owner        index owner
    index_name   index name
    index_part   index partition name
    table_owner  table owner
    table_name   table name
    table_part   table partition name

  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE IndexTransport(
  owner       in  varchar2,
  index_name  in  varchar2,
  index_part  in  varchar2,
  table_owner in  varchar2,
  table_name  in  varchar2,
  table_part  in  varchar2,
  IndexInfoFlags in number,
  CallProperty   in number
);

/*----------------------- PartitionSplit  -----------------------*/
/*
  NAME
    PartitionSplit

  DESCRIPTION
    split one partition into two

  ARGUMENTS
    ia          ODCIIndexInfo for the spliting partition
    part1       ODCIPartInfo for resulting partition
    part2       ODCIPartInfo for resulting partition


  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE PartitionSplit(
  ia              in  sys.odciindexinfo,
  part1           in  sys.odcipartinfo,
  part2           in  sys.odcipartinfo
);

/*----------------------- PartitionMerge  -----------------------*/
/*
  NAME
    PartitionMerge

  DESCRIPTION
    split one partition into two

  ARGUMENTS
    ia          ODCIIndexInfo for the resulting partition
    part1       ODCIPartInfo for one of the merging partitions
    part2       ODCIPartInfo for one of the merging  partition


  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE PartitionMerge(
  ia              in  sys.odciindexinfo,
  part1           in  sys.odcipartinfo,
  part2           in  sys.odcipartinfo
);

/*----------------------- PartitionExchange  -----------------------*/
/*
  NAME
    PartitionExchange

  DESCRIPTION
    Swap a partition with a table

  ARGUMENTS
    ia          ODCIIndexInfo for the partition index to be exchanged
    ia1         ODCIIndexinfo for the index on the table


  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE PartitionExchange(
  ia              in  sys.odciindexinfo,
  ia1             in  sys.odciindexinfo
);

/*----------------------- IndexRename  ---------------------*/
/*
  NAME
    IndexRename

  DESCRIPTION
    rename an index

  ARGUMENTS
    ia           index info
    owner        index owner
    index_name   index name
    new_name     new name
*/
PROCEDURE IndexRename(
  ia           in sys.odciindexinfo,
  owner        in varchar2,
  index_name   in varchar2,
  new_name     in varchar2
);

/*----------------------- IndexColRename  ---------------------*/
/*
  NAME
    IndexColRename

  DESCRIPTION
    rename an index column

  ARGUMENTS
    ia           index info
    owner        index owner
    index_name   index name
    new_name     new name
*/
PROCEDURE IndexColRename(
  ia           in sys.odciindexinfo,
  owner        in varchar2,
  index_name   in varchar2,
  new_name     in varchar2
);

/*----------------------- IndexReplace  -------------------------*/
/*
  NAME
    IndexReplace

  DESCRIPTION
    rebuild an index, replacing preferences as needed

  ARGUMENTS
    ia           index info
    idx          index record
    idxmem       index memory
    para         parallel degree
    langcol      language column
    fmtcol       format column name
    csetcol      charset column name
    configcol    configuration column name
    datastore    datastore pref name
    filter       filter pref name
    section      section group pref name
    lexer        lexer pref name
    wordlist     wordlist pref name
    stoplist     stoplist pref name
    storage      storage pref name
    isonline     is online ?
    sync_dpl     direct path loading?
    section_name section name
*/
PROCEDURE IndexReplace(
  ia          in  sys.ODCIIndexInfo,
  idx         in out nocopy  dr_def.idx_rec,
  idxmem      in  number,
  para        in  number,
  langcol     in  varchar2,
  fmtcol      in  varchar2,
  csetcol     in  varchar2,
  datastore   in  varchar2,
  filter      in  varchar2,
  section     in  varchar2,
  lexer       in  varchar2,
  wordlist    in  varchar2,
  stoplist    in  varchar2,
  storage     in  varchar2,
  txntional   in  varchar2,
  sync_type   in  varchar2,
  sync_memory     in   varchar2,
  sync_paradegree in   number,
  sync_interval   in   varchar2,
  isonline    in  boolean default FALSE,
  metadataonly in boolean default FALSE,
  populate     in boolean default TRUE,
  sync_dpl     in boolean default FALSE,
  section_name in varchar2 default NULL,
  configcol   in  varchar2 default NULL
);

/*----------------------- IndexPartReplace  -------------------------*/
/*
  NAME
    IndexPartReplace

  DESCRIPTION
    rebuild a index partition, replacing preferences as needed

  ARGUMENTS
    ia           index info
    idx          index record
    ixp          index partition
    idxmem       index memory
    storage      storage pref name
    para         parallel degree
*/
PROCEDURE IndexPartReplace(
  ia          in  sys.ODCIIndexInfo,
  idx         in  dr_def.idx_rec,
  ixp         in  dr_def.ixp_rec,
  idxmem      in  number,
  storage     in  varchar2,
  para        in  number,
  sync_type   in  varchar2,
  sync_memory     in   varchar2,
  sync_paradegree in   number,
  sync_interval   in   varchar2,
  isonline     in boolean default FALSE,
  metadataonly in boolean default FALSE,
  populate     in boolean default TRUE,
  sync_dpl     in boolean default FALSE
);

/*----------------------- IndexResume  -------------------------*/
/*
  NAME
    IndexResume

  DESCRIPTION
    resume index creation

  ARGUMENTS
    ia           index info
    idx          index record
    para         parallel degree
    idxmem       index memory
    isOnline     is online?
    isreplace    called from replace
*/
PROCEDURE IndexResume(
  ia          in  sys.ODCIIndexInfo,
  idx         in  dr_def.idx_rec,
  para        in  number,
  idxmem      in  number,
  isonline    in  boolean default FALSE,
  isreplace   in  boolean default FALSE,
  populate     in boolean default TRUE
);

/*----------------------- IndexPartResume  -------------------------*/
/*
  NAME
    IndexPartResume

  DESCRIPTION
    resume index creation on a partition

  ARGUMENTS
    ia           index info which also has partition info
    idx          index record
    para         parallel degree
    idxmem       index memory
*/
PROCEDURE IndexPartResume(
  ia          in  sys.ODCIIndexInfo,
  idx         in  dr_def.idx_rec,
  para        in  number,
  idxmem      in  number,
  isOnline    in  boolean default FALSE,
  isReplace   in  boolean default FALSE,
  populate    in  boolean default TRUE
);

/*----------------------- IndexOptimize  -------------------------*/
/*
  NAME
    IndexOptimize

  DESCRIPTION
    optimize the index

  ARGUMENTS
    idx          index record
    ixpname      partition name
    operation    FAST, FULL, or TOKEN
    maxtime      maxtime for gc
    token	 text token string
*/
PROCEDURE IndexOptimize(
  idx         in  dr_def.idx_rec,
  ixpname     in  varchar2,
  operation   in  varchar2,
  maxtime     in  number,
  token       in  varchar2,
  ttype       in  number default 0,
  pdegree     in  number default 1,
  memory      in  number default 0,
  background  in  number default 0
);

TYPE popcurtyp is ref cursor return ctxsys.dr$number_sequence%rowtype;

FUNCTION IndexOptimizeParFn(
  crsr        in popcurtyp,
  idxownid    in number,
  idxowner    in varchar2,
  idxname     in varchar2,
  ixpname     in varchar2,
  shadow_itab in varchar2,
  shadow_stab in varchar2,
  nextid     in number,
  optmode     in number,
  maxtime     in number,
  logfile     in varchar2,
  maxhash     in number,
  ttype       in number,
  background  in number
) return varchar2;

/*----------------------- SplitDollari  -------------------------*/
/*
  NAME
    SplitDollari

  DESCRIPTION
    Split the $I table into multiple $I tables

  ARGUMENTS
    idx          index record
    ixpname      the name of the partition whose $I table we are
                 splitting(the $I is not modified)
    mapping_tab  the table that maps rowids to partition names
    name_prefix  the name of the output table in case of less than
                 two partitions, a name to which the partition
                 name gets appended otherwise:
                 name_prefix||'_'||part_name
    tspace       the name of the tablespace where additional
                 mapping tables will be created (for cleanup
                 purposes in case of core dump)
*/
PROCEDURE SplitDollari(
  idx         in  dr_def.idx_rec,
  ixpname     in  varchar2,
  mapping_tab in  varchar2,
  name_prefix in  varchar2,
  tspace      in  varchar2 default null
);

/*----------------------- IndexSync  -------------------------*/
/*
  NAME
    IndexSync

  DESCRIPTION
    sync the index

  ARGUMENTS
    idx          index record
    idxmem       index memory
    ixpname      index partition name
    direct_path  should we use direct-path inserts ?
*/
PROCEDURE IndexSync(
  idx         in  dr_def.idx_rec,
  ixpname     in  varchar2,
  idxmem      in  number,
  parallel_degree in number default 1,
  direct_path in  boolean default false,
  maxtime     in  number,
  locking     in  number
);

/*----------------------- LockBaseTable  -------------------------*/
/*
  NAME
    LockBaseTable

  DESCRIPTION
    lock the base table

  ARGUMENTS
    table_own    name of table owner
    table_name   name of table
    table_part   name of table partition (if any)
*/
PROCEDURE LockBaseTable(
  table_own   in varchar2,
  table_name  in varchar2,
  table_part  in varchar2 default NULL
);

PROCEDURE ProcessOnlinePending (
  table_own        in varchar2,
  table_name       in varchar2,
  index_own        in varchar2,
  index_name       in varchar2,
  polid            in number,
  is_part          in boolean,
  is_online        in boolean,
  is_alter         in boolean,
  table_partition  in varchar2 default NULL,
  index_partition  in varchar2 default NULL
) ;

/*----------------------- CDIUpdate  -------------------------*/

PROCEDURE CDIUpdate(
  polid       in number,
  ia          in sys.odciindexinfo,
  env         in sys.ODCIEnv,
  ridlist     in sys.odciridlist,
  oldvallist  in sys.odcicolarrayvallist,
  newvallist  in sys.odcicolarrayvallist
);

PROCEDURE RIOCleanup(
  idx_shadow  in dr_def.idx_rec
);

PROCEDURE PartCleanup(
  idx_shadow   dr_def.idx_rec,
  ixp_shadow   dr_def.ixp_rec
);

FUNCTION CursorToBitVector(
  crsr    in popcurtyp,
  numbits in number) RETURN varchar2;

PROCEDURE add_big_io(
  idx in dr_def.idx_rec
);

PROCEDURE remove_big_io(
  idx in dr_def.idx_rec
);

PROCEDURE add_separate_offsets(
  idx in dr_def.idx_rec
);

PROCEDURE add_stage_itab(
  idx in dr_def.idx_rec,
  ixp       in dr_def.ixp_rec default NULL
);

PROCEDURE remove_stage_itab(
  idx in dr_def.idx_rec,
  ixp       in dr_def.ixp_rec default NULL
);

/*--------------------------- field_to_mdata -------------------------------*/
/* convert a field section to mdata */
PROCEDURE field_to_mdata(
  idx in dr_def.idx_rec,
  fsec in varchar2,
  read_only in boolean
);

/*------------------------ IndexMapLanguagesDriver -------------------------*/
/* Driver for IndexMapLanguages - partitioned and non partitioned case. */
procedure IndexMapLanguagesDriver(
  idx      in dr_def.idx_rec
);

/*--------------------------- IndexMapLanguages ---------------------------*/
/* Map language column in base table to mdata sections */
procedure IndexMapLanguages(
  idx      in dr_def.idx_rec,
  ixp      in dr_def.ixp_rec,
  pdegree  in number,
  flags    in binary_integer,
  sectyp   in binary_integer,
  hash_usable in number
);

/*---------------------- AddDocLexerMDATATokens ------------------------*/
/* Add DR$ML MDATA Tokens to $I */
PROCEDURE AddDocLexerMDATATokens(
  ia       in sys.ODCIIndexInfo,
  idx      in dr_def.idx_rec
);

/*---------------------- RemDocLexerMDATATokens ------------------------*/
/* Remove DR$ML MDATA Tokens from $I(s) */
PROCEDURE RemDocLexerMDATATokens(
  ia       in sys.ODCIIndexInfo,
  idx in dr_def.idx_rec
);

/*--------------------------- idx_add_slx ------------------------------*/
/* Add sublexer to the Index */
PROCEDURE idx_add_slx(
  ia        in sys.ODCIIndexInfo,
  idx       in dr_def.idx_rec,
  sub_lexer in varchar2,
  language  in varchar2,
  alt_value in varchar2,
  language_dependent in boolean default TRUE
);

/*--------------------------- idx_rem_slx ------------------------------*/
/* Remove sublexer from the Index */
PROCEDURE idx_rem_slx(
  ia        in sys.ODCIIndexInfo,
  idx       in dr_def.idx_rec,
  sub_lexer in varchar2
);

/*--------------------------- idx_add_sw ------------------------------*/
/* Add stopword to the Index */
PROCEDURE idx_add_sw(
  ia        in sys.ODCIIndexInfo,
  idx       in dr_def.idx_rec,
  stopword  in varchar2,
  language  in varchar2,
  language_dependent in boolean default TRUE,
  secname   in varchar2
);

/*--------------------------- idx_rem_sw ------------------------------*/
/* Remove stopword from the Index */
PROCEDURE idx_rem_sw(
  ia        in sys.ODCIIndexInfo,
  idx       in dr_def.idx_rec,
  stopword    in  varchar2,
  language    in  varchar2,
  for_all     in boolean default FALSE
);

/*--------------------------- repopulate_dollarn ---------------------------*/
/* repopulate_dollarn - repopulate $N as opposite of $K */
PROCEDURE repopulate_dollarn(
  idx       in dr_def.idx_rec,
  ixp       in dr_def.ixp_rec
);

/*------------------------------ set_read_mode -----------------------------*/
/* set_read_mode - Set read mode to TRUE/FALSE, for given partition */
PROCEDURE set_read_mode(
  ia        in sys.ODCIIndexInfo,
  idx       in dr_def.idx_rec,
  ixp       in dr_def.ixp_rec default NULL,
  read_mode in boolean
);

end drvddl;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVDDLC" authid current_user as

/*----------------------- IndexCreate  -----------------------*/
/*
  NAME
    IndexCreate

  DESCRIPTION
    create an index

  ARGUMENTS
    owner        index owner
    index_name   index name
    table_owner  table owner
    table_name   table name
    column_name  text column name
    langcol      language column
    fmtcol       format column name
    csetcol      charset column name
    configcol    configuration column name
    idxmem       index memory
    datastore    datastore pref name
    filter       filter pref name
    section      section group pref name
    lexer        lexer pref name
    wordlist     wordlist pref name
    stoplist     stoplist pref name
    storage      storage pref name
    indexset     index set name

  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE IndexCreate(
  ia          in  sys.odciindexinfo,
  owner       in  varchar2,
  index_name  in  varchar2,
  table_owner in  varchar2,
  table_name  in  varchar2,
  column_name in  varchar2,
  langcol     in  varchar2,
  fmtcol      in  varchar2,
  csetcol     in  varchar2,
  idxmem      in  number,
  datastore   in  varchar2,
  filter      in  varchar2,
  section     in  varchar2,
  lexer       in  varchar2,
  wordlist    in  varchar2,
  stoplist    in  varchar2,
  storage     in  varchar2,
  indexset    in  varchar2,
  configcol   in  varchar2
);

/*----------------------- IndexRename  ---------------------*/
/*
  NAME
    IndexRename

  DESCRIPTION
    rename an index

  ARGUMENTS
    ia           index info
    owner        index owner
    index_name   index name
    new_name     new name
*/
PROCEDURE IndexRename(
  ia           in sys.odciindexinfo,
  owner        in varchar2,
  index_name   in varchar2,
  new_name     in varchar2
);

/*----------------------- IndexColRename  ---------------------*/
/*
  NAME
    IndexColRename

  DESCRIPTION
    rename an index column

  ARGUMENTS
    ia           index info
    owner        index owner
    index_name   index name
    new_name     new name
*/
PROCEDURE IndexColRename(
  ia           in sys.odciindexinfo,
  owner        in varchar2,
  index_name   in varchar2,
  new_name     in varchar2
);

/*----------------------- IndexTruncate  ---------------------*/
/*
  NAME
    IndexTruncate

  DESCRIPTION
    truncate an index

  ARGUMENTS
    owner        index owner
    index_name   index name
*/
PROCEDURE IndexTruncate(
  ia           in sys.odciindexinfo,
  owner        in varchar2,
  index_name   in varchar2
);

/*----------------------- IndexDrop  -------------------------*/
/*
  NAME
    IndexDrop

  DESCRIPTION
    drop an index

  ARGUMENTS
    ia           index info
*/
PROCEDURE IndexDrop(
  ia          in  sys.ODCIIndexInfo,
  owner       in  varchar2,
  index_name  in  varchar2
);

/*----------------------- IndexReplace  -------------------------*/
/*
  NAME
    IndexReplace

  DESCRIPTION
    rebuild an index, replacing preferences as needed

  ARGUMENTS
    ia           index info
    idx          index record
    idxmem       index memory
    para         parallel degree (ignored)
    idxset       index set name
    lexer        lexer pref name
    wordlist     wordlist pref name
    stoplist     stoplist pref name
    storage      storage pref name

*/
PROCEDURE IndexReplace(
  ia          in  sys.ODCIIndexInfo,
  idx         in  dr_def.idx_rec,
  idxmem      in  number,
  para        in  number,
  idxset      in  varchar2,
  lexer       in  varchar2,
  wordlist    in  varchar2,
  stoplist    in  varchar2,
  storage     in  varchar2
);

/*----------------------- IndexTransport  -----------------------*/
/*
  NAME
    IndexTransport

  DESCRIPTION
    transport tablespace support

  ARGUMENTS
    owner        index owner
    index_name   index name
    index_part   index partition name
    table_owner  table owner
    table_name   table name
    table_part   table partition name

  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE IndexTransport(
  owner       in  varchar2,
  index_name  in  varchar2,
  index_part  in  varchar2,
  table_owner in  varchar2,
  table_name  in  varchar2,
  table_part  in  varchar2,
  IndexInfoFlags in number,
  CallProperty   in number
);

end drvddlc;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVDDLR" authid current_user as

/*----------------------- IndexCreate  -----------------------*/
/*
  NAME
    IndexCreate

  DESCRIPTION
    create an index
*/
PROCEDURE IndexCreate(
  ia          in  sys.odciindexinfo,
  owner       in  varchar2,
  index_name  in  varchar2,
  table_owner in  varchar2,
  table_name  in  varchar2,
  column_name in  varchar2,
  populate    in  boolean,
  langcol     in  varchar2,
  fmtcol      in  varchar2,
  csetcol     in  varchar2,
  idxmem      in  number,
  datastore   in  varchar2,
  filter      in  varchar2,
  section     in  varchar2,
  lexer       in  varchar2,
  wordlist    in  varchar2,
  stoplist    in  varchar2,
  storage     in  varchar2,
  classifier  in  varchar2,
  configcol   in  varchar2
);

/*----------------------- IndexRename  ---------------------*/
/*
  NAME
    IndexRename

  DESCRIPTION
    rename an index

  ARGUMENTS
    ia           index info
    owner        index owner
    index_name   index name
    new_name     new name
*/
PROCEDURE IndexRename(
  ia           in sys.odciindexinfo,
  owner        in varchar2,
  index_name   in varchar2,
  new_name     in varchar2
);

/*----------------------- IndexColRename  ---------------------*/
/*
  NAME
    IndexColRename

  DESCRIPTION
    rename an index column

  ARGUMENTS
    ia           index info
    owner        index owner
    index_name   index name
    new_name     new name
*/
PROCEDURE IndexColRename(
  ia           in sys.odciindexinfo,
  owner        in varchar2,
  index_name   in varchar2,
  new_name     in varchar2
);

/*----------------------- IndexTruncate  ---------------------*/
/*
  NAME
    IndexTruncate

  DESCRIPTION
    truncate an index

  ARGUMENTS
    owner        index owner
    index_name   index name
*/
PROCEDURE IndexTruncate(
  ia           in sys.odciindexinfo,
  owner        in varchar2,
  index_name   in varchar2
);

/*----------------------- IndexDrop  -------------------------*/
/*
  NAME
    IndexDrop

  DESCRIPTION
    drop an index

  ARGUMENTS
    ia           index info
*/
PROCEDURE IndexDrop(
  ia          in  sys.ODCIIndexInfo,
  owner       in  varchar2,
  index_name  in  varchar2
);

/*----------------------- IndexReplace  -------------------------*/
/*
  NAME
    IndexReplace

  DESCRIPTION
    rebuild an index, replacing preferences as needed

  ARGUMENTS
    ia           index info
    idx          index record
    idxmem       index memory
    para         parallel degree
    langcol      language column
    fmtcol       format column name
    csetcol      charset column name
    configcol    charset column name
    datastore    datastore pref name
    filter       filter pref name
    section      section group pref name
    lexer        lexer pref name
    wordlist     wordlist pref name
    stoplist     stoplist pref name
    storage      storage pref name
    classifier   classifier pref name
*/
PROCEDURE IndexReplace(
  ia          in  sys.ODCIIndexInfo,
  idx         in  dr_def.idx_rec,
  idxmem      in  number,
  langcol     in  varchar2,
  fmtcol      in  varchar2,
  csetcol     in  varchar2,
  datastore   in  varchar2,
  filter      in  varchar2,
  section     in  varchar2,
  lexer       in  varchar2,
  wordlist    in  varchar2,
  stoplist    in  varchar2,
  storage     in  varchar2,
  classifier  in  varchar2,
  configcol   in  varchar2
);

/*----------------------- IndexResume  -------------------------*/
/*
  NAME
    IndexResume

  DESCRIPTION
    resume index creation

  ARGUMENTS
    ia           index info
    idx          index record
    idxmem       index memory
*/
PROCEDURE IndexResume(
  ia          in  sys.ODCIIndexInfo,
  idx         in  dr_def.idx_rec,
  idxmem      in  number
);


/*----------------------- IndexOptimize  -------------------------*/
/*
  NAME
    IndexOptimize

  DESCRIPTION
    optimize the index

  ARGUMENTS
    idx          index record
    index_id     index id
    operation    FAST, FULL, or TOKEN
    maxtime      maxtime for gc
    token	 text token string
*/
PROCEDURE IndexOptimize(
  idx         in  dr_def.idx_rec,
  operation   in  varchar2,
  maxtime     in  number,
  token       in  varchar2
);

/*----------------------- IndexSync  -------------------------*/
/*
  NAME
    IndexSync

  DESCRIPTION
    sync the index

  ARGUMENTS
    idx          index record
    idxmem       index memory
*/
PROCEDURE IndexSync(
  idx         in  dr_def.idx_rec,
  idxmem      in  number
);

/*----------------------- IndexTransport  -----------------------*/
/*
  NAME
    IndexTransport

  DESCRIPTION
    transport tablespace support

  ARGUMENTS
    owner        index owner
    index_name   index name
    index_part   index partition name
    table_owner  table owner
    table_name   table name
    table_part   table partition name

  NOTES

  EXCEPTIONS

  RETURNS

*/
PROCEDURE IndexTransport(
  index_owner in  varchar2,
  index_name  in  varchar2,
  table_owner in  varchar2,
  table_name  in  varchar2,
  IndexInfoFlags in number
);

end drvddlr;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVDDLX" authid current_user as

/*----------------------- IndexCreate  -----------------------*/
/*
  NAME
    IndexCreate

  DESCRIPTION
    create an index
*/
PROCEDURE IndexCreate(
  ia          in  sys.odciindexinfo,
  owner       in  varchar2,
  index_name  in  varchar2,
  table_owner in  varchar2,
  table_name  in  varchar2,
  column_name in  varchar2,
  idxmem      in  number,
  storage     in  varchar2
);

/*----------------------- IndexTransport  -----------------------*/
/*
  NAME
    IndexTransport

  DESCRIPTION
    meta-data cleanup after transportable tablespace
*/
PROCEDURE IndexTransport(
    owner           in  varchar2,
    index_name      in  varchar2,
    table_owner     in  varchar2,
    table_name      in  varchar2,
    IndexInfoFlags  in  number
);

/*----------------------- IndexDrop  -------------------------*/
/*
  NAME
    IndexDrop

  DESCRIPTION
    drop an index

  ARGUMENTS
    ia           index info
*/
PROCEDURE IndexDrop(
  ia          in  sys.ODCIIndexInfo,
  owner       in  varchar2,
  index_name  in  varchar2
);

/*----------------------- IndexRename  ---------------------*/
/*
  NAME
    IndexRename

  DESCRIPTION
    rename an index

  ARGUMENTS
    ia           index info
    owner        index owner
    index_name   index name
    new_name     new name
*/
PROCEDURE IndexRename(
  ia           in sys.odciindexinfo,
  owner        in varchar2,
  index_name   in varchar2,
  new_name     in varchar2
);

/*----------------------- IndexColRename  ---------------------*/
/*
  NAME
    IndexColRename

  DESCRIPTION
    rename an index column

  ARGUMENTS
    ia           index info
    owner        index owner
    index_name   index name
    new_name     new name
*/
PROCEDURE IndexColRename(
  ia           in sys.odciindexinfo,
  owner        in varchar2,
  index_name   in varchar2,
  new_name     in varchar2
);

/*----------------------- IndexTruncate  ---------------------*/
/*
  NAME
    IndexTruncate

  DESCRIPTION
    truncate an index

  ARGUMENTS
    owner        index owner
    index_name   index name
*/
PROCEDURE IndexTruncate(
  ia           in sys.odciindexinfo,
  owner        in varchar2,
  index_name   in varchar2
);

/*----------------------- IndexReplace  -------------------------*/
/*
  NAME
    IndexReplace

  DESCRIPTION
    rebuild an index, replacing preferences as needed

  ARGUMENTS
    ia           index info
    idx          index record
    idxmem       index memory
    storage      storage pref name
*/
PROCEDURE IndexReplace(
  ia          in  sys.ODCIIndexInfo,
  idx         in  dr_def.idx_rec,
  idxmem      in  number,
  storage     in  varchar2
);

/*----------------------- IndexResume  -------------------------*/
/*
  NAME
    IndexResume

  DESCRIPTION
    resume index creation

  ARGUMENTS
    ia           index info
    idx          index record
    para         parallel degree
    idxmem       index memory
*/
PROCEDURE IndexResume(
  ia          in  sys.ODCIIndexInfo,
  idx         in  dr_def.idx_rec,
  idxmem      in  number
);

/*----------------------- IsBinaryXMLColumn -------------------*/
/*
 NAME
   IsBinaryXMLColumn

 DESCRIPTION
   Is this XMLType column stored as binary?

 ARGUMENTS
   tableSchema   schema owning the table
   tableName     table name
   colName       column name
*/
FUNCTION isBinaryXMLColumn(
  tableSchema IN VARCHAR2,
  tableName   IN VARCHAR2,
  colName     IN VARCHAR2,
  indexName   IN VARCHAR2
) return boolean;

end drvddlx;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVDML" authid current_user as

  -- CTXCAT holding variables
  type vctab is table of varchar2(30) index by binary_integer;
  c_vctab           vctab;
  c_cttab           vctab;

  type numtab is table of number index by binary_integer;
  c_numtab          numtab;

  type dttab is table of date index by binary_integer;
  c_dttab           dttab;

  type cntab is table of varchar2(256) index by binary_integer;
  c_cntab           cntab;

  c_text_vc2        varchar2(32767);
  c_text_clob       clob;
  c_rowid           rowid;

  type updtab is table of boolean index by binary_integer;
  c_updtab          updtab;

  -- 5079472: Mirror dbms_lock constants here because dbms_lock may not
  -- be granted to public.
  s_mode number := dbms_lock.s_mode;
  x_mode number := dbms_lock.x_mode;

  -- Indicates if index population to be done on per document basis
  pv_idx_pop_per_doc    boolean := FALSE;

/*--------------------------- ProcessWaiting ------------------------------*/

procedure ProcessWaiting (
  p_idxtype in binary_integer,
  p_idxid   in number,
  p_idxown  in varchar2,
  p_idxname in varchar2,
  p_ixpid   in number,
  p_ixpname in varchar2
);

/*--------------------------- ProcessDML ------------------------*/
/*
  NAME
    ProcessDML

  DESCRIPTION
    do a sync

  ARGUMENTS
    CID             in     - column to work on
    parallel_degree in     - parallel degree
    direct_path     in     - use direct-path inserts ?

*/
procedure ProcessDML (
  p_idxid  in  number,
  p_ixpid  in  number,
  p_idxmem in  number,
  p_pardeg in  binary_integer default 1,
  p_direct_path in boolean default false,
  p_maxtime in binary_integer default 2147483647
);

/*--------------------------- MaintainKTab -------------------------*/
/*
  NAME
    MaintainKTab

  DESCRIPTION
    update the $K table after index creation/sync

  ARGUMENTS
    idx               in     - the index
    ixp               in     - the partition of the index
    p_startDocid      in     - docid to start from
    p_parallel_degree in     - parallel degree

*/
procedure MaintainKTab (
  idx         in  dr_def.idx_rec,
  ixp         in  dr_def.ixp_rec,
  p_startDocid  in  number default null,
  p_parallel_degree in number default 1
);
/*--------------------------- MaintainKTab -------------------------*/
/*
  NAME
    MaintainKTab

  DESCRIPTION
    update the $K table after index creation/sync

  ARGUMENTS
    p_idxid           in     - the index id
    p_ixpid           in     - the partition id
    p_startDocid      in     - docid to start from
    p_parallel_degree in     - parallel degree
*/
procedure MaintainKTab (
  p_idxid           in number,
  p_ixpid           in number,
  p_startDocid      in  number default null,
  p_parallel_degree in number default 1
);

/*--------------------------- DeletePending ------------------------*/

procedure DeletePending (
  p_idxid  in number,
  p_ixpid  in number,
  p_rids   in varchar2
);

/*----------------------------- CleanDML ---------------------------*/

procedure CleanDML (
  p_idxid  in number,
  p_ixpid  in number,
  p_tabid  in number
);

/*-------------------------- SetLockFailed -------------------------*/

procedure SetLockFailed (
  p_idxid  in number,
  p_ixpid  in number,
  p_rid    in rowid
);

/*--------------------------- ctxcat_dml ----------------------------*/

procedure ctxcat_dml(
  idx_owner in varchar2,
  idx_name  in varchar2,
  doindex   in boolean,
  updop     in boolean
);

/*----------------------- auto_sync_index ------------------------*/

PROCEDURE auto_sync_index(
  idx_name  in  varchar2 default NULL,
  memory    in  varchar2 default NULL,
  part_name in  varchar2 default NULL,
  parallel_degree in number default 1,
  logfile   in  varchar2 default NULL,
  events    in  number   default NULL
);

/*----------------------- com_sync_index -------------------------*/
PROCEDURE com_sync_index(
  idx_name  in  varchar2 default null,
  memory    in  varchar2 default null,
  part_name in  varchar2 default null
);

/*----------------------- add_rem_mdata --------------------------*/

PROCEDURE add_rem_mdata(
  add_rem      in varchar2,
  idx_name     in varchar2,
  section_name in varchar2,
  mdata_values in sys.odcivarchar2list,
  mdata_rowids in sys.odciridlist,
  part_name    in varchar2
);

/* 5364449: Removed csync since it is no longer used */

/*------------------- PopulatePending -----------------------------*/

PROCEDURE PopulatePending(
  idx  in dr_def.idx_rec,
  ixpname in varchar2
);

/*------------------- UpdateMDATA -----------------------------*/

PROCEDURE UpdateMDATA(
  itab     in varchar2,
  ktab     in varchar2,
  mdata_id in binary_integer,
  coltype  in varchar2,
  rid      in varchar2,
  oldval   in sys.anydata,
  newval   in sys.anydata,
  gtab     in varchar2 default null
);

/* Following 2 routines added for bug 5079472 */
/*------------------- lock_opt_rebuild ------------------------*/
PROCEDURE lock_opt_rebuild(
  cid        in number,
  pid        in number,
  lock_mode  in number,
  timeout    in number,
  release_on_commit in boolean default FALSE
);

/*----------------- unlock_opt_rebuild ------------------------*/
PROCEDURE unlock_opt_rebuild;

/*--------------------------- lock_opt_mvdata -----------------*/
PROCEDURE lock_opt_mvdata(
  cid in number,
  pid in number
);

/*-------------------- upd_sdata  -----------------------------*/
/*
  NAME
    upd_sdata

  DESCRIPTION
    update sdata section value

  ARGUMENTS
    idx_name     - index name
    section_name - SDATA section name
    sdata_value  - sdata value
    sdata_rowid  - rowid
    part_name    - partition name

  NOTES

  EXCEPTIONS
*/

PROCEDURE upd_sdata(
  idx_name      in varchar2,
  section_name  in varchar2,
  sdata_value   in sys.anydata,
  sdata_rowid   in rowid,
  part_name     in varchar2 default NULL
);

/*----------------------- ins_del_mvdata --------------------------*/
/*
  NAME
    ins_del_mvdata

  DESCRIPTION
    update a set of docids with given MVDATA values

  ARGUMENTS
    ins_del       - dml mode flag (INS, DEL, UPD)
    idx_name      - index name
    section_name  - MVDATA section name
    mvdata_values - mvdata values
    mvdata_rowids - rowids
    part_name     - partition name

  NOTES

  EXCEPTIONS
*/

PROCEDURE ins_del_mvdata(
  ins_del      in varchar2,
  idx_name     in varchar2,
  section_name in varchar2,
  mvdata_values in sys.odcinumberlist,
  mvdata_rowids in sys.odciridlist,
  part_name    in varchar2
);

/*----------------- AddRemOneMDATA ------------------------------------*/

procedure AddRemOneMDATA(
  itab    in varchar2,
  docid   in number,
  mdataid in binary_integer,
  addrem  in binary_integer,
  value   in varchar2,
  gtab    in varchar2 default null
);

/*------------------------- idx_populate_mode ------------------------- */
FUNCTION idx_populate_mode
return number;

PROCEDURE AddRemOneSDATA(
  sntab   in varchar2,
  docid   in number,
  sdataid in binary_integer,
  addrem  in binary_integer,
  value   in varchar2
);

PROCEDURE add_rem_sdata(
  add_rem      in varchar2,
  idx_name     in varchar2,
  section_name in varchar2,
  sdata_values in sys.odcivarchar2list,
  sdata_rowids in sys.odciridlist,
  part_name    in varchar2
);
end drvdml;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVDOC" authid current_user as

/*-------------------------- rid_to_partname ---------------------------*/
/* Returns partition name corresponding to given rowid */
function rid_to_partname (
  table_owner in varchar2,
  table_name  in varchar2,
  rid         in rowid
) return varchar2;

/*-------------------------- rid_to_partposition ---------------------------*/
/* Returns partition position corresponding to given rowid */

function rid_to_partposition (
  table_owner in varchar2,
  table_name  in varchar2,
  rid       in rowid
) return varchar2;

/*------------------------ partposition_to_partname ------------------------*/
/* Return partition name of given partition position */

function partposition_to_partname (
  table_name  in varchar2,
  partpos   in number
) return varchar2;

/*------------------------ partname_to_partposition ------------------------*/

function partname_to_partposition (
  table_name  in varchar2,
  partname  in varchar2
) return varchar2;

/*------------------------------- get_rowid ------------------------------*/
/* translates a primary key string into a rowid */

FUNCTION get_rowid (
  p_idx     in dr_def.idx_rec,
  p_textkey in varchar2
) RETURN VARCHAR2;

/*--------------------------- restab_chk ------------------------------*/
/* various checks on result tables */

PROCEDURE restab_chk (
  query_id in number,
  restab   in            varchar2,
  resout   in out nocopy varchar2
);

/*--------------------------- reslob_chk ------------------------------*/
/* various checks on result lob */

PROCEDURE reslob_chk (
  reslob in out nocopy clob
);


/*--------------------------- gist_options ----------------------------*/
/* set gist options */

PROCEDURE gist_options(
  glvl     in     varchar2,
  pov      in     varchar2,
  forcepov in     boolean,
  numpar   in     number,
  maxpct   in     number,
  numthm   in     number
);

/*--------------------------- theme_options ----------------------------*/
/* set theme options */

PROCEDURE theme_options(
  full_themes in boolean,
  num_themes  in number
);

/*------------------------------- ling_request ---------------------------*/
/* performs a linguistic request -- common code to themes and gist */

PROCEDURE ling_request (
  index_name  in varchar2,
  textkey     in varchar2,
  inmem       in boolean,
  direct      in boolean,
  reslob      in out nocopy clob,
  use_saved_copy in number
);

/*---------------------- token_request ---------------------------------*/
/* do a tokens call */

PROCEDURE token_request (
  index_name  in   varchar2,
  textkey     in   varchar2,
  inmem       in   boolean,
  direct      in   boolean,
  use_saved_copy in number
);

/*---------------------- stems_request ---------------------------------*/
/* do a stems call */

PROCEDURE stems_request (
  index_name  in   varchar2
);

/*---------------------- noun_phrases_request ---------------------------------*/
/* do a noun phrase extraction call */

PROCEDURE noun_phrases_request (
  index_name  in   varchar2
);

/*---------------------- languages_request ---------------------------------*/
/* do a language[s] extraction call */

PROCEDURE languages_request (
  index_name  in   varchar2
);

/*---------------------- part_of_speech_request ---------------------------------*/
/* do a part_of_speech extraction call */

PROCEDURE part_of_speech_request (
  index_name        in   varchar2,
  disambiguate_tags in   boolean
);

/*--------------------------- markup_options ----------------------------*/
/* check and set markup options */

PROCEDURE markup_options(
  plaintext in boolean,
  tagset    in varchar2,
  starttag  in varchar2,
  endtag    in varchar2,
  prevtag   in varchar2,
  nexttag   in varchar2
);

/*---------------------- concordance_options ----------------------------*/
/* check and set concordance options */

PROCEDURE concordance_options(
  starttag  		IN  VARCHAR2,
  endtag  		IN  VARCHAR2,
  entity_translation  	IN  BOOLEAN,
  kwicradius  		IN  NUMBER,
  max_length  		IN  NUMBER,
  separator  		IN  VARCHAR2
);

/*--------------------------- highlight_options ----------------------------*/
/* check and set highlight options */

PROCEDURE highlight_options(
  plaintext in boolean
);

/*--------------------------- filter_options ----------------------------*/
/* check and set filter options */

PROCEDURE filter_options(
  plaintext in boolean
);

/*--------------------------- highlight_request ----------------------------*/
/* common code to markup, highlight, filter */

procedure highlight_request (
  index_name in varchar2,
  textkey    in varchar2,
  query      in varchar2,
  query_clob in clob,
  inmem      in boolean,
  direct     in boolean,
  reslob     in out nocopy clob,
  use_saved_copy in number
);

end drvdoc;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRUE" authid current_user as

  -- Public data structure

  --
  -- Public procedure prototypes
  --

/*-------------------------------- push -------------------------------------*/
/*
  NAME
    push - PUSH an error onto the stack
  DESCRIPTION

    This function uses trusted callout drexrmessage to get the requested
    error and push it on the stack.  The function takes the facility and
    nmenonic error symbol, and using the current language ID, retrieves
    the error, and pushes it onto the stack.

  ARGUMENTS

    msgid		- error code number

  NOTES
    The messages must have substition variables of the form
    '%(number)s'. You cannot have a substitution variable without a
    number (ex %s) or a substitution variable with a type other than s
    (ex %(1)d)

  EXCEPTIONS

  RETURNS
    none
*/
procedure push(
    msgid       number,
    arg1	varchar2	default NULL,
    arg2	varchar2	default NULL,
    arg3	varchar2	default NULL,
    arg4	varchar2	default NULL,
    arg5	varchar2	default NULL
 );
--pragma restrict_references(push, wnds);

/*-----------------------------get_error_mesg --------------------------*/
function get_error_mesg(
    msgid       number,
    arg1      varchar2        default NULL,
    arg2      varchar2        default NULL,
    arg3      varchar2        default NULL,
    arg4      varchar2        default NULL,
    arg5      varchar2        default NULL
 ) return varchar2;

/*-------------------------- push_internal ---------------------------------*/
/*
  NAME
    push_internal - PUSH an internal error onto the stack
  DESCRIPTION

    This function pushes an internal error onto the stack.

  ARGUMENTS
    arg1..arg5      the arguments for the internal error, printed in
		    the brackets:  DRG-123: internal error [arg1] [arg2] ...
  NOTES

  EXCEPTIONS

  RETURNS
    none
*/
procedure push_internal(
    arg1	varchar2	default NULL,
    arg2	varchar2	default NULL,
    arg3	varchar2	default NULL,
    arg4	varchar2	default NULL,
    arg5	varchar2	default NULL
 );
--pragma restrict_references(push_internal, wnds);

/*--------------------------- get_stack -------------------------------------*/
/*
  NAME
    get_stack - return contents of stack, and clear the stack

  DESCRIPTION

  ARGUMENTS

  notes


  exceptions

  returns
    none
*/
function get_stack return varchar2;

/*--------------------------- get_stack1 ------------------------------------*/
/*
  NAME
    get_stack1 - return contents of stack, and clear the stack

  DESCRIPTION

  ARGUMENTS

  notes


  exceptions

  returns
    none
*/
function get_stack1 return varchar2;

/*-------------------------------- raise -------------------------------------*/
/*
  NAME
    raise - raise an exception, dumping the current stack
  DESCRIPTION

  ARGUMENTS

  notes


  exceptions

  returns
    none
*/
procedure raise;

/*-------------------------------- error------------------------------------*/
/*
  NAME
    error - is there an error on the stack?
  DESCRIPTION

  ARGUMENTS

  NOTES


  EXCEPTIONS

  RETURNS
    TRUE/FALSE
*/
function error return boolean;
pragma restrict_references(error, wnds);


/*-------------------------- text_on_stack ---------------------------------*/
/*
  NAME
    text_on_stack - push text directly on stack
  DESCRIPTION

    This function is used to push the stack returned from C onto the PL/SQL
    stack.

  ARGUMENTS

    text        - text to push

  NOTES

  EXCEPTIONS

  RETURNS
    none
*/
procedure text_on_stack(
    text        varchar2,
    comment     varchar2 default null
);
-- pragma restrict_references(text_on_stack, wnds);

  -- exceptions

/*-------------------------- getmsg ---------------------------------*/
/*
  NAME
    getmsg
  DESCRIPTION

  ARGUMENTS

  NOTES

  EXCEPTIONS

  RETURNS
    none
*/
procedure getmsg(msgid in binary_integer, msgtext out varchar2);

/*-------------------------- clear_stack ---------------------------------*/
/*
  NAME
    clear_stack
  DESCRIPTION

  ARGUMENTS

  NOTES

  EXCEPTIONS

  RETURNS
    none
*/
procedure clear_stack;

/*-------------------------- pop -----------------------------------------*/
/*
  NAME
    pop

  DESCRIPTION
    gets last errcode, errmsg, then clears stack

  ARGUMENTS

  NOTES

  EXCEPTIONS

  RETURNS
    last errcode
*/
procedure pop(errcode out number, errmsg out varchar2);

/*--------------------------- get_stack_noclear -----------------------------*/
/*
  NAME
    get_stack_noclear - return contents of stack without clearing the stack

  DESCRIPTION

  ARGUMENTS

  notes


  exceptions

  returns
    none
*/
function get_stack_noclear return varchar2;


end drue;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVIMR" authid current_user as

/*=========================================================================*/
/*======================  CTX_QUERY FUNCTIONS =============================*/
/*=========================================================================*/

/*---------------------------- explain ------------------------------------*/

type exprec is record (
  id          binary_integer,
  parent_id   binary_integer,
  operation   varchar2(30),
  options     varchar2(30),
  object_name varchar2(80),
  position    binary_integer
);

type exptab is table of exprec index by binary_integer;

r_exp exptab;

procedure add_explain(
  p_id          in binary_integer,
  p_parent_id   in binary_integer,
  p_operation   in varchar2,
  p_options     in varchar2,
  p_object_name in varchar2,
  p_position    in binary_integer
);

/*---------------------------- hqfeedback ---------------------------------*/

type hqfrec is record (
  id          binary_integer,
  parent_id   binary_integer,
  operation   varchar2(30),
  options     varchar2(30),
  object_name varchar2(80),
  position    binary_integer,
  bt          ctx_feedback_type,
  rt          ctx_feedback_type,
  nt          ctx_feedback_type
);

type hqftab is table of hqfrec index by binary_integer;

r_hqf hqftab;

procedure add_hqf(
  p_id          in binary_integer,
  p_parent_id   in binary_integer,
  p_operation   in varchar2,
  p_options     in varchar2,
  p_object_name in varchar2,
  p_position    in binary_integer,
  p_bt          in ctx_feedback_type,
  p_rt          in ctx_feedback_type,
  p_nt          in ctx_feedback_type
);

/*---------------------------- browse_words --------------------------------*/

type brwrec is record (
  word      varchar2(256),
  doc_count binary_integer
);

type brwtab is table of brwrec index by binary_integer;

r_brw brwtab;

procedure add_brw(
  p_word    in varchar2,
  p_count   in binary_integer
);

/*=========================================================================*/
/*========================  CTX_DOC FUNCTIONS =============================*/
/*=========================================================================*/

TTYPE_NORMAL     constant number := 0;
TTYPE_THEME      constant number := 1;
TTYPE_STEM       constant number := 2;
MODE_CLOB        constant number := 1;
MODE_BLOB        constant number := 2;
MODE_BFILE       constant number := 3;
MODE_VCHR2       constant number := 4;
direct_mode      number;
direct_clob      clob;
direct_blob      blob;
direct_if_blob   blob;
direct_bfile     bfile;
direct_vchr2     varchar2(32767);
direct_lang      varchar2(256);
direct_format    varchar2(256);
direct_cset      varchar2(256);

PROCEDURE direct_set (
  p_mode   in binary_integer default NULL,
  p_lang   in varchar2 default NULL,
  p_format in varchar2 default NULL,
  p_cset   in varchar2 default NULL,
  p_vchr2  in varchar2 default NULL,
  p_bfile  in bfile    default NULL,
  p_clob   in clob     default NULL,
  p_blob   in blob     default NULL
);

/*---------------------------- themes --------------------------------------*/

type thmrec is record (
  theme  varchar2(2000),
  weight number
);
type thmtab is table of thmrec index by binary_integer;

r_thm thmtab;

PROCEDURE add_theme(
  p_theme  in varchar2,
  p_weight in number
);

/*------------------------------ gist --------------------------------------*/

type gsttab is table of varchar2(31000) index by binary_integer;

r_gst    thmtab;
r_gsttxt gsttab;

PROCEDURE add_gist(
  p_pov    in varchar2
);

PROCEDURE add_gist_txt(
  p_text   in varchar2
);

/*------------------------------ tokens ------------------------------------*/

type tokrec is record (
  token varchar2(64),
  offset number,
  length number,
  ttype  number
);
type toktab is table of tokrec index by binary_integer;

r_tok toktab;

PROCEDURE add_token(
  p_token  in varchar2,
  p_offset in number,
  p_length in number,
  p_ttype  in number
);

/*------------------------------ stems ------------------------------------*/
/* Beehive */
type stemrec is record (
  /* We made the size of stem to be larger than the size used for tokens
   * as this might be a multi-word stem
   */
  stem          varchar2(1000),
  offset        number,
  length        number,
  is_in_lexicon boolean,
  orig          varchar2(64)
);
type stemtab is table of stemrec index by binary_integer;

r_stems stemtab;

PROCEDURE add_stem(
  p_stem          in varchar2,
  p_offset        in number,
  p_length        in number,
  p_is_in_lexicon in number,
  p_orig          in varchar2
);

/*------------------------------ noun phrases ------------------------------------*/
/* Beehive */
type nprec is record (
  term          varchar2(64),
  pos           varchar2(64), /* TBD: Confirm with Inxight and reduce size */
  offset        number,
  length        number,
  is_grp_start  boolean,
  is_in_lexicon boolean
);
type nptab is table of nprec index by binary_integer;

r_noun_phrases nptab;

PROCEDURE add_noun_phrase(
  p_np_term       in varchar2,
  p_term_pos      in varchar2,
  p_offset        in number,
  p_length        in number,
  p_is_grp_start  in number,
  p_is_in_lexicon in number
);

/*------------------------------ languages ------------------------------------*/
/* Beehive */
type languagerec is record (
  language      varchar2(64),
  score         number
);
type languagetab is table of languagerec index by binary_integer;

r_languages languagetab;

PROCEDURE add_language(
  p_language      in varchar2,
  p_score         in number
);

/*------------------------------ part of speech ---------------------------------*/
/* Beehive */
type posrec is record (
  word          varchar2(64),
  pos           varchar2(64), /* TBD: Confirm with Inxight and reduce size */
  offset        number,
  length        number,
  is_new_word   boolean,
  is_in_lexicon boolean
);
type postab is table of posrec index by binary_integer;

r_pos postab;

PROCEDURE add_pos(
  p_word          in varchar2,
  p_pos           in varchar2,
  p_offset        in number,
  p_length        in number,
  p_is_new_word   in number,
  p_is_in_lexicon in number
);

/*------------------------------ highlight ---------------------------------*/

type hilrec is record (
  offset number,
  length number
);
type hiltab is table of hilrec index by binary_integer;

r_hil hiltab;

PROCEDURE add_highlight(
  p_offset in number,
  p_length in number
);

/*========================================================================*/
/*=================== DOCUMENT FEATURE FUNCTIONS =========================*/
/*========================================================================*/
/* reset the document feature buffer */
PROCEDURE reset_feature;

/* add one feature */
PROCEDURE add_feature(id number, weight number);

/* get feature number */
FUNCTION feature_count RETURN NUMBER;

/* get feature by index */
PROCEDURE get_feature(
	 idx BINARY_INTEGER,
 	 id  OUT NUMBER,
	 weight OUT NUMBER
	);

/*========================================================================*/
/*=================== DOCUMENT CLUSTERING FUNCTIONS ======================*/
/*========================================================================*/
/* in-memory table for document assignment */
TYPE doc_rec IS RECORD (
	docid     number,   -- document ID to identify the document
	clusterid number,   -- the ID of the cluster the document is assigned to
	score     number    -- the similarity score between document and cluster
);
TYPE doc_tab is TABLE OF doc_rec INDEX BY BINARY_INTEGER;

/* in-memory table for cluster information */
TYPE cluster_rec IS RECORD (
	clusterid number,         -- cluster ID to identify a cluster
	descript  varchar2(4000), -- a string to describe the cluster
        label     varchar2(200),  -- a suggested label for the cluster
        sze       number,         -- number of documents assigned to the cluster
	quality_score number,     -- the quality score of the cluster
	parent    number          -- parent cluster id. negative means no parent
);
TYPE cls_tab IS TABLE OF cluster_rec INDEX BY BINARY_INTEGER;

/* document items record */
TYPE did_rec IS RECORD (
	did        number,         -- document id
	row        rowid           -- rowid of the document
);
TYPE did_tab IS TABLE OF did_rec INDEX BY BINARY_INTEGER;

pv_doctab doc_tab;
pv_clstab cls_tab;
pv_didtab did_tab;
pv_didcur integer := 1;

/* add one item to the document cluster assignment table */
PROCEDURE add_doccls(
	docid     number,
	clusterid number,
	score     number);

/* add one item to the cluster table */
PROCEDURE add_cluster (
	clusterid     number,
	descript      varchar2,
	label         varchar2,
	sze           number,
	quality_score number,
	parent        number);

/* start item id scan */
PROCEDURE start_didscan;

/* next item id */
FUNCTION next_did (
	did         out  number,
	row         out  rowid)
return  number;


/*=========================================================================*/
/*======================  CTX_REPORT FUNCTIONS ============================*/
/*=========================================================================*/

  s1   constant varchar2(10) := ' ';
  s75  constant varchar2(75) :=
 '                                                                           ';
  e75  constant varchar2(75) :=
 '===========================================================================';
  h75  constant varchar2(75) :=
 '---------------------------------------------------------------------------';

procedure initreport;

procedure title(
  title  in varchar2 default null,
  title2 in varchar2 default null,
  sep    in varchar2 default null
);
procedure wl(lline in varchar2);
procedure w(lline in varchar2);
procedure blankln;
procedure endreport(report in out nocopy clob);

/*--------------------------query_log_summary -------------------------------*/
type queryrec is record (
  query  varchar2(4000),
  times  number
);

type querytab is table of queryrec index by binary_integer;

r_query querytab;

PROCEDURE add_query(
  p_query  in varchar2,
  p_times  in number
);

pv_kwic varchar2(32767);

function get_kwic return varchar2;

procedure set_kwic(kwic in varchar2);

end drvimr;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRIPARX" as

  procedure set_session_state(sess_state dr$session_state_t);
  function  get_session_state return dr$session_state_t;
  procedure end_parallel_op(sess_state dr$session_state_t);

  procedure  setContext(mykey  in varchar2, myval in sys.anydata);
  procedure  clearContext(mykey in varchar2);
  function   getContext(mykey in varchar2) return sys.anydata;

end driparx;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVODM" AUTHID current_user AS

TYPE CurType IS REF CURSOR;

/* type used for svm interface to odm containing training set */
TYPE trainsamp IS RECORD (
    sequence_id    NUMBER,  -- document id
    attribute_id   NUMBER,  -- feature id >=0
                            -- or -1 for rows that contain doc. assignment info
    value          NUMBER   -- feature weight
                            -- or catid for rows for doc. assignment info
  );

TYPE trainsamps IS TABLE OF trainsamp;

/* type used for feature definition */
TYPE feature IS RECORD (
	text varchar2(160),     -- feature text
	type number(3),         -- feature type with 0:single token,
				--		     1:theme
 				--		     9:stem words
	id   number,            -- feature id
	score number            -- statistic feature score which can be idf
				--    if need to calculate idf for feature
				--    weight in documents or simply document
			        --    frequency.
	);
TYPE features IS TABLE OF feature;

TYPE suggestion IS RECORD (
	docid  number,          -- document id
	catid  number,          -- suggested category id
	scr    number           -- associate score between doc and category
);
TYPE suggestions IS TABLE of suggestion;

TYPE kmeanmodel_rec IS RECORD (
	id integer,                  -- cluster id
	parent number,  	     -- parent id
	dispersion number,	     -- coherencen of the cluster
        attribute_name varchar2(30));  -- attribute id
TYPE kmeanmodel is table of kmeanmodel_rec;

/* train SVM model */
PROCEDURE svm_train(
    	idx_owner varchar2,
	idx_name  varchar2,
	doctab    varchar2,
	docid     varchar2,
	cattab    varchar2,
	catdocid  varchar2,
	catid     varchar2,
	restab    varchar2,
	prefid    number
);

/* ----table function used for ODM to extract feature from training set ----*/
/* DESCRIPTION
   The result table is either created by users before calling this function or
   created in this program with the specified table name and under the current
   user (if the specified table does not exist).
   If user create the result table (which can support table schema for
   different users),
   the restab should have the following three columns with the exact column
   names:
	cat_id number
	type number(3) not null
	rule blob
*/
FUNCTION feature_prep(
	index_name  varchar2, -- context index name on training document table.
	docid     varchar2,   -- document id column name in document table
	cattab    varchar2,   -- name of category table
	catdocid  varchar2,   -- document id column name for category table
	catid     varchar2,   -- category id column name for category table
	restab    varchar2,   -- result table to write the model
	preference varchar2   -- preference name
) RETURN trainsamps PIPELINED;

/* -- table function used for ODM to get features for test set ----------*/
/* DESCRIPTION
   This function is used in apply time. The <restab> is the result table
   output from calling feature preparation function based on training set.
*/
FUNCTION feature_prep(
	index_name  varchar2, -- context index name on training document table.
	docid     varchar2,   -- document id column name in document table
	restab    varchar2    -- table storing the feature definition
) RETURN trainsamps PIPELINED;

/* ----------------------- for ODM to explain features ------------------*/
/* DESCRIPTION
   The <restab> is the result table output from calling feature preparation
   function based on training set.
*/
FUNCTION feature_explain(
	restab    varchar2    -- table storing the feature definition
	) RETURN features PIPELINED;



/*--------------------------------------------------------------------------*/
/*                                                                          */
/*------------The following functions is internal functions  ---------------*/
/*                                                                          */
/*--------------------------------------------------------------------------*/

/* feature preparation table function without checking input parameter */
FUNCTION feature_prep_nc(
	idx_owner varchar2,
	idx_name  varchar2,
	doctab    varchar2,
	docid     varchar2,
	cattab    varchar2,
	catdocid  varchar2,
	catid     varchar2,
	restab    varchar2,
	prefid    number,
	temp_table varchar2
) RETURN trainsamps PIPELINED;

/* start classify a document.Assume: The document feature vector has been
   generated */
FUNCTION get_suggestions(model_name varchar2, dur number)
   return suggestions PIPELINED;

/* type used for ODM setup */
TYPE settingdbrec_t IS RECORD (
    id             NUMBER,
    value          VARCHAR2(128)
  );
TYPE setting_t IS TABLE of settingdbrec_t;

FUNCTION odmtrainset return setting_t PIPELINED;

FUNCTION  get_features
RETURN trainsamps PIPELINED;

PROCEDURE fvstab(
	fvstab    OUT varchar2);

PROCEDURE fi2ttab(
	fi2ttab    OUT varchar2);


FUNCTION odmktrainset(p_srt in varchar2,
p_cluster_num in number) return setting_t PIPELINED;

-- generate model
PROCEDURE odm_genmodel(
p_fvstab in varchar2,
p_srtab  in varchar2,
p_cluster_num in number,
o_modname OUT varchar2);

FUNCTION odm_readkmeanmodel(
	p_modname varchar2) return kmeanmodel PIPELINED;

-- drop model
PROCEDURE odm_drpmodel(
p_modname IN varchar2);

END drvodm;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVPARX" authid current_user is
   FUNCTION ParallelPopuIndex(
     cur        SYS_REFCURSOR,
     idxownid   number,
     idxid      number,
     idxo       varchar2,
     idxn       varchar2,
     idxp       varchar2,
     idxpopstate dr$popindex_state_t)
       return sys.odcivarchar2list
      parallel_enable(partition cur by any) pipelined;

   FUNCTION IndexOptimizeParFn(
     crsr        in drvddl.popcurtyp,
     idxownid    in number,
     idxowner    in varchar2,
     idxname     in varchar2,
     ixpname     in varchar2,
     shadow_itab in varchar2,
     shadow_stab in varchar2,
     nextid     in number,
     optstate    in dr$optim_state_t
   ) return sys.odcivarchar2list
     pipelined parallel_enable (partition crsr BY HASH(num));

   FUNCTION TraceGetTrace return dr$trc_tab;
   FUNCTION FilterCacheGetStats(
     idx_id    number,
     idx_ownid number,
     idx_owner varchar2,
     idx_name  varchar2,
     ixp_name  varchar2
    ) return number;

  function GetFilterCacheSize     return number;
  function GetFilterCacheEntries  return number;
  function GetFilterCacheRequests return number;
  function GetFilterCacheHits     return number;

  procedure SetFilterCacheSize(stat in number);
  procedure SetFilterCacheEntries(stat in number);
  procedure SetFilterCacheRequests(stat in number);
  procedure SetFilterCacheHits(stat in number);

/*------------- Mapping Attributes into Existing Documents -----------------*/

type map_rec_t is record(map_docid number, map_data  varchar2(4000));
type map_typ_cur is ref cursor return map_rec_t;

-- process input documents as mdata
MAP_DOC_MODE_MDATA constant number := 0;

/* Main Mapping function */
function IndexMapDocuments(
    crsr     in drvparx.map_typ_cur,
    ownid    in number,
    owner    in varchar2,
    idxname  in varchar2,
    partname in varchar2,
    flags    in binary_integer,
    sectyp   in binary_integer
) return dr$mapdoc_set_t
  pipelined
  order crsr by (map_docid)
  parallel_enable (partition crsr by range(map_docid));

/* Create sublex tokens given language column */
function CreateSublexTokens(
  crsr   in drvparx.map_typ_cur
) return dr$mapdoc_set_t
  pipelined
  parallel_enable (partition crsr by any);

end drvparx;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVTMT" AUTHID current_user AS

type col_phrases IS TABLE OF varchar2(200) INDEX BY BINARY_INTEGER;

FUNCTION noex_tabname(
	l_owner  IN varchar2,
	prx      IN varchar2) return VARCHAR2;

/* validate the result table, if not exists, create one
   The table should have three columns
          cat_id  number,
	  type    number,
	  rule    blob
*/
PROCEDURE model_tab(
	tabname     IN OUT varchar2);

/* validate the table, if not exists, create one
   The table should have three columns
	 docid     number -- document ID to identify a document
	 clusterid number -- the ID of the cluster the document is assigned to
	 score     number -- the similarity score between document and cluster
*/
PROCEDURE doccls_tab(
	tabname     IN OUT varchar2);

/* validate the table, if not exists, create one
   The table should have three columns
	 clusterid number         -- cluster ID to identify a cluster
	 descript  varchar2(4000) -- a string to describe the cluster
         label     varchar2(200)  -- a suggested label for the cluster
         sze       number         -- number of documents assigned to the cluster
	 quality_score number     -- the quality score of the cluster
	 parent    number         -- parent cluster id. negative means no parent
*/
PROCEDURE cluster_tab(
	tabname     IN OUT varchar2);

/* verify the train document tables  */
PROCEDURE verify_traindoc(
	lv_doctab IN OUT varchar2,
	docid     IN     varchar2);

PROCEDURE verify_traincat(
	cattab    IN OUT varchar2,
        catdocid  IN     varchar2,
	catid     IN     varchar2);

/* verify result model table */
PROCEDURE verify_modeltab (
	lv_restab IN OUT varchar2 );

END drvtmt;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVUTL" authid current_user as

/*-------------------     Common Varchar2 Length Definitions     ---------*/
/*  pre-12.2 supported id len = 30  for 12.2 supported id len = 128       */
/*  id = identifier  qid = quoted id  lid = long id  qlid = quoted lid    */

subtype dr_id   is dbms_id_30;              /* use: id         */
subtype dr_id2  is varchar2(61);            /* use: id.id      */
subtype dr_id3  is varchar2(92);            /* use: id.id.id   */

subtype dr_qid  is dbms_quoted_id_30;       /* use: quoted id   */
subtype dr_qid2 is varchar2(65);            /* use: qid.qid     */
subtype dr_qid3 is varchar2(98);            /* use: qid.qid.qid */

subtype dr_lid  is dbms_id_128;             /* use: long id lid */
subtype dr_lid2 is varchar2(257);           /* use: lid.lid     */
subtype dr_lid3 is varchar2(386);           /* use: lid.lid.lid */

subtype dr_qlid  is dbms_quoted_id_128;     /* use: quoted long id qlid */
subtype dr_qlid2 is varchar2(261);          /* use: qlid.qlid           */
subtype dr_qlid3 is varchar2(392);          /* use: qlid.qlid.qlid      */

subtype dr_shortbuf is varchar2(32);         /* use: small scratch buff  */
subtype dr_medbuf   is varchar2(128);        /* use: medium scratch buff */
subtype dr_longbuf  is varchar2(512);        /* use: long scratch buff   */
subtype dr_extrabuf is varchar2(4192);       /* use: 4000 bytes          */
subtype dr_maxbuf   is varchar2(32767);      /* use: max len allowed     */

DR_ID_LEN constant number   := 30;
DR_ID2_LEN constant number  := 61;
DR_ID3_LEN constant number  := 92;
DR_QID_LEN constant number  := 32;
DR_QID2_LEN constant number := 65;
DR_QID3_LEN constant number := 98;
DR_LID_LEN constant number  := 128;
DR_LID_LEN2 constant number  := 257;
DR_LID_LEN3 constant number  := 386;

/* This is the size of a row id (in bytes) */
DR_ROWID_LEN constant number := 18;
subtype dr_rowid   is varchar2(18);

/* The is the size of a token (in bytes) */
MAX_TOKEN_SIZE constant number := 64;
subtype dr_token   is varchar2(64);

/*--------------------------- CurrentUserid ------------------------------*/
/* this basically does a select userenv('SCHEMAID') from dual and returns */
/* the result.  This is needed because SQL and PL/SQL don't always agree  */
/* on what userenv('SCHEMAID') should be */
function CurrentUserid return binary_integer;

/*------------------------------ SetInvoker ------------------------------*/
/* set invoking user -- used by invoker's rights packages calling */
/* definer's rights packages which need to know the invoker       */

/* note: pass 0 to use current user -- this has to be done by select */
/* from dual, NOT calling userenv directly                           */

procedure SetInvoker(p_userid in binary_integer default 0);

/*------------------------------ ClearInvoker ----------------------------*/
/* clear invoking user -- if you call SetInvoker, make sure to call this */

procedure ClearInvoker;

/*------------------------------ GetInvoker ------------------------------*/
/* get the last invoking username */

function GetInvoker return varchar2;

/*------------------------------ GetInvokerId ----------------------------*/
/* get the last invoking userid */

function GetInvokerId return number;

/*-------------------------- get_ora_event_level ----------------------------*/
/* Set an Oracle Event's level */

function set_ora_event_level (
  event   in number,
  level   in number
) return number;

/*-------------------------- get_ora_event_level ----------------------------*/
/* Get an Oracle Event's Level */

function get_ora_event_level (
  event   in number
) return number;

/*------------------------------ write_to_log -------------------------------*/
/* Write a message to the ctx log file.
 * msg     - the message to dump
 * newline - should the message be terminated with a new line ?
 *
 * The reason this function is here instead of in dr0out (where the
 * rest of the log-file functionality changes are, is because we don't
 * want to expose this yet to end users
 */
procedure write_to_log(msg in varchar2,
                       newline in binary_integer default 1);

/*--------------------------- check_base_table ------------------------*/
/* Returns the no. of base table rows which have lang OR abbr OR alt
 *  as their language column value.
 */
function check_base_table(idx in dr_def.idx_rec,
                          language in varchar2,
                          abbr in varchar2 default NULL,
                          alt  in varchar2 default NULL)
return number;


/*--------------------------- validate_ixs_columns -------------------------*/
/* validate ixs columns returned by driixs.GetIndexIXSColumns */
procedure validate_ixs_columns
(
  l_idx   in dr_def.idx_rec,
  collist in dr_def.ixc_tab
);

/*--------------------------- validate_ixs_collist -------------------------*/
/* validate ixs_collist returned by driixs.GetIndexIndexSet */
procedure validate_ixs_collist
(
  l_idx   in dr_def.idx_rec,
  collist in varchar2,
  out_collist out varchar2
);

/*--------------------------- ProceduralLogLevel -------------------------*/
/* returns TRUE if procedural replication is on */
function ProceduralLogLevel return boolean;

/*--------------------------- ISDGRollingUpgrade -------------------------*/
/* returns TRUE if database is logical standby */
function ISDGRollingUpgrade return boolean;

end drvutl;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVXMD" authid current_user is


/*---------------------------- GetIndexMD  -------------------------------*/
/* fetch selected dr$index column values into out variables */

procedure GetIndexMD(
  p_idxid           in  number,
  o_owner           out varchar2,
  o_owner#          out number,
  o_name            out varchar2,
  o_table_obj#      out number,
  o_table_dataobj#  out number,
  o_key_name        out varchar2,
  o_key_type        out binary_integer,
  o_text_name       out varchar2,
  o_text_type       out binary_integer,
  o_text_length     out binary_integer,
  o_lang_col        out varchar2,
  o_fmt_col         out varchar2,
  o_cset_col        out varchar2,
  o_idx_type        out binary_integer,
  o_idx_option      out varchar2,
  o_idx_sync_type   out varchar2,
  o_idx_sync_memory out binary_integer,
  o_idx_src_name    out varchar2,
  o_idx_src_id      out binary_integer,
  o_idx_version     out binary_integer,
  o_config_col      out varchar2
);

/*---------------------------- GetIndexPartition  -----------------------*/
/* get dr$index_partition information */

procedure GetIndexPartition(
  o_id               out number,
  o_tabpart_dataobj# out number,
  o_sync_type        out varchar2,
  o_sync_memory      out number,
  o_option           out varchar2,
  i_cid               in number,
  i_pname             in varchar2
);

/*---------------------------- OpenIndexMDScan ----------------------*/
/* open dr$index_object and value cursors */

procedure OpenIndexMDScan(
  p_idxid           in  number
);

/*---------------------------- NextIndexObject ---------------------------*/
/* get next dr$index_object cursor */

function NextIndexObject(
  o_cla_id          out binary_integer,
  o_obj_id          out binary_integer,
  o_acnt            out binary_integer
) return binary_integer;

/*---------------------------- NextIndexValue ----------------------------*/
/* get next dr$index_value cursor */

function NextIndexValue(
  o_cla_id          out binary_integer,
  o_att_id          out binary_integer,
  o_datatype        out binary_integer,
  o_sub_group       out binary_integer,
  o_sub_att_id      out binary_integer,
  o_sub_datatype    out binary_integer,
  o_value           out varchar2
) return binary_integer;

/*---------------------------- NextIndexCDI ---------------------------*/
/* get next dr$index_cdi_column cursor */

function NextIndexCDI(
  o_cdi_pos         out binary_integer,
  o_cdi_type#       out binary_integer,
  o_cdi_len         out binary_integer,
  o_cdi_name        out varchar2,
  o_cdi_sec         out varchar2,
  o_cdi_stype       out binary_integer,
  o_cdi_id          out binary_integer
) return binary_integer;

/*---------------------------- GetDocidCount -----------------------------*/
/* get docid count */

function GetDocidCount(
  p_idxid           in number,
  p_ixpid           in number default null
) return number;


/*--------------------------- GetNextId -------------------------------------*/
/* get next docid */

function GetNextId(
  p_idxid in binary_integer,
  p_ixpid in binary_integer default null
) return binary_integer;

/*---------------------------- GetIndexStats -----------------------------*/
/* get index stats from dr$stats */

procedure GetIndexStats(
  p_idxid           in number,
  p_smplsz          in out nocopy number
);

/*---------------------------- GetBaseTableName --------------------------*/
/* get base table name */

function GetBaseTableName(
  p_idxid           in number,
  p_ixpid           in number default null
) return varchar2;

/*---------------------------- IncrementDocCnt --------------------------*/
/* increment docid count */

procedure IncrementDocCnt(
  p_idxid           in number,
  p_ixpid           in number,
  p_delta           in number
);

/*--------------------------- DecrementDocCnt ------------------------------*/
/* decrement docid count */
procedure DecrementDocCnt(
  p_idxid in number,
  p_ixpid in number,
  p_delta in number
);

/*---------------------------- AllocateDocids ---------------------------*/
/* allocate docids */

procedure AllocateDocids(
  p_idxid           in  number,
  p_ixpid           in  number,
  p_allocsz         in  binary_integer,
  p_startid         out number
);

/*---------------------------- RecordIndexError -------------------------*/
/* records an error to the dr$index_error table */

procedure RecordIndexError(
  p_idxid           in number,
  p_textkey         in varchar2,
  p_stack           in varchar2
);

/*---------------------------- OptStartTimer -----------------------------*/
/* starts optimization timer */

procedure OptStartTimer;

/*---------------------------- OptGetTimer -------------------------------*/
/* gets optimization timer */

function OptGetTimer return binary_integer;

/*---------------------------- OptGetState -------------------------------*/
/* get full optimize state */

procedure OptGetState(
  p_idxid       in  number,
  p_ixpid       in  number,
  p_ntable_name in  varchar2,
  p_itable_name in  varchar2,
  p_sntable_name in  varchar2,
  p_beg_s_opt   in  boolean,
  o_opt_token   out varchar2,
  o_opt_type    out number
);

/*---------------------------- OptGetType -------------------------------*/
/* get type optimize start token */

procedure OptGetType(
  p_idxid       in  number,
  p_ixpid       in  number,
  p_ntable_name in  varchar2,
  p_itable_name in  varchar2,
  p_sntable_name in  varchar2,
  o_opt_token   out varchar2,
  o_opt_type    in  number
);

/*---------------------------- OptSetState -------------------------------*/
/* set full optimize state */

procedure OptSetState(
  p_idxid       in  number,
  p_ixpid       in  number,
  p_opt_token   in  varchar2,
  p_opt_type    in  number
);

/*---------------------------- GetFieldSecName -----------------------------*/
/* get field section name */

function GetFieldSecName (
  p_idxid  in number,
  p_secid  in number
) return varchar2;

/*---------------------------- GetPrefClaObj -----------------------------*/

procedure GetPrefClaObj(
  p_preid  in  number,
  o_claid  out number,
  o_objid  out number
);

/*---------------------------- GetObjDefault -----------------------------*/

procedure GetObjDefault(
  p_oatid   in  number,
  o_default out varchar2
);

/*---------------------------- OpenPrefValue ------------------------------*/

procedure OpenPrefValue(
  p_preid   in number
);

/*---------------------------- NextPrefValue ------------------------------*/

function NextPrefValue(
  o_value   out varchar2,
  o_oatid   out number
) return binary_integer;

/*---------------- set_reverse_docid_switch  -------------------*/
/*
  NAME
    Set_reverse_docid_switch

  DESCRIPTION
    Turns ON/OFF reverse docid processing for a specified index.

  ARGUMENTS
    owner_name     index owner
    index_name     index name
    value          switch value (ON or OFF)
*/
PROCEDURE set_reverse_docid_switch(
  owner_name     in  varchar2,
  index_name     in  varchar2,
  value          in  varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(set_reverse_docid_switch, AUTO);

/*------------------- get_functional_cache_size ----------------------------*/
FUNCTION get_functional_cache_size RETURN number;

/*--------------- GetMVFlag ------------------------------------------------*/
/*
  NAME
    GetMVFlag

  DESCRIPTION
    Check whether it's index on Materialized View

  ARGUMENTs
    table_id
    owner_name
    opt              1 -- index on MView
                     0 -- not index on MView
*/

PROCEDURE GetMVFlag(
  table_id       in  number,
  owner_name     in  varchar2,
  opt            out binary_integer
);

/*---------------------------- GetSecDataType -----------------------------*/
/* get section datatype, mainly for MDATA and SDATA */

function GetSecDataType (
  p_idxid  in number,
  p_secid  in number
) return number;

/*---------------------------- ChkIndexOption -----------------------------*/
/*
  Take in index id, and an option letter (see drdmlop() for a list of
  options), return 1 if the given option is set, 0 otherwise.
*/
function ChkIndexOption (
  p_idxid  in number,
  p_opt    in varchar2
) return number;

/*---------------------------- SelectUserAnlDictLob-----------------------------*/
/*
  Take index id and dictionary language as input and return user supplied
  dictionary lob to be used by ATG auto lexer
*/
function SelectUserAnlDictLob(
  p_idxid  in number,
  p_dictlang in varchar2
) return clob;

/*--------------------------- ctx_sqe_tbl_func ------------------------------*/
/*
  Table function for creating the ctx_user_sqes view
*/
type ctx_sqe_type is record(
  sqe_owner# number,
  sqe_name varchar2(30),
  sqe_query clob);

type ctx_sqe_type_tab is table of ctx_sqe_type;

function ctx_sqe_tbl_func
  return ctx_sqe_type_tab pipelined;

/*---------------------- check_file_access_role -----------------------------*/
/*
   Returns TRUE if the specified user has the role given by file_access_role
   and can therefore create/sync indexes using file or URL datastore
*/
function check_file_access_role(p_user IN varchar2) return boolean;

/*--------------------------- autoopt_prep --------------------------------*/
/* autoopt_prep - preparation for autoopt */
procedure autoopt_prep(p_idxid in number,
                       p_ixpid in number,
                       p_wait in number,
                       p_lockret in out number
);

/*--------------------------- autoopt_clo --------------------------------*/
/* autoopt_clo - close for autoopt */
procedure autoopt_clo;

/*--------------------------- autoopt_push_token --------------------------*/
/* autoopt_push_token - push a token to autooptimize */
procedure autoopt_push_token(p_idxid in number,
                             p_message in raw);

/*--------------------------- TxnalGetKey --------------------------------*/
/* Return the key if it has been set.  Returns Null if not set            */
procedure TxnalGetKey(
  p_key in out raw
);

/*--------------------------- TxnalSetKey --------------------------------*/
/* Set the key.  Set flag                                                 */
procedure TxnalSetKey(
  p_key in raw
);

/*------------------------ GetSLXMdataSecID ------------------------------*/
/* Get section id/token type for DR$ML MDATA section, doc level lexer     */

FUNCTION GetSLXMdataSecID(
  idxid in number
) return number;

/*------------------------ RecordOptTokenError ---------------------------*/
PROCEDURE RecordOptTokenError(
  token_text in varchar2,
  token_type in number
);

/*----------------------- ProcessN -------------------------------*/
PROCEDURE ProcessN(p_idxid in number,
                   p_ixpid in number,
                   del in number);

/* 14175174: ------------- SubstringEnabled ------------------------*/
FUNCTION SubstringEnabled(p_idxid in number) RETURN number;


/*---------------------------- IndexHasGTable ------------------------------*/
FUNCTION IndexHasGTable(
  p_idxid in number,
  p_ixpid in number default NULL)
RETURN boolean;

end drvxmd;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVXTAB" authid current_user as

  DEFAULT_SEPARATOR       constant varchar2(1) := '$';
  TMP1_SEPARATOR          constant varchar2(1) := 'M';
  TMP2_SEPARATOR          constant varchar2(1) := 'N';

PROCEDURE part_events_off;
PROCEDURE part_events_on;

/* ====================================================================== */
/* ====================================================================== */
/*                             CONTEXT                                    */
/* ====================================================================== */
/* ====================================================================== */

/*------------------------- create_a_table --------------------------------*/
PROCEDURE create_a_table(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number
);

/*------------------------- create_f_table --------------------------------*/
PROCEDURE create_f_table(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number
);

/*-------------------------- create_s_table ------------------------------*/
PROCEDURE create_s_table(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number,
  part_id   in number default null,
  sep       in varchar2,
  part      in boolean default FALSE,
  shadow    in boolean default FALSE
);

/*---------------------- part_create_s_tables -----------------------------*/
PROCEDURE part_create_s_tables(
  idx  in dr_def.idx_rec
);

/*----------------------- create_index_tables -----------------------------*/

PROCEDURE create_index_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number,
  part_id   in number default null,
  temp      in boolean default FALSE,
  part      in boolean default FALSE,
  shadow    in boolean default FALSE
);

/*--------------------------- create_g_table ---------------------------*/
procedure create_g_table(
  idx dr_def.idx_rec,
  part_id in number  default 0
);

/*--------------------------- drop_g_table --------------------------------*/
procedure drop_g_table(
  idx dr_def.idx_rec,
  part_id in number  default 0
);

/*--------------------------- add_offsets_column --------------------------*/
procedure add_offsets_column(
  idx dr_def.idx_rec
);

-- 8323978: Removed create_index_triggers

/*----------------------- create_index_indexes  ---------------------------*/

PROCEDURE create_index_indexes(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number,
  part_id   in number default null,
  temp      in boolean default FALSE,
  part      in boolean default FALSE,
  status    in varchar2 default null
);

/*----------------------- drop_index_tables  ---------------------------*/

PROCEDURE drop_index_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number,
  has_p     in boolean default null,
  part_id   in number default null,
  temp      in boolean default FALSE,
  isAlter   in boolean default FALSE
);

/*----------------------- drop_FA_tables  -------------------------------*/

PROCEDURE drop_FA_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number
);

/*----------------------- trunc_index_tables  ---------------------------*/

PROCEDURE trunc_index_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number,
  part_id   in number default null
);

/*----------------------- rename_index_tables  ---------------------------*/

PROCEDURE rename_index_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number,
  new_name  in varchar2,
  has_idx   in boolean,
  part_id   in number default null
);

/*----------------------- exchange_index_tables  --------------------------*/

PROCEDURE exchange_index_tables(
  idxp_owner in varchar2,
  idxp_name  in varchar2,
  idxp_id    in number,
  idxp_pid   in number,
  idxn_owner in varchar2,
  idxn_name  in varchar2,
  idxn_id    in number
);

/*-------------------------- get_create_sql -------------------------------*/

FUNCTION get_create_sql(
  idx_owner      in varchar2,
  idx_name       in varchar2,
  idxid          in number,
  part_id        in number default null,
  which          in varchar2,
  sto            in out nocopy dr_def.vc500_tab,
  sep            in varchar2 default DEFAULT_SEPARATOR,
  x_part         in boolean default FALSE,
  char_semantics in varchar2 default 'BYTE'
) RETURN VARCHAR2;

/*-------------------------- get_object_name ------------------------------*/

FUNCTION get_constraint_name(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number,
  part_id   in number default null,
  which     in varchar2,
  sep       in varchar2 default DEFAULT_SEPARATOR
) RETURN VARCHAR2;

/*-------------------------- get_object_name ------------------------------*/

FUNCTION get_object_name(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number,
  part_id   in number default null,
  which     in varchar2,
  sep       in varchar2 default DEFAULT_SEPARATOR
) RETURN VARCHAR2;

/*-------------------------- get_object_prefix ------------------------------*/

FUNCTION get_object_prefix(
  idx_owner in varchar2,
  idx_name  in varchar2,
  part_id   in number default null,
  sep       in varchar2 default DEFAULT_SEPARATOR
) RETURN VARCHAR2;

/*---------------------- swap_index_temp_tables -----------------------*/
PROCEDURE swap_index_temp_tables (
  idx_owner  in varchar2,
  idx_name   in varchar2,
  idxid      in number,
  idx_pid    in number,
  temp_owner in varchar2,
  temp_name  in varchar2,
  shadow_idxid in number default NULL,
  shadow_ixpid in number default NULL
);

/*----------------------- populate_ptable -----------------------------------*/

PROCEDURE populate_ptable(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number,
  part_id   in number default NULL,
  shadow    in boolean default FALSE,
  ctxcat    in boolean default FALSE
);

/*----------------------- AlterDollarITType --------------------------------*/

PROCEDURE AlterDollarITType(
  idx in dr_def.idx_rec
);

PROCEDURE AdjustTType(
  idx    in dr_def.idx_rec,
  shad_i in varchar2
);

FUNCTION get_create_sn_sql(
  obj_name in varchar2,
  x_part   in boolean default FALSE
) RETURN VARCHAR2;

FUNCTION get_create_snidx_sql(
  base_obj_name in varchar2,
  obj_name in varchar2,
  x_part   in boolean default FALSE
) return varchar2;
end drvxtab;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVXTABC" authid current_user as

/* ====================================================================== */
/* ====================================================================== */
/*                              CTXCAT                                    */
/* ====================================================================== */
/* ====================================================================== */

/*----------------------- create_tables -----------------------------*/

PROCEDURE create_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number
);

/*----------------------- create_indexes  ---------------------------*/

PROCEDURE create_indexes(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number
);

/*----------------------- drop_tables  ---------------------------*/

PROCEDURE drop_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number,
  has_p     in boolean default null
);

/*----------------------- trunc_tables  ---------------------------*/

PROCEDURE trunc_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number
);

/*----------------------- rename_tables  ---------------------------*/

PROCEDURE rename_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number,
  new_name  in varchar2,
  has_idx   in boolean
);

/*----------------------- post_transport  ---------------------------*/

PROCEDURE post_transport(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number
);

/*----------------------- recreate_trigger  ---------------------------*/

PROCEDURE recreate_trigger(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number
);

end drvxtabc;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVXTABR" authid current_user as

/* ====================================================================== */
/* ====================================================================== */
/*                             CTXRULE                                    */
/* ====================================================================== */
/* ====================================================================== */

/*----------------------- create_tables --------------------------*/

PROCEDURE create_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number
);

/*----------------------- create_indexes  ------------------------*/

PROCEDURE create_indexes(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number
);

/*----------------------- drop_tables  ---------------------------*/

PROCEDURE drop_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number
);

/*----------------------- trunc_tables  ---------------------------*/

PROCEDURE trunc_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number
);

/*----------------------- rename_tables  ---------------------------*/

PROCEDURE rename_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number,
  new_name  in varchar2,
  has_idx   in boolean
);

end drvxtabr;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVXTABX" authid current_user as

/*----------------------- create_tables --------------------------*/

PROCEDURE create_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number
);

/*----------------------- create_indexes  ------------------------*/

PROCEDURE create_indexes(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number
);

/*----------------------- drop_tables  ---------------------------*/

PROCEDURE drop_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number
);

/*----------------------- trunc_tables  ---------------------------*/

PROCEDURE trunc_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number
);

/*----------------------- rename_tables  ---------------------------*/

PROCEDURE rename_tables(
  idx_owner in varchar2,
  idx_name  in varchar2,
  idxid     in number,
  new_name  in varchar2,
  has_idx   in boolean
);

end drvxtabx;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVRIO" authid current_user as

  swap_shadow_error  EXCEPTION;

/*---------------------- create_shadow_online ----------------------------*/
procedure create_shadow_index(
  ia          sys.ODCIIndexInfo,
  idx         dr_def.idx_rec,
  idxmem      in  number,
  para        in  number,
  langcol     in  varchar2,
  fmtcol      in  varchar2,
  csetcol     in  varchar2,
  datastore   in  varchar2,
  filter      in  varchar2,
  section     in  varchar2,
  lexer       in  varchar2,
  wordlist    in  varchar2,
  stoplist    in  varchar2,
  storage     in  varchar2,
  txntional   in  varchar2,
  sync_type   in  varchar2,
  sync_memory     in   varchar2,
  sync_paradegree in   number,
  sync_interval   in   varchar2,
  populate        in   boolean,
  configcol   in  varchar2
);

procedure create_shadow_partsMD(
  idx          dr_def.idx_rec,
  idxid_shadow number
);

/*------------------------exchange_shadow_index---------------------------*/
procedure exchange_shadow_index(
  idx        dr_def.idx_rec
);

/*------------------------swap_shadow ------------------------------------*/
procedure swap_shadow(
  ia    sys.ODCIIndexInfo,
  idx   dr_def.idx_rec,
  ispart boolean
);

/*---------------------- part_recreate_online ----------------------------*/
procedure create_shadow_part(
  ia          sys.ODCIIndexInfo,
  idx         dr_def.idx_rec,
  ixp         dr_def.ixp_rec,
  idxmem      number,
  storage     varchar2,
  para        number,
  sync_type   varchar2,
  sync_memory varchar2,
  sync_paradegree number,
  sync_interval varchar2,
  online        boolean,
  metadataonly  boolean,
  populate      boolean
);

/*------------------------ exchange_shadow_part --------------------------*/
procedure exchange_shadow_part(
  idx           dr_def.idx_rec,
  ixp           dr_def.ixp_rec
);


end drvrio;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVLSB" authid current_user as

/* value of maxtime_unlimited should be same as that present in dr0ddl */
MAXTIME_UNLIMITED               constant number := 2147483647;

/* global values copied from dr0ddl.pkh */
LOCK_WAIT         constant number := 0;
LOCK_NOWAIT       constant number := 1;
LOCK_NOWAIT_ERROR constant number := 2;

/*------------------------- create_preference_c ---------------------------*/
procedure create_preference_c(
  preference_name  in varchar2,
  object_name      in varchar2,
  preference_implicit_commit in boolean);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_preference_c, AUTO_WITH_COMMIT);

/*------------------------- create_preference_nc --------------------------*/
procedure create_preference_nc(
  preference_name  in varchar2,
  object_name      in varchar2,
  preference_implicit_commit in boolean);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_preference_nc, AUTO);

/*-------------------------- drop_preference_c ---------------------------*/
procedure drop_preference_c(
  preference_name  in varchar2,
  preference_implicit_commit in boolean);
PRAGMA SUPPLEMENTAL_LOG_DATA(drop_preference_c, AUTO_WITH_COMMIT);

/*-------------------------- drop_preference_nc ---------------------------*/
procedure drop_preference_nc(
  preference_name  in varchar2,
  preference_implicit_commit in boolean);
PRAGMA SUPPLEMENTAL_LOG_DATA(drop_preference_nc, AUTO);

/*---------------------------- set_attribute ----------------------------*/
procedure set_attribute_c(
  preference_name         in varchar2,
  attribute_name          in varchar2,
  attribute_value         in varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(set_attribute_c, AUTO_WITH_COMMIT);

procedure set_attribute_nc(
  preference_name         in varchar2,
  attribute_name          in varchar2,
  attribute_value         in varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(set_attribute_nc, AUTO);

/*-------------------------- unset_attribute ----------------------------*/
procedure unset_attribute_c(
  preference_name in  varchar2,
  attribute_name  in  varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(unset_attribute_c, AUTO_WITH_COMMIT);

procedure unset_attribute_nc(
  preference_name in  varchar2,
  attribute_name  in  varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(unset_attribute_nc, AUTO);

/*-------------------- create_section_group  ---------------------------*/
PROCEDURE create_section_group_c(
  group_name     in    varchar2
, group_type     in    varchar2
, preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_section_group_c, AUTO_WITH_COMMIT);

PROCEDURE create_section_group_nc(
  group_name     in    varchar2
, group_type     in    varchar2
, preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_section_group_nc, AUTO);

/*-------------------- drop_section_group  ---------------------------*/
PROCEDURE drop_section_group_c(
  group_name     in    varchar2
, preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(drop_section_group_c, AUTO_WITH_COMMIT);

PROCEDURE drop_section_group_nc(
  group_name     in    varchar2
, preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(drop_section_group_nc, AUTO);

/*-------------------- add_zone_section  ---------------------------*/
PROCEDURE add_zone_section_c(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_zone_section_c, AUTO_WITH_COMMIT);

PROCEDURE add_zone_section_nc(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_zone_section_nc, AUTO);

/*-------------------- add_field_section  -------------------------*/
PROCEDURE add_field_section_c(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2,
  visible        in    boolean default FALSE,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_field_section_c, AUTO_WITH_COMMIT);

PROCEDURE add_field_section_nc(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2,
  visible        in    boolean default FALSE,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_field_section_nc, AUTO);

/*-------------------- add_special_section  -------------------------*/
PROCEDURE add_special_section_c(
  group_name     in    varchar2,
  section_name   in    varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_special_section_c, AUTO_WITH_COMMIT);

PROCEDURE add_special_section_nc(
  group_name     in    varchar2,
  section_name   in    varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_special_section_nc, AUTO);

/*-------------------- add_stop_section  -----------------------------*/
PROCEDURE add_stop_section_c(
  group_name     in    varchar2
, tag            in    varchar2
, preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_stop_section_c, AUTO_WITH_COMMIT);

PROCEDURE add_stop_section_nc(
  group_name     in    varchar2
, tag            in    varchar2
, preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_stop_section_nc, AUTO);

/*-------------------- add_attr_section  -----------------------------*/
PROCEDURE add_attr_section_c(
  group_name     in    varchar2
, section_name   in    varchar2
, tag            in    varchar2
, preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_attr_section_c, AUTO_WITH_COMMIT);

PROCEDURE add_attr_section_nc(
  group_name     in    varchar2
, section_name   in    varchar2
, tag            in    varchar2
, preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_attr_section_nc, AUTO);

/*-------------------- add_xml_section  -----------------------------*/
PROCEDURE add_xml_section_c(
  group_name     in    varchar2
, tag            in    varchar2
, preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_xml_section_c, AUTO_WITH_COMMIT);

PROCEDURE add_xml_section_nc(
  group_name     in    varchar2
, tag            in    varchar2
, preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_xml_section_nc, AUTO);

/*-------------------- add_mdata_section  -----------------------------*/
PROCEDURE add_mdata_section_c(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2,
  read_only      in    boolean default FALSE,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_mdata_section_c, AUTO_WITH_COMMIT);

PROCEDURE add_mdata_section_nc(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2,
  read_only      in    boolean default FALSE,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_mdata_section_nc, AUTO);

/*-------------------- add_ndata_section  -----------------------------*/
PROCEDURE add_ndata_section_c(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_ndata_section_c, AUTO_WITH_COMMIT);

PROCEDURE add_ndata_section_nc(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_ndata_section_nc, AUTO);

/*-------------------- add_mvdata_section  -----------------------------*/
PROCEDURE add_mvdata_section_c(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2,
  datatype       in    varchar2 default NULL,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_mvdata_section_c, AUTO_WITH_COMMIT);

PROCEDURE add_mvdata_section_nc(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2,
  datatype       in    varchar2 default NULL,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_mvdata_section_nc, AUTO);

/*-------------------- add_sdata_section  -----------------------------*/
PROCEDURE add_sdata_section_c(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2,
  datatype       in    varchar2 default NULL,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_sdata_section_c, AUTO_WITH_COMMIT);

PROCEDURE add_sdata_section_nc(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2,
  datatype       in    varchar2 default NULL,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_sdata_section_nc, AUTO);

/*-------------------- add_sdata_column  -----------------------------*/

PROCEDURE add_sdata_column_c(
  group_name     in    varchar2,
  section_name   in    varchar2,
  column_name    in    varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_sdata_column_c, AUTO_WITH_COMMIT);

PROCEDURE add_sdata_column_nc(
  group_name     in    varchar2,
  section_name   in    varchar2,
  column_name    in    varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_sdata_column_nc, AUTO);

PROCEDURE add_mdata_column_c(
  group_name     in    varchar2,
  section_name   in    varchar2,
  column_name    in    varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_mdata_column_c, AUTO_WITH_COMMIT);

PROCEDURE add_mdata_column_nc(
  group_name     in    varchar2,
  section_name   in    varchar2,
  column_name    in    varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_mdata_column_nc, AUTO);

/*-------------------- remove_section ---------------------------*/

PROCEDURE remove_section_c(
  group_name    in    varchar2,
  section_name  in    varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_section_c, AUTO_WITH_COMMIT);

PROCEDURE remove_section_nc(
  group_name    in    varchar2,
  section_name  in    varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_section_nc, AUTO);

PROCEDURE remove_section_c(
  group_name     in    varchar2,
  section_id     in    number,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_section_c, AUTO_WITH_COMMIT);

PROCEDURE remove_section_nc(
  group_name     in    varchar2,
  section_id     in    number,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_section_nc, AUTO);

/*-------------------- create_stoplist --------------------------*/

PROCEDURE create_stoplist_c(
  stoplist_name  in   varchar2,
  stoplist_type  in   varchar2 default 'BASIC_STOPLIST',
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_stoplist_c, AUTO_WITH_COMMIT);

PROCEDURE create_stoplist_nc(
  stoplist_name  in   varchar2,
  stoplist_type  in   varchar2 default 'BASIC_STOPLIST',
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_stoplist_nc, AUTO);

/*-------------------- drop_stoplist --------------------------*/

PROCEDURE drop_stoplist_c(
  stoplist_name  in   varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(drop_stoplist_c, AUTO_WITH_COMMIT);

PROCEDURE drop_stoplist_nc(
  stoplist_name  in   varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(drop_stoplist_nc, AUTO);

/*-------------------- add_stopword --------------------------*/

PROCEDURE add_stopword_c(
  stoplist_name  in   varchar2,
  stopword       in   varchar2,
  language       in   varchar2 default NULL,
  language_dependent in boolean default TRUE,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_stopword_c, AUTO_WITH_COMMIT);

PROCEDURE add_stopword_nc(
  stoplist_name  in   varchar2,
  stopword       in   varchar2,
  language       in   varchar2 default NULL,
  language_dependent in boolean default TRUE,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_stopword_nc, AUTO);

/*-------------------- add_stoptheme --------------------------*/

PROCEDURE add_stoptheme_c(
  stoplist_name  in   varchar2,
  stoptheme      in   varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_stoptheme_c, AUTO_WITH_COMMIT);

PROCEDURE add_stoptheme_nc(
  stoplist_name  in   varchar2,
  stoptheme      in   varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_stoptheme_nc, AUTO);

/*-------------------- add_stopclass --------------------------*/

PROCEDURE add_stopclass_c(
  stoplist_name  in   varchar2,
  stopclass      in   varchar2,
  stoppattern    in   varchar2 default NULL,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_stopclass_c, AUTO_WITH_COMMIT);

PROCEDURE add_stopclass_nc(
  stoplist_name  in   varchar2,
  stopclass      in   varchar2,
  stoppattern    in   varchar2 default NULL,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_stopclass_nc, AUTO);

/*-------------------- add_index ---------------------------*/

PROCEDURE add_index_c(
  set_name       in    varchar2,
  column_list    in    varchar2,
  storage_clause in    varchar2 default null,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_index_c, AUTO_WITH_COMMIT);

PROCEDURE add_index_nc(
  set_name       in    varchar2,
  column_list    in    varchar2,
  storage_clause in    varchar2 default null,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_index_nc, AUTO);

/*-------------------- create_index_set ---------------------------*/

PROCEDURE create_index_set_c(
  set_name     in    varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_index_set_c, AUTO_WITH_COMMIT);

PROCEDURE create_index_set_nc(
  set_name     in    varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_index_set_nc, AUTO);

/*-------------------- remove_index ---------------------------*/
PROCEDURE remove_index_c(
  set_name       in    varchar2,
  column_list    in    varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_index_c, AUTO_WITH_COMMIT);

PROCEDURE remove_index_nc(
  set_name       in    varchar2,
  column_list    in    varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_index_nc, AUTO);

/*-------------------- add_sub_lexer ---------------------------*/

PROCEDURE add_sub_lexer_c(
  lexer_name     in   varchar2,
  language       in   varchar2,
  sub_lexer      in   varchar2,
  alt_value      in   varchar2 default NULL,
  language_dependent in boolean default TRUE,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_sub_lexer_c, AUTO_WITH_COMMIT);

PROCEDURE add_sub_lexer_nc(
  lexer_name     in   varchar2,
  language       in   varchar2,
  sub_lexer      in   varchar2,
  alt_value      in   varchar2 default NULL,
  language_dependent in boolean default TRUE,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_sub_lexer_nc, AUTO);

/*-------------------- remove_sub_lexer ---------------------------*/

PROCEDURE remove_sub_lexer_c(
  lexer_name     in   varchar2,
  language       in   varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_sub_lexer_c, AUTO_WITH_COMMIT);

PROCEDURE remove_sub_lexer_nc(
  lexer_name     in   varchar2,
  language       in   varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_sub_lexer_nc, AUTO);

/*-------------------- update_sub_lexer ---------------------------*/

PROCEDURE update_sub_lexer_c(
  lexer_name     in   varchar2,
  language       in   varchar2,
  sub_lexer      in   varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(update_sub_lexer_c, AUTO_WITH_COMMIT);

PROCEDURE update_sub_lexer_nc(
  lexer_name     in   varchar2,
  language       in   varchar2,
  sub_lexer      in   varchar2,
  preference_implicit_commit in boolean
);
PRAGMA SUPPLEMENTAL_LOG_DATA(update_sub_lexer_nc, AUTO);

/*-------------------- update_sub_lexer ---------------------------*/

procedure set_section_attribute_c(group_name      in varchar2,
                                  section_name    in varchar2,
                                  attribute_name  in varchar2,
                                  attribute_value in varchar2,
                                  preference_implicit_commit in boolean);
PRAGMA SUPPLEMENTAL_LOG_DATA(set_section_attribute_c, AUTO_WITH_COMMIT);

procedure set_section_attribute_nc(group_name      in varchar2,
                                  section_name    in varchar2,
                                  attribute_name  in varchar2,
                                  attribute_value in varchar2,
                                  preference_implicit_commit in boolean);
PRAGMA SUPPLEMENTAL_LOG_DATA(set_section_attribute_nc, AUTO);

/*-------------------------- unset_section_attribute -----------------------*/
procedure unset_section_attribute_c(group_name      in varchar2,
                                    section_name    in varchar2,
                                    attribute_name  in varchar2,
                                    preference_implicit_commit in boolean);
PRAGMA SUPPLEMENTAL_LOG_DATA(unset_section_attribute_c, AUTO_WITH_COMMIT);

procedure unset_section_attribute_nc(group_name      in varchar2,
                                    section_name    in varchar2,
                                    attribute_name  in varchar2,
                                    preference_implicit_commit in boolean);
PRAGMA SUPPLEMENTAL_LOG_DATA(unset_section_attribute_nc, AUTO);

/* hard procedures with rowid argument */

/*-------------------------- add_mdata ---------------------------*/
PROCEDURE add_mdata(
  idx_name        in  varchar2,
  section_name    in  varchar2,
  mdata_value     in  varchar2,
  mdata_pkencode  in  varchar2,
  part_name       in  varchar2  default null
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_mdata, AUTO);

PROCEDURE add_mdata(
  idx_name        in varchar2,
  section_name    in varchar2,
  mdata_values    in sys.odcivarchar2list,
  mdata_pkencodes in sys.odcivarchar2list,
  part_name     in varchar2  default null
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_mdata, AUTO);

/*-------------------------- remove_mdata ---------------------------*/
PROCEDURE remove_mdata(
  idx_name        in varchar2,
  section_name    in varchar2,
  mdata_value     in varchar2,
  mdata_pkencode  in varchar2,
  part_name       in varchar2  default null
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_mdata, AUTO);

PROCEDURE remove_mdata(
  idx_name        in varchar2,
  section_name    in varchar2,
  mdata_values    in sys.odcivarchar2list,
  mdata_pkencodes in sys.odcivarchar2list,
  part_name     in varchar2  default null
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_mdata, AUTO);

/*---------------------- insert_mvdata_values ------------------------------*/
PROCEDURE insert_mvdata_values(
   idx_name           in varchar2           default NULL,
   section_name       in varchar2           default NULL,
   mvdata_values      in sys.odcinumberlist,
   mvdata_pkencodes   in sys.odcivarchar2list,
   part_name          in varchar2           default NULL
);
PRAGMA SUPPLEMENTAL_LOG_DATA(insert_mvdata_values, AUTO);

/*---------------------- delete_mvdata_values ------------------------------*/
PROCEDURE delete_mvdata_values(
   idx_name           in varchar2           default NULL,
   section_name       in varchar2           default NULL,
   mvdata_values      in sys.odcinumberlist,
   mvdata_pkencodes   in sys.odcivarchar2list,
   part_name          in varchar2           default NULL
);
PRAGMA SUPPLEMENTAL_LOG_DATA(delete_mvdata_values, AUTO);

/*---------------------- add_sdata ------------------------------*/
PROCEDURE add_sdata(
  idx_name      in varchar2,
  section_name  in varchar2,
  sdata_value   in varchar2,
  sdata_pkencode in rowid,
  part_name     in  varchar2  default null
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_sdata, AUTO);

/*---------------------- delete_sdata ------------------------------*/
PROCEDURE remove_sdata(
  idx_name      in varchar2,
  section_name  in varchar2,
  sdata_value   in varchar2,
  sdata_pkencode in rowid,
  part_name     in varchar2  default null
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_sdata, AUTO);

/*---------------------- update_mvdata_set ------------------------------*/
PROCEDURE update_mvdata_set(
  idx_name        in varchar2           default NULL,
  section_name    in varchar2           default NULL,
  mvdata_values   in sys.odcinumberlist,
  mvdata_pkencodes in sys.odcivarchar2list,
  part_name       in varchar2           default NULL
);
PRAGMA SUPPLEMENTAL_LOG_DATA(update_mvdata_set, AUTO);

/*---------------------- update_sdata ------------------------------*/
PROCEDURE update_sdata(
  idx_name      in varchar2,
  section_name  in varchar2,
  sdata_value   in sys.anydata,
  sdata_pkencode in rowid,
  part_name     in varchar2 default NULL
);
PRAGMA SUPPLEMENTAL_LOG_DATA(update_sdata, AUTO);

/*--------------------------- populate_pending ----------------------------*/
PROCEDURE populate_pending(
  idx_name      in varchar2,
  part_name     in varchar2,
  rio           in boolean,
  idx_suffix    in varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(populate_pending, AUTO);

/*------------------------- recreate_index_online ------------------------*/
PROCEDURE recreate_index_online(
  idx_name         in varchar2,
  parameter_string in varchar2,
  parallel_degree  in number,
  partition_name   in varchar2,
  rio           in boolean,
  idx_suffix    in varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(recreate_index_online, AUTO);

/*----------------------- create_shadow_index ---------------------*/
PROCEDURE create_shadow_index(
  idx_name      in varchar2,
  parameter_string in varchar2,
  parallel_degree  in number,
  rio           in boolean,
  idx_suffix    in varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_shadow_index, AUTO);

/*----------------------- exchange_shadow_index ---------------------*/
PROCEDURE exchange_shadow_index(
  idx_name       in varchar2,
  partition_name in varchar2,
  rio           in boolean,
  idx_suffix    in varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(exchange_shadow_index, AUTO);

/*----------------------- drop_shadow_index ---------------------*/
procedure drop_shadow_index(
  idx_name   varchar2,
  rio           in boolean,
  idx_suffix    in varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(drop_shadow_index, AUTO);

/*--------------------------- sync_index ----------------------------*/
PROCEDURE sync_index(
  idx_name        in  varchar2,
  memory          in  varchar2,
  part_name       in  varchar2,
  parallel_degree in  number,
  maxtime         in  number,
  locking         in  number,
  direct_path     in  boolean,
  rio             in  boolean,
  idx_suffix      in  varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(sync_index, AUTO);

/*--------------------------- optimize_index ----------------------------*/
PROCEDURE optimize_index(
  idx_name   in  varchar2,
  optlevel   in  varchar2,
  maxtime    in  number,
  token      in  varchar2,
  part_name  in  varchar2,
  token_type in  number,
  parallel_degree in number,
  memory     in  varchar2,
  background in  boolean,
  rio             in  boolean,
  idx_suffix      in  varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(optimize_index, AUTO);

/*----------------------------- filter ----------------------------------*/
PROCEDURE filter (
  index_name     in varchar2,
  textkey        in varchar2,
  restab         in varchar2,
  query_id       in number    default 0,
  plaintext      in boolean   default FALSE,
  use_saved_copy in number
);
PRAGMA SUPPLEMENTAL_LOG_DATA(filter, AUTO);

/*----------------------------- gist -----------------------------------*/
PROCEDURE gist (
  index_name     in varchar2,
  textkey        in varchar2,
  restab         in varchar2,
  query_id       in number   default 0,
  glevel         in varchar2 default 'P',
  pov            in varchar2 default null,
  numParagraphs  in number   default null,
  maxPercent     in number   default null,
  num_themes     in number   default 50,
  use_saved_copy in number
);
PRAGMA SUPPLEMENTAL_LOG_DATA(gist, AUTO);

/*----------------------------- markup -----------------------------------*/
PROCEDURE markup (
  index_name     in varchar2,
  textkey        in varchar2,
  text_query     in varchar2,
  restab         in varchar2,
  query_id       in number    default 0,
  plaintext      in boolean   default FALSE,
  tagset         in varchar2  default 'TEXT_DEFAULT',
  starttag       in varchar2  default null,
  endtag         in varchar2  default null,
  prevtag        in varchar2  default null,
  nexttag        in varchar2  default null,
  use_saved_copy in number
);
PRAGMA SUPPLEMENTAL_LOG_DATA(markup, AUTO);

/*----------------------------- tokens -----------------------------------*/
PROCEDURE tokens (
  index_name     in varchar2,
  textkey        in varchar2,
  restab         in varchar2,
  query_id       in number default 0,
  use_saved_copy in number
);
PRAGMA SUPPLEMENTAL_LOG_DATA(tokens, AUTO);

/*----------------------------- themes -----------------------------------*/
PROCEDURE themes (
   index_name    in varchar2,
   textkey       in varchar2,
   restab        in varchar2,
   query_id      in number   default 0,
   full_themes   in boolean  default false,
   num_themes    in number   default 50,
   use_saved_copy in number,
   pv_reslob      in out nocopy clob
);
PRAGMA SUPPLEMENTAL_LOG_DATA(themes, AUTO);

/*----------------------------- highlight -----------------------------------*/
PROCEDURE highlight (
  index_name     in varchar2,
  textkey        in varchar2,
  text_query     in varchar2,
  restab         in varchar2,
  query_id       in number    default 0,
  plaintext      in boolean   default FALSE,
  use_saved_copy in number,
  pv_reslob     in out nocopy clob
);
PRAGMA SUPPLEMENTAL_LOG_DATA(highlight, AUTO);

/*--------------------------- markup_clob_query -----------------------------*/
PROCEDURE markup_clob_query (
  index_name       in varchar2,
  textkey          in varchar2,
  text_query       in clob,
  restab           in varchar2,
  query_id         in number    default 0,
  plaintext        in boolean   default FALSE,
  tagset           in varchar2  default 'TEXT_DEFAULT',
  starttag         in varchar2  default null,
  endtag           in varchar2  default null,
  prevtag          in varchar2  default null,
  nexttag          in varchar2  default null,
  use_saved_copy in number
);
PRAGMA SUPPLEMENTAL_LOG_DATA(markup_clob_query, AUTO);

/*------------------------- highlight_clob_query --------------------------*/
PROCEDURE highlight_clob_query (
  index_name       in varchar2,
  textkey          in varchar2,
  text_query       in clob,
  restab           in varchar2,
  query_id         in number    default 0,
  plaintext        in boolean   default FALSE,
  use_saved_copy in number,
  pv_reslob      in out nocopy clob
);
PRAGMA SUPPLEMENTAL_LOG_DATA(highlight_clob_query, AUTO);

/*----------------------- add_dictionary -----------------------*/
PROCEDURE add_dictionary_c(name                       in VARCHAR2,
                           language                   in VARCHAR2,
                           dictionary                 in CLOB,
                           preference_implicit_commit in boolean);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_dictionary_c, AUTO_WITH_COMMIT);

PROCEDURE add_dictionary_nc(name                       in VARCHAR2,
                            language                   in VARCHAR2,
                            dictionary                 in CLOB,
                            preference_implicit_commit in boolean);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_dictionary_nc, AUTO);

/*----------------------- drop_dictionary ----------------------*/
PROCEDURE drop_dictionary_c(name                       in VARCHAR2,
                            preference_implicit_commit in boolean);
PRAGMA SUPPLEMENTAL_LOG_DATA(drop_dictionary_c, AUTO_WITH_COMMIT);

PROCEDURE drop_dictionary_nc(name                       in VARCHAR2,
                             preference_implicit_commit in boolean);
PRAGMA SUPPLEMENTAL_LOG_DATA(drop_dictionary_nc, AUTO);

/*-------------------------- set_sec_grp_attr -------------------*/
procedure set_sec_grp_attr_c(group_name      in varchar2,
                             attribute_name  in varchar2,
                             attribute_value in varchar2);
PRAGMA SUPPLEMENTAL_LOG_DATA(set_sec_grp_attr_c, AUTO_WITH_COMMIT);

procedure set_sec_grp_attr_nc(group_name      in varchar2,
                              attribute_name  in varchar2,
                              attribute_value in varchar2);
PRAGMA SUPPLEMENTAL_LOG_DATA(set_sec_grp_attr_nc, AUTO);

/*---------------------- add_sec_grp_attr_val -------------------*/
procedure add_sec_grp_attr_val_c(group_name      in varchar2,
                                 attribute_name  in varchar2,
                                 attribute_value in varchar2);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_sec_grp_attr_val_c, AUTO_WITH_COMMIT);

procedure add_sec_grp_attr_val_nc(group_name      in varchar2,
                                  attribute_name  in varchar2,
                                  attribute_value in varchar2);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_sec_grp_attr_val_nc, AUTO);

/* helper functions */

/*------------------------- pk_exists --------------------------*/
FUNCTION pk_exists(
  idx_name   in varchar2
) return boolean;

/*------------------------- get_pkencode --------------------------*/
PROCEDURE get_pkencode(
  idx_name    in  varchar2,
  rid         in  rowid,
  pk_encode   in out varchar2
);

end drvlsb;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRV0DDL" authid current_user is

   function generate_substrings(c sys_refcursor)
   return dr$substring_set
   pipelined;

   function generate_substrings2(c sys_refcursor)
   return dr$substring_set2
   pipelined;

end drv0ddl;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRVANL" authid current_user as

PROCEDURE ADD_DICTIONARY(name     in VARCHAR2,
                         language in VARCHAR2,
                         dictionary  in CLOB,
                         preference_implicit_commit in boolean);

PROCEDURE DROP_DICTIONARY(name in VARCHAR2,
                          preference_implicit_commit in boolean);

PROCEDURE COPY_USER_ANL_DICT(p_idx_id in NUMBER,
                             lv_pref  in dr_def.pref_rec);

PROCEDURE REM_USER_ANL_DICT(p_idxid in NUMBER);

end drvanl;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."CTX_ADM" as

/*------------------------------- shutdown ----------------------------------*/
/*
  NAME
   shutdown

  DESCRIPTION
   this call is obsolete.  It exists simply to avoid invalidating
   obsolete customer code which may call it.
*/

procedure shutdown(
name in varchar2 default 'ALL',
sdmode in number default NULL
);

/*------------------------- recover ----------------------------*/
/*
  NAME
   recover
  DESCRIPTION
   Recover data dictionary
  ARGUMENTS
*/
procedure recover;
PRAGMA SUPPLEMENTAL_LOG_DATA(recover, AUTO);

/*------------------------- set_parameter ----------------------------*/
/*
  NAME
   set_parameter

  DESCRIPTION
   Set a system parameter

  ARGUMENTS
   param name
   param value

*/
procedure set_parameter(param_name in varchar2, param_value in varchar2);
PRAGMA SUPPLEMENTAL_LOG_DATA(set_parameter, AUTO);

/*------------------------- test_extproc ----------------------------*/
/*
  NAME
   test_extproc

  DESCRIPTION
   test extproc invocation

  NOTES
   If this procedure succeeds, extproc can be invoked

*/
procedure test_extproc;

/*------------------------- mark_failed ----------------------------*/
/*
  NAME
   mark_failed

  DESCRIPTION
   mark the index status from INPROGRESS to FAILURE so that
   alter index can run.

  NOTES
   this procedure is not published
*/

procedure mark_failed(owner_name in varchar2, index_name in varchar2);
PRAGMA SUPPLEMENTAL_LOG_DATA(mark_failed, AUTO);

/*------------------------ drop_user_objects ---------------------------*/
/*
  NAME
   drop_user_objects

  DESCRIPTION
   Drops all of the text objects (preferences, etc.) for the given user.  If
   the user does not exist or there are no objects, no errors are raised.

  NOTES
   This is called during a database DROP USER operation.
*/
procedure drop_user_objects(user_name in varchar2);

/*--------------------------- reset_auto_optimize_status -------------------*/
/* reset the autoopt_status table */
procedure reset_auto_optimize_status;

/*--------------------------- stop_optimize --------------------------------*/
/* stop an optimize for an index / partition */
procedure stop_optimize(owner_name in varchar2,
                        index_name in varchar2,
                        partition_name in varchar2 default null);

end CTX_ADM;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."CTX_DDL" authid current_user as

  OPTLEVEL_FAST                   constant varchar2(4)  := 'FAST';
  OPTLEVEL_FULL                   constant varchar2(4)  := 'FULL';
  OPTLEVEL_TOKEN                  constant varchar2(5)  := 'TOKEN';
  OPTLEVEL_TOKEN_TYPE             constant varchar2(10) := 'TOKEN_TYPE';
  OPTLEVEL_REBUILD                constant varchar2(7)  := 'REBUILD';
  OPTLEVEL_MERGE                  constant varchar2(5)  := 'MERGE';
  MAXTIME_UNLIMITED               constant number := 2147483647;


  LOCK_WAIT         constant number := 0;
  LOCK_NOWAIT       constant number := 1;
  LOCK_NOWAIT_ERROR constant number := 2;

TYPE split_rec is RECORD(
new_sec varchar2(64) default NULL,
idval varchar2(100) default NULL
);

TYPE sec_rec is RECORD(
secname varchar2(500) default NULL,
sectag  varchar2(500) default NULL
);

TYPE split_tab is table of split_rec index by binary_integer;
TYPE sec_tab is table of sec_rec index by binary_integer;

-- bug 9442793: flag for implicit commit
preference_implicit_commit boolean := TRUE;

  --
  -- Public procedure prototypes
  --


/*---------------------------- create_preference ----------------------------*/
/*
  NAME
    create_preference
  DESCRIPTION
    A preference is created to customized a tile (framework object).

    A preference references a framework object. It describes how a referenced
    object is to be customized.

    This procedure validates the preference attribute settings and raise
    an exveption if incorrect attribute settings are found.

  ARGUMENTS
    preference_name -  preference name, this is structured as
                       [OWNER.]PREFERENCE_NAME
    object_name     - object name
  NOTES
    a) this procedure clears out the list of attributes created (by
       calling the set_attribute()) prior to calling this procedure.
  EXCEPTIONS

  RETURNS
    none
*/
procedure create_preference(
  preference_name  in varchar2,
  object_name      in varchar2);

/*---------------------------- drop_preference ----------------------------*/
/*
  NAME
    drop_preference
  DESCRIPTION
    delete the preference specified in 'name' from TexTile dictionary.
    This procedure will raise an exception if the preference is referenced
    in any policy.
  ARGUMENTS
    name    - preference name
  NOTES
    NONE
  EXCEPTIONS

*/
procedure drop_preference(preference_name  in varchar2 );

/*---------------------------- set_attribute ----------------------------*/
/*
  NAME
    set_attribute
  DESCRIPTION
    add an item into the  attribute name/value buffer for preference creation.
    The caller calls this  procedure to set value for a named preference
    attribute.
    the create_preference() procedure make used of all values set by this
    procedure when creating the preference. The attribute name/value  buffer
    is cleaned up once the preference is created.

  ARGUMENTS
    name     - preference attribute name
    value    - the attribute value
  NOTES

  EXCEPTIONS

*/
procedure set_attribute(preference_name in varchar2,
                        attribute_name  in varchar2,
                        attribute_value in varchar2);

/*-------------------------- unset_attribute ----------------------------*/

procedure unset_attribute(preference_name in varchar2,
                        attribute_name  in varchar2);

/*---------------------------- set_section_attribute -----------------------*/
/*
  NAME
    set_section_attribute
  DESCRIPTION
    add a section specific attribute
  ARGUMENTS
    group_name      - section group name
    section_name    - section name
    attribute_name  - section attribute name
    attribute_value - section attribute value
  NOTES

  EXCEPTIONS

*/
procedure set_section_attribute(group_name      in varchar2,
                                section_name    in varchar2,
                                attribute_name  in varchar2,
                                attribute_value in varchar2);

/*-------------------------- unset_section_attribute -----------------------*/

procedure unset_section_attribute(group_name      in varchar2,
                                  section_name    in varchar2,
                                  attribute_name  in varchar2);

/*-------------------- create_section_group  ---------------------------*/
/*
  NAME
    create_section_group

  DESCRIPTION
    create a new section group.

    * section group name is unique within an owner.
    * Only CTXAPP and CTXADMIN users can create a section group.

  ARGUMENTS
    group_name  - section group name , [user.]section_group_name
    group_type  - section group type ( from ctx_classes )
  NOTES

  EXCEPTIONS

*/
PROCEDURE create_section_group(
  group_name     in    varchar2
, group_type     in    varchar2
);

/*-------------------- drop_section_group  ---------------------------*/
/*
  NAME
    drop_section_group

  DESCRIPTION
    drop a new group.  Only CTXAPP and CTXADMIN can drop a section
    group, moreover, they can only drop their own section group.

  ARGUMENTS
    group_name  -  section group name, [user.]section_group_name

  NOTES

  EXCEPTIONS

*/
PROCEDURE drop_section_group(
  group_name     in    varchar2
);

/*-------------------------- set_sec_grp_attr --------------------*/
/*
  NAME
    set_sec_grp_attr
  DESCRIPTION
    add a section group attribute (if it does not exist) and set its value.
    raise error if section group attribute exists already.

  ARGUMENTS
    group_name      - section group name
    attribute_name  - section group attribute name
    attribute_value - section group attribute value
  NOTES

  EXCEPTIONS

*/
procedure set_sec_grp_attr(group_name      in varchar2,
                           attribute_name  in varchar2,
                           attribute_value in varchar2);
PRAGMA SUPPLEMENTAL_LOG_DATA(set_sec_grp_attr, AUTO);

/*-------------------------- add_sec_grp_attr_val --------------------*/
/*
  NAME
    add_sec_grp_attr_val
  DESCRIPTION
    add a section group attribute value to the list of values of an already
    existing section group attribute. This API must be called after
    set_sec_grp_attr. There is no need to call this API for section group
    attributes that are single valued, since a single call to
    set_sec_grp_attr will suffice for this case.

  ARGUMENTS
    group_name      - section group name
    attribute_name  - section group attribute name
    attribute_value - section group attribute value
  NOTES

  EXCEPTIONS

*/
procedure add_sec_grp_attr_val(group_name      in varchar2,
                               attribute_name  in varchar2,
                               attribute_value in varchar2);

/*-------------------------- rem_sec_grp_attr_val --------------------*/
/*
  NAME
    rem_sec_grp_attr_val
  DESCRIPTION
    remove a specific section group attribute value from the list of values
    of an existing section group attribute. This API cannot be called to
    remove the last value in the list of values of a section group attribute.
    To remove the last value, call unset_sec_grp_attr. Note that both the
    section group attribute name and the specific section group attribute
    value to be removed must be specified as arguments.

  ARGUMENTS
    group_name      - section group name
    attribute_name  - section group attribute name
    attribute_value - section group attribute value
  NOTES

  EXCEPTIONS

*/
procedure rem_sec_grp_attr_val(group_name      in varchar2,
                               attribute_name  in varchar2,
                               attribute_value in varchar2);

/*----------------------- unset_sec_grp_attr ---------------------*/
/*
  NAME
    unset_sec_grp_attr
  DESCRIPTION
    remove a section group attribute (and its list of values)
  ARGUMENTS
    group_name      - section group name
    attribute_name  - section group attribute name
  NOTES

  EXCEPTIONS

*/

procedure unset_sec_grp_attr(group_name      in varchar2,
                             attribute_name  in varchar2);
PRAGMA SUPPLEMENTAL_LOG_DATA(unset_sec_grp_attr, AUTO);

/*-------------------- add_zone_section  ---------------------------*/
/*
  NAME
    add_zone_section

  DESCRIPTION
    add a new section.

    * tag is unique within a section group

    * section names are not unique within a section group.  this allows
      defining multiple patterns for the same logical section, makeing the
      details transparent to searches.

    * no field and zone section name within a section group should be the same
  ARGUMENTS
    group_name   - section group name, [user.]section_group_name
    section_name - section name
    tag          - the pattern which marks the start of a section

  NOTES

  EXCEPTIONS

*/
PROCEDURE add_zone_section(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2
);


/*-------------------- add_field_section  -------------------------*/
/*
  NAME
    add_field_section

  DESCRIPTION
    add a new field section.

    * tag is unique within a section group

    * at most 16 unique field sections with a section group

    * no field and zone section name within a section group should be the same
  ARGUMENTS
    group_name   - section group name, [user.]section_group_name
    section_name - section name
    tag          - the pattern which marks the start of a section

  NOTES

  EXCEPTIONS

*/
PROCEDURE add_field_section(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2,
  visible        in    boolean default FALSE
);

/*-------------------- add_special_section  ---------------------------*/
/*
  NAME
    add_special_section

  DESCRIPTION
    add a special section to the group
    special sections are not detected by tags.  Instead, they are
    detected automatically in the document text.

  ARGUMENTS
    group_name   - section group name, [user.]section_group_name
    section_name - the special section to add

  NOTES
    The following are valid special sections:

    for all types:
      SENTENCE
      PARAGRAPH

  EXCEPTIONS

*/
PROCEDURE add_special_section(
  group_name     in    varchar2
, section_name   in    varchar2
);

/*-------------------- add_stop_section  -----------------------------*/
/*
  NAME
    add_stop_section

  DESCRIPTION
    add a stop section to the group
    stop sections can be added only to the auto sectioner.  They denote
    those tags which should not be indexed.

  ARGUMENTS
    group_name   - section group name, [user.]section_group_name
    tag          - the tag to stop

  NOTES

  EXCEPTIONS

*/
PROCEDURE add_stop_section(
  group_name     in    varchar2
, tag            in    varchar2
);

/*-------------------- add_attr_section  -----------------------------*/
/*
  NAME
    add_attr_section

  DESCRIPTION
    add an attribute section to the group
    attr sections can be added only to the xml sectioner.
    They denote attributes whose text should be indexed

  ARGUMENTS
    group_name   - section group name, [user.]section_group_name
    section_name - section name
    tag          - the tag to index -- MUST be in form TAG@ATTR

  NOTES

  EXCEPTIONS

*/
PROCEDURE add_attr_section(
  group_name     in    varchar2
, section_name   in    varchar2
, tag            in    varchar2
);

/*-------------------- add_mdata_section  -------------------------*/
/*
  NAME
    add_mdata_section

  DESCRIPTION
    add a new mdata section.

    * tag is unique within a section group

    * at most 99 unique mdata sections with a section group

    * no section name unique within a section group

  ARGUMENTS
    group_name   - section group name, [user.]section_group_name
    section_name - section name
    tag          - the pattern which marks the start of a section
    read_only    - TRUE if calling remove_mdata() for this particlar
                   mdata section is allowed. The trade-off here is that
                   query will run a bit faster if this is set to FALSE.

  NOTES

  EXCEPTIONS

*/
PROCEDURE add_mdata_section(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2,
  read_only      in    boolean default FALSE
);

/*-------------------- add_ndata_section  -------------------------*/
/*
  NAME
    add_ndata_section

  DESCRIPTION
    add a new ndata section.

    * tag is unique within a section group

    * at most 99 unique ndata sections with a section group

    * no section name unique within a section group

  ARGUMENTS
    group_name   - section group name, [user.]section_group_name
    section_name - section name
    tag          - the pattern which marks the start of a section

  NOTES

  EXCEPTIONS

*/
PROCEDURE add_ndata_section(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2
);

/*-------------------- add_mvdata_section  -------------------------*/
/*
  NAME
    add_mvdata_section

  DESCRIPTION
    add a new mvdata section.

    * tag is unique within a section group

    * at most 100 unique mvdata sections with a section group

    * no section name unique within a section group

  ARGUMENTS
    group_name   - section group name, [user.]section_group_name
    section_name - section name
    tag          - the pattern which marks the start of a section
    datatype     - datatype of the section

  NOTES

  EXCEPTIONS

*/
PROCEDURE add_mvdata_section(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2,
  datatype       in    varchar2  default NULL
);

/*-------------------- add_sdata_section  -------------------------*/
/*
  NAME
    add_sdata_section

  DESCRIPTION
    add a new sdata section.

    * tag is unique within a section group

    * at most 99 unique sdata sections with a section group

    * no section name unique within a section group

  ARGUMENTS
    group_name   - section group name, [user.]section_group_name
    section_name - section name
    tag          - the pattern which marks the start of a section
    datatype     - datatype of the section

  NOTES

  EXCEPTIONS

*/
PROCEDURE add_sdata_section(
  group_name     in    varchar2,
  section_name   in    varchar2,
  tag            in    varchar2,
  datatype       in    varchar2  default NULL
);

/*-------------------- add_sdata_column  -------------------------*/
/*
  NAME
    add_sdata_column

  DESCRIPTION
    map the specified FILTER BY or ORDER BY column name to an SDATA
    section

  ARGUMENTS
    group_name   - section group name, [user.]section_group_name
    section_name - SDATA section name
    column_name  - column name.

  NOTES

  EXCEPTIONS

*/
PROCEDURE add_sdata_column(
  group_name     in    varchar2,
  section_name   in    varchar2,
  column_name    in    varchar2
);

/*-------------------- update_sdata  -----------------------------*/
/*
  NAME
    update_sdata

  DESCRIPTION
    update sdata section value

  ARGUMENTS
    idx_name     - index name
    section_name - SDATA section name
    sdata_value  - sdata value
    sdata_rowid  - rowid
    part_name    - partition name

  NOTES

  EXCEPTIONS
*/
PROCEDURE update_sdata(
  idx_name      in varchar2,
  section_name  in varchar2,
  sdata_value   in sys.anydata,
  sdata_rowid   in rowid,
  part_name     in varchar2 default NULL
);

/*-------------------- update_mvdata_set  -----------------------------*/
/*
  NAME
    update_mvdata_set

  DESCRIPTION
    update mvdata section values as a set at document level

  ARGUMENTS
    idx_name       - index name
    section_name   - MVDATA section name
    mvdata_values  - mvdata values
    mvdata_rowids  - rowids to be updated
    part_name      - partition name

  NOTES

  EXCEPTIONS
*/
PROCEDURE update_mvdata_set(
  idx_name        in varchar2    default NULL,
  section_name    in varchar2    default NULL,
  mvdata_values   in sys.odcinumberlist,
  mvdata_rowids   in sys.odciridlist,
  part_name       in varchar2    default NULL
);

/*-------------------- insert_mvdata_values  -----------------------------*/
/*
  NAME
    insert_mvdata_values

  DESCRIPTION
    insert mvdata section values in a list of documents

  ARGUMENTS
    idx_name      - index name
    section_name  - MVDATA section name
    mvdata_value  - mvdata values
    mvdata_rowid  - rowids to be updated
    part_name     - partition name

  NOTES

  EXCEPTIONS
*/
PROCEDURE insert_mvdata_values(
  idx_name        in varchar2    default NULL,
  section_name    in varchar2    default NULL,
  mvdata_values   in sys.odcinumberlist,
  mvdata_rowids   in sys.odciridlist,
  part_name       in varchar2    default NULL
);

/*-------------------- delete_mvdata_values  -----------------------------*/
/*
  NAME
    delete_mvdata_values

  DESCRIPTION
    delete mvdata section values

  ARGUMENTS
    idx_name       - index name
    section_name   - MVDATA section name
    mvdata_values  - mvdata values
    mvdata_rowids  - rowid to be updated
    part_name      - partition name

  NOTES

  EXCEPTIONS
*/
PROCEDURE delete_mvdata_values(
  idx_name        in varchar2    default NULL,
  section_name    in varchar2    default NULL,
  mvdata_values   in sys.odcinumberlist,
  mvdata_rowids   in sys.odciridlist,
  part_name       in varchar2    default NULL
);


/*-------------------- add_mdata_column  -------------------------*/
/*
  NAME
    add_mdata_column

  DESCRIPTION
    map the specified FILTER BY or ORDER BY column name to an MDATA
    section

  ARGUMENTS
    group_name   - section group name, [user.]section_group_name
    section_name - MDATA section name
    column_name  - column name.

  NOTES

  EXCEPTIONS

*/
PROCEDURE add_mdata_column(
  group_name     in    varchar2,
  section_name   in    varchar2,
  column_name    in    varchar2
);

/*-------------------- remove_section ---------------------------*/
/*
  NAME
    remove_section

  DESCRIPTION
    remove section/s from a section group.

    * delete all sections with sec_name in section group 'grp_name'.

    * Only CTXAPP and CTXADMIN can drop a section, moreover, they can
      only drop their own sections.

  ARGUMENTS
    group_name    -  section group name, [user.]section_group_name
    section_name  -  section name , [user.]section_name

  NOTES

  EXCEPTIONS

*/
PROCEDURE remove_section(
  group_name       in    varchar2,
  section_name     in    varchar2
);

/*-------------------- remove_section ---------------------------*/
/*
  NAME
    remove_section

  DESCRIPTION
    remove a section from a section group.

    * Only CTXAPP and CTXADMIN can drop a section, moreover, they can
      only drop their own sections.

  ARGUMENTS
    group_name  -  section group name, [user.]section_group_name
    section_id  -  section id, [user.]section_name

  NOTES

  EXCEPTIONS

*/
PROCEDURE remove_section(
  group_name     in    varchar2,
  section_id     in    number
);


/*-------------------- create_stoplist --------------------------*/
/*
  NAME
    create_stoplist

  DESCRIPTION
    create a new stoplist

  ARGUMENTS
    stoplist_name - name of the stoplist
    stoplist_type - type of stoplist

  NOTES

  EXCEPTIONS

*/
PROCEDURE create_stoplist(
  stoplist_name  in   varchar2,
  stoplist_type  in   varchar2 default 'BASIC_STOPLIST'
);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_stoplist, AUTO);

/*-------------------- drop_stoplist --------------------------*/
/*
  NAME
    drop_stoplist

  DESCRIPTION
    delete a stoplist

  ARGUMENTS
    stoplist_name -  name of the stoplist

  NOTES

  EXCEPTIONS

*/
PROCEDURE drop_stoplist(
  stoplist_name  in   varchar2
);

/*-------------------- add_stopword --------------------------*/
/*
  NAME
    add_stopword

  DESCRIPTION
    add a stopword to a stoplist

  ARGUMENTS
    stoplist_name -  name of the stoplist
    stopword      -  stopword to be added
    language      -  language of the stopword (for MULTI_STOPLIST only)
    language_dependent - language or user defined symbol

  NOTES

  EXCEPTIONS

*/
PROCEDURE add_stopword(
  stoplist_name  in   varchar2,
  stopword       in   varchar2,
  language       in   varchar2 default NULL,
  language_dependent in boolean default TRUE
);

/*-------------------- add_stoptheme --------------------------*/
/*
  NAME
    add_stoptheme

  DESCRIPTION
    add a stoptheme to a stoplist

  ARGUMENTS
    stoplist_name -  name of the stoplist
    stoptheme     -  stoptheme to be added

  NOTES

  EXCEPTIONS

*/
PROCEDURE add_stoptheme(
  stoplist_name  in   varchar2,
  stoptheme      in   varchar2
);

/*-------------------- add_stopclass --------------------------*/
/*
  NAME
    add_stopclass

  DESCRIPTION
    add a stopclass to a stoplist

  ARGUMENTS
    stoplist_name -  name of the stoplist
    stopclass     -  stopclass to be added

  NOTES
    currently only the stopclass NUMBERS is supported

*/
PROCEDURE add_stopclass(
  stoplist_name  in   varchar2,
  stopclass      in   varchar2,
  stoppattern    in   varchar2 default NULL
);

/*-------------------- remove_stopword --------------------------*/
/*
  NAME
    remove_stopword

  DESCRIPTION
    remove a stopword from a stoplist

  ARGUMENTS
    stoplist_name  -  name of the stoplist
    stopword       -  stopword to be removed
    language       -  language of the stopword (for MULTI_STOPLIST only)

  NOTES

  EXCEPTIONS

*/
PROCEDURE remove_stopword(
  stoplist_name  in   varchar2,
  stopword       in   varchar2,
  language       in   varchar2 default NULL
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_stopword, AUTO);

/*-------------------- remove_stoptheme --------------------------*/
/*
  NAME
    remove_stoptheme

  DESCRIPTION
    remove a stoptheme from a stoplist

  ARGUMENTS
    stoplist_name  -  name of the stoplist
    stoptheme       -  stoptheme to be removed

  NOTES

  EXCEPTIONS

*/
PROCEDURE remove_stoptheme(
  stoplist_name  in   varchar2,
  stoptheme       in   varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_stoptheme, AUTO);

/*-------------------- remove_stopclass --------------------------*/
/*
  NAME
    remove_stopclass

  DESCRIPTION
    remove a stopclass from a stoplist

  ARGUMENTS
    stoplist_name  -  name of the stoplist
    stopclass       -  stopclass to be removed

  NOTES

  EXCEPTIONS

*/
PROCEDURE remove_stopclass(
  stoplist_name  in   varchar2,
  stopclass       in   varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_stopclass, AUTO);

/*-------------------- add_sub_lexer ---------------------------*/
/*
  NAME
    add_sub_lexer

  DESCRIPTION
    add a sub lexer to a multi-lexer preference

  ARGUMENTS
    lexer_name     -  name of the multi-lingual lexer preference
    language       -  language of the sub-lexer
    sub_lexer      -  name of the sub-lexer preference for this language
    alt_value      -  alternate value for the language
    language_dependent - language or user defined symbol

  NOTES

  EXCEPTIONS

*/
PROCEDURE add_sub_lexer(
  lexer_name     in   varchar2,
  language       in   varchar2,
  sub_lexer      in   varchar2,
  alt_value      in   varchar2 default null,
  language_dependent in boolean default TRUE

);

/*-------------------- remove_sub_lexer ---------------------------*/
/*
  NAME
    remove_sub_lexer

  DESCRIPTION
    remove a sub lexer from a multi-lexer preference

  ARGUMENTS
    lexer_name     -  name of the multi-lingual lexer preference
    language       -  language of the sub-lexer

  NOTES

  EXCEPTIONS

*/
PROCEDURE remove_sub_lexer(
  lexer_name     in   varchar2,
  language       in   varchar2
);

/*-------------------- update_sub_lexer ---------------------------*/
/*
  NAME
    update_sub_lexer

  DESCRIPTION
    update a sub lexer in a multi-lexer preference

  ARGUMENTS
    lexer_name     -  name of the multi-lingual lexer preference
    language       -  language of the sub-lexer
    sub_lexer      -  name of the sub-lexer preference for this language

  NOTES

  EXCEPTIONS

*/
PROCEDURE update_sub_lexer(
  lexer_name     in   varchar2,
  language       in   varchar2,
  sub_lexer      in   varchar2
);

/*-------------------- sync_index --------------------------*/
/*
  NAME
    sync_index

  DESCRIPTION
    sync index

  ARGUMENTS
    idx_name         - index name
    memory           - index memory
    part_name        - index partition name
    parallel_degree  - parallel degree
    direct_path      - direct path loading

  NOTES

  EXCEPTIONS

*/
PROCEDURE sync_index(
  idx_name        in  varchar2 default NULL,
  memory          in  varchar2 default NULL,
  part_name       in  varchar2 default NULL,
  parallel_degree in  number   default 1,
  maxtime         in  number   default NULL,
  locking         in  number   default LOCK_WAIT,
  direct_path     in boolean   default false
);

/*-------------------- optimize_index --------------------------*/
/*
  NAME
    optimize_index

  DESCRIPTION
    optimize index

  ARGUMENTS
    idx_name  - index name
    optlevel  - optimization level -- FAST or FULL
    maxtime   - max optimization time, in minutes, for FULL optimize
    token     - text token string to optimize, for TOKEN optimize
                note token types 1, 2, 5, 7, and 8 are case-sensitive.
    part_name - index partition name
    token_type - for TOKEN optimize only, the type of the token to optimize
                 (default value: 0).  For name to type resolution, see
                 ctx_report.token_type
    parallel_degree - the degree of parallelism for this optimize.
                 NOTE: parallel optimize is supported ONLY for FULL
                 optimize, on CONTEXT indexes.  Any other conditions
                 will produce an error message.
    background - slow down in presence of sync_index or query
  NOTES

  EXCEPTIONS

*/
PROCEDURE optimize_index(
  idx_name   in  varchar2,
  optlevel   in  varchar2,
  maxtime    in  number    default null,
  token      in  varchar2  default null,
  part_name  in  varchar2  default null,
  token_type in  number    default null,
  parallel_degree in number default 1,
  memory     in  varchar2  default null,
  background in  boolean default FALSE
);

/*-------------------- split_dollari --------------------------*/
/*
  NAME
    split_dollari

  DESCRIPTION
    split the $I table

  ARGUMENTS
    idx_name     - index name
    part_name    - index partition name
    mapping_tab  - the name of the table that contains the mapping of rowids to
                   partition name that will contain the document from that row
    name_prefix  - the prefix used for naming the output $I tables.  The name
                   will be concatenation of name_prefix, '_', and part_name
                   if the part_name='NULL', the name_prefix will be the name
                   of the output table.
  NOTES

  EXCEPTIONS

*/
PROCEDURE split_dollari(
  idx_name    in  varchar2,
  part_name   in  varchar2,
  mapping_tab in  varchar2,
  name_prefix in  varchar2,
  tspace      in  varchar2 default null
);
PRAGMA SUPPLEMENTAL_LOG_DATA(split_dollari, AUTO);

/*-------------------- create_index_set  ---------------------------*/
/*
  NAME
    create_index_set

  DESCRIPTION
    create a new index set.

    * index set name is unique within an owner.
    * Only CTXAPP users and CTXSYS can create an index set.

  ARGUMENTS
    set_name  - index set name.  user.name syntax allowed.

  NOTES

  EXCEPTIONS

*/
PROCEDURE create_index_set(
  set_name     in    varchar2
);

/*------------------------------ add_index ---------------------------------*/
/*
  NAME
    add_index

  DESCRIPTION
    add a new index to an index set.

    * column list is unique within an index set

    * at most 100 indexes in an index set

  ARGUMENTS
    set_name       - index set name
    column_list    - column list for the index
    storage_clause - index storage clause

  NOTES

  EXCEPTIONS

*/
PROCEDURE add_index(
  set_name       in    varchar2,
  column_list    in    varchar2,
  storage_clause in    varchar2 default null
);

/*-------------------- remove_index ---------------------------*/
/*
  NAME
    remove_index

  DESCRIPTION
    remove index with the specified column list from an index set.

  ARGUMENTS
    set_name      -  index set name
    column_list   -  index column list

  NOTES

  EXCEPTIONS

*/
PROCEDURE remove_index(
  set_name       in    varchar2,
  column_list    in    varchar2
);

/*-------------------- drop_index_set  ---------------------------*/
/*
  NAME
    drop_index_set

  DESCRIPTION
    drop an index set.

  ARGUMENTS
    set_name  -  index set name

  NOTES

  EXCEPTIONS

*/
PROCEDURE drop_index_set(
  set_name     in    varchar2
);

/*-------------------- create_policy  ---------------------------*/
/*
  NAME
    create_policy

  DESCRIPTION
    create a policy.

  ARGUMENTS
    policy_name   - the name for the new policy
    filter        - the filter preference to use
    section_group - the section group to use
    lexer         - the lexer preference to use
    stoplist      - the stoplist preference to use
    wordlist      - the wordlist preference to use

  NOTES

  EXCEPTIONS

*/
PROCEDURE create_policy(
  policy_name   in varchar2,
  filter        in varchar2 default NULL,
  section_group in varchar2 default NULL,
  lexer         in varchar2 default NULL,
  stoplist      in varchar2 default NULL,
  wordlist      in varchar2 default NULL
);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_policy, AUTO);

/*-------------------- update_policy  ---------------------------*/
/*
  NAME
    update_policy

  DESCRIPTION
    update a policy.  Replaces the preferences of the policy.
    arguments left null will not be replaced.

  ARGUMENTS
    policy_name   - the name for the policy
    filter        - the new filter preference to use
    section_group - the new section group to use
    lexer         - the new lexer preference to use
    stoplist      - the new stoplist preference to use
    wordlist      - the new wordlist preference to use

  NOTES

  EXCEPTIONS

*/
PROCEDURE update_policy(
  policy_name   in varchar2,
  filter        in varchar2 default NULL,
  section_group in varchar2 default NULL,
  lexer         in varchar2 default NULL,
  stoplist      in varchar2 default NULL,
  wordlist      in varchar2 default NULL
);
PRAGMA SUPPLEMENTAL_LOG_DATA(update_policy, AUTO);

/*-------------------- copy_policy  ---------------------------*/
/*
  NAME
    copy_policy

  DESCRIPTION
    create a policy which is a metadata copy of an existing policy
    or index.

  ARGUMENTS
    source_policy  - the source policy
    policy_name    - the new policy

  NOTES
    currently the owner of the old and new policies must be the same
*/
PROCEDURE copy_policy(
  source_policy  in varchar2,
  policy_name    in varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(copy_policy, AUTO);

/*-------------------- drop_policy  ---------------------------*/
/*
  NAME
    drop_policy

  DESCRIPTION
    drop a policy.

  ARGUMENTS
    policy_name   - the name of the policy

  NOTES

  EXCEPTIONS

*/
PROCEDURE drop_policy(
  policy_name   in varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(drop_policy, AUTO);

/*-------------------- add_mdata  ---------------------------*/
/*
  NAME
    add_mdata

  DESCRIPTION
    add mdata values to existing documents
*/
PROCEDURE add_mdata(
  idx_name      in varchar2,
  section_name  in varchar2,
  mdata_value   in varchar2,
  mdata_rowid   in rowid,
  part_name     in varchar2  default null
);
PROCEDURE add_mdata(
  idx_name      in varchar2,
  section_name  in varchar2,
  mdata_values  in sys.odcivarchar2list,
  mdata_rowids  in sys.odciridlist,
  part_name     in varchar2  default null
);

/*-------------------- remove_mdata  ---------------------------*/
/*
  NAME
    remove_mdata

  DESCRIPTION
    remove mdata values from existing documents
*/
PROCEDURE remove_mdata(
  idx_name      in varchar2,
  section_name  in varchar2,
  mdata_value   in varchar2,
  mdata_rowid   in rowid,
  part_name     in varchar2  default null
);
PROCEDURE remove_mdata(
  idx_name      in varchar2,
  section_name  in varchar2,
  mdata_values  in sys.odcivarchar2list,
  mdata_rowids  in sys.odciridlist,
  part_name     in varchar2  default null
);

PROCEDURE replace_index_metadata(
  idx_name         in varchar2,
  parameter_string in varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(replace_index_metadata, AUTO);

/*-------------------- populate_pending  ---------------------------*/
/*
  NAME
    populate_pending

  DESCRIPTION
    loads the DML pending queue with all base table rowids
    intended to be used after a create index ... NOPOPULATE
*/
PROCEDURE populate_pending(
  idx_name      in varchar2,
  part_name     in varchar2  default null
);

PROCEDURE recreate_index_online(
  idx_name         in varchar2,
  parameter_string in varchar2 default null,
  parallel_degree  in number default 1,
  partition_name   in varchar2 default null
);

PROCEDURE create_shadow_index(
  idx_name      in varchar2,
  parameter_string in varchar2 default null,
  parallel_degree  in number default 1
);

PROCEDURE exchange_shadow_index(
  idx_name       in varchar2,
  partition_name in varchar2 default null
);

procedure drop_shadow_index(
  idx_name   varchar2
);

/*-------------------- split_zone_tokens ---------------------------*/
/*
  NAME
    split_zone_tokens

  DESCRIPTION
    To move contents of a zone section to one or more zone sections
*/

PROCEDURE split_zone_tokens(
  idx_name        in varchar2,
  part_name       in varchar2 default null,
  source_section  in varchar2,
  split_map       in split_tab
);

/*-------------------- zone_to_field  ---------------------------*/
/*
  NAME
    zone_to_field

  DESCRIPTION
    Migrate from zone to field sections
*/

PROCEDURE zone_to_field(
  idx_name        in varchar2,
  part_name       in varchar2 default null,
  lex_pref        in varchar2,
  storage_pref    in varchar2,
  attr_val_tab    in varchar2,
  zone_sec_list   in sec_tab,
  fld_sec_list    in sec_tab,
  memory          in varchar2 default '500M'
);
/* non scalar dt */

/*--------------------------- add_auto_optimize -------------------*/
procedure add_auto_optimize(
  idx_name in varchar2,
  part_name in varchar2 default null,
  optlevel in varchar2 default ctx_ddl.optlevel_merge
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_auto_optimize, AUTO);

/*--------------------------- remove_auto_optimize -------------------*/
procedure remove_auto_optimize(
  idx_name in varchar2,
  part_name in varchar2 default null
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_auto_optimize, AUTO);

/*-------------------------- alter_index ---------------------------------*/
procedure alter_index(
   idx_name   in varchar2,
   parameters in varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(alter_index, AUTO);

PROCEDURE add_sdata(
  idx_name      in varchar2,
  section_name  in varchar2,
  sdata_value   in varchar2,
  sdata_rowid   in rowid,
  part_name     in varchar2  default null
);

PROCEDURE remove_sdata(
  idx_name      in varchar2,
  section_name  in varchar2,
  sdata_value   in varchar2,
  sdata_rowid   in rowid,
  part_name     in varchar2  default null
);

/*--------------------------- repopulate_dollarn ---------------------------*/
/* repopulate_dollarn - repopulate $N as opposite of $K */
PROCEDURE repopulate_dollarn(
  idx_name in varchar2,
  part_name in varchar2 default null
);

END ctx_ddl;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."CTX_DOC" AUTHID current_user AS

-- constants

-- SAVE_COPY Constants
SAVE_COPY_FALLBACK constant number := 0; /* Fallback to datastore if document
                                            doesn't exist in $D*/
SAVE_COPY_ERROR    constant number := 1; /* Only use $D table for document
                                            fetching */
SAVE_COPY_IGNORE   constant number := 2; /* Ignore $D table and always fetch
                                            from datastore */

TYPE_ROWID       constant varchar2(20) := 'ROWID';
TYPE_PRIMARY_KEY constant varchar2(20) := 'PRIMARY_KEY';
UNLIMITED_THEMES constant number       := NULL;
/* Beehive: delimiter used in stemming */
STEM_DELIMITER   constant varchar2(2) := '!?';

-- package variables

pv_ctx_doc_key_type varchar2(500) := null;

-- type declaration

type theme_rec is record (
  theme  varchar2(2000),
  weight number
);
type theme_tab is table of theme_rec index by binary_integer;

type token_rec is record (
  token  varchar2(64),
  offset number,
  length number
);
type token_tab is table of token_rec index by binary_integer;

type highlight_rec is record (
  offset number,
  length number
);
type highlight_tab is table of highlight_rec index by binary_integer;

/* Beehive: Add record/table needed to return stems */
type stem_rec is record (
  stem          varchar2(1000),
  is_in_lexicon boolean
);
type stem_tab is table of stem_rec index by binary_integer;

type stem_group_rec is record (
  /* We made the size of word to be larger than the size used for tokens
   * as this might be a multi-word token
   */
  word           varchar2(1000),
  stems          stem_tab,
  offset         number,
  length         number
);
type stem_group_tab is table of stem_group_rec index by binary_integer;

/* Beehive: Add record/table needed to return noun phrases */
type noun_phrase_rec is record (
  term            varchar2(64),
  pos_tag         varchar2(64), /* TBD: Confirm with Inxight and reduce size */
  offset          number,
  length          number,
  is_phrase_start boolean,
  is_in_lexicon   boolean
);
type noun_phrase_tab is table of noun_phrase_rec index by binary_integer;

/* Beehive: Add record/table needed to return languages */
type language_rec is record (
  language        varchar2(64),
  score           number
);
type language_tab is table of language_rec index by binary_integer;

/* Beehive: Add record/table needed to return parts of speech */
type pos_tag_tab is table of varchar2(64) index by binary_integer;

type part_of_speech_rec is record (
  word            varchar2(64),
  pos_tags        pos_tag_tab,
  offset          number,
  length          number,
  is_in_lexicon   boolean
);
type part_of_speech_tab is table of part_of_speech_rec index by binary_integer;

/*---------------------------- set_key_type -----------------------------*/
/*
   NAME
     set_key_type - toggles CTX_DOC_KEY_TYPE

   DESCRIPTION
     toggles system parameter CTX_DOC_KEY_TYPE between ROWID and
     PRIMARY_KEY

   ARGUMENT
     key_type    -  value of CTX_DOC_KEY_TYPE
*/
PROCEDURE set_key_type(
  key_type   in   varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(set_key_type, AUTO);

/*---------------------------- get_key_type -----------------------------*/
/*
   NAME
     get_key_type - returns CTX_DOC_KEY_TYPE

*/
FUNCTION get_key_type return varchar2;

/*------------------------------- themes --------------------------------*/
/*
   NAME
     themes - request the themes for a document

   DESCRIPTION
     This procedure will generate the themes for a given document.
     The themes will be written to the theme table specified.
     The theme table must have the following columns:

       query_id        number         (the query_id)
       theme           varchar2(2000) (the theme)
       weight          number         (the theme weight)

   ARGUMENTS
     index_name               - the name of the text index
     textkey                  - the primary key of the document
     restab                   - the name of the theme table
     query_id                 - a query id
     full_themes              - should the full themes be displayed?
     num_themes               - maximum number of themes to return
     use_saved_copy           - Can be set to any of these values:
                                SAVE_COPY_FALLBACK / SAVE_COPY_ERROR /
                                SAVE_COPY_IGNORE
*/
PROCEDURE themes (
   index_name    in varchar2,
   textkey       in varchar2,
   restab        in varchar2,
   query_id      in number    default 0,
   full_themes   in boolean   default false,
   num_themes    in number    default 50,
   use_saved_copy in number    default ctx_doc.save_copy_fallback
);

/*------------------------------- themes --------------------------------*/
/*
   NAME
     themes - request the themes for a document

   DESCRIPTION
     This version of themes returns the results into a PL/SQL table
     instead of a result table

   NOTES
     Existing contents of restab will be destroyed
*/
PROCEDURE themes (
   index_name    in varchar2,
   textkey       in varchar2,
   restab        in out nocopy theme_tab,
   full_themes   in boolean   default false,
   num_themes    in number    default 50,
   use_saved_copy in number    default ctx_doc.save_copy_fallback
);

/*------------------------------ policy_themes ------------------------------*/
/*
   NAME
     policy_themes - request the themes for a document on demand

   DESCRIPTION
     This version of themes accepts a policy name and a single VARCHAR2
     document.  Returns the results into a PL/SQL table.

   NOTES
     Existing contents of restab will be destroyed
*/
PROCEDURE policy_themes (
   policy_name   in varchar2,
   document      in varchar2,
   restab        in out nocopy theme_tab,
   full_themes   in boolean    default false,
   num_themes    in number     default 50,
   language      in varchar2   default NULL,
   format        in varchar2   default NULL,
   charset       in varchar2   default NULL
);

/*------------------------------ policy_themes ------------------------------*/
/*
   NAME
     policy_themes - request the themes for a document on demand

   DESCRIPTION
     This version of themes accepts a policy name and a single CLOB
     document. Returns the results into a PL/SQL table.

   NOTES
     Existing contents of restab will be destroyed
*/
PROCEDURE policy_themes (
   policy_name   in varchar2,
   document      in clob,
   restab        in out nocopy theme_tab,
   full_themes   in boolean   default false,
   num_themes    in number    default 50,
   language      in varchar2  default NULL,
   format        in varchar2  default NULL,
   charset       in varchar2  default NULL
);

/*------------------------------ policy_themes ------------------------------*/
/*
   NAME
     policy_themes - request the themes for a document on demand

   DESCRIPTION
     This version of themes accepts a policy name and a single BLOB
     document.  Returns the results into a PL/SQL table.

   NOTES
     Existing contents of restab will be destroyed
*/
PROCEDURE policy_themes (
   policy_name   in varchar2,
   document      in blob,
   restab        in out nocopy theme_tab,
   full_themes   in boolean   default false,
   num_themes    in number    default 50,
   language      in varchar2  default NULL,
   format        in varchar2  default NULL,
   charset       in varchar2  default NULL
);

/*------------------------------ policy_themes ------------------------------*/
/*
   NAME
     policy_themes - request the themes for a document on demand

   DESCRIPTION
     This version of themes accepts a policy name and a single BFILE
     document. Returns the results into a PL/SQL table.

   NOTES
     Existing contents of restab will be destroyed
*/
PROCEDURE policy_themes (
   policy_name   in varchar2,
   document      in bfile,
   restab        in out nocopy theme_tab,
   full_themes   in boolean   default false,
   num_themes    in number    default 50,
   language      in varchar2   default NULL,
   format        in varchar2   default NULL,
   charset       in varchar2   default NULL
);

/*------------------------------- tokens --------------------------------*/
/*
   NAME
     tokens - request the text tokens for a document

   DESCRIPTION
     This procedure will generate the tokens for a given document.
     The tokens will be written to the token table specified.
     The token table must have the following columns:

       query_id        number         (the query_id)
       token           varchar2(64)   (the token)
       offset          number         (the token's character offset)
       length          number         (the token's length)

   ARGUMENTS
     index_name               - the name of the text index
     textkey                  - the primary key of the document
     restab                   - the name of the theme table
     query_id                 - a query id
     use_saved_copy           - Can be set to any of these values:
                                SAVE_COPY_FALLBACK / SAVE_COPY_ERROR /
                                SAVE_COPY_IGNORE
*/
PROCEDURE tokens (
   index_name    in varchar2,
   textkey       in varchar2,
   restab        in varchar2,
   query_id      in number    default 0,
   use_saved_copy in number    default ctx_doc.save_copy_fallback
);

/*------------------------------- tokens --------------------------------*/
/*
   NAME
     tokens - request the text tokens for a document

   DESCRIPTION
     This version of tokens returns the results into a PL/SQL table
     instead of a result table

   NOTES
     Existing contents of restab will be destroyed
*/
PROCEDURE tokens (
   index_name    in varchar2,
   textkey       in varchar2,
   restab        in out nocopy token_tab,
   use_saved_copy in number    default ctx_doc.save_copy_fallback
);

/*------------------------------ policy_tokens ------------------------------*/
/*
   NAME
     policy_tokens - request the text tokens for a document on demand

   DESCRIPTION
     This version of tokens accepts a policy name and a single VARCHAR2
     document.  Returns the results into a PL/SQL table.

   NOTES
     Existing contents of restab will be destroyed
*/
PROCEDURE policy_tokens (
   policy_name    in varchar2,
   document       in varchar2,
   restab         in out nocopy token_tab,
   language       in varchar2   default NULL,
   format         in varchar2   default NULL,
   charset        in varchar2   default NULL
);

/*------------------------------ policy_tokens -------------------------------*/
/*
   NAME
     policy_tokens - request the text tokens for a document on demand

   DESCRIPTION
     This version of tokens accepts a policy name and a single CLOB
     document.  Returns the results into a PL/SQL table

   NOTES
     Existing contents of restab will be destroyed
*/
PROCEDURE policy_tokens (
   policy_name    in varchar2,
   document       in clob,
   restab         in out nocopy token_tab,
   language       in varchar2   default NULL,
   format         in varchar2   default NULL,
   charset        in varchar2   default NULL
);

/*------------------------------ policy_tokens ------------------------------*/
/*
   NAME
     policy_tokens - request the text tokens for a document on demand

   DESCRIPTION
     This version of tokens accepts a policy name and a single BLOB
     document.  Returns the results into a PL/SQL table

   NOTES
     Existing contents of restab will be destroyed
*/
PROCEDURE policy_tokens (
   policy_name    in varchar2,
   document       in blob,
   restab         in out nocopy token_tab,
   language       in varchar2   default NULL,
   format         in varchar2   default NULL,
   charset        in varchar2   default NULL
);

/*------------------------------ policy_tokens -----------------------------*/
/*
   NAME
     policy_tokens - request the text tokens for a document on demand

   DESCRIPTION
     This version of tokens accepts a policy name and a single BFILE
     document.  Returns the results into a PL/SQL table

   NOTES
     Existing contents of restab will be destroyed
*/
PROCEDURE policy_tokens (
   policy_name    in varchar2,
   document       in bfile,
   restab         in out nocopy token_tab,
   language       in varchar2   default NULL,
   format         in varchar2   default NULL,
   charset        in varchar2   default NULL
);

/* Beehive */
/*----------------------- policy_stems (inmem)  ----------------------------*/
/*
   NAME
     policy_stems - request the text stems for a document on demand

   DESCRIPTION
     This version of stems accepts a policy name and a single varchar2
     document.  Returns the results into a PL/SQL table.
     The returned values in the PL/SQL table will have 1 cell for each
     word (can be a multi-word as determined by the Lexer) in the input
     string document. For each word, all the stems are returned. For each
     stem, the offset and length (in the input string) of the word for
     which this is a stem is returned. Additioanlly, for each stem, a boolean
     value is returned that indicates if the stem was found in the lexicon.

   NOTES
     Existing contents of restab will be destroyed
*/
PROCEDURE policy_stems (
   policy_name    in varchar2,
   document       in varchar2,
   restab         in out nocopy stem_group_tab,
   language       in varchar2  default NULL,
   format         in varchar2  default NULL,
   charset        in varchar2  default NULL
);

PROCEDURE policy_stems (
   policy_name    in varchar2,
   document       in clob,
   restab         in out nocopy stem_group_tab,
   language       in varchar2  default NULL,
   format         in varchar2  default NULL,
   charset        in varchar2  default NULL
);

/*----------------------- policy_noun_phrases (inmem)  --------------------*/
/*
   NAME
     policy_noun_phrases - request the noun phrases for a document

   DESCRIPTION
     This version of stems accepts a policy name and a single varchar2
     document.  Returns the results into a PL/SQL table.
     The returned values in the PL/SQL table will have 1 cell for each
     noun phrase extracted from the input document. For each noun phrase,
     the part of speech tags are also returned.

   NOTES
     Existing contents of restab will be destroyed
*/
PROCEDURE policy_noun_phrases (
   policy_name    in varchar2,
   document       in varchar2,
   restab         in out nocopy noun_phrase_tab,
   language       in varchar2  default NULL,
   format         in varchar2  default NULL,
   charset        in varchar2  default NULL
);

PROCEDURE policy_noun_phrases (
   policy_name    in varchar2,
   document       in clob,
   restab         in out nocopy noun_phrase_tab,
   language       in varchar2  default NULL,
   format         in varchar2  default NULL,
   charset        in varchar2  default NULL
);

/*----------------------- policy_languages (inmem)  ----------------------------*/
/*
   NAME
     policy_languages - request the languages for a document

   DESCRIPTION
     This version of languages accepts a policy name and a single varchar2
     document.  Returns the results into a PL/SQL table.
     The returned values in the PL/SQL table will have 1 cell for each
     detected language. It will also have a score which indicates the
     stength of the detected language in this document - the score ranges
     from 0 to 100 with the highest score referring to the most likely
     language for the document.


   NOTES
     Existing contents of restab will be destroyed
*/
PROCEDURE policy_languages (
   policy_name    in varchar2,
   document       in varchar2,
   restab         in out nocopy language_tab,
   format         in varchar2  default NULL,
   charset        in varchar2  default NULL
);

PROCEDURE policy_languages (
   policy_name    in varchar2,
   document       in clob,
   restab         in out nocopy language_tab,
   format         in varchar2  default NULL,
   charset        in varchar2  default NULL
);

/*----------------------- policy_part_of_speech (inmem) --------------------------*/
/*
   NAME
     policy_part_of_speech - request the part_of_speech tags for a document

   DESCRIPTION
     This version of part_of_speech accepts a policy name and a single varchar2
     document.  Returns the results into a PL/SQL table.
     The returned values in the PL/SQL table will have 1 cell for each
     word in the input string document. For each word, the part_of_speech tags
     are returned.

     If the input parameter disambiguate_tags is set to true, only
     1 part_of_speech will be returned for each word - this tag is determined
     by the Lexer by automatically performing disambiguation to identify the most
     likely tag, given the surrounding context, for a token with more than one
     possible tag.
     If the input parameter disambiguate_tags is set to false, all possible tags
     will be returned for each word.

     Additionally, for each word, the offset and length (in the input string) of
     the word for and  a boolean value indicating if the word was found in the
     lexicon are also returned.


   NOTES
     Existing contents of restab will be destroyed
*/
PROCEDURE policy_part_of_speech (
   policy_name       in varchar2,
   document          in varchar2,
   restab            in out nocopy part_of_speech_tab,
   language          in varchar2  default NULL,
   format            in varchar2  default NULL,
   charset           in varchar2  default NULL,
   disambiguate_tags in boolean default true
);

PROCEDURE policy_part_of_speech (
   policy_name       in varchar2,
   document          in clob,
   restab            in out nocopy part_of_speech_tab,
   language          in varchar2  default NULL,
   format            in varchar2  default NULL,
   charset           in varchar2  default NULL,
   disambiguate_tags in boolean default true
);

/*------------------------------- gist ----------------------------------*/
/*
   NAME
     gist - request the gist for a document

   DESCRIPTION

     This procedure will generate gist(s) of a given document.
     The gist(s) will be written to the gist table specified.
     The gist table must have the following columns:

       query_id   number       (the query id)
       pov        varchar2(80) (gist point-of-view)
       gist       clob         (gist)

   ARGUMENTS
     index_name               - the name of the text index
     textkey                  - the primary key of the document
     restab                   - the name of the gist table
     query_id                 - the query id
     glevel                   - P or S
     pov                      - point-of-view limit
     numparagraphs            - total number of paragraphs in gist(>=0)
     maxpercent               - maximum percent of document in gist(>=0,<=100)
     num_themes               - maximum number of themes to return
     use_saved_copy           - Can be set to any of these values:
                                SAVE_COPY_FALLBACK / SAVE_COPY_ERROR /
                                SAVE_COPY_IGNORE
*/
PROCEDURE gist (
  index_name     in varchar2,
  textkey        in varchar2,
  restab         in varchar2,
  query_id       in number   default 0,
  glevel         in varchar2 default 'P',
  pov            in varchar2 default null,
  numParagraphs  in number   default null,
  maxPercent     in number   default null,
  num_themes     in number   default 50,
  use_saved_copy in number    default ctx_doc.save_copy_fallback
);

/*------------------------------- gist ----------------------------------*/
/*
   NAME
     gist - request the gist for a document

   DESCRIPTION
     This version of gist returns the result into a CLOB locator
     instead of a result table.

   NOTES
     Unlike result table gist, this version of gist returns only one
     gist.  If pov is not supplied, the GENERIC gist is returned.

     If result is NULL on entry, a temporary lob is allocated and returned.
     it is up to the calling procedure to deallocate this lob.

     Any existing contents of the lob locator passed in are cleared.
*/
PROCEDURE gist (
  index_name     in varchar2,
  textkey        in varchar2,
  restab         in out nocopy clob,
  glevel         in varchar2 default 'P',
  pov            in varchar2 default 'GENERIC',
  numParagraphs  in number   default null,
  maxPercent     in number   default null,
  num_themes     in number   default 50,
  use_saved_copy in number    default ctx_doc.save_copy_fallback
);

/*------------------------------ policy_gist --------------------------------*/
/*
   NAME
     policy_gist - request the gist for a document on demand

   DESCRIPTION
     This version of tokens accepts a policy name and a single VARCHAR2
     document. Returns the result into a CLOB locator.

   NOTES
     Unlike result table gist, this version of gist returns only one
     gist.  If pov is not supplied, the GENERIC gist is returned.

     If result is NULL on entry, a temporary lob is allocated and returned.
     it is up to the calling procedure to deallocate this lob.

     Any existing contents of the lob locator passed in are cleared.
*/
PROCEDURE policy_gist (
  policy_name    in varchar2,
  document       in varchar2,
  restab         in out nocopy clob,
  glevel         in varchar2 default 'P',
  pov            in varchar2 default 'GENERIC',
  numParagraphs  in number   default null,
  maxPercent     in number   default null,
  num_themes     in number   default 50,
  language       in varchar2 default NULL,
  format         in varchar2 default NULL,
  charset        in varchar2 default NULL
);

/*------------------------------ policy_gist --------------------------------*/
/*
   NAME
     policy_gist - request the gist for a document on demand

   DESCRIPTION
     This version of tokens accepts a policy name and a single CLOB
     document. Returns the result into a CLOB locator.

   NOTES
     Unlike result table gist, this version of gist returns only one
     gist.  If pov is not supplied, the GENERIC gist is returned.

     If result is NULL on entry, a temporary lob is allocated and returned.
     it is up to the calling procedure to deallocate this lob.

     Any existing contents of the lob locator passed in are cleared.
*/
PROCEDURE policy_gist (
  policy_name    in varchar2,
  document       in clob,
  restab         in out nocopy clob,
  glevel         in varchar2 default 'P',
  pov            in varchar2 default 'GENERIC',
  numParagraphs  in number   default null,
  maxPercent     in number   default null,
  num_themes     in number   default 50,
  language       in varchar2 default NULL,
  format         in varchar2 default NULL,
  charset        in varchar2 default NULL
);

/*------------------------------ policy_gist --------------------------------*/
/*
   NAME
     policy_gist - request the gist for a document on demand

   DESCRIPTION
     This version of tokens accepts a policy name and a single BLOB
     document. Returns the result into a CLOB locator.

   NOTES
     Unlike result table gist, this version of gist returns only one
     gist.  If pov is not supplied, the GENERIC gist is returned.

     If result is NULL on entry, a temporary lob is allocated and returned.
     it is up to the calling procedure to deallocate this lob.

     Any existing contents of the lob locator passed in are cleared.
*/
PROCEDURE policy_gist (
  policy_name    in varchar2,
  document       in blob,
  restab         in out nocopy clob,
  glevel         in varchar2 default 'P',
  pov            in varchar2 default 'GENERIC',
  numParagraphs  in number   default null,
  maxPercent     in number   default null,
  num_themes     in number   default 50,
  language      in varchar2   default NULL,
  format        in varchar2   default NULL,
  charset       in varchar2   default NULL
);

/*------------------------------ policy_gist --------------------------------*/
/*
   NAME
     policy_gist - request the gist for a document on demand

   DESCRIPTION
     This version of tokens accepts a policy name and a single BFILE
     document. Returns the result into a CLOB locator.

   NOTES
     Unlike result table gist, this version of gist returns only one
     gist.  If pov is not supplied, the GENERIC gist is returned.

     If result is NULL on entry, a temporary lob is allocated and returned.
     it is up to the calling procedure to deallocate this lob.

     Any existing contents of the lob locator passed in are cleared.
*/
PROCEDURE policy_gist (
  policy_name    in varchar2,
  document       in bfile,
  restab         in out nocopy clob,
  glevel         in varchar2 default 'P',
  pov            in varchar2 default 'GENERIC',
  numParagraphs  in number   default null,
  maxPercent     in number   default null,
  num_themes     in number   default 50,
  language       in varchar2 default NULL,
  format         in varchar2 default NULL,
  charset        in varchar2 default NULL
);

/*------------------------------- filter -------------------------------*/
/*
  NAME
    filter - return filtered text

  DESCRIPTION
    Filter takes a document reference and returns a plaintext version
    The filter result table should have the following columns:

      query_id  number    (the query id)
      document  clob      (plaintext document)

  ARGUMENTS
    index_name  -- name of the index
    textkey     -- the document for which to produce highlights
    restab      -- the filter result table
    query_id    -- the query id
    plaintext   -- set to TRUE if plaintext is desired
    use_saved_copy -- Can be set to any of these values:
                      SAVE_COPY_FALLBACK / SAVE_COPY_ERROR / SAVE_COPY_IGNORE
*/
PROCEDURE filter (
  index_name     in varchar2,
  textkey        in varchar2,
  restab         in varchar2,
  query_id       in number    default 0,
  plaintext      in boolean   default FALSE,
  use_saved_copy in number    default ctx_doc.save_copy_fallback
);

/*------------------------------- filter -------------------------------*/
/*
  NAME
    filter - return filtered text

  DESCRIPTION
    This version of filter returns the result into a CLOB locator
    instead of a result table.

   NOTES
     If result is NULL on entry, a temporary lob is allocated and returned.
     it is up to the calling procedure to deallocate this lob.

     Any existing contents of the lob locator passed in are cleared.
*/
PROCEDURE filter (
  index_name     in varchar2,
  textkey        in varchar2,
  restab         in out nocopy clob,
  plaintext      in boolean   default FALSE,
  use_saved_copy in number    default ctx_doc.save_copy_fallback
);

/*----------------------------- policy_filter ------------------------------*/
/*
  NAME
    policy_filter - return filtered text on demand

  DESCRIPTION
    This version of filter accepts a policy name and a single VARCHAR2
    document.  Returns the result into a CLOB locator.

  NOTES
    If result is NULL on entry, a temporary lob is allocated and returned.
    it is up to the calling procedure to deallocate this lob.

    Any existing contents of the lob locator passed in are cleared.
*/
PROCEDURE policy_filter (
  policy_name    in varchar2,
  document       in clob,
  restab         in out nocopy clob,
  plaintext      in boolean   default FALSE,
  language       in varchar2  default NULL,
  format         in varchar2  default NULL,
  charset        in varchar2  default NULL
);

/*----------------------------- policy_filter ------------------------------*/
/*
  NAME
    policy_filter - return filtered text on demand

  DESCRIPTION
    This version of filter accepts a policy name and a single CLOB
    document.  Returns the result into a CLOB locator.

  NOTES
    If result is NULL on entry, a temporary lob is allocated and returned.
    it is up to the calling procedure to deallocate this lob.

    Any existing contents of the lob locator passed in are cleared.
*/
PROCEDURE policy_filter (
  policy_name    in varchar2,
  document       in blob,
  restab         in out nocopy clob,
  plaintext      in boolean   default FALSE,
  language       in varchar2  default NULL,
  format         in varchar2  default NULL,
  charset        in varchar2  default NULL
);

/*----------------------------- policy_filter ------------------------------*/
/*
  NAME
    policy_filter - return filtered text on demand

  DESCRIPTION
    This version of filter accepts a policy name and a single BLOB
    document.  Returns the result into a CLOB locator.

  NOTES
    If result is NULL on entry, a temporary lob is allocated and returned.
    it is up to the calling procedure to deallocate this lob.

    Any existing contents of the lob locator passed in are cleared.
*/
PROCEDURE policy_filter (
  policy_name    in varchar2,
  document       in bfile,
  restab         in out nocopy clob,
  plaintext      in boolean   default FALSE,
  language       in varchar2  default NULL,
  format         in varchar2  default NULL,
  charset        in varchar2  default NULL
);

/*----------------------------- policy_filter ------------------------------*/
/*
  NAME
    policy_filter - return filtered text on demand

  DESCRIPTION
    This version of filter accepts a policy name and a single BFILE
    document. Returns the result into a CLOB locator.

  NOTES
    If result is NULL on entry, a temporary lob is allocated and returned.
    it is up to the calling procedure to deallocate this lob.

    Any existing contents of the lob locator passed in are cleared.
*/
PROCEDURE policy_filter (
  policy_name    in varchar2,
  document       in varchar2,
  restab         in out nocopy clob,
  plaintext      in boolean   default FALSE,
  language       in varchar2  default NULL,
  format         in varchar2  default NULL,
  charset        in varchar2  default NULL
);

/*------------------------------- highlight ----------------------------*/
/*
  NAME
    highlight - return highlight information

  DESCRIPTION
    Highlight takes a query and a document, and returns highlight information
    The result table should have the following columns:

      query_id  number     (the query id)
      offset    number     (character offset to highlight start)
      length    number     (character length of highlight)

  ARGUMENTS
    index_name  -- name of the index
    textkey     -- the document for which to produce highlights
    text_query  -- the query
    restab      -- the highlight result table
    query_id    -- a query id
    plaintext   -- set to TRUE if plaintext offsets are desired
    use_saved_copy -- Can be set to any of these values:
                      SAVE_COPY_FALLBACK / SAVE_COPY_ERROR / SAVE_COPY_IGNORE
*/
PROCEDURE highlight (
  index_name     in varchar2,
  textkey        in varchar2,
  text_query     in varchar2,
  restab         in varchar2,
  query_id       in number    default 0,
  plaintext      in boolean   default FALSE,
  use_saved_copy in number    default ctx_doc.save_copy_fallback
);

PROCEDURE highlight_clob_query (
  index_name       in varchar2,
  textkey          in varchar2,
  text_query       in clob,
  restab           in varchar2,
  query_id         in number    default 0,
  plaintext        in boolean   default FALSE,
  use_saved_copy in number    default ctx_doc.save_copy_fallback
);

/*------------------------------- highlight ----------------------------*/
/*
  NAME
    highlight - return highlight information

  DESCRIPTION
    This version of filter returns the results into a PL/SQL table
    instead of a result table.

  NOTES
     Existing contents of the table are destroyed
*/
PROCEDURE highlight (
  index_name     in varchar2,
  textkey        in varchar2,
  text_query     in varchar2,
  restab         in out nocopy highlight_tab,
  plaintext      in boolean   default FALSE,
  use_saved_copy in number    default ctx_doc.save_copy_fallback
);

PROCEDURE highlight_clob_query (
  index_name       in varchar2,
  textkey          in varchar2,
  text_query       in clob,
  restab           in out nocopy highlight_tab,
  plaintext        in boolean   default FALSE,
  use_saved_copy in number    default ctx_doc.save_copy_fallback
);

/*------------------------------ policy_highlight --------------------------*/
/*
  NAME
    policy_highlight - return highlight information

  DESCRIPTION
    This version of highlight accepts a policy name and a single VARCHAR2
    document.  Returns the restuls into a PL/SQL table.

  NOTES
    Existing contents of the table are destroyed

*/
PROCEDURE policy_highlight (
  policy_name    in varchar2,
  document       in varchar2,
  text_query     in varchar2,
  restab         in out nocopy highlight_tab,
  plaintext      in boolean   default FALSE,
  language       in varchar2  default NULL,
  format         in varchar2  default NULL,
  charset        in varchar2  default NULL
);

PROCEDURE policy_highlight_clob_query (
  policy_name      in varchar2,
  document         in varchar2,
  text_query       in clob,
  restab           in out nocopy highlight_tab,
  plaintext        in boolean   default FALSE,
  language         in varchar2  default NULL,
  format           in varchar2  default NULL,
  charset          in varchar2  default NULL
);

/*------------------------------ policy_highlight --------------------------*/
/*
  NAME
    policy_highlight - return highlight information

  DESCRIPTION
    This version of highlight accepts a policy name and a single CLOB
    document.  Returns the results into a PL/SQL table.

  NOTES
    Existing contents of the table are destroyed
*/
PROCEDURE policy_highlight (
  policy_name    in varchar2,
  document       in clob,
  text_query     in varchar2,
  restab         in out nocopy highlight_tab,
  plaintext      in boolean   default FALSE,
  language       in varchar2  default NULL,
  format         in varchar2  default NULL,
  charset        in varchar2  default NULL
);

PROCEDURE policy_highlight_clob_query (
  policy_name      in varchar2,
  document         in clob,
  text_query       in clob,
  restab           in out nocopy highlight_tab,
  plaintext        in boolean   default FALSE,
  language         in varchar2  default NULL,
  format           in varchar2  default NULL,
  charset          in varchar2  default NULL
);

/*------------------------------ policy_highlight --------------------------*/
/*
  NAME
    policy_highlight - return highlight information

  DESCRIPTION
    This version of highlight accepts a policy name and a single BLOB
    document.  Returns the restuls into a PL/SQL table.

  NOTES
    Existing contents of the table are destroyed
*/
PROCEDURE policy_highlight (
  policy_name    in varchar2,
  document       in blob,
  text_query     in varchar2,
  restab         in out nocopy highlight_tab,
  plaintext      in boolean   default FALSE,
  language       in varchar2  default NULL,
  format         in varchar2  default NULL,
  charset        in varchar2  default NULL
);

PROCEDURE policy_highlight_clob_query (
  policy_name      in varchar2,
  document         in blob,
  text_query       in clob,
  restab           in out nocopy highlight_tab,
  plaintext        in boolean   default FALSE,
  language         in varchar2  default NULL,
  format           in varchar2  default NULL,
  charset          in varchar2  default NULL
);

/*------------------------------ policy_highlight --------------------------*/
/*
  NAME
    policy_highlight- return highlight information

  DESCRIPTION
    This version of highlight accepts a policy name and a single BFILE
    document.  Returns the restuls into a PL/SQL table.

  NOTES
    Existing contents of the table are destroyed
*/
PROCEDURE policy_highlight (
  policy_name    in varchar2,
  document       in bfile,
  text_query     in varchar2,
  restab         in out nocopy highlight_tab,
  plaintext      in boolean   default FALSE,
  language       in varchar2  default NULL,
  format         in varchar2  default NULL,
  charset        in varchar2  default NULL
);

PROCEDURE policy_highlight_clob_query (
  policy_name      in varchar2,
  document         in bfile,
  text_query       in clob,
  restab           in out nocopy highlight_tab,
  plaintext        in boolean   default FALSE,
  language         in varchar2  default NULL,
  format           in varchar2  default NULL,
  charset          in varchar2  default NULL
);

/*------------------------------- markup -------------------------------*/
/*
  NAME
    markup - return marked-up document

  DESCRIPTION
    Markup takes a document reference and a query, and returns a marked-up
    plain text version of the document
    The result table should have the following columns:

      query_id number    (the query id)
      document clob      (marked-up document)

  ARGUMENTS
    index_name  -- name of the index
    textkey     -- the document for which to produce highlights
    text_query  -- the query
    restab      -- the highlight result table
    query_id    -- a query id
    plaintext   -- set to TRUE if plaintext markup is required
    tagset      -- name of tagset
                     TEXT_DEFAULT
                     HTML_DEFAULT
                     HTML_NAVIGATE
    starttag    -- the start mark-up tag
    endtag      -- the end mark-up tag
    prevtag     -- the navigate to previous highlight mark-up tag
    nexttag     -- the navigate to next highlight mark-up tag
    use_saved_copy -- Can be set to any of these values:
                      SAVE_COPY_FALLBACK / SAVE_COPY_ERROR / SAVE_COPY_IGNORE
*/
PROCEDURE markup (
  index_name     in varchar2,
  textkey        in varchar2,
  text_query     in varchar2,
  restab         in varchar2,
  query_id       in number    default 0,
  plaintext      in boolean   default FALSE,
  tagset         in varchar2  default 'TEXT_DEFAULT',
  starttag       in varchar2  default null,
  endtag         in varchar2  default null,
  prevtag        in varchar2  default null,
  nexttag        in varchar2  default null,
  use_saved_copy in number    default ctx_doc.save_copy_fallback
);

PROCEDURE markup_clob_query (
  index_name       in varchar2,
  textkey          in varchar2,
  text_query       in clob,
  restab           in varchar2,
  query_id         in number    default 0,
  plaintext        in boolean   default FALSE,
  tagset           in varchar2  default 'TEXT_DEFAULT',
  starttag         in varchar2  default null,
  endtag           in varchar2  default null,
  prevtag          in varchar2  default null,
  nexttag          in varchar2  default null,
  use_saved_copy in number    default ctx_doc.save_copy_fallback
);

/*------------------------------- markup -------------------------------*/
/*
  NAME
    markup - return marked-up document

  DESCRIPTION
    This version of markup returns the result into a CLOB locator
    instead of a result table.

   NOTES
     If result is NULL on entry, a temporary lob is allocated and returned.
     it is up to the calling procedure to deallocate this lob.

     Any existing contents of the lob locator passed in are cleared.
*/
PROCEDURE markup (
  index_name     in varchar2,
  textkey        in varchar2,
  text_query     in varchar2,
  restab         in out nocopy clob,
  plaintext      in boolean   default FALSE,
  tagset         in varchar2  default 'TEXT_DEFAULT',
  starttag       in varchar2  default null,
  endtag         in varchar2  default null,
  prevtag        in varchar2  default null,
  nexttag        in varchar2  default null,
  use_saved_copy in number    default ctx_doc.save_copy_fallback
);

PROCEDURE markup_clob_query (
  index_name       in varchar2,
  textkey          in varchar2,
  text_query       in clob,
  restab           in out nocopy clob,
  plaintext        in boolean   default FALSE,
  tagset           in varchar2  default 'TEXT_DEFAULT',
  starttag         in varchar2  default null,
  endtag           in varchar2  default null,
  prevtag          in varchar2  default null,
  nexttag          in varchar2  default null,
  use_saved_copy in number    default ctx_doc.save_copy_fallback
);

/*------------------------------- policy_markup -----------------------------*/
/*
  NAME
    policy_markup - return marked-up document on demand

  DESCRIPTION
    This version of markup accepts a policy name and a single VARCHAR2
    document.  Returns the result into a CLOB locator.

  NOTES
    If result is NULL on entry, a temporary lob is allocated and returned.
    it is up to the calling procedure to deallocate this lob.

    Any existing contents of the lob locator passed in are cleared.
*/
PROCEDURE policy_markup (
  policy_name     in varchar2,
  document       in varchar2,
  text_query     in varchar2,
  restab         in out nocopy clob,
  plaintext      in boolean   default FALSE,
  tagset         in varchar2  default 'TEXT_DEFAULT',
  starttag       in varchar2  default null,
  endtag         in varchar2  default null,
  prevtag        in varchar2  default null,
  nexttag        in varchar2  default null,
  language       in varchar2  default NULL,
  format         in varchar2  default NULL,
  charset        in varchar2  default NULL
);

PROCEDURE policy_markup_clob_query (
  policy_name      in varchar2,
  document         in varchar2,
  text_query       in clob,
  restab           in out nocopy clob,
  plaintext        in boolean   default FALSE,
  tagset           in varchar2  default 'TEXT_DEFAULT',
  starttag         in varchar2  default null,
  endtag           in varchar2  default null,
  prevtag          in varchar2  default null,
  nexttag          in varchar2  default null,
  language         in varchar2  default NULL,
  format           in varchar2  default NULL,
  charset          in varchar2  default NULL
);

/*------------------------------- policy_markup -----------------------------*/
/*
  NAME
    policy_markup - return marked-up document on demand

  DESCRIPTION
    This version of markup accepts a policy name and a single CLOB
    document.  Returns the result into a CLOB locator.

  NOTES
    If result is NULL on entry, a temporary lob is allocated and returned.
    it is up to the calling procedure to deallocate this lob.

    Any existing contents of the lob locator passed in are cleared.
*/
PROCEDURE policy_markup (
  policy_name     in varchar2,
  document       in clob,
  text_query     in varchar2,
  restab         in out nocopy clob,
  plaintext      in boolean   default FALSE,
  tagset         in varchar2  default 'TEXT_DEFAULT',
  starttag       in varchar2  default null,
  endtag         in varchar2  default null,
  prevtag        in varchar2  default null,
  nexttag        in varchar2  default null,
  language       in varchar2  default NULL,
  format         in varchar2  default NULL,
  charset        in varchar2  default NULL
);

PROCEDURE policy_markup_clob_query (
  policy_name      in varchar2,
  document         in clob,
  text_query       in clob,
  restab           in out nocopy clob,
  plaintext        in boolean   default FALSE,
  tagset           in varchar2  default 'TEXT_DEFAULT',
  starttag         in varchar2  default null,
  endtag           in varchar2  default null,
  prevtag          in varchar2  default null,
  nexttag          in varchar2  default null,
  language         in varchar2  default NULL,
  format           in varchar2  default NULL,
  charset          in varchar2  default NULL
);

/*------------------------------- policy_markup -----------------------------*/
/*
  NAME
    policy_markup - return marked-up document on demand

  DESCRIPTION
    This version of markup accepts a policy name and a single BLOB
    document.  Returns the result into a CLOB locator.

  NOTES
    If result is NULL on entry, a temporary lob is allocated and returned.
    it is up to the calling procedure to deallocate this lob.

    Any existing contents of the lob locator passed in are cleared.
*/
PROCEDURE policy_markup (
  policy_name     in varchar2,
  document       in blob,
  text_query     in varchar2,
  restab         in out nocopy clob,
  plaintext      in boolean   default FALSE,
  tagset         in varchar2  default 'TEXT_DEFAULT',
  starttag       in varchar2  default null,
  endtag         in varchar2  default null,
  prevtag        in varchar2  default null,
  nexttag        in varchar2  default null,
  language       in varchar2  default NULL,
  format         in varchar2  default NULL,
  charset        in varchar2  default NULL
);

PROCEDURE policy_markup_clob_query (
  policy_name      in varchar2,
  document         in blob,
  text_query       in clob,
  restab           in out nocopy clob,
  plaintext        in boolean   default FALSE,
  tagset           in varchar2  default 'TEXT_DEFAULT',
  starttag         in varchar2  default null,
  endtag           in varchar2  default null,
  prevtag          in varchar2  default null,
  nexttag          in varchar2  default null,
  language         in varchar2  default NULL,
  format           in varchar2  default NULL,
  charset          in varchar2  default NULL
);

/*------------------------------- policy_markup ----------------------------*/
/*
  NAME
    policy_markup - return marked-up document on demand

  DESCRIPTION
    This version of markup accepts a policy name and a single BFILE
    document.  Returns the result into a CLOB locator.

  NOTES
    If result is NULL on entry, a temporary lob is allocated and returned.
    it is up to the calling procedure to deallocate this lob.

    Any existing contents of the lob locator passed in are cleared.
*/
PROCEDURE policy_markup (
  policy_name     in varchar2,
  document       in bfile,
  text_query     in varchar2,
  restab         in out nocopy clob,
  plaintext      in boolean   default FALSE,
  tagset         in varchar2  default 'TEXT_DEFAULT',
  starttag       in varchar2  default null,
  endtag         in varchar2  default null,
  prevtag        in varchar2  default null,
  nexttag        in varchar2  default null,
  language       in varchar2  default NULL,
  format         in varchar2  default NULL,
  charset        in varchar2  default NULL
);

PROCEDURE policy_markup_clob_query (
  policy_name      in varchar2,
  document         in bfile,
  text_query       in clob,
  restab           in out nocopy clob,
  plaintext        in boolean   default FALSE,
  tagset           in varchar2  default 'TEXT_DEFAULT',
  starttag         in varchar2  default null,
  endtag           in varchar2  default null,
  prevtag          in varchar2  default null,
  nexttag          in varchar2  default null,
  language         in varchar2  default NULL,
  format           in varchar2  default NULL,
  charset          in varchar2  default NULL
);

/*----------------------------- snippet --------- ----------------------*/
/* NAME
     snippet - return snippet (or kwic or concordance) for a given document

  DESCRIPTION
    This version of snippet accepts a index name and a key to specify
    a document.  Returns the snippet result.

  NOTES
*/
function snippet (
  index_name		IN  VARCHAR2,
  textkey  		IN  VARCHAR2,
  text_query  		IN  VARCHAR2,
  starttag  		IN  VARCHAR2  default '<b>',
  endtag  		IN  VARCHAR2  default '</b>',
  entity_translation  	IN  BOOLEAN   default TRUE,
  separator  		IN  VARCHAR2  default '<b>...</b>',
  radius                IN  NUMBER    default 25,
  max_length            IN  NUMBER    default 150,
  use_saved_copy IN NUMBER default ctx_doc.save_copy_fallback
)  return varchar2;

function snippet_clob_query (
  index_name		IN  VARCHAR2,
  textkey  		IN  VARCHAR2,
  text_query     	IN  CLOB,
  starttag  		IN  VARCHAR2  default '<b>',
  endtag  		IN  VARCHAR2  default '</b>',
  entity_translation  	IN  BOOLEAN   default TRUE,
  separator  		IN  VARCHAR2  default '<b>...</b>',
  radius                IN  NUMBER    default 25,
  max_length            IN  NUMBER    default 150,
  use_saved_copy IN NUMBER default ctx_doc.save_copy_fallback
)  return varchar2;


/*----------------------------- policy_snippet ----------------------*/
/* NAME
     policy_snippet - return snippet (kwic or concordaace) for a given document

  DESCRIPTION
    This version of snippet accepts a policy name and a single varchar2
    document.  Returns the snippet result.

  NOTES
*/
function policy_snippet (
  policy_name		IN  VARCHAR2,
  document  		IN  VARCHAR2,
  text_query  		IN  VARCHAR2,
  language  		IN  VARCHAR2  default NULL,
  format  		IN  VARCHAR2  default NULL,
  charset  		IN  VARCHAR2  default NULL,
  starttag  		IN  VARCHAR2  default '<b>',
  endtag  		IN  VARCHAR2  default '</b>',
  entity_translation  	IN  BOOLEAN   default TRUE,
  separator  		IN  VARCHAR2  default '<b>...</b>',
  radius                IN  NUMBER    default 25,
  max_length            IN  NUMBER    default 150
)  return varchar2;

function policy_snippet_clob_query (
  policy_name		IN  VARCHAR2,
  document  		IN  VARCHAR2,
  text_query     	IN  CLOB,
  language  		IN  VARCHAR2  default NULL,
  format  		IN  VARCHAR2  default NULL,
  charset  		IN  VARCHAR2  default NULL,
  starttag  		IN  VARCHAR2  default '<b>',
  endtag  		IN  VARCHAR2  default '</b>',
  entity_translation  	IN  BOOLEAN   default TRUE,
  separator  		IN  VARCHAR2  default '<b>...</b>',
  radius                IN  NUMBER    default 25,
  max_length            IN  NUMBER    default 150
)  return varchar2;

/*----------------------------- policy_snippet ----------------------*/
/* NAME
     policy_snippet - return snippet (kwic or concordaace) for a given document

  DESCRIPTION
    This version of snippet accepts a policy name and a single clob
    document.  Returns the snippet result.

  NOTES
*/
function policy_snippet (
  policy_name		IN  VARCHAR2,
  document  		IN  CLOB,
  text_query  		IN  VARCHAR2,
  language  		IN  VARCHAR2  default NULL,
  format  		IN  VARCHAR2  default NULL,
  charset  		IN  VARCHAR2  default NULL,
  starttag  		IN  VARCHAR2  default '<b>',
  endtag  		IN  VARCHAR2  default '</b>',
  entity_translation  	IN  BOOLEAN   default TRUE,
  separator  		IN  VARCHAR2  default '<b>...</b>',
  radius                IN  NUMBER    default 25,
  max_length            IN  NUMBER    default 150
)  return varchar2;

function policy_snippet_clob_query (
  policy_name		IN  VARCHAR2,
  document  		IN  CLOB,
  text_query     	IN  CLOB,
  language  		IN  VARCHAR2  default NULL,
  format  		IN  VARCHAR2  default NULL,
  charset  		IN  VARCHAR2  default NULL,
  starttag  		IN  VARCHAR2  default '<b>',
  endtag  		IN  VARCHAR2  default '</b>',
  entity_translation  	IN  BOOLEAN   default TRUE,
  separator  		IN  VARCHAR2  default '<b>...</b>',
  radius                IN  NUMBER    default 25,
  max_length            IN  NUMBER    default 150
)  return varchar2;

/*----------------------------- policy_snippet ----------------------*/
/* NAME
     policy_snippet - return snippet (kwic or concordaace) for a given document

  DESCRIPTION
    This version of snippet accepts a policy name and a single BLOB
    document.  Returns the snippet result.

  NOTES
*/
function policy_snippet (
  policy_name		IN  VARCHAR2,
  document  		IN  BLOB,
  text_query  		IN  VARCHAR2,
  language  		IN  VARCHAR2  default NULL,
  format  		IN  VARCHAR2  default NULL,
  charset  		IN  VARCHAR2  default NULL,
  starttag  		IN  VARCHAR2  default '<b>',
  endtag  		IN  VARCHAR2  default '</b>',
  entity_translation  	IN  BOOLEAN   default TRUE,
  separator  		IN  VARCHAR2  default '<b>...</b>',
  radius                IN  NUMBER    default 25,
  max_length            IN  NUMBER    default 150
)  return varchar2;

function policy_snippet_clob_query (
  policy_name		IN  VARCHAR2,
  document  		IN  BLOB,
  text_query     	IN  CLOB,
  language  		IN  VARCHAR2  default NULL,
  format  		IN  VARCHAR2  default NULL,
  charset  		IN  VARCHAR2  default NULL,
  starttag  		IN  VARCHAR2  default '<b>',
  endtag  		IN  VARCHAR2  default '</b>',
  entity_translation  	IN  BOOLEAN   default TRUE,
  separator  		IN  VARCHAR2  default '<b>...</b>',
  radius                IN  NUMBER    default 25,
  max_length            IN  NUMBER    default 150
)  return varchar2;

/*----------------------------- policy_snippet ----------------------*/
/* NAME
     policy_snippet - return snippet (kwic or concordaace) for a given document

  DESCRIPTION
    This version of snippet accepts a policy name and a single BLOB
    document.  Returns the snippet result.

  NOTES
*/
function policy_snippet (
  policy_name		IN  VARCHAR2,
  document  		IN  BFILE,
  text_query  		IN  VARCHAR2,
  language  		IN  VARCHAR2  default NULL,
  format  		IN  VARCHAR2  default NULL,
  charset  		IN  VARCHAR2  default NULL,
  starttag  		IN  VARCHAR2  default '<b>',
  endtag  		IN  VARCHAR2  default '</b>',
  entity_translation  	IN  BOOLEAN   default TRUE,
  separator  		IN  VARCHAR2  default '<b>...</b>',
  radius                IN  NUMBER    default 25,
  max_length            IN  NUMBER    default 150
)  return varchar2;

function policy_snippet_clob_query (
  policy_name		IN  VARCHAR2,
  document  		IN  BFILE,
  text_query     	IN  CLOB,
  language  		IN  VARCHAR2  default NULL,
  format  		IN  VARCHAR2  default NULL,
  charset  		IN  VARCHAR2  default NULL,
  starttag  		IN  VARCHAR2  default '<b>',
  endtag  		IN  VARCHAR2  default '</b>',
  entity_translation  	IN  BOOLEAN   default TRUE,
  separator  		IN  VARCHAR2  default '<b>...</b>',
  radius                IN  NUMBER    default 25,
  max_length            IN  NUMBER    default 150
)  return varchar2;

/*----------------------------- pkencode --------------------------------*/
/*
  NAME
    PKENCODE(pk1,pk2,pk3,pk4,pk5,pk6,pk7,pk8,pk9,pk10,pk11,pk12,pk13,
             pk14,pk15,pk16)
  DESCRIPTION
    encoding a list of pk strings into one; the resulting string
    has the ',' and '\' escapped by an extra '\'.
    comma ',' is used as delimiter between pk's.
    it is used in composite textkeys
    e.g., ('p,1','p\2','p3') => 'p\,1,p\\2,p3'

  ARGUMENTS
    pk1-pk16  - textkey list

  RETURN
    encoded pkstring
*/
FUNCTION pkencode(
  pk1  IN varchar2,              pk2  IN varchar2 default NULL,
  pk3  IN varchar2 default NULL, pk4  IN varchar2 default NULL,
  pk5  IN varchar2 default NULL, pk6  IN varchar2 default NULL,
  pk7  IN varchar2 default NULL, pk8  IN varchar2 default NULL,
  pk9  IN varchar2 default NULL, pk10 IN varchar2 default NULL,
  pk11 IN varchar2 default NULL, pk12 IN varchar2 default NULL,
  pk13 IN varchar2 default NULL, pk14 IN varchar2 default NULL,
  pk15 IN varchar2 default NULL, pk16 IN varchar2 default NULL
   )
return varchar2;
PRAGMA RESTRICT_REFERENCES(pkencode, WNDS, WNPS, RNDS, RNPS);

/*----------------------------- ifilter ----------------------------------*/
/*
  NAME
    ifilter

  DESCRIPTION
    Takes binary data(BLOB), filters the data through INSO and writes the
    text version to a CLOB

  ARGUMENTS
    data    (IN)     BLOB
    TEXT    (IN OUT) CLOB

  NOTES
    text is APPENDed to the CLOB -- so existing contents are not
    disturbed.  It is the client's responsibility to ensure that
    the CLOB is trucated before the ifilter call if the existing
    content is not needed.

  RETURN
*/
PROCEDURE ifilter(
  data   IN            blob,
  text   IN OUT nocopy clob
);

END ctx_doc;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."CTX_OUTPUT" as

  /* print each ROWID as it is indexed */
  EVENT_INDEX_PRINT_ROWID constant number := 1;

  /* print tokens as they are indexed by sync or create index */
  EVENT_INDEX_PRINT_TOKEN constant number := 4;

  /* print tokens as they are optimized */
  EVENT_OPT_PRINT_TOKEN constant number := 2;

  /* trace DRG errors */
  EVENT_DRG_DUMP_ERRORSTACK constant number := 8;
  DRG_DUMP_ALL_ERRORS       constant number := -1;

  TRACE_IDX_USER_DATASTORE constant number :=  1;
  TRACE_IDX_INSO_FILTER    constant number :=  2;
  TRACE_IDX_AUTO_FILTER    constant number :=  2;
  TRACE_QRY_XX_TIME        constant number :=  3;
  TRACE_QRY_XF_TIME        constant number :=  4;
  TRACE_QRY_X_ROWS         constant number :=  5;
  TRACE_QRY_IF_TIME        constant number :=  6;
  TRACE_QRY_IR_TIME        constant number :=  7;
  TRACE_QRY_I_ROWS         constant number :=  8;
  TRACE_QRY_I_SIZE         constant number :=  9;
  TRACE_QRY_R_TIME         constant number := 10;
  TRACE_QRY_CON_TIME       constant number := 11;
  TRACE_QRY_K_TIME         constant number := 12;
  TRACE_QRY_S_TIME         constant number := 15;
  TRACE_QRY_O_TIME         constant number := 19;
  TRACE_QRY_OR_TIME        constant number := 20;
  TRACE_QRY_O_ROWS         constant number := 21;
  TRACE_QRY_O_SIZE         constant number := 22;
  TRACE_QRY_D_TIME         constant number := 23;
  TRACE_QRY_SUBSTR_TIME    constant number := 24;
  TRACE_QRY_SNIPPET_TIME   constant number := 25;
  TRACE_HIL_DOCSERV_TIME   constant number := 26;
  TRACE_QRY_FACET_TOT_TIME constant number := 27;
  TRACE_QRY_FACET_INI_TIME constant number := 28;
  TRACE_QRY_FACET_EXC_TIME constant number := 29;
  TRACE_QRY_FACET_OUT_TIME constant number := 30;
  TRACE_QRY_MVTOK_ROWS     constant number := 31;
  TRACE_QRY_MVTOK_SIZE     constant number := 32;
  TRACE_CTXTREE_GETDS_TIME constant number := 33;
  TRACE_CTXTREE_ADDND_TIME constant number := 34;
  TRACE_CTXTREE_GETND_TIME constant number := 35;
  TRACE_CTXTREE_REMND_TIME constant number := 36;
  TRACE_QRY_VV_TIME        constant number := 37;
  TRACE_QRY_VF_TIME        constant number := 38;
  TRACE_QRY_V_ROWS         constant number := 39;

  -- 0, 13, 14, 16-18 reserved for internal use

/*------------------------------- start_log ---------------------------------*/
/*
  NAME
   start_log - begin logging index and document service requests

  DESCRIPTION

  ARGUMENTS
    logfile   (IN)   logfile name
    overwrite (IN)   overwrite existing log file if any (default is TRUE)

  RETURNS
   none

  NOTES
*/

procedure start_log(
  logfile in varchar2,
  overwrite in boolean DEFAULT true
);
/*------------------------------- start_query_log --------------------------*/
/*
  NAME
   start_query_log - begin logging query against context index

  DESCRIPTION

  ARGUMENTS
    logfile  (IN)   logfile name
    overwrite (IN)   overwrite existing log file if any (default is TRUE)

  RETURNS
   none

  NOTES
*/

procedure start_query_log(
  logfile in varchar2,
  overwrite in boolean DEFAULT true
);

/*------------------------------- add_event -------------------------------*/
/*
  NAME
   add_event - add an event to the logging event list

  DESCRIPTION

  ARGUMENTS
    event  (IN)   event number

  RETURNS
   none

  NOTES
*/

procedure add_event(
  event in number,
  errnum in number := null
);

/*------------------------------- remove_event ----------------------------*/
/*
  NAME
   remove_event - remove an event from the logging event list

  DESCRIPTION

  ARGUMENTS
    event  (IN)   event number

  RETURNS
   none

  NOTES
*/

procedure remove_event(
  event in number,
  errnum in number := null
);

/*------------------------------- end_log ---------------------------------*/
/*
  NAME
   end_log - halt logging index and document service requests

  DESCRIPTION

  ARGUMENTS

  RETURNS
   none

  NOTES
*/

procedure end_log;

/*------------------------------- end_query_log -----------------------------*/
/*
  NAME
   end_query_log - halt query logging

  DESCRIPTION

  ARGUMENTS

  RETURNS
   none

  NOTES
*/

procedure end_query_log;


/*---------------------------- logfilename ---------------------------------*/
/*
  NAME
   logfilename - returns the current log file name

  DESCRIPTION

  ARGUMENTS

  RETURNS
   log file name

  NOTES
*/
function logfilename return varchar2;

/*-------------------------- logfileoverwrite -------------------------------*/
/*
  NAME
   logfileoverwrite - returns the current overwrite setting

  DESCRIPTION

  ARGUMENTS

  RETURNS
   log file overwrite setting

  NOTES
*/
function logfileoverwrite return boolean;

/*-------------------------- dumpederrors -----------------------------------*/
/*
  NAME
   dumpederrors - returns an array of all current errors with stack traces
  DESCRIPTION

  ARGUMENTS

  RETURNS
   dumped errors array

  NOTES
*/
function dumpederrors return dr$numtable;

/*---------------------------- add_trace ---------------------------------*/
/*
  NAME
    add_trace - enable trace specfied in the trace_id argument

  DESCRIPTION

  ARGUMENTS

  RETURNS

  NOTES
*/
procedure add_trace(trace_id binary_integer);

/*-------------------------- remove_trace ---------------------------------*/
/*
  NAME
    remove_trace - disable trace specfied in the trace_id argument

  DESCRIPTION

  ARGUMENTS

  RETURNS

  NOTES
*/
procedure remove_trace(trace_id binary_integer);

/*-------------------------- reset_trace --------------------------------*/
/*
  NAME
    reset_trace - reset trace specfied in the trace_id argument

  DESCRIPTION
    resets the specified trace to 0.

  ARGUMENTS

  RETURNS

  NOTES
*/
procedure reset_trace(trace_id binary_integer);

/*--------------------------- log_traces ---------------------------------*/
/*
  NAME
    log_traces - dumps all active traces to the logfile

  DESCRIPTION

  ARGUMENTS

  RETURNS

  NOTES
    the traces are NOT reset to 0.
*/
procedure log_traces;

/*---------------------- get_trace_value ---------------------------------*/
/*
  NAME
    get_trace_value - returns the current value of the specified trace

  DESCRIPTION

  ARGUMENTS

  RETURNS

  NOTES
    the traces are NOT reset to 0.
*/
function get_trace_value(trace_id binary_integer) return number;

/*-------------------------- enable_query_stats -----------------------------*/
/*
  NAME
    enable_query_stats - enables query stats collection

  DESCRIPTION

  ARGUMENTS

  RETURNS

  NOTES

*/
procedure enable_query_stats(indexname varchar2);
PRAGMA SUPPLEMENTAL_LOG_DATA(enable_query_stats, AUTO);

/*-------------------------- disable_query_stats ---------------------------*/
/*
  NAME
    disable_query_stats - disables query stats collection

  DESCRIPTION

  ARGUMENTS

  RETURNS

  NOTES

*/
procedure disable_query_stats(indexname varchar2);
PRAGMA SUPPLEMENTAL_LOG_DATA(disable_query_stats, AUTO);

/*--------------------------- logging ---------------------------------------*/
/*
  NAME
    logging - is logging enabled

  DESCRIPTION
    returns TRUE if logging is enabled through start_log or event
*/
function logging return boolean;

end ctx_output;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."CTX_QUERY" authid current_user as

  -- PREFERENCES FOR QUERY PROCESSING (INTERNAL USE ONLY)
  preference             number not null := 0;
  always_batch  	 constant number := 1;
  order_by      	 constant number := 2;
  postfilter_batch	 constant number := 4;
  sav_incmplt_prg_hitcnt constant number := 32;

  -- FLAG for disable transactional query
  disable_transactional_query  boolean := FALSE;

  -- PUBLIC DATA STRUCTURES
  type BROWSE_REC is record
  (
    word      VARCHAR2(256)  NULL,
    doc_count NUMBER(38,0)   NULL
  );

  type BROWSE_TAB is table of BROWSE_REC index by binary_integer;

  -- PUBLIC CONSTANTS
  BROWSE_BEFORE       constant varchar2(10) := 'BEFORE';
  BROWSE_AROUND       constant varchar2(10) := 'AROUND';
  BROWSE_AFTER        constant varchar2(10) := 'AFTER';

  -- PUBLIC VARIABLES
  result_set_document             clob := NULL;
  gen_rs_only_on_last_seq         integer default 0;
  gen_rs_only_if_last_seq         integer default 0;

/*------------------------------- count_hits ----------------------------*/
/*
  NAME
    count_hits - get quick count of text results

  DESCRIPTION
    count text hits

  ARGUMENTS
    index_name  (IN) index name being queried
    text_query  (IN) text query string
    exact       (IN) exact count or upper bound
    part_name   (IN) index partition name

  NOTES
    none

  RETURNS
    number of hits
*/
FUNCTION count_hits (
  index_name  in varchar2
 ,text_query  in varchar2
 ,exact       in boolean   default TRUE
 ,part_name   in varchar2  default NULL
) return number;

FUNCTION count_hits_clob_query (
  index_name       in varchar2
 ,text_query       in clob
 ,exact            in boolean   default TRUE
 ,part_name        in varchar2  default NULL
) return number;


/*------------------------------- chk_xpath ----------------------------*/
/*
  NAME
    chk_xpath - check  xpath expression

  DESCRIPTION
    takes an xpath expression and return an expression context can
    process.

  ARGUMENTS
    index_name  (IN) index name being queried
    text_query  (IN) xpath expression
    part_name   (IN) index partition name

  NOTES
    none

  RETURNS
    number of hits
*/
FUNCTION chk_xpath (
  index_name  in varchar2
 ,text_query  in varchar2
 ,part_name   in varchar2  default NULL
) return varchar2;

/*------------------------------- fcontains ----------------------------*/
/*
  NAME
    fcontains - functional contains

  DESCRIPTION

  ARGUMENTS
    text_value    (IN) text to search
    text_query    (IN) text query
    policy_name   (IN) policy name

  NOTES
    none

  RETURNS
    score
*/
FUNCTION fcontains (
  text_value  in varchar2
 ,text_query  in varchar2
 ,policy_name in varchar2
) return number;

/*---------------------- chk_txnqry_disbl_switch --------------------------*/
/*
  NAME
    chk_txnqry_disbl_switch

  DESCRIPTION

  ARGUMENTS

  NOTES
    none

  RETURNS
    0 or 1
*/
FUNCTION chk_txnqry_disbl_switch
return number;

/*------------------------------- store_sqe ----------------------------*/
/*
  NAME
    store_sqe

  DESCRIPTION
    Create a stored query

  ARGUMENTS
    query_name  (IN) name of a stored query
    text_query  (IN) text query string
    duration    (IN) session or persistent duration
  NOTES
  EXCEPTIONS
    ORA-20000 - application error ( with an textile error stack)
  RETURNS
    none
*/

DURATION_PERSISTENT constant number := 0;
DURATION_SESSION    constant number := 1;

PROCEDURE store_sqe(
  query_name in varchar2
 ,text_query in varchar2
 ,duration   in number default DURATION_PERSISTENT
);

PROCEDURE store_sqe_clob_query(
  query_name      in varchar2
 ,text_query      in clob
 ,duration        in number default DURATION_PERSISTENT
);

/* In-Memory Session Duration SQE */
TYPE sess_sqe_t is table of varchar2(32000) index by varchar2(64);
sess_sqe sess_sqe_t;

/*------------------------------- remove_sqe ----------------------------*/
/*
  NAME
    remove_sqe

  DESCRIPTION
    Delete a stored query

  ARGUMENTS
    query_name   (IN) name of a stored query

  NOTES

  EXCEPTIONS
    ORA-20000 - application error ( with an textile error stack)

  RETURNS
    none
*/
PROCEDURE remove_sqe(
 query_name in varchar2
);

/*------------------------------ explain ----------------------------------*/
/*
  NAME
    explain

  DESCRIPTION
    Evaluate the query specified in 'text_query' parameter and return
    the Query Execution Plan in the feedback table.  Do NOT execute the
    query.

  ARGUMENTS
    index_name    (IN) index name being queried
    text_query     (IN) ConText query string
    explain_table (IN) the result table to receive the feedback result
    sharelevel     (IN) feedback table share options:
                        0 = single-use, 1 = multiple-use.
    explain_id    (IN) ID to identify results returned
    part_name     (IN) index partition name
  NOTES
    none
  EXCEPTIONS
    ORA-20000 - application error (with a textile error stack)
  RETURNS
    none
*/
PROCEDURE explain(
  index_name   in varchar2,
  text_query    in varchar2,
  explain_table in varchar2,
  sharelevel    in number default 0,
  explain_id    in varchar2 default NULL,
  part_name     in varchar2 default NULL
);
PRAGMA SUPPLEMENTAL_LOG_DATA(explain, AUTO);

PROCEDURE explain_clob_query(
  index_name         in varchar2,
  text_query         in clob,
  explain_table      in varchar2,
  sharelevel         in number default 0,
  explain_id         in varchar2 default NULL,
  part_name          in varchar2 default NULL
);

/*------------------------------ hfeedback ----------------------------------*/
/*
  NAME
    hfeedback

  DESCRIPTION
    Evaluate the query specified in 'text_query' parameter and return
    the Hierarchical Query Feedback in the feedback table.  Do NOT execute the
    query.

  ARGUMENTS
    index_name     (IN) index name being queried
    text_query     (IN) ConText query string
    feedback_table (IN) the result table to receive the feedback result
    sharelevel     (IN) feedback table share options:
                        0 = single-use, 1 = multiple-use.
    feedback_id    (IN) ID to identify results returned
    part_name      (IN) index partition name
  NOTES
    none
  EXCEPTIONS
    ORA-20000 - application error (with a textile error stack)
  RETURNS
    none
*/
PROCEDURE hfeedback(
  index_name     in varchar2,
  text_query     in varchar2,
  feedback_table in varchar2,
  sharelevel     in number default 0,
  feedback_id    in varchar2 default NULL,
  part_name      in varchar2 default NULL
);
PRAGMA SUPPLEMENTAL_LOG_DATA(hfeedback, AUTO);

PROCEDURE hfeedback_clob_query(
  index_name          in varchar2,
  text_query          in clob,
  feedback_table      in varchar2,
  sharelevel          in number default 0,
  feedback_id         in varchar2 default NULL,
  part_name           in varchar2 default NULL
);
PRAGMA SUPPLEMENTAL_LOG_DATA(hfeedback_clob_query, AUTO);

/*------------------------------ browse_words ------------------------------*/
/*
  NAME
    browse_words

  DESCRIPTION

  ARGUMENTS
    index_name     (IN) index name being queried
    seed           (IN) seed word
    restab         (IN) the result table
    browse_id      (IN) ID to identify results returned
    numwords       (IN) length of the produced list
    direction      (IN) direction of the browse
    part_name      (IN) index partition name
    token_type     (IN) token type

  NOTES

  EXCEPTIONS

  RETURNS
*/
PROCEDURE browse_words(
  index_name  in   varchar2,
  seed        in   varchar2,
  restab      in   varchar2,
  browse_id   in   number   default 0,
  numwords    in   number   default 10,
  direction   in   varchar2 default BROWSE_AROUND,
  part_name   in   varchar2 default NULL,
  token_type  in   number default 0
);

/*------------------------------ browse_words ------------------------------*/
/*
  NAME
    browse_words

  DESCRIPTION

  ARGUMENTS
    index_name     (IN) index name being queried
    seed           (IN) seed word
    resarr         (IN OUT) PL/SQL array
    numwords       (IN) length of the produced list
    direction      (IN) direction of the browse
    part_name      (IN) index partition name
    token_type     (IN) token type
  NOTES

  EXCEPTIONS

  RETURNS
*/
PROCEDURE browse_words(
  index_name  in             varchar2,
  seed        in             varchar2,
  resarr      in out  NOCOPY BROWSE_TAB,
  numwords    in             number   default 10,
  direction   in             varchar2 default BROWSE_AROUND,
  part_name   in             varchar2 default NULL,
  token_type  in             number default 0
);

/*------------------------------ result_set ---------------------------------*/
/*
  NAME
    result_set

  DESCRIPTION

  ARGUMENTS
    index_name     (IN) index name being queried
    query          (IN) text query
    result_set_descriptor (IN) result set descriptor
    result_set     (IN OUT) result set
    part_name      (IN) index partition name
  NOTES

  EXCEPTIONS

  RETURNS
*/
PROCEDURE result_set(
  index_name             in            varchar2,
  query                  in            varchar2,
  result_set_descriptor  in            clob,
  result_set             in out nocopy clob,
  part_name              in            varchar2 default NULL
);

PROCEDURE result_set_clob_query(
  index_name             in            varchar2,
  query                  in            clob,
  result_set_descriptor  in            clob,
  result_set             in out nocopy clob,
  part_name              in            varchar2 default NULL
);

end ctx_query;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."CTX_THES" AS

type exp_rec is record (
  xrel    varchar2(12),
  xlevel  number,
  xphrase varchar2(256)
);
type exp_tab is table of exp_rec index by binary_integer;

-- public constants

OP_RENAME          constant  varchar2(6) := 'RENAME';
OP_TRUNCATE        constant  varchar2(8) := 'TRUNCATE';
OP_PT              constant  varchar2(2) := 'PT';
OP_SN              constant  varchar2(2) := 'SN';

/*========================================================================*/
/*                     Thesaurus Maintenance Functions                    */
/*========================================================================*/

/*--------------------------- create_thesaurus ---------------------------*/
/*
   NAME
     create_thesaurus - create a new thesaurus

   DESCRIPTION
     This procedure creates a new thesaurus with the indicated name

   ARGUMENTS
     name    -- the new thesaurus name
     casesens -- case-sensitive
   NOTES
     error if the thesaurus already exists
     Only ctxsys or user with ctxapp role can use this

   RETURN
*/
procedure create_thesaurus(
  name in varchar2
, casesens in boolean default false
);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_thesaurus, AUTO);

/*--------------------------- drop_thesaurus ---------------------------*/
/*
   NAME
     drop_thesaurus - drop a thesaurus

   DESCRIPTION
     This procedure drops an existing thesaurus with the indicated name

   ARGUMENTS
     name    -- the thesaurus name

   NOTES
     error if the thesaurus already exists
     Only ctxsys or thesaurus owner should be able to drop a thesaurus

   RETURN
*/
procedure drop_thesaurus(name in varchar2);
PRAGMA SUPPLEMENTAL_LOG_DATA(drop_thesaurus, AUTO);

/*--------------------------- alter_thesaurus ---------------------------*/
/* NAME
     alter_thesaurus -- alter an existing thesaurus

   DESCRIPTION
     This procedure rename or truncate a thesaurus.

   ARGUMENTS
     tname    --  thesaurus name
     op       --  alter operation, one of 'RENAME' or 'TRUNCATE'
     operand  --  argument to the alter operation
                  RENAME        new thesaurus name
                  TRUNCATE      null
   NOTES
     Only thesaurus owner and ctxsys are allowed to invoke this
     function on a given thesaurus

   RETURN

*/
procedure alter_thesaurus(tname    in   varchar2,
                          op       in   varchar2,
                          operand  in   varchar2 default null);
PRAGMA SUPPLEMENTAL_LOG_DATA(alter_thesaurus, AUTO);

/*--------------------------- import_thesaurus ---------------------------*/
/* NAME
     import_thesaurus -- imports thesaurus

   DESCRIPTION
     This procedure loads a thesaurus

   ARGUMENTS
   name      --  thesaurus name
   data	     --  thesaurus data
   casesens  --  'Y' for case sensitive, 'N' for case-insensitive

   NOTES
     Only thesaurus owner and ctxsys are allowed to invoke this
     function on a given thesaurus

   RETURN

*/
procedure import_thesaurus(name      in   varchar2,
                           data      in   clob,
                           casesens  in   varchar2 default 'N');
PRAGMA SUPPLEMENTAL_LOG_DATA(import_thesaurus, AUTO);

/*--------------------------- export_thesaurus ---------------------------*/
/* NAME
     export_thesaurus -- exports thesaurus

   DESCRIPTION
     This procedure dumps thesaurus to a clob

   ARGUMENTS
   name      --  thesaurus name
   thesdump  --  result lob
   NOTES
     Only thesaurus owner and ctxsys are allowed to invoke this
     function on a given thesaurus

   RETURN

*/
procedure export_thesaurus (name      in   varchar2,
                            thesdump  in out nocopy clob);

/*--------------------------- create_phrase -----------------------------*/
/*
   NAME
     create_phrase -- add a phrase to a thesaurus

   DESCRIPTION
     This procedure adds a phrase to the thesaurus

   ARGUMENTS
     tname    --  thesaurus name
     phrase   --  phrase to add
     rel      --  DEPRECATED
     relname  --  DEPRECATED

   NOTES
     no error if the information already exists.
     Only ctxsys or user with ctxapp role can use this

     REL and RELNAME arguments are deprecated -- use create_relation
     instead.

   RETURN
*/
procedure create_phrase(tname      in varchar2,
                       phrase     in varchar2,
	               rel        in varchar2 default null,
                       relname    in varchar2 default null);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_phrase, AUTO);

/*--------------------------- drop_phrase -----------------------------*/
/*
   NAME
     drop_phrase -- drop a phrase from a thesaurus

   DESCRIPTION
     This procedure drops a phrase from the thesaurus

   ARGUMENTS
     tname    --  thesaurus name
     phrase   --  phrase to drop

   NOTES
     BT* / NT* relations are patched around the dropped phrase

   RETURN
*/
procedure drop_phrase(tname      in varchar2,
                      phrase     in varchar2);
PRAGMA SUPPLEMENTAL_LOG_DATA(drop_phrase, AUTO);

/*--------------------------- alter_phrase -----------------------------*/
/*
   NAME
     alter_phrase -- alter an existing phrase in a thesaurus

   DESCRIPTION
     This procedure alters a phrase in a thesaurus.

   ARGUMENTS
     tname    --  thesaurus name
     phrase   --  phrase to alter
     op       --  alter operation. should be one of 'RENAME', 'PT' ,'SN'
     operand  --  argument to the alter operation
                  PT          null
                  RENAME      new phrase name
                  SN          new scope note

   NOTES
     Only ctxsys or thesaurus owner can alter a phrase

   RETURN
*/
procedure alter_phrase(tname      in varchar2,
                       phrase     in varchar2,
                       op         in varchar2,
                       operand    in varchar2 default null);
PRAGMA SUPPLEMENTAL_LOG_DATA(alter_phrase, AUTO);

/*--------------------------- create_relation -----------------------------*/
/*
   NAME
     create_relation -- create a relation

   DESCRIPTION
     This procedure creates a relation between two phrases

   ARGUMENTS
     tname     --  thesaurus name
     phrase    --  the filing phrase
     rel       --  relation to create
     relphrase --  the related phrase

   NOTES
     Only ctxsys or thesaurus owner can create a relation

     if either phrase or relphrase do not exist, they are created
     as part of this call.

     phrase is the filing phrase and relphrase is the related phrase,
     so a thesaurus like this:

     A
      BT B

     would be translated as

     create_phrase('THES', 'A');
     create_phrase('THES', 'B');
     create_relation('THES','A','BT','B');

   RETURN
*/
procedure create_relation(tname     in    varchar2,
                          phrase    in    varchar2,
                          rel       in    varchar2,
                          relphrase in    varchar2);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_relation, AUTO);

/*--------------------------- drop_relation -----------------------------*/
/*
   NAME
     drop_relation -- drop a relation

   DESCRIPTION
     This procedure drops a relation between two phrases

   ARGUMENTS
     tname     --  thesaurus name
     phrase    --  the filing phrase
     rel       --  relation to drop
     relphrase --  the related phrase

   NOTES
     Only ctxsys or thesaurus owner can drop a relation
     phrase is the filing phrase and relphrase is the related phrase,
     so a relation like this:

     A
      BT B

     would be dropped as

     drop_relation('THES','A','BT','B');

     this is symmetric with create_relation

   RETURN
*/
procedure drop_relation(tname     in    varchar2,
                        phrase    in    varchar2,
                        rel       in    varchar2,
                        relphrase in    varchar2 default null);
PRAGMA SUPPLEMENTAL_LOG_DATA(drop_relation, AUTO);

/*-------------------------- create_translation -----------------------------*/
/*
   NAME
     create_translation -- create a translation

   DESCRIPTION
     This procedure creates a new translation for a phrase

   ARGUMENTS
     tname       --  thesaurus name
     phrase      --  phrase in the thesaurus to which to add a translation
     language    --  language of the translation
     translation -- translated term

   NOTES
     Only ctxsys or thesaurus owner can create a relation.

     Phrase must already exist in the thesarus, or an error is raised.

     If a translation for this phrase for this language already exists,
     this new translation is added without removing that original
     translation, so long as that original translation is not the same.

   RETURN
*/
procedure create_translation(tname       in    varchar2,
                             phrase      in    varchar2,
                             language    in    varchar2,
                             translation in    varchar2);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_translation, AUTO);

/*-------------------------- drop_translation -----------------------------*/
/*
   NAME
     drop_translation -- drop a translation

   DESCRIPTION
     This procedure drops one or more translations for a phrase

   ARGUMENTS
     tname       --  thesaurus name
     phrase      --  phrase in the thesaurus to which to add a translation
     language    --  language of the translation
     translation -- translated term

   NOTES
     Only ctxsys or thesaurus owner can drop a relation.

     Phrase must already exist in the thesarus, or an error is raised.

     Language is optional. If not specified, translation must also be
     not specified, and all translations in all languages for the
     phrase are removed. An error is raised if the phrase has no
     translation.

   RETURN
*/
procedure drop_translation(tname       in    varchar2,
                           phrase      in    varchar2,
                           language    in    varchar2 default null,
                           translation in    varchar2 default null);
PRAGMA SUPPLEMENTAL_LOG_DATA(drop_translation, AUTO);

/*-------------------------- update_translation -----------------------------*/
/*
   NAME
     update_translation -- update a translation

   DESCRIPTION
     This procedure updates an existing translation

   ARGUMENTS
     tname       --  thesaurus name
     phrase      --  phrase in the thesaurus to which to add a translation
     language    --  language of the translation
     translation -- translated term
     new_translation -- new form of translated term

   NOTES
     Only ctxsys or thesaurus owner can update a relation.

     Phrase must already exist in the thesarus, or an error is raised.

     Translation can be passed in as NULL if there is only on translation
     for the specified language for this error.  An error will be raised
     if there is more than one translation for the term in the specified
     language

     The translation must already exist, or an error is raised.

   RETURN
*/
procedure update_translation(tname       in     varchar2,
                             phrase      in     varchar2,
                             language    in     varchar2,
                             translation in     varchar2,
                             new_translation in varchar2);
PRAGMA SUPPLEMENTAL_LOG_DATA(update_translation, AUTO);

/*========================================================================*/
/*                            Expansion Functions                         */
/*========================================================================*/

/*---------------------------- output_style --------------------------------*/
/*
   NAME
     output_style

   DESCRIPTION
     set the output style for the expansion functions

   ARGUMENTS
     showlevel   -- show level in bt/nt expansions
     showqualify -- show phrase qualifiers
     showpt      -- show preferred terms with *
     showid      -- show phrase ids

   NOTES
     level is a number then a colon at the start of the phrase
     pt is an asterisk then a colon at the start of the phrase
     id is a colon, then the id at the end of the phrase
     qualify is in parens after a space at the end of the phrase
        but before id

   example:

     preferred term
     |
     |   phrase
     |   |
     |   |      qualifier
     |   |      |
     |   |      |      phraseid
     |   |      |      |
     V   V      V      V
    {*:TURKEY (BIRD):1234}

   RETURN
*/
PROCEDURE output_style (
  showlevel   in boolean default false
, showqualify in boolean default false
, showpt      in boolean default false
, showid      in boolean default false
);

/*-------------------------------- syn ------------------------------------*/
/*
   NAME
     syn  -- find synonyms of a term

   DESCRIPTION
     This procedure finds all synonyms of a term, and returns a string
     like this:  {syn1},{syn2},{syn3} ...

   ARGUMENTS
     restab   --  result table (for pl/sql table version)
     phrase   --  phrase
     tname    --  thesaurus name (if not specified, system default thes used)

   RETURN
     see description
*/
function syn(phrase in varchar2,
             tname in varchar2 default 'DEFAULT') return varchar2;

procedure syn(restab in out NOCOPY exp_tab,
              phrase in varchar2,
              tname in varchar2 default 'DEFAULT');

/*-------------------------------- pt  ------------------------------------*/
/*
   NAME
     pt  -- find preferred term

   ARGUMENTS
     restab   --  result table (for pl/sql table version)
     phrase   --  phrase
     tname    --  thesaurus name (if not specified, system default  used)
   RETURN
     expansion

*/
function pt(phrase in varchar2,
             tname in varchar2 default 'DEFAULT') return varchar2;

procedure pt(restab in out NOCOPY exp_tab,
             phrase in varchar2,
             tname in varchar2 default 'DEFAULT');

/*-------------------------------- tt  ------------------------------------*/
/*
   NAME
     tt  -- find top term

   ARGUMENTS
     restab   --  result table (for pl/sql table version)
     phrase   --  phrase
     tname    --  thesaurus name (if not specified, system default  used)
   RETURN
     expansion

*/
function tt(phrase in varchar2,
             tname in varchar2 default 'DEFAULT') return varchar2;

procedure tt(restab in out NOCOPY exp_tab,
             phrase in varchar2,
             tname in varchar2 default 'DEFAULT');

/*-------------------------------- rt  ------------------------------------*/
/*
   NAME
     rt  -- find related term

   ARGUMENTS
     restab   --  result table (for pl/sql table version)
     phrase   --  phrase
     tname    --  thesaurus name (if not specified, system default  used)
   RETURN
     expansion

*/
function rt(phrase in varchar2,
	     tname in varchar2 default 'DEFAULT') return varchar2;

procedure rt(restab in out NOCOPY exp_tab,
             phrase in varchar2,
             tname in varchar2 default 'DEFAULT');

/*-------------------------------- bt  ------------------------------------*/
/*
   NAME
     bt -- find broader terms of a phrase

   DESCRIPTION
     This procedure finds all broader terms of a term, and returns a string
     like this:  {bt1},{bt2},{bt3} ...

   ARGUMENTS
     restab   --  result table (for pl/sql table version)
     phrase   --  phrase
     lvl      --  how many levels up (i.e. 2 means get the broader terms of
                     the broader terms of the phrase)
     tname    --  thesaurus name (if not specified, system default thes used)

   NOTES
   RETURN
     see description
*/
function bt( phrase in varchar2,
            lvl    in number default 1,
            tname  in varchar2 default 'DEFAULT') return varchar2;

procedure bt(restab in out NOCOPY exp_tab,
             phrase in varchar2,
             lvl    in number default 1,
             tname  in varchar2 default 'DEFAULT');

/*-------------------------------- btp ------------------------------------*/
/*
   NAME
     btp -- find broader terms (partative) of a phrase

   DESCRIPTION
     This procedure finds all broader terms of a term, and returns a string
     like this:  {bt1},{bt2},{bt3} ...

   ARGUMENTS
     restab   --  result table (for pl/sql table version)
     phrase   --  phrase
     lvl      --  how many levels up (i.e. 2 means get the broader terms of
                     the broader terms of the phrase)
     tname    --  thesaurus name (if not specified, system default thes used)

   NOTES
   RETURN
     see description
*/
function btp( phrase in varchar2,
            lvl    in number default 1,
            tname  in varchar2 default 'DEFAULT') return varchar2;

procedure btp(restab in out NOCOPY exp_tab,
              phrase in varchar2,
              lvl    in number default 1,
              tname  in varchar2 default 'DEFAULT');

/*-------------------------------- bti ------------------------------------*/
/*
   NAME
     bti -- find broader terms (instance) of a phrase

   DESCRIPTION
     This procedure finds all broader terms of a term, and returns a string
     like this:  {bt1},{bt2},{bt3} ...

   ARGUMENTS
     restab   --  result table (for pl/sql table version)
     phrase   --  phrase
     lvl      --  how many levels up (i.e. 2 means get the broader terms of
                     the broader terms of the phrase)
     tname    --  thesaurus name (if not specified, system default thes used)

   NOTES
   RETURN
     see description
*/
function bti( phrase in varchar2,
            lvl    in number default 1,
            tname  in varchar2 default 'DEFAULT') return varchar2;

procedure bti(restab in out NOCOPY exp_tab,
              phrase in varchar2,
              lvl    in number default 1,
              tname  in varchar2 default 'DEFAULT');

/*-------------------------------- btg ------------------------------------*/
/*
   NAME
     btg -- find broader terms (generic) of a phrase

   DESCRIPTION
     This procedure finds all broader terms of a term, and returns a string
     like this:  {bt1},{bt2},{bt3} ...

   ARGUMENTS
     restab   --  result table (for pl/sql table version)
     phrase   --  phrase
     lvl      --  how many levels up (i.e. 2 means get the broader terms of
                     the broader terms of the phrase)
     tname    --  thesaurus name (if not specified, system default thes used)

   NOTES
   RETURN
     see description
*/
function btg( phrase in varchar2,
            lvl    in number default 1,
            tname  in varchar2 default 'DEFAULT') return varchar2;

procedure btg(restab in out NOCOPY exp_tab,
              phrase in varchar2,
              lvl    in number default 1,
              tname  in varchar2 default 'DEFAULT');

/*-------------------------------- nt  ------------------------------------*/
/*
   NAME
     nt -- find narrower terms of a phrase

   DESCRIPTION
     This procedure finds all narrower terms of a term, and returns a string
     like this:  {nt1},{nt2},{nt3} ...

   ARGUMENTS
     restab   --  result table (for pl/sql table version)
     phrase   --  phrase
     lvl      --  how many levels down (i.e. 2 means get the narrower terms of
                     the narrower terms of the phrase)
     tname    --  thesaurus name (if not specified, system default thes used)

   NOTES
   RETURN
     see description
*/
function nt(phrase in varchar2,
            lvl    in number default 1,
            tname  in varchar2 default 'DEFAULT') return varchar2;

procedure nt(restab in out NOCOPY exp_tab,
             phrase in varchar2,
             lvl    in number default 1,
             tname  in varchar2 default 'DEFAULT');

/*-------------------------------- ntp ------------------------------------*/
/*
   NAME
     ntp -- find narrower terms (partative)  of a phrase

   DESCRIPTION
     This procedure finds all narrower terms of a term, and returns a string
     like this:  {nt1},{nt2},{nt3} ...

   ARGUMENTS
     restab   --  result table (for pl/sql table version)
     phrase   --  phrase
     lvl      --  how many levels down (i.e. 2 means get the narrower terms of
                     the narrower terms of the phrase)
     tname    --  thesaurus name (if not specified, system default thes used)

   NOTES
   RETURN
     see description
*/
function ntp(phrase in varchar2,
            lvl    in number default 1,
            tname  in varchar2 default 'DEFAULT') return varchar2;

procedure ntp(restab in out NOCOPY exp_tab,
              phrase in varchar2,
              lvl    in number default 1,
              tname  in varchar2 default 'DEFAULT');

/*-------------------------------- nti ------------------------------------*/
/*
   NAME
     nti -- find narrower terms (instance)  of a phrase

   DESCRIPTION
     This procedure finds all narrower terms of a term, and returns a string
     like this:  {nt1},{nt2},{nt3} ...

   ARGUMENTS
     restab   --  result table (for pl/sql table version)
     phrase   --  phrase
     lvl      --  how many levels down (i.e. 2 means get the narrower terms of
                     the narrower terms of the phrase)
     tname    --  thesaurus name (if not specified, system default thes used)

   NOTES
   RETURN
     see description
*/
function nti(phrase in varchar2,
            lvl    in number default 1,
            tname  in varchar2 default 'DEFAULT') return varchar2;

procedure nti(restab in out NOCOPY exp_tab,
              phrase in varchar2,
              lvl    in number default 1,
              tname  in varchar2 default 'DEFAULT');

/*-------------------------------- ntg ------------------------------------*/
/*
   NAME
     ntg -- find narrower terms (generic)  of a phrase

   DESCRIPTION
     This procedure finds all narrower terms of a term, and returns a string
     like this:  {nt1},{nt2},{nt3} ...

   ARGUMENTS
     restab   --  result table (for pl/sql table version)
     phrase   --  phrase
     lvl      --  how many levels down (i.e. 2 means get the narrower terms of
                     the narrower terms of the phrase)
     tname    --  thesaurus name (if not specified, system default thes used)

   NOTES
   RETURN
     see description
*/
function ntg(phrase in varchar2,
            lvl    in number default 1,
            tname  in varchar2 default 'DEFAULT') return varchar2;

procedure ntg(restab in out NOCOPY exp_tab,
              phrase in varchar2,
              lvl    in number default 1,
              tname  in varchar2 default 'DEFAULT');

/*-------------------------------- tr  ------------------------------------*/
/*
   NAME
     TR -- find foreign language equivalent

   DESCRIPTION
     This procedure finds all foreign terms of a term, and returns a string
     like this:  {ft1},{ft2},{ft3} ...

   ARGUMENTS
     restab   --  result table (for pl/sql table version)
     phrase   --  phrase
     lang     --  language
     tname    --  thesaurus name (if not specified, system default thes used)

   NOTES
   RETURN
     see description
*/
function tr(phrase in varchar2,
            lang   in varchar2 default null,
            tname  in varchar2 default 'DEFAULT') return varchar2;

procedure tr(restab in out NOCOPY exp_tab,
             phrase in varchar2,
             lang   in varchar2 default null,
             tname  in varchar2 default 'DEFAULT');

/*-------------------------------- trsyn ----------------------------------*/
/*
   NAME
     TRSYN -- find foreign language equivalent plus its synonyms and their
           foreign language equivalent

   DESCRIPTION
     This procedure finds all foreign terms of a term and its synonyms and
     foreign terms of its synonyms
     synonym, and returns a string
     like this:  {ft1},{ft2},{ft3} ...

   ARGUMENTS
     restab   --  result table (for pl/sql table version)
     phrase   --  phrase
     lang     --  language
     tname    --  thesaurus name (if not specified, system default thes used)

   NOTES
   RETURN
     see description
*/
function trsyn(phrase in varchar2,
              lang   in varchar2 default null,
              tname  in varchar2 default 'DEFAULT') return varchar2;

procedure trsyn(restab in out NOCOPY exp_tab,
                phrase in varchar2,
                lang   in varchar2 default null,
                tname  in varchar2 default 'DEFAULT');

/*---------------------------------- sn -----------------------------------*/
/*
   NAME
     SN -- get scope note of phrase

   DESCRIPTION
     This procedure finds the scope note of the phrase

   ARGUMENTS
     phrase   --  phrase
     tname    --  thesaurus name (if not specified, system default thes used)

   NOTES
   RETURN
     see description
*/
function sn(phrase in varchar2,
            tname  in varchar2 default 'DEFAULT') return varchar2;

/*-------------------------------- thes_tt ---------------------------------*/
/*
   NAME
     THES_TT -- get thesaurus top terms

   DESCRIPTION
     This procedure finds the top terms of a thesaurus.  A top term is defined
     as any term which has a narrower term but has no broader terms.  This
     differs from TT in that TT takes in a phrase and finds the top term for
     that phrase, but THES_TT searches the whole thesaurus and finds all
     top terms.

   ARGUMENTS
     restab   --  result table
     phrase   --  phrase
     tname    --  thesaurus name (if not specified, system default thes used)

   NOTES
     Since this function searches the whole thesaurus, it can take some
     time on large thesauri.  It is not recommend to call this often
     for such thesauri.  Instead, the application should call this once,
     store the results in a seperate table, and use those stored results
     instead.
*/
procedure thes_tt(restab in out NOCOPY exp_tab,
                  tname  in varchar2 default 'DEFAULT');

/*-------------------------- has_relation ----------------------------------*/
/*
   NAME
     HAS_RELATION - check to see if a phrase has a relation

   DESCRIPTION
     Check to see if a phrase has a relation.  Valid relations
     are 'SYN','SN','TR','RT','BT','BTG','BTP','BTI','NT', 'NTG','NTP',
     'NTI', or 'ANY'(meaning any of the above).

   ARGUMENTS
     phrase  -- phrase
     rel     -- a list of relations separated by commas
     tname   -- thesaurus name

   NOTES
   RETURN
     TRUE or FALSE
*/
function has_relation(
  phrase   in   varchar2,
  rel      in   varchar2,
  tname    in   varchar2 default 'DEFAULT'
) return boolean;

end ctx_thes;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."CTX_REPORT" authid current_user as

-- constants
FMT_TEXT  constant varchar2(10) := 'TEXT';
FMT_XML   constant varchar2(10) := 'XML';

-- type declaration
type query_record is record(times number, query varchar2(4000));
type query_table is table of query_record index by binary_integer;


/*--------------------------- query_log_summary -----------------------------*/
/*
  NAME
    query_log_summary - get the most(least) frequent queries from the query log file

  DESCRIPTION
    This version of query_summary returns the results into a PL/SQL table

  ARGUMENTS
    logfile      (IN)     the name of query log file
    indexname    (IN)     the name of the context index, the default is null which
                          will return result for all context indexes
    result_table (IN OUT) query_table to which to write the result
    row_num      (IN)     the number of queries you want
    most_freq    (IN)     whether you want the most frequent or least frequent quries

*/
procedure query_log_summary(
  logfile       in varchar2,
  indexname     in varchar2 default null,
  result_table  in out nocopy query_table,
  row_num       in number default 50,
  most_freq     in boolean default true,
  has_hit       in boolean default true
);


/*--------------------------- describe_index --------------------------------*/
/*
  NAME
    describe_index

  DESCRIPTION
    create a report describing the index.  This includes the settings of
    the index meta-data, the indexing objects used, the settings of the
    attributes of the objects, and index partition descriptions, if any

  ARGUMENTS
    index_name    (IN)     the name of the index to describe
    report        (IN OUT) CLOB locator to which to write the report
    report_format (IN)     report format
  NOTES
    if report is NULL, a session-duration temporary CLOB will be created
    and returned.  It is the caller's responsibility to free this temporary
    CLOB as needed.

    report clob will be truncated before report is generated, so any
    existing contents will be overwritten by this call
*/
procedure describe_index(
  index_name     in varchar2,
  report         in out nocopy clob,
  report_format  in varchar2 DEFAULT FMT_TEXT
);

function describe_index(
  index_name     in varchar2,
  report_format  in varchar2 DEFAULT FMT_TEXT
) return clob;

/*--------------------------- describe_policy -------------------------------*/
/*
  NAME
    describe_policy

  DESCRIPTION
    create a report describing the policy.  This includes the settings of
    the policy meta-data, the indexing objects used, the settings of the
    attributes of the objects.

  ARGUMENTS
    policy_name (IN)     the name of the policy to describe
    report     (IN OUT) CLOB locator to which to write the report
    report_format (IN)     report format
  NOTES
    if report is NULL, a session-duration temporary CLOB will be created
    and returned.  It is the caller's responsibility to free this temporary
    CLOB as needed.

    report clob will be truncated before report is generated, so any
    existing contents will be overwritten by this call
*/
procedure describe_policy(
  policy_name    in varchar2,
  report         in out nocopy clob,
  report_format  in varchar2 DEFAULT FMT_TEXT
);

function describe_policy(
  policy_name    in varchar2,
  report_format  in varchar2 DEFAULT FMT_TEXT
) return clob;

/*-------------------------- create_index_script ----------------------------*/
/*
  NAME
    create_index_script

  DESCRIPTION
    create a SQL*Plus script which will create a text index that duplicates
    the named text index.

  ARGUMENTS
    index_name      (IN)     the name of the index
    report          (IN OUT) CLOB locator to which to write the script
    prefname_prefix (IN)     optional prefix to use for preference names

  NOTES
    the created script will include creation of preferences identical to
    those used in the named text index

    if report is NULL, a session-duration temporary CLOB will be created
    and returned.  It is the caller's responsibility to free this temporary
    CLOB as needed.

    report clob will be truncated before report is generated, so any
    existing contents will be overwritten by this call

    if prefname_prefix is omitted or NULL, index name will be used
    prefname_prefix follows index length restrictions
*/
procedure create_index_script(
  index_name      in varchar2,
  report          in out nocopy clob,
  prefname_prefix in varchar2 default null
);

function create_index_script(
  index_name      in varchar2,
  prefname_prefix in varchar2 default null
) return clob;

/*-------------------------- create_policy_script ---------------------------*/
/*
  NAME
    create_policy_script

  DESCRIPTION
    create a SQL*Plus script which will create a text policy that duplicates
    the named text policy.

  ARGUMENTS
    policy_name      (IN)     the name of the policy
    report          (IN OUT) CLOB locator to which to write the script
    prefname_prefix (IN)     optional prefix to use for preference names

  NOTES
    the created script will include creation of preferences identical to
    those used in the named text policy

    if report is NULL, a session-duration temporary CLOB will be created
    and returned.  It is the caller's responsibility to free this temporary
    CLOB as needed.

    report clob will be truncated before report is generated, so any
    existing contents will be overwritten by this call

    if prefname_prefix is omitted or NULL, policy name will be used
    prefname_prefix follows policy length restrictions
*/
procedure create_policy_script(
  policy_name      in varchar2,
  report          in out nocopy clob,
  prefname_prefix in varchar2 default null
);

function create_policy_script(
  policy_name      in varchar2,
  prefname_prefix in varchar2 default null
) return clob;


/*--------------------------- index_size --------------------------------*/
/*
  NAME
    index_size

  DESCRIPTION
    create a report showing the internal objects of the text index or
    text index partition, and their tablespaces, allocated, and used sizes

  ARGUMENTS
    index_name (IN)     the name of the index to describe
    report     (IN OUT) CLOB locator to which to write the report
    part_name  (IN)     the name of the index partition (optional)
    report_format  (IN) report format
  NOTES
    if part_name is NULL, and the index is a local partitioned text index,
    then all objects of all partitions will be displayed.  If part_name is
    provided, then only the objects of a particular partition will be
    displayed.

    if report is NULL, a session-duration temporary CLOB will be created
    and returned.  It is the caller's responsibility to free this temporary
    CLOB as needed.

    report clob will be truncated before report is generated, so any
    existing contents will be overwritten by this call
*/
procedure index_size(
  index_name in varchar2,
  report     in out nocopy clob,
  part_name  in varchar2 default null,
  report_format  in varchar2 DEFAULT FMT_TEXT
);

function index_size(
  index_name  in varchar2,
  part_name   in varchar2 default null,
  report_format  in varchar2 DEFAULT FMT_TEXT
) return clob;

/*--------------------------- index_stats --------------------------------*/
/*
  NAME
    index_stats

  DESCRIPTION
    create a report showing various calculated statistics about the text
    index

  ARGUMENTS
    index_name (IN)     the name of the index to describe
    report     (IN OUT) CLOB locator to which to write the report
    part_name  (IN)     the name of the index partition
    frag_stats (IN)     calculate fragmentation statistics?
    list_size  (IN)     number of elements in each compiled list
    report_format  (IN) report format
    stat_type (IN)      Specify teh estimated query stats to output
  NOTES
    this procedure will fully scan the text index tables, so it may take
    a long time to run for large indexes

    if the index is a local partitioned index, then part_name MUST be
    provided.  INDEX_STATS will calculate the statistics for that
    index partition.

    if report is NULL, a session-duration temporary CLOB will be created
    and returned.  It is the caller's responsibility to free this temporary
    CLOB as needed.

    report clob will be truncated before report is generated, so any
    existing contents will be overwritten by this call

    if frag_stats is FALSE, the report will not show any statistics
    relating to size of index data.  However, the operation should
    take less time and resources to calculate the token statistics.

    list_size has a maximum value of 1000

    index_stats will create and use a session-duration temporary
    table, which will be created in CTXSYS temp tablespace.
*/
procedure index_stats(
  index_name in varchar2,
  report     in out nocopy clob,
  part_name  in varchar2 default null,
  frag_stats in boolean default TRUE,
  list_size  in number  default 100,
  report_format  in varchar2 DEFAULT FMT_TEXT,
  stat_type  in varchar2 DEFAULT NULL
);

/*--------------------------- token_info --------------------------------*/
/*
  NAME
    token_info

  DESCRIPTION
    create a report showing the information for a token, decoded

  ARGUMENTS
    index_name     (IN)     the name of the index
    report         (IN OUT) CLOB locator to which to write the report
    token          (IN)     the token text
    token_type     (IN)     the token type
    part_name      (IN)     the name of the index partition
    raw_info       (IN)     include a hex dump of the index data
    decoded_info   (IN)     decode and include docid and offset data
    resolve_docids (IN)     resolve docids to rowids?
     report_format (IN)     report format
  NOTES
    this procedure will fully scan the info for a token, so it may take a
    long time to run for really large tokens.

    if the index is a local partitioned index, then part_name MUST be
    provided.  TOKEN_INFO will apply to just that index partition.

    if report is NULL, a session-duration temporary CLOB will be created
    and returned.  It is the caller's responsibility to free this temporary
    CLOB as needed.

    report clob will be truncated before report is generated, so any
    existing contents will be overwritten by this call

    token may be case-sensitive, depending on the passed-in token type.
    THEME, ZONE, ATTR, PATH, and PATH ATTR tokens are case-sensitive.
    Everything else gets passed through the lexer, so if the index's
    lexer is case-sensitive, the token input is case-sensitive.

    if raw_info is TRUE, the report will include a hex dump of the
    raw data in the token_info column

    if decoded_info is FALSE, ctx_report will not attempt to decode the
    token information.  This is useful when you just want a dump of data.

    To facilitate inline invocation, the boolean arguments are varchar2
    in the function variant.  You can pass in 'Y', 'N', 'YES', 'NO', 'T', 'F',
    'TRUE', or 'FALSE'

*/
procedure token_info(
  index_name      in varchar2,
  report          in out nocopy clob,
  token           in varchar2,
  token_type      in number,
  part_name       in varchar2 default null,
  raw_info        in boolean  default FALSE,
  decoded_info    in boolean  default TRUE,
  report_format   in varchar2 DEFAULT FMT_TEXT
);

function token_info(
  index_name      in varchar2,
  token           in varchar2,
  token_type      in number,
  part_name       in varchar2 default null,
  raw_info        in varchar2 default 'N',
  decoded_info    in varchar2 default 'Y',
  report_format   in varchar2 DEFAULT FMT_TEXT
) return clob;

function offset_info(
  index_name      in varchar2,
  docid           in varchar2,
  token_type      in number,
  part_name       in varchar2 default null,
  raw_info        in varchar2 default 'N',
  decoded_info    in varchar2 default 'Y',
  report_format   in varchar2 DEFAULT FMT_TEXT
) return clob;

/*--------------------------- token_type --------------------------------*/
/*
  NAME
    token_type

  DESCRIPTION
    this is a helper function which translates an English name into a
    numeric token type.  This is suitable for use with token_info,
    or any other CTX API which takes in a token_type.

  ARGUMENTS
    index_name     (IN)     the name of the index
    type_name      (IN)     an English name for token_type

  NOTES
    the following is legal input.  All input is case-insensitive.

      input               meaning                             type returned
      ------------------- ----------------------------------- -------------
      TEXT                normal text token                               0
      THEME               theme token                                     1
      ZONE SEC            zone section                                    2
      ATTR TEXT           text that occurs in an attribute                4
      ATTR SEC            attribute section                               5
      PREFIX              prefix token                                    6
      PATH SEC            path section                                    7
      PATH ATTR           path attribute section                          8
      STEM                stem form token                                 9
      ATTR TEXT PREFIX    prefix token occuring in attribute            604
      ATTR TEXT STEM      stem token occuring in attribute              904
      FIELD <name> TEXT   text token in field section <name>          16-79
      FIELD <name> PREFIX prefix token in field section <name>      616-916
      FIELD <name> STEM   stem token in field section <name>        916-979
      NDATA <name>        token in ndata section <name>             200-299
      MVDATA <name>       mvdata value in mvdata section <name>     300-399
      MDATA <name>        mdata value in mdata section <name>       400-499

    example:

      typenum := ctx_report.token_type('myindex', 'field author text');

    For FIELD types, the index meta-data needs to be read, so if you are
    going to be calling this a lot for such things, you might want to
    consider caching the values in local variables rather than calling
    token_type over and over again.

    The constant types (0 - 9) also have constants in this package defined.
*/
function token_type(
  index_name in varchar2,
  type_name  in varchar2
) return number;

TOKEN_TYPE_TEXT      constant number := 0;
TOKEN_TYPE_THEME     constant number := 1;
TOKEN_TYPE_ZONE_SEC  constant number := 2;
TOKEN_TYPE_ATTR_TEXT constant number := 4;
TOKEN_TYPE_ATTR_SEC  constant number := 5;
TOKEN_TYPE_PREFIX    constant number := 6;
TOKEN_TYPE_PATH_SEC  constant number := 7;
TOKEN_TYPE_PATH_ATTR constant number := 8;
TOKEN_TYPE_STEM      constant number := 9;
TOKEN_TYPE_ATTR_TXT_PFIX constant number := 604;
TOKEN_TYPE_ATTR_TXT_STEM constant number := 904;

/*--------------------------- validate_index -------------------------------*/
/* validate_index - write corrupt tokens to log file */
procedure validate_index(index_name in varchar2,
                         part_name in varchar2 default null);

/*--------------------------- validate_mvdata ------------------------------*/
/* validate_mvdata - Validate mvdata mappings in $I and also return them to
 *                   the user
 */
function validate_mvdata(
  index_name      in varchar2,
  token           in varchar2,
  token_type      in number,
  part_name       in varchar2 default null
) return clob;

end ctx_report;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."CTX_ULEXER" AS

  -- index-by table to specify offset of those characters in the query
  -- word which are to be treated as wildcard characters
  TYPE wildcard_tab IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;

END ctx_ulexer;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."CTX_CLS" AUTHID current_user AS

/*------------------------------- TYPE DEFINITIONS ----------------------------*/
/* in-memory table for document assignment */
TYPE doc_rec IS RECORD (
	docid     number,   -- document ID to identify the document
	clusterid number,   -- the ID of the cluster the document is assigned to
	score     number    -- the similarity score between document and cluster
);
TYPE doc_tab is TABLE OF doc_rec INDEX BY BINARY_INTEGER;

/* in-memory table for cluster information */
TYPE cluster_rec IS RECORD (
	clusterid number,         -- cluster ID to identify a cluster
	descript  varchar2(4000), -- a string to describe the cluster
        label     varchar2(200),  -- a suggested label for the cluster
        sze       number,         -- number of documents assigned to the cluster
	quality_score number,     -- the quality score of the cluster
	parent    number          -- parent cluster id. negative means no parent
);
TYPE cluster_tab IS TABLE OF cluster_rec INDEX BY BINARY_INTEGER;

TYPE docid_tab IS TABLE OF number INDEX BY BINARY_INTEGER;

/*------------------------------- train for ctx-rules --------------------------*/
/*
   NAME
     train - automatically generate ctx-rules from training examples

   DESCRIPTION
     This procedure will generate the ctx-rules for a given set of training
     examples. The training examples are contained in the following two tables

	table1:  doctab must have the following columns:
		 docid		number primary key
		 text		doc. column which can be indexed by context index
        table2:  category table must have the following columns:
		 docid		CONSTRAINT fk_id REFERENCES doctab(id)
		 category_id	number

	the foreign key in category table is recommended by not required.

     The rules will be written to the result table specified.
     The query table must have the following columns:

       category_id		number         (the category_id)
       query	              	varchar2(4000) (the rule)
       confidence               number         (the confidence level
						(percentage) that a document
						is relevant if this rule is
						satisfied )

     The names of table and column are not necessary the same as above.

   ARGUMENTS
     index_name               - the name of the text index
     docid                    - the name of docid column in document table
     cattab		      - the name of category table
     catdocid		      - the name of docid column in categroy table
     catid		      - the name of category ID column in category table
     restab		      - the name of result table
     rescatid                 - the name of category ID column in result table
     resquery                 - the name of query column in result table
     resconfid                - the name of confidence column in result table
     pref_name                - the name of preference
*/

PROCEDURE train (
  index_name    in varchar2,
  docid	 	in varchar2,
  cattab        in varchar2,
  catdocid      in varchar2,
  catid         in varchar2,
  restab        in varchar2,
  rescatid      in varchar2,
  resquery      in varchar2,
  resconfid     in varchar2,
  pref_name     in varchar2 DEFAULT NULL
);
PRAGMA SUPPLEMENTAL_LOG_DATA(train, AUTO);

/*------------------------------- generic train API ---------------------------*/
/*
   NAME
     train - automatically generate predicative model from examples for
             classification

   DESCRIPTION
     This procedure will generate the predicative model from a given set of
     training examples. The training examples are contained in the following
     two tables

	table1:  doctab must have the following columns:
		 docid	  	number primary key
		 text	 	doc. column which can be indexed by context index
        table2:  category table must have the following columns:
		 docid		number
		 category_id	number

     The names of table and column are not necessary the same as above.

     The predicative model (classifier) will be written to the result tables.
     The result table is either created by users before calling this function or
     created in this program with the specified table name and under the current
     user (if the specified table does not exist).
     If user create the result table (which can support table schema for
     different users), the table should have the following three columns with the
     exact column names:
		cat_id number
		type number(3) not null
		rule clob

   ARGUMENTS
     index_name               - the name of the text index
     docid                    - the name of docid column in document table
     cattab		      - the name of category table
     catdocid		      - the name of docid column in categroy table
     catid		      - the name of category ID column in category table
     restab                   - the name of generated result table
     pref_name                - the name of preference
*/
PROCEDURE train (
  index_name    	in varchar2,
  docid	 		in varchar2,
  cattab        	in varchar2,
  catdocid      	in varchar2,
  catid         	in varchar2,
  restab 	    	in varchar2,
  pref_name     	in varchar2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(train, AUTO);


/* ---------- clustering API for permanent table result------------------------*/
/*
  NAME
    clustering - clustering a collection

  DESCRIPTION
    This procedure will generate a set of sub-group (clusters) from a provided
    collection of documents. The collection is given by a table which having a
    context index built with or without population. The collection table at least
    has the following two collums, whose name may not be exactly the same.
	 docid	  	number primary key
	 text	 	doc. column which can be indexed by context index

    The output of clustering is represented by two tables:

	table 1: document membership table having the following collums with the
		 exact same names
	 docid     number -- document ID to identify a document
	 clusterid number -- the ID of the cluster the document is assigned to
	 score     number -- the similarity score between document and cluster

	table 2: cluster description table having the following collums with the
		 exact same names
	 clusterid number         -- cluster ID to identify a cluster
	 descript  varchar2(4000) -- a string to describe the cluster
         label     varchar2(200)  -- a suggested label for the cluster
         size      number         -- number of documents assigned to the cluster
	 quality_score number     -- the quality score of the cluster
	 parent    number         -- parent cluster id. negative means no parent

     The output tables can either be created by users before calling this
     function or created in this program with the specified table name and
     under the current user (if the specified table does not exist).

   ARGUMENTS:
     index_name               - the name of the text index
     docid                    - the name of docid column in document table
     doctab_name              - the name of document membership table
     clstab_name              - the name of cluster description table
     pref_name                - the name of the preference
*/
PROCEDURE clustering (
  index_name            in varchar2,
  docid                 in varchar2,
  doctab_name           in varchar2,
  clstab_name           in varchar2,
  pref_name             in varchar2 DEFAULT NULL
);
PRAGMA SUPPLEMENTAL_LOG_DATA(clustering, AUTO);

/* ---------- clustering API for in-memory table result------------------------*/
/*
  NAME
    clustering - clustering a collection

  DESCRIPTION
    This procedure will generate a set of sub-group (clusters) from a provided
    collection of documents. The collection is given by a table which having a
    context index built with or without population. The collection table at least
    has the following two collums, whose name may not be exactly the same.
	 docid	  	number primary key
	 text	 	doc. column which can be indexed by context index

    The output of clustering is represented by two in-memory tables:

	table 1: document membership table ctx_cls.doc_tab
	table 2: cluster description table ctx_cls.cluster_tab

   ARGUMENTS:
     index_name               - the name of the text index
     docid                    - the name of docid column in document table
     dids                     - docid list to be clustered
     doctab_name              - the name of document membership table
     clstab_name              - the name of cluster description table
     pref_name                - the name of the preference
*/
PROCEDURE clustering (
  index_name            in varchar2,
  docid                 in varchar2,
  dids                  in docid_tab,
  doctab_name           in out nocopy doc_tab,
  clstab_name           in out nocopy cluster_tab,
  pref_name             in varchar2 DEFAULT NULL
);
--PRAGMA SUPPLEMENTAL_LOG_DATA(clustering, AUTO);

END ctx_cls;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."CTX_ENTITY" AUTHID current_user AS


LOCK_WAIT         	constant number := 0;
LOCK_NOWAIT       	constant number := 1;
LOCK_NOWAIT_ERROR 	constant number := 2;

COMPILE_ALL         	constant number := 0;
COMPILE_RULES       	constant number := 1;
COMPILE_STOP_ENTITIES	constant number := 2;

STATUS_NOTCOMPILED      constant number := 0;
STATUS_TOBEDELETED      constant number := 1;
STATUS_COMPILED         constant number := 2;
STATUS_SUBSET           constant number := 3;


/*------------------------------- TYPE DEFINITIONS ------------------------*/


/*---------------------------- create_extract_policy ----------------------*/
/*
   NAME
     create_extract_policy

   DESCRIPTION
     create an entity-extraction policy

   ARGUMENT
     policy_name		- the name for the new policy
     lexer			- the lexer preference to use
     storage_clause	    	- storage preferences (still undecided)
     include_supplied_rules 	- specify whether supplied rules are included
                                  in compilation of user-defined rules
     include_supplied_dictionary - specify whether supplied dictionary is used
                                   in entity extraction
     include_machine_learning   - specify whether machine learning is included
                                  in entity extraction

*/

PROCEDURE create_extract_policy(
  policy_name			IN VARCHAR2,
  lexer				IN VARCHAR2 DEFAULT NULL,
  include_supplied_rules	IN BOOLEAN DEFAULT TRUE,
  include_supplied_dictionary	IN BOOLEAN DEFAULT TRUE
);
PRAGMA SUPPLEMENTAL_LOG_DATA(create_extract_policy, AUTO);

/*---------------------------- drop_extract_policy ------------------------*/
/*
   NAME
     drop_extract_policy

   DESCRIPTION
     drop an entity-extraction policy

   ARGUMENT
     policy_name		- the name of the policy
*/

PROCEDURE drop_extract_policy(
  policy_name			IN VARCHAR2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(drop_extract_policy, AUTO);

/*---------------------------- add_extract_rule --------------------------*/
/*
   NAME
     add_extract_rule

   DESCRIPTION
     add a user-defined extraction rule to a policy object

   ARGUMENT
     policy_name		- policy to associate rule with
     rule_id		    	- a unique rule_id within the extract policy
     extraction_rule	    	- specify the extraction rule to be added
*/

PROCEDURE add_extract_rule(
  policy_name			IN VARCHAR2,
  rule_id			IN INTEGER,
  extraction_rule 		IN VARCHAR2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_extract_rule, AUTO);

/*---------------------------- remove_extract_rule ------------------------*/
/*
   NAME
     remove_extract_rule

   DESCRIPTION
     remove a single extraction rule from an extract policy

   ARGUMENT
     policy_name	    	- the name of the policy
     rule_id	    		- id for rule to be removed from policy
*/

PROCEDURE remove_extract_rule(
  policy_name			IN VARCHAR2,
  rule_id			IN INTEGER
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_extract_rule, AUTO);

/*---------------------------- add_stop_entity ----------------------------*/
/*
   NAME
     add_stop_entity

   DESCRIPTION
     add an entity that is not to be classified - a "stop entity" - to the policy

   ARGUMENT
     policy_name	    	- policy to associate stop entity with
     entity_name	    	- entity mention
     entity_type	    	- entity type
     comments			- comments
*/

PROCEDURE add_stop_entity(
  policy_name			IN VARCHAR2,
  entity_name			IN VARCHAR2 DEFAULT NULL,
  entity_type 			IN VARCHAR2 DEFAULT NULL,
  comments			IN VARCHAR2 DEFAULT NULL
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_stop_entity, AUTO);

/*---------------------------- remove_stop_entity -------------------------*/
/*
   NAME
     remove_stop_entity

   DESCRIPTION
     remove a stop entity from an extract policy

   ARGUMENT
     policy_name	    	- the name of the policy
     entity_name	    	- entity mention
     entity_type	    	- entity type
*/

PROCEDURE remove_stop_entity(
  policy_name			IN VARCHAR2,
  entity_name			IN VARCHAR2 DEFAULT NULL,
  entity_type 			IN VARCHAR2 DEFAULT NULL
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_stop_entity, AUTO);

/*---------------------------- compile ------------------------------------*/
/*
   NAME
     compile

   DESCRIPTION
     compile added extraction rules and stop-entities into an extract policy

   ARGUMENT
     policy_name	    	- the name of the policy
     compile_choice	- compile rules, stop-entities, or both
     locking   		- locking preferences
*/

PROCEDURE compile(
  policy_name			IN VARCHAR2,
  compile_choice		IN NUMBER DEFAULT COMPILE_ALL,
  locking			IN NUMBER DEFAULT LOCK_NOWAIT_ERROR
);
PRAGMA SUPPLEMENTAL_LOG_DATA(compile, AUTO);

/*---------------------------- extract -----------------------------*/
/*
   NAME
     extract

   DESCRIPTION
     generate character offsets and character lengths of an extracted entity from base document

   ARGUMENT
     policy_name	   	- the name of the policy
     document		    	- base document
     language		    	- name of language in document
     result                 	- clob containing xml output
     entity_type_list	    	- entity types that will be extracted (NULL means all types)
     locking   		- locking preferences

*/

PROCEDURE extract(
  policy_name			IN VARCHAR2,
  document			IN CLOB,
  language			IN VARCHAR2,
  result			IN OUT NOCOPY CLOB,
  entity_type_list		IN CLOB DEFAULT NULL,
  locking			IN NUMBER DEFAULT LOCK_NOWAIT_ERROR
);


END ctx_entity;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."CTX_TREE" AUTHID current_user AS

/*------------------------------- TYPE DEFINITIONS ------------------------*/

/*---------------------------- register_index ----------------------*/
/*
   NAME
     register_index

   DESCRIPTION
     registers an index with the CTX_TREE package

   ARGUMENT
     index_name		- the name of the index

*/

PROCEDURE register_index(
  index_name      IN VARCHAR2
);
PRAGMA SUPPLEMENTAL_LOG_DATA(register_index, AUTO);

/*---------------------------- add_node ----------------------*/
/*
   NAME
     add_node

   DESCRIPTION
     add a new node to a tree associated with a MVDATA section and index

   ARGUMENT
     index_name		- the name for the index
     section_name       - the name of the MVDATA section
     path               - the new path to be added to a tree
     id_list            - return value of the corresponding node ids
     force              - complete successfully even if the path already
                          exists

*/

PROCEDURE add_node(
  index_name      IN VARCHAR2,
  section_name    IN VARCHAR2,
  path            IN CLOB,
  id_list         OUT CLOB,
  force           IN BOOLEAN DEFAULT FALSE
);
PRAGMA SUPPLEMENTAL_LOG_DATA(add_node, AUTO);

/*---------------------------- get_node_id ----------------------*/
/*
   NAME
     get_node_id

   DESCRIPTION
     looks up the node identifier of an existing path in a tree
     associated with a MVDATA section and index

   ARGUMENT
     index_name		- the name for the index
     section_name       - the name of the MVDATA section
     path               - an existing path in a tree
     id                 - return value of the corresponding node id

*/

PROCEDURE get_node_id(
  index_name      IN VARCHAR2,
  section_name    IN VARCHAR2,
  path            IN CLOB,
  id              OUT INTEGER
) ;

/*---------------------------- get_children ----------------------*/
/*
   NAME
     get_children

   DESCRIPTION
     looks up the children names of the node identified by a path in a tree
     associated with a MVDATA section and index

   ARGUMENT
     index_name		- the name for the index
     section_name       - the name of the MVDATA section
     path               - an existing path in a tree
     child_list         - return value of the children node names (comma-sep)

*/

PROCEDURE get_children(
  index_name      IN VARCHAR2,
  section_name    IN VARCHAR2,
  path            IN CLOB,
  child_list      IN OUT CLOB
);

/*---------------------------- get_nodeid_list ----------------------*/
/*
   NAME
     get_nodeid_list

   DESCRIPTION
     looks up the node identifiers of all nodes in an existing path in a tree
     associated with a MVDATA section and index

   ARGUMENT
     index_name		- the name for the index
     section_name       - the name of the MVDATA section
     path               - an existing path in a tree
     id_list            - return value of the corresponding node ids

*/

PROCEDURE get_nodeid_list(
  index_name      IN VARCHAR2,
  section_name    IN VARCHAR2,
  path            IN CLOB,
  id_list         IN OUT CLOB
);

/*---------------------------- get_roots ----------------------*/
/*
   NAME
     get_roots

   DESCRIPTION
     looks up the roots of all the trees associated with a MVDATA section
     and index

   ARGUMENT
     index_name		- the name for the index
     section_name       - the name of the MVDATA section
     roots              - list of roots (names)

*/

PROCEDURE get_roots(
  index_name      IN  VARCHAR2,
  section_name    IN  VARCHAR2,
  roots           OUT CLOB
);

/*---------------------------- remove_node ----------------------*/
/*
   NAME
     remove_node

   DESCRIPTION
     Removes specified node from the tree associated with the MVDATA section
     and Index

   ARGUMENT
     index_name		- the name for the index
     section_name       - the name of the MVDATA section
     path               - input node path to be deleted

*/

PROCEDURE remove_node(
  index_name      IN  VARCHAR2,
  section_name    IN  VARCHAR2,
  path            IN CLOB
);
PRAGMA SUPPLEMENTAL_LOG_DATA(remove_node, AUTO);

PROCEDURE DropSequences(
  idx_owner       IN VARCHAR2,
  idx_name        IN VARCHAR2,
  idx_id          IN NUMBER
);

PROCEDURE regindex(
  index_name      IN VARCHAR2,
  purge           IN BOOLEAN
);



END ctx_tree;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."CTX_ANL" authid current_user as
/*
name            IN      A unique name (per user) identifying dictionary.
language        IN      Which language does this dictionary belong to?
dictionary              IN      The actual dictionary
*/

PROCEDURE add_dictionary(name     in VARCHAR2,
                         language in VARCHAR2,
                         dictionary  in CLOB);

PROCEDURE drop_dictionary(name in VARCHAR2);

END CTX_ANL;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."CTX_CONTAINS" authid current_user as
    -- varchar2 column type, varchar2 query string type
    function Textcontains(Colval in varchar2,
                             Text in varchar2, ia sys.odciindexctx,
                             sctx IN OUT TextIndexMethods,
                             cflg number /*, env sys.ODCIEnv*/)
      return number parallel_enable is language C
      name "contains"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    -- varchar2 column type, clob query string type
    function Textcontains(Colval in varchar2,
                             Text in clob, ia sys.odciindexctx,
                             sctx IN OUT TextIndexMethods,
                             cflg number /*, env sys.ODCIEnv*/)
      return number parallel_enable is language C
      name "contains_clob"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    -- clob column type, varchar2 query string type
    function Textcontains(Colval in clob,
                                Text in varchar2, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv */)
      return number parallel_enable is language C
      name "contains"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    -- clob column type, clob query string type
    function Textcontains(Colval in clob,
                                Text in clob, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv */)
      return number parallel_enable is language C
      name "contains_clob"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    -- blob column type, varchar2 query string type
    function Textcontains(Colval in blob,
                                Text in varchar2, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv*/)
      return number parallel_enable is language C
      name "contains"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    -- blob column type, clob query string type
    function Textcontains(Colval in blob,
                                Text in clob, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv*/)
      return number parallel_enable is language C
      name "contains_clob"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    -- bfile column type, varchar2 query string type
    function Textcontains(Colval in bfile,
                                Text in varchar2, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv */)
      return number parallel_enable is language C
      name "contains"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    -- bfile column type, clob query string type
    function Textcontains(Colval in bfile,
                                Text in clob, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv */)
      return number parallel_enable is language C
      name "contains_clob"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    -- Xmltype column type, varchar2 query string type
    function Textcontains(Colval in sys.xmltype,
                                Text in varchar2, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv*/)
      return number parallel_enable is language C
      name "contains"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    -- Xmltype column type, clob query string type
    function Textcontains(Colval in sys.xmltype,
                                Text in clob, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv*/)
      return number parallel_enable is language C
      name "contains_clob"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    -- Uritype column type, varchar2 query string type
    function Textcontains(Colval in sys.uritype,
                                Text in varchar2, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv*/)
      return number parallel_enable is language C
      name "contains"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR STRUCT,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    -- Uritype column type, clob query string type
    function Textcontains(Colval in sys.uritype,
                                Text in clob, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv*/)
      return number parallel_enable is language C
      name "contains_clob"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR STRUCT,
        Text,
        Text INDICATOR,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );

end ctx_contains;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRISCORE" authid current_user as
    function TextScore(Colval in varchar2,
                             Text in varchar2, ia sys.odciindexctx,
                             sctx IN OUT TextIndexMethods,
                             cflg number /*, env sys.ODCIEnv */)
      return number parallel_enable is language C
      name "contains"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    function TextScore(Colval in varchar2,
                             Text in clob, ia sys.odciindexctx,
                             sctx IN OUT TextIndexMethods,
                             cflg number /*, env sys.ODCIEnv */)
      return number parallel_enable is language C
      name "contains_clob"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    function TextScore(Colval in clob,
                                Text in varchar2, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv */)
      return number parallel_enable is language C
      name "contains"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    function TextScore(Colval in clob,
                                Text in clob, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv */)
      return number parallel_enable is language C
      name "contains_clob"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    function TextScore(Colval in blob,
                                Text in varchar2, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv */)
      return number parallel_enable is language C
      name "contains"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    function TextScore(Colval in blob,
                                Text in clob, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv */)
      return number parallel_enable is language C
      name "contains_clob"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    function TextScore(Colval in bfile,
                                Text in varchar2, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv */)
      return number parallel_enable is language C
      name "contains"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    function TextScore(Colval in bfile,
                                Text in clob, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv */)
      return number parallel_enable is language C
      name "contains_clob"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    function TextScore(Colval in sys.xmltype,
                                Text in varchar2, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv */)
      return number parallel_enable is language C
      name "contains"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    function TextScore(Colval in sys.xmltype,
                                Text in clob, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv */)
      return number parallel_enable is language C
      name "contains_clob"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    function TextScore(Colval in sys.uritype,
                                Text in varchar2, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv */)
      return number parallel_enable is language C
      name "contains"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR STRUCT,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
    function TextScore(Colval in sys.uritype,
                                Text in clob, ia sys.odciindexctx,
                                sctx IN OUT TextIndexMethods,
                                cflg number /*, env sys.ODCIEnv */)
      return number parallel_enable is language C
      name "contains_clob"
      library dr$lib
      with context
      parameters(
        context,
        Colval,
        Colval INDICATOR STRUCT,
        Text,
        Text INDICATOR,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
end driscore;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."CTX_CATSEARCH" authid current_user as

function catsearch(
  Colval  in     varchar2,
  Text    in     varchar2,
  condcls in     varchar2,
  ia      in     sys.odciindexctx,
  sctx    in out CatIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "catsearch"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        condcls,
        condcls INDICATOR,
        condcls LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );

function catsearch(
  Colval  in     varchar2,
  Text    in     clob,
  condcls in     varchar2,
  ia      in     sys.odciindexctx,
  sctx    in out CatIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "catsearch_clob"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        condcls,
        condcls INDICATOR,
        condcls LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );

function catsearch(
  Colval  in     clob,
  Text    in     varchar2,
  condcls in     varchar2,
  ia      in     sys.odciindexctx,
  sctx    in out CatIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "catsearch"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        condcls,
        condcls INDICATOR,
        condcls LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );

function catsearch(
  Colval  in     clob,
  Text    in     clob,
  condcls in     varchar2,
  ia      in     sys.odciindexctx,
  sctx    in out CatIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "catsearch_clob"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        condcls,
        condcls INDICATOR,
        condcls LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
end ctx_catsearch;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."CTX_MATCHES" authid current_user as

function  matches(
  Colval  in     varchar2,
  Text    in     varchar2,
  ia      in     sys.odciindexctx,
  sctx    in out RuleIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "rulematches"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );

function matches(
  Colval  in     clob,
  Text    in     varchar2,
  ia      in     sys.odciindexctx,
  sctx    in out RuleIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "rulematches"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );

function matches(
  Colval  in     blob,
  Text    in     varchar2,
  ia      in     sys.odciindexctx,
  sctx    in out RuleIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "rulematches"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );

function matches(
  Colval  in     varchar2,
  Text    in     clob,
  ia      in     sys.odciindexctx,
  sctx    in out RuleIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "rulematches"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text CHARSETID,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );

function matches(
  Colval  in     clob,
  Text    in     clob,
  ia      in     sys.odciindexctx,
  sctx    in out RuleIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "rulematches"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text CHARSETID,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );

function matches(
  Colval  in     blob,
  Text    in     clob,
  ia      in     sys.odciindexctx,
  sctx    in out RuleIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "rulematches"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text CHARSETID,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
end ctx_matches;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."DRISCORR" authid definer as
function  RuleScore(
  Colval  in     varchar2,
  Text    in     varchar2,
  ia      in     sys.odciindexctx,
  sctx    in out RuleIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "rulematches"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );

function RuleScore(
  Colval  in     clob,
  Text    in     varchar2,
  ia      in     sys.odciindexctx,
  sctx    in out RuleIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "rulematches"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );

function RuleScore(
  Colval  in     blob,
  Text    in     varchar2,
  ia      in     sys.odciindexctx,
  sctx    in out RuleIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "rulematches"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );

function RuleScore(
  Colval  in     varchar2,
  Text    in     clob,
  ia      in     sys.odciindexctx,
  sctx    in out RuleIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "rulematches"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text CHARSETID,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );

function RuleScore(
  Colval  in     clob,
  Text    in     clob,
  ia      in     sys.odciindexctx,
  sctx    in out RuleIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "rulematches"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text CHARSETID,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );

function RuleScore(
  Colval  in     blob,
  Text    in     clob,
  ia      in     sys.odciindexctx,
  sctx    in out RuleIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "rulematches"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text CHARSETID,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );
end driscorr;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "CTXSYS"."CTX_XPCONTAINS" authid current_user as

function xpcontains(
  Colval  in     sys.xmltype,
  Text    in     varchar2,
  ia      in     sys.odciindexctx,
  sctx    in out XpathIndexMethods,
  cflg    in     number
)
  return number parallel_enable is language C
  name "contains"
  library dr$lib
  with context
  parameters(
        context,
        Colval,
        Colval INDICATOR,
        Text,
        Text INDICATOR,
        Text LENGTH,
        ia,
        ia INDICATOR STRUCT,
        sctx,
        sctx INDICATOR STRUCT,
        cflg,
        cflg INDICATOR,
        return OCINumber
      );

end ctx_xpcontains;
/

