-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."OLS$TRUSTED_PROGS" ("POL#",
"OWNER",
"PGM_NAME",
"PRIVS",
"POL_NAME",
"PACKAGE") AS
  SELECT l.pol#, l.owner, l.pgm_name, l.privs,
         po.pol_name, po.package
  FROM LBACSYS.ols$prog l, LBACSYS.ols$pol po
  where l.pol#=po.pol#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."OLS$POLICY_COLUMNS" ("OWNER",
"TABLE_NAME",
"COLUMN_NAME",
"COLUMN_DATA_TYPE") AS
  SELECT u.name, o.name,
       c.name,
       decode(c.type#, 2, decode(c.scale, null,
                                 decode(c.precision#, null, 'NUMBER'),
                                 'NUMBER'),
                       58, 'OPAQUE')
FROM sys.col$ c, sys.obj$ o, sys."_BASE_USER" u,
     sys.coltype$ ac, sys.obj$ ot
WHERE o.obj# = c.obj#
  AND o.owner# = u.user#
  AND c.obj# = ac.obj#(+) AND c.intcol# = ac.intcol#(+)
  AND ac.toid = ot.oid$(+)
  AND ot.type#(+) = 13
  AND o.type# =  2;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_LBAC_POLICIES" ("POLICY_NAME",
"COLUMN_NAME",
"PACKAGE",
"STATUS",
"POLICY_OPTIONS",
"POLICY_SUBSCRIBED") AS
  SELECT pol_name,
         column_name, package,
         DECODE(bitand(flags,1),0,'DISABLED',1,'ENABLED','ERROR'),
         LBACSYS.lbac_cache.option_string(options),
         DECODE(bitand(flags,16),0,'FALSE',16,'TRUE','ERROR')
  FROM LBACSYS.ols$pol;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_LBAC_POLICIES"  CONTAINER_DATA
 ("POLICY_NAME",
"COLUMN_NAME",
"PACKAGE",
"STATUS",
"POLICY_OPTIONS",
"POLICY_SUBSCRIBED",
"CON_ID") AS
  SELECT "POLICY_NAME","COLUMN_NAME","PACKAGE","STATUS","POLICY_OPTIONS","POLICY_SUBSCRIBED","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_LBAC_POLICIES");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_LBAC_SCHEMA_POLICIES" ("POLICY_NAME",
"SCHEMA_NAME",
"STATUS",
"SCHEMA_OPTIONS") AS
  SELECT pol_name AS policy_name, owner AS schema_name,
  DECODE(bitand(s.flags,1),0,'DISABLED',1,'ENABLED','ERROR') AS status,
  LBACSYS.lbac_cache.option_string(s.options) AS schema_options
  FROM LBACSYS.ols$pol p, LBACSYS.ols$pols s
  WHERE p.pol# = s.pol#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_LBAC_SCHEMA_POLICIES"  CONTAINER_DATA
 ("POLICY_NAME",
"SCHEMA_NAME",
"STATUS",
"SCHEMA_OPTIONS",
"CON_ID") AS
  SELECT "POLICY_NAME","SCHEMA_NAME","STATUS","SCHEMA_OPTIONS","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_LBAC_SCHEMA_POLICIES");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_LBAC_TABLE_POLICIES" ("POLICY_NAME",
"SCHEMA_NAME",
"TABLE_NAME",
"STATUS",
"TABLE_OPTIONS",
"FUNCTION",
"PREDICATE") AS
  SELECT pol_name AS policy_name, owner AS schema_name,
         tbl_name AS table_name,
         DECODE(bitand(t.flags,1),0,'DISABLED',1,'ENABLED','ERROR') AS
         status,
         LBACSYS.lbac_cache.option_string(t.options) AS table_options,
         function,
         predicate
  FROM LBACSYS.ols$pol p, LBACSYS.ols$polt t
  WHERE p.pol# = t.pol#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_LBAC_TABLE_POLICIES"  CONTAINER_DATA
 ("POLICY_NAME",
"SCHEMA_NAME",
"TABLE_NAME",
"STATUS",
"TABLE_OPTIONS",
"FUNCTION",
"PREDICATE",
"CON_ID") AS
  SELECT "POLICY_NAME","SCHEMA_NAME","TABLE_NAME","STATUS","TABLE_OPTIONS","FUNCTION","PREDICATE","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_LBAC_TABLE_POLICIES");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_POLICIES" ("POLICY_NAME",
"COLUMN_NAME",
"STATUS",
"POLICY_OPTIONS",
"POLICY_SUBSCRIBED") AS
  SELECT policy_name, column_name, status, policy_options, policy_subscribed
   FROM LBACSYS.dba_lbac_policies
   WHERE package = 'LBAC$SA';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_POLICIES"  CONTAINER_DATA
 ("POLICY_NAME",
"COLUMN_NAME",
"STATUS",
"POLICY_OPTIONS",
"POLICY_SUBSCRIBED",
"CON_ID") AS
  SELECT "POLICY_NAME","COLUMN_NAME","STATUS","POLICY_OPTIONS","POLICY_SUBSCRIBED","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_POLICIES");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_SCHEMA_POLICIES" ("POLICY_NAME",
