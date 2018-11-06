-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_DOCUMENT_TYPES" ("DOC_TYPE",
"SCHEMA_URL",
"DOC_TYPE_DSC") AS
  SELECT DOC_TYPE
       ,SCHEMA_URL
       ,DOC_TYPE_DSC
FROM ORDDATA.ORDDCM_DOC_TYPES
WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_DOCUMENTS" ("DOC_ID",
"DOC_NAME",
"DOC_TYPE",
"CREATE_DATE",
"INSTALLED_BY_ORACLE") AS
  SELECT  docs.DOC_ID,
        docs.DOC_NAME,
        doc_types.DOC_TYPE,
        docs.CREATE_DATE,
        docs.ORACLE_INSTALL INSTALLED_BY_ORACLE
FROM    ORDDATA.ORDDCM_DOCS_tmp docs, ORDDATA.ORDDCM_DOC_TYPES doc_types
WHERE   docs.DOC_TYPE_ID = doc_types.DOC_TYPE_ID
WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_DBRELEASE_DOCS" ("DOC_NAME",
"DOC_TYPE",
"LOAD_ORDER") AS
  SELECT  idocs.DOC_NAME,
        idocs.DOC_TYPE,
        idocs.LOAD_ORDER
FROM    ORDDATA.ORDDCM_INSTALL_DOCS idocs
WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_CONSTRAINT_NAMES" ("NAME") AS
  SELECT  NAME
FROM ORDDATA.ORDDCM_CT_PRED_SET_TMP
WHERE PSTYPE=1 AND SUPER IS NULL AND STATUS=1
WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_DOCUMENT_REFS" ("DOC_NAME",
"REF_BY_DOC_NAME") AS
  SELECT  DOC_NAME,
        REF_BY_DOC_NAME
FROM    ORDDATA.ORDDCM_DOC_REFS_TMP
WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_DOCS_USR" ("DOC_ID",
"DOC_NAME",
"DOC_TYPE_ID",
"ORACLE_INSTALL",
"CREATE_DATE") AS
  select DOC_ID, DOC_NAME, DOC_TYPE_ID, ORACLE_INSTALL, CREATE_DATE
 from ORDDATA.ORDDCM_DOCS_TMP
 with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_DOC_REFS_USR" ("DOC_ID",
"REF_BY_DOC_ID",
"DOC_NAME",
"REF_BY_DOC_NAME") AS
  SELECT  DOC_ID ,REF_BY_DOC_ID ,DOC_NAME  ,REF_BY_DOC_NAME
FROM  ORDDATA.ORDDCM_DOC_REFS_TMP
WITH READ ONLY;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_STD_ATTRS_USR" ("SA_ID",
"TAG",
"NAME",
"VR",
"VM",
"ISRETIRED",
"ISWILDCARD",
"DEFINER_NAME",
"DEFINER_UID",
"DOC_ID") AS
  select SA_ID ,TAG ,NAME ,VR ,VM ,ISRETIRED ,ISWILDCARD
         ,DEFINER_NAME  ,DEFINER_UID  ,DOC_ID
  from ORDDATA.ORDDCM_STD_ATTRS_TMP
  with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_PRV_ATTRS_USR" ("PA_ID",
"TAG",
"DEFINER_NAME",
"NAME",
"START_TAG",
"END_TAG",
"DEFINER_UID",
"DOC_ID",
"VR",
"VM",
"ISRETIRED",
"ISWILDCARD") AS
  select PA_ID ,TAG ,DEFINER_NAME ,NAME ,START_TAG ,END_TAG ,DEFINER_UID
       ,DOC_ID ,VR ,VM  ,ISRETIRED ,ISWILDCARD
  from ORDDATA.ORDDCM_PRV_ATTRS_TMP
  with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_DICT_ATTRS_USR" ("DA_ID",
"SA_ID",
"PA_ID") AS
  select DA_ID ,SA_ID ,PA_ID
from ORDDATA.ORDDCM_DICT_ATTRS_TMP
with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_CT_DAREFS_USR" ("DA_ID",
"DOC_ID") AS
  select DA_ID, DOC_ID
from ORDDATA.ORDDCM_CT_DAREFS_TMP
with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_MAPPING_DOCS_USR" ("DOC_ID",
"ROOT_TAG",
"METADATA_NS",
"MAPPED_ELEM",
"UNMAPPED_ELEM",
"XSLT") AS
  select DOC_ID ,ROOT_TAG ,METADATA_NS ,MAPPED_ELEM ,UNMAPPED_ELEM ,XSLT
