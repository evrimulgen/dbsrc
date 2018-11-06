-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_PARAMETERS" ("PAR_NAME",
"PAR_VALUE") AS
  select par_name, par_value
     from dr$parameter;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_CLASSES" ("CLA_NAME",
"CLA_DESCRIPTION") AS
  select  cla_name
          ,cla_desc  cla_description
     from  dr$class
    where  cla_system = 'N';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_OBJECTS" ("OBJ_CLASS",
"OBJ_NAME",
"OBJ_DESCRIPTION") AS
  select cla_name  obj_class,
       obj_name  obj_name,
       obj_desc  obj_description
  from dr$class,
       dr$object
 where cla_id     = obj_cla_id
   and obj_system = 'N'
   and cla_system = 'N';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_OBJECT_ATTRIBUTES" ("OAT_CLASS",
"OAT_OBJECT",
"OAT_ATTRIBUTE",
"OAT_DESCRIPTION",
"OAT_REQUIRED",
"OAT_STATIC",
"OAT_DATATYPE",
"OAT_DEFAULT",
"OAT_MIN",
"OAT_MAX",
"OAT_MAX_LENGTH") AS
  select cla_name      oat_class,
       obj_name      oat_object,
       oat_name      oat_attribute,
       oat_desc      oat_description,
       oat_required  oat_required,
       oat_static    oat_static,
       decode(oat_datatype,'S','STRING','I','INTEGER','B','BOOLEAN',
                           'P','PROCEDURE')
                     oat_datatype,
       oat_default   oat_default,
       oat_val_min   oat_min,
       decode(oat_datatype, 'S', null, oat_val_max) oat_max,
       decode(oat_datatype, 'S', oat_val_max, null) oat_max_length
  from dr$class,
       dr$object,
       dr$object_attribute
 where cla_id     = obj_cla_id
   and obj_cla_id = oat_cla_id
   and obj_id     = oat_obj_id
   and oat_system = 'N'
   and cla_system = 'N';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_OBJECT_ATTRIBUTE_LOV" ("OAL_CLASS",
"OAL_OBJECT",
"OAL_ATTRIBUTE",
"OAL_LABEL",
"OAL_VALUE",
"OAL_DESCRIPTION") AS
  select cla_name    oal_class,
       obj_name    oal_object,
       oat_name    oal_attribute,
       oal_label   oal_label,
       oal_value   oal_value,
       oal_desc    oal_description
  from dr$class,
       dr$object,
       dr$object_attribute,
       dr$object_attribute_lov
 where cla_id     = obj_cla_id
   and obj_cla_id = oat_cla_id
   and obj_id     = oat_obj_id
   and oat_id     = oal_oat_id
   and obj_system = 'N'
   and oat_system = 'N'
   and cla_system = 'N';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_PREFERENCES" ("PRE_OWNER",
"PRE_NAME",
"PRE_CLASS",
"PRE_OBJECT") AS
  select  u.name            pre_owner
       ,pre_name          pre_name
       ,cla_name          pre_class
       ,obj_name          pre_object
from   dr$preference
      ,dr$object
      ,dr$class
      ,sys.user$ u
where pre_obj_id = obj_id
  and pre_cla_id = obj_cla_id
  and obj_cla_id = cla_id
  and obj_system = 'N'
  and cla_system = 'N'
  and pre_owner# = u.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_PREFERENCES" ("PRE_NAME",
"PRE_CLASS",
"PRE_OBJECT") AS
  select  pre_name          pre_name
       ,cla_name          pre_class
       ,obj_name          pre_object
from   dr$preference
      ,dr$object
      ,dr$class
where pre_obj_id = obj_id
  and pre_cla_id = obj_cla_id
  and obj_cla_id = cla_id
  and obj_system = 'N'
  and cla_system = 'N'
  and pre_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_PREFERENCE_VALUES" ("PRV_OWNER",
"PRV_PREFERENCE",
"PRV_ATTRIBUTE",
"PRV_VALUE") AS
  select /*+ ORDERED INDEX(dr$preference_value) */
  u.name              prv_owner
 ,pre_name            prv_preference
 ,oat_name            prv_attribute
 ,decode(oat_datatype, 'B', decode(prv_value, 1, 'YES', 'NO'),
    nvl(oal_label, prv_value)) prv_value
from
  sys.user$ u
 ,dr$preference
 ,dr$preference_value
 ,dr$object_attribute
 ,dr$object_attribute_lov
where prv_value = nvl(oal_value, prv_value)
  and oat_id = oal_oat_id (+)
  and oat_id = prv_oat_id
  and prv_pre_id = pre_id
  and pre_owner# = u.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_PREFERENCE_VALUES" ("PRV_PREFERENCE",
"PRV_ATTRIBUTE",
"PRV_VALUE") AS
  select /*+ ORDERED INDEX(dr$preference_value) */
  pre_name            prv_preference
 ,oat_name            prv_attribute
 ,decode(oat_datatype, 'B', decode(prv_value, 1, 'YES', 'NO'),
    nvl(oal_label, prv_value)) prv_value
from
  dr$preference
 ,dr$preference_value
 ,dr$object_attribute
 ,dr$object_attribute_lov
where oat_id = oal_oat_id (+)
  and prv_value = nvl(oal_value, prv_value)
  and pre_id = prv_pre_id
  and oat_id = prv_oat_id
  and pre_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_INDEXES" ("IDX_ID",
"IDX_OWNER",
"IDX_NAME",
"IDX_TABLE_OWNER",
"IDX_TABLE",
"IDX_KEY_NAME",
"IDX_TEXT_NAME",
"IDX_DOCID_COUNT",
"IDX_STATUS",
"IDX_LANGUAGE_COLUMN",
"IDX_FORMAT_COLUMN",
"IDX_CHARSET_COLUMN",
"IDX_TYPE",
"IDX_SYNC_TYPE",
"IDX_SYNC_MEMORY",
"IDX_SYNC_PARA_DEGREE",
"IDX_SYNC_INTERVAL",
"IDX_SYNC_JOBNAME",
"IDX_QUERY_STATS_ENABLED") AS
  select
  idx_id
 ,u.name                 idx_owner
 ,idx_name               idx_name
 ,u2.name                idx_table_owner
 ,o.name                 idx_table
 ,idx_key_name           idx_key_name
 ,idx_text_name          idx_text_name
 ,idx_docid_count        idx_docid_count
 ,idx_status             idx_status
 ,idx_language_column    idx_language_column
 ,idx_format_column      idx_format_column
 ,idx_charset_column     idx_charset_column
 ,decode(idx_type, 0, 'CONTEXT', 1, 'CTXCAT', 2, 'CTXRULE') idx_type
 ,idx_sync_type          idx_sync_type
 ,idx_sync_memory        idx_sync_memory
 ,idx_sync_para_degree   idx_sync_para_degree
 ,idx_sync_interval      idx_sync_interval
 ,idx_sync_jobname       idx_sync_jobname
 ,decode(instr(idx_option, 'Z'), 0, 'NO', NULL, 'NO', 'YES')
                         idx_query_stats_enabled
 from dr$index, sys.user$ u, sys.obj$ o, sys.user$ u2