"SCHEMA_NAME",
"STATUS",
"SCHEMA_OPTIONS") AS
  SELECT s.policy_name, schema_name, s.status, schema_options
  FROM LBACSYS.dba_lbac_policies p, LBACSYS.dba_lbac_schema_policies s
  WHERE p.policy_name=s.policy_name
    AND p.package='LBAC$SA';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_SCHEMA_POLICIES"  CONTAINER_DATA
 ("POLICY_NAME",
"SCHEMA_NAME",
"STATUS",
"SCHEMA_OPTIONS",
"CON_ID") AS
  SELECT "POLICY_NAME","SCHEMA_NAME","STATUS","SCHEMA_OPTIONS","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_SCHEMA_POLICIES");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_TABLE_POLICIES" ("POLICY_NAME",
"SCHEMA_NAME",
"TABLE_NAME",
"STATUS",
"TABLE_OPTIONS",
"FUNCTION",
"PREDICATE") AS
  SELECT t.policy_name, schema_name, table_name, t.status,
         table_options, function, predicate
  FROM LBACSYS.dba_lbac_policies p, LBACSYS.dba_lbac_table_policies t
  WHERE p.policy_name=t.policy_name
    AND p.package='LBAC$SA';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_TABLE_POLICIES"  CONTAINER_DATA
 ("POLICY_NAME",
"SCHEMA_NAME",
"TABLE_NAME",
"STATUS",
"TABLE_OPTIONS",
"FUNCTION",
"PREDICATE",
"CON_ID") AS
  SELECT "POLICY_NAME","SCHEMA_NAME","TABLE_NAME","STATUS","TABLE_OPTIONS","FUNCTION","PREDICATE","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_TABLE_POLICIES");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."SA$POL" ("POL#",
"POL_NAME",
"COLUMN_NAME",
"STATUS",
"POLICY_OPTIONS",
"ADMIN_ROLE") AS
  SELECT pol#,
       pol_name,
       column_name,
       DECODE(bitand(flags,1),0,'DISABLED',1,'ENABLED','ERROR') AS status,
       lbac_cache.option_string(options) AS policy_options,
       pol_role as Admin_Role
  FROM LBACSYS.ols$pol
 WHERE package = 'LBAC$SA';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."SA$ADMIN" ("POL#",
"POL_NAME",
"ADMIN_ROLE",
"USR_NAME") AS
  SELECT POL#, pol_name, granted_role admin_role, R.grantee usr_name
  FROM LBACSYS.ols$pol P,
       dba_role_privs R
 WHERE P.package = 'LBAC$SA'
   AND R.granted_role = P.pol_role;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_POLICIES" ("POLICY_NAME",
"COLUMN_NAME",
"STATUS",
"POLICY_OPTIONS") AS
  SELECT p.pol_name as policy_name, p.column_name, p.status, p.policy_options
     FROM LBACSYS.sa$pol p
    WHERE pol# in (select pol# from LBACSYS.sa$admin where usr_name=user);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_SCHEMA_POLICIES" ("POLICY_NAME",
"SCHEMA_NAME",
"STATUS",
"SCHEMA_OPTIONS") AS
  SELECT s.policy_name, schema_name, s.status, schema_options
    FROM LBACSYS.sa$pol p, LBACSYS.dba_lbac_schema_policies s
   WHERE p.pol_name = s.policy_name
     AND pol# in (select pol# from LBACSYS.sa$admin where usr_name=user);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_TABLE_POLICIES" ("POLICY_NAME",
"SCHEMA_NAME",
"TABLE_NAME",
"STATUS",
"TABLE_OPTIONS",
"FUNCTION",
"PREDICATE") AS
  SELECT t.policy_name, schema_name, table_name, t.status,
         table_options, function, predicate
    FROM LBACSYS.sa$pol p, LBACSYS.dba_lbac_table_policies t
   WHERE p.pol_name=t.policy_name
     AND pol# in (select pol# from LBACSYS.sa$admin where usr_name=user);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_LBAC_DATA_LABELS" ("POLICY_NAME",
