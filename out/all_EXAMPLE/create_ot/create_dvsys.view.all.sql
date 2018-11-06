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