where idx_owner# = u.user#
  and idx_table_owner# = u2.user#
  and idx_table# = o.obj#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_INDEXES" ("IDX_ID",
"IDX_NAME",
"IDX_TABLE_OWNER",
"IDX_TABLE",
"IDX_KEY_NAME",
"IDX_TEXT_NAME",
"IDX_DOCID_COUNT",
"IDX_STATUS",
"IDX_LANGUAGE_COLUMN",
"IDX_FORMAT_COLUMN",
"IDX_CHARSET_COLUMN",
"IDX_TYPE",
"IDX_SYNC_TYPE",
"IDX_SYNC_MEMORY",
"IDX_SYNC_PARA_DEGREE",
"IDX_SYNC_INTERVAL",
"IDX_SYNC_JOBNAME",
"IDX_QUERY_STATS_ENABLED") AS
  select
  idx_id
 ,idx_name               idx_name
 ,u.name                 idx_table_owner
 ,o.name                 idx_table
 ,idx_key_name           idx_key_name
 ,idx_text_name          idx_text_name
 ,idx_docid_count        idx_docid_count
 ,idx_status             idx_status
 ,idx_language_column    idx_language_column
 ,idx_format_column      idx_format_column
 ,idx_charset_column     idx_charset_column
 ,decode(idx_type, 0, 'CONTEXT', 1, 'CTXCAT', 2, 'CTXRULE') idx_type
 ,idx_sync_type          idx_sync_type
 ,idx_sync_memory        idx_sync_memory
 ,idx_sync_para_degree   idx_sync_para_degree
 ,idx_sync_interval      idx_sync_interval
 ,idx_sync_jobname       idx_sync_jobname
 ,decode(instr(idx_option, 'Z'), 0, 'NO', NULL, 'NO', 'YES')
                         idx_query_stats_enabled
 from dr$index, sys.user$ u, sys.obj$ o
where idx_owner# = userenv('SCHEMAID')
  and idx_table_owner# = u.user#
  and idx_table# = o.obj#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_INDEX_PARTITIONS" ("IXP_ID",
"IXP_INDEX_OWNER",
"IXP_INDEX_NAME",
"IXP_INDEX_PARTITION_NAME",
"IXP_TABLE_OWNER",
"IXP_TABLE_NAME",
"IXP_TABLE_PARTITION_NAME",
"IXP_DOCID_COUNT",
"IXP_STATUS",
"IXP_SYNC_TYPE",
"IXP_SYNC_MEMORY",
"IXP_SYNC_PARA_DEGREE",
"IXP_SYNC_INTERVAL",
"IXP_SYNC_JOBNAME") AS
  select
  ixp_id
 ,u1.name                ixp_index_owner
 ,idx_name               ixp_index_name
 ,ixp_name               ixp_index_partition_name
 ,u2.name                ixp_table_owner
 ,o1.name                ixp_table_name
 ,o2.subname             ixp_table_partition_name
 ,ixp_docid_count        ixp_docid_count
 ,ixp_status             ixp_status
 ,ixp_sync_type          ixp_sync_type
 ,ixp_sync_memory        ixp_sync_memory
 ,ixp_sync_para_degree   ixp_sync_para_degree
 ,ixp_sync_interval      ixp_sync_interval
 ,ixp_sync_jobname       ixp_sync_jobname
 from dr$index_partition, dr$index, sys.user$ u1, sys.user$ u2,
      sys.obj$ o1, sys.obj$ o2
where idx_owner# = u1.user#
  and idx_table_owner# = u2.user#
  and ixp_table_partition# = o2.obj#
  and idx_table# = o1.obj#
  and ixp_idx_id = idx_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_INDEX_PARTITIONS" ("IXP_ID",
"IXP_INDEX_NAME",
"IXP_INDEX_PARTITION_NAME",
"IXP_TABLE_OWNER",
"IXP_TABLE_NAME",
"IXP_TABLE_PARTITION_NAME",
"IXP_DOCID_COUNT",
"IXP_STATUS",
"IXP_SYNC_TYPE",
"IXP_SYNC_MEMORY",
"IXP_SYNC_PARA_DEGREE",
"IXP_SYNC_INTERVAL",
"IXP_SYNC_JOBNAME") AS
  select
  ixp_id
 ,idx_name               ixp_index_name
 ,ixp_name               ixp_index_partition_name
 ,u2.name                ixp_table_owner
 ,o1.name                ixp_table_name
 ,o2.subname             ixp_table_partition_name
 ,ixp_docid_count        ixp_docid_count
 ,ixp_status             ixp_status
 ,ixp_sync_type          ixp_sync_type
 ,ixp_sync_memory        ixp_sync_memory
 ,ixp_sync_para_degree   ixp_sync_para_degree
 ,ixp_sync_interval      ixp_sync_interval
 ,ixp_sync_jobname       ixp_sync_jobname
 from dr$index_partition, dr$index, sys.user$ u2,
      sys.obj$ o1, sys.obj$ o2
where idx_owner# = userenv('SCHEMAID')
  and idx_table_owner# = u2.user#
  and ixp_table_partition# = o2.obj#
  and idx_table# = o1.obj#
  and ixp_idx_id = idx_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_INDEX_VALUES" ("IXV_INDEX_OWNER",
"IXV_INDEX_NAME",
"IXV_CLASS",
"IXV_OBJECT",
"IXV_ATTRIBUTE",
"IXV_VALUE") AS
  select /*+ ORDERED */
       u.name    ixv_index_owner,
       idx_name  ixv_index_name,
       cla_name  ixv_class,
       obj_name  ixv_object,
       oat_name  ixv_attribute,
       decode(oat_datatype, 'B', decode(ixv_value, 1, 'YES', 'NO'),
         nvl(oal_label, ixv_value)) ixv_value
from dr$index,
     sys.user$ u,
     dr$index_value,
     dr$object_attribute,
     dr$object,
     dr$class,
     dr$object_attribute_lov
where ixv_value = nvl(oal_value, ixv_value)
  and oat_id = oal_oat_id (+)
  and oat_system = 'N'
  and oat_cla_id = obj_cla_id
  and oat_obj_id = obj_id
  and cla_system = 'N'
  and oat_cla_id = cla_id
  and ixv_oat_id = oat_id
  and idx_id     = ixv_idx_id
  and idx_owner# = u.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_INDEX_VALUES" ("IXV_INDEX_NAME",
"IXV_CLASS",
"IXV_OBJECT",
"IXV_ATTRIBUTE",
"IXV_VALUE") AS
  select /*+ ORDERED */
       idx_name  ixv_index_name,
       cla_name  ixv_class,
       obj_name  ixv_object,
       oat_name  ixv_attribute,
       decode(oat_datatype, 'B', decode(ixv_value, 1, 'YES', 'NO'),
         nvl(oal_label, ixv_value)) ixv_value
from dr$index,
     dr$index_value,
     dr$object_attribute,
     dr$object,
     dr$class,
     dr$object_attribute_lov