"LABEL",
"LABEL_TAG") AS
  SELECT pol_name AS policy_name,
         slabel AS label,
         nlabel AS label_tag
  FROM LBACSYS.ols$lab l, LBACSYS.ols$pol p
  WHERE p.pol# = l.pol# AND BITAND(l.flags,1)=1;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_LBAC_DATA_LABELS"  CONTAINER_DATA
 ("POLICY_NAME",
"LABEL",
"LABEL_TAG",
"CON_ID") AS
  SELECT "POLICY_NAME","LABEL","LABEL_TAG","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_LBAC_DATA_LABELS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_LBAC_LABELS" ("POLICY_NAME",
"LABEL",
"LABEL_TAG",
"LABEL_TYPE") AS
  SELECT pol_name AS policy_name,
         slabel AS label,
         nlabel AS label_tag,
         DECODE (l.flags,2,'USER LABEL',
                 3, 'USER/DATA LABEL', 'UNDEFINED') AS label_type
  FROM LBACSYS.ols$lab l, LBACSYS.ols$pol p
  WHERE p.pol# = l.pol#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_LBAC_LABELS"  CONTAINER_DATA
 ("POLICY_NAME",
"LABEL",
"LABEL_TAG",
"LABEL_TYPE",
"CON_ID") AS
  SELECT "POLICY_NAME","LABEL","LABEL_TAG","LABEL_TYPE","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_LBAC_LABELS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_LBAC_LABEL_TAGS" ("POLICY_NAME",
"LABELVALUE",
"LABELTAG",
"LABELTYPE") AS
  SELECT pol_name AS policy_name,
         slabel AS labelvalue,
         nlabel AS labeltag,
         DECODE (l.flags,2,'USER LABEL',
                 3, 'USER/DATA LABEL','UNDEFINED') AS
         labeltype
  FROM LBACSYS.ols$lab l, LBACSYS.ols$pol p
  WHERE p.pol# = l.pol#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_LBAC_LABEL_TAGS"  CONTAINER_DATA
 ("POLICY_NAME",
"LABELVALUE",
"LABELTAG",
"LABELTYPE",
"CON_ID") AS
  SELECT "POLICY_NAME","LABELVALUE","LABELTAG","LABELTYPE","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_LBAC_LABEL_TAGS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_LABELS" ("POLICY_NAME",
"LABEL",
"LABEL_TAG",
"LABEL_TYPE") AS
  SELECT p.pol_name AS policy_name,
         l.slabel AS label,
         l.nlabel AS label_tag,
         DECODE (l.flags,2,'USER LABEL',
                 3, 'USER/DATA LABEL', 'UNDEFINED') AS label_type
  FROM LBACSYS.ols$lab l, LBACSYS.ols$pol p
  WHERE p.pol# = l.pol#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_LABELS"  CONTAINER_DATA
 ("POLICY_NAME",
"LABEL",
"LABEL_TAG",
"LABEL_TYPE",
"CON_ID") AS
  SELECT "POLICY_NAME","LABEL","LABEL_TAG","LABEL_TYPE","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_LABELS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_DATA_LABELS" ("POLICY_NAME",
"LABEL",
"LABEL_TAG") AS
  SELECT l.policy_name, label, label_tag
   FROM LBACSYS.dba_lbac_data_labels l, LBACSYS.dba_lbac_policies p
   WHERE l.policy_name = p.policy_name AND
         p.package = 'LBAC$SA';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_DATA_LABELS"  CONTAINER_DATA
 ("POLICY_NAME",
"LABEL",
"LABEL_TAG",
"CON_ID") AS
  SELECT "POLICY_NAME","LABEL","LABEL_TAG","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_DATA_LABELS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_LEVELS" ("POLICY_NAME",
"LEVEL_NUM",
"SHORT_NAME",
"LONG_NAME") AS
  SELECT p.pol_name AS policy_name, l.level# AS level_num,
          l.code AS short_name, l.name AS long_name
   FROM LBACSYS.ols$pol p, LBACSYS.ols$levels l
   WHERE p.pol# = l.pol#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_LEVELS"  CONTAINER_DATA
 ("POLICY_NAME",
"LEVEL_NUM",
"SHORT_NAME",
"LONG_NAME",
"CON_ID") AS
  SELECT "POLICY_NAME","LEVEL_NUM","SHORT_NAME","LONG_NAME","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_LEVELS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_COMPARTMENTS" ("POLICY_NAME",
"COMP_NUM",
"SHORT_NAME",
"LONG_NAME") AS
  SELECT p.pol_name AS policy_name, c.comp# AS comp_num,
          c.code AS short_name, c.name AS long_name
   FROM LBACSYS.ols$pol p, LBACSYS.ols$compartments c
   WHERE p.pol# = c.pol#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_COMPARTMENTS"  CONTAINER_DATA
 ("POLICY_NAME",
"COMP_NUM",
"SHORT_NAME",
"LONG_NAME",
"CON_ID") AS
  SELECT "POLICY_NAME","COMP_NUM","SHORT_NAME","LONG_NAME","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_COMPARTMENTS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_GROUPS" ("POLICY_NAME",
"GROUP_NUM",
"SHORT_NAME",
"LONG_NAME",
"PARENT_NUM",
"PARENT_NAME") AS
  SELECT p.pol_name AS policy_name, g.group# AS group_num,
          g.code AS short_name, g.name AS long_name,
          g.parent# AS parent_num, pg.code AS parent_name
   FROM LBACSYS.ols$pol p, LBACSYS.ols$groups g, LBACSYS.ols$groups pg
   WHERE p.pol# = g.pol# AND
         g.pol# = pg.pol# (+) AND
         g.parent# = pg.group#(+);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_GROUPS"  CONTAINER_DATA
 ("POLICY_NAME",
"GROUP_NUM",
"SHORT_NAME",
"LONG_NAME",
"PARENT_NUM",
"PARENT_NAME",
"CON_ID") AS
  SELECT "POLICY_NAME","GROUP_NUM","SHORT_NAME","LONG_NAME","PARENT_NUM","PARENT_NAME","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_GROUPS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_GROUP_HIERARCHY" ("POLICY_NAME",
"HIERARCHY_LEVEL",
"GROUP_NAME") AS
  SELECT l.pol_name AS policy_name, g.hierarchy_level, g.group_name
   FROM ( SELECT LEVEL AS hierarchy_level,
            RPAD(' ',2*LEVEL,' ') || code || ' - ' ||  name AS group_name,
            pol#
        FROM LBACSYS.ols$groups
        CONNECT BY PRIOR pol#=pol# AND PRIOR group#=parent#
        START WITH parent# IS NULL) g, ols$pol l
   WHERE g.pol#=l.pol#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_GROUP_HIERARCHY"  CONTAINER_DATA
 ("POLICY_NAME",
"HIERARCHY_LEVEL",
"GROUP_NAME",
"CON_ID") AS
  SELECT "POLICY_NAME","HIERARCHY_LEVEL","GROUP_NAME","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_GROUP_HIERARCHY");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_USER_LEVELS" ("POLICY_NAME",
