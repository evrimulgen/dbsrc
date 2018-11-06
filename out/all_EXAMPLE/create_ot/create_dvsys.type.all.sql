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

