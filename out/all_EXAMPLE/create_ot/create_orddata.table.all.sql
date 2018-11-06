CREATE TABLE "ORDDATA"."ORDDCM_INTERNAL_TAGS"
   (	"TAG" VARCHAR2(8 CHAR),
	"DEFINER_NAME" VARCHAR2(64 CHAR) DEFAULT 'DICOM'
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_DOC_TYPES"
   (	"DOC_TYPE_ID" NUMBER,
	"DOC_TYPE" VARCHAR2(100),
	"SCHEMA_URL" VARCHAR2(700),
	"DOC_TYPE_DSC" VARCHAR2(4000)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_INSTALL_DOCS"
   (	"DOC_TYPE_ID" NUMBER,
	"DOC_NAME" VARCHAR2(100),
	"DOC_TYPE" VARCHAR2(100),
	"LOAD_ORDER" NUMBER
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_DOC_REFS"
   (	"DOC_ID" NUMBER(*,0),
	"REF_BY_DOC_ID" NUMBER(*,0),
	"DOC_NAME" VARCHAR2(100),
	"REF_BY_DOC_NAME" VARCHAR2(100)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_VR_DT_MAP"
   (	"VR_NUM" NUMBER(*,0),
	"VR" VARCHAR2(5),
	"DT" VARCHAR2(32)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_STD_ATTRS"
   (	"SA_ID" NUMBER(*,0),
	"TAG" VARCHAR2(8),
	"NAME" VARCHAR2(128 CHAR),
	"VR" VARCHAR2(5),
	"VM" VARCHAR2(128),
	"ISRETIRED" NUMBER(1,0) DEFAULT 0,
	"ISWILDCARD" NUMBER(1,0) DEFAULT 0,
	"DEFINER_NAME" VARCHAR2(5) DEFAULT 'DICOM',
	"DEFINER_UID" VARCHAR2(128) DEFAULT '1.2.840.10008.1',
	"DOC_ID" NUMBER(*,0)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PRV_ATTRS"
   (	"PA_ID" NUMBER(*,0),
	"TAG" VARCHAR2(8),
	"DEFINER_NAME" VARCHAR2(64 CHAR),
	"NAME" VARCHAR2(128 CHAR),
	"START_TAG" VARCHAR2(8 CHAR),
	"END_TAG" VARCHAR2(8 CHAR),
	"DEFINER_UID" VARCHAR2(128),
	"DOC_ID" NUMBER(*,0),
	"VR" VARCHAR2(5),
	"VM" VARCHAR2(128),
	"ISRETIRED" NUMBER(1,0) DEFAULT 0,
	"ISWILDCARD" NUMBER(1,0) DEFAULT 0
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_DICT_ATTRS"
   (	"DA_ID" NUMBER(*,0),
	"SA_ID" NUMBER(*,0),
	"PA_ID" NUMBER(*,0)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_DAREFS"
   (	"DA_ID" NUMBER(*,0),
	"DOC_ID" NUMBER(*,0)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_MAPPED_PATHS"
   (	"MPID" NUMBER(*,0),
	"ATTR_TAG" VARCHAR2(1999),
	"DOC_ID" NUMBER(*,0),
	"REL_PATH" VARCHAR2(1999 CHAR),
	"OCCURS" NUMBER(1,0) DEFAULT 0,
	"NOT_EMPTY" NUMBER(1,0) DEFAULT 0,
	"WRITE_TAG" NUMBER(1,0) DEFAULT 0,
	"WRITE_DEFINER" NUMBER(1,0) DEFAULT 0,
	"WRITE_NAME" NUMBER(1,0) DEFAULT 0,
	"WRITE_RAW_VALUE" NUMBER(1,0) DEFAULT 0
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_ANON_RULE_TYPES"
   (	"RULE_TYPE_ID" NUMBER(*,0),
	"RULE_TYPE" VARCHAR2(30)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_ANON_ACTION_TYPES"
   (	"ACTION_TYPE_ID" NUMBER,
	"ACTION_TYPE" VARCHAR2(30)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_ANON_RULES"
   (	"DOC_ID" NUMBER(*,0),
	"RULE_TYPE_ID" NUMBER,
	"ANON_ACTION_TYPE_ID" NUMBER,
	"ANON_VALUE" VARCHAR2(128 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_ANON_ATTRS"
   (	"AAID" NUMBER(*,0),
	"DOC_ID" NUMBER(*,0),
	"TAG" VARCHAR2(1999),
	"ANON_ACTION_TYPE_ID" NUMBER,
	"ANON_VALUE" VARCHAR2(128 CHAR),
	"TAG_DESC" VARCHAR2(1999 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_RT_PREF_PARAMS"
   (	"PPID" NUMBER(*,0),
	"NAME" VARCHAR2(64),
	"VALUE" VARCHAR2(1999 CHAR),
	"DOC_ID" NUMBER(*,0),
	"PARAM_DESC" VARCHAR2(1999 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_UID_DEFS"
   (	"UDID" NUMBER(*,0),
	"DICOM_UID" VARCHAR2(128),
	"DOC_ID" NUMBER(*,0),
	"NAME" VARCHAR2(128 CHAR),
	"CLASSIFICATION" VARCHAR2(64),
	"ISLE" NUMBER(1,0) DEFAULT 1,
	"ISEVR" NUMBER(1,0) DEFAULT 1,
	"ISCOMPRESSED" NUMBER(1,0) DEFAULT 1,
	"ISRETIRED" NUMBER(1,0) DEFAULT 0,
	"CONTENTTYPE" VARCHAR2(64) DEFAULT 'IMAGE',
	"UID_DESC" VARCHAR2(1999 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_STORED_TAGS"
   (	"STID" NUMBER(*,0),
	"ATTR_TAG" VARCHAR2(1999),
	"DOC_ID" NUMBER(*,0)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_DATA_MODEL"
   (	"MODEL_ID" NUMBER(*,0),
	"MODEL_NAME" VARCHAR2(100) DEFAULT 'DEFAULT',
	"ISRETIRED" NUMBER DEFAULT 0
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_PRED"
   (	"PID" NUMBER(*,0),
	"FPID" NUMBER(*,0),
	"POS" NUMBER(3,0),
	"REF_PID" NUMBER(*,0),
	"OP" NUMBER(3,0),
	"DESCRIPTION" VARCHAR2(1999 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_PRED_SET"
   (	"PSID" NUMBER(*,0),
	"NAME" VARCHAR2(64 CHAR),
	"PSTYPE" NUMBER(1,0),
	"PID" NUMBER(*,0),
	"STATUS" NUMBER(1,0),
	"SUPER" NUMBER(*,0),
	"DOC_ID" NUMBER(*,0),
	"DESCRIPTION" VARCHAR2(1999 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_MACRO_PAR"
   (	"PSID" NUMBER(*,0),
	"PARNAME" VARCHAR2(128 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_MACRO_DEP"
   (	"PSID" NUMBER(*,0),
	"DEP_PSID" NUMBER(*,0)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_PRED_PAR"
   (	"PID" NUMBER(*,0),
	"PARNAME" VARCHAR2(128 CHAR),
	"PARVAL" VARCHAR2(1999 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_ACTION"
   (	"PID" NUMBER(*,0),
	"EVENT" VARCHAR2(20 CHAR),
	"ACTION" VARCHAR2(20 CHAR),
	"DESCRIPTION" VARCHAR2(1999 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_LOCATORPATHS"
   (	"DOC_ID" NUMBER(*,0),
	"PSID" NUMBER(*,0),
	"LOCATOR_PATH" VARCHAR2(1999 CHAR),
	"HAS_MACRO_PARAM" NUMBER(1,0),
	"IS_COVERED" NUMBER(1,0)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_VLD_MSG"
   (	"SOP_INSTANCE_UID" VARCHAR2(128 CHAR),
	"RULE_NAME" VARCHAR2(64 CHAR),
	"MESSAGE" VARCHAR2(1999 CHAR),
	"MSG_TYPE" VARCHAR2(20 CHAR),
	"MSG_TIME" TIMESTAMP (6),
	"USER_NAME" VARCHAR2(64)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PROTOCOL_ATTR_CONFIG"
   (	"DOC_NAME" VARCHAR2(100),
	"COL_LOC" VARCHAR2(392 CHAR),
	"COL_TYPE" VARCHAR2(30),
	"DICOM_TAG" VARCHAR2(8),
	"TAG_DEFINER" VARCHAR2(64)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PR_ATTR_CONFIG_WRK"
   (	"DOC_NAME" VARCHAR2(100),
	"COL_LOC" VARCHAR2(392 CHAR),
	"COL_TYPE" VARCHAR2(30),
	"DICOM_TAG" VARCHAR2(8),
	"TAG_DEFINER" VARCHAR2(64)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PROTOCOL_VERSION_CONFIG"
   (	"DOC_NAME" VARCHAR2(100),
	"TABLE_NAME" VARCHAR2(392 CHAR),
	"COL_LOC" VARCHAR2(392 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PR_VERSION_CONFIG_WRK"
   (	"DOC_NAME" VARCHAR2(100),
	"TABLE_NAME" VARCHAR2(392 CHAR),
	"COL_LOC" VARCHAR2(392 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PROTOCOL_DICOM_CONFIG"
   (	"DOC_NAME" VARCHAR2(100),
	"COL_LOC" VARCHAR2(392 CHAR),
	"COL_TYPE" VARCHAR2(30),
	"RETAIN" NUMBER
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PR_DICOM_CONFIG_WRK"
   (	"DOC_NAME" VARCHAR2(100),
	"COL_LOC" VARCHAR2(392 CHAR),
	"COL_TYPE" VARCHAR2(30),
	"RETAIN" NUMBER
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PROTOCOL_PRVW_CONFIG"
   (	"DOC_NAME" VARCHAR2(100),
	"COL_LOC" VARCHAR2(392 CHAR),
	"COL_TYPE" VARCHAR2(30),
	"OPTIONS" VARCHAR2(1000)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PR_PRVW_CONFIG_WRK"
   (	"DOC_NAME" VARCHAR2(100),
	"COL_LOC" VARCHAR2(392 CHAR),
	"COL_TYPE" VARCHAR2(30),
	"OPTIONS" VARCHAR2(1000)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PROTOCOL_WADO_CONFIG"
   (	"DOC_NAME" VARCHAR2(100),
	"COL_LOC" VARCHAR2(392 CHAR),
	"WADO_PFX" VARCHAR2(100 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PR_WADO_CONFIG_WRK"
   (	"DOC_NAME" VARCHAR2(100),
	"COL_LOC" VARCHAR2(392 CHAR),
	"WADO_PFX" VARCHAR2(100 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PROTOCOL_XML_CONFIG"
   (	"DOC_NAME" VARCHAR2(100),
	"COL_LOC" VARCHAR2(392 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PR_XML_CONFIG_WRK"
   (	"DOC_NAME" VARCHAR2(100),
	"COL_LOC" VARCHAR2(392 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PROTOCOL_SPECIAL_TAG"
   (	"DOC_NAME" VARCHAR2(100),
	"COL_LOC" VARCHAR2(392 CHAR),
	"TAG_NAME" VARCHAR2(392 CHAR),
	"TAG_DEFINER" VARCHAR2(64)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PR_SPECIAL_TAG_WRK"
   (	"DOC_NAME" VARCHAR2(100),
	"COL_LOC" VARCHAR2(392 CHAR),
	"TAG_NAME" VARCHAR2(392 CHAR),
	"TAG_DEFINER" VARCHAR2(64)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PROTOCOL_ADMIN_DOCS"
   (	"DOC_NAME" VARCHAR2(100),
	"ADMIN_DOC_TYPE" VARCHAR2(50),
	"ADMIN_DOC_NAME" VARCHAR2(100),
	"ADMIN_DOC_OPTION" VARCHAR2(50)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PR_ADMIN_DOCS_WRK"
   (	"DOC_NAME" VARCHAR2(100),
	"ADMIN_DOC_TYPE" VARCHAR2(50),
	"ADMIN_DOC_NAME" VARCHAR2(100),
	"ADMIN_DOC_OPTION" VARCHAR2(50)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PROTOCOL_METADATA"
   (	"DOC_NAME" VARCHAR2(100),
	"STUDY_UID" VARCHAR2(128 CHAR),
	"SERIES_UID" VARCHAR2(128 CHAR),
	"SOP_INSTANCE_UID" VARCHAR2(128 CHAR),
	"MODALITY" VARCHAR2(2 CHAR),
	"SOP_CLASS" VARCHAR2(128 CHAR),
	"AVAILABILITY" VARCHAR2(8 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_DOC_REFS_WRK"
   (	"DOC_ID" NUMBER(*,0),
	"REF_BY_DOC_ID" NUMBER(*,0),
	"DOC_NAME" VARCHAR2(100),
	"REF_BY_DOC_NAME" VARCHAR2(100)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_STD_ATTRS_WRK"
   (	"SA_ID" NUMBER(*,0),
	"TAG" VARCHAR2(8),
	"NAME" VARCHAR2(128 CHAR),
	"VR" VARCHAR2(5),
	"VM" VARCHAR2(128),
	"ISRETIRED" NUMBER(1,0) DEFAULT 0,
	"ISWILDCARD" NUMBER(1,0) DEFAULT 0,
	"DEFINER_NAME" VARCHAR2(5) DEFAULT 'DICOM',
	"DEFINER_UID" VARCHAR2(128) DEFAULT '1.2.840.10008.1',
	"DOC_ID" NUMBER(*,0)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PRV_ATTRS_WRK"
   (	"PA_ID" NUMBER(*,0),
	"TAG" VARCHAR2(8),
	"DEFINER_NAME" VARCHAR2(64 CHAR),
	"NAME" VARCHAR2(128 CHAR),
	"START_TAG" VARCHAR2(8 CHAR),
	"END_TAG" VARCHAR2(8 CHAR),
	"DEFINER_UID" VARCHAR2(128),
	"DOC_ID" NUMBER(*,0),
	"VR" VARCHAR2(5),
	"VM" VARCHAR2(128),
	"ISRETIRED" NUMBER(1,0) DEFAULT 0,
	"ISWILDCARD" NUMBER(1,0) DEFAULT 0
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_DICT_ATTRS_WRK"
   (	"DA_ID" NUMBER(*,0),
	"SA_ID" NUMBER(*,0),
	"PA_ID" NUMBER(*,0)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_DAREFS_WRK"
   (	"DA_ID" NUMBER(*,0),
	"DOC_ID" NUMBER(*,0)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_MAPPED_PATHS_WRK"
   (	"MPID" NUMBER(*,0),
	"ATTR_TAG" VARCHAR2(1999),
	"DOC_ID" NUMBER(*,0),
	"REL_PATH" VARCHAR2(1999 CHAR),
	"OCCURS" NUMBER(1,0) DEFAULT 0,
	"NOT_EMPTY" NUMBER(1,0) DEFAULT 0,
	"WRITE_TAG" NUMBER(1,0) DEFAULT 0,
	"WRITE_DEFINER" NUMBER(1,0) DEFAULT 0,
	"WRITE_NAME" NUMBER(1,0) DEFAULT 0,
	"WRITE_RAW_VALUE" NUMBER(1,0) DEFAULT 0
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_ANON_RULES_WRK"
   (	"DOC_ID" NUMBER(*,0),
	"RULE_TYPE_ID" NUMBER,
	"ANON_ACTION_TYPE_ID" NUMBER,
	"ANON_VALUE" VARCHAR2(128 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_ANON_ATTRS_WRK"
   (	"AAID" NUMBER(*,0),
	"DOC_ID" NUMBER(*,0),
	"TAG" VARCHAR2(1999),
	"ANON_ACTION_TYPE_ID" NUMBER,
	"ANON_VALUE" VARCHAR2(128 CHAR),
	"TAG_DESC" VARCHAR2(1999 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_RT_PREF_PARAMS_WRK"
   (	"PPID" NUMBER(*,0),
	"NAME" VARCHAR2(64),
	"VALUE" VARCHAR2(1999 CHAR),
	"DOC_ID" NUMBER(*,0),
	"PARAM_DESC" VARCHAR2(1999 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_UID_DEFS_WRK"
   (	"UDID" NUMBER(*,0),
	"DICOM_UID" VARCHAR2(128),
	"DOC_ID" NUMBER(*,0),
	"NAME" VARCHAR2(128 CHAR),
	"CLASSIFICATION" VARCHAR2(64),
	"ISLE" NUMBER(1,0) DEFAULT 1,
	"ISEVR" NUMBER(1,0) DEFAULT 1,
	"ISCOMPRESSED" NUMBER(1,0) DEFAULT 1,
	"ISRETIRED" NUMBER(1,0) DEFAULT 0,
	"CONTENTTYPE" VARCHAR2(64) DEFAULT 'IMAGE',
	"UID_DESC" VARCHAR2(1999 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_STORED_TAGS_WRK"
   (	"STID" NUMBER(*,0),
	"ATTR_TAG" VARCHAR2(1999),
	"DOC_ID" NUMBER(*,0)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_DATA_MODEL_WRK"
   (	"MODEL_ID" NUMBER(*,0),
	"MODEL_NAME" VARCHAR2(100) DEFAULT 'DEFAULT',
	"ISRETIRED" NUMBER DEFAULT 0
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_PRED_WRK"
   (	"PID" NUMBER(*,0),
	"FPID" NUMBER(*,0),
	"POS" NUMBER(3,0),
	"REF_PID" NUMBER(*,0),
	"OP" NUMBER(3,0),
	"DESCRIPTION" VARCHAR2(1999 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_PRED_SET_WRK"
   (	"PSID" NUMBER(*,0),
	"NAME" VARCHAR2(64 CHAR),
	"PSTYPE" NUMBER(1,0),
	"PID" NUMBER(*,0),
	"STATUS" NUMBER(1,0),
	"SUPER" NUMBER(*,0),
	"DOC_ID" NUMBER(*,0),
	"DESCRIPTION" VARCHAR2(1999 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_MACRO_PAR_WRK"
   (	"PSID" NUMBER(*,0),
	"PARNAME" VARCHAR2(128 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_MACRO_DEP_WRK"
   (	"PSID" NUMBER(*,0),
	"DEP_PSID" NUMBER(*,0)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_PRED_PAR_WRK"
   (	"PID" NUMBER(*,0),
	"PARNAME" VARCHAR2(128 CHAR),
	"PARVAL" VARCHAR2(1999 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_LOCATORPATHS_WRK"
   (	"DOC_ID" NUMBER(*,0),
	"PSID" NUMBER(*,0),
	"LOCATOR_PATH" VARCHAR2(1999 CHAR),
	"HAS_MACRO_PARAM" NUMBER(1,0),
	"IS_COVERED" NUMBER(1,0)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_ACTION_WRK"
   (	"PID" NUMBER(*,0),
	"EVENT" VARCHAR2(20 CHAR),
	"ACTION" VARCHAR2(20 CHAR),
	"DESCRIPTION" VARCHAR2(1999 CHAR)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_DOCS"
   (	"DOC_ID" NUMBER(*,0),
	"DOC_NAME" VARCHAR2(100 CHAR),
	"DOC_TYPE_ID" NUMBER,
	"DOC_CONTENT" "SYS"."XMLTYPE" ,
	"ORACLE_INSTALL" NUMBER(1,0) DEFAULT 0,
	"CREATE_DATE" DATE DEFAULT SYSDATE
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_MAPPING_DOCS"
   (	"DOC_ID" NUMBER(*,0),
	"ROOT_TAG" VARCHAR2(128 CHAR),
	"METADATA_NS" VARCHAR2(700 CHAR),
	"MAPPED_ELEM" VARCHAR2(128 CHAR),
	"UNMAPPED_ELEM" VARCHAR2(128 CHAR),
	"XSLT" "SYS"."XMLTYPE" ,
	"IS_COVERED" NUMBER(1,0)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_PREFS_LOOKUP"
   (	"PARAM_NAME" VARCHAR2(64),
	"PARAM_TYPE" VARCHAR2(15),
	"MIN_VAL" NUMBER,
	"MAX_VAL" NUMBER,
	"DEFAULT_NUMBER_VAL" NUMBER,
	"DEFAULT_STR_VAL" VARCHAR2(1999),
	"DEFAULT_STR_VALUES" "ORDSYS"."ORD_STR_LIST" ,
	"VALID_STR_VALUES" "ORDSYS"."ORD_STR_LIST" ,
	"PARAM_DESC" VARCHAR2(4000)
   )
 NESTED TABLE "DEFAULT_STR_VALUES" STORE AS "ORDDCM_PREFS_DEF_VALUES_TAB"
 RETURN AS VALUE
 NESTED TABLE "VALID_STR_VALUES" STORE AS "ORDDCM_PREFS_VALID_VALUES_TAB"
 RETURN AS VALUE;

CREATE TABLE "ORDDATA"."ORDDCM_CT_PRED_OPRD"
   (	"PID" NUMBER(*,0),
	"POS" NUMBER(3,0),
	"OPERAND" "SYS"."XMLTYPE"
   ) ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_DOCS_TMP"
   (	"DOC_ID" NUMBER(*,0),
	"DOC_NAME" VARCHAR2(100 CHAR),
	"DOC_TYPE_ID" NUMBER,
	"DOC_CONTENT" "SYS"."XMLTYPE" ,
	"ORACLE_INSTALL" NUMBER(1,0) DEFAULT 0,
	"CREATE_DATE" DATE DEFAULT SYSDATE
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_STD_ATTRS_TMP"
   (	"SA_ID" NUMBER(*,0),
	"TAG" VARCHAR2(8),
	"NAME" VARCHAR2(128 CHAR),
	"VR" VARCHAR2(5),
	"VM" VARCHAR2(128),
	"ISRETIRED" NUMBER(1,0) DEFAULT 0,
	"ISWILDCARD" NUMBER(1,0) DEFAULT 0,
	"DEFINER_NAME" VARCHAR2(5) DEFAULT 'DICOM',
	"DEFINER_UID" VARCHAR2(128) DEFAULT '1.2.840.10008.1',
	"DOC_ID" NUMBER(*,0)
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_PRV_ATTRS_TMP"
   (	"PA_ID" NUMBER(*,0),
	"TAG" VARCHAR2(8),
	"DEFINER_NAME" VARCHAR2(64 CHAR),
	"NAME" VARCHAR2(128 CHAR),
	"START_TAG" VARCHAR2(8 CHAR),
	"END_TAG" VARCHAR2(8 CHAR),
	"DEFINER_UID" VARCHAR2(128),
	"DOC_ID" NUMBER(*,0),
	"VR" VARCHAR2(5),
	"VM" VARCHAR2(128),
	"ISRETIRED" NUMBER(1,0) DEFAULT 0,
	"ISWILDCARD" NUMBER(1,0) DEFAULT 0
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_DICT_ATTRS_TMP"
   (	"DA_ID" NUMBER(*,0),
	"SA_ID" NUMBER(*,0),
	"PA_ID" NUMBER(*,0)
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_DOC_REFS_TMP"
   (	"DOC_ID" NUMBER(*,0),
	"REF_BY_DOC_ID" NUMBER(*,0),
	"DOC_NAME" VARCHAR2(100),
	"REF_BY_DOC_NAME" VARCHAR2(100)
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_CT_DAREFS_TMP"
   (	"DA_ID" NUMBER(*,0),
	"DOC_ID" NUMBER(*,0)
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_MAPPING_DOCS_TMP"
   (	"DOC_ID" NUMBER(*,0),
	"ROOT_TAG" VARCHAR2(128 CHAR),
	"METADATA_NS" VARCHAR2(700 CHAR),
	"MAPPED_ELEM" VARCHAR2(128 CHAR),
	"UNMAPPED_ELEM" VARCHAR2(128 CHAR),
	"XSLT" "SYS"."XMLTYPE" ,
	"IS_COVERED" NUMBER(1,0)
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_MAPPED_PATHS_TMP"
   (	"MPID" NUMBER(*,0),
	"ATTR_TAG" VARCHAR2(1999),
	"DOC_ID" NUMBER(*,0),
	"REL_PATH" VARCHAR2(1999 CHAR),
	"OCCURS" NUMBER(1,0) DEFAULT 0,
	"NOT_EMPTY" NUMBER(1,0) DEFAULT 0,
	"WRITE_TAG" NUMBER(1,0) DEFAULT 0,
	"WRITE_DEFINER" NUMBER(1,0) DEFAULT 0,
	"WRITE_NAME" NUMBER(1,0) DEFAULT 0,
	"WRITE_RAW_VALUE" NUMBER(1,0) DEFAULT 0
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_ANON_RULES_TMP"
   (	"DOC_ID" NUMBER(*,0),
	"RULE_TYPE_ID" NUMBER,
	"ANON_ACTION_TYPE_ID" NUMBER,
	"ANON_VALUE" VARCHAR2(128 CHAR)
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_ANON_ATTRS_TMP"
   (	"AAID" NUMBER(*,0),
	"DOC_ID" NUMBER(*,0),
	"TAG" VARCHAR2(1999),
	"ANON_ACTION_TYPE_ID" NUMBER,
	"ANON_VALUE" VARCHAR2(128 CHAR),
	"TAG_DESC" VARCHAR2(1999 CHAR)
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_RT_PREF_PARAMS_TMP"
   (	"PPID" NUMBER(*,0),
	"NAME" VARCHAR2(64),
	"VALUE" VARCHAR2(1999 CHAR),
	"DOC_ID" NUMBER(*,0),
	"PARAM_DESC" VARCHAR2(1999 CHAR)
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_UID_DEFS_TMP"
   (	"UDID" NUMBER(*,0),
	"DICOM_UID" VARCHAR2(128),
	"DOC_ID" NUMBER(*,0),
	"NAME" VARCHAR2(128 CHAR),
	"CLASSIFICATION" VARCHAR2(64),
	"ISLE" NUMBER(1,0) DEFAULT 1,
	"ISEVR" NUMBER(1,0) DEFAULT 1,
	"ISCOMPRESSED" NUMBER(1,0) DEFAULT 1,
	"ISRETIRED" NUMBER(1,0) DEFAULT 0,
	"CONTENTTYPE" VARCHAR2(64) DEFAULT 'IMAGE',
	"UID_DESC" VARCHAR2(1999 CHAR)
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_STORED_TAGS_TMP"
   (	"STID" NUMBER(*,0),
	"ATTR_TAG" VARCHAR2(1999),
	"DOC_ID" NUMBER(*,0)
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_CT_PRED_TMP"
   (	"PID" NUMBER(*,0),
	"FPID" NUMBER(*,0),
	"POS" NUMBER(3,0),
	"REF_PID" NUMBER(*,0),
	"OP" NUMBER(3,0),
	"DESCRIPTION" VARCHAR2(1999 CHAR)
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_CT_PRED_OPRD_TMP"
   (	"PID" NUMBER(*,0),
	"POS" NUMBER(3,0),
	"OPERAND" "SYS"."XMLTYPE"
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_CT_PRED_SET_TMP"
   (	"PSID" NUMBER(*,0),
	"NAME" VARCHAR2(64 CHAR),
	"PSTYPE" NUMBER(1,0),
	"PID" NUMBER(*,0),
	"STATUS" NUMBER(1,0),
	"SUPER" NUMBER(*,0),
	"DOC_ID" NUMBER(*,0),
	"DESCRIPTION" VARCHAR2(1999 CHAR)
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_CT_PRED_PAR_TMP"
   (	"PID" NUMBER(*,0),
	"PARNAME" VARCHAR2(128 CHAR),
	"PARVAL" VARCHAR2(1999 CHAR)
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_CT_LOCATORPATHS_TMP"
   (	"DOC_ID" NUMBER(*,0),
	"PSID" NUMBER(*,0),
	"LOCATOR_PATH" VARCHAR2(1999 CHAR),
	"HAS_MACRO_PARAM" NUMBER(1,0),
	"IS_COVERED" NUMBER(1,0)
   ) ON COMMIT PRESERVE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "ORDDATA"."ORDDCM_CT_ACTION_TMP"
   (	"PID" NUMBER(*,0),
	"EVENT" VARCHAR2(20 CHAR),
	"ACTION" VARCHAR2(20 CHAR),
	"DESCRIPTION" VARCHAR2(1999 CHAR)
   ) ON COMMIT PRESERVE ROWS ;

CREATE TABLE "ORDDATA"."ORDDCM_DOCS_WRK"
   (	"DOC_ID" NUMBER(*,0),
	"DOC_NAME" VARCHAR2(100 CHAR),
	"DOC_TYPE_ID" NUMBER,
	"DOC_CONTENT" "SYS"."XMLTYPE" ,
	"ORACLE_INSTALL" NUMBER(1,0) DEFAULT 0,
	"CREATE_DATE" DATE DEFAULT SYSDATE
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_MAPPING_DOCS_WRK"
   (	"DOC_ID" NUMBER(*,0),
	"ROOT_TAG" VARCHAR2(128 CHAR),
	"METADATA_NS" VARCHAR2(700 CHAR),
	"MAPPED_ELEM" VARCHAR2(128 CHAR),
	"UNMAPPED_ELEM" VARCHAR2(128 CHAR),
	"XSLT" "SYS"."XMLTYPE" ,
	"IS_COVERED" NUMBER(1,0)
   ) ;

CREATE TABLE "ORDDATA"."ORDDCM_CT_PRED_OPRD_WRK"
   (	"PID" NUMBER(*,0),
	"POS" NUMBER(3,0),
	"OPERAND" "SYS"."XMLTYPE"
   ) ;