where ixv_value = nvl(oal_value, ixv_value)
  and oat_id = oal_oat_id (+)
  and oat_system = 'N'
  and oat_cla_id = obj_cla_id
  and oat_obj_id = obj_id
  and cla_system = 'N'
  and oat_cla_id = cla_id
  and ixv_oat_id = oat_id
  and idx_id     = ixv_idx_id
  and idx_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_INDEX_SUB_LEXERS" ("ISL_INDEX_OWNER",
"ISL_INDEX_NAME",
"ISL_LANGUAGE",
"ISL_ALT_VALUE",
"ISL_OBJECT") AS
  select /*+ ORDERED */
       u.name    isl_index_owner,
       idx_name  isl_index_name,
       substr(dri_sublxv_lang(ixv_value),1,30) isl_language,
       substr(substr(ixv_value,instr(ixv_value,':',-1)+1),1,30) isl_alt_value,
       substr(substr(ixv_value,instr(ixv_value,':')+1,
                     instr(ixv_value, ':', -1) - instr(ixv_value,':') - 1),
              1,30) isl_object
from dr$index,
     sys.user$ u,
     dr$index_value
where ixv_oat_id = 60601
  and idx_id     = ixv_idx_id
  and idx_owner# = u.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_INDEX_SUB_LEXERS" ("ISL_INDEX_NAME",
"ISL_LANGUAGE",
"ISL_ALT_VALUE",
"ISL_OBJECT") AS
  select /*+ ORDERED */
       idx_name  isl_index_name,
       substr(dri_sublxv_lang(ixv_value),1,30) isl_language,
       substr(substr(ixv_value,instr(ixv_value,':',-1)+1),1,30) isl_alt_value,
       substr(substr(ixv_value,instr(ixv_value,':')+1,
                     instr(ixv_value, ':', -1) - instr(ixv_value,':') - 1),
              1,30) isl_object
from dr$index,
     dr$index_value
where ixv_oat_id = 60601
  and idx_id     = ixv_idx_id
  and idx_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_INDEX_SUB_LEXER_VALUES" ("ISV_INDEX_OWNER",
"ISV_INDEX_NAME",
"ISV_LANGUAGE",
"ISV_OBJECT",
"ISV_ATTRIBUTE",
"ISV_VALUE") AS
  select /*+ ORDERED */
       u.name    isv_index_owner,
       idx_name  isv_index_name,
       substr(dri_sublxv_lang(iv2.ixv_value),1,30) isv_language,
       obj_name  isv_object,
       oat_name  isv_attribute,
       decode(oat_datatype, 'B', decode(iv1.ixv_value, 1, 'YES', 'NO'),
         nvl(oal_label, iv1.ixv_value)) isv_value
from dr$index,
     sys.user$ u,
     dr$index_value iv1,
     dr$index_value iv2,
     dr$object_attribute,
     dr$object,
     dr$object_attribute_lov
where iv1.ixv_value = nvl(oal_value, iv1.ixv_value)
  and oat_id = oal_oat_id (+)
  and oat_system = 'N'
  and oat_cla_id = obj_cla_id
  and oat_obj_id = obj_id
  and iv1.ixv_sub_oat_id = oat_id
  and iv2.ixv_oat_id = 60601
  and iv1.ixv_sub_group = iv2.ixv_sub_group
  and iv1.ixv_idx_id = iv2.ixv_idx_id
  and iv1.ixv_oat_id = 60602
  and idx_id     = iv1.ixv_idx_id
  and idx_owner# = u.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_INDEX_SUB_LEXER_VALS" ("ISV_INDEX_NAME",
"ISV_LANGUAGE",
"ISV_OBJECT",
"ISV_ATTRIBUTE",
"ISV_VALUE") AS
  select /*+ ORDERED */
       idx_name  isv_index_name,
       substr(dri_sublxv_lang(iv2.ixv_value),1,30) isv_language,
       obj_name  isv_object,
       oat_name  isv_attribute,
       decode(oat_datatype, 'B', decode(iv1.ixv_value, 1, 'YES', 'NO'),
         nvl(oal_label, iv1.ixv_value)) isv_value
from dr$index,
     dr$index_value iv1,
     dr$index_value iv2,
     dr$object_attribute,
     dr$object,
     dr$object_attribute_lov
where iv1.ixv_value = nvl(oal_value, iv1.ixv_value)
  and oat_id = oal_oat_id (+)
  and oat_system = 'N'
  and oat_cla_id = obj_cla_id
  and oat_obj_id = obj_id
  and iv1.ixv_sub_oat_id = oat_id
  and iv2.ixv_oat_id = 60601
  and iv1.ixv_sub_group = iv2.ixv_sub_group
  and iv1.ixv_idx_id = iv2.ixv_idx_id
  and iv1.ixv_oat_id = 60602
  and idx_id     = iv1.ixv_idx_id
  and idx_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_INDEX_OBJECTS" ("IXO_INDEX_OWNER",
"IXO_INDEX_NAME",
"IXO_CLASS",
"IXO_OBJECT") AS
  select u.name    ixo_index_owner,
       idx_name  ixo_index_name,
       cla_name  ixo_class,
       obj_name  ixo_object
from dr$index, dr$class, dr$object, dr$index_object, sys.user$ u
where cla_system = 'N'
  and ixo_cla_id = cla_id
  and ixo_cla_id = obj_cla_id
  and ixo_obj_id = obj_id
  and ixo_idx_id = idx_id
  and idx_owner# = u.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_INDEX_OBJECTS" ("IXO_INDEX_NAME",
"IXO_CLASS",
"IXO_OBJECT") AS
  select idx_name  ixo_index_name,
       cla_name  ixo_class,
       obj_name  ixo_object
from dr$index, dr$class, dr$object, dr$index_object
where cla_system = 'N'
  and ixo_cla_id = cla_id
  and ixo_cla_id = obj_cla_id
  and ixo_obj_id = obj_id
  and ixo_idx_id = idx_id
  and idx_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_SQES" ("SQE_OWNER",
"SQE_NAME",
"SQE_QUERY") AS
  select u.name     sqe_owner,
       sqe_name,
       sqe_query
  from dr$sqe sqe, sys.user$ u
 where sqe_owner# = u.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_SQES" ("SQE_OWNER",
"SQE_NAME",
"SQE_QUERY") AS
  select u.name     sqe_owner,
       sqe_name,
       sqe_query
  from dr$sqe sqe, sys.user$ u
 where sqe_owner# = u.user#
   and u.user# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_THESAURI" ("THS_OWNER",
"THS_NAME") AS
  select u.name ths_owner,
       ths_name
  from dr$ths, sys.user$ u
 where ths_owner# = u.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_THESAURI" ("THS_NAME") AS
  select ths_name
  from dr$ths
 where ths_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_THES_PHRASES" ("THP_THESAURUS",