"USER_NAME",
"MAX_LEVEL",
"MIN_LEVEL",
"DEF_LEVEL",
"ROW_LEVEL") AS
  SELECT DISTINCT p.pol_name AS policy_name,
          ul.usr_name AS user_name,
          lmax.code AS max_level,
          lmin.code AS min_level,
          ldef.code AS def_level,
          lrow.code AS row_level
   FROM LBACSYS.ols$pol p, LBACSYS.ols$user_levels ul,
        LBACSYS.ols$levels lmax, LBACSYS.ols$levels lmin,
        LBACSYS.ols$levels ldef, LBACSYS.ols$levels lrow
   WHERE p.pol#=ul.pol# AND
         ul.pol#=lmax.pol# AND
         ul.pol#=lmin.pol# AND
         ul.pol#=ldef.pol# AND
         ul.pol#=lrow.pol# AND
         ul.max_level = lmax.level# AND
         ul.min_level = lmin.level# AND
         ul.def_level = ldef.level# AND
         ul.row_level = lrow.level#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_USER_LEVELS"  CONTAINER_DATA
 ("POLICY_NAME",
"USER_NAME",
"MAX_LEVEL",
"MIN_LEVEL",
"DEF_LEVEL",
"ROW_LEVEL",
"CON_ID") AS
  SELECT "POLICY_NAME","USER_NAME","MAX_LEVEL","MIN_LEVEL","DEF_LEVEL","ROW_LEVEL","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_USER_LEVELS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_USER_COMPARTMENTS" ("POLICY_NAME",
"USER_NAME",
"COMP",
"RW_ACCESS",
"DEF_COMP",
"ROW_COMP") AS
  SELECT p.pol_name AS policy_name, uc.usr_name AS user_name,
        c.code AS comp, DECODE(uc.rw_access,'1','WRITE','READ') AS rw_access,
        uc.def_comp, uc.row_comp
   FROM LBACSYS.ols$pol p, LBACSYS.ols$user_compartments uc,
        LBACSYS.ols$compartments c
   WHERE p.pol#=uc.pol# AND uc.pol#=c.pol# AND uc.comp# = c.comp#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_USER_COMPARTMENTS"  CONTAINER_DATA
 ("POLICY_NAME",
"USER_NAME",
"COMP",
"RW_ACCESS",
"DEF_COMP",
"ROW_COMP",
"CON_ID") AS
  SELECT "POLICY_NAME","USER_NAME","COMP","RW_ACCESS","DEF_COMP","ROW_COMP","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_USER_COMPARTMENTS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_USER_GROUPS" ("POLICY_NAME",
"USER_NAME",
"GRP",
"RW_ACCESS",
"DEF_GROUP",
"ROW_GROUP") AS
  SELECT p.pol_name AS policy_name, ug.usr_name AS user_name,
        g.code AS grp, DECODE(ug.rw_access,'1','WRITE','READ') AS rw_access,
        ug.def_group, ug.row_group
   FROM LBACSYS.ols$pol p, LBACSYS.ols$user_groups ug, LBACSYS.ols$groups g
   WHERE p.pol#=ug.pol# AND ug.pol#=g.pol# AND ug.group# = g.group#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_USER_GROUPS"  CONTAINER_DATA
 ("POLICY_NAME",
"USER_NAME",
"GRP",
"RW_ACCESS",
"DEF_GROUP",
"ROW_GROUP",
"CON_ID") AS
  SELECT "POLICY_NAME","USER_NAME","GRP","RW_ACCESS","DEF_GROUP","ROW_GROUP","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_USER_GROUPS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_OLS_USERS" ("USER_NAME",
"POLICY_NAME",
"USER_PRIVILEGES",
"LABEL1",
"LABEL2",
"LABEL3",
"LABEL4",
"LABEL5",
"LABEL6") AS
  SELECT usr_name AS user_name,
         pol_name AS policy_name,
         LBACSYS.sa_user_admin.privs_to_char(pf.privs) AS user_privileges,
         lbac$sa_labels.from_label(pf.max_read) AS LABEL1,
         lbac$sa_labels.from_label(pf.max_write) AS LABEL2,
         lbac$sa_labels.from_label(pf.min_write) AS LABEL3,
         lbac$sa_labels.from_label(pf.def_read) AS LABEL4,
         lbac$sa_labels.from_label(pf.def_write) AS LABEL5,
         lbac$sa_labels.from_label(pf.def_row) AS LABEL6
  FROM LBACSYS.ols$pol p, LBACSYS.ols$user u, LBACSYS.ols$profile pf
  WHERE p.pol# = u.pol# AND p.pol# = pf.pol#
    AND u.pol# = pf.pol# AND u.profid = pf.profid;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_OLS_USERS"  CONTAINER_DATA
 ("USER_NAME",
"POLICY_NAME",
"USER_PRIVILEGES",
"LABEL1",
"LABEL2",
"LABEL3",
"LABEL4",
"LABEL5",
"LABEL6",
"CON_ID") AS
  SELECT "USER_NAME","POLICY_NAME","USER_PRIVILEGES","LABEL1","LABEL2","LABEL3","LABEL4","LABEL5","LABEL6","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_OLS_USERS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_USERS" ("USER_NAME",
"POLICY_NAME",
"USER_PRIVILEGES",
"USER_LABELS",
"MAX_READ_LABEL",
"MAX_WRITE_LABEL",
"MIN_WRITE_LABEL",
"DEFAULT_READ_LABEL",
"DEFAULT_WRITE_LABEL",
"DEFAULT_ROW_LABEL") AS
  SELECT user_name,  u.policy_name, user_privileges,
         'MAX READ LABEL=''' || LABEL1 || ''',MAX WRITE LABEL=''' || LABEL2
         || ''',MIN WRITE LABEL=''' || LABEL3 || ''',DEFAULT READ LABEL='''
         || LABEL4 || ''',DEFAULT WRITE LABEL=''' || LABEL5
         || ''',DEFAULT ROW LABEL=''' || LABEL6 || ''''
    AS user_labels,
         LABEL1 AS MAX_READ_LABEL, LABEL2 AS MAX_WRITE_LABEL,
         LABEL3 AS MIN_WRITE_LABEL , LABEL4 AS DEFAULT_READ_LABEL,
         LABEL5 AS DEFAULT_WRITE_LABEL, LABEL6 AS DEFAULT_ROW_LABEL
  FROM LBACSYS.dba_lbac_policies p, LBACSYS.dba_ols_users u
  WHERE p.policy_name=u.policy_name;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_USERS"  CONTAINER_DATA
 ("USER_NAME",
"POLICY_NAME",
"USER_PRIVILEGES",
"USER_LABELS",
"MAX_READ_LABEL",
"MAX_WRITE_LABEL",
"MIN_WRITE_LABEL",
"DEFAULT_READ_LABEL",
"DEFAULT_WRITE_LABEL",
"DEFAULT_ROW_LABEL",
"CON_ID") AS
  SELECT "USER_NAME","POLICY_NAME","USER_PRIVILEGES","USER_LABELS","MAX_READ_LABEL","MAX_WRITE_LABEL","MIN_WRITE_LABEL","DEFAULT_READ_LABEL","DEFAULT_WRITE_LABEL","DEFAULT_ROW_LABEL","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_USERS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_USER_LABELS" ("USER_NAME",
"POLICY_NAME",
"LABELS",
"MAX_READ_LABEL",
"MAX_WRITE_LABEL",
"MIN_WRITE_LABEL",
"DEFAULT_READ_LABEL",
"DEFAULT_WRITE_LABEL",
"DEFAULT_ROW_LABEL") AS
  SELECT user_name,policy_name, user_labels as labels,
         MAX_READ_LABEL, MAX_WRITE_LABEL, MIN_WRITE_LABEL,
         DEFAULT_READ_LABEL, DEFAULT_WRITE_LABEL, DEFAULT_ROW_LABEL
  FROM LBACSYS.dba_sa_users
  WHERE MAX_READ_LABEL IS NOT NULL;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_USER_LABELS"  CONTAINER_DATA
 ("USER_NAME",
"POLICY_NAME",
"LABELS",
"MAX_READ_LABEL",
"MAX_WRITE_LABEL",
"MIN_WRITE_LABEL",
"DEFAULT_READ_LABEL",
"DEFAULT_WRITE_LABEL",
"DEFAULT_ROW_LABEL",
"CON_ID") AS
  SELECT "USER_NAME","POLICY_NAME","LABELS","MAX_READ_LABEL","MAX_WRITE_LABEL","MIN_WRITE_LABEL","DEFAULT_READ_LABEL","DEFAULT_WRITE_LABEL","DEFAULT_ROW_LABEL","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_USER_LABELS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_USER_PRIVS" ("USER_NAME",
"POLICY_NAME",
"USER_PRIVILEGES") AS
  SELECT user_name,
         policy_name,
         user_privileges
  FROM LBACSYS.dba_sa_users
  WHERE user_privileges IS NOT NULL;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_USER_PRIVS"  CONTAINER_DATA
 ("USER_NAME",
"POLICY_NAME",
"USER_PRIVILEGES",
"CON_ID") AS
  SELECT "USER_NAME","POLICY_NAME","USER_PRIVILEGES","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_USER_PRIVS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_PROGRAMS" ("SCHEMA_NAME",
"PROGRAM_NAME",
"POLICY_NAME",
"PROG_PRIVILEGES",
"PROG_LABELS") AS
  SELECT owner as schema_name, pgm_name AS program_name,
         pol_name AS policy_name,
         LBACSYS.sa_user_admin.privs_to_char(privs) AS prog_privileges,
         '             ' as prog_labels
  FROM LBACSYS.ols$pol p, LBACSYS.ols$prog g
  WHERE p.pol# = g.pol#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_PROGRAMS"  CONTAINER_DATA
 ("SCHEMA_NAME",
"PROGRAM_NAME",
"POLICY_NAME",
"PROG_PRIVILEGES",
"PROG_LABELS",
"CON_ID") AS
  SELECT "SCHEMA_NAME","PROGRAM_NAME","POLICY_NAME","PROG_PRIVILEGES","PROG_LABELS","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_PROGRAMS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_PROG_PRIVS" ("SCHEMA_NAME",
"PROGRAM_NAME",
"POLICY_NAME",
"PROGRAM_PRIVILEGES") AS
  SELECT owner as schema_name, pgm_name AS program_name,
         pol_name AS policy_name,
         LBACSYS.sa_user_admin.privs_to_char(privs) AS program_privileges
  FROM LBACSYS.ols$pol p, LBACSYS.ols$prog g
  WHERE p.pol# = g.pol#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_PROG_PRIVS"  CONTAINER_DATA
 ("SCHEMA_NAME",
"PROGRAM_NAME",
"POLICY_NAME",
"PROGRAM_PRIVILEGES",
"CON_ID") AS
  SELECT "SCHEMA_NAME","PROGRAM_NAME","POLICY_NAME","PROGRAM_PRIVILEGES","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_PROG_PRIVS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_LABELS" ("POLICY_NAME",
"LABEL",
"LABEL_TAG",
"LABEL_TYPE") AS
  SELECT p.pol_name AS policy_name,
         l.slabel   AS label,
         l.nlabel   AS label_tag,
         DECODE (l.flags,2,'USER LABEL',
                 3, 'USER/DATA LABEL', 'UNDEFINED') AS label_type
   FROM LBACSYS.ols$lab l, LBACSYS.sa$pol p
  WHERE p.pol# = l.pol#
    AND (p.pol# in (select pol# from LBACSYS.sa$admin where usr_name=user)
         OR
         LBACSYS.lbac$sa.enforce_read(p.pol_name, l.ilabel)>0);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_DATA_LABELS" ("POLICY_NAME",
"LABEL",
"LABEL_TAG") AS
  SELECT p.pol_name AS policy_name,
         l.slabel   AS label,
         l.nlabel   AS label_tag
   FROM LBACSYS.ols$lab l, LBACSYS.sa$pol p
  WHERE p.pol# = l.pol#
    AND BITAND(l.flags, 1) = 1
    AND (p.pol# in (select pol# from LBACSYS.sa$admin where usr_name = user)
         OR
         lbacsys.lbac$sa.enforce_read(p.pol_name, l.ilabel)>0);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_LEVELS" ("POLICY_NAME",
"LEVEL_NUM",
"SHORT_NAME",
"LONG_NAME") AS
  SELECT p.pol_name as policy_name, l.level# AS level_num,
          l.code AS short_name, l.name AS long_name
     FROM LBACSYS.sa$pol p, LBACSYS.ols$levels l
    WHERE p.pol# = l.pol#
      AND p.pol# in (select pol# from LBACSYS.sa$admin where usr_name=user)
    UNION
   SELECT p.pol_name as policy_name, l.level# AS level_num,
          l.code AS short_name, l.name AS long_name
     FROM LBACSYS.sa$pol p, LBACSYS.ols$levels l, LBACSYS.ols$user_levels ul
    WHERE p.pol# = l.pol#
      and l.pol# = ul.pol#
      and l.level# <= ul.max_level
      and
      ul.usr_name = sa_session.sa_user_name(lbac_cache.policy_name(ul.pol#));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_COMPARTMENTS" ("POLICY_NAME",
"COMP_NUM",
"SHORT_NAME",
"LONG_NAME") AS
  SELECT p.pol_name as policy_name, c.comp# AS comp_num,
          c.code AS short_name, c.name AS long_name
     FROM LBACSYS.sa$pol p, LBACSYS.ols$compartments c
    WHERE p.pol# = c.pol#
      and (p.pol# in (select pol# from LBACSYS.sa$admin where usr_name=user)
           OR
          (c.pol#,c.comp#) in (select pol#,comp#
                               from LBACSYS.ols$user_compartments
                               where usr_name = sa_session.sa_user_name(
                                             lbac_cache.policy_name(pol#))));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_GROUPS" ("POLICY_NAME",
"GROUP_NUM",
"SHORT_NAME",
"LONG_NAME",
"PARENT_NUM",
"PARENT_NAME") AS
  SELECT p.pol_name as policy_name, g.group# AS group_num,
          g.code AS short_name, g.name AS long_name,
          g.parent# AS parent_num, pg.code AS parent_name
     FROM LBACSYS.sa$pol p, LBACSYS.ols$groups g, LBACSYS.ols$groups pg
    WHERE p.pol# = g.pol#
      AND g.pol# = pg.pol# (+)
      AND g.parent# = pg.group#(+)
      and (p.pol# in (select pol# from LBACSYS.sa$admin where usr_name=user)
           OR
          (g.pol#,g.group#) in (select pol#,group#
                                from LBACSYS.ols$user_groups
                                where usr_name = sa_session.sa_user_name(
                                             lbac_cache.policy_name(pol#))));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_GROUP_HIERARCHY" ("POLICY_NAME",
"HIERARCHY_LEVEL",
"GROUP_NAME") AS
  SELECT p.pol_name as policy_name, g.hierarchy_level, g.group_name
     FROM (SELECT LEVEL AS hierarchy_level,
               RPAD(' ',2*LEVEL,' ') || code || ' - ' ||  name AS group_name,
               pol#
             FROM LBACSYS.ols$groups
                  CONNECT BY PRIOR pol#=pol# AND PRIOR group#=parent#
            START WITH ((pol# in (select pol# from LBACSYS.sa$admin
                                  where usr_name=user)
                         and parent# IS NULL)
                        or
                        (pol#,group#) in
                        (select pol#,group# from LBACSYS.ols$user_groups
                          where usr_name = sa_session.sa_user_name(
                                           lbac_cache.policy_name(pol#))))
          ) g,
          sa$pol p
    WHERE g.pol#=p.pol#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_USER_LEVELS" ("POLICY_NAME",
"USER_NAME",
"MAX_LEVEL",
"MIN_LEVEL",
"DEF_LEVEL",
"ROW_LEVEL") AS
  SELECT DISTINCT p.pol_name AS policy_name,
          ul.usr_name AS user_name,
          lmax.code AS max_level,
          lmin.code AS min_level,
          ldef.code AS def_level,
          lrow.code AS row_level
     FROM LBACSYS.sa$pol p, LBACSYS.ols$user_levels ul,
          LBACSYS.ols$levels lmax, LBACSYS.ols$levels lmin,
          LBACSYS.ols$levels ldef, LBACSYS.ols$levels lrow
    WHERE p.pol#=ul.pol#
      AND ul.pol#=lmax.pol#
      AND ul.pol#=lmin.pol#
      AND ul.pol#=ldef.pol#
      AND ul.pol#=lrow.pol#
      AND ul.max_level = lmax.level#
      AND ul.min_level = lmin.level#
      AND ul.def_level = ldef.level#
      AND ul.row_level = lrow.level#
      AND (p.pol# in (select pol# from LBACSYS.sa$admin where usr_name=user)
           or
           ul.usr_name = sa_session.sa_user_name(lbac_cache.policy_name(p.pol#)));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_USER_COMPARTMENTS" ("POLICY_NAME",
"USER_NAME",
"COMP",
"RW_ACCESS",
"DEF_COMP",
"ROW_COMP") AS
  SELECT p.pol_name AS policy_name, uc.usr_name AS user_name,
          c.code AS comp, DECODE(uc.rw_access,'1','WRITE','READ') AS rw_access,
          uc.def_comp, uc.row_comp
     FROM LBACSYS.sa$pol p, LBACSYS.ols$user_compartments uc,
          LBACSYS.ols$compartments c
    WHERE p.pol#=uc.pol#
      AND uc.pol#=c.pol#
      AND uc.comp# = c.comp#
      AND (p.pol# in (select pol# from LBACSYS.sa$admin where usr_name=user)
           or
           uc.usr_name = sa_session.sa_user_name(lbac_cache.policy_name(p.pol#)));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_USER_GROUPS" ("POLICY_NAME",
"USER_NAME",
"GRP",
"RW_ACCESS",
"DEF_GROUP",
"ROW_GROUP") AS
  SELECT p.pol_name AS policy_name, ug.usr_name AS user_name,
          g.code AS grp, DECODE(ug.rw_access,'1','WRITE','READ') AS rw_access,
          ug.def_group, ug.row_group
     FROM LBACSYS.sa$pol p, LBACSYS.ols$user_groups ug, LBACSYS.ols$groups g
    WHERE p.pol#=ug.pol#
      AND ug.pol#=g.pol#
      AND ug.group# = g.group#
      AND (p.pol# in (select pol# from LBACSYS.sa$admin where usr_name=user)
           or
           ug.usr_name = sa_session.sa_user_name(lbac_cache.policy_name(p.pol#)));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_USERS" ("USER_NAME",
"POLICY_NAME",
"USER_PRIVILEGES",
"USER_LABELS",
"MAX_READ_LABEL",
"MAX_WRITE_LABEL",
"MIN_WRITE_LABEL",
"DEFAULT_READ_LABEL",
"DEFAULT_WRITE_LABEL",
"DEFAULT_ROW_LABEL") AS
  SELECT user_name,  u.policy_name, user_privileges,
          'MAX READ LABEL=''' || LABEL1 || ''',MAX WRITE LABEL=''' || LABEL2
          || ''',MIN WRITE LABEL=''' || LABEL3 || ''',DEFAULT READ LABEL='''
          || LABEL4 || ''',DEFAULT WRITE LABEL=''' || LABEL5
          || ''',DEFAULT ROW LABEL=''' || LABEL6 || ''''
          AS user_labels,
          LABEL1 AS MAX_READ_LABEL, LABEL2 AS MAX_WRITE_LABEL,
          LABEL3 AS MIN_WRITE_LABEL , LABEL4 AS DEFAULT_READ_LABEL,
          LABEL5 AS DEFAULT_WRITE_LABEL, LABEL6 AS DEFAULT_ROW_LABEL
     FROM LBACSYS.sa$pol p, LBACSYS.dba_ols_users u
    WHERE p.pol_name=u.policy_name
      AND (p.pol# in (select pol# from LBACSYS.sa$admin where usr_name=user)
           or
           u.user_name = sa_session.sa_user_name(lbac_cache.policy_name(p.pol#)));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_USER_LABELS" ("USER_NAME",
"POLICY_NAME",
"LABELS",
"MAX_READ_LABEL",
"MAX_WRITE_LABEL",
"MIN_WRITE_LABEL",
"DEFAULT_READ_LABEL",
"DEFAULT_WRITE_LABEL",
"DEFAULT_ROW_LABEL") AS
  SELECT user_name,
          policy_name,
          user_labels as labels,
          MAX_READ_LABEL,
          MAX_WRITE_LABEL, MIN_WRITE_LABEL ,DEFAULT_READ_LABEL,
          DEFAULT_WRITE_LABEL ,  DEFAULT_ROW_LABEL
     FROM LBACSYS.all_sa_users
    WHERE MAX_READ_LABEL IS NOT NULL;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_PROGRAMS" ("SCHEMA_NAME",
"PROGRAM_NAME",
"POLICY_NAME",
"PROG_PRIVILEGES",
"PROG_LABELS") AS
  SELECT schema_name, program_name, p.policy_name, program_privileges as
          prog_privileges, NULL as prog_labels
     FROM LBACSYS.sa$pol, LBACSYS.dba_sa_prog_privs p
    WHERE pol_name=p.policy_name
      AND pol# in (select pol# from LBACSYS.sa$admin where usr_name=user);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_USER_PRIVS" ("USER_NAME",
"POLICY_NAME",
"USER_PRIVILEGES") AS
  SELECT user_name,
         policy_name,
         user_privileges
    FROM LBACSYS.all_sa_users
   WHERE user_privileges IS NOT NULL;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_PROG_PRIVS" ("SCHEMA_NAME",
"PROGRAM_NAME",
"POLICY_NAME",
"PROGRAM_PRIVILEGES") AS
  SELECT schema_name, program_name, policy_name,
         prog_privileges as program_privileges
    FROM LBACSYS.all_sa_programs
   WHERE prog_privileges IS NOT NULL;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."USER_SA_SESSION" ("POLICY_NAME",
"SA_USER_NAME",
"PRIVS",
"MAX_READ_LABEL",
"MAX_WRITE_LABEL",
"MIN_LEVEL",
"LABEL",
"COMP_WRITE",
"GROUP_WRITE",
"ROW_LABEL") AS
  SELECT p.pol_name AS policy_name,
         sa_session.sa_user_name(p.pol_name)    AS sa_user_name,
         sa_session.privs(p.pol_name)           AS privs,
         sa_session.max_read_label(p.pol_name)  AS max_read_label,
         sa_session.max_write_label(p.pol_name) AS max_write_label,
         sa_session.min_level(p.pol_name)       AS min_level,
         sa_session.label(p.pol_name)           AS label,
         sa_session.comp_write(p.pol_name)      AS comp_write,
         sa_session.group_write(p.pol_name)     AS group_write,
         sa_session.row_label(p.pol_name)       AS row_label
  FROM LBACSYS.ols$pol p
  WHERE p.package='LBAC$SA';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_OLS_AUDIT_OPTIONS" ("POLICY_NAME",
"USER_NAME",
"APY",
"REM",
"SET_",
"PRV") AS
  SELECT pol_name,
         usr_name,
decode(bitand(success,1), 0, '-', 1, decode(bitand(suc_type,1),0,'S',1,'A'), '-')
 || '/' ||
decode(bitand(failure,1), 0, '-',1,decode(bitand(fail_type,1),0,'S',1,'A'), '-'),
decode(bitand(success,2), 0, '-', 2, decode(bitand(suc_type,2),0,'S',2,'A'), '-')
 || '/' ||
decode(bitand(failure,2), 0, '-',2,decode(bitand(fail_type,2),0,'S',2,'A'), '-'),
decode(bitand(success,4), 0, '-', 4, decode(bitand(suc_type,4),0,'S',4,'A'), '-')
 || '/' ||
decode(bitand(failure,4), 0, '-', 4, decode(bitand(fail_type,4),0,'S',4,'A'), '-'),
decode(option_priv#, 0, '-', decode(success_priv, 0, '-',
                                                decode(suc_priv_type,0,'S','A')))
 || '/' ||
decode(option_priv#, 0, '-', decode(failure_priv, 0, '-',
                                               decode(fail_priv_type,0,'S','A')))
  FROM LBACSYS.ols$pol p, LBACSYS.ols$audit a
  WHERE p.pol# = a.pol#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_OLS_AUDIT_OPTIONS"  CONTAINER_DATA
 ("POLICY_NAME",
"USER_NAME",
"APY",
"REM",
"SET_",
"PRV",
"CON_ID") AS
  SELECT "POLICY_NAME","USER_NAME","APY","REM","SET_","PRV","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_OLS_AUDIT_OPTIONS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_SA_AUDIT_OPTIONS" ("POLICY_NAME",
"USER_NAME",
"APY",
"REM",
"SET_",
"PRV") AS
  SELECT a.policy_name, a.user_name, APY, REM, SET_, PRV
  FROM LBACSYS.dba_lbac_policies p, LBACSYS.dba_ols_audit_options a
  WHERE p.policy_name = a.policy_name AND
        p.package = 'LBAC$SA';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_SA_AUDIT_OPTIONS"  CONTAINER_DATA
 ("POLICY_NAME",
"USER_NAME",
"APY",
"REM",
"SET_",
"PRV",
"CON_ID") AS
  SELECT "POLICY_NAME","USER_NAME","APY","REM","SET_","PRV","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_SA_AUDIT_OPTIONS");

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."ALL_SA_AUDIT_OPTIONS" ("POLICY_NAME",
"USER_NAME",
"APY",
"REM",
"SET_",
"PRV") AS
  SELECT a.policy_name, a.user_name, APY, REM, SET_, PRV
    FROM LBACSYS.sa$pol p, LBACSYS.dba_ols_audit_options a
   WHERE p.pol_name = a.policy_name
     AND p.pol# in (select pol# from LBACSYS.sa$admin where usr_name=user);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."DBA_OLS_STATUS" ("NAME",
"STATUS",
"DESCRIPTION") AS
  SELECT DECODE(name, 'OLS_STATUS_FLAG', 'OLS_ENABLE_STATUS',
                      'OLS_CONFIGURED_FLAG','OLS_CONFIGURE_STATUS',
                      'OID_STATUS_FLAG','OLS_DIRECTORY_STATUS') AS name,
         DECODE(value$, '0', 'FALSE','TRUE') AS status,
         comment$ AS description
  FROM ols$props
  WHERE name IN ('OLS_STATUS_FLAG', 'OLS_CONFIGURED_FLAG', 'OID_STATUS_FLAG')
  ORDER BY name;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "LBACSYS"."CDB_OLS_STATUS"  CONTAINER_DATA
 ("NAME",
"STATUS",
"DESCRIPTION",
"CON_ID") AS
  SELECT "NAME","STATUS","DESCRIPTION","CON_ID" FROM CONTAINERS("LBACSYS"."DBA_OLS_STATUS");

