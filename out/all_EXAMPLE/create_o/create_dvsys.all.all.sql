CREATE USER "DVSYS" IDENTIFIED BY VALUES 'S:9CA1618D1BA6D402679C905AAD7BEA5AA2B4900D358EAD50F4C9B4CBDC66;H:72D4078ECE7080EA9B20BDF33D7FEBA2;T:398FDC02370C565B7EC5D25F7DE79EB92F4761FBCF48CD4A45E310E732C362B4233FFB186F386AD4F1FD9FFD6F3B53175DD8670502FAD9679E4D9576A1A989CC75ECAB00F0E52A0E830BF1CF5DD4C4A4;6C00212A449D60A5'
      DEFAULT TABLESPACE "SYSAUX"
      TEMPORARY TABLESPACE "TEMP"
      PASSWORD EXPIRE
      ACCOUNT LOCK;

ALTER USER "DVSYS" DEFAULT ROLE ALL;
CREATE SEQUENCE  "DVSYS"."AUDIT_TRAIL$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."FACTOR_LINK$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."COMMAND_RULE$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."CODE$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."MAC_POLICY_FACTOR$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."REALM_OBJECT$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."RULE$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."MAC_POLICY$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."POLICY_LABEL$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."ROLE$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."FACTOR$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."IDENTITY$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."RULE_SET$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."RULE_SET_RULE$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."IDENTITY_MAP$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."FACTOR_TYPE$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."REALM_AUTH$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DVSYS"."REALM$_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5000 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "DVSYS"."KZV$UTL_LIBT" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "DVSYS"."KZV$FAC_LIBT" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "DVSYS"."KZV$RUL_LIBT" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "DVSYS"."KZV$ADM_LIBT" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE LIBRARY "DVSYS"."KZV$RSRC_LIBT" TRUSTED AS STATIC ;
CREATE OR REPLACE NONEDITIONABLE SYNONYM "DVSYS"."OUT" FOR "DVSYS"."DBMS_MACOUT";
CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."KU$_DV_ISR_T" as object
(
  vers_major    char(1),                             /* UDT major version # */
  vers_minor    char(1)                              /* UDT minor version # */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."KU$_DV_ISRM_T" as object
(
  vers_major    char(1),                             /* UDT major version # */
  vers_minor    char(1),                             /* UDT minor version # */
  schema_name   varchar2(30)     /* schema to be protected by Staging Realm */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."KU$_DV_REALM_T" as object
(
  vers_major    char(1),                             /* UDT major version # */
  vers_minor    char(1),                             /* UDT minor version # */
  name          varchar2(90),               /* name of database vault realm */
  description   varchar2(1024),      /* description of database vault realm */
  language      varchar2(3),               /* language of realm description */
  enabled       varchar2(1),       /* enabled state of database vault realm */
  audit_options varchar2(78)       /* audit options of database vault realm */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."KU$_DV_REALM_MEMBER_T" as object
(
  vers_major    char(1),                             /* UDT major version # */
  vers_minor    char(1),                             /* UDT minor version # */
  name          varchar2(90),               /* name of database vault realm */
  object_owner  varchar2(30),    /* owner of object protected by this realm */
  object_name   varchar2(128),    /* name of object protected by this realm */
  object_type   varchar2(32)      /* type of object protected by this realm */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."KU$_DV_REALM_AUTH_T" as object
(
  vers_major    char(1),                             /* UDT major version # */
  vers_minor    char(1),                             /* UDT minor version # */
  realm_name    varchar2(90),               /* name of database vault realm */
  grantee       varchar2(30),         /* owner of (or participant in) realm */
  rule_set_name varchar2(90),      /* rule set used to authorize (optional) */
  auth_options  varchar2(42)        /* authorization (participant or owner) */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."KU$_DV_RULE_T" as object
(
  vers_major    char(1),                             /* UDT major version # */
  vers_minor    char(1),                             /* UDT minor version # */
  rule_name     varchar2(90),                               /* name of Rule */
  rule_expr     varchar2(1024),       /* PL/SQL boolean expression for Rule */
  language      varchar2(3)                        /* language of Rule name */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."KU$_DV_RULE_SET_T" as object
(
  vers_major      char(1),                           /* UDT major version # */
  vers_minor      char(1),                           /* UDT minor version # */
  rule_set_name   varchar2(90),                         /* name of Rule Set */
  description     varchar2(1024),                /* description of Rule Set */
  language        varchar2(3),          /* language of Rule Set description */
  enabled         varchar2(1),      /* the Rule Set is enabled ('Y' or 'N') */
  eval_options    varchar2(36),                 /* evaluate all or any Rule */
  audit_options   varchar2(78),  /* auditing: off, on failure or on success */
  fail_options    varchar2(39),    /* show an error message, or stay silent */
  fail_message    varchar2(80),      /* error message to display on failure */
  fail_code       varchar2(10),   /* code to associate with failure message */
  handler_options varchar2(43),  /* error handler: off, on fail, on success */
  handler         varchar2(1024) /* PL/SQL routine for custom event handler */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."KU$_DV_RULE_SET_MEMBER_T" as object
(
  vers_major      char(1),                           /* UDT major version # */
  vers_minor      char(1),                           /* UDT minor version # */
  rule_set_name   varchar2(90),                         /* name of Rule Set */
  rule_name       varchar2(90),                             /* name of Rule */
  rule_order      number,                         /* unused in this release */
  enabled         varchar2(1)       /* the Rule Set is enabled ('Y' or 'N') */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."KU$_DV_COMMAND_RULE_T" as object
(
  vers_major      char(1),                           /* UDT major version # */
  vers_minor      char(1),                           /* UDT minor version # */
  command         varchar2(30),                 /* SQL statement to protect */
  rule_set_name   varchar2(90),                         /* name of Rule Set */
  object_owner    varchar2(30),                             /* schema owner */
  object_name     varchar2(128),       /* object name (may be wildcard '%') */
  enabled         varchar2(1)   /* the Command Rule is enabled ('Y' or 'N') */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."KU$_DV_ROLE_T" as object
(
  vers_major         char(1),                        /* UDT major version # */
  vers_minor         char(1),                        /* UDT minor version # */
  role               varchar2(30),                             /* Role name */
  enabled            varchar2(1),                      /* Enabled? (Y or N) */
  rule_set_name      varchar2(90)                          /* Rule Set name */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."KU$_DV_FACTOR_T" as object
(
  vers_major         char(1),                        /* UDT major version # */
  vers_minor         char(1),                        /* UDT minor version # */
  factor_name        varchar2(30),                           /* Factor name */
  factor_type_name   varchar2(90),                      /* Factor Type name */
  description        varchar2(4000),                         /* Description */
  language           varchar2(3),         /* language of Factor description */
  rule_set_name      varchar2(90),                         /* Rule Set name */
  get_expr           varchar2(1024),                      /* Get expression */
  validate_expr      varchar2(1024),                 /* Validate expression */
  identify_by        varchar2(40),                           /* Identify by */
  labeled_by         varchar2(40),                            /* Labeled by */
  eval_options       varchar2(40),                          /* Eval options */
  audit_options      varchar2(400),                        /* Audit options */
  fail_options       varchar2(37)                           /* Fail options */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."KU$_DV_FACTOR_LINK_T" as object
(
  vers_major         char(1),                        /* UDT major version # */
  vers_minor         char(1),                        /* UDT minor version # */
  parent_factor_name varchar2(30),                    /* Parent Factor name */
  child_factor_name  varchar2(30),                     /* Child Factor name */
  label_indicator    varchar2(1) /* Contributes to label of parent (Y or N) */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."KU$_DV_FACTOR_TYPE_T" as object
(
  vers_major      char(1),                           /* UDT major version # */
  vers_minor      char(1),                           /* UDT minor version # */
  name            varchar2(90),                         /* Factor type name */
  description     varchar2(1024),  /* Description of purpose of Factor type */
  language        varchar2(3)        /* language of Factor type description */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."KU$_DV_IDENTITY_T" as object
(
  vers_major      char(1),                           /* UDT major version # */
  vers_minor      char(1),                           /* UDT minor version # */
  factor_name     varchar2(30),                         /* Factor type name */
  value           varchar2(1024),  /* Description of purpose of Factor type */
  trust_level     number    /* Trust, relative to other ids for same Factor */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."KU$_DV_IDENTITY_MAP_T" as object
(
  vers_major               char(1),                  /* UDT major version # */
  vers_minor               char(1),                  /* UDT minor version # */
  identity_factor_name     varchar2(30),           /* Factor the map is for */
  identity_factor_value    varchar2(1024),     /* Value the map will assume */
  parent_factor_name       varchar2(30),              /* parent Factor link */
  child_factor_name        varchar2(30),               /* child Factor link */
  operation                varchar2(30),             /* relational operator */
  operand1                 varchar2(30),                    /* left operand */
  operand2                 varchar2(30)                    /* right operand */
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."EVENT_STATUS_ROW_TYPE" AS object
(
  event   number,
  enabled varchar2(5)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DVSYS"."EVENT_STATUS_TABLE_TYPE"
  AS TABLE OF DVSYS.event_status_row_type
/

CREATE TABLE "DVSYS"."CONFIG$"
   (	"STATUS" NUMBER
   ) ;

CREATE TABLE "DVSYS"."ENFORCE$"
   (	"STATUS" NUMBER
   ) ;

CREATE TABLE "DVSYS"."MAC_POLICY$"
   (	"ID#" NUMBER,
	"POLICY_ID#" NUMBER,
	"ALGORITHM_CODE_ID#" NUMBER,
	"ERROR_LABEL" VARCHAR2(4000),
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."CODE$"
   (	"ID#" NUMBER,
	"CODE_GROUP" VARCHAR2(128),
	"CODE" VARCHAR2(128),
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."CODE_T$"
   (	"ID#" NUMBER,
	"VALUE" VARCHAR2(4000),
	"DESCRIPTION" VARCHAR2(1024),
	"LANGUAGE" VARCHAR2(3)
   ) ;

CREATE TABLE "DVSYS"."MAC_POLICY_FACTOR$"
   (	"ID#" NUMBER,
	"FACTOR_ID#" NUMBER,
	"MAC_POLICY_ID#" NUMBER,
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."FACTOR$"
   (	"ID#" NUMBER,
	"NAME" VARCHAR2(128),
	"FACTOR_TYPE_ID#" NUMBER,
	"ASSIGN_RULE_SET_ID#" NUMBER,
	"GET_EXPR" VARCHAR2(1024),
	"VALIDATE_EXPR" VARCHAR2(1024),
	"IDENTIFIED_BY" NUMBER,
	"NAMESPACE" VARCHAR2(128),
	"NAMESPACE_ATTRIBUTE" VARCHAR2(128),
	"LABELED_BY" NUMBER,
	"EVAL_OPTIONS" NUMBER,
	"AUDIT_OPTIONS" NUMBER,
	"FAIL_OPTIONS" NUMBER,
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."FACTOR_T$"
   (	"ID#" NUMBER,
	"DESCRIPTION" VARCHAR2(4000),
	"LANGUAGE" VARCHAR2(3)
   ) ;

CREATE TABLE "DVSYS"."FACTOR_TYPE$"
   (	"ID#" NUMBER,
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."FACTOR_TYPE_T$"
   (	"ID#" NUMBER,
	"NAME" VARCHAR2(128),
	"DESCRIPTION" VARCHAR2(1024),
	"LANGUAGE" VARCHAR2(3)
   ) ;

CREATE TABLE "DVSYS"."COMMAND_RULE$"
   (	"ID#" NUMBER,
	"CODE_ID#" NUMBER,
	"RULE_SET_ID#" NUMBER,
	"OBJECT_OWNER" VARCHAR2(128),
	"OBJECT_OWNER_UID#" NUMBER,
	"OBJECT_NAME" VARCHAR2(128),
	"ENABLED" VARCHAR2(1),
	"PRIVILEGE_SCOPE" NUMBER,
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."FACTOR_LINK$"
   (	"ID#" NUMBER,
	"PARENT_FACTOR_ID#" NUMBER,
	"CHILD_FACTOR_ID#" NUMBER,
	"LABEL_IND" VARCHAR2(1),
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."ROLE$"
   (	"ID#" NUMBER,
	"ROLE" VARCHAR2(128),
	"RULE_SET_ID#" NUMBER,
	"ENABLED" VARCHAR2(1),
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."IDENTITY$"
   (	"ID#" NUMBER,
	"FACTOR_ID#" NUMBER,
	"VALUE" VARCHAR2(1024),
	"TRUST_LEVEL" NUMBER,
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."IDENTITY_MAP$"
   (	"ID#" NUMBER,
	"IDENTITY_ID#" NUMBER,
	"FACTOR_LINK_ID#" NUMBER,
	"OPERATION_CODE_ID#" NUMBER,
	"OPERAND1" VARCHAR2(1024),
	"OPERAND2" VARCHAR2(1024),
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."RULE$"
   (	"ID#" NUMBER,
	"RULE_EXPR" VARCHAR2(1024),
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."RULE_T$"
   (	"ID#" NUMBER,
	"NAME" VARCHAR2(128),
	"LANGUAGE" VARCHAR2(3)
   ) ;

CREATE TABLE "DVSYS"."POLICY_LABEL$"
   (	"ID#" NUMBER,
	"IDENTITY_ID#" NUMBER,
	"POLICY_ID#" NUMBER,
	"LABEL_ID#" NUMBER,
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."RULE_SET_RULE$"
   (	"ID#" NUMBER,
	"RULE_SET_ID#" NUMBER,
	"RULE_ID#" NUMBER,
	"RULE_ORDER" NUMBER,
	"ENABLED" VARCHAR2(1),
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."RULE_SET$"
   (	"ID#" NUMBER,
	"ENABLED" VARCHAR2(1),
	"EVAL_OPTIONS" NUMBER,
	"AUDIT_OPTIONS" NUMBER,
	"FAIL_OPTIONS" NUMBER,
	"FAIL_CODE" VARCHAR2(10),
	"HANDLER_OPTIONS" NUMBER,
	"HANDLER" VARCHAR2(1024),
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."RULE_SET_T$"
   (	"ID#" NUMBER,
	"NAME" VARCHAR2(128),
	"DESCRIPTION" VARCHAR2(1024),
	"FAIL_MESSAGE" VARCHAR2(80),
	"LANGUAGE" VARCHAR2(3)
   ) ;

CREATE TABLE "DVSYS"."REALM_OBJECT$"
   (	"ID#" NUMBER,
	"REALM_ID#" NUMBER,
	"OWNER" VARCHAR2(128),
	"OWNER_UID#" NUMBER,
	"OBJECT_NAME" VARCHAR2(128),
	"OBJECT_TYPE" VARCHAR2(32),
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."REALM_AUTH$"
   (	"ID#" NUMBER,
	"REALM_ID#" NUMBER,
	"GRANTEE" VARCHAR2(128),
	"GRANTEE_UID#" NUMBER,
	"AUTH_RULE_SET_ID#" NUMBER,
	"AUTH_OPTIONS" NUMBER,
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."REALM$"
   (	"ID#" NUMBER,
	"ENABLED" VARCHAR2(1),
	"AUDIT_OPTIONS" NUMBER,
	"REALM_TYPE" NUMBER,
	"VERSION" NUMBER,
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE
   ) ;

CREATE TABLE "DVSYS"."REALM_T$"
   (	"ID#" NUMBER,
	"NAME" VARCHAR2(128),
	"DESCRIPTION" VARCHAR2(1024),
	"LANGUAGE" VARCHAR2(3)
   ) ;

CREATE TABLE "DVSYS"."AUDIT_TRAIL$"
   (	"ID#" NUMBER,
	"OS_USERNAME" VARCHAR2(255),
	"USERNAME" VARCHAR2(128),
	"USERHOST" VARCHAR2(128),
	"TERMINAL" VARCHAR2(255),
	"TIMESTAMP" DATE,
	"OWNER" VARCHAR2(128),
	"OBJ_NAME" VARCHAR2(128),
	"ACTION" NUMBER,
	"ACTION_NAME" VARCHAR2(128),
	"ACTION_OBJECT_ID" NUMBER,
	"ACTION_OBJECT_NAME" VARCHAR2(128),
	"ACTION_COMMAND" VARCHAR2(4000),
	"AUDIT_OPTION" VARCHAR2(4000),
	"RULE_SET_ID" NUMBER,
	"RULE_SET_NAME" VARCHAR2(128),
	"RULE_ID" NUMBER,
	"RULE_NAME" VARCHAR2(128),
	"FACTOR_CONTEXT" VARCHAR2(4000),
	"COMMENT_TEXT" VARCHAR2(4000),
	"SESSIONID" NUMBER,
	"ENTRYID" NUMBER,
	"STATEMENTID" NUMBER,
	"RETURNCODE" NUMBER,
	"EXTENDED_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE,
	"PROXY_SESSIONID" NUMBER,
	"GLOBAL_UID" VARCHAR2(32),
	"INSTANCE_NUMBER" NUMBER,
	"OS_PROCESS" VARCHAR2(16),
	"CREATED_BY" VARCHAR2(128),
	"CREATE_DATE" DATE,
	"UPDATED_BY" VARCHAR2(128),
	"UPDATE_DATE" DATE,
	"GRANTEE" VARCHAR2(128),
	"ENABLED_STATUS" VARCHAR2(1)
   ) ;

CREATE TABLE "DVSYS"."DV_AUTH$"
   (	"GRANT_TYPE" VARCHAR2(19),
	"GRANTEE" VARCHAR2(128),
	"GRANTEE_ID" NUMBER,
	"OBJECT_OWNER" VARCHAR2(128),
	"OBJECT_OWNER_ID" NUMBER,
	"OBJECT_NAME" VARCHAR2(128),
	"OBJECT_TYPE" VARCHAR2(32)
   ) ;

CREATE TABLE "DVSYS"."REALM_T$_TEMP"
   (	"ID#" NUMBER,
	"NAME" VARCHAR2(128),
	"DESCRIPTION" VARCHAR2(1024),
	"LANGUAGE" VARCHAR2(3)
   ) ;

CREATE TABLE "DVSYS"."CODE_T$_TEMP"
   (	"ID#" NUMBER,
	"VALUE" VARCHAR2(4000),
	"DESCRIPTION" VARCHAR2(1024),
	"LANGUAGE" VARCHAR2(3)
   ) ;

CREATE TABLE "DVSYS"."FACTOR_T$_TEMP"
   (	"ID#" NUMBER,
	"DESCRIPTION" VARCHAR2(4000),
	"LANGUAGE" VARCHAR2(3)
   ) ;

CREATE TABLE "DVSYS"."FACTOR_TYPE_T$_TEMP"
   (	"ID#" NUMBER,
	"NAME" VARCHAR2(128),
	"DESCRIPTION" VARCHAR2(1024),
	"LANGUAGE" VARCHAR2(3)
   ) ;

CREATE TABLE "DVSYS"."RULE_T$_TEMP"
   (	"ID#" NUMBER,
	"NAME" VARCHAR2(128),
	"LANGUAGE" VARCHAR2(3)
   ) ;

CREATE TABLE "DVSYS"."RULE_SET_T$_TEMP"
   (	"ID#" NUMBER,
	"NAME" VARCHAR2(128),
	"DESCRIPTION" VARCHAR2(1024),
	"FAIL_MESSAGE" VARCHAR2(80),
	"LANGUAGE" VARCHAR2(3)
   ) ;

CREATE GLOBAL TEMPORARY TABLE "DVSYS"."DV$CMDCONTEXT"
   (	"CMDTYPE" VARCHAR2(30),
	"STATUS" VARCHAR2(10)
   ) ON COMMIT PRESERVE ROWS ;

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."FACTOR_LINK$_PRIV" AS

  TYPE attribute_rec IS RECORD (
      ID# FACTOR_LINK$.ID#%TYPE
    , PARENT_FACTOR_ID# FACTOR_LINK$.PARENT_FACTOR_ID#%TYPE
    , CHILD_FACTOR_ID# FACTOR_LINK$.CHILD_FACTOR_ID#%TYPE
    , LABEL_IND FACTOR_LINK$.LABEL_IND%TYPE
  );

  TYPE attribute_list IS VARRAY(4096) OF attribute_rec;

  -- Create method
  PROCEDURE create_row(
    p_PARENT_FACTOR_ID# IN NUMBER,
    p_CHILD_FACTOR_ID# IN NUMBER,
    p_LABEL_IND IN VARCHAR2,
    x_id# OUT number);

  -- Read method
  PROCEDURE read_row(p_id#        IN     number,
      x_ID# OUT NUMBER
    , x_PARENT_FACTOR_ID# OUT NUMBER
    , x_CHILD_FACTOR_ID# OUT NUMBER
    , x_LABEL_IND OUT VARCHAR2
    );

  PROCEDURE read_by_PARENT_FACTOR_ID#_(
    p_PARENT_FACTOR_ID# IN number,
    x_attribute_list OUT attribute_list);

  PROCEDURE read_by_CHILD_FACTOR_ID#_(
    p_CHILD_FACTOR_ID# IN number,
    x_attribute_list OUT attribute_list);

  -- Update method
  PROCEDURE update_row(
      p_id# NUMBER
    , p_PARENT_FACTOR_ID# IN NUMBER
    , p_CHILD_FACTOR_ID# IN NUMBER
    , p_LABEL_IND IN VARCHAR2
    );

  -- Delete method
  PROCEDURE delete_row(p_id# IN number,
                    p_delete_children IN boolean := false);

  PROCEDURE delete_by_PARENT_FACTOR_ID#_(
    p_PARENT_FACTOR_ID# IN number,
    p_delete_children IN boolean := false);

  PROCEDURE delete_by_CHILD_FACTOR_ID#_(
    p_CHILD_FACTOR_ID# IN number,
    p_delete_children IN boolean := false);

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."FACTOR_TYPE$_PRIV" AS

  TYPE attribute_rec IS RECORD (
      ID# FACTOR_TYPE$.ID#%TYPE
    --, NAME FACTOR_TYPE$.NAME%TYPE
    --, DESCRIPTION FACTOR_TYPE$.DESCRIPTION%TYPE
  );

  TYPE attribute_list IS VARRAY(4096) OF attribute_rec;

  -- Create method
  PROCEDURE create_row(
    p_NAME IN VARCHAR2,
    p_DESCRIPTION IN VARCHAR2,
    x_id# OUT number);

  -- Read method
  PROCEDURE read_row(p_id#        IN     number,
      x_ID# OUT NUMBER
    , x_NAME OUT VARCHAR2
    , x_DESCRIPTION OUT VARCHAR2
    );

  -- Update method
  PROCEDURE update_row(
      p_id# NUMBER
    , p_NAME IN VARCHAR2
    , p_DESCRIPTION IN VARCHAR2
    );

  -- Delete method
  PROCEDURE delete_row(p_id# IN number,
                    p_delete_children IN boolean := false);

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."IDENTITY$_PRIV" AS

  TYPE attribute_rec IS RECORD (
      ID# IDENTITY$.ID#%TYPE
    , FACTOR_ID# IDENTITY$.FACTOR_ID#%TYPE
    , VALUE IDENTITY$.VALUE%TYPE
    , TRUST_LEVEL IDENTITY$.TRUST_LEVEL%TYPE
  );

  TYPE attribute_list IS VARRAY(4096) OF attribute_rec;

  -- Create method
  PROCEDURE create_row(
    p_FACTOR_ID# IN NUMBER,
    p_VALUE IN VARCHAR2,
    p_TRUST_LEVEL IN NUMBER,
    x_id# OUT number);

  -- Read method
  PROCEDURE read_row(p_id#        IN     number,
      x_ID# OUT NUMBER
    , x_FACTOR_ID# OUT NUMBER
    , x_VALUE OUT VARCHAR2
    , x_TRUST_LEVEL OUT NUMBER
    );

  PROCEDURE read_by_FACTOR_ID#_(
    p_FACTOR_ID# IN number,
    x_attribute_list OUT attribute_list);

  -- Update method
  PROCEDURE update_row(
      p_id# NUMBER
    , p_FACTOR_ID# IN NUMBER
    , p_VALUE IN VARCHAR2
    , p_TRUST_LEVEL IN NUMBER
    );

  -- Delete method
  PROCEDURE delete_row(p_id# IN number,
                    p_delete_children IN boolean := false);

  PROCEDURE delete_by_FACTOR_ID#_(
    p_FACTOR_ID# IN number,
    p_delete_children IN boolean := false);

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."IDENTITY_MAP$_PRIV" AS

  TYPE attribute_rec IS RECORD (
      ID# IDENTITY_MAP$.ID#%TYPE
    , IDENTITY_ID# IDENTITY_MAP$.IDENTITY_ID#%TYPE
    , FACTOR_LINK_ID# IDENTITY_MAP$.FACTOR_LINK_ID#%TYPE
    , OPERATION_CODE_ID# IDENTITY_MAP$.OPERATION_CODE_ID#%TYPE
    , OPERAND1 IDENTITY_MAP$.OPERAND1%TYPE
    , OPERAND2 IDENTITY_MAP$.OPERAND2%TYPE
  );

  TYPE attribute_list IS VARRAY(4096) OF attribute_rec;

  -- Create method
  PROCEDURE create_row(
    p_IDENTITY_ID# IN NUMBER,
    p_FACTOR_LINK_ID# IN NUMBER,
    p_OPERATION_CODE_ID# IN NUMBER,
    p_OPERAND1 IN VARCHAR2,
    p_OPERAND2 IN VARCHAR2,
    x_id# OUT number);

  -- Read method
  PROCEDURE read_row(p_id#        IN     number,
      x_ID# OUT NUMBER
    , x_IDENTITY_ID# OUT NUMBER
    , x_FACTOR_LINK_ID# OUT NUMBER
    , x_OPERATION_CODE_ID# OUT NUMBER
    , x_OPERAND1 OUT VARCHAR2
    , x_OPERAND2 OUT VARCHAR2
    );

  PROCEDURE read_by_IDENTITY_ID#_(
    p_IDENTITY_ID# IN number,
    x_attribute_list OUT attribute_list);

  PROCEDURE read_by_FACTOR_LINK_ID#_(
    p_FACTOR_LINK_ID# IN number,
    x_attribute_list OUT attribute_list);

  PROCEDURE read_by_OPERATION_CODE_ID#_(
    p_OPERATION_CODE_ID# IN number,
    x_attribute_list OUT attribute_list);

  -- Update method
  PROCEDURE update_row(
      p_id# NUMBER
    , p_IDENTITY_ID# IN NUMBER
    , p_FACTOR_LINK_ID# IN NUMBER
    , p_OPERATION_CODE_ID# IN NUMBER
    , p_OPERAND1 IN VARCHAR2
    , p_OPERAND2 IN VARCHAR2
    );

  -- Delete method
  PROCEDURE delete_row(p_id# IN number,
                    p_delete_children IN boolean := false);

  PROCEDURE delete_by_IDENTITY_ID#_(
    p_IDENTITY_ID# IN number,
    p_delete_children IN boolean := false);

  PROCEDURE delete_by_FACTOR_LINK_ID#_(
    p_FACTOR_LINK_ID# IN number,
    p_delete_children IN boolean := false);

  PROCEDURE delete_by_OPERATION_CODE_ID#_(
    p_OPERATION_CODE_ID# IN number,
    p_delete_children IN boolean := false);

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."MAC_POLICY$_PRIV" AS

  TYPE attribute_rec IS RECORD (
      ID# MAC_POLICY$.ID#%TYPE
    , POLICY_ID# MAC_POLICY$.POLICY_ID#%TYPE
    , ALGORITHM_CODE_ID# MAC_POLICY$.ALGORITHM_CODE_ID#%TYPE
    , ERROR_LABEL MAC_POLICY$.ERROR_LABEL%TYPE
  );

  TYPE attribute_list IS VARRAY(4096) OF attribute_rec;

  -- Create method
  PROCEDURE create_row(
    p_POLICY_ID# IN NUMBER,
    p_ALGORITHM_CODE_ID# IN NUMBER,
    p_ERROR_LABEL IN VARCHAR2,
    x_id# OUT number);

  -- Read method
  PROCEDURE read_row(p_id#        IN     number,
      x_ID# OUT NUMBER
    , x_POLICY_ID# OUT NUMBER
    , x_ALGORITHM_CODE_ID# OUT NUMBER
    , x_ERROR_LABEL OUT VARCHAR2
    );

  PROCEDURE read_by_ALGORITHM_CODE_ID#_(
    p_ALGORITHM_CODE_ID# IN number,
    x_attribute_list OUT attribute_list);

  -- Update method
  PROCEDURE update_row(
      p_id# NUMBER
    , p_POLICY_ID# IN NUMBER
    , p_ALGORITHM_CODE_ID# IN NUMBER
    , p_ERROR_LABEL IN VARCHAR2
    );

  -- Delete method
  PROCEDURE delete_row(p_id# IN number,
                    p_delete_children IN boolean := false);

  PROCEDURE delete_by_ALGORITHM_CODE_ID#_(
    p_ALGORITHM_CODE_ID# IN number,
    p_delete_children IN boolean := false);

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."MAC_POLICY_FACTOR$_PRIV" AS

  TYPE attribute_rec IS RECORD (
      ID# MAC_POLICY_FACTOR$.ID#%TYPE
    , FACTOR_ID# MAC_POLICY_FACTOR$.FACTOR_ID#%TYPE
    , MAC_POLICY_ID# MAC_POLICY_FACTOR$.MAC_POLICY_ID#%TYPE
  );

  TYPE attribute_list IS VARRAY(4096) OF attribute_rec;

  -- Create method
  PROCEDURE create_row(
    p_FACTOR_ID# IN NUMBER,
    p_MAC_POLICY_ID# IN NUMBER,
    x_id# OUT number);

  -- Read method
  PROCEDURE read_row(p_id#        IN     number,
      x_ID# OUT NUMBER
    , x_FACTOR_ID# OUT NUMBER
    , x_MAC_POLICY_ID# OUT NUMBER
    );

  PROCEDURE read_by_FACTOR_ID#_(
    p_FACTOR_ID# IN number,
    x_attribute_list OUT attribute_list);

  PROCEDURE read_by_MAC_POLICY_ID#_(
    p_MAC_POLICY_ID# IN number,
    x_attribute_list OUT attribute_list);

  -- Update method
  PROCEDURE update_row(
      p_id# NUMBER
    , p_FACTOR_ID# IN NUMBER
    , p_MAC_POLICY_ID# IN NUMBER
    );

  -- Delete method
  PROCEDURE delete_row(p_id# IN number,
                    p_delete_children IN boolean := false);

  PROCEDURE delete_by_FACTOR_ID#_(
    p_FACTOR_ID# IN number,
    p_delete_children IN boolean := false);

  PROCEDURE delete_by_MAC_POLICY_ID#_(
    p_MAC_POLICY_ID# IN number,
    p_delete_children IN boolean := false);

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."POLICY_LABEL$_PRIV" AS

  TYPE attribute_rec IS RECORD (
      ID# POLICY_LABEL$.ID#%TYPE
    , IDENTITY_ID# POLICY_LABEL$.IDENTITY_ID#%TYPE
    , POLICY_ID# POLICY_LABEL$.POLICY_ID#%TYPE
    , LABEL_ID# POLICY_LABEL$.LABEL_ID#%TYPE
  );

  TYPE attribute_list IS VARRAY(4096) OF attribute_rec;

  -- Create method
  PROCEDURE create_row(
    p_IDENTITY_ID# IN NUMBER,
    p_POLICY_ID# IN NUMBER,
    p_LABEL_ID# IN NUMBER,
    x_id# OUT number);

  -- Read method
  PROCEDURE read_row(p_id#        IN     number,
      x_ID# OUT NUMBER
    , x_IDENTITY_ID# OUT NUMBER
    , x_POLICY_ID# OUT NUMBER
    , x_LABEL_ID# OUT NUMBER
    );

  PROCEDURE read_by_IDENTITY_ID#_(
    p_IDENTITY_ID# IN number,
    x_attribute_list OUT attribute_list);

  -- Update method
  PROCEDURE update_row(
      p_id# NUMBER
    , p_IDENTITY_ID# IN NUMBER
    , p_POLICY_ID# IN NUMBER
    , p_LABEL_ID# IN NUMBER
    );

  -- Delete method
  PROCEDURE delete_row(p_id# IN number,
                    p_delete_children IN boolean := false);

  PROCEDURE delete_by_IDENTITY_ID#_(
    p_IDENTITY_ID# IN number,
    p_delete_children IN boolean := false);

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."ROLE$_PRIV" AS

  TYPE attribute_rec IS RECORD (
      ID# ROLE$.ID#%TYPE
    , ROLE ROLE$.ROLE%TYPE
    , RULE_SET_ID# ROLE$.RULE_SET_ID#%TYPE
    , ENABLED ROLE$.ENABLED%TYPE
  );

  TYPE attribute_list IS VARRAY(4096) OF attribute_rec;

  -- Create method
  PROCEDURE create_row(
    p_ROLE IN VARCHAR2,
    p_RULE_SET_ID# IN NUMBER,
    p_ENABLED IN VARCHAR2,
    x_id# OUT number);

  -- Read method
  PROCEDURE read_row(p_id#        IN     number,
      x_ID# OUT NUMBER
    , x_ROLE OUT VARCHAR2
    , x_RULE_SET_ID# OUT NUMBER
    , x_ENABLED OUT VARCHAR2
    );

  PROCEDURE read_by_RULE_SET_ID#_(
    p_RULE_SET_ID# IN number,
    x_attribute_list OUT attribute_list);

  -- Update method
  PROCEDURE update_row(
      p_id# NUMBER
    , p_ROLE IN VARCHAR2
    , p_RULE_SET_ID# IN NUMBER
    , p_ENABLED IN VARCHAR2
    );

  -- Delete method
  PROCEDURE delete_row(p_id# IN number,
                    p_delete_children IN boolean := false);

  PROCEDURE delete_by_RULE_SET_ID#_(
    p_RULE_SET_ID# IN number,
    p_delete_children IN boolean := false);

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."DBMS_MACOUT"
AS
    /**
    * Turn on tracing.
    */
    PROCEDURE enable;

    /**
    * Turn off tracing.
    */
    PROCEDURE disable;

    /**
    * Add text to the output (with a new line)
    * @param s String
    */
    PROCEDURE put_line( s IN VARCHAR2 );

    /**
    * Same as put_line.
    * @param s String
    */
    PROCEDURE pl( s IN VARCHAR2 );

    /**
    * Retrieve a line of text from the buffer.  The line is deleted from
    * the line buffer.
    * @param n Line number
    */
    FUNCTION get_line( n IN NUMBER ) RETURN VARCHAR2;

    PRAGMA RESTRICT_REFERENCES( get_line, WNDS, RNDS );

    /**
    * Number of lines in the buffer.
    * @return Number of lines in the buffer
    */
    FUNCTION get_line_COUNT RETURN NUMBER;

    /**
    * Is the trace facility enabled.
    * @return An indicator that the trace facility is enabled for this session
    */
    FUNCTION is_enabled RETURN BOOLEAN;

    PRAGMA RESTRICT_REFERENCES( get_line_COUNT, WNDS, RNDS, WNPS );

    PRAGMA RESTRICT_REFERENCES( dbms_macout, WNDS, RNDS, WNPS, RNPS );
END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."DBMS_MACUTL" AS

  /********************/
  /* Global Constants */
  /********************/
  -- Yes constant for enabled and label_ind columns (Boolean TRUE)
  g_yes CONSTANT VARCHAR2(1) := 'Y';
  -- No constant for enabled and label_ind columns (Boolean FALSE)
  g_no  CONSTANT VARCHAR2(1) := 'N';

  -- Factor audit_options: No audit
  g_audit_off                       CONSTANT NUMBER := 0;
  -- Factor audit_options: Always audit
  g_audit_always                    CONSTANT NUMBER := POWER(2,0);
  -- Factor audit_options: Audit if get_expr returns an error
  g_audit_on_get_error              CONSTANT NUMBER := POWER(2,1);
  -- Factor audit_options: Audit if get_expr is null
  g_audit_on_get_null               CONSTANT NUMBER := POWER(2,2);
  -- Factor audit_options: Audit if validation function returns error
  g_audit_on_validate_error         CONSTANT NUMBER := POWER(2,3);
  -- Factor audit_options: Audit if validation function is false
  g_audit_on_validate_false         CONSTANT NUMBER := POWER(2,4);
  -- Factor audit_options: Audit if no trust level
  g_audit_on_trust_level_null       CONSTANT NUMBER := POWER(2,5);
  -- Factor audit_options: Audit if trus level is negative
  g_audit_on_trust_level_neg        CONSTANT NUMBER := POWER(2,6);

  -- Fail_options: Fail with message
  g_fail_with_message   CONSTANT NUMBER := POWER(2,0);
  -- Fail_options: Fail with message
  g_fail_silently       CONSTANT NUMBER := POWER(2,1);

  -- Factor identify_by column: Fixed value in get_expr column
  g_identify_by_constant    CONSTANT NUMBER := 0;
  -- Factor identify_by column: Expression in get_expr column
  g_identify_by_method      CONSTANT NUMBER := 1;
  -- Factor identify_by column: Sub-factors via factor_link$ table
  g_identify_by_factor      CONSTANT NUMBER := 2;
  -- Factor identify_by session context
  g_identify_by_context     CONSTANT NUMBER := 3;

  -- Factor identify_by column:  Expression and Rule Set via factor_expr$ table
  -- g_identify_by_ruleset     CONSTANT NUMBER := 4;

  -- Factor eval_options: Evaluate once upon login
  g_eval_on_session CONSTANT NUMBER := 0;
  -- Factor eval_options: Re-evaluate on each access
  g_eval_on_access  CONSTANT NUMBER := 1;
  -- Factor eval_options: Evaluate once at database startup
  g_eval_on_startup  CONSTANT NUMBER := 2;

  -- Factor labeled_by column: Factor's identities are labeled
  g_labeled_by_self     CONSTANT NUMBER := 0;
  -- Factor labeled_by column: Derive label from sub-factor and merge algorithm
  g_labeled_by_factors  CONSTANT NUMBER := 1;

  -- Realm Objects: Wild card to indicate all object names or all object types
  g_all_object CONSTANT VARCHAR2(1) := '%';

  -- Rule Set audit_options: No auditing
  g_ruleset_audit_off            CONSTANT NUMBER := 0;
  -- Rule Set audit_options: Audit on Rule Set failure
  g_ruleset_audit_fail           CONSTANT NUMBER := POWER(2,0);
  -- Rule Set audit_options: Audit on Rule Set success
  g_ruleset_audit_success        CONSTANT NUMBER := POWER(2,1);

  -- Rule Set eval_options: Rule Set succeeds if all Rules are TRUE
  g_ruleset_eval_all             CONSTANT NUMBER := 1;
  -- Rule Set eval_options: Rule Set succeeds if any Rule is TRUE
  g_ruleset_eval_any             CONSTANT NUMBER := 2;

  -- Rule Set fail_options: Show error message
  g_ruleset_fail_show            CONSTANT NUMBER := 1;
  -- Rule Set fail_options: No error message
  g_ruleset_fail_silent          CONSTANT NUMBER := 2;

  -- Rule Set handler_options: No call to handler
  g_ruleset_handler_off          CONSTANT NUMBER := 0;
  -- Rule Set handler_options: Call handler on Rule Set failure
  g_ruleset_handler_fail         CONSTANT NUMBER := POWER(2,0);
  -- Rule Set handler_options: Call handler on Rule Set success
  g_ruleset_handler_success      CONSTANT NUMBER := POWER(2,1);

  -- Realm audit_options: No auditing
  g_realm_audit_off              CONSTANT NUMBER := 0;
  -- Realm audit_options: Audit on realm violation
  g_realm_audit_fail             CONSTANT NUMBER := POWER(2,0);
  -- Realm audit_options: Audit on successful realm access
  g_realm_audit_success          CONSTANT NUMBER := POWER(2,1);

  -- Realm authoriations: Participant
  g_realm_auth_participant       CONSTANT NUMBER := 0;
  -- Realm authoriations: Owner
  g_realm_auth_owner             CONSTANT NUMBER := 1;


  -- Code groups: Audit Event Descriptions
  g_codes_audit_events    CONSTANT VARCHAR2(30) := 'AUDIT_EVENTS';
  -- Code groups: Boolean values
  g_codes_boolean         CONSTANT VARCHAR2(30) := 'BOOLEAN';
  -- Code groups: DDL commands
  g_codes_ddl_cmds        CONSTANT VARCHAR2(30) := 'DDL_CMDS';
  -- Code groups: Factor audit_options
  g_codes_factor_audit    CONSTANT VARCHAR2(30) := 'FACTOR_AUDIT';
  -- Code groups: Factor eval_options
  g_codes_factor_eval     CONSTANT VARCHAR2(30) := 'FACTOR_EVALUATE';
  -- Code groups: Factor fail_options
  g_codes_factor_fail     CONSTANT VARCHAR2(30) := 'FACTOR_FAIL';
  -- Code groups: Factor identity_by
  g_codes_factor_identify CONSTANT VARCHAR2(30) := 'FACTOR_IDENTIFY';
  -- Code groups: Factor labeled_by
  g_codes_factor_label    CONSTANT VARCHAR2(30) := 'FACTOR_LABEL';
  -- Code groups: Database object types
  g_codes_db_object_type  CONSTANT VARCHAR2(30) := 'DB_OBJECT_TYPE';
  -- Code groups: OLS Policy merge algorithms
  g_codes_label_alg       CONSTANT VARCHAR2(30) := 'LABEL_ALG';
  -- Code groups: DV Error messages
  g_codes_messages        CONSTANT VARCHAR2(30) := 'DV_MESSAGES';
  -- Code groups: SQL relational operators
  g_codes_operators       CONSTANT VARCHAR2(30) := 'OPERATORS';
  -- Code groups: Realm audit_options
  g_codes_realm_audit     CONSTANT VARCHAR2(30) := 'REALM_AUDIT';
  -- Code groups: Rule Set audit_options
  g_codes_ruleset_audit   CONSTANT VARCHAR2(30) := 'RULESET_AUDIT';
  -- Code groups: Rule Set evaluate_options
  g_codes_ruleset_eval    CONSTANT VARCHAR2(30) := 'RULESET_EVALUATE';
  -- Code groups: Rule Set handler_options
  g_codes_ruleset_event   CONSTANT VARCHAR2(30) := 'RULESET_EVENT';
  -- Code groups: Rule Set fail_options
  g_codes_ruleset_fail    CONSTANT VARCHAR2(30) := 'RULESET_FAIL';
  -- Code groups: SQL Commands
  g_codes_sql_cmds        CONSTANT VARCHAR2(30) := 'SQL_CMDS';

  -- Context:   Namespace, Attribute, Value
  -- MACSEC/MACOLS context start with this
  g_context_prefix CONSTANT VARCHAR2(30) := 'MAC$';
  -- Factor Labels:    MAC$F$<policy>, <factor_name>, <factor label>
  g_context_factor_label CONSTANT VARCHAR2(30) := g_context_prefix||'F$';
  -- Session Labels:   MAC$S$<policy>, <session attribute>, <label>
  g_context_session_label CONSTANT VARCHAR2(30) := g_context_prefix||'S$';
  -- Factors:   MAC$FACTOR,<factor name>, <factor value>
  g_context_factor CONSTANT VARCHAR2(30) := g_context_prefix||'FACTOR';
  -- Realm:   MAC$REALM,<factor name>, <factor value>
  g_context_realm CONSTANT VARCHAR2(30) := g_context_prefix||'REALM';

  -- This is that label that a factor will a null label will default to
  g_min_policy_label CONSTANT VARCHAR2(30) := 'MIN_POLICY_LABEL';
  -- This is the highest label a user could set based on the factors
  -- (it does not take into account the user's label)
  g_max_session_label CONSTANT VARCHAR2(30) := 'MAX_SESSION_LABEL';
  -- The user's OLS session label at the time init_session is executed
  g_ols_session_label CONSTANT VARCHAR2(30) := 'OLS_SESSION_LABEL';
  -- This is what MACOLS decided the user's label should be set to
  -- after factoring in the above values.
  g_user_policy_label CONSTANT VARCHAR2(30) := 'USER_POLICY_LABEL';

  /**
  * Returns an indicator as to whether or not OLS is installed
  *
  * @return TRUE if OLS is installed
  */
  FUNCTION is_ols_installed RETURN BOOLEAN;

  /**
  * Returns an indicator as to whether or not OLS is installed
  *
  * @return Y if OLS is installed, N otherwise
  */
  FUNCTION is_ols_installed_varchar RETURN VARCHAR2;

  /**
  * Returns an indicator as to whether or not DV is enabled
  *
  * @return TRUE if DV is enabled, FALSE otherwise
  */
  FUNCTION is_dv_enabled RETURN BOOLEAN ;

  -- check DATAPUMP DV authorization at full database level
  FUNCTION check_full_dvauth RETURN BINARY_INTEGER;

  -- check DATAPUMP/TTS DV authorization for a specified tablespace
  FUNCTION check_ts_dvauth(ts_name IN VARCHAR2) RETURN BINARY_INTEGER;

  -- check DATAPUMP/TTS DV authorization for a specified table
  FUNCTION check_tab_dvauth(schema_name IN VARCHAR2,
                            table_name  IN VARCHAR2) RETURN BINARY_INTEGER;

  /**
  * Returns an indicator as to whether or not DV is enabled
  *
  * @return Y if DV is enabled, N otherwise
  */
  FUNCTION is_dv_enabled_varchar RETURN VARCHAR2 ;

  /**
  * Returns an indicator as to whether or not OID enabled OLS is installed
  *
  * @return TRUE if OID enabled OLS is installed
  */
  FUNCTION is_oid_enabled_ols RETURN BOOLEAN;

  /**
  * Returns ldap user if OID enabled OLS is installed
  *
  * @return logon user
  */
  FUNCTION ols_ldap_user RETURN VARCHAR2;

  /**
  * Returns unique user ID whether user is from OID or standard database accounts
  *
  * @return unique user ID from OID or dbms_standard.login_user
  */
  FUNCTION unique_user RETURN VARCHAR2;

  /**
  * Looks up the value for a code within a code group
  *
  * @param p_code_group Code group - e.g. AUDIT_EVENTS or BOOLEAN
  * @return Value of the code
  */
  FUNCTION get_code_value(p_code_group VARCHAR2, p_code VARCHAR2) RETURN VARCHAR2;

  /**
  * Looks up the id for a code within a code group
  *
  * @param p_code_group Code group - e.g. AUDIT_EVENTS or BOOLEAN
  * @return Id of the code
  */
  FUNCTION get_code_id(p_code_group VARCHAR2, p_code VARCHAR2) RETURN NUMBER;

  /**
  * Looks up an error message and replaces parameters accordingly
  *
  * @param p_message_code VARCHAR Message code
  * @param p_parameter1 Value to substitute for %1
  * @param p_parameter2 Value to substitute for %2
  * @param p_parameter3 Value to substitute for %3
  * @param p_parameter4 Value to substitute for %4
  * @param p_parameter5 Value to substitute for %5
  * @param p_parameter6 Value to substitute for %6
  * @return Error message
  */
  FUNCTION get_message_label(p_message_code VARCHAR2,
                        p_parameter1   IN VARCHAR2 DEFAULT NULL,
                        p_parameter2   IN VARCHAR2 DEFAULT NULL,
                        p_parameter3   IN VARCHAR2 DEFAULT NULL,
                        p_parameter4   IN VARCHAR2 DEFAULT NULL,
                        p_parameter5   IN VARCHAR2 DEFAULT NULL,
                        p_parameter6   IN VARCHAR2 DEFAULT NULL) RETURN VARCHAR2;

  /**
  * Looks up an error message and replaces parameters accordingly
  *
  * @param p_message_code NUMBER Message code
  * @param p_parameter1 Value to substitute for %1
  * @param p_parameter2 Value to substitute for %2
  * @param p_parameter3 Value to substitute for %3
  * @param p_parameter4 Value to substitute for %4
  * @param p_parameter5 Value to substitute for %5
  * @param p_parameter6 Value to substitute for %6
  * @return Error message
  */
  FUNCTION get_message_label(p_message_code NUMBER,
                        p_parameter1   IN VARCHAR2 DEFAULT NULL,
                        p_parameter2   IN VARCHAR2 DEFAULT NULL,
                        p_parameter3   IN VARCHAR2 DEFAULT NULL,
                        p_parameter4   IN VARCHAR2 DEFAULT NULL,
                        p_parameter5   IN VARCHAR2 DEFAULT NULL,
                        p_parameter6   IN VARCHAR2 DEFAULT NULL) RETURN VARCHAR2;
  /**
  * Convience function to look up an error message and
  * replaces parameters accordingly and raise an exception
  *
  * @param p_message_code Oracle error number
  */
  PROCEDURE raise_error(p_message_code IN NUMBER);
  /**
  * Convience function to look up an error message and
  * replaces parameters accordingly and raise an exception
  *
  * @param p_message_code Oracle error number
  * @param p_parameter1 Value to substitute for %1
  */
  PROCEDURE raise_error(p_message_code IN NUMBER,
                        p_parameter1   IN VARCHAR2);
  /**
  * Convience function to look up an error message and
  * replaces parameters accordingly and raise an exception
  *
  * @param p_message_code Oracle error number
  * @param p_parameter1 Value to substitute for %1
  * @param p_parameter2 Value to substitute for %2
  */
  PROCEDURE raise_error(p_message_code IN NUMBER,
                        p_parameter1   IN VARCHAR2,
                        p_parameter2   IN VARCHAR2);
  /**
  * Convience function to look up an error message and
  * replaces parameters accordingly and raise an exception
  *
  * @param p_message_code Oracle error number
  * @param p_parameter1 Value to substitute for %1
  * @param p_parameter2 Value to substitute for %2
  * @param p_parameter3 Value to substitute for %3
  */
  PROCEDURE raise_error(p_message_code IN NUMBER,
                        p_parameter1   IN VARCHAR2,
                        p_parameter2   IN VARCHAR2,
                        p_parameter3   IN VARCHAR2);
  /**
  * Convience function to look up an error message and
  * replaces parameters accordingly and raise an exception
  *
  * @param p_message_code Oracle error number
  * @param p_parameter1 Value to substitute for %1
  * @param p_parameter2 Value to substitute for %2
  * @param p_parameter3 Value to substitute for %3
  * @param p_parameter4 Value to substitute for %4
  */
  PROCEDURE raise_error(p_message_code IN NUMBER,
                        p_parameter1   IN VARCHAR2,
                        p_parameter2   IN VARCHAR2,
                        p_parameter3   IN VARCHAR2,
                        p_parameter4   IN VARCHAR2);

  /**
  * Convience function to look up an error message and
  * replaces parameters accordingly and raise an exception
  *
  * @param p_message_code Oracle error number
  * @param p_parameter1 Value to substitute for %1
  * @param p_parameter2 Value to substitute for %2
  * @param p_parameter3 Value to substitute for %3
  * @param p_parameter4 Value to substitute for %4
  * @param p_parameter5 Value to substitute for %5
  */
  PROCEDURE raise_error(p_message_code IN NUMBER,
                        p_parameter1   IN VARCHAR2,
                        p_parameter2   IN VARCHAR2,
                        p_parameter3   IN VARCHAR2,
                        p_parameter4   IN VARCHAR2,
                        p_parameter5   IN VARCHAR2);

  /**
  * Convience function to look up an error message and
  * replaces parameters accordingly and raise an exception
  *
  * @param p_message_code Oracle error number
  * @param p_parameter1 Value to substitute for %1
  * @param p_parameter2 Value to substitute for %2
  * @param p_parameter3 Value to substitute for %3
  * @param p_parameter4 Value to substitute for %4
  * @param p_parameter5 Value to substitute for %5
  * @param p_parameter6 Value to substitute for %6
  */
  PROCEDURE raise_error(p_message_code IN NUMBER,
                        p_parameter1   IN VARCHAR2,
                        p_parameter2   IN VARCHAR2,
                        p_parameter3   IN VARCHAR2,
                        p_parameter4   IN VARCHAR2,
                        p_parameter5   IN VARCHAR2,
                        p_parameter6   IN VARCHAR2);


  /**
  * Converts the audit_options value for a table to a VARCHAR2 form.
  *
  * @param p_table_name Name of a DV table with a audit_options column (e.g. realm$)
  * @param p_audit_options Audit_options column value (can be several options 'OR-ed' together')
  * @return Audit_options in VARCHAR2 form, separated by commas
  */
  FUNCTION decode_audit_options(p_table_name IN VARCHAR2,
                                p_audit_options IN NUMBER) RETURN VARCHAR2;

  /**
  * Constructs an XML document which contains the values for all of the factors.  Note that
  * the document is only intended for auditing or tracing and will be truncated if it is
  * longer than 4000 characters.
  *
  * @return XML document containing the factor context
  */
  FUNCTION get_factor_context RETURN VARCHAR2;

  /**
  * Concatenates the elements of an ora_name_list_t into a single VARCHAR2.
  *
  * @param p_sql_test Table of VARCHAR2 strings
  * @return Single string
  */
  FUNCTION get_sql_text(p_sql_text IN ora_name_list_t) RETURN VARCHAR2;

  /**
  * Checks whether the character is alphabetic.
  *
  * @param c String with one character
  * @return TRUE if the character is alphabetic
  */
  FUNCTION is_alpha(c IN varchar2) RETURN BOOLEAN;

  /**
  * Checks whether the character is numeric
  *
  * @param c String with one character
  * @return TRUE if the character is a digit
  */
  FUNCTION is_digit(c IN varchar2) RETURN BOOLEAN;

  /**
  * Alters a string to make it a legal Oracle identifier
  *
  * @param id Illegal identifier
  * @return Identifier
  */
  FUNCTION to_oracle_identifier(id IN varchar2) RETURN VARCHAR2;

  /**
  * Convenience procedure for generic disallowed operation exception
  * throws ORA 20920 (Unauthorized Operation) error.
  *
  * @param p_user User performing the operation
  */
  PROCEDURE raise_unauthorized_operation(p_user IN VARCHAR2 DEFAULT USER);

  /**
  * Determines whether a user is authorized to manage the DV configuration.  The
  * DVSYS user and users directly granted the DV_OWNER role are authorized.
  *
  * @param p_user User to check
  * @return TRUE if user is authorized
  */
  FUNCTION is_dvsys_owner(p_user IN VARCHAR2 DEFAULT USER) RETURN BOOLEAN;

  /**
  * Verifies that a public-APIs are not being bypassed by users updating the DV
  * configuration.
  *
  * @param p_user User performing the operation
  * @throws ORA 20920 Unauthorized Operation
  */
  PROCEDURE check_dvsys_dml_allowed(p_user IN VARCHAR2 DEFAULT USER);

  /**
  * Checks for a string in the PL/SQL call stack
  *
  * @param p_search_term String to search for
  * @return TRUE if string is in the call stack
  */
  FUNCTION in_call_stack(p_search_term IN VARCHAR2) RETURN BOOLEAN;

  /**
  * Checks whether a user has a role privilege, directly or indirectly (via another role).
  *
  * @param p_role Role privilege to check for
  * @param p_user User
  * @param p_profile Whether to capture the role usage; When the role checked
  *        is used, please set p_profile to TRUE
  * @return TRUE if use has the role
  */
  FUNCTION user_has_role(p_role IN VARCHAR2, p_user IN VARCHAR2 DEFAULT USER,
                         p_profile IN BOOLEAN DEFAULT TRUE)
    RETURN BOOLEAN;

     /**
  * Checks whether a user or role may access an object via a object privilege
  * grant.  The object privilege may have been granted directly to the
  * specified user/role or may have been granted indirectly via another role.
  *
  * @param p_user User or Role
  * @param p_object_owner Object owner
  * @param p_object_name Object name
  * @param p_privilege Object privilege (SELECT, UPDATE, INSERT, ...)
  * @param p_profile Whether to capture the object privilege; When the
  *        privilege checked by this function is used, please set p_profile
  *        to TRUE.
  * @return TRUE if user/role has the privilege
  */
  FUNCTION user_has_object_privilege(p_user         IN VARCHAR2,
                                     p_object_owner IN VARCHAR2,
                                     p_object_name  IN VARCHAR2,
                                     p_privilege    IN VARCHAR2,
                                     p_profile      IN BOOLEAN DEFAULT TRUE)
   RETURN BOOLEAN;

  /**
  * Checks whether a user has a role privilege, directly or indirectly (via another role).
  *
  * @param p_role Role privilege to check for
  * @param p_user User
  * @param p_profile Whether to capture the role usage; When the role checked
 *         is used, please set p_profile to TRUE.
  * @return Y if use has the role, Y otherwise
  */
  FUNCTION user_has_role_varchar(p_role IN VARCHAR2,
                                 p_user IN VARCHAR2 DEFAULT USER,
                                 p_profile IN BOOLEAN DEFAULT TRUE)
   RETURN VARCHAR2;

  /**
  * Checks whether a user has a system privilege, directly or indirectly (via a role).
  *
  * @param p_role System privilege to check for
  * @param p_user User
  * @param p_profile Whether to capture the system privilege; When the
  *        privilege checked by this function is used, please set p_profile
  *        to TRUE.
  * @return TRUE if use has the privilege
  */
  FUNCTION user_has_system_privilege(p_privilege IN VARCHAR2,
                                     p_user IN VARCHAR2 DEFAULT USER,
                                     p_profile IN BOOLEAN DEFAULT TRUE)
   RETURN BOOLEAN;

  /**
  * Checks whether a user has a system privilege, directly or indirectly (via a role).
  *
  * @param p_role System privilege to check for
  * @param p_user User
  * @param p_profile Whether to capture the system privilege; When the
  *        privilege checked by this function is used, please set p_profile
  *        to TRUE.
  * @return Y if use has the privilege; N otherwise
  */
  FUNCTION user_has_system_priv_varchar (p_privilege IN VARCHAR2,
                                         p_user IN VARCHAR2 DEFAULT USER,
                                         p_profile IN BOOLEAN DEFAULT TRUE)
   RETURN VARCHAR2;

 /*
  * Checks whether the given user can perform Streams administrative operation.
  * This is determined by whether the user has DV_STREAMS_ADMIN role. Note that
  * if DV is not enabled, then this function returns TRUE.
  *
  * @param p_user User
  * @return TRUE if 1) DV is not enabled, or 2) the user has DV_STREAMS_ADMIN role.
  *         FALSE otherwise.
  */
  FUNCTION check_streams_admin(p_user IN VARCHAR2) RETURN BOOLEAN;

 /*
  * Checks whether the given user can perform Golden Gate extract operation.
  * This is determined by whether the user has DV_GOLDENGATE_ADMIN role. Note
  * that if DV is not enabled, then this function returns TRUE.
  *
  * @param p_user User
  * @return TRUE if 1) DV is not enabled, or 2) user has DV_GOLDENGATE_ADMIN role.
  *         FALSE otherwise.
  */
  FUNCTION check_goldengate_admin(p_user IN VARCHAR2) RETURN BOOLEAN;

 /*
  * Checks whether the given user can perform XSTREAM capture operation.
  * This is determined by whether the user has DV_XSTREAM_ADMIN role. Note
  * that if DV is not enabled, then this function returns TRUE.
  *
  * @param p_user User
  * @return TRUE if 1) DV is not enabled, or 2) user has DV_XSTREAM_ADMIN role.
  *         FALSE otherwise.
  */
  FUNCTION check_xstream_admin(p_user IN VARCHAR2) RETURN BOOLEAN;

 /*
  * Checks whether the given user can perform Golden Gate extract operation
  * using the OCI interface. This is determined by whether the user has the
  * DV_GOLDENGATE_REDO_ACCESS role. Note that if DV is not enabled, then this
  * function always returns TRUE.
  *
  * @param p_user User
  * @return TRUE if 1) DV is not enabled, or
  *                 2) user has DV_GOLDENGATE_REDO_ACCESS role.
  *         FALSE otherwise.
  */
  FUNCTION check_goldengate_redo_access(p_user IN VARCHAR2) RETURN BOOLEAN;

 /*
  * Obtain the pipelined table of status of the events 10079 and 24473.
  *
  * @return pipelined table
  */
  FUNCTION get_event_status RETURN dvsys.event_status_table_type PIPELINED;

  /**
  * Returns the month in Oracle MM format (01-12).
  * @param p_date Date
  * @return Month 01-12.
  */
  FUNCTION get_month(p_date IN DATE DEFAULT SYSDATE) RETURN NUMBER;

  /**
  * Returns the day in Oracle DD format (01-31).
  *
  * @param p_date Date
  * @return Day 01-31.
  */
  FUNCTION get_day(p_date IN DATE DEFAULT SYSDATE) RETURN NUMBER;

  /**
  * Returns the year in Oracle YYYY format (0001-9999).
  *
  * @param p_date Date
  * @return Year 0001-9999.
  */
  FUNCTION get_year(p_date IN DATE DEFAULT SYSDATE) RETURN NUMBER;

  /**
  * Returns the month in Oracle HH24 format (00-23).
  *
  * @param p_date Date
  * @return Hour 00-23.
  */
  FUNCTION get_hour(p_date IN DATE DEFAULT SYSDATE) RETURN NUMBER;

  /**
  * Returns the minute in Oracle MI format (00-59).
  *
  * @param p_date Date
  * @return Minute 00-59.
  */
  FUNCTION get_minute(p_date IN DATE DEFAULT SYSDATE) RETURN NUMBER;

  /**
  * Returns the seconds in Oracle SS format (00-59).
  *
  * @param p_date Date
  * @return Second 00-59.
  */
  FUNCTION get_second(p_date IN DATE DEFAULT SYSDATE) RETURN NUMBER;

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."DBMS_MACADM" AS

  /* Global Constants */

  MANDATORY_REALM                  CONSTANT BINARY_INTEGER := 1;
  FACTOR_TYPE_CREATION_AUDIT       CONSTANT PLS_INTEGER :=     20032;
  FACTOR_TYPE_DELETION_AUDIT       CONSTANT PLS_INTEGER :=     20033;
  FACTOR_TYPE_UPDATE_AUDIT         CONSTANT PLS_INTEGER :=     20034;
  FACTOR_TYPE_RENAME_AUDIT         CONSTANT PLS_INTEGER :=     20035;

  FACTOR_CREATION_AUDIT            CONSTANT PLS_INTEGER :=     20036;
  FACTOR_DELETION_AUDIT            CONSTANT PLS_INTEGER :=     20037;
  FACTOR_UPDATE_AUDIT              CONSTANT PLS_INTEGER :=     20038;
  FACTOR_RENAME_AUDIT              CONSTANT PLS_INTEGER :=     20039;

  ADD_FACTOR_LINK_AUDIT            CONSTANT PLS_INTEGER :=     20040;
  DELETE_FACTOR_LINK_AUDIT         CONSTANT PLS_INTEGER :=     20041;
  ADD_POLICY_FACTOR_AUDIT          CONSTANT PLS_INTEGER :=     20042;
  DELETE_POLICY_FACTOR_AUDIT       CONSTANT PLS_INTEGER :=     20043;

  IDENTITY_CREATION_AUDIT          CONSTANT PLS_INTEGER :=     20044;
  IDENTITY_DELETION_AUDIT          CONSTANT PLS_INTEGER :=     20045;
  IDENTITY_UPDATE_AUDIT            CONSTANT PLS_INTEGER :=     20046;
  CHANGE_IDENTITY_FACTOR_AUDIT     CONSTANT PLS_INTEGER :=     20047;
  CHANGE_IDENTITY_VALUE_AUDIT      CONSTANT PLS_INTEGER :=     20048;

  IDENTITY_MAP_CREATION_AUDIT      CONSTANT PLS_INTEGER :=     20049;
  IDENTITY_MAP_DELETION_AUDIT      CONSTANT PLS_INTEGER :=     20050;

  POLICY_LABEL_CREATION_AUDIT      CONSTANT PLS_INTEGER :=     20051;
  POLICY_LABEL_DELETION_AUDIT      CONSTANT PLS_INTEGER :=     20052;
  MAC_POLICY_CREATION_AUDIT        CONSTANT PLS_INTEGER :=     20053;
  MAC_POLICY_UPDATE_AUDIT          CONSTANT PLS_INTEGER :=     20054;
  MAC_POLICY_DELETION_AUDIT        CONSTANT PLS_INTEGER :=     20055;

  ROLE_CREATION_AUDIT              CONSTANT PLS_INTEGER :=     20056;
  ROLE_DELETION_AUDIT              CONSTANT PLS_INTEGER :=     20057;
  ROLE_UPDATE_AUDIT                CONSTANT PLS_INTEGER :=     20058;
  ROLE_RENAME_AUDIT                CONSTANT PLS_INTEGER :=     20059;

  DOMAIN_IDENTITY_CREATION_AUDIT   CONSTANT PLS_INTEGER :=     20060;
  DOMAIN_IDENTITY_DROP_AUDIT       CONSTANT PLS_INTEGER :=     20061;
  /*****************************/
  /**Public Administration API */
  /*****************************/

  /**
  * Used to enable auditing on activities performed by user with
  * DV_PATCH_ADMIN role. If DV authorization is successful only because of
  * a user having dv_patch_admin, we would not normally audit this event. But
  * if this procedure is executed, we will record the event in the audit trail.
  */
  PROCEDURE enable_dv_patch_admin_audit;

  /**
  * Used to disable auditing on dv_patch_admin bypass of DV protection.
  */
  PROCEDURE disable_dv_patch_admin_audit;


  /**
  * Used to do the sanity check before configure DV. Check Items includes:
  * The total number of dvsys tables, views, packages package bodies
  * dvf packages, dvf package bodies, dvf functions
  * dependent lbacsys packages and all the dv roles' existence
  */
  PROCEDURE dv_sanity_check;

  /**
  * Used to allow mixed case identifiers.  By default, they are not allowed.
  *
  * @param setting TRUE to allow mixed case
  */
  PROCEDURE set_preserve_case(setting IN BOOLEAN);

  /* Factor Type */

  /**
  * Create a Factor Type
  *
  * @param name Factor Type name
  * @param description Description
  * @throws ORA 20000 Factor Type already exists
  * @throws ORA 20002 Error creating Factor Type
  */
  PROCEDURE create_factor_type
              (name        IN varchar2,
               description IN varchar2);

  /**
  * Delete a Factor Type
  *
  * @param name Factor Type name
  * @throws ORA 20003 Error deleting Factor Type
  */
  PROCEDURE delete_factor_type
              (name IN varchar2);

  /**
  * Update a Factor Type
  *
  * @param name Factor Type name
  * @param description New Description
  * @throws ORA 20004 Error updating Factor Type
  */
  PROCEDURE update_factor_type
              (name IN varchar2,
               description IN varchar2);

  /**
  * Rename a Factor Type
  *
  * @param old_name Previous Factor Type name
  * @param new_name New Factor Type name
  * @throws ORA 20005 Error renaming Factor Type
  */
  PROCEDURE rename_factor_type
              (old_name IN varchar2,
               new_name    IN varchar2);

  /* Factor */

  /**
  * Create a Factor
  *
  * @param factor_name Factor Name
  * @param factor_type_name Factor Type Name
  * @param description Factor description
  * @param rule_set_name Rule Set Name (for assignment)
  * @param get_expr Expression for evaluating Factor
  * @param validate_expr Name of function to validate Factor
  * @param identify_by Options for determining the Factor's identity (see dbms_macutl)
  * @param labeled_by Options for labeling the Factor (see dbms_macutl)
  * @param eval_options Options for evaluating the Factor (see dbms_macutl)
  * @param audit_options Options for auditing the Factor (see dbms_macutl)
  * @param fail_options Options for reporting Factor errors (see dbms_macutl)
  *
  * @throws ORA 20020 Factor already defined
  * @throws ORA 20022 Error creating Factor
  */
  PROCEDURE create_factor
              (factor_name      IN varchar2,
               factor_type_name IN varchar2,
               description      IN varchar2,
               rule_set_name    IN varchar2,
               get_expr         IN varchar2,
               validate_expr    IN varchar2,
               identify_by      IN number,
               labeled_by       IN number,
               eval_options     IN number,
               audit_options    IN number,
               fail_options     IN number,
               namespace           IN varchar2 DEFAULT NULL,
               namespace_attribute IN varchar2 DEFAULT NULL
               );

  /**
  * Update a Factor
  *
  * @param factor_name Factor Name
  * @param factor_type_name Factor Type Name
  * @param description Factor description
  * @param rule_set_name Rule Set Name (for assignment)
  * @param get_expr Expression for evaluating Factor
  * @param validate_expr Name of function to validate Factor
  * @param identify_by Options for determining the Factor's identity (see dbms_macutl)
  * @param labeled_by Options for labeling the Factor (see dbms_macutl)
  * @param eval_options Options for evaluating the Factor (see dbms_macutl)
  * @param audit_options Options for auditing the Factor (see dbms_macutl)
  * @param fail_options Options for reporting Factor errors (see dbms_macutl)
  *
  * @throws ORA 20024 Error updating Factor
  */
  PROCEDURE update_factor
              (factor_name      IN varchar2,
               factor_type_name IN varchar2,
               description      IN varchar2,
               rule_set_name    IN varchar2,
               get_expr         IN varchar2,
               validate_expr    IN varchar2,
               identify_by      IN number,
               labeled_by       IN number,
               eval_options     IN number,
               audit_options    IN number,
               fail_options     IN number,
               namespace           IN varchar2 DEFAULT NULL,
               namespace_attribute IN varchar2 DEFAULT NULL
               );

  /**
  * Delete a Factor
  *
  * @param factor_name Factor to delete
  *
  * @throws ORA 20023 Error deleting Factor
  */
  PROCEDURE delete_factor
              (factor_name IN varchar2);

  /**
  * Delete a Factor
  *
  * @param factor_name Factor to delete
  *
  * @throws ORA 20024 Error updating Factor
  */
  PROCEDURE rename_factor
              (factor_name IN varchar2, new_factor_name IN varchar2);

  /**Factor Link **/

  /**
  * Specify a parent-child relationship for two factors.  The relationship may be
  * used for computing the Factor's identity or label.
  *
  * @param parent_factor_name Parent Factor name
  * @param child_factor_name Child Factor name
  * @param label_indicator Indication of whether the child contributes to the parent's label
  * @throws ORA 20025 Link already exists
  * @throws ORA 20026 Error adding link
  */
  PROCEDURE add_factor_link
              (parent_factor_name IN varchar2,
               child_factor_name  IN varchar2,
               label_indicator    IN varchar2);

  /**
  * Remove a parent-child relationship for two factors.
  *
  * @param parent_factor_name Parent Factor name
  * @param child_factor_name Child Factor name
  *
  * @throws ORA 20027 Link does not exist
  * @throws ORA 20028 Error removing link
  */
  PROCEDURE delete_factor_link
              (parent_factor_name IN varchar2,
               child_factor_name  IN varchar2);


  /* Policy Factor */

  /**
  * Specify that the label for a Factor contributes to the MAC OLS Label for a
  * policy.
  *
  * @param policy_name OLS Policy Name
  * @param factor_name Factor Name
  *
  * @throws ORA 20200 MAC Policy Factor already defined
  * @throws ORA 20202 Error adding MAC Policy FACTOR
  */
  PROCEDURE add_policy_factor
              (policy_name IN varchar2,
               factor_name IN varchar2);

  /**
  * Remove the Factor from contributing to the MAC OLS Label.
  *
  * @param policy_name OLS Policy Name
  * @param factor_name Factor Name
  *
  * @throws ORA 20203 Error deleting MAC Policy FACTOR
  */
  PROCEDURE delete_policy_factor
              (policy_name IN varchar2,
               factor_name IN varchar2);


  /**
  * Create an Identity.  Entities in the environment which will be labeled should be
  * given an identity (except for users, which are handled by OLS).
  *
  * @param factor_name Factor Name
  * @param value VARCHAR2 value associated with the identity
  * @param trust_level >0 for trust level, =0 for not trusted, <0 for distrust level
  *
  * @throws ORA 20040 Identity already defined
  * @throws ORA 20042 Error creating identity
  */
  PROCEDURE create_identity
              (factor_name IN varchar2,
               value       IN varchar2,
               trust_level IN number);

  /**
  * Update an Identity.
  *
  * @param factor_name Factor Name
  * @param value VARCHAR2 value associated with the identity
  * @param trust_level >0 for trust level, =0 for not trusted, <0 for distrust level
  *
  * @throws ORA 20044 Error updating identity
  */
  PROCEDURE update_identity
              (factor_name IN varchar2,
               value       IN varchar2,
               trust_level IN number);

  /**
  * Associate an identity with a different Factor.
  *
  * @param factor_name Current Factor Name
  * @param value Value of the Identity to update
  * @param new_factor_name Factor Name
  *
  * @throws ORA 20044 Error updating identity
  */
  PROCEDURE change_identity_factor
              (factor_name      IN varchar2,
               value            IN varchar2,
               new_factor_name  IN varchar2);

  /**
  * Update the value of an Identity.
  *
  * @param factor_name Factor Name
  * @param value Current value associated with the identity
  * @param new_value New Identity value
  *
  * @throws ORA 20044 Error updating identity
  */
  PROCEDURE change_identity_value
              (factor_name IN varchar2,
               value       IN varchar2,
               new_value   IN varchar2);

  /**
  * Remove an Identity.
  *
  * @param factor_name Factor Name
  * @param value Value associated with the identity
  *
  * @throws ORA 20044 Error deleting identity
  */
  PROCEDURE delete_identity
              (factor_name IN varchar2,
               value       IN varchar2);

  /* Identity Map */

  /*
  * Define a set of tests that are used to derive the identity of a Factor from
  * the value of linked child factors (sub-factors).
  *
  * @param identity_factor_name Factor the identity map is for
  * @param identity_factor_value Value the Factor will assume if the Identity Map is TRUE
  * @param parent_factor_name Identifies the Factor Link the Map is related to
  * @param child_factor_name Identifies the Factor Link the Map is related to
  * @param operation Relational operator for the Map (i.e. <, >, =, ...)
  * @param operand1 Left operand for the relational operator
  * @param operand1 Right operand for the relational operator
  *
  * @throws ORA 20081 Operation not found
  * @throws ORA 20060 Factor Link not found
  * @throws ORA 20062 Error creating Identity Map
  */
  PROCEDURE create_identity_map
               (identity_factor_name  IN varchar2,
                identity_factor_value IN varchar2,
                parent_factor_name    IN varchar2,
                child_factor_name     IN varchar2,
                operation             IN varchar2,
                operand1              IN varchar2,
                operand2              IN varchar2);

  /*
  * Remove an Identity Map for a Factor.
  *
  * @param identity_factor_name Factor the identity map is for
  * @param identity_factor_value Value the Factor will assume if the Identity Map is TRUE
  * @param parent_factor_name Identifies the Factor Link the Map is related to
  * @param child_factor_name Identifies the Factor Link the Map is related to
  * @param operation Relational operator for the Map (i.e. <, >, =, ...)
  * @param operand1 Left operand for the relational operator
  * @param operand1 Right operand for the relational operator
  *
  * @throws ORA 20081 Operation not found
  * @throws ORA 20063 Error deleting Identity Map
  */
  PROCEDURE delete_identity_map
               (identity_factor_name  IN varchar2,
                identity_factor_value IN varchar2,
                parent_factor_name    IN varchar2,
                child_factor_name     IN varchar2,
                operation             IN varchar2,
                operand1              IN varchar2,
                operand2              IN varchar2);

  /**Policy Label */

  /**
  * Label an Identity within a MAC OLS Policy.
  *
  * @param identity_factor_name Name of factor being labeled
  * @param identity_factor_value Value of Identity for the Factor being labeled
  * @param policy_name OLS Policy Name
  * @param label OLS Label
  *
  * @throws ORA 20220 Label already defined in policy
  * @throws ORA 20222 Error creating policy label
  */
  PROCEDURE create_policy_label
              (identity_factor_name  IN varchar2,
               identity_factor_value IN varchar2,
               policy_name           IN varchar2,
               label                 IN varchar2);
               -- algorithm             IN varchar2);

  /**
  * Remove the Label from an Identity within a MAC OLS Policy.
  *
  * @param identity_factor_name Name of factor being labeled
  * @param identity_factor_value Value of Identity for the Factor being labeled
  * @param policy_name OLS Policy Name
  * @param label OLS Label
  *
  * @throws ORA 20223 Error deleting policy label
  */
  PROCEDURE delete_policy_label
              (identity_factor_name  IN varchar2,
               identity_factor_value IN varchar2,
               policy_name           IN varchar2,
               label                 IN varchar2);
               -- algorithm             IN varchar2);

  /* MAC Policy Algorithm */

  /**
  * Specify the algorithm that is used to merge labels when computing the label for
  * a Factor, or the MAC OLS Session label.  The algorithm is a 3-letter acronym
  * (e.g. LII, HUU, ...).  Consult OLS documentation for details.
  *
  * @param policy_name OLS Policy Name
  * @param algorithm Merge algorithm
  *
  * @throws ORA 20180 MAC Policy already defined
  * @throws ORA 20182 Algorithm not found
  * @throws ORA 20381 Policy not found
  */
  PROCEDURE create_mac_policy
              (policy_name           IN varchar2,
               algorithm             IN varchar2,
               error_label           IN varchar2 DEFAULT NULL);

  /**
  * Specify the algorithm that is used to merge labels when computing the label for
  * a Factor, or the MAC OLS Session label.  The algorithm is a 3-letter acronym
  * (e.g. LII, HUU, ...).  Consult OLS documentation for details.
  *
  * @param policy_name OLS Policy Name
  * @param algorithm Merge algorithm
  *
  * @throws ORA 20182 Algorithm not found
  * @throws ORA 20184 Error updating MAC Policy
  * @throws ORA 20381 Policy not found
  */
  PROCEDURE update_mac_policy
              (policy_name  IN varchar2,
               algorithm             IN varchar2,
               error_label           IN varchar2 DEFAULT NULL);

  /**
  * Deletes all DV objects related to an OLS policy.  This method should be called
  * after an OLS policy has been deleted to ensure that there are not any broken
  * references between DV and OLS.  Note that there is not any referential integrity
  * constraints between DV and OLS.  The affected objects are in the mac_policy$,
  * mac_policy_factor$, and policy_label$ tables.
  *
  * @param policy_name OLS Policy Name
  *
  * @throws ORA 20185 Error deleting MAC Policy
  * @throws ORA 20381 Policy not found
  */
  PROCEDURE delete_mac_policy_cascade(policy_name IN varchar2);

  /* Realm */

  /**
  * Create a Realm
  *
  * @param realm_name Realm name
  * @param description Realm description
  * @param enabled Indication of whether the realm checking is on or off (g_yes/g_no)
  * @param audit_options How to audit realm (described in dbms_macutl)
  * @param realm_type Realm type
  *
  * @throws ORA 20240 Realm already defined
  * @throws ORA 20242 Error creating realm
  */
  PROCEDURE create_realm
              (realm_name  IN varchar2,
               description IN varchar2,
               enabled IN varchar2,
               audit_options IN number,
               realm_type    IN number default NULL) ;

  /**
  * Update a Realm
  *
  * @param realm_name Realm name
  * @param description Realm description
  * @param enabled Indication of whether the realm checking is on or off (g_yes/g_no)
  * @param audit_options How to audit realm (described in dbms_macutl)
  * @param realm_type Realm type
  *
  * @throws ORA 20244 Error updating realm
  */
  PROCEDURE update_realm
              (realm_name  IN varchar2,
               description IN varchar2,
               enabled IN varchar2,
               audit_options IN number default NULL,
               realm_type    IN number default NULL) ;

  /**
  * Rename a Realm
  *
  * @param realm_name Realm name
  * @param new_name New Realm name
  *
  * @throws ORA 20245 Error renaming realm
  */
  PROCEDURE rename_realm
              (realm_name  IN varchar2,
               new_name    IN varchar2);

  /**
  * Drop a Realm
  *
  * @param realm_name Realm name
  *
  * @throws ORA 20243 Error deleting realm
  */
  PROCEDURE delete_realm
              (realm_name IN varchar2);

  /**
  * Deletes a DV realm, including the related Realm objects (realm_object$),
  * and authorizations (realm_auth$).
  *
  * @param realm_name Realm name
  *
  * @throws ORA 20241 Realm not found
  * @throws ORA 20243 Error deleting realm
  */
  PROCEDURE delete_realm_cascade
              (realm_name IN varchar2);

  /**
  * Authorize a user or role to access a realm as a participant or owner.  The
  * authorization can be made conditional based on a Rule Set (i.e. only authorized
  * if the Rule Set evaluates to TRUE).
  *
  * @param realm_name Realm name
  * @param grantee User or role name
  * @param rule_set_name Rule Set to check before authorizing (optional)
  * @param auth_options Authorization level (participant or owner - see dbms_macutl)
  *
  * @throws ORA 20260 Realm Authorization already defined
  * @throws ORA 20262 Error adding Realm Authorization
  */
  PROCEDURE add_auth_to_realm
              (realm_name    IN varchar2,
               grantee       IN varchar2,
               rule_set_name IN varchar2,
               auth_options  IN number);

  /**
  * Authorize a user or role to access a realm as a participant.
  *
  * @param realm_name Realm name
  * @param grantee User or role name
  *
  * @throws ORA 20260 Realm Authorization already defined
  * @throws ORA 20262 Error adding Realm Authorization
  */
  PROCEDURE add_auth_to_realm
              (realm_name    IN varchar2,
               grantee       IN varchar2);

  /**
  * Authorize a user or role to access a realm as an owner or participant (no Rule Set).
  *
  * @param realm_name Realm name
  * @param grantee User or role name
  * @param auth_options Authorization level (participant or owner - see dbms_macutl)
  *
  * @throws ORA 20260 Realm Authorization already defined
  * @throws ORA 20262 Error adding Realm Authorization
  */
  PROCEDURE add_auth_to_realm
              (realm_name    IN varchar2,
               grantee       IN varchar2,
               auth_options  IN number);

  /**
  * Authorize a user or role to access a realm as a participant (optional).
  *
  * @param realm_name Realm name
  * @param grantee User or role name
  * @param rule_set_name Rule Set to check before authorizing (optional)
  *
  * @throws ORA 20260 Realm Authorization already defined
  * @throws ORA 20262 Error adding Realm Authorization
  */
  PROCEDURE add_auth_to_realm
              (realm_name    IN varchar2,
               grantee       IN varchar2,
               rule_set_name IN varchar2);

  /**
  * Remove the authorization of a user or role to access a realm.
  *
  * @param realm_name Realm name
  * @param grantee User or role name
  *
  * @throws ORA 20263 Error deleting Realm Authorization
  */
  PROCEDURE delete_auth_from_realm
              (realm_name    IN varchar2,
               grantee       IN varchar2);
               -- rule_set_name IN varchar2);

  /**
  * Update the authorization of a user or role to access a realm.
  *
  * @param realm_name Realm name
  * @param grantee User or role name
  * @param rule_set_name Rule Set to check before authorizing (optional)
  * @param auth_options Authorization level (participant or owner - see dbms_macutl)
  *
  * @throws ORA 20264 Error updating Realm Authorization
  */
  PROCEDURE update_realm_auth
              (realm_name    IN varchar2,
               grantee       IN varchar2,
               rule_set_name IN varchar2,
               auth_options  IN number);

  /**
  * Register a set of objects for Realm protection.
  *
  * @param realm_name Realm name
  * @param object_owner Object owner
  * @param object_name Object name (Wild card % is allowed)
  * @param object_type Object type (Wild card % is allowed)
  *
  * @throws ORA 20280 Object already in Realm
  * @throws ORA 20282 Error adding object to Realm
  */
  PROCEDURE add_object_to_realm
              (realm_name    IN varchar2,
               object_owner  IN varchar2,
               object_name   IN varchar2,
               object_type   IN varchar2);

  /**
  * Remove a set of objects from Realm protection.
  *
  * @param realm_name Realm name
  * @param object_owner Object owner
  * @param object_name Object name (Wild card % is allowed)
  * @param object_type Object type (Wild card % is allowed)
  *
  * @throws ORA 20283 Error deleting object to Realm
  */
  PROCEDURE delete_object_from_realm
              (realm_name    IN varchar2,
               object_owner  IN varchar2,
               object_name   IN varchar2,
               object_type   IN varchar2);

  /**
  * Enable/disable Event
  *
  * @param enable
  *
  */
  PROCEDURE enable_event(event IN number);
  PROCEDURE disable_event(event IN number);

  /* Rule Set */

  /**
  * Create a Rule Set.
  *
  * @param rule_set_name Rule Set name
  * @param description Description
  * @param enabled Whether to evaluate Rule Set or ignore it
  * @param eval_options Evaluation options (see dbms_macutl)
  * @param audit_options Audit options (see dbms_macutl)
  * @param fail_options Fail options (see dbms_macutl)
  * @param fail_message Error message for failure
  * @param fail_code Error code to return on failure
  * @param handler_options Handler options (see dbms_macutl)
  * @param handler Handler method
  *
  * @throws ORA 20340 Rule Set already defined
  * @throws ORA 20342 Error creating Rule Set
  */
  PROCEDURE create_rule_set
              (rule_set_name   IN varchar2,
               description     IN varchar2,
               enabled         IN varchar2,
               eval_options    IN number,
               audit_options   IN number,
               fail_options    IN number,
               fail_message    IN varchar2,
               fail_code       IN number,
               handler_options IN number,
               handler         IN varchar2,
               is_static       IN boolean default false);

  /**
  * Update a Rule Set.
  *
  * @param rule_set_name Rule Set name
  * @param description Description
  * @param enabled Whether to evaluate Rule Set or ignore it
  * @param eval_options Evaluation options (see dbms_macutl)
  * @param audit_options Audit options (see dbms_macutl)
  * @param fail_options Fail options (see dbms_macutl)
  * @param fail_message Error message for failure
  * @param fail_code Error code to return on failure
  * @param handler_options Handler options (see dbms_macutl)
  * @param handler Handler method
  *
  * @throws ORA 20344 Error updating Rule Set
  */
  PROCEDURE update_rule_set
              (rule_set_name   IN varchar2,
               description     IN varchar2,
               enabled         IN varchar2,
               eval_options    IN number,
               audit_options   IN number,
               fail_options    IN number,
               fail_message    IN varchar2,
               fail_code       IN number,
               handler_options IN number,
               handler         IN varchar2,
               is_static       IN boolean default false);

  /**
  * Rename a Rule Set.
  *
  * @param rule_set_name Rule Set name
  * @param new_name New rule set name
  *
  * @throws ORA 20344 Error updating Rule Set
  */
  PROCEDURE rename_rule_set
              (rule_set_name IN varchar2,
               new_name      IN varchar2);

  /**
  * Delete a Rule Set.
  *
  * @param rule_set_name Rule Set name
  *
  * @throws ORA 20343 Error deleting Rule Set
  */
  PROCEDURE delete_rule_set
              (rule_set_name IN varchar2);

  /**
  * Add a Rule to a Rule Set.
  *
  * @param rule_set_name Rule Set name
  * @param rule_name Rule name
  * @param rule_order Order of evaluation for Rule in Rule Set
  * @param enabled Whether or not the Rule is enabled
  *
  * @throws ORA 20360 Rule already added to Rule Set
  * @throws ORA 20362 Error adding Rule to Rule Set
  */
  PROCEDURE add_rule_to_rule_set
              (rule_set_name IN varchar2,
               rule_name     IN varchar2,
               rule_order    IN number,
               enabled       IN varchar2) ;

  /**
  * Add an enabled Rule to a Rule Set.
  *
  * @param rule_set_name Rule Set name
  * @param rule_name Rule name
  * @param rule_order Order of evaluation for Rule in Rule Set
  *
  * @throws ORA 20360 Rule already added to Rule Set
  * @throws ORA 20362 Error adding Rule to Rule Set
  */
  PROCEDURE add_rule_to_rule_set
              (rule_set_name IN varchar2,
               rule_name     IN varchar2,
               rule_order    IN number);

  /**
  * Add an enabled Rule to the end of Rule Set (i.e. evaluated last).
  *
  * @param rule_set_name Rule Set name
  * @param rule_name Rule name
  *
  * @throws ORA 20360 Rule already added to Rule Set
  * @throws ORA 20362 Error adding Rule to Rule Set
  */
  PROCEDURE add_rule_to_rule_set
              (rule_set_name IN varchar2,
               rule_name     IN varchar2);

  /**
  * Delete a Rule from a Rule Set.
  *
  * @param rule_set_name Rule Set name
  * @param rule_name Rule name
  *
  * @throws ORA 20363 Error deleting Rule to Rule Set
  */
  PROCEDURE delete_rule_from_rule_set
              (rule_set_name IN varchar2,
               rule_name     IN varchar2);

  /* Rule */

  /**
  * Create a Rule
  *
  * @param rule_name Rule name
  * @param rule_expr PL/SQL Boolean expression
  *
  * @throws ORA 20320 Rule already defined
  * @throws ORA 20322 Error creating Rule
  */
  PROCEDURE create_rule
              (rule_name  IN varchar2,
               rule_expr  IN varchar2);
  /**
  * Update a Rule
  *
  * @param rule_name Rule name
  * @param rule_expr PL/SQL Boolean expression
  *
  * @throws ORA 20324 Error updating Rule
  */
  PROCEDURE update_rule
              (rule_name  IN varchar2,
               rule_expr  IN varchar2);

  /**
  * Rename a Rule
  *
  * @param rule_name Rule name
  * @param new_name New Rule name
  *
  * @throws ORA 20324 Error updating Rule
  */
  PROCEDURE rename_rule
              (rule_name  IN varchar2,
               new_name  IN varchar2);

  /**
  * Delete a Rule
  *
  * @param rule_name Rule name
  *
  * @throws ORA 20323 Error deleting Rule
  */
  PROCEDURE delete_rule
              (rule_name  IN varchar2);


  /* Role */

  /**
  * Create a DV Secure Application Role.  Access to the role is protected
  * by a Rule Set.
  *
  * @param role_name Role name
  * @param enabled Whether the role is enabled or diabled
  * @param rule_set_name Rule Set to determine whether a user can set the role
  *
  * @throws ORA 20300 Role already defined
  * @throws ORA 20302 Error creating role
  *
  */
  PROCEDURE create_role
              (role_name IN varchar2,
               enabled   IN varchar2,
               rule_set_name IN varchar2);

  /**
  * Delete a DV Secure Application Role.
  *
  * @param role_name Role name
  *
  * @throws ORA 20303 Error deleting role
  *
  */
  PROCEDURE delete_role
              (role_name IN varchar2);

  /**
  * Update a DV Secure Application Role.  Access to the role is protected
  * by a Rule Set.
  *
  * @param role_name Role name
  * @param enabled Whether the role is enabled or diabled
  * @param rule_set_name Rule Set to determine whether a user can set the role
  *
  * @throws ORA 20304 Error updating role
  *
  */
  PROCEDURE update_role
              (role_name IN varchar2,
               enabled   IN varchar2,
               rule_set_name IN varchar2);

  /**
  * Rename a DV Secure Application Role.
  *
  * @param role_name Role name
  * @param new_role_name Role name
  *
  * @throws ORA 20304 Error updating role
  *
  */
  PROCEDURE rename_role
              (role_name IN varchar2,
               new_role_name  IN varchar2);

  /* Command Rule */

  /**
  * Protect a database command by associating it with a Rule Set.  The
  * command can only be executed if the Rule Set evaluates to TRUE.
  *
  * @param command SQL command to protect
  * @param rule_set_name Rule Set to protect command
  * @param object_owner Related database object schema
  * @param object_name Related database object name
  * @param enabled Whether the command rule is enabled or disabled
  *
  * @throws ORA 20081 Command not found
  * @throws ORA 20100 Command rule already defined
  * @throws ORA 20102 Error creating Command Rule
  */
  PROCEDURE create_command_rule
              (command IN varchar2,
               rule_set_name IN varchar2,
               object_owner  IN varchar2,
               object_name   IN varchar2,
               enabled       IN varchar2,
               privilege_scope IN NUMBER DEFAULT NULL);

  /**
  * Drop a Command Rule declaration.
  *
  * @param command SQL command to protect
  * @param object_owner Related database object schema
  * @param object_name Related database object name
  *
  * @throws ORA 20081 Command not found
  * @throws ORA 20103 Error deleting Command Rule
  */
  PROCEDURE delete_command_rule
              (command IN varchar2,
               object_owner  IN varchar2,
               object_name   IN varchar2);

  /**
  * Update a Command Rule declaration.
  *
  * @param command SQL command to protect
  * @param rule_set_name Rule Set to protect command
  * @param object_owner Related database object schema
  * @param object_name Related database object name
  * @param enabled Whether the command rule is enabled or disabled
  *
  * @throws ORA 20081 Command not found
  * @throws ORA 20104 Error updating Command Rule
  */
  PROCEDURE update_command_rule
              (command IN varchar2,
               rule_set_name IN varchar2,
               object_owner  IN varchar2,
               object_name   IN varchar2,
               enabled       IN varchar2,
               privilege_scope IN NUMBER DEFAULT NULL);

  /**
  * Returns information from the sys.v_$instance view.
  *
  *  @param p_parameter Column name in sys.v_$instance
  *  @return Value of column p_parameter in sys.v_$instance
  */
  FUNCTION get_instance_info(p_parameter IN VARCHAR2) RETURN VARCHAR2;

  /**
  * Returns information from the sys.v_$session view for the current session
  *
  *  @param p_parameter Column name in sys.v_$session
  *  @return Value of column p_parameter in sys.v_$session
  */
  FUNCTION get_session_info(p_parameter IN VARCHAR2) RETURN VARCHAR2;

  /**
  * Add a RAC database node to a domain. If the identity for the domain does
  * not exist the identity will be added.
  * Creates the required identity map information for the database hostname provided.
  * If the OLS policy is provided, domain will be added as a policy factor
  * if it is not already associated. If the label for the identity of this domain
  * does not exist the label will be added.
  * This call must be made with the instance running on the host specified.
  *
  * @param domain_name Name of the domain to add the host to
  * @param domain_host RAC host name being added to the domain
  * @param policy_name OLS Policy Name to label the domain for
  * @param label OLS Label to label the domain within this policy
  *
  * @throws ORA 20921 Error adding host to domain
  */

  PROCEDURE create_domain_identity
              (domain_name IN varchar2,
               domain_host IN varchar2,
               policy_name IN varchar2 DEFAULT NULL,
               domain_label IN varchar2 DEFAULT NULL
               );

  /**
  * Remove a RAC database node from a domain.
  * Creates the required identity map information for the database hostname provided.
  *
  * @param domain_name Name of the domain to add the host to
  * @param domain_host RAC host name being added to the domain
  *
  * @throws ORA 20922 Error removing host to domain
  */
  PROCEDURE drop_domain_identity
              (domain_name IN varchar2,
               domain_host IN varchar2);

  /**
  * Returns the character set for the database
  *
  * @return character set for the database
  */
  FUNCTION get_db_charset RETURN VARCHAR2;

  /**
  * Returns the 3 character Oracle language for the current administration session
  * Based on set_ora_lang_from_java
  *
  * @return 3 character oracle language identifier for the administration current session
  */
  FUNCTION get_ora_lang RETURN VARCHAR2;

  /**
  * Sets the 3 character Oracle language for the current session
  * based on the Java language parameter passed in, converting as required
  *
  * @param p_lang Java language to set
  */
  PROCEDURE set_ora_lang_from_java(p_lang IN VARCHAR2);

  /**
  * check to see if alter system set system_trig_enabled
  *
  * return 'Y' or 'N'
  */
  FUNCTION check_trig_parm_varchar RETURN VARCHAR2;

  /**
  * check to see if following O7_DICTIONARY_ACCESSIBILITY
  * is allowed:
  *
  * return 'Y' or 'N'
  */
  FUNCTION check_o7_parm_varchar RETURN VARCHAR2;

  /**
  * check to see if alter system set _dynamic_rls_policies
  * are allowed
  *
  * return 'Y' or 'N'
  */
  FUNCTION check_dynrls_parm_varchar RETURN VARCHAR2;

  /**
  * check to see if following ALTER SYSTEM security system parameters
  * are allowed :
  *    _SYSTEM_TRIG_ENABLED POLICIES
  *    O7_DICTIONARY_ACCESSIBILITY
  *    _DYNAMIC_RLS_POLICIES
  *
  * return 'Y' or 'N'
  */
  FUNCTION check_sys_sec_parm_varchar RETURN VARCHAR2;

  /**
  * check to see if following ALTER SYSTEM dump or dest parameters
  * are allowed :
  *    MAX_DUMP_FILE_SIZE
  *    %DUMP%
  *    %_DEST%
  *    LOG_ARCHIVE%
  *    STANDBY_ARCHIVE%
  *    DB_RECOVERY_FILE_DEST_SIZE
  *
  * return 'Y' or 'N'
  */
  FUNCTION check_dump_dest_parm_varchar RETURN VARCHAR2;

  /**
  * check to see if following ALTER SYSTEM backup restore parameters
  * are allowed :
  *    RECYCLEBIN
  *
  * return 'Y' or 'N'
  */
  FUNCTION check_backup_parm_varchar RETURN VARCHAR2;

  /**
  * check to see if following ALTER SYSTEM database file parameters
  * are allowed :
  *    CONTROL_FILES
  *
  * return 'Y' or 'N'
  */
  FUNCTION check_db_file_parm_varchar RETURN VARCHAR2;

  /**
  * check to see if following ALTER SYSTEM optimizer parameters
  * are allowed :
  *    OPTIMIZER_SECURE_VIEW_MERGING
  *
  * return 'Y' or 'N'
  */
  FUNCTION check_optimizer_parm_varchar RETURN VARCHAR2;

  /**
  * check to see if following ALTER SYSTEM plsql parameters
  * are allowed :
  *    UTL_FILE_DIR
  *    PLSQL_DEBUG
  *
  * return 'Y' or 'N'
  */
  FUNCTION check_plsql_parm_varchar RETURN VARCHAR2;

  /**
  * check to see if following ALTER SYSTEM security parameters
  * are allowed :
  *    AUDIT_SYS_OPERATIONS
  *    AUDIT_TRAIL
  *    AUDIT_SYSLOG_LEVEL
  *    REMOTE_OS_ROLES
  *    OS_ROLES
  *    SQL92_SECURITY
  *
  * return 'Y' or 'N'
  */
  FUNCTION check_security_parm_varchar RETURN VARCHAR2;

  /**
  * check to see if alter dvsys
  *
  * return 'Y' or 'N'
  */
  FUNCTION is_alter_user_allow_varchar(login_user VARCHAR2) RETURN VARCHAR2;

  FUNCTION is_drop_user_allow_varchar(login_user VARCHAR2) RETURN VARCHAR2;

  PROCEDURE authorize_datapump_user(
       uname       IN VARCHAR2,
       sname       IN VARCHAR2 DEFAULT NULL,
       objname     IN VARCHAR2 DEFAULT NULL
   );

  PROCEDURE unauthorize_datapump_user(
       uname       IN VARCHAR2,
       sname       IN VARCHAR2 DEFAULT NULL,
       objname     IN VARCHAR2 DEFAULT NULL
  );

  PROCEDURE authorize_tts_user(
       uname       IN VARCHAR2,
       tsname      IN VARCHAR2
  );

  PROCEDURE unauthorize_tts_user(
       uname       IN VARCHAR2,
       tsname      IN VARCHAR2
  );

  /* API to authorize a user to run jobs in the schema of other users. */
  PROCEDURE authorize_scheduler_user(
       uname       IN VARCHAR2,
       sname       IN VARCHAR2 DEFAULT NULL
   );

  PROCEDURE unauthorize_scheduler_user(
       uname       IN VARCHAR2,
       sname       IN VARCHAR2 DEFAULT NULL
   );

  /* APIs to authorize a user to proxy as another user. */
  PROCEDURE authorize_proxy_user
           ( uname       IN VARCHAR2 ,
             sname       IN VARCHAR2 DEFAULT NULL
           );

  PROCEDURE unauthorize_proxy_user
           ( uname       IN VARCHAR2 ,
             sname       IN VARCHAR2 DEFAULT NULL
           );

  /* APIs to authorize a user to execute DDLs on another user's schema. */
  PROCEDURE authorize_ddl
           ( uname       IN VARCHAR2 ,
             sname       IN VARCHAR2 DEFAULT NULL
           );

  PROCEDURE unauthorize_ddl
           ( uname       IN VARCHAR2 ,
             sname       IN VARCHAR2 DEFAULT NULL
           );

  /* BUG FIX 10225918 - Procedure to insert DV metadata in supported languages.
   Supported input Language values are :
   ENGLISH
   GERMAN
   SPANISH
   FRENCH
   ITALIAN
   JAPANESE
   KOREAN
   BRAZILIAN PORTUGUESE
   SIMPLIFIED CHINESE
   TRADITIONAL CHINESE
  */
  PROCEDURE add_nls_data(
       lang         IN VARCHAR2
   );

  /*
  * Enable/disable DV enforcement
  */

  PROCEDURE enable_dv;
  PROCEDURE disable_dv;

  -- Control ORADEBUG in Database Vault environment
  PROCEDURE enable_oradebug;
  PROCEDURE disable_oradebug;

  -- Control whether user can log into DVSYS and DVF accounts
  PROCEDURE enable_dv_dictionary_accts;
  PROCEDURE disable_dv_dictionary_accts;

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."DBMS_MACAUD" AS

  /*********************/
  /*  Global Constants */
  /*********************/

  PROCEDURE create_admin_audit(actcode  IN PLS_INTEGER,
                               actobjnm IN varchar2,
                               actobjid IN PLS_INTEGER,
                               actcmd   IN varchar2,
                               retcode  IN PLS_INTEGER,
                               rsetid   IN PLS_INTEGER,
                               comment  IN varchar2);

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."EVENT" IS

 PROCEDURE set_c (P_SYSEVENT        VARCHAR2,
                  P_LOGIN_USER      VARCHAR2,
                  P_INSTANCE_NUM    VARCHAR2,
                  P_DATABASE_NAME   VARCHAR2,
                  P_DICT_OBJ_TYPE   VARCHAR2,
                  P_DICT_OBJ_OWNER  VARCHAR2,
                  P_DICT_OBJ_NAME   VARCHAR2,
                  P_SQL_TEXT        VARCHAR2);

 PROCEDURE set (P_SYSEVENT        VARCHAR2,
                P_LOGIN_USER      VARCHAR2,
                P_INSTANCE_NUM    NUMBER,
                P_DATABASE_NAME   VARCHAR2,
                P_DICT_OBJ_TYPE   VARCHAR2,
                P_DICT_OBJ_OWNER  VARCHAR2,
                P_DICT_OBJ_NAME   VARCHAR2,
                P_SQL_TEXT        VARCHAR2);

 PROCEDURE setdefault;

END event;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."DBMS_MACSEC_RULES" AS

  /**
  * Evaluates a Rule Set in accordance with the options specified in the
  * rule_set$ table.
  * @param p_rule_set Rule Set Name
  * @param x_result Whether Rule Set evaluated to TRUE or FALSE.  Note: NULL result returns as FALSE
  * @param x_rule Name of last Rule evaluated
  * @param x_rule_error True if a rule raised an error
  * @param x_handler_error True if the rule set handler raised an error
  * @param x_error_code If x_rule_error or x_handler_error, returns the error code
  * @param x_error_text If x_rule_error or x_handler_error, returns the error code
  */
  PROCEDURE evaluate(p_rule_set      IN  VARCHAR2,
                     p_sql_text      IN  VARCHAR2,
                     x_result        OUT BOOLEAN,
                     x_rule          OUT VARCHAR2,
                     x_rule_error    OUT BOOLEAN,
                     x_handler_error OUT BOOLEAN,
                     x_error_code    OUT NUMBER,
                     x_error_text    OUT VARCHAR2);

  PROCEDURE evaluate_tr(p_rule_set    IN NUMBER,
                        p_eval_ret    IN OUT BINARY_INTEGER,
                        p_error_code  IN OUT BINARY_INTEGER,
                        p_error_text  IN OUT VARCHAR2) as
    LANGUAGE C
    NAME "kzvdversetev"
    LIBRARY DVSYS.KZV$RUL_LIBT
    WITH CONTEXT PARAMETERS(context, p_rule_set OCINUMBER, p_eval_ret,
                            p_error_code, p_error_text);


  /**
  * This is a temporary wrapper for evaluate.  OCI cannot pass BOOLEAN
  * variables to or from PL/SQL.  Therefore, we need a wrapper that
  * converts booleans to integers.
  */
  PROCEDURE evaluate_wr(p_rule_set      IN  VARCHAR2,
                         x_result        OUT INTEGER,
                         x_rule          OUT VARCHAR2,
                         x_rule_error    OUT INTEGER,
                         x_handler_error OUT INTEGER,
                         x_error_code    OUT NUMBER,
                         x_error_text    OUT VARCHAR2);
END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."DBMS_MACSEC" AS

  -- Audit action codes
  G_SECURE_ROLE_AUDIT_CODE CONSTANT PLS_INTEGER := 10006;

  /**
  * Set value of a Factor (if allowed by the assignment Rule Set)
  *
  * @param p_factor Factor name
  * @param p_value Value to assign to Factor
  * @throws ORA 20391 If the assignment Rule Set is FALSE
  * @throws ORA 20392 If the Factor does not have an assignment Rule Set
  */
  PROCEDURE set_factor(p_factor IN VARCHAR2,
                       p_value  IN VARCHAR2);

  /**
  * Returns the value of a factor.  Note that this method will return the
  * value cached in the context if the eval_option is set for evaluate on
  * session.
  *
  * @param p_factor Factor name
  * @throws ORA 20021 Factor not found
  * @throws ORA 20402 Bad eval_options
  * @throws ORA 20397 Bad identified_by
  */
  FUNCTION get_factor(p_factor IN VARCHAR2) RETURN VARCHAR2;

  /**
  * Returns the label of a factor.
  *
  * @param p_factor Factor name
  * @param p_policy_name OLS Policy name
  * @throws ORA 20021 Factor not found
  * @throws ORA 20402 Bad eval_options
  * @throws ORA 20397 Bad identified_by
  */
  FUNCTION get_factor_label(p_factor IN VARCHAR2, p_policy_name IN VARCHAR2) RETURN VARCHAR2;

  /**
  * Get Trust Level of a Factor
  *
  * @param p_factor Factor name
  * @return > 0 indicates level of trust, 0 is no trust, < 0 indicates distrust
  */
  FUNCTION get_trust_level(p_factor IN VARCHAR2) RETURN NUMBER;

  /**
  * Get Trust Level of a Factor Identity
  *
  * @param p_factor Factor name
  * @param p_identity Identity value
  * @return > 0 indicates level of trust, 0 is no trust, < 0 indicates distrust
  */
  FUNCTION get_trust_level(p_factor   IN VARCHAR2,
                           p_identity IN VARCHAR2) RETURN NUMBER;

  /**
  * This method determines if a Secure Application Role is enabled
  * for use.
  * @param p_role Role name
  * @return TRUE if a SET ROLE command can be issued
  */
  FUNCTION role_is_enabled(p_role IN VARCHAR2) RETURN BOOLEAN;

  /** Fix for Bug 6441524
  * Checks whether or not the given role is a secure application role
  *
  * @param role name
  * @return TRUE if the role is a secure application role; FALSE otherwise
  */
  FUNCTION is_secure_application_role(p_role VARCHAR2) RETURN BOOLEAN;

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."DBMS_MACOLS" AS

  -- Audit action codes
  G_MAC_OLS_INIT_AUDIT_CODE    CONSTANT PLS_INTEGER := 10009;

  /**
  * Initializes MACOLS and sets the user's session label.  This method should
  * be called during the Login trigger processing, after MACSEC init_session
  * has completed.  This method should only be called if OLS is installed -
  * see dbms_macutl.is_ols_installed.  At a high level, the processing performs
  * the following:
  *
  * for each OLS policy + merge algorithm
  *    determine the user's OLS label for the session;
  *    for each labeled factor loop
  *       compute the label of the factor based on the policy algorithm;
  *    end loop;
  *    merge the factor labels together using the policy algorithm to compute
  *      the maximum possible label for the user's session (MACOLS label);
  *    if the user's OLS label dominates the MAXOLS label then
  *      merge the labels using the algorithm to compute the user's new session label;
  *    end if;
  *  cache the factor labels, MACOLS label, and session labels in the user's context
  *   set the user's session label for the policy;
  * end loop;
  */
  PROCEDURE init_session;

  -- Methods below are exposed temporarily for debugging
  /**
  * Determines the lowest sensitivity level for a policy.
  *
  * @param p_mac_policy_id Id of policy from mac_policy$ table
  * @return Label of lowest sensitivity
  */
  FUNCTION min_policy_label_of(p_mac_policy_id IN NUMBER) RETURN VARCHAR2;

  /**
  * Computes the label of a factor for the specified policy
  *
  * @param p_mac_policy_id Id of policy from mac_policy$ table
  * @return Label of factor
  */
  FUNCTION label_of(p_mac_policy_id IN NUMBER,
                    p_factor_id     IN NUMBER) RETURN VARCHAR2;

  /**
  * Create the contexts used to cache MACOLS labels.  One context is
  * created to cache the labels for each Factor, and another is
  * create to cache session related label values (see dbms_macutl).
  *
  * @param p_policy_name OLS Policy Name
  *
  */
  PROCEDURE create_macols_contexts(p_policy_name IN VARCHAR2);

  /**
  * Drop the contexts used to cache MACOLS labels.
  *
  * @param p_policy_name OLS Policy Name
  *
  */
  PROCEDURE drop_macols_contexts(p_policy_name IN VARCHAR2);

  /**
  /**
  * Sets a value in a MACOLS context
  *
  * @param p_policy_name OLS Policy Name
  * @param p_context_type Context name (see dbms_macutl for helpful constants)
  * @param p_label Label value
  */
  PROCEDURE update_policy_label_context(p_policy_name  IN VARCHAR2,
                                        p_context_type IN VARCHAR2,
                                        p_label        IN VARCHAR2);

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."DBMS_MACSEC_ROLES" AUTHID CURRENT_USER AS

  /**
  * Checks whether the user invoking the method is authorized to use
  * the specified DV Secure Application Role.  The authorization is
  * determined by checking the Rule Set associted with the role.
  *
  * @param p_role Secure Application Role name
  * @return TRUE if user is allowed to set the role
  */
  FUNCTION can_set_role(p_role IN VARCHAR2) RETURN BOOLEAN ;

  /**
  * Issues the SET ROLE command for a DV Secure Application Role.  Before
  * the SET ROLE is issued, the can_set_role method is called to check
  * the Rule Set associated with the role.
  *
  * @param p_role Secure Application Role name
  * @throws Exception if user is not authorized
  */
  PROCEDURE set_role(p_role IN VARCHAR2);

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."DBMS_MACSEC_ROLE_ADMIN" AS

  /**
  * Creates a DV Secure Application Role, which controls the ability for users to
  * access the role based on a Rule Set.  Essentially, the following command is
  * issued:
  *
  * CREATE ROLE <role name> IDENTIFIED USING dvsys.dbms_macsec_roles;
  *
  * @param p_role Name of role to create
  */
  PROCEDURE create_role(p_role IN VARCHAR2);

  /**
  * Drops a DV Secure Application Role
  *
  * @param p_role Name of role to drop
  */
  PROCEDURE drop_role(p_role IN VARCHAR2);

END;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DVSYS"."DBMS_MACOLS_SESSION" AS

    -- Audit action codes
    G_MAC_OLS_UPGRADE_AUDIT_CODE CONSTANT PLS_INTEGER := 10010;

    /**
    * Is OLS policy is protected by MAC OLS under DV
    *
    * @param policy_name OLS Policy Name
    */
    FUNCTION is_mac_policy(policy_name VARCHAR2) RETURN NUMBER;

    /**
    * Is the max_session_label of the  mac OLS policy set
    *
    * @param policy_name OLS Policy Name
    */
   FUNCTION is_mac_label_set(policy_name VARCHAR2) RETURN NUMBER;

    /**
    * Can the label be set under MAC OLS for this policy beyond max session label
    *
    * @param policy_name OLS Policy Name
    * @param label OLS Label for the policy
    */
    FUNCTION can_set_label(policy_name VARCHAR2,label VARCHAR2) RETURN NUMBER;

    /**
    * Set the MAC OLS session context variable for the attribute specified
    *
    * @param policy_name OLS Policy Name
    * @param label OLS Label for the policy
    * @param attribute session context attribute
    */
    PROCEDURE set_policy_label_context(policy_name VARCHAR2,label VARCHAR2,attribute VARCHAR2);

    /**
    * Audit invalid attempt to set/change the label for this policy
    * beyond max session label and raise the appropriate exception
    * This procedure is invoked by sa_session.set_label,
    * sa_session.set_access_profile, sa_session.restore_default_labels
    * in two cases: a. the label to set is beyond the max session label;
    * b. the max_session_label is NULL.
    *
    * @param policy_name OLS Policy Name
    * @param label OLS Label for the policy
    * @param proc_name Name of the procedure/function invoking this procedure.
    */
    PROCEDURE label_audit_raise(policy_name VARCHAR2 ,
       label VARCHAR2,
       proc_name VARCHAR2) ;

    /**
    * MAC OLS processing to merge default session label for the policy
    * with the labels of any factors associated to the policy after the
    * SA_SESSION restore_default_labels method is called
    *
    * @param policy_name OLS Policy Name
    * @param x_session_label resulting session label after the merge
    * @param x_mac_label resulting MAX session label after the merge
    */
    PROCEDURE restore_default_labels(policy_name IN VARCHAR2
           , x_session_label OUT VARCHAR2
           , x_mac_label OUT VARCHAR2) ;

    /**
    * MAC OLS processing to merge default session label for the policy
    * with the exist MAX session label after the
    * SA_SESSION set_access_profile method is called
    *
    * @param policy_name OLS Policy Name
    * @param user_name OLS Policy User Name
    * @param p_max_session_label existing MAX session label for the policy
    * @param x_new_max_session_label new MAX session label for the policy
    */
    FUNCTION set_access_profile(policy_name VARCHAR2 ,
            user_name VARCHAR2,
            p_max_session_label IN VARCHAR2,
            x_new_session_label OUT VARCHAR2) RETURN NUMBER ;

END;
/

GRANT EXECUTE ON "DVSYS"."DBMS_MACSEC_ROLES" TO PUBLIC;
GRANT EXECUTE ON "DVSYS"."DBMS_MACOLS_SESSION" TO PUBLIC;
CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."CHECK_FULL_DVAUTH" RETURN BINARY_INTEGER
IS
BEGIN
  RETURN dvsys.dbms_macutl.check_full_dvauth;
END;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."CHECK_TAB_DVAUTH"
                             (schema_name IN VARCHAR2,
                              table_name  IN VARCHAR2) RETURN BINARY_INTEGER
IS
BEGIN
  RETURN dvsys.dbms_macutl.check_tab_dvauth(schema_name, table_name);
END;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."CHECK_TS_DVAUTH"
                             (ts_name IN VARCHAR2) RETURN BINARY_INTEGER
IS
BEGIN
  RETURN dvsys.dbms_macutl.check_ts_dvauth(ts_name);
END;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."DVLANG" (lid IN NUMBER, langtab_no IN NUMBER)
RETURN VARCHAR2
AS
  l_lcnt NUMBER default 0;
  l_lang VARCHAR2(3);
  l_tab  VARCHAR2(30);
  l_stmt VARCHAR2(256);
  l_cursor    int;
  l_status    int;
BEGIN
  l_lang := LOWER(SYS_CONTEXT('USERENV','LANG'));
  l_tab :=
    CASE langtab_no
      WHEN 1 THEN 'CODE_T$'
      WHEN 2 THEN 'FACTOR_T$'
      WHEN 3 THEN 'FACTOR_TYPE_T$'
      WHEN 4 THEN 'RULE_T$'
      WHEN 5 THEN 'RULE_SET_T$'
      WHEN 6 THEN 'REALM_T$'
    END;

  l_stmt := 'SELECT COUNT(*) FROM ' || l_tab || ' WHERE id# = :id AND language = :lang';
  l_cursor := sys.dbms_sql.open_cursor;
  sys.dbms_sql.parse( l_cursor, l_stmt, dbms_sql.native );
  sys.dbms_sql.bind_variable( l_cursor, ':id', lid );
  sys.dbms_sql.bind_variable( l_cursor, ':lang', l_lang );
  sys.dbms_sql.define_column( l_cursor, 1, l_lcnt );
  l_status := sys.dbms_sql.execute( l_cursor );
  if ( sys.dbms_sql.fetch_rows(l_cursor) > 0 )
    then
        sys.dbms_sql.column_value( l_cursor, 1, l_lcnt );
  end if;
  sys.dbms_sql.close_cursor(l_cursor);

  if (l_lcnt = 0) then
    return 'us';
  else
    return l_lang;
  end if;
END;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."DV_DATABASE_NAME" return VARCHAR2 as
begin
  -- Fix for Bug 6068504
  return SYS_CONTEXT('DV_EVENT_SESSION_STATE', 'DATABASE_NAME');
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."DV_DICT_OBJ_NAME" return VARCHAR2 as
begin
  -- Fix for Bug 6068504
  return SYS_CONTEXT('DV_EVENT_SESSION_STATE', 'DICT_OBJ_NAME');
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."DV_DICT_OBJ_OWNER" return VARCHAR2 as
begin
  -- Fix for Bug 6068504
  return SYS_CONTEXT('DV_EVENT_SESSION_STATE', 'DICT_OBJ_OWNER');
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."DV_DICT_OBJ_TYPE" return VARCHAR2 as
begin
  -- Fix for Bug 6068504
  return SYS_CONTEXT('DV_EVENT_SESSION_STATE', 'DICT_OBJ_TYPE');
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."DV_INSTANCE_NUM" return NUMBER as
begin
  -- Fix for Bug 6068504
  return SYS_CONTEXT('DV_EVENT_SESSION_STATE', 'INSTANCE_NUM');
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."DV_JOB_INVOKER" return VARCHAR2 as
begin
  return SYS_CONTEXT('DV_EVENT_SESSION_STATE', 'JOB_INVOKER');
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."DV_JOB_OWNER" return VARCHAR2 as
begin
  return SYS_CONTEXT('DV_EVENT_SESSION_STATE', 'JOB_OWNER');
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."DV_LOGIN_USER" return VARCHAR2 as
begin
   -- Fix for Bug 6068504
   return SYS_CONTEXT('DV_EVENT_SESSION_STATE', 'LOGIN_USER');
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."DV_SQL_TEXT" return VARCHAR2 as
begin
  -- Fix for Bug 6068504
  return SYS_CONTEXT('DV_EVENT_SESSION_STATE', 'SQL_TEXT');
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."DV_SYSEVENT" return VARCHAR2 as
begin
  -- Fix for Bug 6068504
  return SYS_CONTEXT('DV_EVENT_SESSION_STATE', 'SYSEVENT');
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."GET_FACTOR"
                            (p_factor IN VARCHAR2) RETURN VARCHAR2
IS
BEGIN
  RETURN dvsys.dbms_macsec.get_factor(p_factor => p_factor);
END;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."GET_FACTOR_LABEL"
                            (p_factor IN VARCHAR2, p_policy_name IN VARCHAR2) RETURN VARCHAR2
IS
BEGIN
  RETURN dvsys.dbms_macsec.get_factor_label(p_factor => p_factor, p_policy_name => p_policy_name);
END;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."GET_TRUST_LEVEL" (p_factor IN VARCHAR2) RETURN NUMBER
IS
BEGIN
  RETURN dvsys.dbms_macsec.get_trust_level(p_factor => p_factor);
END;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."GET_TRUST_LEVEL_FOR_IDENTITY" (p_factor IN VARCHAR2,
                           p_identity IN VARCHAR2) RETURN NUMBER
IS
BEGIN
  RETURN dvsys.dbms_macsec.get_trust_level(p_factor => p_factor, p_identity => p_identity);
END;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."IS_SECURE_APPLICATION_ROLE" (p_role VARCHAR2)
RETURN BOOLEAN IS
BEGIN
  RETURN dvsys.dbms_macsec.is_secure_application_role(p_role => p_role);
END;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."PREDICATE_TRUE" (p_owner IN VARCHAR2,
  p_object_name IN VARCHAR2)
RETURN VARCHAR2 IS
BEGIN
    return '0=0';
END;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "DVSYS"."ROLE_IS_ENABLED" (p_role IN VARCHAR2) RETURN BOOLEAN
IS
BEGIN
  RETURN dvsys.dbms_macsec.role_is_enabled(p_role => p_role);
END;
/

GRANT EXECUTE ON "DVSYS"."GET_FACTOR" TO PUBLIC;
GRANT EXECUTE ON "DVSYS"."PREDICATE_TRUE" TO PUBLIC;
GRANT EXECUTE ON "DVSYS"."IS_SECURE_APPLICATION_ROLE" TO PUBLIC;
GRANT EXECUTE ON "DVSYS"."ROLE_IS_ENABLED" TO PUBLIC;
GRANT EXECUTE ON "DVSYS"."GET_TRUST_LEVEL_FOR_IDENTITY" TO PUBLIC;
GRANT EXECUTE ON "DVSYS"."GET_TRUST_LEVEL" TO PUBLIC;
GRANT EXECUTE ON "DVSYS"."GET_FACTOR_LABEL" TO PUBLIC;
CREATE OR REPLACE NONEDITIONABLE PROCEDURE "DVSYS"."CONFIGURE_DV" wrapped
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
1e67 9e6
Xe8Xik6zKBtxSpZBVVaH+4OCccAwg9eTuseDYI65A6qVG4ZKDoSIuAbo4gcH6aOl30UvO6KK
NIqFyrBZfFPK2jLGJLwX6sQ9AhPH1ShaikNuu2hy0e+xs/TumDYup20TMcb4XIWwKLILijTE
9NkQ/bo2qCeMf5+BmYpBoEppVcYEC0z+2DhF6TE3+X2oBXjXGxW8vzWyGvjiDH7Q+F9TZ/Bl
ofEv3HkZxt+lLuODvD1Jub5u361wBl3xZdB5ddQFsJDD7M63FfY0/CFcq9pv7QVgKaKTRr9i
04pTubQdezZz/TLIQlF3o/Rw1bBA4Nb1o//ZZMzJTA4B8yj9tGpuTDEj5TJQ+GOAcf0T+q62
BYQsKL0lt/s+29mutSLYrCliEnFZ2Hye6DWONFm/ULxtVdXSM2rOBP1vB5oZYC90BXeYBpJE
s5oiH4RLdenQkg/uXevuLwQIwA3H2X+FgmlLfCUBoFTZ3jBXOZxfkMRG0HF7SHRMfhJGXe4C
27gzAz7EBo6oTlaW/hqxkNywPlEMbT5msgAAlfjuJms3HlQIVBVsM24iiAnaqHV6faYqtJS2
JwhnmbIuRhstxqMMbe1Z9lEc/N/3vzWKVvvIDFH4HBZQwuM1fzShz/F4kbcWdWIVXJZ1cg1O
w2ph+zT/bUce+ttthWPcYBwyCei7NyTApgLZGFRn4TP/d2MAeXdnnZ9y3DVYBkKb6Gyqn+4I
Bd7+19WO2ai3JUJgqB/ZkXDvWYj6SVyPpdGH0yqLOdEUfEvySYf/46H1KClKIBLwD+ymcscY
9mOQ1MYLL54UlGWstxTHG5Sfc1hWUbgyxOw7hKLoAxFhceRuFlx14mfNRASelFYBX69heYwg
f0g4aQ0xpyVSBkVKBTBz/NgCoMUdO1j01elyRFyV4Bwzz2+ZXNwRCeJ1Qnojbmnzddlt+5/B
L3cg3NpV0xWsbNDgqwJG6xHl4Ile4FIrcFYrNZfxZZ+mhQPryxa/kkvkdGvdux+veXUplGhW
a1FgFFCOd8/Q7KmYOwsFLSZKLpI3jgigd1E85pM3xR8+paKh84Lj3mTXTSplvQdw7uBFa+13
QUGO8q6ufPH3xcaap+dogIhVK+kfFq6yKvlvumt3o3e0a2lWAYqoATnB5WkULqcWnxZeKRsW
yy1p+/YMAQ8L788O8KX+wsx8WKLELP4NCcnlQIMXNUzxaA6fV9HFrgG2iFP8izc8enyDRf2M
O4nv8nWCCtnFB3nvgD1pAE1gGzQuG8NVYkYjp8MBE8PNaX33Tp7DffCG7vIclqdJjchxbF6t
3y4xA4IRXdDTJNbyAnNhBC4Uwx3Ydc2CkQcBkrmT/v5vxRq8i98s2OxeOA3Mo9jymKEZ19OG
rNutLzShixBj0Rq3yUwsXD2sgw8nYCz2jyIQUdqpK93cTLBIk1Esfg+oKCNgQDL3VMI2acTp
v/R9MdunJJD53wb6l6DXGQ16zZlEARFBawcNM0ziE8ihxGJhS2J7Ejl5N+4TBTLgyL8iCAsV
m3nVnviplb0YFYP84BY5z6ZE0G3cY9CIMcZBDRP8zj0SLugEy4CIJ7vewdeYn4M0yR68M5ot
MgOWd37YTm381EZ6sTXE6IJd4gvTjWIhCJN+ajQBsQV9uGVozqNGj+7x83hNuRBi8V98b0lt
lu94DlD4hYqChZAFynCAWu2h4XcQnDWQMvqmWZWb78+n7rKFRXdAH5PfBs8cx91oyu9a7Ns8
PjgnchTQix1SpQLWe9B45vocOhC3/Ox9nnc6oFGEi6fIhkQI4h+hgmkAuCimDRmUF3eOmClX
jGKAJ82GxVSiFuRJbmiAqKPRaZcv6Qw2EDhrx44pxvsA2WHMu2Fsbm+rcBHAmT2EuFxKA2Nq
kBhTOQnAVQ4ElmoUlJARfp3vNMB0ckXZjLJfQwA5wyBXfazea/X2wpTiHHD/T+n7u641yXSl
f3yf7Dhr4CXuLzlB0JkTrHBxEMejFqhA/CbNd7HSN9lKMP18zua7Jr/zmUB23i1MuJRbVCTi
BeseBSoP17ESCPQ+kc/FSJwZlncZ8mvko8Upj/HZUM6Xr8aLQkOs1brvuYCfaAtDGAzsuXlB
CQp77uAc6C8QABHvDU5VRzw4iZrszQbqrkytlz/9JqCyshE6cVwqsFkJBsLjDQdUNiQfKjwV
CFTvAFwAlgF3IVTxcYpJZiUemHxXbZScirfkBgQuhuuKC0x3jToyfK3LSGZXv9zq2ZgEq7mE
k1oyHXPs6e2WL6UMUi4rOKaUXapGHns0k+LmHEf7Gb/GlMcCNJQCxGXOrPgpVgZ83Zy/7sUv
vw4eQcHmgp1B3VogEL+CEwejI3nSAMpiqE/Rwe5FSZnO0GotnknQt0IwALrSIdeIdCHNgOC+
TGCoT5Yk/2/k0VRkJJbqXjfhDvum6xf1WT8U3YGaTgO2vEA/eSptHJ1rW2MtiVVRx8aRBzZ0
xfP+gEAvJrgBlvl/DCA6Q/BNqxP8Kgk6qg1de0xpgCRzW4HkrIU=
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "DVSYS"."EVALUATE_RULE_SET" (
                        p_rule_set      IN  VARCHAR2,
                        x_result        OUT INTEGER,
                        x_rule          OUT VARCHAR2,
                        x_rule_error    OUT INTEGER,
                        x_handler_error OUT INTEGER,
                        x_error_code    OUT NUMBER,
                        x_error_text    OUT VARCHAR2)
  IS
    x_result_bool        BOOLEAN;
    x_rule_error_bool    BOOLEAN;
    x_handler_error_bool BOOLEAN;
  BEGIN
    -- buffer overflow checks
    IF (LENGTH(p_rule_set) > 90) THEN
        DBMS_MACUTL.RAISE_ERROR(47951,'p_rule_set');
    END IF;

    DVSYS.DBMS_MACSEC_RULES.EVALUATE(
             p_rule_set,
             NULL,
             x_result_bool,
             x_rule,
             x_rule_error_bool,
             x_handler_error_bool,
             x_error_code,
             x_error_text);

    IF (x_result_bool) THEN
      x_result := 1;
    ELSE
      x_result := 0;
    END IF;

    IF (x_rule_error_bool) THEN
      x_rule_error := 1;
    ELSE
      x_rule_error := 0;
    END IF;

    IF (x_handler_error_bool) THEN
      x_handler_error := 1;
    ELSE
      x_handler_error := 0;
    END IF;
  END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "DVSYS"."MACOLS_INIT_SESSION"
IS
BEGIN
  dvsys.dbms_macols.init_session;
EXCEPTION
  -- Try to suppress stack trace
  WHEN OTHERS THEN
    --RAISE;
    NULL;
END;
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "DVSYS"."SET_FACTOR" (p_factor IN VARCHAR2,
                                       p_value  IN VARCHAR2)
IS
BEGIN
  dvsys.dbms_macsec.set_factor(p_factor => p_factor,
                         p_value  => p_value);
END;
/

GRANT EXECUTE ON "DVSYS"."SET_FACTOR" TO PUBLIC;

ALTER FUNCTION "DVSYS"."DVLANG"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:51:57'
/


ALTER FUNCTION "DVSYS"."DV_SYSEVENT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:51:58'
/


ALTER FUNCTION "DVSYS"."DV_LOGIN_USER"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:51:58'
/


ALTER FUNCTION "DVSYS"."DV_INSTANCE_NUM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:51:58'
/


ALTER FUNCTION "DVSYS"."DV_DATABASE_NAME"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:51:58'
/


ALTER FUNCTION "DVSYS"."DV_DICT_OBJ_TYPE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:51:58'
/


ALTER FUNCTION "DVSYS"."DV_DICT_OBJ_OWNER"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:51:58'
/


ALTER FUNCTION "DVSYS"."DV_DICT_OBJ_NAME"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:51:58'
/


ALTER FUNCTION "DVSYS"."DV_SQL_TEXT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:51:58'
/


ALTER FUNCTION "DVSYS"."DV_JOB_INVOKER"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:51:59'
/


ALTER FUNCTION "DVSYS"."DV_JOB_OWNER"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:51:59'
/


ALTER FUNCTION "DVSYS"."CHECK_FULL_DVAUTH"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:52:00'
/


ALTER FUNCTION "DVSYS"."CHECK_TS_DVAUTH"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:52:00'
/


ALTER FUNCTION "DVSYS"."CHECK_TAB_DVAUTH"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:52:00'
/


ALTER FUNCTION "DVSYS"."GET_FACTOR"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:52:04'
/


ALTER FUNCTION "DVSYS"."GET_FACTOR_LABEL"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:52:00'
/


ALTER FUNCTION "DVSYS"."GET_TRUST_LEVEL"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:52:04'
/


ALTER FUNCTION "DVSYS"."GET_TRUST_LEVEL_FOR_IDENTITY"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:52:04'
/


ALTER FUNCTION "DVSYS"."ROLE_IS_ENABLED"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:52:04'
/


ALTER FUNCTION "DVSYS"."IS_SECURE_APPLICATION_ROLE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:52:00'
/


ALTER FUNCTION "DVSYS"."PREDICATE_TRUE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:52:04'
/


ALTER PROCEDURE "DVSYS"."EVALUATE_RULE_SET"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:52:05'
/


ALTER PROCEDURE "DVSYS"."MACOLS_INIT_SESSION"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:52:05'
/


ALTER PROCEDURE "DVSYS"."SET_FACTOR"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:52:04'
/


ALTER PROCEDURE "DVSYS"."CONFIGURE_DV"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:51:59'
/

CREATE UNIQUE INDEX "DVSYS"."MAC_POLICY$_PK1" ON "DVSYS"."MAC_POLICY$" ("ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."MAC_POLICY$_UK1" ON "DVSYS"."MAC_POLICY$" ("POLICY_ID#")
  ;

CREATE INDEX "DVSYS"."MAC_POLICY$_FK_IDX" ON "DVSYS"."MAC_POLICY$" ("ALGORITHM_CODE_ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."CODE$_PK1" ON "DVSYS"."CODE$" ("ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."CODE$_UK1" ON "DVSYS"."CODE$" ("CODE_GROUP", "CODE")
  ;

CREATE UNIQUE INDEX "DVSYS"."CODE_T$_UK1" ON "DVSYS"."CODE_T$" ("ID#", "LANGUAGE")
  ;

CREATE UNIQUE INDEX "DVSYS"."MAC_POLICY_FACTOR$_UK1" ON "DVSYS"."MAC_POLICY_FACTOR$" ("FACTOR_ID#", "MAC_POLICY_ID#")
  ;

CREATE INDEX "DVSYS"."MAC_POLICY_FACTOR$_FK_IDX" ON "DVSYS"."MAC_POLICY_FACTOR$" ("FACTOR_ID#")
  ;

CREATE INDEX "DVSYS"."MAC_POLICY_FACTOR$_FK1_IDX" ON "DVSYS"."MAC_POLICY_FACTOR$" ("MAC_POLICY_ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."MAC_POLICY_FACTOR$_PK1" ON "DVSYS"."MAC_POLICY_FACTOR$" ("ID#")
  ;

CREATE INDEX "DVSYS"."FACTOR$_FK_IDX" ON "DVSYS"."FACTOR$" ("FACTOR_TYPE_ID#")
  ;

CREATE INDEX "DVSYS"."FACTOR$_FK1_IDX" ON "DVSYS"."FACTOR$" ("ASSIGN_RULE_SET_ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."FACTOR$_PK1" ON "DVSYS"."FACTOR$" ("ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."FACTOR$_UK1" ON "DVSYS"."FACTOR$" ("NAME")
  ;

CREATE UNIQUE INDEX "DVSYS"."FACTOR_T$_UK1" ON "DVSYS"."FACTOR_T$" ("ID#", "LANGUAGE")
  ;

CREATE UNIQUE INDEX "DVSYS"."FACTOR_TYPE$_PK1" ON "DVSYS"."FACTOR_TYPE$" ("ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."FACTOR_TYPE_T$_UK2" ON "DVSYS"."FACTOR_TYPE_T$" ("NAME", "LANGUAGE")
  ;

CREATE UNIQUE INDEX "DVSYS"."FACTOR_TYPE_T$_UK1" ON "DVSYS"."FACTOR_TYPE_T$" ("ID#", "LANGUAGE")
  ;

CREATE UNIQUE INDEX "DVSYS"."COMMAND_RULE$_PK1" ON "DVSYS"."COMMAND_RULE$" ("ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."COMMAND_RULE$_UK1" ON "DVSYS"."COMMAND_RULE$" ("CODE_ID#", "OBJECT_OWNER_UID#", "OBJECT_NAME")
  ;

CREATE INDEX "DVSYS"."COMMAND_RULE$_FK_IDX" ON "DVSYS"."COMMAND_RULE$" ("RULE_SET_ID#")
  ;

CREATE INDEX "DVSYS"."COMMAND_RULE$_FK1_IDX" ON "DVSYS"."COMMAND_RULE$" ("CODE_ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."FACTOR_LINK$_PK1" ON "DVSYS"."FACTOR_LINK$" ("ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."FACTOR_LINK$_UK1" ON "DVSYS"."FACTOR_LINK$" ("PARENT_FACTOR_ID#", "CHILD_FACTOR_ID#")
  ;

CREATE INDEX "DVSYS"."FACTOR_LINK$_FK_IDX" ON "DVSYS"."FACTOR_LINK$" ("PARENT_FACTOR_ID#")
  ;

CREATE INDEX "DVSYS"."FACTOR_LINK$_FK1_IDX" ON "DVSYS"."FACTOR_LINK$" ("CHILD_FACTOR_ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."ROLE$_PK1" ON "DVSYS"."ROLE$" ("ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."ROLE$_UK1" ON "DVSYS"."ROLE$" ("ROLE")
  ;

CREATE INDEX "DVSYS"."ROLE$_FK_IDX" ON "DVSYS"."ROLE$" ("RULE_SET_ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."IDENTITY$_PK1" ON "DVSYS"."IDENTITY$" ("ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."IDENTITY$_UK1" ON "DVSYS"."IDENTITY$" ("FACTOR_ID#", "VALUE")
  ;

CREATE INDEX "DVSYS"."IDENTITY$_FK_IDX" ON "DVSYS"."IDENTITY$" ("FACTOR_ID#")
  ;

CREATE INDEX "DVSYS"."IDENTITY_MAP$_FK_IDX" ON "DVSYS"."IDENTITY_MAP$" ("IDENTITY_ID#")
  ;

CREATE INDEX "DVSYS"."IDENTITY_MAP$_FK1_IDX" ON "DVSYS"."IDENTITY_MAP$" ("FACTOR_LINK_ID#")
  ;

CREATE INDEX "DVSYS"."IDENTITY_MAP$_FK2_IDX" ON "DVSYS"."IDENTITY_MAP$" ("OPERATION_CODE_ID#")
  ;

CREATE INDEX "DVSYS"."IDENTITY_MAP$_UK_IDX" ON "DVSYS"."IDENTITY_MAP$" ("IDENTITY_ID#", "FACTOR_LINK_ID#", "OPERATION_CODE_ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."IDENTITY_MAP$_PK1" ON "DVSYS"."IDENTITY_MAP$" ("ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."RULE$_PK1" ON "DVSYS"."RULE$" ("ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."RULE_T$_UK2" ON "DVSYS"."RULE_T$" ("NAME", "LANGUAGE")
  ;

CREATE UNIQUE INDEX "DVSYS"."RULE_T$_UK1" ON "DVSYS"."RULE_T$" ("ID#", "LANGUAGE")
  ;

CREATE UNIQUE INDEX "DVSYS"."IDENTITY_LABEL$_PK1" ON "DVSYS"."POLICY_LABEL$" ("ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."POLICY_LABEL$_UK1" ON "DVSYS"."POLICY_LABEL$" ("IDENTITY_ID#", "POLICY_ID#")
  ;

CREATE INDEX "DVSYS"."IDENTITY_LABEL$_FK_IDX" ON "DVSYS"."POLICY_LABEL$" ("IDENTITY_ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."RULE_SET_RULE$_PK1" ON "DVSYS"."RULE_SET_RULE$" ("ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."RULE_SET_RULE$_UK1" ON "DVSYS"."RULE_SET_RULE$" ("RULE_SET_ID#", "RULE_ID#")
  ;

CREATE INDEX "DVSYS"."RULE_SET_RULE$_FK_IDX" ON "DVSYS"."RULE_SET_RULE$" ("RULE_SET_ID#")
  ;

CREATE INDEX "DVSYS"."RULE_SET_RULE$_FK1_IDX" ON "DVSYS"."RULE_SET_RULE$" ("RULE_ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."RULE_SET$_PK1" ON "DVSYS"."RULE_SET$" ("ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."RULE_SET_T$_UK1" ON "DVSYS"."RULE_SET_T$" ("ID#", "LANGUAGE")
  ;

CREATE UNIQUE INDEX "DVSYS"."RULE_SET_T$_UK2" ON "DVSYS"."RULE_SET_T$" ("NAME", "LANGUAGE")
  ;

CREATE UNIQUE INDEX "DVSYS"."REALM_OBJECT$_PK1" ON "DVSYS"."REALM_OBJECT$" ("ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."REALM_OBJECT$_UK1" ON "DVSYS"."REALM_OBJECT$" ("REALM_ID#", "OWNER_UID#", "OBJECT_NAME", "OBJECT_TYPE")
  ;

CREATE INDEX "DVSYS"."REALM_OBJECT$_FK_IDX" ON "DVSYS"."REALM_OBJECT$" ("REALM_ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."REALM_AUTH$_PK1" ON "DVSYS"."REALM_AUTH$" ("ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."REALM_AUTH$_UK1" ON "DVSYS"."REALM_AUTH$" ("REALM_ID#", "GRANTEE_UID#", "AUTH_OPTIONS")
  ;

CREATE INDEX "DVSYS"."REALM_AUTH$_FK_IDX" ON "DVSYS"."REALM_AUTH$" ("REALM_ID#")
  ;

CREATE INDEX "DVSYS"."REALM_AUTH$_FK1_IDX" ON "DVSYS"."REALM_AUTH$" ("AUTH_RULE_SET_ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."REALM$_PK1" ON "DVSYS"."REALM$" ("ID#")
  ;

CREATE UNIQUE INDEX "DVSYS"."REALM_T$_UK1" ON "DVSYS"."REALM_T$" ("ID#", "LANGUAGE")
  ;

CREATE UNIQUE INDEX "DVSYS"."REALM_T$_UK2" ON "DVSYS"."REALM_T$" ("NAME", "LANGUAGE")
  ;

CREATE UNIQUE INDEX "DVSYS"."AUDIT_TRAIL$_PK1" ON "DVSYS"."AUDIT_TRAIL$" ("ID#")
  ;

ALTER TABLE "DVSYS"."CONFIG$" ADD UNIQUE ("STATUS")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."ENFORCE$" ADD UNIQUE ("STATUS")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."MAC_POLICY$" ADD CONSTRAINT "MAC_POLICY$_UK1" UNIQUE ("POLICY_ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."MAC_POLICY$" ADD CONSTRAINT "MAC_POLICY$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."CODE$" ADD CONSTRAINT "CODE$_UK1" UNIQUE ("CODE_GROUP", "CODE")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."CODE$" ADD CONSTRAINT "CODE$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."CODE_T$" ADD CONSTRAINT "CODE_T$_UK1" UNIQUE ("ID#", "LANGUAGE")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."MAC_POLICY_FACTOR$" ADD CONSTRAINT "MAC_POLICY_FACTOR$_UK1" UNIQUE ("FACTOR_ID#", "MAC_POLICY_ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."MAC_POLICY_FACTOR$" ADD CONSTRAINT "MAC_POLICY_FACTOR$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."FACTOR$" ADD CONSTRAINT "FACTOR$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."FACTOR$" ADD CONSTRAINT "FACTOR$_UK1" UNIQUE ("NAME")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."FACTOR_T$" ADD CONSTRAINT "FACTOR_T$_UK1" UNIQUE ("ID#", "LANGUAGE")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."FACTOR_TYPE$" ADD CONSTRAINT "FACTOR_TYPE$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."FACTOR_TYPE_T$" ADD CONSTRAINT "FACTOR_TYPE_T$_UK1" UNIQUE ("ID#", "LANGUAGE")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."FACTOR_TYPE_T$" ADD CONSTRAINT "FACTOR_TYPE_T$_UK2" UNIQUE ("NAME", "LANGUAGE")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."COMMAND_RULE$" ADD CONSTRAINT "COMMAND_RULE$_UK1" UNIQUE ("CODE_ID#", "OBJECT_OWNER_UID#", "OBJECT_NAME")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."COMMAND_RULE$" ADD CONSTRAINT "COMMAND_RULE$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."FACTOR_LINK$" ADD CONSTRAINT "FACTOR_LINK$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."FACTOR_LINK$" ADD CONSTRAINT "FACTOR_LINK$_UK1" UNIQUE ("PARENT_FACTOR_ID#", "CHILD_FACTOR_ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."ROLE$" ADD CONSTRAINT "ROLE$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."ROLE$" ADD CONSTRAINT "ROLE$_UK1" UNIQUE ("ROLE")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."IDENTITY$" ADD CONSTRAINT "IDENTITY$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."IDENTITY$" ADD CONSTRAINT "IDENTITY$_UK1" UNIQUE ("FACTOR_ID#", "VALUE")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."IDENTITY_MAP$" ADD CONSTRAINT "IDENTITY_MAP$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."RULE$" ADD CONSTRAINT "RULE$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."RULE_T$" ADD CONSTRAINT "RULE_T$_UK1" UNIQUE ("ID#", "LANGUAGE")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."RULE_T$" ADD CONSTRAINT "RULE_T$_UK2" UNIQUE ("NAME", "LANGUAGE")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."POLICY_LABEL$" ADD CONSTRAINT "IDENTITY_LABEL$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."POLICY_LABEL$" ADD CONSTRAINT "POLICY_LABEL$_UK1" UNIQUE ("IDENTITY_ID#", "POLICY_ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."RULE_SET_RULE$" ADD CONSTRAINT "RULE_SET_RULE$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."RULE_SET_RULE$" ADD CONSTRAINT "RULE_SET_RULE$_UK1" UNIQUE ("RULE_SET_ID#", "RULE_ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."RULE_SET$" ADD CONSTRAINT "RULE_SET$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."RULE_SET_T$" ADD CONSTRAINT "RULE_SET_T$_UK1" UNIQUE ("ID#", "LANGUAGE")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."RULE_SET_T$" ADD CONSTRAINT "RULE_SET_T$_UK2" UNIQUE ("NAME", "LANGUAGE")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."REALM_OBJECT$" ADD CONSTRAINT "REALM_OBJECT$_UK1" UNIQUE ("REALM_ID#", "OWNER_UID#", "OBJECT_NAME", "OBJECT_TYPE")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."REALM_OBJECT$" ADD CONSTRAINT "REALM_OBJECT$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."REALM_AUTH$" ADD CONSTRAINT "REALM_AUTH$_UK1" UNIQUE ("REALM_ID#", "GRANTEE_UID#", "AUTH_OPTIONS")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."REALM_AUTH$" ADD CONSTRAINT "REALM_AUTH$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."REALM$" ADD CONSTRAINT "REALM$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."REALM_T$" ADD CONSTRAINT "REALM_T$_UK1" UNIQUE ("ID#", "LANGUAGE")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."REALM_T$" ADD CONSTRAINT "REALM_T$_UK2" UNIQUE ("NAME", "LANGUAGE")
  USING INDEX  ENABLE;

ALTER TABLE "DVSYS"."AUDIT_TRAIL$" ADD CONSTRAINT "AUDIT_TRAIL$_PK1" PRIMARY KEY ("ID#")
  USING INDEX  ENABLE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$ENFORCEMENT_AUDIT" ("ID#",
"OS_USERNAME",
"USERNAME",
"USERHOST",
"TERMINAL",
"TIMESTAMP",
"OWNER",
"OBJ_NAME",
"ACTION",
"ACTION_NAME",
"ACTION_OBJECT_ID",
"ACTION_OBJECT_NAME",
"ACTION_COMMAND",
"AUDIT_OPTION",
"RULE_SET_ID",
"RULE_SET_NAME",
"RULE_ID",
"RULE_NAME",
"FACTOR_CONTEXT",
"COMMENT_TEXT",
"SESSIONID",
"ENTRYID",
"STATEMENTID",
"RETURNCODE",
"EXTENDED_TIMESTAMP",
"PROXY_SESSIONID",
"GLOBAL_UID",
"INSTANCE_NUMBER",
"OS_PROCESS",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
     ID#
   , OS_USERNAME
   , USERNAME
   , USERHOST
   , TERMINAL
   , TIMESTAMP
   , OWNER
   , OBJ_NAME
   , ACTION
   , ACTION_NAME
   , ACTION_OBJECT_ID
   , ACTION_OBJECT_NAME
   , ACTION_COMMAND
   , AUDIT_OPTION
   , RULE_SET_ID
   , RULE_SET_NAME
   , RULE_ID
   , RULE_NAME
   , FACTOR_CONTEXT
   , COMMENT_TEXT
   , SESSIONID
   , ENTRYID
   , STATEMENTID
   , RETURNCODE
   , EXTENDED_TIMESTAMP
   , PROXY_SESSIONID
   , GLOBAL_UID
   , INSTANCE_NUMBER
   , OS_PROCESS
   , CREATED_BY
   , CREATE_DATE
   , UPDATED_BY
   , UPDATE_DATE
FROM DVSYS.AUDIT_TRAIL$ where ACTION < 20000;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$CONFIGURATION_AUDIT" ("ID#",
"OS_USERNAME",
"USERNAME",
"USERHOST",
"TERMINAL",
"TIMESTAMP",
"OWNER",
"OBJ_NAME",
"ACTION",
"ACTION_NAME",
"ACTION_OBJECT_ID",
"ACTION_OBJECT_NAME",
"ACTION_COMMAND",
"AUDIT_OPTION",
"RULE_SET_ID",
"RULE_SET_NAME",
"RULE_ID",
"RULE_NAME",
"FACTOR_CONTEXT",
"COMMENT_TEXT",
"SESSIONID",
"ENTRYID",
"STATEMENTID",
"RETURNCODE",
"EXTENDED_TIMESTAMP",
"PROXY_SESSIONID",
"GLOBAL_UID",
"INSTANCE_NUMBER",
"OS_PROCESS",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE",
"GRANTEE",
"ENABLED_STATUS") AS
  SELECT
     ID#
   , OS_USERNAME
   , USERNAME
   , USERHOST
   , TERMINAL
   , TIMESTAMP
   , OWNER
   , OBJ_NAME
   , ACTION
   , ACTION_NAME
   , ACTION_OBJECT_ID
   , ACTION_OBJECT_NAME
   , ACTION_COMMAND
   , AUDIT_OPTION
   , RULE_SET_ID
   , RULE_SET_NAME
   , RULE_ID
   , RULE_NAME
   , FACTOR_CONTEXT
   , COMMENT_TEXT
   , SESSIONID
   , ENTRYID
   , STATEMENTID
   , RETURNCODE
   , EXTENDED_TIMESTAMP
   , PROXY_SESSIONID
   , GLOBAL_UID
   , INSTANCE_NUMBER
   , OS_PROCESS
   , CREATED_BY
   , CREATE_DATE
   , UPDATED_BY
   , UPDATE_DATE
   , GRANTEE
   , ENABLED_STATUS
FROM DVSYS.AUDIT_TRAIL$ where ACTION > 20000;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$CODE" ("ID#",
"CODE_GROUP",
"CODE",
"VALUE",
"LANGUAGE",
"DESCRIPTION",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
      m.ID#
    , m.CODE_GROUP
    , m.CODE
    , d.VALUE
    , d.LANGUAGE
    , d.DESCRIPTION
    , m.VERSION
    , m.CREATED_BY
    , m.CREATE_DATE
    , m.UPDATED_BY
    , m.UPDATE_DATE
FROM dvsys.code$ m, dvsys.code_t$ d
WHERE m.id# = d.id#
      AND d.language = DVSYS.dvlang(d.id#, 1);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$FACTOR_TYPE" ("ID#",
"NAME",
"DESCRIPTION",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
      m.ID#
    , d.NAME
    , d.DESCRIPTION
    , m.VERSION
    , m.CREATED_BY
    , m.CREATE_DATE
    , m.UPDATED_BY
    , m.UPDATE_DATE
FROM dvsys.factor_type$ m, dvsys.factor_type_t$ d
WHERE
    m.id# = d.id#
    AND d.language = DVSYS.dvlang(d.id#, 3);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$RULE_SET" ("ID#",
"NAME",
"DESCRIPTION",
"ENABLED",
"EVAL_OPTIONS",
"EVAL_OPTIONS_MEANING",
"AUDIT_OPTIONS",
"FAIL_OPTIONS",
"FAIL_OPTIONS_MEANING",
"FAIL_MESSAGE",
"FAIL_CODE",
"HANDLER_OPTIONS",
"HANDLER",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE",
"IS_STATIC") AS
  SELECT
      m.id#
    , d.name
    , d.description
    , m.enabled
    , m.eval_options - DECODE(bitand(m.eval_options, 128) , 128, 128, 0)
    , deval.value
    , m.audit_options
    , m.fail_options
    , dfail.value
    , d.fail_message
    , m.fail_code
    , m.handler_options
    , m.handler
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
    , DECODE(bitand(m.eval_options, 128) , 128, 'TRUE', 'FALSE')
FROM dvsys.rule_set$ m
    , dvsys.rule_set_t$ d
    , dvsys.dv$code deval
    , dvsys.dv$code dfail
WHERE
    m.id# = d.id#
    AND d.language = DVSYS.dvlang(d.id#, 5)
    AND deval.code = TO_CHAR(m.eval_options -
                             DECODE(bitand(m.eval_options,128) , 128, 128, 0))
    AND deval.code_group = 'RULESET_EVALUATE'
    AND dfail.code  = TO_CHAR(m.fail_options)
    AND dfail.code_group = 'RULESET_FAIL';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$RULE" ("ID#",
"NAME",
"RULE_EXPR",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
      m.id#
    , d.name
    , m.rule_expr
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
FROM dvsys.rule$ m, dvsys.rule_t$ d
WHERE
    m.id# = d.id#
    AND d.language = DVSYS.dvlang(d.id#, 4);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$RULE_SET_RULE" ("ID#",
"RULE_SET_ID#",
"RULE_SET_NAME",
"RULE_ID#",
"RULE_NAME",
"RULE_EXPR",
"ENABLED",
"RULE_ORDER",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
      m.id#
    , m.rule_set_id#
    , d1.name
    , m.rule_id#
    , d2.name
    , d2.rule_expr
    , m.enabled
    , m.rule_order
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
FROM dvsys.rule_set_rule$ m
     ,dvsys.dv$rule_set d1
     ,dvsys.dv$rule d2
WHERE
    d1.id# = m.rule_set_id#
    and d2.id# = m.rule_id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$COMMAND_RULE" ("ID#",
"CODE_ID#",
"COMMAND",
"RULE_SET_ID#",
"RULE_SET_NAME",
"OBJECT_OWNER",
"OBJECT_NAME",
"ENABLED",
"PRIVILEGE_SCOPE",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
      m.id#
    , m.code_id#
    , d2.code
    , m.rule_set_id#
    , d1.name
    , u.name
    , m.object_name
    , m.enabled
    , m.privilege_scope
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
FROM dvsys.command_rule$ m
    ,dvsys.dv$rule_set d1
    ,dvsys.dv$code d2
    ,sys.user$ u
WHERE
    d1.id# = m.rule_set_id#
    AND d2.id# = m.code_id#
    AND m.object_owner_uid# = u.user#
UNION
SELECT
      m.id#
    , m.code_id#
    , d2.code
    , m.rule_set_id#
    , d1.name
    , '%'
    , m.object_name
    , m.enabled
    , m.privilege_scope
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
FROM dvsys.command_rule$ m
    ,dvsys.dv$rule_set d1
    ,dvsys.dv$code d2
WHERE
    d1.id# = m.rule_set_id#
    AND d2.id# = m.code_id#
    AND m.object_owner_uid# = 2147483636;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$FACTOR" ("ID#",
"NAME",
"DESCRIPTION",
"FACTOR_TYPE_ID#",
"FACTOR_TYPE_NAME",
"ASSIGN_RULE_SET_ID#",
"ASSIGN_RULE_SET_NAME",
"GET_EXPR",
"VALIDATE_EXPR",
"IDENTIFIED_BY",
"IDENTIFIED_BY_MEANING",
"NAMESPACE",
"NAMESPACE_ATTRIBUTE",
"LABELED_BY",
"LABELED_BY_MEANING",
"EVAL_OPTIONS",
"EVAL_OPTIONS_MEANING",
"AUDIT_OPTIONS",
"FAIL_OPTIONS",
"FAIL_OPTIONS_MEANING",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
      m.id#
    , m.name
    , d.description
    , m.factor_type_id#
    , dft.name
    , m.assign_rule_set_id#
    , drs.name
    , m.get_expr
    , m.validate_expr
    , m.identified_by
    , did.value
    , m.namespace
    , m.namespace_attribute
    , m.labeled_by
    , dlabel.value
    , m.eval_options
    , deval.value
    , m.audit_options
    , m.fail_options
    , dfail.value
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
FROM dvsys.factor$ m
    , dvsys.factor_t$ d
    , dvsys.dv$factor_type dft
    , dvsys.dv$rule_set drs
    , dvsys.dv$code did
    , dvsys.dv$code dlabel
    , dvsys.dv$code deval
    , dvsys.dv$code dfail
WHERE
    m.id# = d.id#
    AND d.language = DVSYS.dvlang(d.id#, 2)
    AND dft.id# = m.factor_type_id#
    AND did.code    = TO_CHAR(m.identified_by)  and did.code_group = 'FACTOR_IDENTIFY'
    AND dlabel.code = TO_CHAR(m.labeled_by)  and dlabel.code_group = 'FACTOR_LABEL'
    AND deval.code  = TO_CHAR(m.eval_options) and deval.code_group = 'FACTOR_EVALUATE'
    AND dfail.code  = TO_CHAR(m.fail_options) and dfail.code_group = 'FACTOR_FAIL'
    AND drs.id#  (+)= m.assign_rule_set_id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$FACTOR_LINK" ("ID#",
"PARENT_FACTOR_ID#",
"PARENT_FACTOR_NAME",
"CHILD_FACTOR_ID#",
"CHILD_FACTOR_NAME",
"LABEL_IND",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
      m.id#
    , m.parent_factor_id#
    , d1.name
    , m.child_factor_id#
    , d2.name
    , m.label_ind
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
FROM dvsys.factor_link$ m
    , dvsys.dv$factor d1
    , dvsys.dv$factor d2
WHERE
     d1.id# = m.parent_factor_id#
    AND d2.id# = m.child_factor_id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$IDENTITY" ("ID#",
"FACTOR_ID#",
"FACTOR_NAME",
"VALUE",
"TRUST_LEVEL",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
      m.id#
    , m.factor_id#
    , d1.name
    , m.value
    , m.trust_level
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
FROM dvsys.identity$ m,
   dvsys.dv$factor d1
WHERE
    d1.id# = m.factor_id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$IDENTITY_MAP" ("ID#",
"IDENTITY_ID#",
"IDENTITY_VALUE",
"FACTOR_ID#",
"FACTOR_NAME",
"FACTOR_LINK_ID#",
"OPERATION_CODE_ID#",
"OPERATION_CODE",
"OPERATION_VALUE",
"OPERAND1",
"OPERAND2",
"PARENT_FACTOR_NAME",
"CHILD_FACTOR_NAME",
"LABEL_IND",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
      m.id#
    , m.identity_id#
    , d1.value
    , d6.id#
    , d6.name
    , m.factor_link_id#
    , m.operation_code_id#
    , d2.code
    , d2.value
    , m.operand1
    , m.operand2
    , d4.name
    , d5.name
    , d3.label_ind
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
FROM dvsys.identity_map$ m
    , dvsys.identity$ d1
    , dvsys.dv$code d2
    , dvsys.factor_link$ d3
    , dvsys.dv$factor d4
    , dvsys.dv$factor d5
    , dvsys.dv$factor d6
WHERE
    d1.id# = m.identity_id#
    AND d2.id# = m.operation_code_id#
    AND d3.id# (+)= m.factor_link_id#
    AND d4.id# (+)= d3.parent_factor_id#
    AND d5.id# (+)= d3.child_factor_id#
    AND d6.id# = d1.factor_id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$MAC_POLICY" ("ID#",
"POLICY_ID#",
"POLICY_NAME",
"ALGORITHM_CODE_ID#",
"ALGORITHM_CODE",
"ALGORITHM_MEANING",
"ERROR_LABEL",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
      m.id#
    , m.policy_id#
    , d1.pol_name
    , m.algorithm_code_id#
    , d2.code
    , d2.value
    , m.error_label
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
FROM dvsys.mac_policy$ m
    , lbacsys.ols$pol d1
    , dvsys.dv$code d2
WHERE
        d1.pol# = m.policy_id#
    AND d2.id# = m.algorithm_code_id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$MAC_POLICY_FACTOR" ("ID#",
"FACTOR_ID#",
"FACTOR_NAME",
"MAC_POLICY_ID#",
"POLICY_ID#",
"MAC_POLICY_NAME",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
      m.id#
    , m.factor_id#
    , d1.name
    , d3.id#
    , d3.policy_id#
    , d2.pol_name
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
FROM dvsys.mac_policy_factor$ m
    , dvsys.dv$factor d1
    , lbacsys.ols$pol d2
    , dvsys.mac_policy$ d3
WHERE
    d1.id# = m.factor_id#
    AND d3.id# = m.mac_policy_id#
    AND d2.pol# = policy_id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$OLS_POLICY" ("POLICY_ID",
"POLICY_NAME") AS
  SELECT
     d1.pol#
    , d1.pol_name
FROM
    lbacsys.ols$pol d1;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$OLS_POLICY_LABEL" ("POLICY_ID",
"POLICY_NAME",
"LABEL_ID",
"LABEL") AS
  SELECT
      d2.pol#
    , d2.pol_name
    , d3.tag#
    , d3.slabel -- or labeltochar(d3.lab#)
FROM
     lbacsys.ols$pol d2
    , lbacsys.ols$lab d3
WHERE
    d2.pol# = d3.pol#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$POLICY_LABEL" ("ID#",
"IDENTITY_ID#",
"IDENTITY_VALUE",
"FACTOR_ID#",
"FACTOR_NAME",
"POLICY_ID#",
"POLICY_NAME",
"LABEL_ID#",
"LABEL",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
      m.id#
    , m.identity_id#
    , d1.value
    , d4.id#
    , d4.name
    , m.policy_id#
    , d2.pol_name
    , m.label_id#
    , d3.slabel -- or labeltochar(d3.lab#)
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
FROM
    policy_label$ m
    , identity$ d1
    , lbacsys.ols$pol d2
    , lbacsys.ols$lab d3
    , factor$ d4
WHERE
    d1.id# = m.identity_id#
    AND d2.pol# = m.policy_id#
    AND d3.tag# = m.label_id#
    AND d4.id# = d1.factor_id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$REALM" ("ID#",
"NAME",
"DESCRIPTION",
"AUDIT_OPTIONS",
"REALM_TYPE",
"ENABLED",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
      m.id#
    , d.name
    , d.description
    , m.audit_options
    , m.realm_type
    , m.enabled
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
FROM dvsys.realm$ m, dvsys.realm_t$ d
WHERE
    m.id# = d.id#
    AND d.language = DVSYS.dvlang(d.id#, 6);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$REALM_AUTH" ("ID#",
"REALM_ID#",
"REALM_NAME",
"GRANTEE",
"AUTH_RULE_SET_ID#",
"AUTH_RULE_SET_NAME",
"AUTH_OPTIONS",
"AUTH_OPTIONS_MEANING",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
      m.id#
    , m.realm_id#
    , d1.name
    , u.name
    , m.auth_rule_set_id#
    , d2.name
    , m.auth_options
    , c.value
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
FROM dvsys.realm_auth$ m
    , dvsys.dv$realm d1
    , dvsys.dv$rule_set d2
    , dvsys.dv$code c
    , sys.user$ u
WHERE
    d1.id# (+)= m.realm_id#
    AND d2.id# (+)= m.auth_rule_set_id#
    AND c.code_group (+) = 'REALM_OPTION'
    AND c.code (+) = TO_CHAR(m.auth_options)
    AND m.grantee_uid# = u.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$REALM_OBJECT" ("ID#",
"REALM_ID#",
"REALM_NAME",
"OWNER",
"OBJECT_NAME",
"OBJECT_TYPE",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
      m.id#
    , m.realm_id#
    , d.name
    , u.name
    , m.object_name
    , m.object_type
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
FROM dvsys.realm_object$ m, dvsys.dv$realm d, sys.user$ u
WHERE
    d.id# = m.realm_id# AND m.owner_uid# = u.user#
UNION
SELECT
      m.id#
    , m.realm_id#
    , d.name
    , '%'
    , m.object_name
    , m.object_type
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
FROM dvsys.realm_object$ m, dvsys.dv$realm d
WHERE
    d.id# = m.realm_id# AND m.owner_uid# = 2147483636;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$ROLE" ("ID#",
"ROLE",
"RULE_SET_ID#",
"RULE_NAME",
"ENABLED",
"VERSION",
"CREATED_BY",
"CREATE_DATE",
"UPDATED_BY",
"UPDATE_DATE") AS
  SELECT
      m.id#
    , m.role
    , m.rule_set_id#
    , d.name
    , m.enabled
    , m.version
    , m.created_by
    , m.create_date
    , m.updated_by
    , m.update_date
FROM dvsys.role$ m, dvsys.dv$rule_set d
WHERE m.rule_set_id# = d.id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$SYS_GRANTEE" ("GRANTEE_NAME",
"GRANTEE_TYPE") AS
  SELECT
      u.username
    , 'USER'
FROM sys.dba_users u
UNION
SELECT
      r.role
    , 'ROLE'
FROM
    sys.dba_roles r;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV_OWNER_GRANTEES" ("GRANTEE",
"PATH_OF_CONNECT_ROLE_GRANT",
"ADMIN_OPT") AS
  select grantee, connect_path, admin_option
from (select grantee,
             'DV_OWNER'||SYS_CONNECT_BY_PATH(grantee, '/') connect_path,
             granted_role, admin_option
      from   sys.dba_role_privs
      where decode((select type# from sys.user$ where name = grantee),
               0, 'ROLE',
               1, 'USER') = 'USER'
      connect by nocycle granted_role = prior grantee
      start with granted_role = upper('DV_OWNER'));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV_ADMIN_GRANTEES" ("GRANTEE",
"PATH_OF_CONNECT_ROLE_GRANT",
"ADMIN_OPT") AS
  select grantee, connect_path, admin_option
from (select grantee,
             'DV_ADMIN'||SYS_CONNECT_BY_PATH(grantee, '/') connect_path,
             granted_role, admin_option
      from   sys.dba_role_privs
      where decode((select type# from sys.user$ where name = grantee),
               0, 'ROLE',
               1, 'USER') = 'USER'
      connect by nocycle granted_role = prior grantee
      start with granted_role = upper('DV_ADMIN'));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV_SECANALYST_GRANTEES" ("GRANTEE",
"PATH_OF_CONNECT_ROLE_GRANT",
"ADMIN_OPT") AS
  select grantee, connect_path, admin_option
from (select grantee,
             'DV_SECANALYST'||SYS_CONNECT_BY_PATH(grantee, '/') connect_path,
             granted_role, admin_option
      from   sys.dba_role_privs
      where decode((select type# from sys.user$ where name = grantee),
               0, 'ROLE',
               1, 'USER') = 'USER'
      connect by nocycle granted_role = prior grantee
      start with granted_role = upper('DV_SECANALYST'));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV_MONITOR_GRANTEES" ("GRANTEE",
"PATH_OF_CONNECT_ROLE_GRANT",
"ADMIN_OPT") AS
  select grantee, connect_path, admin_option
from (select grantee,
             'DV_MONITOR'||SYS_CONNECT_BY_PATH(grantee, '/') connect_path,
             granted_role, admin_option
      from   sys.dba_role_privs
      where decode((select type# from sys.user$ where name = grantee),
               0, 'ROLE',
               1, 'USER') = 'USER'
      connect by nocycle granted_role = prior grantee
      start with granted_role = upper('DV_MONITOR'));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV_AUDIT_CLEANUP_GRANTEES" ("GRANTEE",
"PATH_OF_CONNECT_ROLE_GRANT",
"ADMIN_OPT") AS
  select grantee, connect_path, admin_option
from (select grantee,
             'DV_AUDIT_CLEANUP'||SYS_CONNECT_BY_PATH(grantee, '/') connect_path,
             granted_role, admin_option
      from   sys.dba_role_privs
      where decode((select type# from sys.user$ where name = grantee),
               0, 'ROLE',
               1, 'USER') = 'USER'
      connect by nocycle granted_role = prior grantee
      start with granted_role = upper('DV_AUDIT_CLEANUP'));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$SYS_OBJECT" ("OBJECT_ID",
"OWNER",
"OBJECT_NAME",
"SUBOBJECT_NAME",
"DATA_OBJECT_ID",
"OBJECT_TYPE",
"CREATED",
"LAST_DDL_TIME",
"TIMESTAMP",
"STATUS",
"TEMPORARY",
"GENERATED",
"SECONDARY") AS
  SELECT
OBJECT_ID
,OWNER
,OBJECT_NAME
,SUBOBJECT_NAME
,DATA_OBJECT_ID
,OBJECT_TYPE
,CREATED
,LAST_DDL_TIME
,TIMESTAMP
,STATUS
,TEMPORARY
,GENERATED
,SECONDARY
FROM sys.dba_objects;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$SYS_OBJECT_OWNER" ("USERNAME") AS
  SELECT
      u.username
FROM sys.dba_users u;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_CODE" ("CODE_GROUP",
"CODE",
"VALUE",
"LANGUAGE",
"DESCRIPTION") AS
  SELECT
      m.CODE_GROUP
    , m.CODE
    , d.VALUE
    , d.LANGUAGE
    , d.DESCRIPTION
FROM dvsys.code$ m, dvsys.code_t$ d
WHERE m.id# = d.id#
      AND d.language = DVSYS.dvlang(d.id#, 1);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_COMMAND_RULE" ("COMMAND",
"RULE_SET_NAME",
"OBJECT_OWNER",
"OBJECT_NAME",
"ENABLED",
"PRIVILEGE_SCOPE") AS
  SELECT
      d2.code
    , d1.name
    , u.name
    , m.object_name
    , m.enabled
    , m.privilege_scope
FROM dvsys.command_rule$ m
    ,dvsys.dv$rule_set d1
    ,dvsys.dv$code d2
    ,sys.user$ u
WHERE
    d1.id# = m.rule_set_id#
    AND d2.id# = m.code_id#
    AND m.object_owner_uid# = u.user#
UNION
SELECT
      d2.code
    , d1.name
    , '%'
    , m.object_name
    , m.enabled
    , m.privilege_scope
FROM dvsys.command_rule$ m
    ,dvsys.dv$rule_set d1
    ,dvsys.dv$code d2
WHERE
    d1.id# = m.rule_set_id#
    AND d2.id# = m.code_id#
    AND m.object_owner_uid# = 2147483636;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_FACTOR" ("NAME",
"DESCRIPTION",
"FACTOR_TYPE_NAME",
"ASSIGN_RULE_SET_NAME",
"GET_EXPR",
"VALIDATE_EXPR",
"IDENTIFIED_BY",
"IDENTIFIED_BY_MEANING",
"NAMESPACE",
"NAMESPACE_ATTRIBUTE",
"LABELED_BY",
"LABELED_BY_MEANING",
"EVAL_OPTIONS",
"EVAL_OPTIONS_MEANING",
"AUDIT_OPTIONS",
"FAIL_OPTIONS",
"FAIL_OPTIONS_MEANING") AS
  SELECT
      m.name
    , d.description
    , dft.name
    , drs.name
    , m.get_expr
    , m.validate_expr
    , m.identified_by
    , did.value
    , m.namespace
    , m.namespace_attribute
    , m.labeled_by
    , dlabel.value
    , m.eval_options
    , deval.value
    , m.audit_options
    , m.fail_options
    , dfail.value
FROM dvsys.factor$ m
    , dvsys.factor_t$ d
    , dvsys.dv$factor_type dft
    , dvsys.dv$rule_set drs
    , dvsys.dv$code did
    , dvsys.dv$code dlabel
    , dvsys.dv$code deval
    , dvsys.dv$code dfail
WHERE
    m.id# = d.id#
    AND d.language = DVSYS.dvlang(d.id#, 2)
    AND dft.id# = m.factor_type_id#
    AND did.code    = TO_CHAR(m.identified_by)  and did.code_group = 'FACTOR_IDENTIFY'
    AND dlabel.code = TO_CHAR(m.labeled_by)  and dlabel.code_group = 'FACTOR_LABEL'
    AND deval.code  = TO_CHAR(m.eval_options) and deval.code_group = 'FACTOR_EVALUATE'
    AND dfail.code  = TO_CHAR(m.fail_options) and dfail.code_group = 'FACTOR_FAIL'
    AND drs.id#  (+)= m.assign_rule_set_id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_FACTOR_LINK" ("PARENT_FACTOR_NAME",
"CHILD_FACTOR_NAME",
"LABEL_IND") AS
  SELECT
      d1.name
    , d2.name
    , m.label_ind
FROM dvsys.factor_link$ m
    , dvsys.dv$factor d1
    , dvsys.dv$factor d2
WHERE
     d1.id# = m.parent_factor_id#
    AND d2.id# = m.child_factor_id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_FACTOR_TYPE" ("NAME",
"DESCRIPTION") AS
  SELECT
      d.NAME
    , d.DESCRIPTION
FROM dvsys.factor_type$ m, dvsys.factor_type_t$ d
WHERE
    m.id# = d.id#
    AND d.language = DVSYS.dvlang(d.id#, 3);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_IDENTITY" ("FACTOR_NAME",
"VALUE",
"TRUST_LEVEL") AS
  SELECT
      d1.name
    , m.value
    , m.trust_level
FROM dvsys.identity$ m, dvsys.dv$factor d1
WHERE
    d1.id# = m.factor_id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_IDENTITY_MAP" ("FACTOR_NAME",
"IDENTITY_VALUE",
"OPERATION_CODE",
"OPERATION_VALUE",
"OPERAND1",
"OPERAND2",
"PARENT_FACTOR_NAME",
"CHILD_FACTOR_NAME",
"LABEL_IND") AS
  SELECT
      d6.name
    , d1.value
    , d2.code
    , d2.value
    , m.operand1
    , m.operand2
    , d4.name
    , d5.name
    , d3.label_ind
FROM dvsys.identity_map$ m
    , dvsys.identity$ d1
    , dvsys.dv$code d2
    , dvsys.factor_link$ d3
    , dvsys.dv$factor d4
    , dvsys.dv$factor d5
    , dvsys.dv$factor d6
WHERE
    d1.id# = m.identity_id#
    AND d2.id# = m.operation_code_id#
    AND d3.id# (+)= m.factor_link_id#
    AND d4.id# (+)= d3.parent_factor_id#
    AND d5.id# (+)= d3.child_factor_id#
    AND d6.id# = d1.factor_id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_MAC_POLICY" ("POLICY_NAME",
"ALGORITHM_CODE",
"ALGORITHM_MEANING",
"ERROR_LABEL") AS
  SELECT
      d1.pol_name
    , d2.code
    , d2.value
    , m.error_label
FROM dvsys.mac_policy$ m
    , lbacsys.ols$pol d1
    , dvsys.dv$code d2
WHERE
        d1.pol# = m.policy_id#
    AND d2.id# = m.algorithm_code_id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_MAC_POLICY_FACTOR" ("FACTOR_NAME",
"MAC_POLICY_NAME") AS
  SELECT
      d1.name
    , d2.pol_name
FROM dvsys.mac_policy_factor$ m
    , dvsys.dv$factor d1
    , lbacsys.ols$pol d2
    , dvsys.mac_policy$ d3
WHERE
    d1.id# = m.factor_id#
    AND d3.id# = m.mac_policy_id#
    AND d2.pol# = policy_id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_POLICY_LABEL" ("IDENTITY_VALUE",
"FACTOR_NAME",
"POLICY_NAME",
"LABEL") AS
  SELECT
      d1.value
    , d4.name
    , d2.pol_name
    , d3.slabel -- or labeltochar(d3.lab#)
FROM
    policy_label$ m
    , identity$ d1
    , lbacsys.ols$pol d2
    , lbacsys.ols$lab d3
    , factor$ d4
WHERE
    d1.id# = m.identity_id#
    AND d2.pol# = m.policy_id#
    AND d3.tag# = m.label_id#
    AND d4.id# = d1.factor_id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_REALM" ("NAME",
"DESCRIPTION",
"AUDIT_OPTIONS",
"REALM_TYPE",
"ENABLED") AS
  SELECT
      d.name
    , d.description
    , m.audit_options
    , decode(m.realm_type, 0, 'REGULAR',
                           1, 'MANDATORY')
    , m.enabled
FROM dvsys.realm$ m, dvsys.realm_t$ d
WHERE
    m.id# = d.id#
    AND d.language = DVSYS.dvlang(d.id#, 6);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_REALM_AUTH" ("REALM_NAME",
"GRANTEE",
"AUTH_RULE_SET_NAME",
"AUTH_OPTIONS") AS
  SELECT
      d1.name
    , u.name
    , d2.name
    , c.value
FROM dvsys.realm_auth$ m
    , dvsys.dv$realm d1
    , dvsys.dv$rule_set d2
    , dvsys.dv$code c
    , sys.user$ u
WHERE
    d1.id# (+)= m.realm_id#
    AND d2.id# (+)= m.auth_rule_set_id#
    AND c.code_group (+) = 'REALM_OPTION'
    AND c.code (+) = TO_CHAR(m.auth_options)
    AND m.grantee_uid# = u.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_REALM_OBJECT" ("REALM_NAME",
"OWNER",
"OBJECT_NAME",
"OBJECT_TYPE") AS
  SELECT
     d.name
    , u.name
    , m.object_name
    , m.object_type
FROM dvsys.realm_object$ m, dvsys.dv$realm d, sys.user$ u
WHERE
    d.id# = m.realm_id# AND m.owner_uid# = u.user#
UNION
SELECT
     d.name
    , '%'
    , m.object_name
    , m.object_type
FROM dvsys.realm_object$ m, dvsys.dv$realm d
WHERE
    d.id# = m.realm_id# AND m.owner_uid# = 2147483636;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_ROLE" ("ROLE",
"RULE_NAME",
"ENABLED") AS
  SELECT
      m.role
    , d.name
    , m.enabled
FROM dvsys.role$ m, dvsys.dv$rule_set d
WHERE m.rule_set_id# = d.id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_RULE" ("NAME",
"RULE_EXPR") AS
  SELECT
      d.name
    , m.rule_expr
FROM dvsys.rule$ m, dvsys.rule_t$ d
WHERE
    m.id# = d.id#
    AND d.language = DVSYS.dvlang(d.id#, 4);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_RULE_SET_RULE" ("RULE_SET_NAME",
"RULE_NAME",
"RULE_EXPR",
"ENABLED",
"RULE_ORDER") AS
  SELECT
      d1.name
    , d2.name
    , d2.rule_expr
    , m.enabled
    , m.rule_order
FROM dvsys.rule_set_rule$ m
     ,dvsys.dv$rule_set d1
     ,dvsys.dv$rule d2
WHERE
    d1.id# = m.rule_set_id#
    and d2.id# = m.rule_id#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_RULE_SET" ("RULE_SET_NAME",
"DESCRIPTION",
"ENABLED",
"EVAL_OPTIONS_MEANING",
"AUDIT_OPTIONS",
"FAIL_OPTIONS_MEANING",
"FAIL_MESSAGE",
"FAIL_CODE",
"HANDLER_OPTIONS",
"HANDLER",
"IS_STATIC") AS
  SELECT
      d.name
    , d.description
    , m.enabled
    , deval.value
    , m.audit_options
    , dfail.value
    , d.fail_message
    , m.fail_code
    , m.handler_options
    , m.handler
    , DECODE(bitand(m.eval_options, 128) , 128, 'TRUE', 'FALSE')
FROM dvsys.rule_set$ m
    , dvsys.rule_set_t$ d
    , dvsys.dv$code deval
    , dvsys.dv$code dfail
WHERE
    m.id# = d.id#
    AND d.language = DVSYS.dvlang(d.id#, 5)
    AND deval.code  = TO_CHAR(m.eval_options -
                             DECODE(bitand(m.eval_options,128) , 128, 128, 0))
    AND deval.code_group = 'RULESET_EVALUATE'
    AND dfail.code  = TO_CHAR(m.fail_options)
    AND dfail.code_group = 'RULESET_FAIL';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_USER_PRIVS" ("USERNAME",
"ACCESS_TYPE",
"PRIVILEGE",
"OWNER",
"OBJECT_NAME") AS
  SELECT
    dbu.name
    ,   decode(ue.name,dbu.name,'DIRECT',ue.name)
    ,   tpm.name
    ,   u.name
    ,   o.name
FROM sys.objauth$ oa,
    sys.obj$ o,
    sys.user$ u,
    sys.user$ ue,
    sys.user$ dbu,
    sys.table_privilege_map tpm
WHERE oa.obj# = o.obj#
  AND oa.col# IS NULL
  AND oa.privilege# = tpm.privilege
  AND u.user# = o.owner#
  AND oa.grantee# = ue.user#
  AND dbu.type# = 1
  AND (oa.grantee# = dbu.user#
        or
       oa.grantee# in (SELECT /*+ connect_by_filtering */ DISTINCT privilege#
                        FROM (select * from sys.sysauth$ where privilege#>0)
                        CONNECT BY grantee#=prior privilege#
                        START WITH grantee#=dbu.user#));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_USER_PRIVS_ALL" ("USERNAME",
"ACCESS_TYPE",
"PRIVILEGE",
"OWNER",
"OBJECT_NAME") AS
  SELECT
    dbu.name
       , decode(ue.name,dbu.name,'DIRECT',ue.name)
       , tpm.name
       , u.name
       , o.name
FROM sys.objauth$ oa,
    sys.obj$ o,
    sys.user$ u,
    sys.user$ ue,
    sys.user$ dbu,
    table_privilege_map tpm
WHERE oa.obj# = o.obj#
  AND oa.col# IS NULL
  AND oa.privilege# = tpm.privilege
  AND u.user# = o.owner#
  AND oa.grantee# = ue.user#
  AND dbu.type# = 1
  AND (oa.grantee# = dbu.user#
        or
       oa.grantee#  in (SELECT /*+ connect_by_filtering */ DISTINCT privilege#
                        FROM (select * from sys.sysauth$ where privilege#>0)
                        CONNECT BY grantee#=prior privilege#
                        START WITH grantee#=dbu.user#))
UNION ALL
SELECT dbu.name
       ,DECODE(ue.name,dbu.name,'DIRECT',ue.name)
       ,spm.name
       ,DECODE (INSTR(spm.name,' ANY '),0, NULL, '%')
       ,DECODE (INSTR(spm.name,' ANY '),0, NULL, '%')
FROM sys.sysauth$ oa,
     sys.user$ ue,
     sys.user$ dbu,
     system_privilege_map spm
WHERE
      oa.privilege# = spm.privilege
  AND oa.grantee# = ue.user#
  AND oa.privilege# < 0
  AND dbu.type# = 1
  AND (oa.grantee# = dbu.user#
        or
       oa.grantee#  in (SELECT /*+ connect_by_filtering */ DISTINCT privilege#
                        FROM (select * from sys.sysauth$ where privilege#>0)
                        CONNECT BY grantee#=prior privilege#
                        START WITH grantee#=dbu.user#));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_PUB_PRIVS" ("USERNAME",
"ACCESS_TYPE",
"PRIVILEGE",
"OWNER",
"OBJECT_NAME") AS
  SELECT
    dbu.name
    ,   decode(ue.name,dbu.name,'DIRECT',ue.name)
    ,   tpm.name
    ,   u.name
    ,   o.name
FROM sys.objauth$ oa,
    sys.obj$ o,
    sys.user$ u,
    sys.user$ ue,
    sys.user$ dbu,
    sys.table_privilege_map tpm
WHERE oa.obj# = o.obj#
  AND oa.col# IS NULL
  AND oa.privilege# = tpm.privilege
  AND u.user# = o.owner#
  AND oa.grantee# = ue.user#
  AND dbu.type# = 1
  AND (oa.grantee# = 1);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_JOB_AUTH" ("GRANTEE",
"SCHEMA") AS
  SELECT
    u1.name
  , u2.name
FROM dvsys.dv_auth$ da, sys.user$ u1, sys.user$ u2
WHERE grant_type = 'JOB' and da.grantee_id = u1.user# and
      da.object_owner_id = u2.user#
UNION
SELECT
    u1.name
  , '%'
FROM dvsys.dv_auth$ da, sys.user$ u1
WHERE grant_type = 'JOB' and da.grantee_id = u1.user# and
      da.object_owner_id = 2147483636;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_DATAPUMP_AUTH" ("GRANTEE",
"SCHEMA",
"OBJECT") AS
  SELECT
    u1.name
  , u2.name
  , da.object_name
FROM dvsys.dv_auth$ da, sys.user$ u1, sys.user$ u2
WHERE da.grant_type = 'DATAPUMP' and da.grantee_id = u1.user# and
      da.object_owner_id = u2.user#
UNION
SELECT
    u1.name
  , '%'
  , da.object_name
FROM dvsys.dv_auth$ da, sys.user$ u1
WHERE da.grant_type = 'DATAPUMP' and da.grantee_id = u1.user# and
      da.object_owner_id = 2147483636;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_TTS_AUTH" ("GRANTEE",
"TSNAME") AS
  SELECT
    u1.name
  , da.object_name
FROM dvsys.dv_auth$ da, sys.user$ u1
WHERE da.grant_type = 'TTS' and da.grantee_id = u1.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_PROXY_AUTH" ("GRANTEE",
"SCHEMA") AS
  SELECT
    u1.name
  , u2.name
FROM dvsys.dv_auth$ da, sys.user$ u1, sys.user$ u2
WHERE grant_type = 'PROXY' and da.grantee_id = u1.user# and
      da.object_owner_id = u2.user#
UNION
SELECT
    u1.name
  , '%'
FROM dvsys.dv_auth$ da, sys.user$ u1
WHERE grant_type = 'PROXY' and da.grantee_id = u1.user# and
      da.object_owner_id = 2147483636
UNION
SELECT
    '%'
  , u2.name
FROM dvsys.dv_auth$ da, sys.user$ u2
WHERE grant_type = 'PROXY' and da.grantee_id = 2147483636 and
      da.object_owner_id = u2.user#
UNION
SELECT
    '%'
  , '%'
FROM dvsys.dv_auth$ da
WHERE grant_type = 'PROXY' and da.grantee_id = 2147483636 and
      da.object_owner_id = 2147483636;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_DDL_AUTH" ("GRANTEE",
"SCHEMA") AS
  SELECT
    u1.name
  , u2.name
FROM dvsys.dv_auth$ da, sys.user$ u1, sys.user$ u2
WHERE grant_type = 'DDL' and da.grantee_id = u1.user# and
      da.object_owner_id = u2.user#
UNION
SELECT
    u1.name
  , '%'
FROM dvsys.dv_auth$ da, sys.user$ u1
WHERE grant_type = 'DDL' and da.grantee_id = u1.user# and
      da.object_owner_id = 2147483636
UNION
SELECT
    '%'
  , u2.name
FROM dvsys.dv_auth$ da, sys.user$ u2
WHERE grant_type = 'DDL' and da.grantee_id = 2147483636 and
      da.object_owner_id = u2.user#
UNION
SELECT
    '%'
  , '%'
FROM dvsys.dv_auth$ da
WHERE grant_type = 'DDL' and da.grantee_id = 2147483636 and
      da.object_owner_id = 2147483636;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_AUTH" ("GRANT_TYPE",
"GRANTEE",
"SCHEMA",
"OBJECT_NAME",
"OBJECT_TYPE") AS
  SELECT
    grant_type
  , u1.name
  , u2.name
  , da.object_name
  , da.object_type
FROM dvsys.dv_auth$ da, sys.user$ u1, sys.user$ u2
WHERE da.grantee_id = u1.user# and
      da.object_owner_id = u2.user#
UNION
SELECT
    grant_type
  , u1.name
  , '%'
  , object_name
  , object_type
FROM dvsys.dv_auth$ da, sys.user$ u1
WHERE da.grantee_id = u1.user# and
      da.object_owner_id = 2147483636
UNION
SELECT
    grant_type
  , '%'
  , u2.name
  , object_name
  , object_type
FROM dvsys.dv_auth$ da, sys.user$ u2
WHERE da.grantee_id = 2147483636 and
      da.object_owner_id = u2.user#
UNION
SELECT
    grant_type
  , '%'
  , '%'
  , object_name
  , object_type
FROM dvsys.dv_auth$ da
WHERE da.grantee_id = 2147483636 and
      da.object_owner_id = 2147483636;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_PATCH_ADMIN_AUDIT" ("STATE") AS
  SELECT DECODE(cnt, 0, 'DISABLED', 'ENABLED')
FROM (SELECT COUNT(*) cnt FROM DVSYS.DV_AUTH$ WHERE GRANT_TYPE = 'DVPATCHAUDIT');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_ORADEBUG" ("STATE") AS
  SELECT DECODE(cnt, 0, 'DISABLED', 'ENABLED')
FROM (SELECT COUNT(*) cnt FROM DVSYS.DV_AUTH$ WHERE GRANT_TYPE = 'ORADEBUG');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_DICTIONARY_ACCTS" ("STATE") AS
  SELECT DECODE(cnt, 0, 'DISABLED', 'ENABLED')
FROM (SELECT COUNT(*) cnt FROM DVSYS.DV_AUTH$ WHERE GRANT_TYPE = 'DV_ACCTS');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."KU$_DV_ISR_VIEW" OF "DVSYS"."KU$_DV_ISR_T"
  WITH OBJECT IDENTIFIER (vers_major) AS
  select '0','0'
    from dual
   where (sys_context('USERENV','CURRENT_USERID') = 1279990
          or exists (select 1
                       from sys.session_roles
                      where role='DV_OWNER'))
     and exists (select 1
                   from dvsys.realm_object$ objects_in_realm
                  where objects_in_realm.REALM_ID# > 5000);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."KU$_DV_ISRM_VIEW" OF "DVSYS"."KU$_DV_ISRM_T"
  WITH OBJECT IDENTIFIER (schema_name) AS
  select '0','0',
         realm_objects.object_owner
    from (select distinct(objects_in_realm.owner) object_owner
            from dvsys.dv$realm_object objects_in_realm
           where objects_in_realm.REALM_ID# > 5000) realm_objects
   where (sys_context('USERENV','CURRENT_USERID') = 1279990
          or exists (select 1
                       from sys.session_roles
                      where role='DV_OWNER'));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."KU$_DV_REALM_VIEW" OF "DVSYS"."KU$_DV_REALM_T"
  WITH OBJECT IDENTIFIER (name) AS
  select '0','0',
          rlmt.name,
          rlmt.description,
          rlmt.language,
          rlm.enabled,
          decode(rlm.audit_options,
                 0,'DVSYS.DBMS_MACUTL.G_REALM_AUDIT_OFF',
                 1,'DVSYS.DBMS_MACUTL.G_REALM_AUDIT_FAIL',
                 2,'DVSYS.DBMS_MACUTL.G_REALM_AUDIT_SUCCESS',
                 3,'(DVSYS.DBMS_MACUTL.G_REALM_AUDIT_SUCCESS+'||
                    'DVSYS.DBMS_MACUTL.G_REALM_AUDIT_FAIL)',
                 to_char(rlm.audit_options))
  from    dvsys.realm$        rlm,
          dvsys.realm_t$      rlmt
  where   rlm.id# = rlmt.id#
    and   rlm.id# > 5000
    and   (SYS_CONTEXT('USERENV','CURRENT_USERID') = 1279990
           or exists ( select 1
                         from sys.session_roles
                        where role='DV_OWNER' ));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."KU$_DV_REALM_MEMBER_VIEW" OF "DVSYS"."KU$_DV_REALM_MEMBER_T"
  WITH OBJECT IDENTIFIER (object_name, name) AS
  select '0','0',
          rlmt.name,
          rlmo.owner,
          rlmo.object_name,
          rlmo.object_type
  from    dvsys.realm$        rlm,
          dvsys.realm_t$      rlmt,
          dvsys.dv$realm_object rlmo
  where   rlm.id# = rlmt.id#
    and   rlmo.realm_id# = rlm.id#
    and   rlm.id# > 5000
    and   (SYS_CONTEXT('USERENV','CURRENT_USERID') = 1279990
           or exists ( select 1
                         from sys.session_roles
                        where role='DV_OWNER' ));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."KU$_DV_REALM_AUTH_VIEW" OF "DVSYS"."KU$_DV_REALM_AUTH_T"
  WITH OBJECT IDENTIFIER (realm_name, grantee) AS
  select '0','0',
          rlmt.name,
          rlma.grantee,
          rs.name,
          decode(rlma.auth_options,
                 0,'DVSYS.DBMS_MACUTL.G_REALM_AUTH_PARTICIPANT',
                 1,'DVSYS.DBMS_MACUTL.G_REALM_AUTH_OWNER',
                 to_char(rlma.auth_options))
  from    dvsys.realm$                   rlm,
          dvsys.realm_t$                 rlmt,
          dvsys.dv$realm_auth              rlma,
          (select m.id#,
                  d.name
             from dvsys.rule_set$   m,
                  dvsys.rule_set_t$ d
            where m.id# = d.id#)         rs
  where   rlm.id# = rlma.realm_id#
    and   rlm.id# = rlmt.id#
    and   rs.id# (+)= rlma.auth_rule_set_id#
    and   rlm.id# > 5000
    and   (SYS_CONTEXT('USERENV','CURRENT_USERID') = 1279990
           or exists ( select 1
                         from sys.session_roles
                        where role='DV_OWNER' ));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."KU$_DV_RULE_VIEW" OF "DVSYS"."KU$_DV_RULE_T"
  WITH OBJECT IDENTIFIER (rule_name) AS
  select '0','0',
          rult.name,
          rul.rule_expr,
          rult.language
  from    dvsys.rule$                   rul,
          dvsys.rule_t$                 rult
  where   rul.id# = rult.id#
    and   rul.id# >= 5000
    and   rul.id# not in (select rule_id#
                            from dvsys.rule_set_rule$
                           where rule_set_id# = 8)
    and   (SYS_CONTEXT('USERENV','CURRENT_USERID') = 1279990
           or exists ( select 1
                         from sys.session_roles
                        where role='DV_OWNER' ));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."KU$_DV_RULE_SET_VIEW" OF "DVSYS"."KU$_DV_RULE_SET_T"
  WITH OBJECT IDENTIFIER (rule_set_name) AS
  select '0','0',
          rulst.name,
          rulst.description,
          rulst.language,
          ruls.enabled,
          decode(ruls.eval_options,
                 1,'DVSYS.DBMS_MACUTL.G_RULESET_EVAL_ALL',
                 2,'DVSYS.DBMS_MACUTL.G_RULESET_EVAL_ANY',
                 to_char(ruls.eval_options)),
          decode(ruls.audit_options,
                 0,'DVSYS.DBMS_MACUTL.G_REALM_AUDIT_OFF',
                 1,'DVSYS.DBMS_MACUTL.G_REALM_AUDIT_FAIL',
                 2,'DVSYS.DBMS_MACUTL.G_REALM_AUDIT_SUCCESS',
                 3,'(DVSYS.DBMS_MACUTL.G_REALM_AUDIT_SUCCESS+'||
                    'DVSYS.DBMS_MACUTL.G_REALM_AUDIT_FAIL)',
                 to_char(ruls.audit_options)),
          decode(ruls.fail_options,
                 1,'DVSYS.DBMS_MACUTL.G_RULESET_FAIL_SHOW',
                 2,'DVSYS.DBMS_MACUTL.G_RULESET_FAIL_SILENT',
                 to_char(ruls.fail_options)),
          rulst.fail_message,
          ruls.fail_code,
          decode(ruls.handler_options,
                 0,'DVSYS.DBMS_MACUTL.G_RULESET_HANDLER_OFF',
                 1,'DVSYS.DBMS_MACUTL.G_RULESET_HANDLER_FAIL',
                 2,'DVSYS.DBMS_MACUTL.G_RULESET_HANDLER_SUCCESS',
                 3,'(DVSYS.DBMS_MACUTL.G_RULESET_HANDLER_FAIL+'||
                    'DVSYS.DBMS_MACUTL.G_RULESET_HANDLER_SUCCESS)',
                 to_char(ruls.handler_options)),
          ruls.handler
  from    dvsys.rule_set$               ruls,
          dvsys.rule_set_t$             rulst
  where   ruls.id# = rulst.id#
    and   ruls.id# >= 5000
    and   (SYS_CONTEXT('USERENV','CURRENT_USERID') = 1279990
           or exists ( select 1
                         from sys.session_roles
                        where role='DV_OWNER' ));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."KU$_DV_RULE_SET_MEMBER_VIEW" OF "DVSYS"."KU$_DV_RULE_SET_MEMBER_T"
  WITH OBJECT IDENTIFIER (rule_set_name,rule_name) AS
  select '0','0',
          rulst.name,
          rult.name,
          rsr.rule_order,
          rsr.enabled
  from    dvsys.rule_set_rule$          rsr,
          dvsys.rule_set$               ruls,
          dvsys.rule_set_t$             rulst,
          dvsys.rule$                   rul,
          dvsys.rule_t$                 rult
  where   ruls.id# = rsr.rule_set_id#
    and   ruls.id# = rulst.id#
    and    rul.id# = rsr.rule_id#
    and    rul.id# = rult.id#
    and   ruls.id# >= 5000
    and   (SYS_CONTEXT('USERENV','CURRENT_USERID') = 1279990
           or exists ( select 1
                         from sys.session_roles
                        where role='DV_OWNER' ));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."KU$_DV_COMMAND_RULE_VIEW" OF "DVSYS"."KU$_DV_COMMAND_RULE_T"
  WITH OBJECT IDENTIFIER (rule_set_name) AS
  select '0','0',
          command,
          rule_set_name,
          object_owner,
          object_name,
          enabled
  from    dvsys.dv$command_rule         cvcr
  where   cvcr.id# >= 5000
    and   (SYS_CONTEXT('USERENV','CURRENT_USERID') = 1279990
           or exists ( select 1
                         from sys.session_roles
                        where role='DV_OWNER' ));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."KU$_DV_ROLE_VIEW" OF "DVSYS"."KU$_DV_ROLE_T"
  WITH OBJECT IDENTIFIER (role) AS
  select '0','0',
         roles.role,
         roles.enabled,
         rulst.name
    from dvsys.role$         roles,
         dvsys.rule_set$     ruls,
         dvsys.rule_set_t$   rulst
   where roles.rule_set_id# = ruls.id#
     and ruls.id# = rulst.id#
     and roles.id# >= 5000
     and (SYS_CONTEXT('USERENV','CURRENT_USERID') = 1279990 OR
          EXISTS ( SELECT * FROM sys.session_roles
                   WHERE role='DV_OWNER' ));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."KU$_DV_FACTOR_VIEW" OF "DVSYS"."KU$_DV_FACTOR_T"
  WITH OBJECT IDENTIFIER (factor_name) AS
  select '0','0',
         m.name,
         dft.name,
         d.description,
         d.language,
         drs.name,
         m.get_expr,
         m.validate_expr,
         decode(m.identified_by,
                 0,'DVSYS.DBMS_MACUTL.G_IDENTIFY_BY_CONSTANT',
                 1,'DVSYS.DBMS_MACUTL.G_IDENTIFY_BY_METHOD',
                 2,'DVSYS.DBMS_MACUTL.G_IDENTIFY_BY_FACTOR',
                 3,'DVSYS.DBMS_MACUTL.G_IDENTIFY_BY_CONTEXT',
                 4,'DVSYS.DBMS_MACUTL.G_IDENTIFY_BY_RULESET',
                 to_char(m.identified_by)),
         decode(m.labeled_by,
                 0,'DVSYS.DBMS_MACUTL.G_LABELED_BY_SELF',
                 1,'DVSYS.DBMS_MACUTL.G_LABELED_BY_FACTORS',
                 to_char(m.labeled_by)),
         decode(m.eval_options,
                 0,'DVSYS.DBMS_MACUTL.G_EVAL_ON_SESSION',
                 1,'DVSYS.DBMS_MACUTL.G_EVAL_ON_ACCESS',
                 2,'DVSYS.DBMS_MACUTL.G_EVAL_ON_STARTUP',
                 to_char(m.eval_options)),
         decode(m.audit_options,
                0,'DVSYS.DBMS_MACUTL.G_AUDIT_OFF',
                substr(
                  decode(bitand(m.audit_options,power(2,0)),
                        power(2,0),
                          ' || DVSYS.DBMS_MACUTL.G_AUDIT_ALWAYS',
                        0,'') ||
                  decode(bitand(m.audit_options,power(2,1)),
                        power(2,1),
                          ' || DVSYS.DBMS_MACUTL.G_AUDIT_ON_GET_ERROR',
                        0,'') ||
                  decode(bitand(m.audit_options,power(2,2)),
                        power(2,2),
                          ' || DVSYS.DBMS_MACUTL.G_AUDIT_ON_GET_NULL',
                        0,'') ||
                  decode(bitand(m.audit_options,power(2,3)),
                        power(2,3),
                          ' || DVSYS.DBMS_MACUTL.G_AUDIT_ON_VALIDATE_ERROR',
                        0,'') ||
                  decode(bitand(m.audit_options,power(2,4)),
                        power(2,4),
                          ' || DVSYS.DBMS_MACUTL.G_AUDIT_ON_VALIDATE_FALSE',
                        0,'') ||
                  decode(bitand(m.audit_options,power(2,5)),
                        power(2,5),
                          ' || DVSYS.DBMS_MACUTL.G_AUDIT_ON_TRUST_LEVEL_NULL',
                        0,'') ||
                  decode(bitand(m.audit_options,power(2,6)),
                        power(2,6),
                          ' || DVSYS.DBMS_MACUTL.G_AUDIT_ON_TRUST_LEVEL_NEG',
                        0,''), 5)),
         decode(m.fail_options,
                 1,'DVSYS.DBMS_MACUTL.G_FAIL_WITH_MESSAGE',
                 2,'DVSYS.DBMS_MACUTL.G_FAIL_SILENTLY',
                 to_char(m.fail_options))
   from dvsys.factor$         m,
        dvsys.factor_t$       d,
        dvsys.factor_type_t$  dft,
        dvsys.rule_set_t$     drs
  where m.id# = d.id#
    and dft.id# = m.factor_type_id#
    and drs.id#  (+)= m.assign_rule_set_id#
    and m.id# >= 5000
    and (SYS_CONTEXT('USERENV','CURRENT_USERID') = 1279990 OR
         EXISTS ( SELECT * FROM sys.session_roles
                  WHERE role='DV_OWNER' ));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."KU$_DV_FACTOR_LINK_VIEW" OF "DVSYS"."KU$_DV_FACTOR_LINK_T"
  WITH OBJECT IDENTIFIER (parent_factor_name) AS
  select '0','0',
          d1.name,
          d2.name,
          m.label_ind
  from    dvsys.factor_link$   m,
          dvsys.factor$        d1,
          dvsys.factor$        d2
  where   d1.id# = m.parent_factor_id#
    and   d2.id# = m.child_factor_id#
    and   m.id# >= 5000
    and   (SYS_CONTEXT('USERENV','CURRENT_USERID') = 1279990 OR
           EXISTS ( SELECT * FROM sys.session_roles
                    WHERE role='DV_OWNER' ));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."KU$_DV_FACTOR_TYPE_VIEW" OF "DVSYS"."KU$_DV_FACTOR_TYPE_T"
  WITH OBJECT IDENTIFIER (name) AS
  select '0','0',
          factt.name,
          factt.description,
          factt.language
  from    dvsys.factor_type$            fact,
          dvsys.factor_type_t$          factt
  where   fact.id# = factt.id#
    and   fact.id# >= 5000
    and   (SYS_CONTEXT('USERENV','CURRENT_USERID') = 1279990 OR
           EXISTS ( SELECT * FROM sys.session_roles
                    WHERE role='DV_OWNER' ));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."KU$_DV_IDENTITY_VIEW" OF "DVSYS"."KU$_DV_IDENTITY_T"
  WITH OBJECT IDENTIFIER (factor_name) AS
  select '0','0',
          fac.name,
          iden.value,
          iden.trust_level
  from    dvsys.factor$                 fac,
          dvsys.identity$               iden
  where   fac.id# = iden.factor_id#
    and   fac.id# >= 5000
    and   (SYS_CONTEXT('USERENV','CURRENT_USERID') = 1279990 OR
           EXISTS ( SELECT * FROM sys.session_roles
                    WHERE role='DV_OWNER' ));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."KU$_DV_IDENTITY_MAP_VIEW" OF "DVSYS"."KU$_DV_IDENTITY_MAP_T"
  WITH OBJECT IDENTIFIER (identity_factor_name) AS
  select '0','0',
          d6.name,
          d1.value,
          d4.name,
          d5.name,
          d2.code,
          m.operand1,
          m.operand2
  from    dvsys.identity_map$           m,
          dvsys.identity$               d1,
          dvsys.code$                   d2,
          dvsys.factor_link$            d3,
          dvsys.factor$                 d4,
          dvsys.factor$                 d5,
          dvsys.factor$                 d6
  where   d1.id# = m.identity_id#
    and   m.id# >= 5000
    and   d2.id# = m.operation_code_id#
    and   d2.code_group = 'OPERATORS'
    and   d3.id# (+)= m.factor_link_id#
    and   d4.id# (+)= d3.parent_factor_id#
    and   d5.id# (+)= d3.child_factor_id#
    and   d6.id# = d1.factor_id#
    and   (SYS_CONTEXT('USERENV','CURRENT_USERID') = 1279990 OR
           EXISTS ( SELECT * FROM sys.session_roles
                    WHERE role='DV_OWNER' ));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DBA_DV_STATUS" ("NAME",
"STATUS") AS
  select 'DV_CONFIGURE_STATUS' as name,
       DECODE(status, '1', 'TRUE', 'FALSE') as status
from dvsys.config$
union
select 'DV_ENABLE_STATUS' AS name, value AS status
from v$option
where parameter = 'Oracle Database Vault';

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."EVENT_STATUS" ("EVENT",
"ENABLED") AS
  SELECT "EVENT",
"ENABLED" FROM TABLE(DVSYS.dbms_macutl.get_event_status());

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DVSYS"."DV$OUT" ("LINENO",
"TEXT") AS
  SELECT ROWNUM lineno, dbms_macout.get_line( ROWNUM ) text
   FROM all_objects
  WHERE ROWNUM < ( SELECT dbms_macout.get_line_count FROM dual );

GRANT SELECT ON "DVSYS"."DBA_DV_STATUS" TO "SYS";
ALTER TABLE "DVSYS"."MAC_POLICY$" ADD CONSTRAINT "MAC_POLICY$_FK1" FOREIGN KEY ("ALGORITHM_CODE_ID#")
	  REFERENCES "DVSYS"."CODE$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."MAC_POLICY_FACTOR$" ADD CONSTRAINT "MAC_POLICY_FACTOR$_FK" FOREIGN KEY ("FACTOR_ID#")
	  REFERENCES "DVSYS"."FACTOR$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."MAC_POLICY_FACTOR$" ADD CONSTRAINT "MAC_POLICY_FACTOR$_FK1" FOREIGN KEY ("MAC_POLICY_ID#")
	  REFERENCES "DVSYS"."MAC_POLICY$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."FACTOR$" ADD CONSTRAINT "FACTOR$_FK" FOREIGN KEY ("FACTOR_TYPE_ID#")
	  REFERENCES "DVSYS"."FACTOR_TYPE$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."FACTOR$" ADD CONSTRAINT "FACTOR$_FK1" FOREIGN KEY ("ASSIGN_RULE_SET_ID#")
	  REFERENCES "DVSYS"."RULE_SET$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."COMMAND_RULE$" ADD CONSTRAINT "COMMAND_RULE$_FK" FOREIGN KEY ("RULE_SET_ID#")
	  REFERENCES "DVSYS"."RULE_SET$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."COMMAND_RULE$" ADD CONSTRAINT "COMMAND_RULE$_FK1" FOREIGN KEY ("CODE_ID#")
	  REFERENCES "DVSYS"."CODE$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."FACTOR_LINK$" ADD CONSTRAINT "FACTOR_LINK$_FK" FOREIGN KEY ("PARENT_FACTOR_ID#")
	  REFERENCES "DVSYS"."FACTOR$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."FACTOR_LINK$" ADD CONSTRAINT "FACTOR_LINK$_FK1" FOREIGN KEY ("CHILD_FACTOR_ID#")
	  REFERENCES "DVSYS"."FACTOR$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."ROLE$" ADD CONSTRAINT "ROLE$_FK" FOREIGN KEY ("RULE_SET_ID#")
	  REFERENCES "DVSYS"."RULE_SET$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."IDENTITY$" ADD CONSTRAINT "IDENTITY$_FK" FOREIGN KEY ("FACTOR_ID#")
	  REFERENCES "DVSYS"."FACTOR$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."IDENTITY_MAP$" ADD CONSTRAINT "IDENTITY_MAP$_FK" FOREIGN KEY ("IDENTITY_ID#")
	  REFERENCES "DVSYS"."IDENTITY$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."IDENTITY_MAP$" ADD CONSTRAINT "IDENTITY_MAP$_FK1" FOREIGN KEY ("FACTOR_LINK_ID#")
	  REFERENCES "DVSYS"."FACTOR_LINK$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."IDENTITY_MAP$" ADD CONSTRAINT "IDENTITY_MAP$_FK2" FOREIGN KEY ("OPERATION_CODE_ID#")
	  REFERENCES "DVSYS"."CODE$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."POLICY_LABEL$" ADD CONSTRAINT "IDENTITY_LABEL$_FK" FOREIGN KEY ("IDENTITY_ID#")
	  REFERENCES "DVSYS"."IDENTITY$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."RULE_SET_RULE$" ADD CONSTRAINT "RULE_SET_RULE$_FK" FOREIGN KEY ("RULE_SET_ID#")
	  REFERENCES "DVSYS"."RULE_SET$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."RULE_SET_RULE$" ADD CONSTRAINT "RULE_SET_RULE$_FK1" FOREIGN KEY ("RULE_ID#")
	  REFERENCES "DVSYS"."RULE$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."REALM_OBJECT$" ADD CONSTRAINT "REALM_OBJECT$_FK" FOREIGN KEY ("REALM_ID#")
	  REFERENCES "DVSYS"."REALM$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."REALM_AUTH$" ADD CONSTRAINT "REALM_AUTH$_FK" FOREIGN KEY ("REALM_ID#")
	  REFERENCES "DVSYS"."REALM$" ("ID#") ENABLE;

ALTER TABLE "DVSYS"."REALM_AUTH$" ADD CONSTRAINT "REALM_AUTH$_FK1" FOREIGN KEY ("AUTH_RULE_SET_ID#")
	  REFERENCES "DVSYS"."RULE_SET$" ("ID#") ENABLE;