"THP_PHRASE",
"THP_QUALIFIER",
"THP_SCOPE_NOTE") AS
  select ths_name     thp_thesaurus,
          thp_phrase   thp_phrase,
          thp_qualify  thp_qualifier,
          thp_note     thp_scope_note
     from dr$ths, dr$ths_phrase
    where thp_thsid = ths_id
    order by thp_thsid, thp_phrase, thp_qualify;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_THES_PHRASES" ("THP_THESAURUS",
"THP_PHRASE",
"THP_QUALIFIER",
"THP_SCOPE_NOTE") AS
  select ths_name     thp_thesaurus,
          thp_phrase   thp_phrase,
          thp_qualify  thp_qualifier,
          thp_note     thp_scope_note
     from dr$ths_phrase, dr$ths
    where thp_thsid = ths_id
      and ths_owner# = userenv('SCHEMAID')
    order by thp_thsid, thp_phrase, thp_qualify;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_SECTION_GROUPS" ("SGP_OWNER",
"SGP_NAME",
"SGP_TYPE") AS
  select
   u.name      sgp_owner,
   sgp_name,
   obj_name    sgp_type
from dr$section_group, dr$object, dr$class, sys.user$ u
where sgp_obj_id = obj_id
  and obj_system = 'N'
  and obj_cla_id = cla_id
  and cla_name = 'SECTION_GROUP'
  and sgp_owner# = u.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_SECTION_GROUPS" ("SGP_NAME",
"SGP_TYPE") AS
  select
   sgp_name,
   obj_name    sgp_type
from dr$section_group, dr$object, dr$class
where sgp_obj_id = obj_id
  and obj_system = 'N'
  and obj_cla_id = cla_id
  and cla_name = 'SECTION_GROUP'
  and sgp_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_SECTIONS" ("SEC_OWNER",
"SEC_SECTION_GROUP",
"SEC_TYPE",
"SEC_ID",
"SEC_NAME",
"SEC_TAG",
"SEC_VISIBLE",
"SEC_DATATYPE") AS
  select
   u.name            sec_owner,
   sgp_name          sec_section_group,
   decode(sec_type, 1, 'ZONE', 2, 'FIELD', 3, 'SPECIAL', 4, 'STOP',
                    5, 'ATTR', 7, 'MDATA', 8, 'COLUMN SDATA',
                    9, 'COLUMN MDATA', 10, 'SDATA', 11, 'NDATA', null)
                     sec_type,
   sec_id            sec_id,
   decode(sec_type, 4, null, sec_name)
                     sec_name,
   sec_tag           sec_tag,
   sec_visible       sec_visible,
   decode(sec_datatype, 2, 'NUMBER', 5, 'VARCHAR2', 12, 'DATE', 23, 'RAW',
                        96, 'CHAR', null)
                     sec_datatype
from dr$section sec, dr$section_group sgp, sys.user$ u
where sgp.sgp_id = sec.sec_sgp_id
  and sgp_owner# = u.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_SECTIONS" ("SEC_SECTION_GROUP",
"SEC_TYPE",
"SEC_ID",
"SEC_NAME",
"SEC_TAG",
"SEC_VISIBLE",
"SEC_DATATYPE") AS
  select
   sgp_name          sec_section_group,
   decode(sec_type, 1, 'ZONE', 2, 'FIELD', 3, 'SPECIAL', 4, 'STOP',
                    5, 'ATTR', 7, 'MDATA', 8, 'COLUMN SDATA',
                    9, 'COLUMN MDATA', 10, 'SDATA', 11, 'NDATA', null)
                     sec_type,
   sec_id            sec_id,
   decode(sec_type, 4, null, sec_name)
                     sec_name,
   sec_tag           sec_tag,
   sec_visible       sec_visible,
   decode(sec_datatype, 2, 'NUMBER', 5, 'VARCHAR2', 12, 'DATE', 23, 'RAW',
                        96, 'CHAR', null)
                     sec_datatype
from dr$section sec, dr$section_group sgp
where sgp.sgp_id = sec.sec_sgp_id
  and sgp_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_STOPLISTS" ("SPL_OWNER",
"SPL_NAME",
"SPL_COUNT",
"SPL_TYPE") AS
  select
  u.name             spl_owner,
  spl_name           spl_name,
  spl_count          spl_count,
  obj_name           spl_type
from dr$stoplist, sys.user$ u, dr$object, dr$class
where spl_owner# = u.user#
  and spl_type = obj_id
  and obj_cla_id = cla_id
  and cla_name = 'STOPLIST';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_STOPLISTS" ("SPL_NAME",
"SPL_COUNT",
"SPL_TYPE") AS
  select spl_name           spl_name,
       spl_count          spl_count,
       obj_name           spl_type
from   dr$stoplist, dr$object, dr$class
where  spl_owner# = userenv('SCHEMAID')
  and  spl_type = obj_id
  and  obj_cla_id = cla_id
  and  cla_name = 'STOPLIST';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_STOPWORDS" ("SPW_OWNER",
"SPW_STOPLIST",
"SPW_TYPE",
"SPW_WORD",
"SPW_LANGUAGE",
"SPW_LANG_DEPENDENT",
"SPW_PATTERN") AS
  select
  u.name         spw_owner,
  spl_name       spw_stoplist,
  decode(spw_type, 1, 'STOP_CLASS', 2, 'STOP_WORD', 3, 'STOP_THEME', null)
                 spw_type,
  spw_word       spw_word,
  decode(spw_language, 'ALL', null, spw_language)   spw_language,
  spw_lang_dependent   spw_lang_dependent,
  spw_pattern   spw_pattern
from dr$stoplist, dr$stopword, sys.user$ u
where spl_id = spw_spl_id
  and spl_owner# = u.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_STOPWORDS" ("SPW_STOPLIST",
"SPW_TYPE",
"SPW_WORD",
"SPW_LANGUAGE",
"SPW_LANG_DEPENDENT",
"SPW_PATTERN") AS
  select
  spl_name       spw_stoplist,
  decode(spw_type, 1, 'STOP_CLASS', 2, 'STOP_WORD', 3, 'STOP_THEME', null)
                 spw_type,
  spw_word       spw_word,
  decode(spw_language, 'ALL', null, spw_language)   spw_language,
  spw_lang_dependent   spw_lang_dependent,
  spw_pattern   spw_pattern
from dr$stoplist, dr$stopword
where spl_id = spw_spl_id
  and spl_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_SUB_LEXERS" ("SLX_OWNER",
"SLX_NAME",
"SLX_LANGUAGE",
"SLX_ALT_VALUE",
"SLX_SUB_OWNER",
"SLX_SUB_NAME",
"SLX_LANG_DEPENDENT") AS
  select  u1.name            slx_owner
       ,p1.pre_name        slx_name
       ,slx_language       slx_language
       ,slx_alt_value      slx_alt_value
       ,u2.name            slx_sub_owner
       ,p2.pre_name        slx_sub_name
       ,slx_lang_dependent slx_lang_dependent
from   dr$sub_lexer
      ,dr$preference p1
      ,dr$preference p2
      ,sys.user$ u1
      ,sys.user$ u2