from  ORDDATA.ORDDCM_MAPPING_DOCS_TMP
with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_MAPPED_PATHS_USR" ("MPID",
"ATTR_TAG",
"DOC_ID",
"REL_PATH",
"OCCURS",
"NOT_EMPTY",
"WRITE_TAG",
"WRITE_DEFINER",
"WRITE_NAME",
"WRITE_RAW_VALUE") AS
  select
   MPID
  ,ATTR_TAG
  ,DOC_ID
  ,REL_PATH
  ,OCCURS
  ,NOT_EMPTY
  ,WRITE_TAG
  ,WRITE_DEFINER
  ,WRITE_NAME
  ,WRITE_RAW_VALUE
from  ORDDATA.ORDDCM_MAPPED_PATHS_TMP
with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_STORED_TAGS_USR" ("ATTR_TAG",
"DOC_ID") AS
  select ATTR_TAG, DOC_ID
from  ORDDATA.ORDDCM_STORED_TAGS_TMP
with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_ANON_RULES_USR" ("DOC_ID",
"RULE_TYPE_ID",
"ANON_ACTION_TYPE_ID",
"ANON_VALUE") AS
  select
    DOC_ID
   ,RULE_TYPE_ID
   ,ANON_ACTION_TYPE_ID
   ,ANON_VALUE
from  ORDDATA.ORDDCM_ANON_RULES_TMP
with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_ANON_ATTRS_USR" ("AAID",
"DOC_ID",
"TAG",
"ANON_ACTION_TYPE_ID",
"ANON_VALUE",
"TAG_DESC") AS
  select
    AAID
   ,DOC_ID
   ,TAG
   ,ANON_ACTION_TYPE_ID
   ,ANON_VALUE
   ,TAG_DESC
from  ORDDATA.ORDDCM_ANON_ATTRS_TMP
with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_RT_PREF_PARAMS_USR" ("PPID",
"NAME",
"VALUE",
"DOC_ID",
"PARAM_DESC") AS
  select PPID ,NAME ,VALUE ,DOC_ID ,PARAM_DESC
from  ORDDATA.ORDDCM_RT_PREF_PARAMS_TMP
with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_UID_DEFS_USR" ("UDID",
"DICOM_UID",
"DOC_ID",
"NAME",
"CLASSIFICATION",
"ISLE",
"ISEVR",
"ISCOMPRESSED",
"ISRETIRED",
"CONTENTTYPE",
"UID_DESC") AS
  select
   UDID
  ,DICOM_UID
  ,DOC_ID
  ,NAME
  ,CLASSIFICATION
  ,ISLE
  ,ISEVR
  ,ISCOMPRESSED
  ,ISRETIRED
  ,CONTENTTYPE
  ,UID_DESC
from  ORDDATA.ORDDCM_UID_DEFS_TMP
with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_CT_PRED_USR" ("PID",
"FPID",
"POS",
"REF_PID",
"OP",
"DESCRIPTION") AS
  select PID, FPID, POS, REF_PID, OP, DESCRIPTION
  from ORDDATA.ORDDCM_CT_PRED_TMP
  with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_CT_PRED_OPRD_USR" ("PID",
"POS",
"OPERAND") AS
  select PID, POS, OPERAND
  from ORDDATA.ORDDCM_CT_PRED_OPRD_TMP
  with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_CT_PRED_SET_USR" ("PSID",
"NAME",
"PSTYPE",
"PID",
"STATUS",
"DOC_ID",
"SUPER",
"DESCRIPTION") AS
  select PSID, NAME, PSTYPE, PID, STATUS, DOC_ID, SUPER, DESCRIPTION
  from ORDDATA.ORDDCM_CT_PRED_SET_TMP
  with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_CT_PRED_PAR_USR" ("PID",
"PARNAME",
"PARVAL") AS
  select PID, PARNAME, PARVAL
  from ORDDATA.ORDDCM_CT_PRED_PAR_TMP
  with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_CT_LOCATORPATHS_USR" ("DOC_ID",
"PSID",
"LOCATOR_PATH",
"HAS_MACRO_PARAM",
"IS_COVERED") AS
  select DOC_ID, PSID, LOCATOR_PATH, HAS_MACRO_PARAM, IS_COVERED
  from ORDDATA.ORDDCM_CT_LOCATORPATHS_TMP
  with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_CT_ACTION_USR" ("PID",
"EVENT",
"ACTION",
"DESCRIPTION") AS
  select PID, EVENT, ACTION, DESCRIPTION
  from ORDDATA.ORDDCM_CT_ACTION_TMP
  with read only;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDDATA"."ORDDCM_CONFORMANCE_VLD_MSGS" ("SOP_INSTANCE_UID",
"RULE_NAME",
"MESSAGE",
"MSG_TYPE",
"MSG_TIME") AS
  SELECT SOP_INSTANCE_UID, RULE_NAME, MESSAGE, MSG_TYPE, MSG_TIME
FROM ORDDATA.ORDDCM_CT_VLD_MSG
WHERE USER_NAME=USER;