where p2.pre_owner# = u2.user#
  and p1.pre_owner# = u1.user#
  and slx_sub_pre_id = p2.pre_id
  and slx_pre_id = p1.pre_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_SUB_LEXERS" ("SLX_NAME",
"SLX_LANGUAGE",
"SLX_ALT_VALUE",
"SLX_SUB_OWNER",
"SLX_SUB_NAME",
"SLX_LANG_DEPENDENT") AS
  select  p1.pre_name       slx_name
       ,slx_language      slx_language
       ,slx_alt_value     slx_alt_value
       ,u2.name           slx_sub_owner
       ,p2.pre_name       slx_sub_name
       ,slx_lang_dependent slx_lang_dependent
from   dr$sub_lexer
      ,dr$preference p1
      ,dr$preference p2
      ,sys.user$ u2
where p2.pre_owner# = u2.user#
  and p1.pre_owner# = userenv('SCHEMAID')
  and slx_sub_pre_id = p2.pre_id
  and slx_pre_id = p1.pre_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_INDEX_SETS" ("IXS_OWNER",
"IXS_NAME") AS
  select
   u.name      ixs_owner,
   ixs_name
from dr$index_set, sys.user$ u
where ixs_owner# = u.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_INDEX_SETS" ("IXS_NAME") AS
  select
   ixs_name
from dr$index_set
where ixs_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_INDEX_SET_INDEXES" ("IXX_INDEX_SET_OWNER",
"IXX_INDEX_SET_NAME",
"IXX_COLLIST",
"IXX_STORAGE") AS
  select
   u.name            ixx_index_set_owner,
   ixs_name          ixx_index_set_name,
   ixx_collist,
   ixx_storage
from dr$index_set_index, dr$index_set, sys.user$ u
where ixs_owner# = u.user#
  and ixx_ixs_id = ixs_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_INDEX_SET_INDEXES" ("IXX_INDEX_SET_NAME",
"IXX_COLLIST",
"IXX_STORAGE") AS
  select
   ixs_name          ixx_index_set_name,
   ixx_collist,
   ixx_storage
from dr$index_set_index, dr$index_set
where ixx_ixs_id = ixs_id
  and ixs_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."DRV$PENDING" ("PND_CID",
"PND_PID",
"PND_ROWID",
"PND_TIMESTAMP",
"PND_LOCK_FAILED") AS
  select "PND_CID","PND_PID","PND_ROWID","PND_TIMESTAMP","PND_LOCK_FAILED" from dr$pending
 where pnd_cid = SYS_CONTEXT('DR$APPCTX','IDXID')
with check option;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_PENDING" ("PND_INDEX_OWNER",
"PND_INDEX_NAME",
"PND_PARTITION_NAME",
"PND_ROWID",
"PND_TIMESTAMP") AS
  select /*+ ORDERED USE_NL(i p d) */
       u.name      pnd_index_owner,
       idx_name    pnd_index_name,
       ixp_name    pnd_partition_name,
       pnd_rowid,
       pnd_timestamp
  from sys.user$ u, dr$index i, dr$index_partition p, dr$pending d
 where idx_owner# = u.user#
   and idx_id = ixp_idx_id
   and pnd_pid = ixp_id
   and pnd_pid != 0
   and pnd_cid = idx_id
UNION ALL
select /*+ ORDERED USE_NL(i d) */
       u.name      pnd_index_owner,
       idx_name    pnd_index_name,
       null        pnd_partition_name,
       pnd_rowid,
       pnd_timestamp
  from sys.user$ u, dr$index i, dr$pending d
 where idx_owner# = u.user#
   and pnd_pid = 0
   and pnd_cid = idx_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_PENDING" ("PND_INDEX_NAME",
"PND_PARTITION_NAME",
"PND_ROWID",
"PND_TIMESTAMP") AS
  select /*+ ORDERED USE_NL(i p d)*/
       idx_name  pnd_index_name,
       ixp_name  pnd_partition_name,
       pnd_rowid,
       pnd_timestamp
  from dr$index i, dr$index_partition p, dr$pending d
 where idx_id = ixp_idx_id
   and pnd_pid = ixp_id
   and pnd_cid != 0
   and pnd_cid = idx_id
   and idx_owner# = userenv('SCHEMAID')
UNION ALL
select /*+ ORDERED USE_NL(i d) */
       idx_name  pnd_index_name,
       null      pnd_partition_name,
       pnd_rowid,
       pnd_timestamp
  from dr$index i, dr$pending d
 where pnd_pid = 0
   and pnd_cid = idx_id
   and idx_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."DRV$WAITING" ("WTG_CID",
"WTG_ROWID",
"WTG_PID") AS
  select "WTG_CID","WTG_ROWID","WTG_PID" from dr$waiting
 where wtg_cid = SYS_CONTEXT('DR$APPCTX','IDXID')
with check option;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."DRV$ONLINE_PENDING" ("ONL_CID",
"ONL_ROWID",
"ONL_INDEXPARTITION") AS
  select "ONL_CID","ONL_ROWID","ONL_INDEXPARTITION" from dr$online_pending
where onl_cid = SYS_CONTEXT('DR$APPCTX','IDXID')
with check option;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."DRV$DELETE" ("DEL_IDX_ID",
"DEL_IXP_ID",
"DEL_DOCID") AS
  select "DEL_IDX_ID",
"DEL_IXP_ID",
"DEL_DOCID" from dr$delete;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."DRV$DELETE2" ("DEL_IDX_ID",
"DEL_IXP_ID",
"DEL_DOCID") AS
  select "DEL_IDX_ID","DEL_IXP_ID","DEL_DOCID" from dr$delete
where del_idx_id = SYS_CONTEXT('DR$APPCTX','IDXID')
with check option;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."DRV$UNINDEXED" ("UNX_IDX_ID",
"UNX_IXP_ID",
"UNX_ROWID") AS
  select "UNX_IDX_ID",
"UNX_IXP_ID",
"UNX_ROWID" from dr$unindexed;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."DRV$UNINDEXED2" ("UNX_IDX_ID",
"UNX_IXP_ID",
"UNX_ROWID") AS
  select "UNX_IDX_ID","UNX_IXP_ID","UNX_ROWID" from dr$unindexed
where unx_idx_id = SYS_CONTEXT('DR$APPCTX','IDXID')
with check option;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_INDEX_ERRORS" ("ERR_INDEX_OWNER",
"ERR_INDEX_NAME",
"ERR_TIMESTAMP",
"ERR_TEXTKEY",
"ERR_TEXT") AS
  select u.name         err_index_owner,
       idx_name       err_index_name,
       err_timestamp,
       err_textkey,
       err_text
  from dr$index_error, dr$index, sys.user$ u
 where idx_id = err_idx_id
   and idx_owner# = u.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_INDEX_ERRORS" ("ERR_INDEX_NAME",
"ERR_TIMESTAMP",
"ERR_TEXTKEY",
"ERR_TEXT") AS
  select idx_name       err_index_name,
       err_timestamp,
       err_textkey,
       err_text
  from dr$index_error, dr$index
 where idx_id = err_idx_id
   and idx_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_VERSION" ("VER_DICT",
"VER_CODE") AS
  select substr(dri_version,1,10) ver_dict,
substr(dri_version,1,10) ver_code from dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_TRACE_VALUES" ("TRC_ID",
"TRC_VALUE") AS
  select trc.trc_id, trc.trc_value
  from TABLE(ctxsys.drvparx.TraceGetTrace) trc;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_FILTER_CACHE_STATISTICS" ("FCS_INDEX_OWNER",
"FCS_INDEX_NAME",
"FCS_PARTITION_NAME",
"FCS_SIZE",
"FCS_ENTRIES",
"FCS_REQUESTS",
"FCS_HITS") AS
  select u1.name     fcs_index_owner,
       i.idx_name  fcs_index_name,
       p.ixp_name  fcs_partition_name,
       ctxsys.drvparx.GetFilterCacheSize     fcs_size,
       ctxsys.drvparx.GetFilterCacheEntries  fcs_entries,
       ctxsys.drvparx.GetFilterCacheRequests fcs_requests,
       ctxsys.drvparx.GetFilterCacheHits     fcs_hits
  from ctxsys.dr$index i, ctxsys.dr$index_partition p, sys.user$ u1
       where i.idx_owner# = u1.user# and
             i.idx_option like '%U%' and
             i.idx_id =
               ctxsys.drvparx.FilterCacheGetStats(i.idx_id, i.idx_owner#,
                                                  u1.name, i.idx_name,
                                                  p.ixp_name) and
             i.idx_id = p.ixp_idx_id (+);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_FILTER_BY_COLUMNS" ("FBC_INDEX_OWNER",
"FBC_INDEX_NAME",
"FBC_TABLE_OWNER",
"FBC_TABLE_NAME",
"FBC_COLUMN_NAME",
"FBC_COLUMN_TYPE",
"FBC_SECTION_NAME",
"FBC_SECTION_TYPE",
"FBC_SECTION_ID") AS
  select
  u.name   fbc_index_owner
 ,idx_name fbc_index_name
 ,u2.name  fbc_table_owner
 ,o.name   fbc_table_name
 ,cdi_column_name fbc_column_name
 ,cdi_column_type fbc_column_type
 ,cdi_section_name    fbc_section_name
 ,decode(cdi_section_type,8,'SDATA',9,'MDATA','UNKNOWN')   fbc_section_type
 ,cdi_section_id      fbc_section_id
 from dr$index_cdi_column, dr$index, sys.user$ u, sys.obj$ o,
      sys.user$ u2
where cdi_idx_id = idx_id
  and cdi_column_position = 0
  and idx_owner# = u.user#
  and idx_table_owner# = u2.user#
  and idx_table# = o.obj#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_FILTER_BY_COLUMNS" ("FBC_INDEX_NAME",
"FBC_TABLE_OWNER",
"FBC_TABLE_NAME",
"FBC_COLUMN_NAME",
"FBC_COLUMN_TYPE",
"FBC_SECTION_NAME",
"FBC_SECTION_TYPE",
"FBC_SECTION_ID") AS
  select
  idx_name fbc_index_name
 ,u.name   fbc_table_owner
 ,o.name   fbc_table_name
 ,cdi_column_name fbc_column_name
 ,cdi_column_type fbc_column_type
 ,cdi_section_name    fbc_section_name
 ,decode(cdi_section_type,8,'SDATA',9,'MDATA','UNKNOWN')   fbc_section_type
 ,cdi_section_id      fbc_section_id
 from dr$index_cdi_column, dr$index, sys.obj$ o,
      sys.user$ u
where cdi_idx_id = idx_id
  and cdi_column_position = 0
  and idx_table_owner# = u.user#
  and idx_table# = o.obj#
  and idx_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_ORDER_BY_COLUMNS" ("OBC_INDEX_OWNER",
"OBC_INDEX_NAME",
"OBC_TABLE_OWNER",
"OBC_TABLE_NAME",
"OBC_COLUMN_NAME",
"OBC_COLUMN_POSITION",
"OBC_COLUMN_TYPE",
"OBC_SECTION_NAME",
"OBC_SECTION_TYPE",
"OBC_SECTION_ID",
"OBC_SORT_ORDER") AS
  select
  u.name   obc_index_owner
 ,idx_name obc_index_name
 ,u2.name  obc_table_owner
 ,o.name   obc_table_name
 ,cdi_column_name     obc_column_name
 ,cdi_column_position obc_column_position
 ,cdi_column_type     obc_column_type
 ,cdi_section_name    obc_section_name
 ,decode(cdi_section_type,8,'SDATA',9,'MDATA','UNKNOWN') obc_section_type
 ,cdi_section_id      obc_section_id
 ,cdi_sort_order      obc_sort_order
 from dr$index_cdi_column, dr$index, sys.user$ u, sys.obj$ o,
      sys.user$ u2
where cdi_idx_id = idx_id
  and cdi_column_position != 0
  and idx_owner# = u.user#
  and idx_table_owner# = u2.user#
  and idx_table# = o.obj#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_ORDER_BY_COLUMNS" ("OBC_INDEX_NAME",
"OBC_TABLE_OWNER",
"OBC_TABLE_NAME",
"OBC_COLUMN_NAME",
"OBC_COLUMN_POSITION",
"OBC_COLUMN_TYPE",
"OBC_SECTION_NAME",
"OBC_SECTION_TYPE",
"OBC_SECTION_ID",
"OBC_SORT_ORDER") AS
  select
  idx_name obc_index_name
 ,u.name   obc_table_owner
 ,o.name   obc_table_name
 ,cdi_column_name     obc_column_name
 ,cdi_column_position obc_column_position
 ,cdi_column_type     obc_column_type
 ,cdi_section_name    obc_section_name
 ,decode(cdi_section_type,8,'SDATA',9,'MDATA','UNKNOWN')   obc_section_type
 ,cdi_section_id      obc_section_id
 ,cdi_sort_order      obc_sort_order
 from dr$index_cdi_column, dr$index, sys.obj$ o,
      sys.user$ u
where cdi_idx_id = idx_id
  and cdi_column_position != 0
  and idx_table_owner# = u.user#
  and idx_table# = o.obj#
  and idx_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."DRV$SDATA_UPDATE" ("SDU_IDX_ID",
"SDU_IXP_ID",
"SDU_SDATA_ID",
"SDU_DOCID",
"SDU_NV_TYPE",
"SDU_NV_NDATA",
"SDU_NV_DDATA",
"SDU_NV_CDATA",
"SDU_NV_RDATA") AS
  select "SDU_IDX_ID",
"SDU_IXP_ID",
"SDU_SDATA_ID",
"SDU_DOCID",
"SDU_NV_TYPE",
"SDU_NV_NDATA",
"SDU_NV_DDATA",
"SDU_NV_CDATA",
"SDU_NV_RDATA" from dr$sdata_update;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."DRV$SDATA_UPDATE2" ("SDU_IDX_ID",
"SDU_IXP_ID",
"SDU_SDATA_ID",
"SDU_DOCID",
"SDU_NV_TYPE",
"SDU_NV_NDATA",
"SDU_NV_DDATA",
"SDU_NV_CDATA",
"SDU_NV_RDATA") AS
  select "SDU_IDX_ID","SDU_IXP_ID","SDU_SDATA_ID","SDU_DOCID","SDU_NV_TYPE","SDU_NV_NDATA","SDU_NV_DDATA","SDU_NV_CDATA","SDU_NV_RDATA" from dr$sdata_update
where sdu_idx_id = SYS_CONTEXT('DR$APPCTX','IDXID')
with check option;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."DRV$USER_EXTRACT_RULE" ("ERL_POL_ID",
"ERL_RULE_ID",
"ERL_LANGUAGE",
"ERL_RULE",
"ERL_MODIFIER",
"ERL_TYPE",
"ERL_STATUS",
"ERL_COMMENTS") AS
  select "ERL_POL_ID","ERL_RULE_ID","ERL_LANGUAGE","ERL_RULE","ERL_MODIFIER","ERL_TYPE","ERL_STATUS","ERL_COMMENTS" from dr$user_extract_rule
where erl_pol_id = SYS_CONTEXT('DR$APPCTX', 'IDXID')
with check option;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_EXTRACT_RULES" ("ERL_POLICY_NAME",
"ERL_RULE_ID",
"ERL_LANGUAGE",
"ERL_RULE",
"ERL_MODIFIER",
"ERL_TYPE",
"ERL_STATUS",
"ERL_COMMENTS") AS
  select
  i.idx_name erl_policy_name,
  e.erl_rule_id erl_rule_id,
  e.erl_language erl_language,
  e.erl_rule erl_rule,
  e.erl_modifier erl_modifier,
  e.erl_type erl_type,
  decode(e.erl_status,
         0,'not compiled',
         1, 'to be deleted',
         2, 'compiled') erl_status,
  e.erl_comments erl_comments
  from dr$user_extract_rule e, dr$index i
where i.idx_owner# = userenv('SCHEMAID')
  and e.erl_pol_id = i.idx_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."DRV$USER_EXTRACT_STOP_ENTITY" ("ESE_POL_ID",
"ESE_NAME",
"ESE_TYPE",
"ESE_STATUS",
"ESE_COMMENTS") AS
  select "ESE_POL_ID","ESE_NAME","ESE_TYPE","ESE_STATUS","ESE_COMMENTS" from dr$user_extract_stop_entity
where ese_pol_id = SYS_CONTEXT('DR$APPCTX', 'IDXID')
with check option;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_EXTRACT_STOP_ENTITIES" ("ESE_POLICY_NAME",
"ESE_NAME",
"ESE_TYPE",
"ESE_STATUS",
"ESE_COMMENTS") AS
  select
  i.idx_name        ese_policy_name,
  e.ese_name        ese_name,
  e.ese_type        ese_type,
  decode(e.ese_status,
         0,'not compiled',
         1, 'to be deleted',
         2, 'compiled',
         3, 'subset') ese_status,
  e.ese_comments    ese_comments
  from dr$user_extract_stop_entity e, dr$index i
where i.idx_owner# = userenv('SCHEMAID')
  and e.ese_pol_id = i.idx_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."DRV$USER_EXTRACT_TKDICT" ("ETD_POLID",
"ETD_TXT",
"ETD_SOE",
"ETD_EOE",
"ETD_BIGRAM",
"ETD_STATUS") AS
  select "ETD_POLID","ETD_TXT","ETD_SOE","ETD_EOE","ETD_BIGRAM","ETD_STATUS" from dr$user_extract_tkdict
where etd_polid = SYS_CONTEXT('DR$APPCTX', 'IDXID')
with check option;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."DRV$USER_EXTRACT_ENTDICT" ("EED_POLID",
"EED_ENTID",
"EED_LANG",
"EED_MENTION",
"EED_TYPE",
"EED_NORMID",
"EED_ALTCNT",
"EED_STATUS") AS
  select "EED_POLID","EED_ENTID","EED_LANG","EED_MENTION","EED_TYPE","EED_NORMID","EED_ALTCNT","EED_STATUS" from dr$user_extract_entdict
where eed_polid = SYS_CONTEXT('DR$APPCTX', 'IDXID')
with check option;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_EXTRACT_POLICIES" ("EPL_NAME",
"EPL_OWNER") AS
  select
  i.idx_name epl_name,
  u.name     epl_owner
  from dr$index i, sys.user$ u
  where INSTR(i.idx_option, 'E') > 0
    and i.idx_owner# = u.user#;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_EXTRACT_POLICY_VALUES" ("EPV_POLICY_NAME",
"EPV_POLICY_OWNER",
"EPV_CLASS",
"EPV_OBJECT",
"EPV_ATTRIBUTE",
"EPV_VALUE") AS
  select /*+ ORDERED */
  idx_name epv_policy_name,
  u.name epv_policy_owner,
  cla_name epv_class,
  obj_name epv_object,
  oat_name epv_attribute,
  decode(oat_datatype, 'B', decode(ixv_value, 1, 'YES', 'NO'),
    nvl(oal_label, ixv_value)) epv_value
from dr$index,
     sys.user$ u,
     dr$index_value,
     dr$object_attribute,
     dr$object,
     dr$class,
     dr$object_attribute_lov
where ixv_sub_group = 0
  and ixv_value = nvl(oal_value, ixv_value)
  and oat_id = oal_oat_id (+)
  and oat_system = 'N'
  and oat_cla_id = obj_cla_id
  and oat_obj_id = obj_id
  and (cla_name = 'STORAGE' or cla_name = 'LEXER')
  and cla_system = 'N'
  and oat_cla_id = cla_id
  and ixv_oat_id = oat_id
  and idx_id     = ixv_idx_id
  and idx_owner# = u.user#
  and  INSTR(idx_option, 'E') > 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_EXTRACT_POLICIES" ("EPL_NAME") AS
  select
  i.idx_name epl_name
  from dr$index i
  where INSTR(i.idx_option, 'E') > 0
    and i.idx_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_EXTRACT_POLICY_VALUES" ("EPV_POLICY_NAME",
"EPV_CLASS",
"EPV_OBJECT",
"EPV_ATTRIBUTE",
"EPV_VALUE") AS
  select /*+ ORDERED */
  idx_name epv_policy_name,
  cla_name epv_class,
  obj_name epv_object,
  oat_name epv_attribute,
  decode(oat_datatype, 'B', decode(ixv_value, 1, 'YES', 'NO'),
    nvl(oal_label, ixv_value)) epv_value
from dr$index,
     dr$index_value,
     dr$object_attribute,
     dr$object,
     dr$class,
     dr$object_attribute_lov
where ixv_sub_group = 0
  and ixv_value = nvl(oal_value, ixv_value)
  and oat_id = oal_oat_id (+)
  and oat_system = 'N'
  and oat_cla_id = obj_cla_id
  and oat_obj_id = obj_id
  and (cla_name = 'STORAGE' or cla_name = 'LEXER')
  and cla_system = 'N'
  and oat_cla_id = cla_id
  and ixv_oat_id = oat_id
  and idx_id     = ixv_idx_id
  and idx_owner# = userenv('SCHEMAID')
  and  INSTR(idx_option, 'E') > 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_AUTO_OPTIMIZE_INDEXES" ("AOI_INDEX_OWNER",
"AOI_INDEX_NAME",
"AOI_PARTITION_NAME") AS
  select
  o.aoi_ownname aoi_index_owner,
  o.aoi_idxname aoi_index_name,
  o.aoi_partname aoi_partition_name
  from dr$autoopt o;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."DRV$AUTOOPT" ("AOI_IDXID",
"AOI_PARTID",
"AOI_OWNID",
"AOI_OWNNAME",
"AOI_IDXNAME",
"AOI_PARTNAME") AS
  select "AOI_IDXID",
"AOI_PARTID",
"AOI_OWNID",
"AOI_OWNNAME",
"AOI_IDXNAME",
"AOI_PARTNAME" from dr$autoopt;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_AUTO_OPTIMIZE_INDEXES" ("AOI_INDEX_NAME",
"AOI_PARTITION_NAME") AS
  select
  o.aoi_idxname aoi_index_name,
  o.aoi_partname aoi_partition_name
  from dr$autoopt o where o.aoi_ownid = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_AUTO_OPTIMIZE_STATUS" ("AOS_TIMESTAMP",
"AOS_STATUS",
"AOS_ERROR") AS
  select l.log_date aos_timestamp,
       l.status   aos_status,
       d.additional_info aos_error
  from user_scheduler_job_log l, user_scheduler_job_run_details d
  where l.log_id = d.log_id and
        l.owner = d.owner and
        l.owner = 'CTXSYS';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."DRV$TREE" ("IDXID",
"SECID",
"NODE_SEQ") AS
  select "IDXID","SECID","NODE_SEQ" from ctxsys.dr$tree
where idxid = SYS_CONTEXT('DR$APPCTX', 'IDXID')
with check option;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_ALEXER_DICTS" ("ALD_NAME",
"ALD_LANG") AS
  select dict_name ald_name, dict_lang ald_lang
  from DR$DICTIONARY
  where dict_owner# = userenv('SCHEMAID');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_ALEXER_DICTS" ("ALD_OWNER",
"ALD_NAME",
"ALD_LANG") AS
  select idx.idx_owner# as ald_owner, b.dict_name as ald_name,
  a.dict_lang as ald_lang
  from DR$IDX_DICTIONARIES a, DR$DICTIONARY b, dr$index idx
  where idx.idx_owner# = b.dict_owner# and a.dict_lang = b.dict_lang;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_INDEX_SECTIONS" ("ISC_IDX_NAME",
"ISC_IDX_OWNER",
"ISC_SEC_TYPE",
"ISC_SEC_NAME",
"ISC_SEC_TAG",
"ISC_SEC_VISIBLE",
"ISC_SEC_DATATYPE") AS
  select idx_name      as isc_idx_name,
         idx_owner     as isc_idx_owner,
         max(sec_type) as isc_sec_type,
     max(nvl(decode(oatid, 240102, sec_name), '')) isc_sec_name,
     max(nvl(decode(oatid, 240103, sec_name), '')) isc_sec_tag,
     max(nvl(decode(oatid, 240105,
                    decode(sec_name, 0, 'N', 1, 'Y')), '')) isc_sec_visible,
     max(nvl(decode(oatid, 240107,
                    decode(sec_name, 2, 'NUMBER', 5, 'VARCHAR2',
                           12, 'DATE', 23, 'RAW', 96, 'CHAR',
                           null)), '')) isc_sec_datatype
  from(
       select c.idx_name idx_name, u.name idx_owner,
              a.ixv_value sec_name, a.ixv_sub_group subg,
              a.ixv_sub_oat_id oatid,
              decode(mod(b.ixv_oat_id, 100), 1, 'ZONE', 2, 'FIELD',
                     3, 'SPECIAL', 4, 'STOP', 5, 'ATTR', 7, 'MDATA',
                     8, 'COLUMN SDATA', 9, 'COLUMN MDATA', 10, 'SDATA',
                     11, 'NDATA', null) sec_type
       from dr$index_value a, dr$index_value b, dr$index c, sys.user$ u
       where
                b.ixv_idx_id     = c.idx_id
            and b.ixv_value      = to_char(a.ixv_sub_group)
            and b.ixv_sub_oat_id = 0
            and b.ixv_sub_group  = 0
            and c.idx_owner#     = u.user#
      )
  group by subg, idx_name, idx_owner
  order by isc_idx_name, isc_sec_type;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_INDEX_SECTIONS" ("ISC_IDX_NAME",
"ISC_SEC_TYPE",
"ISC_SEC_NAME",
"ISC_SEC_TAG",
"ISC_SEC_VISIBLE",
"ISC_SEC_DATATYPE") AS
  select idx_name      isc_idx_name,
         max(sec_type) isc_sec_type,
         max(nvl(decode(oatid, 240102, sec_name), '')) isc_sec_name,
         max(nvl(decode(oatid, 240103, sec_name), '')) isc_sec_tag,
         max(nvl(decode(oatid, 240105,
                    decode(sec_name, 0, 'N', 1, 'Y')), '')) isc_sec_visible,
         max(nvl(decode(oatid, 240107,
                        decode(sec_name, 2, 'NUMBER', 5, 'VARCHAR2',
                               12, 'DATE', 23, 'RAW', 96, 'CHAR',
                               null)), '')) isc_sec_datatype
  from(
       select c.idx_name idx_name, c.idx_owner#, a.ixv_value sec_name,
              a.ixv_sub_group subg, a.ixv_sub_oat_id oatid,
              decode(mod(b.ixv_oat_id, 100), 1, 'ZONE', 2, 'FIELD',
                     3, 'SPECIAL', 4, 'STOP', 5, 'ATTR', 7, 'MDATA',
                     8, 'COLUMN SDATA', 9, 'COLUMN MDATA', 10, 'SDATA',
                     11, 'NDATA', null) sec_type
       from dr$index_value a, dr$index_value b, dr$index c
       where
              b.ixv_value      = to_char(a.ixv_sub_group)
          and b.ixv_sub_oat_id = 0
          and b.ixv_sub_group  = 0
          and b.ixv_idx_id     = c.idx_id
          and c.idx_owner#     = userenv('SCHEMAID')
      )
  group by subg, idx_name, idx_owner#
  order by isc_idx_name, isc_sec_type;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "CTXSYS"."CTX_USER_SESSION_SQES" ("SQE_OWNER",
"SQE_NAME",
"SQE_QUERY") AS
  select u.name sqe_owner,
       s.sqe_name sqe_name,
       s.sqe_query sqe_query
  from sys.user$ u, table(drvxmd.ctx_sqe_tbl_func) s
  where u.user# = s.sqe_owner# and
        u.user# = userenv('SCHEMAID');

