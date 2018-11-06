-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_PRIVATE_TO_ADMIN" ("X") AS
  select 1 x from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_LIST_OF_VALUES_DATA_V" ("ID",
"LOV_ID",
"LOV_DISP_SEQUENCE",
"LOV_DISP_VALUE",
"LOV_RETURN_VALUE",
"LOV_TEMPLATE",
"REQUIRED_PATCH") AS
  select id, lov_id, lov_disp_sequence, lov_disp_value, lov_return_value, lov_template, required_patch
  from wwv_flow_list_of_values_data w,
       (select wwv_flow_security.get_translated_flow_id flow_id from sys.dual) f
  where w.flow_id = f.flow_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_LISTS_OF_VALUES$_V" ("ID") AS
  select id from wwv_flow_lists_of_values$ w,
  (select wwv_flow_security.get_flow_id flow_id from sys.dual) f
  where   w.flow_id = f.flow_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_ACTIVITY_LOG" ("TIME_STAMP",
"COMPONENT_TYPE",
"COMPONENT_NAME",
"COMPONENT_ATTRIBUTE",
"INFORMATION",
"ELAP",
"NUM_ROWS",
"USERID",
"IP_ADDRESS",
"USER_AGENT",
"FLOW_ID",
"STEP_ID",
"SESSION_ID",
"SECURITY_GROUP_ID",
"SQLERRM",
"SQLERRM_COMPONENT_TYPE",
"SQLERRM_COMPONENT_NAME",
"PAGE_MODE",
"CACHED_REGIONS",
"CONTENT_LENGTH",
"APPLICATION_INFO",
"WORKSHEET_ID",
"IR_SEARCH",
"IR_REPORT_ID",
"WEBSHEET_ID",
"WEBPAGE_ID",
"DATAGRID_ID") AS
  select "TIME_STAMP","COMPONENT_TYPE","COMPONENT_NAME","COMPONENT_ATTRIBUTE","INFORMATION","ELAP","NUM_ROWS","USERID","IP_ADDRESS","USER_AGENT","FLOW_ID","STEP_ID","SESSION_ID","SECURITY_GROUP_ID","SQLERRM","SQLERRM_COMPONENT_TYPE","SQLERRM_COMPONENT_NAME","PAGE_MODE","CACHED_REGIONS","CONTENT_LENGTH","APPLICATION_INFO","WORKSHEET_ID","IR_SEARCH","IR_REPORT_ID","WEBSHEET_ID","WEBPAGE_ID","DATAGRID_ID" from wwv_flow_activity_log1$ union all
    select "TIME_STAMP","COMPONENT_TYPE","COMPONENT_NAME","COMPONENT_ATTRIBUTE","INFORMATION","ELAP","NUM_ROWS","USERID","IP_ADDRESS","USER_AGENT","FLOW_ID","STEP_ID","SESSION_ID","SECURITY_GROUP_ID","SQLERRM","SQLERRM_COMPONENT_TYPE","SQLERRM_COMPONENT_NAME","PAGE_MODE","CACHED_REGIONS","CONTENT_LENGTH","APPLICATION_INFO","WORKSHEET_ID","IR_SEARCH","IR_REPORT_ID","WEBSHEET_ID","WEBPAGE_ID","DATAGRID_ID" from wwv_flow_activity_log2$;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_USER_ACTIVITY_LOG" ("TIME_STAMP",
"COMPONENT_TYPE",
"COMPONENT_NAME",
"COMPONENT_ATTRIBUTE",
"INFORMATION",
"ELAP",
"NUM_ROWS",
"USERID",
"IP_ADDRESS",
"USER_AGENT",
"FLOW_ID",
"STEP_ID",
"SESSION_ID",
"SQLERRM",
"SQLERRM_COMPONENT_TYPE",
"SQLERRM_COMPONENT_NAME",
"PAGE_MODE",
"APPLICATION_INFO",
"WORKSHEET_ID",
"IR_SEARCH",
"IR_REPORT_ID",
"WEBSHEET_ID",
"WEBPAGE_ID",
"DATAGRID_ID",
"CONTENT_LENGTH") AS
  select time_stamp, component_type, component_name, component_attribute,
           information, elap, num_rows, userid, ip_address, user_agent,
           flow_id, step_id, session_id, sqlerrm, sqlerrm_component_type, sqlerrm_component_name,
           page_mode, application_info, worksheet_id, ir_search, ir_report_id, websheet_id, webpage_id, datagrid_id, content_length
      from wwv_flow_activity_log
     where security_group_id = (select wwv_flow.get_sgid from sys.dual where rownum = 1);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_USER_ACCESS_LOG_V" ("LOGIN_NAME",
"AUTHENTICATION_METHOD",
"APPLICATION",
"OWNER",
"ACCESS_DATE",
"IP_ADDRESS",
"REMOTE_USER",
"AUTHENTICATION_RESULT",
"CUSTOM_STATUS_TEXT",
"SECURITY_GROUP_ID") AS
  select login_name, authentication_method, application, owner, access_date, ip_address, remote_user, authentication_result, custom_status_text, security_group_id
      from wwv_flow_user_access_log1$
    union all
    select login_name, authentication_method, application, owner, access_date, ip_address, remote_user, authentication_result, custom_status_text, security_group_id
      from wwv_flow_user_access_log2$;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_USER_ACCESS_LOG" ("LOGIN_NAME",
"AUTHENTICATION_METHOD",
"APPLICATION",
"OWNER",
"ACCESS_DATE",
"IP_ADDRESS",
"REMOTE_USER",
"AUTHENTICATION_RESULT",
"CUSTOM_STATUS_TEXT") AS
  select login_name, authentication_method, application, owner, access_date, ip_address, remote_user, authentication_result, custom_status_text
      from wwv_flow_user_access_log_v
     where security_group_id = wwv_flow.get_sgid and security_group_id <> 0;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_BUILD_OPTIONS" ("ID",
"FLOW_ID",
"PATCH_NAME",
"PATCH_STATUS",
"SECURITY_GROUP_ID",
"DEFAULT_ON_EXPORT",
"ATTRIBUTE1",
"ATTRIBUTE2",
"ATTRIBUTE3",
"ATTRIBUTE4",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"CREATED_BY",
"CREATED_ON",
"PATCH_COMMENT") AS
  select "ID",
"FLOW_ID",
"PATCH_NAME",
"PATCH_STATUS",
"SECURITY_GROUP_ID",
"DEFAULT_ON_EXPORT",
"ATTRIBUTE1",
"ATTRIBUTE2",
"ATTRIBUTE3",
"ATTRIBUTE4",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"CREATED_BY",
"CREATED_ON",
"PATCH_COMMENT" from wwv_flow_patches;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_MONTHS_MON_TEMP" ("MONTH_DISPLAY",
"MONTH_VALUE") AS
  select to_char(to_date(to_char(rownum,'00'),'MM'),'Mon') month, rownum value from wwv_flow_dual100
where rownum < 13
union all
select '                    ', 20 from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_MONTHS_MON" ("MONTH_DISPLAY",
"MONTH_VALUE") AS
  select "MONTH_DISPLAY",
"MONTH_VALUE" from wwv_flow_months_mon_temp where month_value < 13;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_MONTHS_MONTH_TEMP" ("MONTH_DISPLAY",
"MONTH_VALUE") AS
  select to_char(to_date(to_char(rownum,'00'),'MM'),'Month') month, rownum value from wwv_flow_dual100
where rownum < 13
union all
select '                    ', 20 from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_MONTHS_MONTH" ("MONTH_DISPLAY",
"MONTH_VALUE") AS
  select "MONTH_DISPLAY",
"MONTH_VALUE" from wwv_flow_months_month_temp where month_value < 13;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_YEARS" ("YEAR_VALUE") AS
  select i+1919 from wwv_flow_dual100
union all
select i+2019 from wwv_flow_dual100 where i < 32;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_HOURS_24" ("HOUR_VALUE") AS
  select i-1 from wwv_flow_dual100 where i < 25;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_HOURS_12" ("HOUR_VALUE") AS
  select i from wwv_flow_dual100 where i < 13;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_MINUTES_5" ("MINUTE_VALUE") AS
  select (i-1)*5 from wwv_flow_dual100 where i < 13;

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_MINUTES" ("MINUTE_VALUE") AS
  select i-1 from wwv_flow_dual100 where i < 61;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_USER_MAIL_LOG" ("MAIL_TO",
"MAIL_FROM",
"MAIL_REPLYTO",
"MAIL_SUBJ",
"MAIL_CC",
"MAIL_BCC",
"MAIL_SEND_ERROR",
"LAST_UPDATED_ON") AS
  select mail_to, mail_from, mail_replyto, mail_subj, mail_cc, mail_bcc, mail_send_error, last_updated_on
      from wwv_flow_mail_log
     where security_group_id = (select wwv_flow.get_sgid from sys.dual where rownum = 1);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_USER_MAIL_QUEUE" ("ID",
"MAIL_TO",
"MAIL_FROM",
"MAIL_REPLYTO",
"MAIL_SUBJ",
"MAIL_CC",
"MAIL_BCC",
"MAIL_BODY",
"MAIL_BODY_HTML",
"MAIL_SEND_COUNT",
"MAIL_SEND_ERROR",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select id, mail_to, mail_from, mail_replyto, mail_subj, mail_cc, mail_bcc, mail_body, mail_body_html, mail_send_count, mail_send_error, last_updated_by, last_updated_on
      from wwv_flow_mail_queue
     where security_group_id = (select wwv_flow.get_sgid from sys.dual where rownum = 1);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_USER_MAIL_ATTACHMENTS" ("ID",
"MAIL_ID",
"FILENAME",
"MIME_TYPE",
"INLINE",
"ATTACHMENT",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select id, mail_id, filename, mime_type, inline, attachment, last_updated_by, last_updated_on
      from wwv_flow_mail_attachments
     where security_group_id = (select wwv_flow.get_sgid from sys.dual where rownum = 1);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_FILES" ("ID",
"FLOW_ID",
"NAME",
"FILENAME",
"TITLE",
"MIME_TYPE",
"DOC_SIZE",
"DAD_CHARSET",
"CREATED_BY",
"CREATED_ON",
"UPDATED_BY",
"UPDATED_ON",
"LAST_UPDATED",
"CONTENT_TYPE",
"BLOB_CONTENT",
"LANGUAGE",
"DESCRIPTION",
"FILE_TYPE",
"FILE_CHARSET") AS
  select id, flow_id, name, filename, title, mime_type, doc_size, dad_charset,
         created_by, created_on, updated_by, updated_on, last_updated, content_type,
         blob_content, language, description, file_type, file_charset
    from wwv_flow_file_objects$
   where security_group_id = wwv_flow.get_sgid and security_group_id <> 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_PLSQL_JOBS" ("ID",
"JOB",
"FLOW_ID",
"OWNER",
"ENDUSER",
"CREATED",
"MODIFIED",
"STATUS",
"SYSTEM_STATUS",
"SYSTEM_MODIFIED",
"SECURITY_GROUP_ID") AS
  select id, job, flow_id, owner, enduser, created, modified,
         status, system_status, system_modified, security_group_id
    from wwv_flow_jobs
   where security_group_id = (select nv('FLOW_SECURITY_GROUP_ID') sgid from sys.dual);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_COLLECTIONS" ("COLLECTION_NAME",
"SEQ_ID",
"C001",
"C002",
"C003",
"C004",
"C005",
"C006",
"C007",
"C008",
"C009",
"C010",
"C011",
"C012",
"C013",
"C014",
"C015",
"C016",
"C017",
"C018",
"C019",
"C020",
"C021",
"C022",
"C023",
"C024",
"C025",
"C026",
"C027",
"C028",
"C029",
"C030",
"C031",
"C032",
"C033",
"C034",
"C035",
"C036",
"C037",
"C038",
"C039",
"C040",
"C041",
"C042",
"C043",
"C044",
"C045",
"C046",
"C047",
"C048",
"C049",
"C050",
"CLOB001",
"BLOB001",
"XMLTYPE001",
"N001",
"N002",
"N003",
"N004",
"N005",
"D001",
"D002",
"D003",
"D004",
"D005",
"MD5_ORIGINAL") AS
  select c.collection_name, m.seq_id, m.c001, m.c002, m.c003, m.c004, m.c005, m.c006, m.c007,
           m.c008, m.c009, m.c010, m.c011, m.c012, m.c013, m.c014, m.c015, m.c016, m.c017,
           m.c018, m.c019, m.c020, m.c021, m.c022, m.c023, m.c024, m.c025, m.c026, m.c027,
           m.c028, m.c029, m.c030, m.c031, m.c032, m.c033, m.c034, m.c035, m.c036, m.c037,
           m.c038, m.c039, m.c040, m.c041, m.c042, m.c043, m.c044, m.c045, m.c046, m.c047,
           m.c048, m.c049, m.c050, m.clob001, m.blob001, m.xmltype001, m.n001, m.n002, m.n003,
           m.n004, m.n005, m.d001, m.d002, m.d003, m.d004, m.d005, m.md5_original
      from wwv_flow_collections$ c, wwv_flow_collection_members$ m
     where c.session_id = (select v('SESSION') from sys.dual)
       and c.security_group_id = (select wwv_flow.get_sgid from sys.dual)
       and c.id = m.collection_id
       and c.flow_id = (select nv('FLOW_ID') from sys.dual);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_CLICKTHRU_LOG_V" ("CLICKDATE",
"CATEGORY",
"ID",
"FLOW_USER",
"IP",
"SECURITY_GROUP_ID") AS
  select clickdate, category, id, flow_user, ip, security_group_id
      from wwv_flow_clickthru_log$
    union all
    select clickdate, category, id, flow_user, ip, security_group_id
      from wwv_flow_clickthru_log2$;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_CLICKTHRU_LOG" ("CLICKDATE",
"CATEGORY",
"ID",
"FLOW_USER",
"IP") AS
  select clickdate, category, id, flow_user, ip
      from wwv_flow_clickthru_log_v
     where security_group_id = (select wwv_flow.get_sgid from sys.dual);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_TABSET_VIEW" ("D",
"R") AS
  select tab_set ||
       replace(' ('||
       max(decode(seq,1,tab_text,null))||
       max(decode(seq,2,', '||tab_text,null))||
       max(decode(seq,3,', '||tab_text,null))||
       max(decode(seq,4,'...',null))||
       ')','&'||'nbsp;',' ') d,
       tab_set r
from (
select tab_set, tab_text, tab_sequence, row_number() over (partition by tab_set order by tab_sequence nulls last) seq
from wwv_flow_tabs
where flow_id = (select v('FB_FLOW_ID') from sys.dual) ) x
group by tab_set;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_TABSET_VIEW2" ("D",
"R") AS
  select d,r from(
    select tab_set ||
           replace(' ('||
           max(decode(seq,1,tab_text,null))||
           max(decode(seq,2,', '||tab_text,null))||
           max(decode(seq,3,', '||tab_text,null))||
           max(decode(seq,4,'...',null))||
           ')','&'||'nbsp;',' ') d,
           tab_set r, 1 ob
    from (
    select tab_set, tab_text, tab_sequence, row_number() over (partition by tab_set order by tab_sequence nulls last) seq
    from wwv_flow_tabs
    where flow_id = (select v('FB_FLOW_ID') from sys.dual) ) x
    group by tab_set
    union
    (select CURRENT_ON_TABSET d,CURRENT_ON_TABSET r, 2 ob
       from wwv_flow_toplevel_tabs
      where flow_id = (select v('FB_FLOW_ID') from sys.dual)
      minus
     select tab_set d,tab_set r,2 ob
       from wwv_flow_tabs
      where flow_id = (select v('FB_FLOW_ID') from sys.dual) )
    )
order by ob;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_VERSION" ("SEQ",
"DATE_APPLIED",
"MAJOR_VERSION",
"MINOR_VERSION",
"PATCH_VERSION",
"VERSION",
"BANNER",
"COMMENTS") AS
  select seq,date_applied,major_version,minor_version,patch_version,
           major_version||'.'||minor_version||'.'||patch_version version,
           banner,comments
      from wwv_flow_version$
     where seq = (select max(seq)
                    from wwv_flow_version$);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_FORMAT_MASKS" ("D",
"R",
"T") AS
  select to_char((5234 + 10/100),'FML999G999G999G999G990D00') d, 'FML999G999G999G999G990D00' r, 'N' t from sys.dual
    union all
select trim(to_char((5234 + 10/100),'999G999G999G999G990D00')) d, '999G999G999G999G990D00' r, 'N' t from sys.dual
    union all
select trim(to_char((5234 + 10/100),'999G999G999G999G990D0000')) d, '999G999G999G999G990D0000' r, 'N' t from sys.dual
    union all
select trim(to_char(5234,'999G999G999G999G999G999G990')) d, '999G999G999G999G999G999G990' r, 'N' t from sys.dual
    union all
select trim(to_char((-5234 - 10/100),'999G999G999G999G990D00MI')) d, '999G999G999G999G990D00MI' r, 'N' t from sys.dual
    union all
select trim(to_char((-5234 - 10/100),'S999G999G999G999G990D00')) d, 'S999G999G999G999G990D00' r, 'N' t from sys.dual
    union all
select trim(to_char((-5234 - 10/100),'999G999G999G999G990D00PR')) d, '999G999G999G999G990D00PR' r, 'N' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-RR') d, 'DD-MON-RR' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY') d, 'DD-MON-YYYY' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON') d, 'DD-MON' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'RR-MON-DD') d, 'RR-MON-DD' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'YYYY-MM-DD') d, 'YYYY-MM-DD' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'fmDay, fmDD fmMonth, YYYY') d, 'fmDay, fmDD fmMonth, YYYY' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI') d, 'DD-MON-YYYY HH24:MI' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI:SS') d, 'DD-MON-YYYY HH24:MI:SS' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH:MIPM') d, 'DD-MON-YYYY HH:MIPM' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'Month') d, 'Month' r, 'D' t from sys.dual
    union all
select to_char(to_timestamp('20040112143012','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI') d, 'DD-MON-YYYY HH24:MI' r, 'T' t from sys.dual
    union all
select to_char(to_timestamp('20040112143012.8675309','YYYYMMDDHH24MISS.FF'),'DD-MON-YYYY HH24.MI.SSXFF') d, 'DD-MON-YYYY HH24.MI.SSXFF' r, 'T' t from sys.dual
    union all
select to_char(to_timestamp('20040112143012.8675309','YYYYMMDDHH24MISS.FF'),'DD-MON-YYYY HH:MI:SSXFF PM') d, 'DD-MON-YYYY HH:MI:SSXFF PM' r, 'T' t from sys.dual
    union all
select to_char(to_timestamp_tz('20040112143012','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI TZR') d, 'DD-MON-YYYY HH24:MI TZR' r, 'Z' t from sys.dual
    union all
select to_char(to_timestamp_tz('20040112143012.8675309','YYYYMMDDHH24MISS.FF'),'DD-MON-YYYY HH24.MI.SSXFF TZR') d, 'DD-MON-YYYY HH24.MI.SSXFF TZR' r, 'Z' t from sys.dual
    union all
select to_char(to_timestamp_tz('20040112143012.8675309','YYYYMMDDHH24MISS.FF'),'DD-MON-YYYY HH.MI.SSXFF PM TZR') d, 'DD-MON-YYYY HH.MI.SSXFF PM TZR' r, 'Z' t from sys.dual
    union all
select wwv_flow_lang.system_message('SINCE_DATE_MASK') d, 'SINCE' r, 'S' t from sys.dual
    union all
select wwv_flow_lang.system_message('BLOB_FORMAT_MASK') d, 'BLOB' r, 'Z' t from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_CHART_FORMAT_MASKS" ("D",
"R",
"T") AS
  select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-RR') d, '%dd-%MMM-%yy' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY') d, '%dd-%MMM-%yyyy' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON') d, '%dd-%MMM' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'RR-MON-DD') d, '%yy-%MMM-%dd' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'YYYY-MM-DD') d, '%yyyy-%MM-%dd' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'fmDay, fmDD fmMonth, YYYY') d, '%dddd, %dd %MMMM, %yyyy' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI') d, '%dd-%MMM-%yyyy %HH:%mm' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI:SS') d, '%dd-%MMM-%yyyy %HH:%mm:%ss' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH:MIPM') d, '%dd-%MMM-%yyyy %hh:%mm%tt' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'Month') d, '%MMMM' r, 'D' t from sys.dual
    union all
select to_char(to_timestamp('20040112143012','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI') d, '%dd-%MMM-%yyyy %HH:%mm' r, 'T' t from sys.dual
    union all
select to_char(to_date('20040112143012','YYYYMMDDHH24MISS'),'HH24:MI DD.MM.YYYY') d, '%HH:%mm %dd.%MM.%yyyy' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143012','YYYYMMDDHH24MISS'),'HH24:MI:SS DD.MM.YYYY') d, '%HH:%mm:%ss %dd.%MM.%yyyy' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143012','YYYYMMDDHH24MISS'),'HH:MIPM DD.MM.YYYY') d, '%HH:%mm%tt %dd.%MM.%yyyy' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD.MON.RR') d, '%dd.%MMM.%yy' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD.MON.YYYY') d, '%dd.%MMM.%yyyy' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD.MON') d, '%dd.%MMM' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'RR.MON.DD') d, '%yy.%MMM.%dd' r, 'D' t from sys.dual
    union all
select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'YYYY.MM.DD') d, '%yyyy.%MM.%dd' r, 'D' t from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_TEMPLATES_ALL" ("SECURITY_GROUP_ID",
"FLOW_ID",
"THEME_ID",
"THEME_CLASS_ID",
"TEMP_TYPE",
"NAME",
"ID") AS
  with sgid as (
    select (select nv('FLOW_SECURITY_GROUP_ID') from sys.dual) sgid
      from sys.dual )
select security_group_id, flow_id, theme_id, theme_class_id, 'PAGE' temp_type, name ,id from wwv_flow_templates,sgid where security_group_id=sgid -- page
union all
select security_group_id, flow_id, theme_id, theme_class_id, 'REGION' temp_type, PAGE_PLUG_TEMPLATE_NAME ,id from wwv_flow_page_plug_templates,sgid where security_group_id=sgid -- region
union all
select security_group_id, flow_id, theme_id, theme_class_id, 'REPORT' temp_type, ROW_TEMPLATE_NAME ,id from wwv_flow_row_templates,sgid where security_group_id=sgid -- report
union all
select security_group_id, flow_id, theme_id, theme_class_id, 'LIST' temp_type, LIST_TEMPLATE_NAME ,id from wwv_flow_list_templates,sgid where security_group_id=sgid -- list
union all
select security_group_id, flow_id, theme_id, theme_class_id, 'LABEL' temp_type, TEMPLATE_NAME ,id from wwv_flow_field_templates,sgid where security_group_id=sgid -- label
union all
select security_group_id, flow_id, theme_id, theme_class_id, 'BUTTON' temp_type, TEMPLATE_NAME ,id from wwv_flow_button_templates,sgid where security_group_id=sgid -- button
union all
select security_group_id, flow_id, theme_id, theme_class_id, 'MENU' temp_type, name ,id from wwv_flow_menu_templates,sgid where security_group_id=sgid -- menu
union all
select security_group_id, flow_id, theme_id, theme_class_id, 'CALENDAR' temp_type, name  ,id from wwv_flow_cal_templates,sgid where security_group_id=sgid -- calendar
union all
select security_group_id, flow_id, theme_id, theme_class_id, 'POPUP' temp_type, page_name ,id from wwv_flow_popup_lov_template,sgid where security_group_id=sgid -- popup_lov;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_TEMPLATES_USED" ("SECURITY_GROUP_ID",
"FLOW_ID",
"TEMP_TYPE",
"ID",
"NAME",
"THEME_ID",
"THEME_CLASS_ID") AS
  select t."SECURITY_GROUP_ID",t."FLOW_ID",t."TEMP_TYPE",t."ID", a.name, to_char(a.theme_id),a.theme_class_id from (
select security_group_id, flow_id, 'PAGE' temp_type ,step_template id from wwv_flow_steps where step_template is not null
union all
select security_group_id, flow_id, 'PAGE' temp_type ,error_template from wwv_flow_themes where error_template is not null
union all
select security_group_id, flow_id, 'PAGE' temp_type ,printer_friendly_template from wwv_flow_themes where printer_friendly_template is not null
-- region
union all
select security_group_id, flow_id, 'REGION', plug_template from wwv_flow_page_plugs where (plug_template != 0 and plug_template is not null)
-- report
union all
select security_group_id, flow_id,'REPORT',plug_query_row_template from wwv_flow_page_plugs where (plug_query_row_template not in (1,2,3) and plug_query_row_template is not null)
-- list
union all
select security_group_id, flow_id,'LIST',list_template_id from wwv_flow_page_plugs where list_template_id is not null
-- label
union all
select security_group_id, flow_id, 'LABEL',item_field_template from wwv_flow_step_items where item_field_template is not null
-- button
union all
select security_group_id, flow_id,'BUTTON',to_number(substr(button_image,10)) from wwv_flow_step_buttons where substr(button_image,1,9) = 'template:'
union all
select security_group_id, flow_id,'BUTTON',to_number(substr(tag_attributes,10)) from wwv_flow_step_items where substr(tag_attributes,1,9) = 'template:'
-- menu
union all
select security_group_id, flow_id,'MENU',menu_template_id from wwv_flow_page_plugs where menu_template_id is not null
-- calendar
union all
select security_group_id, flow_id, 'CALENDAR',template_id from wwv_flow_cals where template_id is not null
) t,
  wwv_flow_templates_all a,
  ( select (select nv('FLOW_SECURITY_GROUP_ID') from sys.dual) sgid
      from sys.dual )
where a.temp_type         = t.temp_type
  and a.id                = t.id
  and a.security_group_id = t.security_group_id
  and a.security_group_id = sgid
  and t.security_group_id = sgid;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_MULTI_COMPONENT_EXPORT" ("FLOW_ID",
"SEQ_ID",
"COMPONENT_TYPE",
"COMPONENT_NAME",
"COMPONENT_ID") AS
  select c.flow_id as flow_id,
       seq_id,
       component_type,
       case component_type
         when 'PAGE TEMPLATE'          then (select name from wwv_flow_templates where id = c.component_id and flow_id = c.flow_id)
         when 'LIST'                   then (select name from wwv_flow_lists where id = c.component_id and flow_id = c.flow_id)
         when 'BREADCRUMB'             then (select name from wwv_flow_menus where id = c.component_id and flow_id = c.flow_id)
         when 'BUTTON TEMPLATE'        then (select template_name from wwv_flow_button_templates where id = c.component_id and flow_id = c.flow_id)
         when 'REGION TEMPLATE'        then (select page_plug_template_name from wwv_flow_page_plug_templates where id = c.component_id and flow_id = c.flow_id)
         when 'LIST TEMPLATE'          then (select list_template_name from wwv_flow_list_templates where id = c.component_id and flow_id = c.flow_id)
         when 'REPORT TEMPLATE'        then (select row_template_name from wwv_flow_row_templates where id = c.component_id and flow_id = c.flow_id)
         when 'LABEL TEMPLATE'         then (select template_name from wwv_flow_field_templates where id = c.component_id and flow_id = c.flow_id)
         when 'BREADCRUMB TEMPLATE'    then (select name from wwv_flow_menu_templates where id = c.component_id and flow_id = c.flow_id)
         when 'CALENDAR TEMPLATE'      then (select name from wwv_flow_cal_templates where id = c.component_id and flow_id = c.flow_id)
         when 'SHORTCUTS'              then (select shortcut_name from wwv_flow_shortcuts where id = c.component_id and flow_id = c.flow_id)
         when 'POPUP LOV TEMPLATE'     then (select page_title from wwv_flow_popup_lov_template where flow_id = c.flow_id)
         when 'PAGE'                   then (select id||'. '||name n from wwv_flow_steps where id = c.component_id and flow_id = c.flow_id)
         when 'TAB'                    then (select tab_set||': '||tab_name||' ('||tab_text||')' n from wwv_flow_tabs where id = c.component_id and flow_id = c.flow_id)
         when 'PARENT TAB'             then (select tab_set||': '||tab_name||' ('||tab_text||')' n from wwv_flow_toplevel_tabs where id = c.component_id and flow_id = c.flow_id)
         when 'LOV'                    then (select lov_name n from wwv_flow_lists_of_values$ where id = c.component_id and flow_id = c.flow_id)
         when 'NAVBAR'                 then (select icon_sequence||'. '||icon_image_alt||' ('||icon_image||')' n from wwv_flow_icon_bar where id = c.component_id and flow_id = c.flow_id)
         when 'SECURITY SCHEME'        then (select name n from wwv_flow_security_schemes where id = c.component_id and flow_id = c.flow_id)
         when 'TREE'                   then (select tree_name n from wwv_flow_trees where id = c.component_id and flow_id = c.flow_id)
         when 'PAGE GROUP'             then (select group_name n from wwv_flow_page_groups where id = c.component_id and flow_id = c.flow_id)
         when 'APP ITEM'               then (select name from wwv_flow_items where id = c.component_id and flow_id = c.flow_id)
         when 'APP PROCESS'            then (select process_name n from wwv_flow_processing where id = c.component_id and flow_id = c.flow_id)
         when 'APP COMPUTATION'        then (select computation_sequence||'. '||computation_item n from wwv_flow_computations where id = c.component_id and flow_id = c.flow_id)
         when 'BREADCRUMB ENTRY'       then (select (select name from wwv_flow_menus where id = be.menu_id)||': '||short_name||' ('||page_id||')' n from wwv_flow_menu_options be where id = c.component_id and flow_id = c.flow_id)
         when 'SHARED QUERY'           then (select name from wwv_flow_shared_queries where id = c.component_id and flow_id = c.flow_id)
         when 'REPORT LAYOUT'          then (select report_layout_name from wwv_flow_report_layouts where id = c.component_id and flow_id = c.flow_id)
         when 'WEB SERVICE'            then (select name from wwv_flow_shared_web_services where id = c.component_id and flow_id = c.flow_id)
         when 'DATA LOADING'           then (select name from wwv_flow_load_tables where id = c.component_id and flow_id = c.flow_id)
         when 'AUTH SETUP'             then (select name from wwv_flow_authentications where id = c.component_id and flow_id = c.flow_id)
         when 'BUILD OPTION STATUS'    then (select patch_name from wwv_flow_patches where id = c.component_id and flow_id = c.flow_id)
         when 'BUILD OPTION'           then (select patch_name from wwv_flow_patches where id = c.component_id and flow_id = c.flow_id)
         when 'PLUGIN'                 then (select display_name from wwv_flow_plugins where id = c.component_id and flow_id = c.flow_id)
         when 'MESSAGES'               then (select name from wwv_flow_messages$ where id = c.component_id and flow_id = c.flow_id)
         end           as component_name,
       c.component_id
  from ( select to_number(c003) as flow_id,
                seq_id,
                c001            as component_type,
                to_number(c002) as component_id
           from wwv_flow_collections
          where collection_name = 'MULTI_COMPONENT_EXPORT' ) c
;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_NATIVE_PLUGINS" ("ID",
"PLUGIN_TYPE",
"NAME",
"NAME_WITH_PREFIX",
"DISPLAY_NAME",
"CATEGORY",
"SUPPORTED_UI_TYPES",
"STANDARD_ATTRIBUTES",
"SQL_MIN_COLUMN_COUNT",
"SQL_MAX_COLUMN_COUNT",
"SQL_EXAMPLES") AS
  select id,
       plugin_type,
       name,
       'NATIVE_'||name as name_with_prefix,
       display_name,
       category,
       supported_ui_types,
       standard_attributes,
       sql_min_column_count,
       sql_max_column_count,
       sql_examples
  from wwv_flow_plugins
 where flow_id           = nvl((select wwv_flow_lang.get_translated_application_id(4411) from sys.dual), 4411)
   and security_group_id = 10
;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_JAVASCRIPT_EVENTS" ("D",
"R",
"G",
"SUPPORTED_UI_TYPES") AS
  select d, r, g, supported_ui_types
  from ( select 1            as order_by,
                '1'          as order_by2,
                wwv_flow_lang.system_message('EVENT.BROWSER.' || name) as d,
                name         as r,
                wwv_flow_lang.system_message('EVENT.BROWSER') as g,
                supported_ui_types
           from wwv_flow_standard_events
          where event_type = 'BROWSER'
          union all
        select  2            as order_by,
                '1'          as order_by2,
                wwv_flow_lang.system_message('EVENT.FRAMEWORK.' || name) as d,
                name         as r,
                wwv_flow_lang.system_message('EVENT.FRAMEWORK') as g,
                supported_ui_types
           from wwv_flow_standard_events
          where event_type = 'APEX'
          union all
         select 3               as order_by,
                p.display_name  as order_by2,
                e.display_name || ' [' || p.display_name || ']'             as d,
                p.name_with_prefix || '|' || p.plugin_type || '|' || e.name as r,
                wwv_flow_lang.system_message('EVENT.COMPONENT')             as g,
                p.supported_ui_types
           from ( select id,
                         display_name,
                         plugin_type,
                         name_with_prefix,
                         supported_ui_types
                    from wwv_flow_native_plugins p
                   union all
                  select id,
                         display_name,
                         plugin_type,
                         'PLUGIN_' || name,
                         supported_ui_types
                    from wwv_flow_plugins
                   where flow_id           = (select nv('FB_FLOW_ID') from sys.dual)
                     and security_group_id = (select nv('FLOW_SECURITY_GROUP_ID') sgid from sys.dual)
                ) p,
                wwv_flow_plugin_events e
          where e.plugin_id = p.id
          union all
         select 4            as order_by,
                '1'          as order_by2,
                wwv_flow_lang.system_message('EVENT.CUSTOM.' || name) as d,
                name         as r,
                wwv_flow_lang.system_message('EVENT.CUSTOM') as g,
                supported_ui_types
           from wwv_flow_standard_events
          where event_type = 'CUSTOM'
          order by order_by, order_by2, d)
;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_FEEDBACK_TYPES" ("ID",
"THE_NAME") AS
  select 1 id, wwv_flow_lang.system_message('GENERAL_COMMENT') the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('ENHANCEMENT_REQUEST') the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('BUG') the_name from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_FEEDBACK_STATUS" ("ID",
"THE_NAME") AS
  select 0 id, wwv_flow_lang.system_message('NO_STATUS') the_name from sys.dual union all
select 1 id, wwv_flow_lang.system_message('ACKNOWLEDGED') the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('ADDITIONAL_INFORMATION_REQUESTED') the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('OPEN_PROCESSING_FEEDBACK') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('CLOSED') the_name from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_PKG_APP_INSTALL_LOG" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"APPLICATION_TYPE",
"APPLICATION_DESCRIPTION",
"WORKSPACE_ID",
"APPLICATION_VERSION",
"BUILD_VERSION",
"INSTALLED_BUILD_VERSION",
"LOG_SEQUENCE",
"LOG_EVENT",
"LOG_TYPE",
"START_TIME",
"END_TIME",
"ERROR_MESSAGE",
"CREATED_BY",
"CREATED_ON",
"UPDATED_BY",
"UPDATED_ON",
"INSTALL_LOG_ID") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.app_id                         application_id,
    t.app_name                       application_name,
    t.app_type                       application_type,
    t.app_description                application_description,
    f.security_group_id              workspace_id,
    --
    f.app_version                    application_version,
    f.build_version                  build_version,
    f.installed_build_version        installed_build_version,
    f.log_seq                        log_sequence,
    f.log_event                      log_event,
    f.log_type                       log_type,
    f.started                        start_time,
    f.ended                          end_time,
    f.err_msg                        error_message,
    f.created_by                     created_by,
    f.created_on                     created_on,
    f.updated_by                     updated_by,
    f.updated_on                     updated_on,
    f.id                             install_log_id
    --
from wwv_flow_pkg_applications t,
     wwv_flow_pkg_app_install_log f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      f.app_id              = t.row_key and
      t.app_type            = 'DB' and
      f.app_type            = 'DATABASE' and
     --
      (d.sgid != 0 or nvl(t.APP_STATUS,'x') not in ('COMING_SOON','HIDDEN')) and
      w.PROVISIONING_COMPANY_ID not in (0,11);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_RT$SERVICES" ("SECURITY_GROUP_ID",
"MODULE_ID",
"MODULE_NAME",
"MODULE_URI_PREFIX",
"MODULE_PARSING_SCHEMA",
"MODULE_ORIGINS_ALLOWED",
"TEMPLATE_ID",
"TEMPLATE_URI_TEMPLATE",
"TEMPLATE_PRIORITY",
"TEMPLATE_ETAG_TYPE",
"TEMPLATE_ETAG_QUERY",
"HANDLER_ID",
"HANDLER_SOURCE_TYPE",
"HANDLER_FORMAT",
"HANDLER_METHOD",
"HANDLER_MIMES_ALLOWED",
"HANDLER_SOURCE",
"HANDLER_REQUIRE_HTTPS",
"PRIVILEGE_ID",
"ITEMS_PER_PAGE",
"URI",
"PRIVILEGE_NAME",
"PRIVILEGE_LABEL") AS
  select x."SECURITY_GROUP_ID",x."MODULE_ID",x."MODULE_NAME",x."MODULE_URI_PREFIX",x."MODULE_PARSING_SCHEMA",x."MODULE_ORIGINS_ALLOWED",x."TEMPLATE_ID",x."TEMPLATE_URI_TEMPLATE",x."TEMPLATE_PRIORITY",x."TEMPLATE_ETAG_TYPE",x."TEMPLATE_ETAG_QUERY",x."HANDLER_ID",x."HANDLER_SOURCE_TYPE",x."HANDLER_FORMAT",x."HANDLER_METHOD",x."HANDLER_MIMES_ALLOWED",x."HANDLER_SOURCE",x."HANDLER_REQUIRE_HTTPS",x."PRIVILEGE_ID",x."ITEMS_PER_PAGE",x."URI",
       p.name  as privilege_name,
       p.label as privilege_label
  from ( select m.security_group_id,
                m.id              as module_id,
                m.name            as module_name,
                m.uri_prefix      as module_uri_prefix,
                m.parsing_schema  as module_parsing_schema,
                m.origins_allowed as module_origins_allowed,
                t.id              as template_id,
                t.uri_template    as template_uri_template,
                t.priority        as template_priority,
                t.etag_type       as template_etag_type,
                t.etag_query      as template_etag_query,
                h.id              as handler_id,
                h.source_type     as handler_source_type,
                h.format          as handler_format,
                h.method          as handler_method,
                h.mimes_allowed   as handler_mimes_allowed,
                h.source          as handler_source,
                h.require_https   as handler_require_https,
                nvl(h.privilege_id, m.privilege_id)     as privilege_id,
                nvl(h.items_per_page, m.items_per_page) as items_per_page,
                m.uri_prefix||t.uri_template            as uri
           from wwv_flow_rt$modules m,
                wwv_flow_rt$templates t,
                wwv_flow_rt$handlers h,
                wwv_flow_companies c
          where m.status            = 'PUBLISHED'
            and t.security_group_id = m.security_group_id
            and t.module_id         = m.id
            and h.security_group_id = t.security_group_id
            and h.template_id       = t.id
            and c.provisioning_company_id = t.security_group_id
            and c.allow_restful_services_yn      = 'Y'
            and exists ( select 1
                           from wwv_flow_platform_prefs
                          where name = 'RESTFUL_SERVICES_ENABLED'
                            and value  = 'Y' )
       ) x,
       wwv_flow_rt$privileges p
 where p.id (+) = x.privilege_id
 order by template_priority desc, template_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_RT$IDM_PRIVS" ("SECURITY_GROUP_ID",
"PRIVILEGE_ID",
"GROUP_ID",
"GROUP_NAME") AS
  select pg.security_group_id,
       pg.privilege_id,
       g.id         as group_id,
       g.group_name
  from wwv_flow_rt$privilege_groups pg,
       wwv_flow_fnd_user_groups g
 where g.id                = pg.user_group_id
   and g.security_group_id in (pg.security_group_id,10);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_RT$APEX_ACCOUNT_PRIVS" ("SECURITY_GROUP_ID",
"PRIVILEGE_ID",
"USER_NAME") AS
  select u.security_group_id,
       pg.privilege_id,
       u.user_name
  from wwv_flow_rt$privilege_groups pg,
       wwv_flow_fnd_group_users gu,
       wwv_flow_fnd_user u
 where gu.group_id          = pg.user_group_id
   and pg.security_group_id in (gu.security_group_id,10)
   and u.user_id            = gu.user_id
   and u.security_group_id  = gu.security_group_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_USERS" ("USER_ID",
"USER_NAME",
"FIRST_NAME",
"LAST_NAME",
"KNOWN_AS",
"LAST_UPDATE_DATE",
"LAST_UPDATED_BY",
"CREATION_DATE",
"CREATED_BY",
"START_DATE",
"END_DATE",
"DESCRIPTION",
"PASSWORD_DATE",
"PASSWORD_ACCESSES_LEFT",
"PASSWORD_LIFESPAN_ACCESSES",
"PASSWORD_LIFESPAN_DAYS",
"EMPLOYEE_ID",
"PERSON_TYPE",
"EMAIL_ADDRESS",
"PERSON_ID",
"SECURITY_GROUP_ID",
"DEFAULT_SCHEMA",
"ALLOW_ACCESS_TO_SCHEMAS",
"DEFAULT_DATE_FORMAT",
"ATTRIBUTE_01",
"ATTRIBUTE_02",
"ATTRIBUTE_03",
"ATTRIBUTE_04",
"ATTRIBUTE_05",
"ATTRIBUTE_06",
"ATTRIBUTE_07",
"ATTRIBUTE_08",
"ATTRIBUTE_09",
"ATTRIBUTE_10",
"LAST_LOGIN",
"BUILDER_LOGIN_COUNT",
"LAST_AGENT",
"LAST_IP",
"ACCOUNT_LOCKED",
"ACCOUNT_EXPIRY",
"FAILED_ACCESS_ATTEMPTS",
"FIRST_PASSWORD_USE_OCCURRED",
"CHANGE_PASSWORD_ON_FIRST_USE",
"LAST_FAILED_LOGIN") AS
  select
		user_id,
		user_name,
		first_name,
		last_name,
		known_as,
		last_update_date,
		last_updated_by,
		creation_date,
		created_by,
		start_date,
		end_date,
		description,
		password_date,
		password_accesses_left,
		password_lifespan_accesses,
		password_lifespan_days,
		employee_id,
		person_type,
		email_address,
		person_id,
		security_group_id,
		default_schema,
		allow_access_to_schemas,
		default_date_format,
		attribute_01,
		attribute_02,
		attribute_03,
		attribute_04,
		attribute_05,
		attribute_06,
		attribute_07,
		attribute_08,
		attribute_09,
		attribute_10,
		last_login,
		builder_login_count,
		last_agent,
		last_ip,
		account_locked,
		account_expiry,
		failed_access_attempts,
		first_password_use_occurred,
		change_password_on_first_use,
		last_failed_login
from wwv_flow_fnd_user
where security_group_id = (select nv('FLOW_SECURITY_GROUP_ID') s from sys.dual);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_GROUP_USERS" ("GROUP_ID",
"GROUP_NAME",
"USER_ID") AS
  select g.id group_id,
          g.group_name,
          ug.user_id
  from WWV_FLOW_FND_GROUP_USERS ug,
         WWV_FLOW_FND_USER_GROUPS g
where g.id = ug.group_id
   and ug.security_group_id = (
             select nv('FLOW_SECURITY_GROUP_ID') s
             from sys.dual);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_DEVELOPER_WORKSPACES" ("WORKSPACE_ID",
"WORKSPACE_SHORT_NAME",
"WORKSPACE_DISPLAY_NAME",
"WORKSPACE_IMAGE",
"DEVELOPER_NAME",
"WORKSPACE_STATUS") AS
  select ws.provisioning_company_id,
       ws.short_name,
       ws.display_name,
       ws.workspace_image,
       d.userid,
       ws.account_status
  from wwv_flow_developers d,
       wwv_flow_fnd_user   u,
       wwv_flow_companies  ws,
       ( select cloud_group_name current_group_name
           from wwv_flow_companies
          where provisioning_company_id = wwv_flow.get_security_group_id )
 where d.user_id                 = u.user_id
   and d.security_group_id       = u.security_group_id
   and d.security_group_id       = ws.provisioning_company_id
   and nvl(u.account_locked,'N') = 'N'
   and (    current_group_name   is null
         or ws.cloud_group_name  =  current_group_name );

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_WORKSPACE_USERS" ("WORKSPACE_ID",
"ICON_VIEW_ICON",
"ALT",
"LINK",
"ICON_VIEW_NAME",
"USER_ID",
"USER",
"eMail",
"FIRST_NAME",
"LAST_NAME",
"DF",
"DEVELOPER",
"LAST_LOGIN",
"LAST_LOGIN2",
"BUILDER_LOGIN_COUNT",
"UL",
"EXPIRATION",
"DESCRIPTION",
"PASSWORD_LIFESPAN_DAYS",
"PASSWORD_LIFESPAN_ACCESSES",
"PASSWORD_ACCESSES_LEFT",
"LAST_AGENT",
"LAST_IP",
"ACCOUNT_EXPIRY",
"FAILED_ACCESS_ATTEMPTS",
"CHANGE_PASSWORD_ON_FIRST_USE",
"FIRST_PASSWORD_USE_OCCURRED",
"DEV_TYPE",
"GROUP_ID",
"GROUP_NAME",
"LAST_UPDATE_DATE",
"LAST_UPDATED_BY",
"CREATION_DATE",
"CREATED_BY",
"DEVELOPER_TYPE",
"ALLOW_APP_BUILDING",
"ALLOW_SQL_WORKSHOP",
"ALLOW_WEBSHEET_DEV",
"ALLOW_TEAM_DEVOPMENT",
"IS_EXTERNAL_USER") AS
  select /* APEX4350P55a */
    u.security_group_id,
    case
     -- unlocked, expired
     when (nvl(u.account_locked,'N') = 'N' and
            ((wwv_flow_fnd_user_api.workspace_account_days_left(
            wwv_flow_user_api.get_username(user_id)) <= 0) or
            (nvl(wwv_flow_fnd_user_api.end_user_account_days_left(
            wwv_flow_user_api.get_username(user_id)),1) <= 0)))
     then image_prefix||'htmldb/icons/user_'||
          decode(nvl(d.is_admin,'N'),'Y','red',
          decode(nvl(d.is_developer,'N'),'Y','yellow','green'))
          ||'_exp.gif'
     -- locked, expired
     when (nvl(u.account_locked,'N') = 'Y' and
            ((wwv_flow_fnd_user_api.workspace_account_days_left(
            wwv_flow_user_api.get_username(user_id)) <= 0) or
            (nvl(wwv_flow_fnd_user_api.end_user_account_days_left(
            wwv_flow_user_api.get_username(user_id)),1) <= 0)))
     then image_prefix||'htmldb/icons/user_'||
          decode(nvl(d.is_admin,'N'),'Y','red',
          decode(nvl(d.is_developer,'N'),'Y','yellow','green'))
          ||'_locked_exp.gif'
     -- locked, unexpired
     when (nvl(u.account_locked,'N') = 'Y' and
            (wwv_flow_fnd_user_api.workspace_account_days_left(
            wwv_flow_user_api.get_username(user_id)) > 0) and
            (nvl(wwv_flow_fnd_user_api.end_user_account_days_left(
            wwv_flow_user_api.get_username(user_id)),1) > 0))
     then image_prefix||'htmldb/icons/user_'||
          decode(nvl(d.is_admin,'N'),'Y','red',
          decode(nvl(d.is_developer,'N'),'Y','yellow','green'))
          ||'_locked.gif'
     else
          -- unlocked and unexpired
          image_prefix||'htmldb/icons/user_'||
          decode(nvl(d.is_admin,'N'),'Y','red',
          decode(nvl(d.is_developer,'N'),'Y','yellow','green'))||'.gif'
    end icon_view_icon,
u.email_address alt,
'f?p=4350:56:'||app_session||'.::NO:EDIT_USER_PRIVS:F4350_P56_USER_ID,LAST_VIEW:'||USER_ID||',55:' link,
replace(replace(replace(u.user_name,'_',' '),'.','. '),'@','@ ') icon_view_name,
--
      USER_ID,
      u.user_name "USER",
      u.email_address "eMail",
      u.first_name,
      u.last_name,
      replace(u.default_schema,'%'||'null%',null) df,
      decode(nvl(d.is_developer,'N'),'Y', (select case
              when (wwv_flow_fnd_user_api.workspace_account_days_left(
                    wwv_flow_user_api.get_username(user_id)) > 0)
              then m.password_valid
          else m.password_expired
              end expiration from sys.dual),
             m.no_developer_priv) developer,
      decode (nvl(d.is_developer,'N'),'Y',last_login,null) last_login,
      decode (nvl(d.is_developer,'N'),'Y',last_login,null) last_login2,
      decode (nvl(d.is_developer,'N'),'Y',
          nvl(builder_login_count,0),null) builder_login_count,
      decode(nvl(u.account_locked,'N'),'Y',m.yes,m.n)ul,
     case
     when (wwv_flow_fnd_user_api.end_user_account_days_left(
           wwv_flow_user_api.get_username(user_id)) > 0)
     then m.password_valid
     else m.password_expired
    end expiration,
u.DESCRIPTION,
u.PASSWORD_LIFESPAN_DAYS,
u.PASSWORD_LIFESPAN_ACCESSES,
u.PASSWORD_ACCESSES_LEFT,
u.LAST_AGENT,
u.LAST_IP,
u.ACCOUNT_EXPIRY,
u.FAILED_ACCESS_ATTEMPTS,
u.CHANGE_PASSWORD_ON_FIRST_USE,
u.FIRST_PASSWORD_USE_OCCURRED,
case
  when d.is_admin='Y' then m.admin
  when d.is_developer='Y' then m.dev
  else m.end_user
end dev_type,
wwv_flow_utilities.table_to_string(
    cast(multiset(
            select to_char(group_id)
            from WWV_FLOW_FND_GROUP_USERS
            where user_id = u.user_id
            order by group_id)
        as vc4000array),
    ','),
wwv_flow_utilities.table_to_string(
    cast(multiset(
             select group_name
             from WWV_FLOW_FND_USER_GROUPS g,
                  WWV_FLOW_FND_GROUP_USERS gu
             where g.id = gu.group_id
               and gu.user_id = u.user_id
             order by gu.group_id)
        as vc4000array),
    ','),
LAST_UPDATE_DATE,
LAST_UPDATED_BY,
CREATION_DATE,
CREATED_BY,
nvl(d.developer_type,'END_USER') developer_type,
decode(nvl(ALLOW_APP_BUILDING_YN,'Y'),'Y',m.yes,m.n) ALLOW_APP_BUILDING,
decode(nvl(ALLOW_SQL_WORKSHOP_YN,'Y'),'Y',m.yes,m.n) ALLOW_SQL_WORKSHOP,
decode(nvl(ALLOW_WEBSHEET_DEV_YN,'Y'),'Y',m.yes,m.n) ALLOW_WEBSHEET_DEV,
decode(nvl(ALLOW_TEAM_DEVELOPMENT_YN,'Y'),'Y',m.yes,m.n) ALLOW_TEAM_DEVOPMENT,
case when u.person_type='E' then 'Y' else 'N' end is_external_user
from  WWV_FLOW_FND_USER u,
   (select USERID,
           security_group_id,
           decode(instr(DEVELOPER_ROLE||'x','ADMIN'),0,'N','Y') is_admin,
           decode(instr(DEVELOPER_ROLE||'x','EDIT'),0,'N','Y')  is_developer,
           case
           when instr(DEVELOPER_ROLE,'BASIC_DEV') > 0 then
              'BASIC_DEV'
           when instr(DEVELOPER_ROLE,'ADMIN') > 0 then
              'ADMIN'
           when instr(DEVELOPER_ROLE,'CREATE') > 0 then
              'DEVELOPER'
           else
              'UNKNOWN'
           end developer_type
    from WWV_FLOW_DEVELOPERS ) d,
    (select wwv_flow_lang.system_message('F4000.NO') n,
            wwv_flow_lang.system_message('F4000.YES') yes,
            wwv_flow_lang.system_message('PASSWORD_VALID') password_valid,
            wwv_flow_lang.system_message('PASSWORD_EXPIRED') password_expired,
            wwv_flow_lang.system_message('NO_DEVELOPER_PRIV') no_developer_priv,
            wwv_flow_lang.system_message('DEVELOPER') dev,
            wwv_flow_lang.system_message('ADMINISTATOR') admin,
            wwv_flow_lang.system_message('END_USER') end_user,
            wwv_flow_lang.system_message('BASIC_DEVELOPER') basic_developer,
            v('IMAGE_PREFIX') image_prefix,
            v('APP_SESSION')  app_session
     from sys.dual) m
where u.user_name         = d.userid (+)
  and u.security_group_id = d.security_group_id (+);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_WS_APP_AND_AUTH" ("ID",
"SECURITY_GROUP_ID",
"NAME",
"STATUS",
"HOME_PAGE_ID",
"DATE_FORMAT",
"LANGUAGE",
"TERRITORY",
"SHOW_RESET_PASSWD_YN",
"EMAIL_FROM",
"OWNER",
"DESCRIPTION",
"LOGIN_PAGE_MESSAGE",
"LOGO_TYPE",
"LOGO_TEXT",
"LOGO_TEXT_ATTRIBUTES",
"LOGO_IMAGE",
"LOGO_IMAGE_ATTRIBUTES",
"LOGO_FILEPATH",
"LOGO_FILEPATH_ATTRIBUTES",
"AUTH_ID",
"AUTHENTICATION",
"LOGOUT_URL",
"LDAP_HOST",
"LDAP_PORT",
"LDAP_USE_SSL",
"LDAP_USE_EXACT_DN",
"LDAP_STRING",
"LDAP_SEARCH_FILTER",
"LDAP_EDIT_FUNCTION",
"LDAP_USERNAME_ESCAPING",
"PAGE_SENTRY_FUNCTION",
"SESS_VERIFY_FUNCTION",
"PRE_AUTH_PROCESS",
"AUTH_FUNCTION",
"POST_AUTH_PROCESS",
"INVALID_SESSION_URL",
"COOKIE_NAME",
"COOKIE_PATH",
"COOKIE_DOMAIN",
"USE_SECURE_COOKIE_YN",
"ACL_TYPE",
"ALLOW_PUBLIC_ACCESS_YN",
"SHOW_PEER_NAVIGATION_YN",
"SHOW_CHILD_NAVIGATION_YN",
"SHOW_ANNOTATIONS_CONTROL_YN",
"ALLOW_SQL_YN",
"CREATED_BY",
"CREATED_ON",
"UPDATED_BY",
"UPDATED_ON") AS
  select
    app.id,
    app.security_group_id,
    app.name,
    app.status,
    app.home_page_id,
    app.date_format,
    app.language,
    app.territory,
    app.show_reset_passwd_yn,
    app.email_from,
    app.owner,
    app.description,
    app.login_page_message,
    app.logo_type,
    app.logo_text,
    app.logo_text_attributes,
    app.logo_image,
    app.logo_image_attributes,
    app.logo_filepath,
    app.logo_filepath_attributes,
    --
    -- authentication
    --
    app.auth_id,
    case
      when sys.dbms_lob.substr(auth.auth_function,10) = '-BUILTIN-'    then '1' -- apex auth
      when auth.invalid_session_url                   = '-PORTAL_SSO-' then '2' -- sso
      when sys.dbms_lob.substr(auth.auth_function,10) = '-LDAP-'       then '3' -- ldap
      when auth.invalid_session_url                   = '-CLOUD_IDM-'  then '5' -- cloud idm
      when auth.id is not null                                         then '4' -- custom
      else                                                                  '0' -- unknown - should not happen
    end,
    auth.logout_url,
    auth.ldap_host,
    auth.ldap_port,
    auth.ldap_use_ssl,
    auth.ldap_use_exact_dn,
    auth.ldap_string,
    auth.ldap_search_filter,
    auth.ldap_edit_function,
    auth.ldap_username_escaping,
    auth.page_sentry_function,
    auth.sess_verify_function,
    auth.pre_auth_process,
    auth.auth_function,
    auth.post_auth_process,
    auth.invalid_session_url,
    auth.cookie_name,
    auth.cookie_path,
    auth.cookie_domain,
    auth.use_secure_cookie_yn,
    --
    -- authorization
    --
    app.acl_type,
    app.allow_public_access_yn,
    --
    -- preferences
    --
    app.show_peer_navigation_yn,
    app.show_child_navigation_yn,
    app.show_annotations_control_yn,
    app.allow_sql_yn,
    --
    -- audit
    --
    app.created_by,
    app.created_on,
    app.updated_by,
    app.updated_on
 from wwv_flow_ws_applications app,
      wwv_flow_ws_custom_auth_setups auth
where app.auth_id           = auth.id (+)
  and app.security_group_id = auth.security_group_id (+);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_DATA_VIEW" ("SESSION_ID",
"SECURITY_GROUP_ID",
"DATA_ITEM_ID",
"ITEM_SCOPE",
"ITEM_NAME",
"ITEM_DISPLAY_AS",
"ITEM_PROMPT",
"ITEM_VALUE",
"IS_ENCRYPTED",
"SESSION_STATE_STATUS",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME") AS
  select
       d.flow_instance,
       d.security_group_id,
       d.item_id,
       d.scope,
       d.item_name,
       d.item_display_as,
       d.item_prompt,
       case
         when d.is_encrypted = 'Y' then '*****'
         when d.item_value_clob is not null then
           sys.dbms_lob.substr(d.item_value_clob,4000)
         else
           d.item_value_vc2
       end item_value,
       decode(is_encrypted,'Y',m_yes, m_no) is_encrypted,
       case
         when session_state_status='I' then m_inserted
         when session_state_status='U' then m_updated
         when session_state_status='R' then m_reset_to_null
         when flow_id is null          then m_internal
         else                               m_unknown||' '||session_state_status
       end session_state_status,
       d.flow_id,
       (select name from wwv_flows where id = d.flow_id) application_name,
       page_id,
       page_name
  from ( select wwv_flow_lang.system_message('F4350.INSERTED') m_inserted,
                wwv_flow_lang.system_message('F4350.UPDATED')  m_updated,
                wwv_flow_lang.system_message('RESET_TO_NULL')  m_reset_to_null,
                wwv_flow_lang.system_message('INTERNAL')       m_internal,
                wwv_flow_lang.system_message('F4350.UNKNOWN')  m_unknown,
                wwv_flow_lang.system_message('F4000.YES')      m_yes,
                wwv_flow_lang.system_message('F4000.NO')       m_no
           from sys.dual ),
       ( select d.flow_instance,
                d.item_id,
                d.item_value_vc2,
                d.item_value_clob,
                d.is_encrypted,
                d.flow_id,
                d.session_state_status,
                s.security_group_id,
                i.scope,
                i.name item_name,
                null item_display_as,
                null item_prompt,
                to_number(null) page_id,
                null page_name,
                row_number() over (
                    partition by d.flow_instance,
                                 d.item_id
                        order by i.flow_id )
                    item_ident_nr
           from wwv_flow_data d,
                wwv_flow_sessions$ s,
                wwv_flow_items i
          where d.flow_instance                                   = s.id
            and i.security_group_id                               = s.security_group_id
            and i.scope                                           = 'GLOBAL'
            and wwv_flow_session_state.get_global_item_id(i.name) = d.item_id
            and d.item_id                                         < 0
          union all
         select d.flow_instance,
                d.item_id,
                d.item_value_vc2,
                d.item_value_clob,
                d.is_encrypted,
                d.flow_id,
                d.session_state_status,
                s.security_group_id,
                i.scope,
                i.name item_name,
                null,
                null,
                to_number(null),
                null,
                1
           from wwv_flow_data d,
                wwv_flow_sessions$ s,
                wwv_flow_items i
          where d.flow_instance     = s.id
            and i.security_group_id = s.security_group_id
            and i.scope             = 'APP'
            and i.id                = d.item_id
          union all
         select d.flow_instance,
                d.item_id,
                d.item_value_vc2,
                d.item_value_clob,
                d.is_encrypted,
                d.flow_id,
                d.session_state_status,
                s.security_group_id,
                'PAGE',
                i.name item_name,
                i.display_as,
                i.prompt,
                i.flow_step_id,
                ( select steps.name
                    from wwv_flow_steps steps
                   where steps.flow_id           = i.flow_id
                     and steps.id                = i.flow_step_id
                     and steps.security_group_id = i.security_group_id ),
                1
           from wwv_flow_data d,
                wwv_flow_sessions$ s,
                wwv_flow_step_items i
          where d.flow_instance     = s.id
            and i.security_group_id = s.security_group_id
            and i.id                = d.item_id ) d
 where item_ident_nr = 1;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_POOL_CONFIG" ("POOL_NAME",
"WORKSPACE_IDENTIFIER",
"URI",
"TYPE",
"UPDATED") AS
  select null                                  pool_name,
       c.short_name                          workspace_identifier,
       case when c.host_prefix is null
            then lower(c.path_prefix)
            else lower(c.host_prefix) end    as uri,
       case when c.host_prefix is null
            then 'BASE_PATH'
            else 'BASE_URL' end              as type,
       c.created_on                          updated
from   wwv_flow_companies c
where  c.provisioning_company_id not in (0,10,11)
and    c.account_status in ('AVAILABLE', 'ASSIGNED')
and    c.allow_restful_services_yn = 'Y'
and    exists (  select 1
                  from wwv_flow_platform_prefs
                 where name  = 'RESTFUL_SERVICES_ENABLED'
                   and value = 'Y');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_LSNR_WORKSPACES" ("POOL_NAME",
"WORKSPACE_IDENTIFIER",
"URI",
"TYPE",
"UPDATED",
"WORKSPACE_ID",
"DEFAULT_SCHEMA",
"IS_RESTFUL_ENABLED") AS
  select null,
       c.short_name,
       case
         when c.host_prefix is null
         then lower(c.path_prefix)
         else lower(c.host_prefix)
       end,
       case
         when c.host_prefix is null
         then 'BASE_PATH'
         else 'BASE_URL'
       end,
       c.created_on,
       c.provisioning_company_id,
       c.first_schema_provisioned,
       case
         when     c.allow_restful_services_yn    = 'Y'
              and restful_enabled_on_instance_01 = 1
         then 'Y'
         else 'N'
       end
  from wwv_flow_companies c,
       ( select /*+result_cache*/
                count(*) restful_enabled_on_instance_01
           from wwv_flow_platform_prefs
          where name   = 'RESTFUL_SERVICES_ENABLED'
            and value  = 'Y'
            and rownum = 1 )
 where c.account_status in ('AVAILABLE', 'ASSIGNED');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_LSNR_APPLICATIONS" ("WORKSPACE_ID",
"APPLICATION_TYPE",
"APPLICATION_ID",
"APPLICATION_ALIAS",
"APPLICATION_SCHEMA") AS
  select a.security_group_id,
       'DB',
       a.id,
       a.alias,
       a.owner
  from wwv_flow_companies c,
       wwv_flows a
 where c.provisioning_company_id = a.security_group_id
   and c.account_status in ('AVAILABLE', 'ASSIGNED')
union all
select w.security_group_id,
       'WS',
       w.id,
       null,
       s.schema
  from wwv_flow_companies c,
       wwv_flow_company_schemas s,
       wwv_flow_ws_applications w
 where c.provisioning_company_id =  w.security_group_id
   and c.provisioning_company_id =  s.security_group_id
   and s.is_apex$_schema         =  'Y'
   and c.account_status          in ('AVAILABLE', 'ASSIGNED');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_LSNR_ENTRY_POINTS" ("NAME",
"APPLICATION_TYPE",
"APPLICATION_PARAMETER_NAME",
"APPLICATION_PARAMETER_REGEXP") AS
  select 'ws'                                           , 'WS', 'p'                , '^([^:]+)' from sys.dual union all
--
select 'f'                                            , 'DB', 'p'                , '^([^:]+)' from sys.dual union all
--
select 'wwv_flow.show'                                , 'DB', 'p_flow_id'        , null       from sys.dual union all
select 'wwv_flow.accept'                              , 'DB', 'p_flow_id'        , null       from sys.dual union all
select 'apex_application.show'                        , 'DB', 'p_flow_id'        , null       from sys.dual union all
select 'apex_application.accept'                      , 'DB', 'p_flow_id'        , null       from sys.dual union all
--
select 'apex_util.flash2'                             , 'DB', 'p'                , '^([^:]+)' from sys.dual union all
select 'apex_util.get_blob'                           , 'DB', 'a'                , null       from sys.dual union all
select 'apex_util.get_blob_file'                      , 'DB', 'a'                , null       from sys.dual union all
select 'htmldb_util.flash2'                           , 'DB', 'p'                , '^([^:]+)' from sys.dual union all
select 'htmldb_util.get_blob'                         , 'DB', 'a'                , null       from sys.dual union all
select 'htmldb_util.get_blob_file'                    , 'DB', 'a'                , null       from sys.dual union all
--
select 'apex_rest.getreport'                          , 'DB', 'app'              , null       from sys.dual union all
select 'apex_rest.getservicedescription'              , 'DB', 'app'              , null       from sys.dual union all
select 'wwv_flow_rest.getreport'                      , 'DB', 'app'              , null       from sys.dual union all
select 'wwv_flow_rest.getservicedescription'          , 'DB', 'app'              , null       from sys.dual union all
--
select 'wwv_flow_utilities.gen_popup_list'            , 'DB', 'p_flow_id'        , null       from sys.dual union all
select 'wwv_flow_utilities.get_theme_file'            , 'DB', 'p_app_id'         , null       from sys.dual union all
--
select 'htmldb_custom_auth.logout'                    , 'DB', 'p_this_app'       , null       from sys.dual union all
select 'apex_custom_auth.logout'                      , 'DB', 'p_this_app'       , null       from sys.dual union all
--
select 'wwv_flow_custom_auth_std.logout'              , 'DB', 'p_this_flow'      , null       from sys.dual union all
select 'wwv_flow_custom_auth_std.ws_logout'           , 'WS', 'p_websheet_app_id', null       from sys.dual union all
--
select 'wwv_flow_item_help.show_plugin_attribute_help', 'DB', 'p_application_id' , null       from sys.dual union all
--
select 'wwv_flow_customize.show'                      , 'DB', 'p_flow'           , null       from sys.dual union all
select 'wwv_flow_customize.accept'                    , 'DB', 'p_flow'           , null       from sys.dual union all
--
select 'apex_authentication.logout'                   , 'DB', 'p_app_id'         , null       from sys.dual union all
select 'apex_authentication.callback'                 , 'DB', 'p_app_id'         , null       from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_AUTHORIZED" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"WORKSPACE_ID",
"APPLICATION_ID",
"APPLICATION_NAME") AS
  select w.short_name              as workspace,
       w.display_name            as workspace_display_name,
       w.provisioning_company_id as workspace_id,
       f.id                      as application_id,
       f.name                    as application_name
  from ( select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) d,
       wwv_flow_company_schemas s,
       wwv_flow_companies w,
       wwv_flows f
where (s.schema  = cu
    or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
    or d.sgid              = w.PROVISIONING_COMPANY_ID)
   and w.provisioning_company_id =  s.security_group_id
   and w.provisioning_company_id != 0
   and f.security_group_id       =  w.provisioning_company_id
   and f.owner                   =  s.schema
   and (  d.sgid != 0
       or nvl(f.build_status, 'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WORKSPACES" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"WORKSPACE_DESCRIPTION",
"WORKSPACE_SERVICE_ID",
"SOURCE_IDENTIFIER",
"PATH_PREFIX",
"SCHEMAS",
"LAST_PURGED_SESSION",
"WORKSPACE_ANNOUNCEMENT",
"RM_CONSUMER_GROUP",
"ALLOW_APP_BUILDING_YN",
"ALLOW_SQL_WORKSHOP_YN",
"ALLOW_WEBSHEET_DEV_YN",
"ALLOW_TEAM_DEVELOPMENT_YN",
"ALLOW_TO_BE_PURGED_YN",
"ALLOW_RESTFUL_SERVICES_YN",
"SESSIONS",
"APPLICATIONS",
"APPLICATION_PAGES",
"APEX_USERS",
"APEX_DEVELOPERS",
"APEX_WORKSPACE_ADMINISTRATORS",
"FILES",
"SQL_SCRIPTS",
"TRANSLATION_MESSAGES",
"FILE_STORAGE",
"LAST_LOGGED_PAGE_VIEW",
"PAGE_VIEWS",
"WORKSPACE_ID",
"CREATED_ON",
"ASSIGNED_ON") AS
  select
    w.short_name                                        workspace,
    w.display_name                                      workspace_display_name,
    w.workspace_description                             workspace_description,
    w.workspace_service_id                              workspace_service_id,
    w.source_identifier                                 source_identifier,
    w.path_prefix                                       path_prefix,
    --w.FIRST_SCHEMA_PROVISIONED                          first_schema_provisioned,
    --
    count(distinct s.schema)                            schemas,
    max(w.LAST_LOGIN)                                   last_purged_session,
    w.builder_notification_message                      workspace_announcement,
    w.rm_consumer_group                                 rm_consumer_group,
    --
    nvl(ALLOW_APP_BUILDING_YN,'Y')                      ALLOW_APP_BUILDING_YN,
    nvl(ALLOW_SQL_WORKSHOP_YN,'Y')                      ALLOW_SQL_WORKSHOP_YN,
    nvl(ALLOW_WEBSHEET_DEV_YN,'Y')                      ALLOW_WEBSHEET_DEV_YN,
    nvl(ALLOW_TEAM_DEVELOPMENT_YN,'Y')                  ALLOW_TEAM_DEVELOPMENT_YN,
    nvl(ALLOW_TO_BE_PURGED_YN,'Y')                      ALLOW_TO_BE_PURGED_YN,
    nvl(ALLOW_RESTFUL_SERVICES_YN,'Y')                  ALLOW_RESTFUL_SERVICES_YN,
    --
    (select count(*)
     from wwv_flow_sessions$
     where security_group_id =
           w.PROVISIONING_COMPANY_ID)                   sessions,
    --
    (select count(*)
     from   wwv_flows
     where  security_group_id =
            w.PROVISIONING_COMPANY_ID)                  applications,
    --
    (select count(*)
     from   wwv_flow_steps
     where  security_group_id =
            w.PROVISIONING_COMPANY_ID)                  application_pages,
    --
    (select count(*)
     from   wwv_flow_fnd_user
     where  security_group_id =
            w.PROVISIONING_COMPANY_ID)                  apex_users,
    --
    (select count(*)
     from wwv_flow_developers d, wwv_flow_fnd_user u
     where (instr(nvl(d.developer_role,'x'),'EDIT') > 0 or
            instr(nvl(d.developer_role,'x'),'ADMIN') > 0 ) and
           d.security_group_id = w.PROVISIONING_COMPANY_ID and
           u.security_group_id = w.PROVISIONING_COMPANY_ID and
           d.userid = u.user_name)
                                                        apex_developers,
    --
    (select count(*)
     from   wwv_flow_developers d, wwv_flow_fnd_user u
     where  instr(nvl(d.developer_role,'x'),'ADMIN') > 0  and
           d.security_group_id = w.PROVISIONING_COMPANY_ID and
           u.security_group_id = w.PROVISIONING_COMPANY_ID and
           d.userid = u.user_name)
                                                        apex_workspace_administrators,
    --
    (select count(*)
     from    WWV_FLOW_FILE_OBJECTS$
     where   security_group_id =
            w.PROVISIONING_COMPANY_ID and
            to_char(deleted_as_of,
            'MM.DD.YYYY') = '01.01.0001')               files,
    --
    (select count(*)
     from    WWV_FLOW_FILE_OBJECTS$
     where   security_group_id =
            w.PROVISIONING_COMPANY_ID and
            FILE_TYPE = 'SCRIPT' and
            to_char(deleted_as_of,
            'MM.DD.YYYY') = '01.01.0001')               sql_scripts,
    --
    (select count(*)
     from   WWV_FLOW_MESSAGES$
     where  security_group_id =
            w.PROVISIONING_COMPANY_ID)                  translation_messages,
    --
    (select sum(doc_size)
     from    WWV_FLOW_FILE_OBJECTS$
     where   security_group_id =
            w.PROVISIONING_COMPANY_ID)                  file_storage,
    --
    nvl(
        (select max(time_stamp) d
        from wwv_flow_activity_log l
        where l.security_group_id = w.PROVISIONING_COMPANY_ID and l.time_stamp > sysdate - 1),
        (select max(log_day) d
        from wwv_flow_log_history h
        where h.workspace_id = w.PROVISIONING_COMPANY_ID)
        ) last_logged_page_view,
    --
     (select count(*)
     from   wwv_flow_activity_log l
     where  security_group_id =
            w.PROVISIONING_COMPANY_ID and
            l.TIME_STAMP > sysdate - 14)                page_views,
     --
     w.PROVISIONING_COMPANY_ID                          workspace_id,
     w.created_on                                       created_on,
     nvl(w.assigned_on,w.created_on)                    assigned_on
from
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema = cu or
        (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid = w.PROVISIONING_COMPANY_ID) and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      w.PROVISIONING_COMPANY_ID != 0
group by  w.PROVISIONING_COMPANY_ID, w.short_name, w.source_identifier, w.path_prefix, w.FIRST_SCHEMA_PROVISIONED,
          w.ALLOW_APP_BUILDING_YN,
          w.ALLOW_SQL_WORKSHOP_YN,
          w.ALLOW_WEBSHEET_DEV_YN,
          w.ALLOW_TEAM_DEVELOPMENT_YN,
          w.ALLOW_TO_BE_PURGED_YN,
          w.ALLOW_RESTFUL_SERVICES_YN,
          w.builder_notification_message,
          w.rm_consumer_group,
          w.display_name,
          w.workspace_service_id,
          w.workspace_description,
          w.created_on,
          w.assigned_on;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WORKSPACE_FILES" ("WORKSPACE_ID",
"WORKSPACE_NAME",
"WORKSPACE_DISPLAY_NAME",
"FILE_ID",
"APPLICATION_ID",
"APPLICATION_NAME",
"FILE_NAME",
"MIME_TYPE",
"FILE_SIZE",
"CREATED_BY",
"EMAIL",
"CREATED_ON",
"FILE_TYPE",
"DOCUMENT") AS
  select
    w.PROVISIONING_COMPANY_ID                           workspace_id,
    w.short_name                                        workspace_name,
    w.display_name                                      workspace_display_name,
    files.id                                            file_id,
    files.flow_id                                       application_id,
    f.name                                              application_name,
    nvl(files.title,files.filename)                     file_name,
    files.mime_type                                     mime_type,
    files.doc_size                                      file_size,
    files.created_by                                    created_by,
    (select max(email_address)
    from wwv_flow_fnd_user
    where security_group_id = w.PROVISIONING_COMPANY_ID
    and user_name=files.created_by)                     email,
    files.created_on                                    created_on,
    decode(files.file_type,
      'FLOW_EXPORT','Application Export',
      'IMAGE_EXPORT','Text Image Export',
      'PAGE_EXPORT','Application Page Export',
      'SCRIPT','SQL Script',
      'THEME','User Interface Theme Export',
      'XLIFF','XLIFF Application Translation Export',
      'CSS_FILE','CSS File',
      'STATIC_FILE','Static File',
      'IMAGE_FILE','Image File',
      files.file_type)                                  file_type,
    files.blob_content                                  document
from WWV_FLOW_FILE_OBJECTS$ files,
     wwv_flows f,
     wwv_flow_company_schemas s,
     wwv_flow_companies w,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
             (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema = cu or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid = w.PROVISIONING_COMPANY_ID) and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      (s.schema = f.owner or f.owner is null) and
      to_char(deleted_as_of,'MM.DD.YYYY') = '01.01.0001' and
      files.flow_id = f.id(+) and
      files.security_group_id = w.PROVISIONING_COMPANY_ID and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN') or f.name is null);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WORKSPACE_SQL_SCRIPTS" ("WORKSPACE_ID",
"WORKSPACE_NAME",
"WORKSPACE_DISPLAY_NAME",
"SQL_SCRIPT_NAME",
"EMAIL",
"MIME_TYPE",
"FILE_SIZE",
"OWNER",
"SQL_SCRIPT") AS
  select
    w.PROVISIONING_COMPANY_ID   workspace_id,
    w.short_name                workspace_name,
    w.display_name              workspace_display_name,
    f.filename                  sql_script_name,
    (select max(email_address)
    from wwv_flow_fnd_user
    where security_group_id = w.PROVISIONING_COMPANY_ID
    and user_name=f.created_by) email,
    --
    --f.title                     file_name,
    f.mime_type                 mime_type,
    f.doc_size                  file_size,
    f.created_by                owner,
    f.blob_content              sql_script
from
    wwv_flow_file_objects$ f,
    wwv_flow_companies w
where
    f.security_group_id = w.PROVISIONING_COMPANY_ID and
    to_char(f.deleted_as_of,'MM.DD.YYYY') = '01.01.0001' and
    f.file_type = 'SCRIPT' and
    w.PROVISIONING_COMPANY_ID in (
       select security_group_id
       from   wwv_flow_company_schemas s,
              (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                  (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
                 from sys.dual) d
       where (s.schema = cu or
             (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
               d.sgid = s.security_group_id)) and
    (user in ('SYS','SYSTEM', 'APEX_040200') or w.PROVISIONING_COMPANY_ID != 10);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WORKSPACE_SESSIONS" ("WORKSPACE_ID",
"WORKSPACE_NAME",
"WORKSPACE_DISPLAY_NAME",
"APEX_SESSION_ID",
"USER_NAME",
"SESSION_CREATED",
"SESSION_TIME_ZONE",
"SESSION_LANG",
"SESSION_TERRITORY") AS
  select
    w.workspace_id                                      workspace_id,
    w.workspace_name                                    workspace_name,
    w.workspace_display_name                            workspace_display_name,
    s.id                                                apex_session_id,
    s.cookie                                            user_name,
    s.created_on                                        session_created,
    s.session_time_zone                                 session_time_zone,
    s.session_lang                                      session_lang,
    s.session_territory                                 session_territory
from
    wwv_flow_sessions$ s,
(
select
    w.PROVISIONING_COMPANY_ID                           workspace_id,
    w.short_name                                        workspace_name,
    w.display_name                                      workspace_display_name,
    w.FIRST_SCHEMA_PROVISIONED                          first_schema_provisioned
from
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID ) and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      w.PROVISIONING_COMPANY_ID != 0
group by  w.PROVISIONING_COMPANY_ID, w.short_name, w.display_name, w.FIRST_SCHEMA_PROVISIONED
) w
where s.SECURITY_GROUP_ID = w.workspace_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WORKSPACE_APEX_USERS" ("WORKSPACE_ID",
"WORKSPACE_NAME",
"WORKSPACE_DISPLAY_NAME",
"FIRST_SCHEMA_PROVISIONED",
"USER_NAME",
"FIRST_NAME",
"LAST_NAME",
"EMAIL",
"DATE_CREATED",
"DATE_LAST_UPDATED",
"AVAILABLE_SCHEMAS",
"IS_ADMIN",
"IS_APPLICATION_DEVELOPER",
"ACCOUNT_LOCKED",
"DESCRIPTION") AS
  select
    workspace_id,
    workspace_name,
    workspace_display_name,
    first_schema_provisioned,
    user_name,
    first_name,
    last_name,
    email,
    date_created,
    date_last_updated,
    available_schemas,
    substr(decode(instr(nvl(role_privs,'x'),'ADMIN'),0,'No','Yes'),1,3)  is_admin,
    substr(decode(instr(nvl(role_privs,'x'),'EDIT'),0,'No','Yes'),1,3)   is_application_developer,
    decode(account_locked,'Y','Yes','No')                                account_locked,
    description
from (
select
    w.PROVISIONING_COMPANY_ID                                         workspace_id,
    w.short_name                                                      workspace_name,
    w.display_name                                                    workspace_display_name,
    w.FIRST_SCHEMA_PROVISIONED                                        first_schema_provisioned,
    u.user_name                                                       user_name,
    u.first_name                                                      first_name,
    u.last_name                                                       last_name,
    u.EMAIL_address                                                   email,
    u.CREATION_DATE                                                   date_created,
    u.LAST_UPDATE_DATE                                                date_last_updated,
    count(distinct s.schema)                                          available_schemas,
    (select developer_role
       from wwv_flow_developers
      where userid            = u.user_name
        and security_group_id = w.PROVISIONING_COMPANY_ID)            role_privs,
    u.account_locked                                                  account_locked,
    u.description                                                     description
from
     wwv_flow_fnd_user u,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu
   or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
   or d.sgid              = w.PROVISIONING_COMPANY_ID )
  and s.security_group_id         = w.PROVISIONING_COMPANY_ID
  and u.security_group_id         = w.PROVISIONING_COMPANY_ID
  and s.security_group_id         = u.security_group_id
  and w.PROVISIONING_COMPANY_ID ! = 0
group by  w.PROVISIONING_COMPANY_ID,
          w.short_name,
          w.display_name,
          w.FIRST_SCHEMA_PROVISIONED,
          u.user_name,
          u.first_name,
          u.last_name,
          u.EMAIL_address,
          u.CREATION_DATE,
          u.LAST_UPDATE_DATE,
          u.account_locked,
          u.description
) ilv;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WORKSPACE_DEVELOPERS" ("WORKSPACE_ID",
"WORKSPACE_NAME",
"WORKSPACE_DISPLAY_NAME",
"FIRST_SCHEMA_PROVISIONED",
"USER_NAME",
"FIRST_NAME",
"LAST_NAME",
"EMAIL",
"DATE_CREATED",
"DATE_LAST_UPDATED",
"AVAILABLE_SCHEMAS",
"IS_ADMIN",
"IS_APPLICATION_DEVELOPER",
"ACCOUNT_LOCKED",
"DESCRIPTION") AS
  select "WORKSPACE_ID","WORKSPACE_NAME","WORKSPACE_DISPLAY_NAME","FIRST_SCHEMA_PROVISIONED","USER_NAME","FIRST_NAME","LAST_NAME","EMAIL","DATE_CREATED","DATE_LAST_UPDATED","AVAILABLE_SCHEMAS","IS_ADMIN","IS_APPLICATION_DEVELOPER","ACCOUNT_LOCKED","DESCRIPTION"
from apex_workspace_apex_users
where is_application_developer = 'Yes';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WORKSPACE_GROUP_USERS" ("WORKSPACE_ID",
"WORKSPACE_NAME",
"WORKSPACE_DISPLAY_NAME",
"USER_NAME",
"GROUP_NAME") AS
  select
    w.PROVISIONING_COMPANY_ID,
    w.short_name,
    w.display_name,
    u.user_name,
    g.group_name
from
     wwv_flow_fnd_user u,
     wwv_flow_fnd_group_users ug,
     wwv_flow_fnd_user_groups g,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu
   or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
   or d.sgid                      = w.PROVISIONING_COMPANY_ID )
  and s.security_group_id         = w.PROVISIONING_COMPANY_ID
  and u.security_group_id         = w.PROVISIONING_COMPANY_ID
  and s.security_group_id         = u.security_group_id
  and w.PROVISIONING_COMPANY_ID ! = 0
  and u.user_id                   = ug.user_id
  and u.security_group_id         = ug.security_group_id
  and ug.group_id                 = g.id
  and ug.security_group_id        = g.security_group_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WORKSPACE_GROUPS" ("WORKSPACE_ID",
"WORKSPACE_NAME",
"WORKSPACE_DISPLAY_NAME",
"GROUP_NAME",
"GROUP_DESC") AS
  select
    w.PROVISIONING_COMPANY_ID,
    w.short_name,
    w.display_name,
    g.group_name,
    g.group_desc
from
     wwv_flow_fnd_user_groups g,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (  s.schema  = cu
   or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
   or d.sgid                      = w.PROVISIONING_COMPANY_ID )
  and s.security_group_id         = w.PROVISIONING_COMPANY_ID
  and s.security_group_id         = g.security_group_id
  and w.PROVISIONING_COMPANY_ID ! = 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WORKSPACE_SCHEMAS" ("WORKSPACE_ID",
"WORKSPACE_NAME",
"WORKSPACE_DISPLAY_NAME",
"FIRST_SCHEMA_PROVISIONED",
"SCHEMA",
"SCHEMA_CREATED",
"APPLICATIONS") AS
  select
    w.PROVISIONING_COMPANY_ID                           workspace_id,
    w.short_name                                        workspace_name,
    w.display_name                                      workspace_display_name,
    w.FIRST_SCHEMA_PROVISIONED                          first_schema_provisioned,
    s.schema                                            schema,
    (select created
     from   sys.all_users
     where  username = s.schema)                        schema_created,
    (select count(*)
     from wwv_flows
     where security_group_id=w.PROVISIONING_COMPANY_ID
      and s.schema = owner)                             applications
from wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
             (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where
     (s.schema  = cu
       or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
       or  d.sgid                  = w.PROVISIONING_COMPANY_ID )
      and s.security_group_id = w.PROVISIONING_COMPANY_ID;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WORKSPACE_UI_TYPES" ("UI_TYPE_ID",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"WORKSPACE_ID",
"NAME",
"BASED_ON_UI_TYPE_ID",
"AUTODETECT_JS_FILE_URLS",
"AUTODETECT_JS_FUNCTION_BODY",
"AUTODETECT_PLSQL_FUNCTION_BODY",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select u.id                      as ui_type_id,
       w.short_name              as workspace,
       w.display_name            as workspace_display_name,
       w.provisioning_company_id as workspace_id,
       u.name,
       u.based_on_ui_type_id,
       u.autodetect_js_file_urls,
       u.autodetect_js_function_body,
       u.autodetect_plsql_function_body,
       u.created_by,
       u.created_on,
       u.last_updated_by,
       u.last_updated_on
  from wwv_flow_ui_types u,
       ( select nvl(v('FLOW_SECURITY_GROUP_ID'), 0) sgid,
                ( select sys_context('USERENV', 'CURRENT_USER') from sys.dual) curr_user
           from sys.dual
       ) d,
       wwv_flow_company_schemas s,
       wwv_flow_companies w
 where u.security_group_id is null
    or (   w.provisioning_company_id = u.security_group_id
       and (  w.provisioning_company_id = d.sgid
           or exists ( select 1
                         from wwv_flow_company_schemas
                        where security_group_id = w.provisioning_company_id
                          and schema            = d.curr_user
                     )
           or (select wwv_flow_security.has_apex_administrator_role_yn(d.curr_user) from sys.dual) = 'Y'
           )
       );

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATIONS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"ALIAS",
"OWNER",
"APPLICATION_GROUP",
"APPLICATION_GROUP_ID",
"LOGGING",
"APPLICATION_PRIMARY_LANGUAGE",
"LANGUAGE_DERIVED_FROM",
"CSV_ENCODING",
"DATE_FORMAT",
"DATE_TIME_FORMAT",
"TIMESTAMP_FORMAT",
"TIMESTAMP_TZ_FORMAT",
"NLS_SORT",
"NLS_COMP",
"AUTO_TIME_ZONE",
"CONTENT_DELIVERY_NETWORK",
"JAVASCRIPT_FILE_URLS",
"INCLUDE_LEGACY_JAVASCRIPT",
"UI_DETECTION_CSS_URLS",
"ERROR_HANDLING_FUNCTION",
"DEFAULT_ERROR_DISPLAY_LOCATION",
"IMAGE_PREFIX",
"AUTHENTICATION_SCHEME_TYPE",
"AUTHENTICATION_SCHEME",
"AUTHENTICATION_SCHEME_ID",
"LOGOUT_URL",
"LOGO_TYPE",
"LOGO",
"LOGO_ATTRIBUTES",
"PUBLIC_USER",
"PROXY_SERVER",
"MEDIA_TYPE",
"VERSION",
"AVAILABILITY_STATUS",
"UNAVAILABLE_TEXT",
"RESTRICT_TO_USER",
"DEBUGGING",
"EXACT_SUBSTITUTIONS",
"BUILD_STATUS",
"PUBLISH",
"VPD",
"DB_SESSION_INIT_CODE",
"DB_SESSION_CLEANUP_CODE",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"AUTHORIZE_PUBLIC_PAGES",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"GLOBAL_NOTIFICATION",
"SESSION_STATE_PROTECTION",
"MAXIMUM_SESSION_LIFE_SECONDS",
"SESSION_LIFETIME_EXCEEDED_URL",
"MAXIMUM_SESSION_IDLE_SECONDS",
"SESSION_IDLE_TIME_EXCEEDED_URL",
"BROWSER_CACHE",
"BROWSER_FRAME",
"DEEP_LINKING",
"COMPATIBILITY_MODE",
"HTML_ESCAPING_MODE",
"FEEDBACK",
"EMAIL_FROM",
"PAGES",
"TABS",
"PARENT_TABS",
"APPLICATION_ITEMS",
"APPLICATION_PROCESSES",
"APPLICATION_COMPUTATIONS",
"SHORTCUTS",
"WEB_SERVICES",
"TREES",
"BUILD_OPTIONS",
"BREADCRUMBS",
"NAV_BAR_ENTRIES",
"LISTS",
"LISTS_OF_VALUES",
"THEMES",
"AUTHENTICATION_SCHEMES",
"AUTHORIZATION_SCHEMES",
"TRANSLATION_MESSAGES",
"INSTALLATION_SCRIPTS",
"CACHED_PAGES",
"CACHED_REGIONS",
"COMPONENT_SIGNATURE",
"WORKSPACE_ID",
"THEME_NUMBER",
"HOME_LINK",
"LOGIN_URL",
"PAGE_TEMPLATE",
"ERROR_PAGE_TEMPLATE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    f.ALIAS                          alias,
    f.OWNER                          owner,
    (select group_name from wwv_flow_application_groups where id = f.group_id) application_group,
    group_id                         application_group_id,
    decode(upper(f.WEBDB_LOGGING),
        'YES','Yes',
        'NO','No',f.WEBDB_LOGGING)   logging,
    f.FLOW_LANGUAGE                  application_primary_language,
    f.FLOW_LANGUAGE_DERIVED_FROM     language_derived_from,
    decode(upper(f.csv_encoding),
        'Y','Yes',
        'N','No', f.csv_encoding)    csv_encoding,
    f.date_format                    date_format,
    f.date_time_format               date_time_format,
    f.timestamp_format               timestamp_format,
    f.timestamp_tz_format            timestamp_tz_format,
    f.nls_sort                       nls_sort,
    f.nls_comp                       nls_comp,
    f.auto_time_zone                 auto_time_zone,
    f.content_delivery_network       content_delivery_network,
    f.javascript_file_urls           javascript_file_urls,
    f.include_legacy_javascript      include_legacy_javascript,
    f.ui_detection_css_urls          ui_detection_css_urls,
    f.error_handling_function        error_handling_function,
    f.default_error_display_location default_error_display_location,
    f.FLOW_IMAGE_PREFIX              image_prefix,
    case substr(authentication.scheme_type,1,7)
      when 'NATIVE_' then
        ( select display_name
            from wwv_flow_plugins
           where flow_id     = 4411
             and plugin_type = 'AUTHENTICATION TYPE'
             and name        = substr(authentication.scheme_type, 8) )
      when 'PLUGIN_' then
        ( select display_name
            from wwv_flow_plugins
           where flow_id     = f.id
             and plugin_type = 'AUTHENTICATION TYPE'
             and name        = substr(authentication.scheme_type, 8) )
      else
        decode(f.AUTHENTICATION,
            'CUSTOM2','Authentication Scheme',
            'COOKIE', 'APEX Authentication',
            f.AUTHENTICATION)
    end                              authentication_scheme_type,
    authentication.name              authentication_scheme,
    f.authentication_id              authentication_scheme_id,
    authentication.LOGOUT_URL        logout_url,
    decode(substr(f.LOGO_IMAGE,1,5),
       'TEXT:','Text Logo',
       'Image Logo')                 logo_type,
    f.LOGO_IMAGE                     logo,
    f.LOGO_IMAGE_ATTRIBUTES          logo_attributes,
    --f.PUBLIC_URL_PREFIX              public_url_prefix,
    f.PUBLIC_USER                    public_user,
    --f.DBAUTH_URL_PREFIX              db_auth_url_prefix,
    f.PROXY_SERVER                   proxy_server,
    f.media_type                     media_type,
    --
    --f.CUSTOM_AUTHENTICATION_PAGE     custom_auth_page,
    --f.CUSTOM_AUTH_LOGIN_URL          custom_auth_login_url,
    f.FLOW_VERSION                     version,
    decode(f.FLOW_STATUS,
        'AVAILABLE','Available',
        'AVAILABLE_W_EDIT_LINK','Available with Edit Links',
        'DEVELOPERS_ONLY','Available to Developers Only',
        'RESTRICTED_ACCESS','Restricted Access',
        'UNAVAILABLE','Unavailable',
        'UNAVAILABLE_PLSQL','Unavailable (Status Shown with PL/SQL)',
        'UNAVAILABLE_URL','Unavailable (Redirect to URL)',
        f.flow_status)               availability_status,
    f.FLOW_UNAVAILABLE_TEXT          unavailable_text,
    f.RESTRICT_TO_USER_LIST          restrict_to_user,
    decode(f.APPLICATION_TAB_SET,
        1,'Allowed',0,'Not Allowed',
        'Allowed')                   debugging,
    decode(f.EXACT_SUBSTITUTIONS_ONLY,
       'N','No','Y','Yes',
       f.EXACT_SUBSTITUTIONS_ONLY)   exact_substitutions,
    decode(f.BUILD_STATUS,
       'RUN_ONLY','Run Only',
       'RUN_AND_BUILD','Run and Develop',
       'RUN_AND_HIDDEN','Run and Hidden',
       f.BUILD_STATUS)               build_status,
    decode(f.publish_yn,'Y','Yes','N','No','No') publish,
    f.VPD                            vpd, /* for compatibility reasons */
    f.VPD                            db_session_init_code,
    f.vpd_teardown_code              db_session_cleanup_code,
    --
    decode(substr(f.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from   wwv_flow_security_schemes
     where  to_char(id) = ltrim(f.SECURITY_SCHEME,'!')
     and    flow_id = f.id),
     f.SECURITY_SCHEME)              authorization_scheme,
    f.security_scheme                authorization_scheme_id,
    decode(f.authorize_public_pages_yn,'Y','Yes','No') authorize_public_pages,
    --f.REJOIN_EXISTING_SESSIONS       rejoin_sessions,
    f.LAST_UPDATED_BY                last_updated_by,
    f.LAST_UPDATED_ON                last_updated_on,
    f.GLOBAL_NOTIFICATION            global_notification,
    decode(f.PAGE_PROTECTION_ENABLED_Y_N,
      'Y','Enabled',
      'N','Disabled',
      'Disabled')                    Session_State_Protection,
    MAX_SESSION_LENGTH_SEC           Maximum_Session_Life_Seconds,
    ON_MAX_SESSION_TIMEOUT_URL       Session_Lifetime_Exceeded_URL,
    MAX_SESSION_IDLE_SEC             Maximum_Session_Idle_Seconds,
    ON_MAX_IDLE_TIMEOUT_URL          Session_Idle_Time_Exceeded_URL,
    case f.browser_cache
      when 'Y' then 'Enabled'
      else          'Disabled'
    end                              browser_cache,
    case f.browser_frame
      when 'D' then 'Deny'
      when 'S' then 'Allow from same origin'
      else          'Allow'
    end                              browser_frame,
    case f.deep_linking
      when 'Y' then 'Enabled'
      else          'Disabled'
    end                              deep_linking,
    compatibility_mode,
    case html_escaping_mode
      when 'B' then 'Basic'
      when 'E' then 'Extended'
    end html_escaping_mode,
    case allow_feedback_yn
      when 'Y' then 'Enabled'
      else          'Disabled'
    end                              feedback,
    email_from,
    -- sub components
    (select count(*) from wwv_flow_steps where flow_id = f.id)               pages,
    (select count(*) from wwv_flow_tabs where flow_id = f.id)                tabs,
    (select count(*) from wwv_flow_toplevel_tabs where flow_id = f.id)       parent_tabs,
    (select count(*) from wwv_flow_items where flow_id = f.id)               application_items,
    (select count(*) from wwv_flow_processing where flow_id = f.id)          application_processes,
    (select count(*) from wwv_flow_computations where flow_id = f.id)        application_computations,
    (select count(*) from wwv_flow_shortcuts where flow_id = f.id)           shortcuts,
    (select count(*) from wwv_flow_shared_web_services where flow_id = f.id) web_services,
    (select count(*) from wwv_flow_trees where flow_id = f.id)               trees,
    (select count(*) from wwv_flow_patches where flow_id = f.id)             build_options,
    (select count(*) from wwv_flow_menus where flow_id = f.id)               breadcrumbs,
    (select count(*) from wwv_flow_icon_bar where flow_id = f.id)            nav_bar_entries,
    (select count(*) from wwv_flow_lists where flow_id = f.id)               lists,
    (select count(*) from wwv_flow_lists_of_values$ where flow_id = f.id)    lists_of_values,
    (select count(*) from wwv_flow_themes where flow_id = f.id)              themes,
    (select count(*) from wwv_flow_authentications where flow_id = f.id)     authentication_schemes,
    (select count(*) from WWV_FLOW_SECURITY_SCHEMES where flow_id = f.id)    authorization_schemes,
    (select count(*) from WWV_FLOW_MESSAGES$ where flow_id = f.id)           translation_messages,
    (select count(*) from wwv_flow_install_scripts where flow_id = f.id)     installation_scripts,
    (select count(*) from WWV_FLOW_STEPS where flow_id = f.id and CACHE_PAGE_YN = 'Y') cached_pages,
    (select count(*) from WWV_FLOW_PAGE_PLUGS where flow_id = f.id and PLUG_CACHING in ('CACHED','CACHED_BY_USER')) cached_regions,
    --
    'a='||f.ALIAS
    ||' o='||f.OWNER
    ||' l='||decode(upper(f.WEBDB_LOGGING),'YES','Yes','NO','No',f.WEBDB_LOGGING)
    ||' l='||f.FLOW_LANGUAGE||' '||f.FLOW_LANGUAGE_DERIVED_FROM
    ||' i='||substr(f.FLOW_IMAGE_PREFIX,1,20)||length(f.FLOW_IMAGE_PREFIX)
    ||' a='||substr(f.AUTHENTICATION,1,20)||length(f.AUTHENTICATION)
    ||' l='||substr(f.LOGOUT_URL,1,20)||length(f.LOGOUT_URL)
    ||' l='||decode(substr(f.LOGO_IMAGE,1,5),
       'TEXT:','TextLogo',
       'Image Logo')
    ||','||substr(f.LOGO_IMAGE,1,20)||length(f.LOGO_IMAGE)
    ||','||substr(f.LOGO_IMAGE_ATTRIBUTES,1,20)||length(f.LOGO_IMAGE_ATTRIBUTES)
    ||' p='||f.PUBLIC_USER
    ||' p='||substr(f.PROXY_SERVER,1,20)||length(f.PROXY_SERVER)
    ||' v='||f.FLOW_VERSION
    ||' s='||decode(f.FLOW_STATUS,
        'AVAILABLE','Available',
        'AVAILABLE_W_EDIT_LINK','AvailwEL',
        'DEVELOPERS_ONLY','DevOnly',
        'RESTRICTED_ACCESS','Rests',
        'UNAVAILABLE','Unavail',
        'UNAVAILABLE_PLSQL','UnavailPL/SQL)',
        'UNAVAILABLE_URL','UnavailableRedir',
        f.flow_status)
    ||' u='||substr(f.FLOW_UNAVAILABLE_TEXT,1,20)||length(f.FLOW_UNAVAILABLE_TEXT)
    ||' r='||substr(f.RESTRICT_TO_USER_LIST,1,20)||length(f.RESTRICT_TO_USER_LIST)
    ||' d='||decode(f.APPLICATION_TAB_SET,
        1,'Allowed',0,'!Allowed',
        'Allowed')
    ||' s='||decode(f.EXACT_SUBSTITUTIONS_ONLY,
       'N','No','Y','Yes',
       f.EXACT_SUBSTITUTIONS_ONLY)
    ||' s='||decode(f.BUILD_STATUS,
       'RUN_ONLY','Run Only',
       'RUN_AND_BUILD','Run+Dev',
       f.BUILD_STATUS)
    ||' v='||substr(f.VPD,1,20)||length(f.vpd)
    ||' v2='||substr(f.vpd_teardown_code,1,20)||length(f.vpd_teardown_code)
    ||' a='||decode(substr(f.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from   wwv_flow_security_schemes
     where  to_char(id) = ltrim(f.SECURITY_SCHEME,'!')
     and    flow_id = f.id),
     f.SECURITY_SCHEME)
    ||' gn='||substr(f.GLOBAL_NOTIFICATION,1,20)||length(f.GLOBAL_NOTIFICATION)
    ||' pp='||decode(f.PAGE_PROTECTION_ENABLED_Y_N,'Y','Enabled','N','Disabled','Disabled')
    ||' timeout='||MAX_SESSION_LENGTH_SEC||'.'||ON_MAX_SESSION_TIMEOUT_URL||'.'||MAX_SESSION_IDLE_SEC||'.'||ON_MAX_IDLE_TIMEOUT_URL
    component_signature,
    f.security_group_id workspace_id,
    --
    -- For compatibility with SQL Developer and existing applications (bug# 14545162)
    -- Get the values from the user interfaces table, but only if the app has only one user interface
    ( select case when count(*) = 1 then min(theme_id) end
        from wwv_flow_user_interfaces
       where flow_id = f.id ) as theme_number,
    ( select case when count(*) = 1 then min(home_url) end
        from wwv_flow_user_interfaces
       where flow_id = f.id ) as home_link,
    ( select case when count(*) = 1 then min(login_url) end
        from wwv_flow_user_interfaces
       where flow_id = f.id ) as login_url,
    ( select case when count(*) = 1 then min(pt.name) end
        from wwv_flow_user_interfaces ui,
             wwv_flow_themes t,
             wwv_flow_templates pt
       where ui.flow_id = f.id
         and t.flow_id  = ui.flow_id
         and t.theme_id = ui.theme_id
         and pt.id      = t.default_page_template ) as page_template,
    ( select case when count(*) = 1 then min(pt.name) end
        from wwv_flow_user_interfaces ui,
             wwv_flow_themes t,
             wwv_flow_templates pt
       where ui.flow_id = f.id
         and t.flow_id  = ui.flow_id
         and t.theme_id = ui.theme_id
         and pt.id      = t.error_template ) as error_page_template
from wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     wwv_flow_authentications authentication,
     (select nvl(nv('FLOW_SECURITY_GROUP_ID'),0) sgid,
         (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (  s.schema                              = cu
        or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
        or d.sgid                              = w.PROVISIONING_COMPANY_ID
        )
  and w.provisioning_company_id <> 0
  and f.security_group_id       =  w.provisioning_company_id
  and f.security_group_id       =  s.security_group_id
  and s.schema                  =  f.owner
  and f.authentication_id       =  authentication.id (+)
  /* keep this not exists */
  and not exists ( select 1
                     from wwv_flow_language_map m
                    where m.translation_flow_id = f.id
                      and m.security_group_id   = f.security_group_id
                      and f.authentication_id   <> trunc(f.authentication_id) );

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_TRANS_MAP" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"MAP_ID",
"PRIMARY_APPLICATION_ID",
"PRIMARY_APPLICATION_NAME",
"TRANSLATED_APPLICATION_ID",
"TRANSLATED_APP_LANGUAGE",
"TRANSLATED_APPL_IMG_DIR",
"TRANSLATION_COMMENTS",
"TRANSLATION_MAP_COMMENTS",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"CREATED_BY",
"CREATED_ON") AS
  select f.workspace                      workspace,
       f.workspace_display_name,
       m.ID                             map_id,
       m.primary_language_flow_id       primary_application_id,
       f.application_name               primary_application_name,
       m.translation_flow_id            translated_application_id,
       m.translation_flow_language_code translated_app_language,
       m.translation_image_directory    translated_appl_img_dir,
       m.translation_comments           translation_comments,
       m.map_comments                   translation_map_comments,
       m.last_updated_by,
       m.last_updated_on,
       m.created_by,
       m.created_on
  from wwv_flow_authorized f,
       wwv_flow_language_map m
 where m.primary_language_flow_id = f.application_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_GROUPS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_GROUP_ID",
"GROUP_NAME",
"GROUP_COMMENT",
"WORKSPACE_ID") AS
  select
    w.short_name                 workspace,
    w.display_name               workspace_display_name,
    g.ID                         application_group_id,
    g.group_name                 group_name,
    g.group_comment              group_comment,
    w.PROVISIONING_COMPANY_ID    workspace_id
from
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     wwv_flow_application_groups g,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (  s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
      or  d.sgid              = w.PROVISIONING_COMPANY_ID )
      and s.security_group_id = w.PROVISIONING_COMPANY_ID
      and w.PROVISIONING_COMPANY_ID != 0
      and w.PROVISIONING_COMPANY_ID = g.security_group_id
group by w.PROVISIONING_COMPANY_ID, w.short_name, w.display_name, w.FIRST_SCHEMA_PROVISIONED,g.id, g.group_name, g.group_comment;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_SUBSTITUTIONS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"SUBSTITUTION_STRING",
"SUBSTITUTION_VALUE") AS
  with substitution as (
    select auth.workspace,
           auth.workspace_display_name,
           f.id                     as application_id,
           f.name                   as application_name,
           f.substitution_string_01,
           f.substitution_value_01,
           f.substitution_string_02,
           f.substitution_value_02,
           f.substitution_string_03,
           f.substitution_value_03,
           f.substitution_string_04,
           f.substitution_value_04,
           f.substitution_string_05,
           f.substitution_value_05,
           f.substitution_string_06,
           f.substitution_value_06,
           f.substitution_string_07,
           f.substitution_value_07,
           f.substitution_string_08,
           f.substitution_value_08,
           f.substitution_string_09,
           f.substitution_value_09,
           f.substitution_string_10,
           f.substitution_value_10,
           f.substitution_string_11,
           f.substitution_value_11,
           f.substitution_string_12,
           f.substitution_value_12,
           f.substitution_string_13,
           f.substitution_value_13,
           f.substitution_string_14,
           f.substitution_value_14,
           f.substitution_string_15,
           f.substitution_value_15,
           f.substitution_string_16,
           f.substitution_value_16,
           f.substitution_string_17,
           f.substitution_value_17,
           f.substitution_string_18,
           f.substitution_value_18,
           f.substitution_string_19,
           f.substitution_value_19,
           f.substitution_string_20,
           f.substitution_value_20
      from wwv_flow_authorized auth,
           wwv_flows f
     where f.id = auth.application_id )
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_01 as substitution_string,
       substitution_value_01  as substitution_value
  from substitution
 where substitution_string_01 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_02 as substitution_string,
       substitution_value_02  as substitution_value
  from substitution
 where substitution_string_02 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_03 as substitution_string,
       substitution_value_03  as substitution_value
  from substitution
 where substitution_string_03 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_04 as substitution_string,
       substitution_value_04  as substitution_value
  from substitution
 where substitution_string_04 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_05 as substitution_string,
       substitution_value_05  as substitution_value
  from substitution
 where substitution_string_05 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_06 as substitution_string,
       substitution_value_06  as substitution_value
  from substitution
 where substitution_string_06 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_07 as substitution_string,
       substitution_value_07  as substitution_value
  from substitution
 where substitution_string_07 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_08 as substitution_string,
       substitution_value_08  as substitution_value
  from substitution
 where substitution_string_08 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_09 as substitution_string,
       substitution_value_09  as substitution_value
  from substitution
 where substitution_string_09 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_10 as substitution_string,
       substitution_value_10  as substitution_value
  from substitution
 where substitution_string_10 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_11 as substitution_string,
       substitution_value_11  as substitution_value
  from substitution
 where substitution_string_11 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_12 as substitution_string,
       substitution_value_12  as substitution_value
  from substitution
 where substitution_string_12 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_13 as substitution_string,
       substitution_value_13  as substitution_value
  from substitution
 where substitution_string_13 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_14 as substitution_string,
       substitution_value_14  as substitution_value
  from substitution
 where substitution_string_14 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_15 as substitution_string,
       substitution_value_15  as substitution_value
  from substitution
 where substitution_string_15 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_16 as substitution_string,
       substitution_value_16  as substitution_value
  from substitution
 where substitution_string_16 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_17 as substitution_string,
       substitution_value_17  as substitution_value
  from substitution
 where substitution_string_17 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_18 as substitution_string,
       substitution_value_18  as substitution_value
  from substitution
 where substitution_string_18 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_19 as substitution_string,
       substitution_value_19  as substitution_value
  from substitution
 where substitution_string_19 is not null
union all
select workspace,
       workspace_display_name,
       application_id,
       application_name,
       substitution_string_20 as substitution_string,
       substitution_value_20  as substitution_value
  from substitution
 where substitution_string_20 is not null
;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_CACHING" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"CACHE_TYPE",
"LANGUAGE",
"CACHING_USER",
"CACHE_SIZE",
"REGION_NAME",
"CACHED_ON",
"CACHED_FOR_SECONDS",
"AGE_IN_SECONDS",
"TIMEOUT_IN_SECONDS",
"REGION_ID",
"WORKSPACE_ID") AS
  select
    w.short_name                                        workspace,
    w.display_name                                      workspace_display_name,
    f.ID                                                application_id,
    f.NAME                                              application_name,
    decode(c.region_id,null,c.PAGE_ID,
    (select page_id from wwv_flow_page_plugs
     where id = c.region_id and flow_id = c.flow_id))   page_id,
    (select name
     from wwv_flow_steps
     where id in
     decode(c.region_id,null,c.PAGE_ID,
    (select page_id from wwv_flow_page_plugs
     where id = c.region_id and flow_id = c.flow_id))
      and  flow_id = f.id)                              page_name,
    decode(decode(chart_region_id,null,
    'X','Chart Region Cache'),'X',
    decode(region_id,null,'Page Cache','Region Cache')) cache_type,
    c.LANGUAGE                                          language,
    c.USER_NAME                                         caching_user,
    sys.dbms_lob.getlength(c.PAGE_TEXT)                     cache_size,
    decode(region_id,null,null,
    (select plug_name
     from wwv_flow_page_plugs
     where id = c.region_id and flow_id = f.id))        region_name,
    c.CACHED_ON                                         cached_on,
    decode(region_id,null,
    (select cache_timeout_seconds
     from wwv_flow_steps
     where flow_id = f.id and id = c.page_id),
    (select PLUG_CACHING_MAX_AGE_IN_SEC
     from wwv_flow_page_plugs
     where id = c.region_id))                           cached_for_seconds,
    --
    round((sysdate - c.cached_on) * 3600 * 24,0)        age_in_seconds,
    --
    decode(region_id,null,
    (select cache_timeout_seconds -
             round((sysdate - c.cached_on)
             * 3600 * 24,0) a
     from wwv_flow_steps
     where flow_id = f.id and id = c.page_id),
    (select PLUG_CACHING_MAX_AGE_IN_SEC -
            round((sysdate - c.cached_on)
            * 3600 * 24,0) a
     from wwv_flow_page_plugs
     where id = c.region_id))                           timeout_in_seconds,
    c.REGION_ID                                         region_id,
    c.SECURITY_GROUP_ID                                 workspace_id
from
     wwv_flow_page_cache c,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu
       or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
       or d.sgid              = w.PROVISIONING_COMPANY_ID )
      and c.flow_id           = f.id
      and f.security_group_id = w.PROVISIONING_COMPANY_ID
      and f.security_group_id = s.SECURITY_GROUP_ID
      and s.schema = f.owner
      and (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'))
      and  w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_STANDARD_CONDITIONS" ("D",
"R") AS
  select 'EXISTS' d,'Exists (SQL query returns at least one row)'r from sys.dual
union all select 'NOT_EXISTS' d,'NOT Exists (SQL query returns no rows)'r from sys.dual
union all select 'SQL_EXPRESSION' d,'SQL Expression'r from sys.dual
union all select 'PLSQL_EXPRESSION' d,'PL/SQL Expression'r from sys.dual
union all select 'FUNCTION_BODY' d,'PL/SQL Function Body Returning a Boolean'r from sys.dual
union all select 'REQUEST_EQUALS_CONDITION' d,'Request = Expression 1'r from sys.dual
union all select 'REQUEST_NOT_EQUAL_CONDITION' d,'Request != Expression 1'r from sys.dual
union all select 'REQUEST_IN_CONDITION' d,'Request Is Contained within Expression 1'r from sys.dual
union all select 'REQUEST_NOT_IN_CONDITION' d,'Request Is NOT Contained within Expression 1'r from sys.dual
union all select 'VAL_OF_ITEM_IN_COND_EQ_COND2' d,'Value of Item in Expression 1 = Expression 2'r from sys.dual
union all select 'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2' d,'Value of Item in Expression 1 != Expression 2'r from sys.dual
union all select 'ITEM_IS_NULL' d,'Value of Item / Column in Expression 1 Is NULL'r from sys.dual
union all select 'ITEM_IS_NOT_NULL' d,'Value of Item / Column in Expression 1 Is NOT NULL'r from sys.dual
union all select 'ITEM_IS_ZERO' d,'Value of Item / Column in Expression 1 = Zero'r from sys.dual
union all select 'ITEM_IS_NOT_ZERO' d,'Value of Item / Column in Expression 1 != Zero'r from sys.dual
union all select 'ITEM_IS_NULL_OR_ZERO' d,'Value of Item / Column in Expression 1 Is NULL or Zero'r from sys.dual
union all select 'ITEM_NOT_NULL_OR_ZERO' d,'Value of Item / Column in Expression 1 Is NOT null and the Item / Column Is NOT Zero'r from sys.dual
union all select 'ITEM_CONTAINS_NO_SPACES' d,'Value of Item / Column in Expression 1 Contains No Spaces'r from sys.dual
union all select 'ITEM_IS_NUMERIC' d,'Value of Item / Column in Expression 1 Is Numeric' r from sys.dual
union all select 'ITEM_IS_NOT_NUMERIC' d,'Value of Item / Column in Expression 1 Is Not Numeric' r from sys.dual
union all select 'ITEM_IS_ALPHANUMERIC' d,'Value of Item / Column in Expression 1 Is Alphanumeric'r from sys.dual
union all select 'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST' d,'Value of Item / Column in Expression 1 Is Contained within Colon Delimited List in Expression 2'r from sys.dual
union all select 'VALUE_OF_ITEM_IN_CONDITION_NOT_IN_COLON_DELIMITED_LIST' d,'Value of Item / Column in Expression 1 Is NOT Contained within Colon Delimited List in Expression 2'r from sys.dual
union all select 'USER_PREF_IN_COND_EQ_COND2' d,'Value of User Preference in Expression 1 = Expression 2'r from sys.dual
union all select 'USER_PREF_IN_COND_NOT_EQ_COND2' d,'Value of User Preference in Expression 1 != Expression 2'r from sys.dual
union all select 'CURRENT_PAGE_EQUALS_CONDITION' d,'Current page = Expression 1'r from sys.dual
union all select 'CURRENT_PAGE_NOT_EQUAL_CONDITION' d,'Current page != Expression 1'r from sys.dual
union all select 'CURRENT_PAGE_IN_CONDITION' d,'Current Page Is Contained Within Expression 1 (comma delimited list of pages)'r from sys.dual
union all select 'CURRENT_PAGE_NOT_IN_CONDITION' d,'Current Page Is NOT in Expression 1 (comma delimited list of pages)'r from sys.dual
union all select 'WHEN_THIS_PAGE_SUBMITTED' d,'Current Page = Page Submitted (this page was posted)'r from sys.dual
union all select 'WHEN_THIS_PAGE_NOT_SUBMITTED' d,'Current Page != Page Submitted (this page was not the page posted)'r from sys.dual
union all select 'PAGE_IS_IN_PRINTER_FRIENDLY_MODE' d,'Current Page Is in Printer Friendly Mode'r from sys.dual
union all select 'PAGE_IS_NOT_IN_PRINTER_FRIENDLY_MODE' d,'Current page is NOT in Printer Friendly Mode'r from sys.dual
union all select 'CONDITION1_IN_VALUE_OF_ITEM_IN_CONDITION2' d,'Text in Expression 1 Is Contained in Value of Item in Expression 2'r from sys.dual
union all select 'DISPLAY_COND_IN_COND_TEXT' d,'Text in Expression 1 Is Contained within the Text in Expression 2'r from sys.dual
union all select 'DISPLAY_COND_NOT_IN_COND_TEXT' d,'Text in Expression 1 Is NOT Contained within the Text in Expression 2'r from sys.dual
union all select 'DISPLAY_COND_EQUAL_COND_TEXT' d,'Text in Expression 1 = Expression 2 (includes &ITEM. substitutions)'r from sys.dual
union all select 'DISP_COND_NOT_EQUAL_COND_TEXT' d,'Text in Expression 1 != Expression 2 (includes &ITEM. substitutions)'r from sys.dual
union all select 'IS_READ_ONLY' d,'Page/Region is Read Only' r from sys.dual
union all select 'IS_NOT_READ_ONLY' d,'Page/Region is NOT Read Only' r from sys.dual
union all select 'USER_IS_NOT_PUBLIC_USER' d,'User is Authenticated  (not public)'r from sys.dual
union all select 'USER_IS_PUBLIC_USER' d,'User is the Public User (user has not authenticated)'r from sys.dual
union all select 'DISPLAYING_INLINE_VALIDATION_ERRORS' d,'Inline Validation Errors Displayed'r from sys.dual
union all select 'NOT_DISPLAYING_INLINE_VALIDATION_ERRORS' d,'No Inline Validation Errors Displayed'r from sys.dual
union all select 'MAX_ROWS_LT_ROWS_FETCHED' d,'SQL Reports (OK to show the forward button)'r from sys.dual
union all select 'MIN_ROW_GT_THAN_ONE' d,'SQL Reports (OK to show the back button)'r from sys.dual
union all select 'BROWSER_IS_NSCP' d,'Client Browser: Mozilla, Netscape 6.x/7x or higher'r from sys.dual
union all select 'BROWSER_IS_MSIE' d,'Client Browser: Microsoft Internet Explorer 5.5, 6.0 or higher'r from sys.dual
union all select 'BROWSER_IS_MSIE_OR_NSCP' d,'Client Browser: XHTML / CSS capable browser (NS 6.x,7x, Mozilla, IE 5.5, 6.0 or higher)'r from sys.dual
union all select 'BROWSER_IS_OTHER' d,'Client Browser: Other browsers (or older version)'r from sys.dual
union all select 'CURRENT_LANG_IN_COND1' d,'Current Language Is Contained within Expression 1'r from sys.dual
union all select 'CURRENT_LANG_NOT_IN_COND1' d,'Current Language Is NOT Contained within Expression 1'r from sys.dual
union all select 'CURRENT_LANG_NOT_EQ_COND1' d,'Current Language != Expression 1'r from sys.dual
union all select 'CURRENT_LANG_EQ_COND1' d,'Current Language = Expression 1'r from sys.dual
union all select 'DAD_NAME_EQ_CONDITION' d,'When CGI_ENV DAD_NAME = Expression 1'r from sys.dual
union all select 'DAD_NAME_NOT_EQ_CONDITION' d,'When CGI_ENV DAD_NAME != Expression 1'r from sys.dual
union all select 'SERVER_NAME_EQ_CONDITION' d,'When CGI_ENV SERVER_NAME = Expression 1'r from sys.dual
union all select 'SERVER_NAME_NOT_EQ_CONDITION' d,'When CGI_ENV SERVER_NAME != Expression 1'r from sys.dual
union all select 'HTTP_HOST_EQ_CONDITION' d,'When CGI_ENV HTTP_HOST = Expression 1'r from sys.dual
union all select 'HTTP_HOST_NOT_EQ_CONDITION' d,'When CGI_ENV HTTP_HOST != Expression 1'r from sys.dual
union all select 'NEVER' d,'Never'r from sys.dual
union all select 'ALWAYS' d,'Always'r from sys.dual ;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPL_USER_INTERFACES" ("USER_INTERFACE_ID",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"UI_TYPE_ID",
"UI_TYPE_NAME",
"DISPLAY_NAME",
"DISPLAY_SEQ",
"USE_AUTO_DETECT",
"IS_DEFAULT",
"THEME_NUMBER",
"HOME_URL",
"LOGIN_URL",
"GLOBAL_PAGE_ID",
"BUILD_OPTION_ID",
"BUILD_OPTION",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select ui.id                     as user_interface_id,
       f.workspace,
       f.workspace_display_name,
       f.application_id,
       f.application_name,
       ui.ui_type_id,
       uit.name                  as ui_type_name,
       ui.display_name,
       ui.display_seq,
       case ui.use_auto_detect
         when 'Y' then 'Yes'
         else 'No'
       end as use_auto_detect,
       case ui.is_default
         when 'Y' then 'Yes'
         else 'No'
       end as is_default,
       ui.theme_id               as theme_number,
       ui.home_url,
       ui.login_url,
       ui.global_page_id,
       ui.required_patch         as build_option_id,
       ( select case
                  when ui.required_patch > 0 then patch_name
                  else '{Not ' || patch_name || '}'
                end
           from wwv_flow_patches
          where id = abs(ui.required_patch)
       )                         as build_option,
       ui.created_by,
       ui.created_on,
       ui.last_updated_by,
       ui.last_updated_on
  from wwv_flow_authorized f,
       wwv_flow_user_interfaces ui,
       wwv_flow_ui_types uit
 where ui.flow_id = f.application_id
   and uit.id     = ui.ui_type_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGES" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"PAGE_TITLE",
"USER_INTERFACE_ID",
"MEDIA_TYPE",
"TAB_SET",
"PAGE_ALIAS",
"PAGE_FUNCTION",
"ALLOW_DUPLICATE_SUBMISSIONS",
"INCLUDE_APEX_CSS_JS_YN",
"FOCUS_CURSOR",
"HEADER_TEXT",
"BODY_HEADER",
"FOOTER_TEXT",
"HELP_TEXT",
"PAGE_TEMPLATE",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"BUILD_OPTION",
"PAGE_HTML_HEADER",
"PAGE_HTML_ONLOAD",
"JAVASCRIPT_FILE_URLS",
"JAVASCRIPT_CODE",
"JAVASCRIPT_CODE_ONLOAD",
"CSS_FILE_URLS",
"INLINE_CSS",
"PAGE_REQUIRES_AUTHENTICATION",
"PAGE_ACCESS_PROTECTION",
"REGIONS",
"ITEMS",
"BUTTONS",
"COMPUTATIONS",
"VALIDATIONS",
"PROCESSES",
"BRANCHES",
"REPORT_COLUMNS",
"PAGE_GROUP",
"PAGE_GROUP_ID",
"ON_DUP_SUBMISSION_GOTO_URL",
"ERROR_HANDLING_FUNCTION",
"ERROR_NOTIFICATION_TEXT",
"FORM_AUTOCOMPLETE",
"PAGE_TRANSITION",
"POPUP_TRANSITION",
"READ_ONLY_CONDITION_TYPE",
"READ_ONLY_CONDITION_TYPE_CODE",
"READ_ONLY_CONDITION_EXP1",
"READ_ONLY_CONDITION_EXP2",
"CACHED",
"CACHE_TIMEOUT_SECONDS",
"CACHED_BY_USER",
"CACHE_CONDITION_TYPE",
"CACHE_CONDITION_EXP_1",
"CACHE_CONDITION_EXP_2",
"PAGE_COMMENT",
"CACHED_REGIONS",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_SIGNATURE",
"BROWSER_CACHE",
"DEEP_LINKING") AS
  select
    w.short_name                          workspace,
    w.display_name                        workspace_display_name,
    p.flow_id                             application_id,
    f.name                                application_name,
    --
    p.id                                  page_id,
    p.name                                page_name,
    p.STEP_TITLE                          page_title,
    p.user_interface_id,
    p.media_type                          media_type,
    p.TAB_SET                             tab_set,
    p.ALIAS                               page_alias,
    decode(substr(p.PAGE_COMPONENT_MAP,1,2),
         '01','Tabular Form',
         '02','Form',
         '03','Report',
         '04','Chart',
         '05','Web Service',
         '06','Navigation Page',
         '07','Tree',
         '08','Calendar',
         '09','URL',
         '10','Dynamic HTML',
         '11','Static HTML',
         '12','Login',
         '13','Home',
         '14','Global Page',
         '15','Empty Page',
         '16','Dynamic Form',
         '17','Wizard Form',
         'Unknown')                       page_function,
    decode(
      p.ALLOW_DUPLICATE_SUBMISSIONS,
      'N','No','Y','Yes',null,'Yes',
      p.ALLOW_DUPLICATE_SUBMISSIONS)      allow_duplicate_submissions,
    --
    decode(INCLUDE_APEX_CSS_JS_YN,null,'Yes','Y','Yes','N','No','Unknown') INCLUDE_APEX_CSS_JS_YN,
    --
    decode(p.FIRST_ITEM,
      'AUTO_FIRST_ITEM','First Item on Page',
      'NO_FIRST_ITEM','Do not focus cursor',
      p.FIRST_ITEM)                       focus_cursor,
    p.WELCOME_TEXT                        Header_Text,
    p.BOX_WELCOME_TEXT                    Body_Header,
    --p.BOX_FOOTER_TEXT                     Body_footer,
    p.FOOTER_TEXT                         Footer_Text,
    p.HELP_TEXT                           help_text,
    (select name
     from wwv_flow_templates
     where id = p.STEP_TEMPLATE)          page_template,
     --
    decode(substr(p.REQUIRED_ROLE,1,1),'!','Not ')||
    nvl((select name
     from   wwv_flow_security_schemes
     where  to_char(id) = ltrim(p.REQUIRED_ROLE,'!')
     and    flow_id = f.id),
     p.REQUIRED_ROLE)                     authorization_scheme,
    p.required_role                       authorization_scheme_id,
     --
    (select case when p.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(p.REQUIRED_PATCH))         build_option,
    p.HTML_PAGE_HEADER                    page_html_header,
    p.HTML_PAGE_ONLOAD                    page_html_onload,
    p.javascript_file_urls,
    p.javascript_code,
    p.javascript_code_onload,
    p.css_file_urls,
    p.inline_css,
    --sec
    decode(p.PAGE_IS_PUBLIC_Y_N,
      'N','Yes','Y','No','Yes')            page_requires_Authentication,
    decode(nvl(p.PROTECTION_LEVEL,'N'),
       'N','Unrestricted',
       'C','Arguments Must Have Checksum',
       'U','No Arguments Allowed',
       'D','No URL Access',
       p.PROTECTION_LEVEL )               page_access_protection,
    --
    (select count(*) from wwv_flow_page_plugs where flow_id = f.id and page_id = p.id) regions,
    (select count(*) from wwv_flow_step_items ii where flow_id = f.id and flow_step_id = p.id and nvl(ii.display_as,'x') != 'BUTTON') items,
    (select count(*) from wwv_flow_step_buttons where flow_id = f.id and flow_step_id = p.id) +
    (select count(*) from wwv_flow_step_items ii where flow_id = f.id and flow_step_id = p.id and nvl(ii.display_as,'x') = 'BUTTON') buttons,
    (select count(*) from wwv_flow_step_computations where flow_id = f.id and flow_step_id = p.id) computations,
    (select count(*) from wwv_flow_step_validations where flow_id = f.id and flow_step_id = p.id) validations,
    (select count(*) from wwv_flow_step_processing where flow_id = f.id and flow_step_id = p.id) processes,
    (select count(*) from wwv_flow_step_branches where flow_id = f.id and flow_step_id = p.id) branches,
    (select count(*) from wwv_flow_region_report_column where flow_id = f.id and region_id in (select id from wwv_flow_page_plugs where flow_id = f.id and page_id = p.id)) report_columns,
    --
    (select     GROUP_NAME
     from     wwv_flow_page_groups
     where    id = p.group_id and
              flow_id = p.flow_id)        page_group,
    p.group_id                            page_group_id,
    --
    ON_DUP_SUBMISSION_GOTO_URL            ,
    p.error_handling_function,
    ERROR_NOTIFICATION_TEXT               ,
    decode(autocomplete_on_off,null,'On','ON','On','OFF','Off') form_autocomplete,
    p.page_transition,
    p.popup_transition,
    -- read only condition
    coalesce (
        ( select r
            from apex_standard_conditions
           where p.read_only_when_type is not null
             and d = p.read_only_when_type
        ),
        p.read_only_when_type )           read_only_condition_type,
    p.read_only_when_type                 read_only_condition_type_code,
    p.read_only_when                      read_only_condition_exp1,
    p.read_only_when2                     read_only_condition_exp2,
    --
    decode(CACHE_PAGE_YN,null,'No','N','No','Y','Yes',cache_page_yn) cached,
    CACHE_TIMEOUT_SECONDS                 cache_timeout_seconds,
    decode(CACHE_BY_USER_YN,null,'No','N','No','Y','Yes',cache_by_user_yn) cached_by_user,
    CACHE_WHEN_CONDITION_TYPE             cache_condition_type,
    CACHE_WHEN_CONDITION_E1               cache_condition_exp_1,
    CACHE_WHEN_CONDITION_E2               cache_condition_exp_2,
    page_comment                          page_comment,
    (select count(*) from WWV_FLOW_PAGE_PLUGS where flow_id = f.id and page_id = p.id and PLUG_CACHING in ('CACHED','CACHED_BY_USER'))  cached_regions,
    --
    p.created_by,
    p.created_on,
    p.LAST_UPDATED_BY                     last_updated_by,
    p.LAST_UPDATED_ON                     last_updated_on,
    --
    lpad(p.id,5,'00000')
    ||p.step_title||
    ',tabset='||p.tab_set
    ||' help='||sys.dbms_lob.getlength(p.HELP_TEXT)||
    decode(p.BOX_WELCOME_TEXT,null,null,'bodyhead='||length(p.BOX_WELCOME_TEXT))||
    decode(p.ALIAS,null,null,' alias='||p.ALIAS)||
    (select name from wwv_flow_templates where id = p.STEP_TEMPLATE)||
    --mh bug
    --nvl((select name from wwv_flow_security_schemes where to_char(id) = ltrim(p.REQUIRED_ROLE,'!') and flow_id = f.id),p.REQUIRED_ROLE)||
    nvl((select name from wwv_flow_security_schemes where to_char(id) = ltrim(p.REQUIRED_ROLE,'!') and flow_id = f.id),
    decode(substr(p.REQUIRED_ROLE,1,1),'!','Not ')||
    nvl((select name
     from   wwv_flow_security_schemes
     where  to_char(id) = ltrim(p.REQUIRED_ROLE,'!')
     and    flow_id = f.id),
     p.REQUIRED_ROLE)
    )||
    --
    (select PATCH_NAME from wwv_flow_patches where id =abs(p.REQUIRED_PATCH))||
    decode(p.FIRST_ITEM,'AUTO_FIRST_ITEM','First Item on Page','NO_FIRST_ITEM','Do not focus cursor',p.FIRST_ITEM)||
    decode(p.WELCOME_TEXT,null,null,'head='||length(p.WELCOME_TEXT))||
    decode(p.FOOTER_TEXT,null,null,',foot='||length(FOOTER_TEXT))||
    ',PgAuth='||decode(p.PAGE_IS_PUBLIC_Y_N,'N','Yes','Y','No','Yes')||
    ','||decode(nvl(p.PROTECTION_LEVEL,'N'),
       'N','Unrestricted',
       'C','Arguments Must Have Checksum',
       'U','No Arguments Allowed',
       'D','No URL Access',
       p.PROTECTION_LEVEL )||
     ',onload='||length(p.HTML_PAGE_ONLOAD)||
     ',hh='||nvl(length(p.HTML_PAGE_HEADER),0)
     component_signature,
    case p.browser_cache
      when 'Y' then 'Enabled'
      when 'N' then 'Disabled'
      else 'Application Default'
    end browser_cache,
    case p.deep_linking
      when 'Y' then 'Enabled'
      when 'N' then 'Disabled'
      else 'Application Default'
    end deep_linking
from wwv_flow_steps p,
     wwv_flows f,
     wwv_flow_company_schemas s,
     wwv_flow_companies w,
     (select nvl(nv('FLOW_SECURITY_GROUP_ID'),0) sgid ,
         (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (  s.schema                              = cu
        or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
        or d.sgid = w.PROVISIONING_COMPANY_ID)
      and f.security_group_id = w.PROVISIONING_COMPANY_ID
      and s.security_group_id = w.PROVISIONING_COMPANY_ID
      and s.schema = f.owner
      and f.security_group_id = p.security_group_id
      and f.id = p.flow_id
      and (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'))
      and w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_GROUPS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_GROUP_NAME",
"PAGE_GROUP_DESCRIPTION",
"GROUP_ID") AS
  select
    w.short_name                          workspace,
    w.display_name                        workspace_display_name,
    g.flow_id                             application_id,
    f.name                                application_name,
    g.group_name                          page_group_name,
    g.group_desc                          page_group_description,
    g.id                                  group_id
from wwv_flow_page_groups g,
     wwv_flows f,
     wwv_flow_company_schemas s,
     wwv_flow_companies w,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where  (s.schema  = cu
       or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
       or d.sgid              = w.PROVISIONING_COMPANY_ID )
      and f.security_group_id = w.PROVISIONING_COMPANY_ID
      and s.security_group_id = w.PROVISIONING_COMPANY_ID
      and s.schema = f.owner
      and f.security_group_id = g.security_group_id
      and f.id = g.flow_id
      and (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'))
      and w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_ITEMS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"ITEM_NAME",
"DISPLAY_AS",
"DISPLAY_AS_CODE",
"ITEM_DATA_TYPE",
"IS_REQUIRED",
"STANDARD_VALIDATIONS",
"DISPLAY_SEQUENCE",
"REGION",
"REGION_ID",
"SOURCE_USED",
"ITEM_DEFAULT",
"ITEM_DEFAULT_TYPE",
"LABEL",
"PLACEHOLDER",
"PRE_ELEMENT_TEXT",
"POST_ELEMENT_TEXT",
"FORMAT_MASK",
"ITEM_LABEL_TEMPLATE",
"ITEM_LABEL_TEMPLATE_ID",
"ITEM_SOURCE",
"ITEM_SOURCE_TYPE",
"ENCRYPT_SESSION_STATE",
"SOURCE_POST_COMPUTATION",
"READ_ONLY_CONDITION_TYPE",
"READ_ONLY_CONDITION_TYPE_CODE",
"READ_ONLY_CONDITION_EXP1",
"READ_ONLY_CONDITION_EXP2",
"READ_ONLY_DISPLAY_ATTR",
"LOV_NAMED_LOV",
"LOV_DEFINITION",
"LOV_DISPLAY_EXTRA",
"LOV_DISPLAY_NULL",
"LOV_NULL_TEXT",
"LOV_NULL_VALUE",
"LOV_QUERY_RESULT_TRANSLATED",
"LOV_CASCADE_PARENT_ITEMS",
"AJAX_ITEMS_TO_SUBMIT",
"AJAX_OPTIMIZE_REFRESH",
"ITEM_ELEMENT_WIDTH",
"ITEM_ELEMENT_MAX_LENGTH",
"ITEM_ELEMENT_HEIGHT",
"HTML_TABLE_CELL_ATTR_LABEL",
"HTML_TABLE_CELL_ATTR_ELEMENT",
"HTML_FORM_ELEMENT_CSS_CLASSES",
"HTML_FORM_ELEMENT_ATTRIBUTES",
"FORM_ELEMENT_OPTION_ATTRIBUTES",
"ITEM_BUTTON_IMAGE",
"ITEM_BUTTON_IMAGE_ATTRIBUTES",
"NEW_GRID",
"NEW_GRID_ROW",
"NEW_GRID_COLUMN",
"GRID_COLUMN",
"GRID_COLUMN_SPAN",
"BEGINS_ON_NEW_ROW",
"BEGINS_ON_NEW_CELL",
"COLUMN_SPAN",
"ROW_SPAN",
"LABEL_ALIGNMENT",
"ITEM_ALIGNMENT",
"SHOW_QUICK_PICKS",
"QUICK_PICK_LINK_ATTR",
"QUICK_PICK_LABEL_01",
"QUICK_PICK_VALUE_01",
"QUICK_PICK_LABEL_02",
"QUICK_PICK_VALUE_02",
"QUICK_PICK_LABEL_03",
"QUICK_PICK_VALUE_03",
"QUICK_PICK_LABEL_04",
"QUICK_PICK_VALUE_04",
"QUICK_PICK_LABEL_05",
"QUICK_PICK_VALUE_05",
"QUICK_PICK_LABEL_06",
"QUICK_PICK_VALUE_06",
"QUICK_PICK_LABEL_07",
"QUICK_PICK_VALUE_07",
"QUICK_PICK_LABEL_08",
"QUICK_PICK_VALUE_08",
"QUICK_PICK_LABEL_09",
"QUICK_PICK_VALUE_09",
"QUICK_PICK_LABEL_10",
"QUICK_PICK_VALUE_10",
"ATTRIBUTE_01",
"ATTRIBUTE_02",
"ATTRIBUTE_03",
"ATTRIBUTE_04",
"ATTRIBUTE_05",
"ATTRIBUTE_06",
"ATTRIBUTE_07",
"ATTRIBUTE_08",
"ATTRIBUTE_09",
"ATTRIBUTE_10",
"ATTRIBUTE_11",
"ATTRIBUTE_12",
"ATTRIBUTE_13",
"ATTRIBUTE_14",
"ATTRIBUTE_15",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"MAINTAIN_SESSION_STATE",
"ITEM_PROTECTION_LEVEL",
"ESCAPE_ON_HTTP_OUTPUT",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"BUILD_OPTION",
"BUILD_OPTION_ID",
"ITEM_HELP_TEXT",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"ITEM_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                    workspace,
    w.display_name                  workspace_display_name,
    p.flow_id                       application_id,
    f.name                          application_name,
    p.id                            page_id,
    p.name                          page_name,
    --
    i.name                          item_name,
    case substr(i.display_as, 1, 7)
      when 'NATIVE_' then
          ( select display_name from wwv_flow_plugins where flow_id = 4411 and plugin_type = 'ITEM TYPE' and name = substr(i.display_as, 8) )
      when 'PLUGIN_' then
          ( select display_name from wwv_flow_plugins where flow_id = p.flow_id and plugin_type = 'ITEM TYPE' and name = substr(i.display_as, 8) )
      else
          nvl((select display_name from wwv_flow_standard_item_types where name = i.display_as), i.display_as)
    end                             display_as,
    i.display_as                    display_as_code,
    decode(i.DATA_TYPE,
       'NUMBER','Numbers Only',
       'VARCHAR','Varchar',
       i.DATA_TYPE)                 item_data_type,
    case
      when i.is_required = 'Y' then 'Yes'
      else 'No'
    end                             is_required,
    nvl(i.standard_validations, 'Application Level Setting') standard_validations,
    --
    i.ITEM_SEQUENCE                 display_sequence,
    (select plug_name
     from wwv_flow_page_plugs
     where id = i.ITEM_PLUG_ID)     region,
    i.item_plug_id                  region_id,
    --
    decode(
      i.USE_CACHE_BEFORE_DEFAULT,
      'NO','Always, replacing any existing value in session state',
      'YES','Only when current value in session state is null',
      i.USE_CACHE_BEFORE_DEFAULT)   source_used,
    i.ITEM_DEFAULT                  item_default,
    i.ITEM_DEFAULT_TYPE             item_default_type,
    --
    i.PROMPT                        label,
    i.placeholder                   placeholder,
    i.PRE_ELEMENT_TEXT              pre_element_text,
    i.POST_ELEMENT_TEXT             post_element_text,
    i.FORMAT_MASK                   format_mask,
    (select template_name
     from   wwv_flow_field_templates
     where  id = to_char(i.ITEM_FIELD_TEMPLATE)
     and    flow_id = f.id)         item_label_template,
    i.ITEM_FIELD_TEMPLATE           item_label_template_id,
    i.SOURCE                        item_source,
    decode(i.SOURCE_TYPE,
      'ALWAYS_NULL','Always Null',
      'STATIC','Static Assignment (value equals source attribute)',
      'QUERY','SQL Query (return single value)',
      'QUERY_COLON','SQL Query (return colon separated value)',
      'ITEM','Item (application or page item name)',
      'FUNCTION','PL/SQL Expression or Function',
      'FUNCTION_BODY','PL/SQL Function Body',
      'DB_COLUMN','Database Column',
      'PREFERENCE','Preference',
      i.SOURCE_TYPE)                item_source_type,
    decode(i.encrypt_session_state_yn,'Y','Yes','No') encrypt_session_state,
    i.SOURCE_POST_COMPUTATION       source_post_computation,
    -- read only conditionality
    nvl((select r from apex_standard_conditions where d = i.READ_ONLY_WHEN_TYPE),i.READ_ONLY_WHEN_TYPE)
                                    read_only_condition_type,
    i.read_only_when_type           read_only_condition_type_code,
    i.READ_ONLY_WHEN                read_only_condition_exp1,
    i.READ_ONLY_WHEN2               read_only_condition_exp2,
    i.READ_ONLY_DISP_ATTR           read_only_display_attr,
    --
    i.NAMED_LOV                     lov_named_lov,
    i.LOV                           lov_definition,
    decode(i.LOV_DISPLAY_EXTRA,
      'NO','No',
      'YES','Yes',
      i.LOV_DISPLAY_EXTRA)          lov_display_extra,
    decode(i.LOV_DISPLAY_NULL,
      'NO','No',
      'YES','Yes',
      i.LOV_DISPLAY_NULL)           lov_display_null,
    i.LOV_NULL_TEXT                 lov_null_text,
    i.LOV_NULL_VALUE                lov_null_value,
    decode(i.LOV_TRANSLATED,
      'N','No','Y','Yes',
      i.LOV_TRANSLATED)             lov_query_result_translated,
    lov_cascade_parent_items,
    ajax_items_to_submit,
    case nvl(i.ajax_optimize_refresh, 'Y')
      when 'Y' then 'Yes'
      when 'N' then 'No'
      else i.ajax_optimize_refresh
    end                             ajax_optimize_refresh,
    --
    i.csize                         item_element_width,
    i.cmaxlength                    item_element_max_length,
    i.cheight                       item_element_height,
    --
    i.cattributes                   html_table_cell_attr_label,
    i.cattributes_element           html_table_cell_attr_element,
    i.tag_css_classes               html_form_element_css_classes,
    i.tag_attributes                html_form_element_attributes,
    i.tag_attributes2               form_element_option_attributes,
    --
    i.button_image                  item_button_image,
    i.button_image_attr             item_button_image_attributes,
    --
    case i.new_grid
      when 'Y' then 'Yes'
      else 'No'
    end                             new_grid,
    case i.begin_on_new_line
      when 'YES' then 'Yes'
      else 'No'
    end                             new_grid_row,
    case i.begin_on_new_field
      when 'YES' then 'Yes'
      else 'No'
    end                             new_grid_column,
    i.grid_column                   grid_column,
    i.colspan                       grid_column_span,
    --
    decode(i.BEGIN_ON_NEW_LINE,
      'NO','No','YES','Yes',
      i.BEGIN_ON_NEW_LINE)          begins_on_new_row,  /* for backward compatibility */
    decode(i.BEGIN_ON_NEW_FIELD,
      'NO','No','YES','Yes',
      i.BEGIN_ON_NEW_FIELD)         begins_on_new_cell, /* for backward compatibility */
    i.COLSPAN                       column_span,        /* for backward compatibility */
    --
    i.ROWSPAN                       row_span,
    --
    decode(i.LABEL_ALIGNMENT,
      'ABOVE',         'Above',
      'BELOW',         'Below',
      'CENTER',        'Center',
      'CENTER-BOTTOM', 'Bottom center',
      'CENTER-CENTER', 'Center center',
      'CENTER-TOP',    'Top center',
      'LEFT',          'Left',
      'LEFT-BOTTOM',   'Bottom left',
      'LEFT-CENTER',   'Center left',
      'LEFT-TOP',      'Top left',
      'RIGHT',         'Right',
      'RIGHT-BOTTOM',  'Bottom right',
      'RIGHT-CENTER',  'Center right',
      'RIGHT-TOP',     'Top right',
      i.LABEL_ALIGNMENT)            label_alignment,
    decode(i.FIELD_ALIGNMENT,
      'CENTER',       'Center',
      'CENTER-BOTTOM','Center bottom',
      'CENTER-CENTER','Center center',
      'CENTER-TOP',   'Center top',
      'LEFT',         'Left',
      'LEFT-BOTTOM',  'Left bottom',
      'LEFT-CENTER',  'Left center',
      'LEFT-TOP',     'Left top',
      'RIGHT',        'Right',
      'RIGHT-BOTTOM', 'Right bottom',
      'RIGHT-CENTER', 'Right center',
      'RIGHT-TOP',    'Right top',
      i.FIELD_ALIGNMENT)            item_alignment,
    --
    --i.FIELD_TEMPLATE,
    --
    decode(i.show_quick_picks,
      'NO','No','YES','Yes',
      i.show_quick_picks)           show_quick_picks,
    i.quick_pick_link_attr,
    i.quick_pick_label_01,
    i.quick_pick_value_01,
    i.quick_pick_label_02,
    i.quick_pick_value_02,
    i.quick_pick_label_03,
    i.quick_pick_value_03,
    i.quick_pick_label_04,
    i.quick_pick_value_04,
    i.quick_pick_label_05,
    i.quick_pick_value_05,
    i.quick_pick_label_06,
    i.quick_pick_value_06,
    i.quick_pick_label_07,
    i.quick_pick_value_07,
    i.quick_pick_label_08,
    i.quick_pick_value_08,
    i.quick_pick_label_09,
    i.quick_pick_value_09,
    i.quick_pick_label_10,
    i.quick_pick_value_10,
    --
    i.attribute_01,
    i.attribute_02,
    i.attribute_03,
    i.attribute_04,
    i.attribute_05,
    i.attribute_06,
    i.attribute_07,
    i.attribute_08,
    i.attribute_09,
    i.attribute_10,
    i.attribute_11,
    i.attribute_12,
    i.attribute_13,
    i.attribute_14,
    i.attribute_15,
    --
    nvl((select r from apex_standard_conditions where d = i.DISPLAY_WHEN_TYPE),i.DISPLAY_WHEN_TYPE)
                                    condition_type,
    i.display_when_type             condition_type_code,
    i.DISPLAY_WHEN                  condition_expression1,
    i.DISPLAY_WHEN2                 condition_expression2,
    --
    decode(i.IS_PERSISTENT,
       'Y','Per Session',
       'U','Per User',
       'N','Do Not Save Session State',
       i.IS_PERSISTENT)             maintain_session_state,
    decode(nvl(i.PROTECTION_LEVEL,'N'),
       'N','Unrestricted',
       'C','Arguments Must Have Checksum',
       'U','No Arguments Allowed',
       'D','No URL Access',
       'S','Checksum Required - Session Level',
       'I','Restricted - May not be set from browser',
       'B','Checksum Required - Application Level',
       'P','Checksum Required - User Level',
       i.PROTECTION_LEVEL)          item_protection_level,
    case i.escape_on_http_output
      when 'Y' then 'Yes'
      when 'N' then 'No'
      else i.escape_on_http_output
    end                             escape_on_http_output,
    --i.ESCAPE_ON_HTTP_INPUT
    --
    decode(substr(i.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from   wwv_flow_security_schemes
     where  to_char(id) = ltrim(i.SECURITY_SCHEME,'!')
     and    flow_id = f.id),
     i.SECURITY_SCHEME)             authorization_scheme,
    i.security_scheme               authorization_scheme_id,
    (select case when i.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(i.REQUIRED_PATCH))   build_option,
    i.REQUIRED_PATCH                build_option_id,
    --
    (select max(help_text) h
    from wwv_flow_step_item_help
    where FLOW_ITEM_ID = i.id)      item_help_text,
    --
    i.LAST_UPDATED_BY               last_updated_by,
    i.LAST_UPDATED_ON               last_updated_on,
    i.ITEM_COMMENT                  component_comment,
    i.id                            item_id,
    --
    i.name
    ||' da='||i.display_as
    ||decode(i.DATA_TYPE,'NUMBER','NOnly','VARCHAR','V',i.DATA_TYPE)
    ||',seq='||lpad(i.ITEM_SEQUENCE,5,'00000')
    ||',r='||(select plug_name from wwv_flow_page_plugs where id=i.ITEM_PLUG_ID)
    ||',c='||decode(i.USE_CACHE_BEFORE_DEFAULT,'NO','Always','YES','Only null',i.USE_CACHE_BEFORE_DEFAULT)
    ||',d='||substr(i.ITEM_DEFAULT,1,20)||length(i.ITEM_DEFAULT)||i.ITEM_DEFAULT_TYPE
    ||',l='||substr(i.PROMPT,1,20)||length(i.prompt)
    ||substr(i.PRE_ELEMENT_TEXT,1,10)||length(i.PRE_ELEMENT_TEXT)
    ||substr(i.POST_ELEMENT_TEXT,1,10)||length(i.POST_ELEMENT_TEXT)
    ||',m='||i.FORMAT_MASK
    ||'t='||(select template_name from   wwv_flow_field_templates where  id = to_char(i.ITEM_FIELD_TEMPLATE) and flow_id = f.id)
    ||'s='||substr(i.SOURCE,1,30)||length(i.source)
    ||decode(i.SOURCE_TYPE,
      'ALWAYS_NULL','Always Null',
      'STATIC','StaticAs',
      'QUERY','SQLQuery',
      'QUERY_COLON','SQLQueryColon',
      'ITEM','Item ',
      'FUNCTION','PL/SQL',
      'FUNCTION_BODY','PL/SQLFunctionBody',
      'DB_COLUMN','DBColumn',
      'PREFERENCE','Pref',
      i.SOURCE_TYPE)
    ||length(i.SOURCE_POST_COMPUTATION)
    ||' ro='||nvl((select r from apex_standard_conditions where d = i.READ_ONLY_WHEN_TYPE),i.READ_ONLY_WHEN_TYPE)
    ||length(i.READ_ONLY_WHEN)
    ||length(i.READ_ONLY_WHEN2)
    ||length(i.READ_ONLY_DISP_ATTR)
    ||',lov='||i.NAMED_LOV
    ||decode(i.named_lov,null,null,length(i.LOV))
    ||decode(i.LOV_DISPLAY_EXTRA,
      'NO','No',
      'YES','Yes',
      i.LOV_DISPLAY_EXTRA)
    ||decode(i.LOV_DISPLAY_NULL,
      'NO','No',
      'YES','Yes',
      i.LOV_DISPLAY_NULL)
    ||substr(LOV_NULL_TEXT,1,20)||length(LOV_NULL_TEXT)
    ||i.LOV_NULL_VALUE
    ||',t='||decode(i.LOV_TRANSLATED,'N','No','Y','Yes',i.LOV_TRANSLATED)
    ||',s='||i.csize||i.cmaxlength||i.cheight
    ||',a='||substr(i.cattributes,1,10)||length(i.cattributes)
    ||length(i.cattributes_element)
    ||length(i.tag_attributes)
    ||length(i.tag_attributes2)
    ||',b='||length(i.button_image)||length(i.button_image_attr)
    ||',disp='||decode(i.BEGIN_ON_NEW_LINE,
      'NO','No','YES','Yes',
      i.BEGIN_ON_NEW_LINE)||decode(i.BEGIN_ON_NEW_FIELD,
      'NO','No','YES','Yes',
      i.BEGIN_ON_NEW_FIELD)||i.COLSPAN||i.ROWSPAN
    ||' l='||decode(i.LABEL_ALIGNMENT,
      'ABOVE',         'Above',
      'BELOW',         'Below',
      'CENTER',        'Center',
      'CENTER-BOTTOM', 'Bottom center',
      'CENTER-CENTER', 'Center center',
      'CENTER-TOP',    'Top center',
      'LEFT',          'Left',
      'LEFT-BOTTOM',   'Bottom left',
      'LEFT-CENTER',   'Center left',
      'LEFT-TOP',      'Top left',
      'RIGHT',         'Right',
      'RIGHT-BOTTOM',  'Bottom right',
      'RIGHT-CENTER',  'Center right',
      'RIGHT-TOP',     'Top right',
      i.LABEL_ALIGNMENT)||decode(i.FIELD_ALIGNMENT,
      'CENTER',       'Center',
      'CENTER-BOTTOM','Center bottom',
      'CENTER-CENTER','Center center',
      'CENTER-TOP',   'Center top',
      'LEFT',         'Left',
      'LEFT-BOTTOM',  'Left bottom',
      'LEFT-CENTER',  'Left center',
      'LEFT-TOP',     'Left top',
      'RIGHT',        'Right',
      'RIGHT-BOTTOM', 'Right bottom',
      'RIGHT-CENTER', 'Right center',
      'RIGHT-TOP',    'Right top',
      i.FIELD_ALIGNMENT)
    ||',c='||i.DISPLAY_WHEN_TYPE||substr(i.DISPLAY_WHEN,1,20)||length(i.DISPLAY_WHEN)||length(i.DISPLAY_WHEN2)
    ||decode(i.IS_PERSISTENT,
       'Y','PerSes',
       'U','PerU',
       'N','Do Not Save SesSt',
       i.IS_PERSISTENT)||
    decode(nvl(i.PROTECTION_LEVEL,'N'),
       'N','Unrest',
       'C','Arg Must Have Cs',
       'U','No Arguments Allowed',
       'D','No URL Access',
       'S','Cs Required - Session Level',
       'I','Restricted - May not be set from browser',
       'B','Cs Req-AL',
       'P','Cs Req-UL',
       i.PROTECTION_LEVEL)
    ||decode(substr(i.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from   wwv_flow_security_schemes
     where  to_char(id) = ltrim(i.SECURITY_SCHEME,'!')
     and    flow_id = f.id),
     i.SECURITY_SCHEME)
     ||(select PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(i.REQUIRED_PATCH))
    component_signature
from wwv_flow_step_items i,
     wwv_flow_steps p,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu
       or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
       or d.sgid              = w.PROVISIONING_COMPANY_ID)
      and f.security_group_id = w.PROVISIONING_COMPANY_ID
      and s.security_group_id = w.PROVISIONING_COMPANY_ID
      and s.schema = f.owner
      and f.security_group_id = p.security_group_id
      and f.id = p.flow_id
      and f.id = i.flow_id
      and p.id = i.flow_step_id
      and nvl(i.display_as,'x') != 'BUTTON'
      and (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'))
      and w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_DB_ITEMS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"REGION",
"ITEM_NAME",
"DISPLAY_AS",
"DISPLAY_SEQUENCE",
"ITEM_LABEL",
"DB_COLUMN_NAME",
"DB_TABLE_NAME",
"HELP_TEXT",
"ITEM_ID") AS
  select
    w.short_name                    workspace,
    w.display_name                  workspace_display_name,
    p.flow_id                       application_id,
    f.name                          application_name,
    p.id                            page_id,
    p.name                          page_name,
    (select plug_name
     from wwv_flow_page_plugs
     where id = i.ITEM_PLUG_ID)     region,
    --
    i.name                          item_name,
    i.display_as                    display_as,
    i.ITEM_SEQUENCE                 display_sequence,
    --
    i.PROMPT                        item_label,
    i.SOURCE                        db_column_name,
    apex_application_get_pg_tname(
    p.flow_id,p.id)                 db_table_name,
    h.help_text                     help_text,
    i.id                            item_id
from wwv_flow_step_items i,
     wwv_flow_step_item_help h,
     wwv_flow_steps p,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu
       or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
       or d.sgid              = w.PROVISIONING_COMPANY_ID )
      and f.security_group_id = w.PROVISIONING_COMPANY_ID
      and s.security_group_id = w.PROVISIONING_COMPANY_ID
      and s.schema = f.owner
      and f.security_group_id = p.security_group_id
      and i.id = h.flow_item_id (+)
      and f.id = p.flow_id
      and f.id = i.flow_id
      and p.id = i.flow_step_id
      and nvl(i.display_as,'x') != 'BUTTON'
      and (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'))
      and i.source_type = 'DB_COLUMN' and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_REGIONS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"REGION_NAME",
"PARENT_REGION_ID",
"PARENT_REGION_NAME",
"TEMPLATE",
"TEMPLATE_ID",
"STATIC_ID",
"REST_ENABLED",
"DISPLAY_SEQUENCE",
"NEW_GRID",
"NEW_GRID_ROW",
"NEW_GRID_COLUMN",
"GRID_COLUMN",
"GRID_COLUMN_SPAN",
"DISPLAY_REGION_SELECTOR",
"REGION_CSS_CLASSES",
"REGION_ATTRIBUTES_SUBSTITUTION",
"ESCAPE_ON_HTTP_OUTPUT",
"DISPLAY_COLUMN",
"DISPLAY_POSITION",
"DISPLAY_POSITION_CODE",
"DISPLAY_ITEM_POSITION",
"DISPLAY_ITEM_POSITION_CODE",
"REGION_SOURCE",
"BREADCRUMB_TEMPLATE",
"BREADCRUMB_TEMPLATE_ID",
"LIST_TEMPLATE_OVERRIDE",
"LIST_TEMPLATE_OVERRIDE_ID",
"SOURCE_TYPE",
"SOURCE_TYPE_CODE",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"READ_ONLY_CONDITION_TYPE",
"READ_ONLY_CONDITION_TYPE_CODE",
"READ_ONLY_CONDITION_EXP1",
"READ_ONLY_CONDITION_EXP2",
"REGION_HEADER_TEXT",
"REGION_FOOTER_TEXT",
"REPORT_TEMPLATE",
"REPORT_TEMPLATE_ID",
"REPORT_COLUMN_HEADINGS",
"HEADINGS_TYPE",
"MAXIMUM_ROWS_TO_QUERY",
"PAGINATION_SCHEME",
"PAGINATION_DISPLAY_POSITION",
"AJAX_ENABLED",
"AJAX_ITEMS_TO_SUBMIT",
"NUMBER_OF_ROWS_ITEM",
"NO_DATA_FOUND_MESSAGE",
"MORE_DATA_FOUND_MESSAGE",
"MAXIMUM_ROW_COUNT",
"REPORT_NULL_VALUES_AS",
"BREAKS",
"ASCENDING_IMAGE",
"ASCENDING_IMAGE_ATTRIBUTES",
"DESCENDING_IMAGE",
"DESCENDING_IMAGE_ATTRIBUTES",
"FILENAME",
"SEPARATOR",
"ENCLOSED_BY",
"STRIP_HTML",
"REPORT_COLUMN_SOURCE_TYPE",
"MAX_DYNAMIC_REPORT_COLS",
"HTML_TABLE_CELL_ATTRIBUTES",
"CUSTOMIZATION",
"CUSTOMIZATION_NAME",
"BUILD_OPTION",
"BUILD_OPTION_ID",
"REGION_CACHING",
"TIMEOUT_CACHE_AFTER",
"CACHE_WHEN",
"CACHE_WHEN_EXPRESSION_1",
"CACHE_WHEN_EXPRESSION_2",
"SUM_DISPLAY_TEXT",
"BREAK_DISPLAY_TEXT",
"BEFORE_BREAK_DISPLAY_TEXT",
"BREAK_COLUMN_DISPLAY_TEXT",
"AFTER_BREAK_DISPLAY_TEXT",
"BREAK_DISPLAY_FLAG",
"REPEAT_HEADING_BREAK_FORMAT",
"ENABLE_CSV_OUTPUT",
"CSV_LINK_LABEL",
"URL",
"LINK_LABEL",
"TRANSLATE_REGION_TITLE",
"ATTRIBUTE_01",
"ATTRIBUTE_02",
"ATTRIBUTE_03",
"ATTRIBUTE_04",
"ATTRIBUTE_05",
"ATTRIBUTE_06",
"ATTRIBUTE_07",
"ATTRIBUTE_08",
"ATTRIBUTE_09",
"ATTRIBUTE_10",
"ATTRIBUTE_11",
"ATTRIBUTE_12",
"ATTRIBUTE_13",
"ATTRIBUTE_14",
"ATTRIBUTE_15",
"ATTRIBUTE_16",
"ATTRIBUTE_17",
"ATTRIBUTE_18",
"ATTRIBUTE_19",
"ATTRIBUTE_20",
"ATTRIBUTE_21",
"ATTRIBUTE_22",
"ATTRIBUTE_23",
"ATTRIBUTE_24",
"ATTRIBUTE_25",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"REGION_ID",
"ITEMS",
"BUTTONS",
"COMPONENT_SIGNATURE",
"LIST_ID") AS
  select
    w.short_name                         workspace,
    w.display_name                       workspace_display_name,
    p.flow_id                            application_id,
    f.name                               application_name,
    p.id                                 page_id,
    p.name                               page_name,
    --
    r.plug_name                          region_name,
    r.parent_plug_id                     parent_region_id,
    case
      when r.parent_plug_id is not null then
          ( select region_name
              from wwv_flow_page_plugs
             where id = r.parent_plug_id )
    end                                  parent_region_name,
    nvl(decode(nvl(r.PLUG_TEMPLATE,0),0,
     'No Template',
     (select PAGE_PLUG_TEMPLATE_NAME
     from wwv_flow_page_plug_templates
     where id = r.PLUG_TEMPLATE)),'No Template') template,
    r.PLUG_TEMPLATE                      template_id,
    r.region_name                        static_id,
    decode(nvl(r.rest_enabled,'N'),'Y','Yes','No') rest_enabled,
    r.PLUG_DISPLAY_SEQUENCE              display_sequence,
    case r.plug_new_grid
      when 'Y' then 'Yes'
      else 'No'
    end                                  new_grid,
    case r.plug_new_grid_row
      when 'Y' then 'Yes'
      else 'No'
    end                                  new_grid_row,
    case r.plug_new_grid_column
      when 'Y' then 'Yes'
      else 'No'
    end                                  new_grid_column,
    r.PLUG_DISPLAY_COLUMN                grid_column,
    r.plug_grid_column_span              grid_column_span,
    decode(nvl(r.INCLUDE_IN_REG_DISP_SEL_YN,'N'),
        'Y','Yes','N','No',r.INCLUDE_IN_REG_DISP_SEL_YN)
                                         display_region_selector,
    r.region_css_classes,
    r.REGION_ATTRIBUTES_SUBSTITUTION     REGION_ATTRIBUTES_SUBSTITUTION,
    case r.escape_on_http_output
      when 'Y' then 'Yes'
      when 'N' then 'No'
      else r.escape_on_http_output
    end                                  escape_on_http_output,
    r.PLUG_DISPLAY_COLUMN                display_column, /* for backward compatibility, replaced by grid_column */
    decode(r.PLUG_DISPLAY_POINT,
       'AFTER_HEADER',       'After Header',
       'BODY_1',             'Page Template Body (1)',
       'BODY_2',             'Page Template Body (2)',
       'BODY_3',             'Page Template Body (3)',
       'BEFORE_FOOTER',      'Before Footer',
       'REGION_POSITION_01', 'Page Template Region Position 1',
       'REGION_POSITION_02', 'Page Template Region Position 2',
       'REGION_POSITION_03', 'Page Template Region Position 3',
       'REGION_POSITION_04', 'Page Template Region Position 4',
       'REGION_POSITION_05', 'Page Template Region Position 5',
       'REGION_POSITION_06', 'Page Template Region Position 6',
       'REGION_POSITION_07', 'Page Template Region Position 7',
       'REGION_POSITION_08', 'Page Template Region Position 8',
       r.PLUG_DISPLAY_POINT)
                                         display_position,
    r.plug_display_point                 display_position_code,
    case plug_item_display_point
    when 'ABOVE' then 'Above Content'
    when 'BELOW' then 'Below Content'
    end                                  display_item_position,
    r.plug_item_display_point            display_item_position_code,
    --
    r.PLUG_SOURCE                        region_source,
    (select name
    from   wwv_flow_menu_templates
    where  id = to_char(r.MENU_TEMPLATE_ID)
    and    flow_id = f.id)                 breadcrumb_template,
    r.MENU_TEMPLATE_ID                     breadcrumb_template_id,
    --
    (select list_template_name
    from wwv_flow_list_templates
    where id = r.LIST_TEMPLATE_ID)         list_template_override,
    r.LIST_TEMPLATE_ID                     list_template_override_id,
    --
    case r.plug_source_type
      when 'PLSQL_PROCEDURE'              then 'PL/SQL'
      when 'SIMPLE_CHART'                 then 'HTML Chart'
      when 'FLASH_CHART'                  then 'Flash Chart'
      when 'FLASH_CHART5'                 then 'Flash Chart'
      when 'FLASH_MAP'                    then 'Map'
      when 'SQL_QUERY'                    then 'Report'
      when 'DYNAMIC_QUERY'                then 'Interactive Report'
      when 'STATIC_TEXT'                  then 'HTML/Text'
      when 'STATIC_TEXT_ESCAPE_SC'        then 'HTML/Text (escape special characters)'
      when 'STATIC_TEXT_WITH_SHORTCUTS'   then 'HTML/Text (with shortcuts)'
      when 'STRUCTURED_QUERY'             then 'Report'
      when 'FUNCTION_RETURNING_SQL_QUERY' then 'Report'
      when 'SVG_CHART'                    then 'SVG Chart'
      when 'TREE'                         then 'Tree'
      when 'UPDATABLE_SQL_QUERY'          then 'Tabular Form'
      when 'URL'                          then 'URL'
      when 'REGION_DISPLAY_SELECTOR'      then 'Region Display Selector'
      when 'CALENDAR'                     then 'Calendar'
      when 'EASY_CALENDAR'                then 'Easy Calendar'
      when 'JSTREE'                       then 'JavaScript Tree'
      when 'HELP_TEXT'                    then 'Help Text'
      else
          case
            when r.plug_source_type like 'NATIVE\_%' escape '\' then
                ( select display_name from wwv_flow_plugins where flow_id = 4411 and plugin_type = 'REGION TYPE' and name = substr(r.plug_source_type, 8) )
            when r.plug_source_type like 'PLUGIN\_%' escape '\' then
                ( select display_name from wwv_flow_plugins where flow_id = r.flow_id and plugin_type = 'REGION TYPE' and name = substr(r.plug_source_type, 8) )
            when substr(r.PLUG_SOURCE_TYPE,1,1) = 'M' then 'Breadcrumb'
            else 'List'
          end
      end                                source_type,
    r.plug_source_type                   source_type_code,
    --
    --
    decode(substr(r.PLUG_REQUIRED_ROLE,1,1),'!','Not ')||
    nvl((select name
     from   wwv_flow_security_schemes
     where  to_char(id) = ltrim(r.PLUG_REQUIRED_ROLE,'!')
     and    flow_id = f.id),
     r.PLUG_REQUIRED_ROLE)               authorization_scheme,
    r.PLUG_REQUIRED_ROLE                 authorization_scheme_id,
    nvl((select r from apex_standard_conditions where d = r.PLUG_DISPLAY_CONDITION_TYPE),r.PLUG_DISPLAY_CONDITION_TYPE)
                                         condition_type,
    r.plug_display_condition_type        condition_type_code,
    r.PLUG_DISPLAY_WHEN_CONDITION        condition_expression1,
    r.PLUG_DISPLAY_WHEN_COND2            condition_expression2,
    -- read only condition
    coalesce (
        ( select r
            from apex_standard_conditions
           where r.plug_read_only_when_type is not null
             and d = r.plug_read_only_when_type
        ),
        r.plug_read_only_when_type )     read_only_condition_type,
    r.plug_read_only_when_type           read_only_condition_type_code,
    r.plug_read_only_when                read_only_condition_exp1,
    r.plug_read_only_when2               read_only_condition_exp2,
    --
    r.PLUG_HEADER                        region_header_text,
    r.PLUG_FOOTER                        region_footer_text,
    (select row_template_name from wwv_flow_row_templates where id = r.PLUG_QUERY_ROW_TEMPLATE)
                                         report_template,
    r.PLUG_QUERY_ROW_TEMPLATE            report_template_id,
    r.PLUG_QUERY_HEADINGS                report_column_headings,
    r.PLUG_QUERY_HEADINGS_TYPE           headings_type,
    r.PLUG_QUERY_NUM_ROWS                maximum_rows_to_query,
    decode(r.PLUG_QUERY_NUM_ROWS_TYPE,
       'ROWS_X_TO_Y_OF_Z','Row Ranges X to Y of Z (no pagination)',
       'ROWS_X_TO_Y','Row Ranges X to Y (no pagination)',
       'SEARCH_ENGINE','Search Engine 1,2,3,4 (set based pagination)',
       'COMPUTED_BUT_NOT_DISPLAYED','Use Externally Created Pagination Buttons',
       'ROW_RANGES','Row Ranges 1-15 16-30 (with set pagination)',
       'ROW_RANGES_IN_SELECT_LIST','Row Ranges 1-15 16-30 in select list (with pagination)',
       'ROW_RANGES_WITH_LINKS','Row Ranges X to Y of Z (with pagination)',
       'NEXT_PREVIOUS_LINKS','Row Ranges X to Y (with next and previous links)',
       r.PLUG_QUERY_NUM_ROWS_TYPE)       pagination_scheme,
    decode(r.PAGINATION_DISPLAY_POSITION,
      'BOTTOM_LEFT','Bottom - Left',
      'BOTTOM_RIGHT','Bottom - Right',
      'TOP_LEFT','Top - Left',
      'TOP_RIGHT','Top - Right',
      'TOP_AND_BOTTOM_LEFT','Top and Bottom - Left',
      'TOP_AND_BOTTOM_RIGHT','Top and Bottom - Right',
      r.PAGINATION_DISPLAY_POSITION)     pagination_display_position,
    decode(r.ajax_enabled,'Y','Yes','N','No',r.ajax_enabled) ajax_enabled,
    r.ajax_items_to_submit,
    r.PLUG_QUERY_NUM_ROWS_ITEM           number_of_rows_item,
    r.PLUG_QUERY_NO_DATA_FOUND           no_data_found_message,
    r.PLUG_QUERY_MORE_DATA               more_data_found_message,
    r.PLUG_QUERY_ROW_COUNT_MAX           maximum_row_count,
    --r.PLUG_QUERY_FORMAT_OUT              query_format_out,
    r.PLUG_QUERY_SHOW_NULLS_AS           report_null_values_as,
    --r.PLUG_QUERY_COL_ALLIGNMENTS         ,
    r.PLUG_QUERY_BREAK_COLS              breaks,
    --r.PLUG_QUERY_SUM_COLS                ,
    --r.PLUG_QUERY_NUMBER_FORMATS          ,
    --r.PLUG_QUERY_TABLE_BORDER            ,
    --r.PLUG_QUERY_HIT_HIGHLIGHTING        ,
    r.PLUG_QUERY_ASC_IMAGE               ascending_image,
    r.PLUG_QUERY_ASC_IMAGE_ATTR          ascending_image_attributes,
    r.PLUG_QUERY_DESC_IMAGE              descending_image,
    r.PLUG_QUERY_DESC_IMAGE_ATTR         descending_image_attributes,
    r.PLUG_QUERY_EXP_FILENAME            filename,
    r.PLUG_QUERY_EXP_SEPARATOR           separator,
    r.PLUG_QUERY_EXP_ENCLOSED_BY         enclosed_by,
    decode(r.PLUG_QUERY_STRIP_HTML,
      'Y','Yes',
      'N','No',
      r.PLUG_QUERY_STRIP_HTML)           strip_html,
    r.PLUG_QUERY_OPTIONS                 report_column_source_type,
    r.PLUG_QUERY_MAX_COLUMNS             max_dynamic_report_cols,
    r.PLUG_COLUMN_WIDTH                  HTML_table_cell_attributes,
    decode(r.PLUG_CUSTOMIZED,
       null,'None',
       '2','Customizable and Not Shown By Default',
       '1','Customizable and Shown By Default',
       '0','Not Customizable By End Users',
       r.PLUG_CUSTOMIZED)                 customization,
    r.PLUG_CUSTOMIZED_NAME                customization_name,
    --r.PLUG_OVERRIDE_REG_POS              ,
    (select case when r.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from wwv_flow_patches
     where id=abs(r.REQUIRED_PATCH) )         build_option,
    r.required_patch                     build_option_id,
    --
    --r.PLUG_URL_TEXT_BEGIN                ,
    --r.PLUG_URL_TEXT_END                  ,
    --
    -- region caching
    --
    nvl(decode(r.PLUG_CACHING,
    'CACHED','Cached',
    'CACHED_BY_USER','Cached by User',
    'NOT_CACHED','Not Cached',
    null,'Not Cached'),'Not Cached')     region_caching,
    --r.PLUG_CACHING_SESSION_STATE         ,
    r.PLUG_CACHING_MAX_AGE_IN_SEC        timeout_cache_after,
    r.PLUG_CACHE_WHEN                    cache_when,
    r.PLUG_CACHE_EXPRESSION1             cache_when_expression_1,
    r.PLUG_CACHE_EXPRESSION2             cache_when_expression_2,
    --r.PLUG_IGNORE_PAGINATION             ,
    --r.PLUG_CHART_FONT_SIZE               ,
    --r.PLUG_CHART_MAX_ROWS                ,
    --r.PLUG_CHART_NUM_MASK                ,
    --r.PLUG_CHART_SCALE                   ,
    --r.PLUG_CHART_AXIS                    ,
    --r.PLUG_CHART_SHOW_SUMMARY            ,
    r.REPORT_TOTAL_TEXT_FORMAT           sum_display_text,
    r.BREAK_COLUMN_TEXT_FORMAT           break_display_text,
    r.BREAK_BEFORE_ROW                   before_break_display_text,
    r.BREAK_GENERIC_COLUMN               break_column_display_text,
    r.BREAK_AFTER_ROW                    after_break_display_text,
    decode(
       r.BREAK_TYPE_FLAG,
       'REPEAT_HEADINGS_ON_BREAK_1','Repeat Headings on Break',
       'DEFAULT_BREAK_FORMATTING','Default Break Formatting',
       r.BREAK_TYPE_FLAG)                break_display_flag,
    r.BREAK_REPEAT_HEADING_FORMAT        repeat_heading_break_format,
    decode(r.CSV_OUTPUT,
    'Y','Yes','N','No',r.CSV_OUTPUT)     enable_csv_output,
    r.CSV_OUTPUT_LINK_TEXT               csv_link_label,
    r.PRINT_URL                          URL,
    r.PRINT_URL_LABEL                    link_label,
    decode(r.TRANSLATE_TITLE,
    'Y','Yes','N','No','Yes')            translate_region_title,
    --
    r.attribute_01,
    r.attribute_02,
    r.attribute_03,
    r.attribute_04,
    r.attribute_05,
    r.attribute_06,
    r.attribute_07,
    r.attribute_08,
    r.attribute_09,
    r.attribute_10,
    r.attribute_11,
    r.attribute_12,
    r.attribute_13,
    r.attribute_14,
    r.attribute_15,
    r.attribute_16,
    r.attribute_17,
    r.attribute_18,
    r.attribute_19,
    r.attribute_20,
    r.attribute_21,
    r.attribute_22,
    r.attribute_23,
    r.attribute_24,
    r.attribute_25,
    --
    r.LAST_UPDATED_BY                    last_updated_by,
    r.LAST_UPDATED_ON                    last_updated_on,
    r.PLUG_COMMENT                       component_comment,
    r.id                                 region_id,
    --
    (select count(*) from wwv_flow_step_items where r.id = ITEM_PLUG_ID and r.flow_id = flow_id and nvl(display_as,'x') != 'BUTTON') items,
    ((select count(*) from wwv_flow_step_items where r.id = ITEM_PLUG_ID and r.flow_id = flow_id and nvl(display_as,'x') = 'BUTTON') +
     (select count(*) from wwv_flow_step_buttons where r.id = button_plug_id and r.flow_id = flow_id)) buttons,
     --
     region_name||'.'||
     lpad(r.plug_display_sequence,5,'00000')
     ||',c='||r.PLUG_DISPLAY_column
     ||',temp='||nvl(decode(nvl(r.PLUG_TEMPLATE,0),0,'No Template',(select PAGE_PLUG_TEMPLATE_NAME from wwv_flow_page_plug_templates where id = r.PLUG_TEMPLATE)),'No Template')
     ||',pos='||decode(r.PLUG_DISPLAY_POINT,
       'AFTER_HEADER',       'After Header',
       'BODY_1',             'Page Template Body (1)',
       'BODY_2',             'Page Template Body (2)',
       'BODY_3',             'Page Template Body (3)',
       'BEFORE_FOOTER',      'Before Footer',
       'REGION_POSITION_01', 'Page Template Region Position 1',
       'REGION_POSITION_02', 'Page Template Region Position 2',
       'REGION_POSITION_03', 'Page Template Region Position 3',
       'REGION_POSITION_04', 'Page Template Region Position 4',
       'REGION_POSITION_05', 'Page Template Region Position 5',
       'REGION_POSITION_06', 'Page Template Region Position 6',
       'REGION_POSITION_07', 'Page Template Region Position 7',
       'REGION_POSITION_08', 'Page Template Region Position 8',
       r.PLUG_DISPLAY_POINT)
     ||',src='||decode(translate(sys.dbms_lob.substr(r.PLUG_SOURCE,1,1),'M0123456789.','000000000000'),'0','Ref',sys.dbms_lob.substr(r.PLUG_SOURCE,30,1)||'.'||sys.dbms_lob.getlength(r.PLUG_SOURCE))
     ||(select ',bo='||PATCH_NAME b from wwv_flow_patches where id=abs(r.REQUIRED_PATCH))
     ||nvl((select ',auth='||name n from wwv_flow_security_schemes where to_char(id) = ltrim(r.PLUG_REQUIRED_ROLE,'!') and flow_id = f.id),r.PLUG_REQUIRED_ROLE)
     ||decode(r.PAGINATION_DISPLAY_POSITION,
      'BOTTOM_LEFT','Bottom-L',
      'BOTTOM_RIGHT','Bottom-R',
      'TOP_LEFT','Top-L',
      'TOP_RIGHT','Top-R',
      'TOP_AND_BOTTOM_LEFT','Top+Bottom-L',
      'TOP_AND_BOTTOM_RIGHT','Top+Bottom-R',
      r.PAGINATION_DISPLAY_POSITION)
      ||r.PLUG_QUERY_NUM_ROWS_TYPE
      ||r.PLUG_DISPLAY_CONDITION_TYPE
      ||substr(r.PLUG_DISPLAY_WHEN_CONDITION,1,20)||'.'||length(r.PLUG_DISPLAY_WHEN_CONDITION)
      ||substr(r.PLUG_DISPLAY_WHEN_COND2,1,20)||'.'||length(r.PLUG_DISPLAY_WHEN_COND2)
      ||decode(
       r.BREAK_TYPE_FLAG,
       'REPEAT_HEADINGS_ON_BREAK_1','RepHead on Br',
       'DEFAULT_BREAK_FORMATTING','DefBreakFor',
       r.BREAK_TYPE_FLAG)
      ||decode(r.CSV_OUTPUT,'Y','Yes','N','No',r.CSV_OUTPUT)
      ||(select ',rtmp='||row_template_name t from wwv_flow_row_templates where id = r.PLUG_QUERY_ROW_TEMPLATE)
      ||decode(r.PLUG_QUERY_NUM_ROWS,null,null,'mr='||r.PLUG_QUERY_NUM_ROWS)
      ||r.BREAK_REPEAT_HEADING_FORMAT
      ||r.CSV_OUTPUT_LINK_TEXT
      ||substr(r.PRINT_URL,1,10)||length(r.PRINT_URL)
      ||length(PRINT_URL_LABEL)
      ||decode(r.TRANSLATE_TITLE,'Y','Yes','N','No','Yes')||
      length(PLUG_HEADER)||length(PLUG_FOOTER)
      ||r.PLUG_CUSTOMIZED
      ||length(r.PLUG_COLUMN_WIDTH)
      ||substr(r.region_name,1,15)
      ||length(REGION_ATTRIBUTES_SUBSTITUTION)
     component_signature,
     decode(rtrim(translate(r.plug_source_type,'01234567890','0000000000'),'0'),null,to_number(r.plug_source_type),null) list_id
from wwv_flow_page_plugs r,
     wwv_flow_steps p,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu
       or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
       or d.sgid              = w.PROVISIONING_COMPANY_ID )
      and f.security_group_id = w.PROVISIONING_COMPANY_ID
      and s.security_group_id = w.PROVISIONING_COMPANY_ID
      and s.schema = f.owner
      and f.security_group_id = p.security_group_id
      and f.id = p.flow_id
      and f.id = r.flow_id
      and p.id = r.page_id
      and (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'))
      and w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_RPT" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"REGION_NAME",
"SOURCE_TYPE",
"BODY_BACKGROUND_COLOR",
"BODY_FONT_COLOR",
"BODY_FONT_FAMILY",
"BODY_FONT_SIZE",
"BODY_FONT_WEIGHT",
"BORDER_COLOR",
"BORDER_WIDTH",
"FORMAT",
"FORMAT_ITEM",
"PAGE_HEADER",
"PAGE_HEADER_ALIGNMENT",
"PAGE_HEADER_FONT_COLOR",
"PAGE_HEADER_FONT_FAMILY",
"PAGE_HEADER_FONT_SIZE",
"PAGE_HEADER_FONT_WEIGHT",
"HEADER_BACKGROUND_COLOR",
"HEADER_FONT_COLOR",
"HEADER_FONT_FAMILY",
"HEADER_FONT_SIZE",
"HEADER_FONT_WEIGHT",
"HEIGHT",
"ORIENTATION",
"OUTPUT",
"PRINT_SERVER_OVERRIDE",
"OUTPUT_FILE_NAME",
"CONTENT_DISPOSITION",
"DOCUMENT_HEADER",
"OUTPUT_LINK_TEXT",
"SHOW_OUTPUT_LINK",
"FOOTER",
"FOOTER_ALIGNMENT",
"FOOTER_FONT_COLOR",
"FOOTER_FONT_FAMILY",
"FOOTER_FONT_SIZE",
"FOOTER_FONT_WEIGHT",
"PAPER_SIZE",
"TEMPLATE_ID",
"PAPER_SIZE_UNITS",
"PAPER_SIZE_WIDTH_UNITS",
"PAPER_SIZE_WIDTH",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"REGION_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                         workspace,
    w.display_name                       workspace_display_name,
    p.flow_id                            application_id,
    f.name                               application_name,
    p.id                                 page_id,
    p.name                               page_name,
    --
    r.plug_name                          region_name,
    decode(r.PLUG_SOURCE_TYPE,
        'SQL_QUERY','Report',
        'STRUCTURED_QUERY','Report',
        'FUNCTION_RETURNING_SQL_QUERY','Report',
        'UPDATABLE_SQL_QUERY','Tabular Form') source_type,
    PRN_BODY_BG_COLOR                         body_background_color,
    PRN_BODY_FONT_COLOR                       body_font_color,
    PRN_BODY_FONT_FAMILY                      body_font_family,
    PRN_BODY_FONT_SIZE                        body_font_size,
    PRN_BODY_FONT_WEIGHT                      body_font_weight,
    PRN_BORDER_COLOR                          border_color,
    PRN_BORDER_WIDTH                          border_width,
    PRN_FORMAT                                format,
    PRN_FORMAT_ITEM                           format_item,
    PRN_PAGE_HEADER                           page_header,
    PRN_PAGE_HEADER_ALIGNMENT                 page_header_alignment,
    PRN_PAGE_HEADER_FONT_COLOR                page_header_font_color,
    PRN_PAGE_HEADER_FONT_FAMILY               page_header_font_family,
    PRN_PAGE_HEADER_FONT_SIZE                 page_header_font_size,
    PRN_PAGE_HEADER_FONT_WEIGHT               page_header_font_weight,
    PRN_HEADER_BG_COLOR                       header_background_color,
    PRN_HEADER_FONT_COLOR                     header_font_color,
    PRN_HEADER_FONT_FAMILY                    header_font_family,
    PRN_HEADER_FONT_SIZE                      header_font_size,
    PRN_HEADER_FONT_WEIGHT                    header_font_weight,
    PRN_HEIGHT                                height,
    PRN_ORIENTATION                           orientation,
    PRN_OUTPUT                                output,
    prn_print_server_overwrite                print_server_override,
    PRN_OUTPUT_FILE_NAME                      output_file_name,
    prn_content_disposition                   content_disposition,
    prn_document_header                       document_header,
    PRN_OUTPUT_LINK_TEXT                      output_link_text,
    PRN_OUTPUT_SHOW_LINK                      show_output_link,
    PRN_PAGE_FOOTER                           footer,
    PRN_PAGE_FOOTER_ALIGNMENT                 footer_alignment,
    PRN_PAGE_FOOTER_FONT_COLOR                footer_font_color,
    PRN_PAGE_FOOTER_FONT_FAMILY               footer_font_family,
    PRN_PAGE_FOOTER_FONT_SIZE                 footer_font_size,
    PRN_PAGE_FOOTER_FONT_WEIGHT               footer_font_weight,
    --
    PRN_PAPER_SIZE                            paper_size,
    PRN_TEMPLATE_ID                           template_id,
    PRN_UNITS                                 paper_size_units,
    prn_width_units                           paper_size_width_units,
    PRN_WIDTH                                 paper_size_width,
    --
    r.LAST_UPDATED_BY                    last_updated_by,
    r.LAST_UPDATED_ON                    last_updated_on,
    r.PLUG_COMMENT                       component_comment,
    r.id                                 region_id,
    --
     region_name||'.'
     ||PRN_BODY_BG_COLOR
     ||PRN_BODY_FONT_COLOR
     ||PRN_BODY_FONT_FAMILY
     ||PRN_BODY_FONT_SIZE
     ||PRN_BODY_FONT_WEIGHT
     ||PRN_BORDER_COLOR
     ||PRN_BORDER_WIDTH
     ||length(PRN_FORMAT)
     ||PRN_FORMAT_ITEM
     ||length(PRN_PAGE_HEADER)
     ||PRN_PAGE_HEADER_ALIGNMENT
     ||PRN_PAGE_HEADER_FONT_COLOR
     ||PRN_PAGE_HEADER_FONT_FAMILY
     ||PRN_PAGE_HEADER_FONT_SIZE
     ||PRN_PAGE_HEADER_FONT_WEIGHT
     ||PRN_HEADER_BG_COLOR
     ||PRN_HEADER_FONT_COLOR
     ||PRN_HEADER_FONT_FAMILY
     ||PRN_HEADER_FONT_SIZE
     ||PRN_HEADER_FONT_WEIGHT
     ||PRN_HEIGHT
     ||PRN_ORIENTATION
     ||PRN_OUTPUT
     ||PRN_OUTPUT_FILE_NAME
     ||PRN_CONTENT_DISPOSITION
     ||PRN_DOCUMENT_HEADER
     ||PRN_UNITS
     ||PRN_OUTPUT_LINK_TEXT
     ||PRN_OUTPUT_SHOW_LINK
     ||length(PRN_PAGE_FOOTER)
     ||PRN_PAGE_FOOTER_ALIGNMENT
     ||PRN_PAGE_FOOTER_FONT_COLOR
     ||PRN_PAGE_FOOTER_FONT_FAMILY
     ||PRN_PAGE_FOOTER_FONT_SIZE
     ||PRN_PAGE_FOOTER_FONT_WEIGHT
     ||PRN_PAPER_SIZE
     ||PRN_TEMPLATE_ID
     ||PRN_UNITS
     ||PRN_WIDTH
     component_signature
from wwv_flow_page_plugs r,
     wwv_flow_steps p,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu
       or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
       or d.sgid              = w.PROVISIONING_COMPANY_ID )
      and f.security_group_id = w.PROVISIONING_COMPANY_ID
      and s.security_group_id = w.PROVISIONING_COMPANY_ID
      and s.schema = f.owner
      and f.security_group_id = p.security_group_id
      and f.id = p.flow_id
      and f.id = r.flow_id
      and p.id = r.page_id
      and (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'))
      and w.PROVISIONING_COMPANY_ID != 0
      and r.PLUG_SOURCE_TYPE in ('SQL_QUERY','STRUCTURED_QUERY','FUNCTION_RETURNING_SQL_QUERY','UPDATABLE_SQL_QUERY');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_RPT_COLS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"REGION_NAME",
"COLUMN_ALIAS",
"DISPLAY_AS",
"DISPLAY_AS_CODE",
"DISPLAY_SEQUENCE",
"HEADING",
"USE_AS_ROW_HEADER",
"FORMAT_MASK",
"HTML_EXPRESSION",
"CSS_CLASS",
"CSS_STYLE",
"HIGHLIGHT_WORDS",
"COLUMN_LINK_URL",
"COLUMN_LINK_TEXT",
"COLUMN_LINK_ATTRIBUTES",
"PAGE_CHECKSUM",
"COLUMN_ALIGNMENT",
"HEADING_ALIGNMENT",
"DEFAULT_SORT_SEQUENCE",
"DEFAULT_SORT_DIRECTION",
"SORTABLE_COLUMN",
"SUM_COLUMN",
"COLUMN_IS_HIDDEN",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"NAMED_LIST_OF_VALUES",
"INLINE_LIST_OF_VALUES",
"LOV_SHOW_NULLS",
"LOV_DISPLAY_EXTRA_VALUES",
"LOV_NULL_TEXT",
"LOV_NULL_VALUE",
"FORM_ELEMENT_WIDTH",
"FORM_ELEMENT_HEIGHT",
"FORM_ELEMENT_CSS_CLASSES",
"FORM_ELEMENT_ATTRIBUTES",
"FORM_ELEMENT_OPTION_ATTRIBUTES",
"COLUMN_FIELD_TEMPLATE",
"COLUMN_FIELD_TEMPLATE_ID",
"IS_REQUIRED",
"STANDARD_VALIDATIONS",
"ATTRIBUTE_01",
"ATTRIBUTE_02",
"ATTRIBUTE_03",
"ATTRIBUTE_04",
"ATTRIBUTE_05",
"ATTRIBUTE_06",
"ATTRIBUTE_07",
"ATTRIBUTE_08",
"ATTRIBUTE_09",
"ATTRIBUTE_10",
"ATTRIBUTE_11",
"ATTRIBUTE_12",
"ATTRIBUTE_13",
"ATTRIBUTE_14",
"ATTRIBUTE_15",
"PRIMARY_KEY_COLUMN_SOURCE_TYPE",
"PRIMARY_KEY_COLUMN_SOURCE",
"DERIVED_COLUMN",
"COLUMN_DEFAULT",
"COLUMN_DEFAULT_TYPE",
"REFERENCE_SCHEMA",
"REFERENCE_TABLE_NAME",
"REFERENCE_COLUMN_NAME",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"INCLUDE_IN_EXPORT",
"PRINT_COLUMN_WIDTH",
"PRINT_COLUMN_ALIGNMENT",
"REPORT_COLUMN_WIDTH",
"COLUMN_COMMENT",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"REGION_ID",
"REGION_REPORT_COLUMN_ID",
"COMPONENT_SIGNATURE") AS
  select
     w.short_name                          workspace,
     w.display_name                        workspace_display_name,
     p.flow_id                             application_id,
     f.name                                application_name,
     p.id                                  page_id,
     p.name                                page_name,
     region.plug_Name                      region_name,
     --
     --r.QUERY_COLUMN_ID                     ,
     --r.FORM_ELEMENT_ID                     ,
     r.COLUMN_ALIAS                        column_alias,
     case substr(r.display_as, 1, 7)
       when 'NATIVE_' then
           ( select display_name from wwv_flow_plugins where flow_id = 4411 and plugin_type = 'REPORT COLUMN TYPE' and name = substr(r.display_as, 8) )
       when 'PLUGIN_' then
           ( select display_name from wwv_flow_plugins where flow_id = p.flow_id and plugin_type = 'REPORT COLUMN TYPE' and name = substr(r.display_as, 8) )
       else
           case r.display_as
             when 'WITHOUT_MODIFICATION'   then 'Standard Report Column'
             when 'TEXT_FROM_LOV'          then 'Display as Text (based on LOV, does not save state)'
             when 'DISPLAY_AND_SAVE'       then 'Display as Text (saves state)'
             when 'ESCAPE_SC'              then 'Display as Text (escape special characters, does not save state)'
             when 'DATE_POPUP'             then 'Date Picker'
             when 'TEXT'                   then 'Text Field'
             when 'TEXTAREA'               then 'Text Area'
             when 'SELECT_LIST'            then 'Select List (static LOV)'
             when 'SELECT_LIST_FROM_LOV'   then 'Select List (named LOV)'
             when 'SELECT_LIST_FROM_QUERY' then 'Select List (query based LOV)'
             when 'HIDDEN'                 then 'Hidden'
             when 'POPUP'                  then 'Popup LOV (named LOV)'
             when 'POPUP_QUERY'            then 'Popup LOV (query based LOV)'
             else r.display_as
         end
     end                                   display_as,
     r.display_as                          display_as_code,
     r.COLUMN_DISPLAY_SEQUENCE             display_sequence,
     r.COLUMN_HEADING                      heading,
     r.USE_AS_ROW_HEADER                   use_as_row_header,
     r.COLUMN_FORMAT                       format_mask,
     r.COLUMN_HTML_EXPRESSION              html_expression,
     r.COLUMN_CSS_CLASS                    css_class,
     r.COLUMN_CSS_STYLE                    css_style,
     r.COLUMN_HIT_HIGHLIGHT                highlight_words,
     --
     r.COLUMN_LINK                         column_link_url,
     r.COLUMN_LINKTEXT                     column_link_text,
     r.COLUMN_LINK_ATTR                    column_link_attributes,
     --
     r.COLUMN_LINK_CHECKSUM_TYPE           page_checksum,
     --
     r.COLUMN_ALIGNMENT                    column_alignment,
     r.HEADING_ALIGNMENT                   heading_alignment,
     --
     r.DEFAULT_SORT_COLUMN_SEQUENCE        default_sort_sequence,
     r.DEFAULT_SORT_DIR                    default_sort_direction,
     decode(r.DISABLE_SORT_COLUMN,
       'Y','Yes','N','No',
       r.DISABLE_SORT_COLUMN)              sortable_column,
     decode(r.SUM_COLUMN,
       'Y','Yes','N','No',
       r.SUM_COLUMN)                       sum_column,
     decode(r.HIDDEN_COLUMN ,
       'Y','Yes','N','No',
       r.HIDDEN_COLUMN )                   column_is_hidden,
     --
     r.DISPLAY_WHEN_COND_TYPE              condition_type,
     r.display_when_cond_type              condition_type_code,
     r.DISPLAY_WHEN_CONDITION              condition_expression1,
     r.DISPLAY_WHEN_CONDITION2             condition_expression2,
     --
     decode((select lov_name
      from wwv_flow_lists_of_values$
      where id = r.NAMED_LOV),null,null,
      (select lov_name
      from wwv_flow_lists_of_values$
      where id = r.NAMED_LOV))             named_list_of_values,
     r.INLINE_LOV                          inline_list_of_values,
     decode(r.LOV_SHOW_NULLS,
       'YES','Yes','NO','No',
       r.LOV_SHOW_NULLS)                   LOV_SHOW_NULLS,
     decode(r.LOV_DISPLAY_EXTRA,
       'YES','Yes','NO','No',
       r.LOV_DISPLAY_EXTRA)                LOV_DISPLAY_EXTRA_VALUES,
     r.LOV_NULL_TEXT                       lov_null_text,
     r.LOV_NULL_VALUE                      lov_null_value,
     --
     r.COLUMN_WIDTH                        form_element_width,
     r.COLUMN_HEIGHT                       form_element_height,
     r.css_classes                         form_element_css_classes,
     r.CATTRIBUTES                         form_Element_Attributes,
     r.CATTRIBUTES_ELEMENT                 form_Element_Option_Attributes,
     (select template_name
      from   wwv_flow_field_templates
      where  id = to_char(r.COLUMN_FIELD_TEMPLATE)
      and    flow_id = f.id)               column_field_template,
     r.COLUMN_FIELD_TEMPLATE               column_field_template_id,
     case
       when r.is_required = 'Y' then 'Yes'
       else 'No'
     end                                   is_required,
     nvl(r.standard_validations, 'Application Level Setting') standard_validations,
     --
     r.attribute_01,
     r.attribute_02,
     r.attribute_03,
     r.attribute_04,
     r.attribute_05,
     r.attribute_06,
     r.attribute_07,
     r.attribute_08,
     r.attribute_09,
     r.attribute_10,
     r.attribute_11,
     r.attribute_12,
     r.attribute_13,
     r.attribute_14,
     r.attribute_15,
     --
     --r.COLUMN_COMMENT                      ,
     r.PK_COL_SOURCE_TYPE                  primary_key_column_source_type,
     r.PK_COL_SOURCE                       primary_key_column_source,
     decode(r.DERIVED_COLUMN,
       'Y','Yes',
        r.DERIVED_COLUMN)                  derived_column,
     --
     r.COLUMN_DEFAULT                      column_default,
     r.COLUMN_DEFAULT_TYPE                 column_default_type,
     --
     r.REF_SCHEMA                          reference_schema,
     r.REF_TABLE_NAME                      reference_table_name,
     r.REF_COLUMN_NAME                     reference_column_name,
     --
     decode(substr(r.REPORT_COLUMN_REQUIRED_ROLE,1,1),'!','Not ')||
     nvl((select name
     from   wwv_flow_security_schemes
     where  to_char(id) = ltrim(r.REPORT_COLUMN_REQUIRED_ROLE,'!')
     and    flow_id = f.id),
            r.REPORT_COLUMN_REQUIRED_ROLE)
                                           authorization_scheme,
     r.REPORT_COLUMN_REQUIRED_ROLE         authorization_scheme_id,
     --
     decode(include_in_export,'Y','Yes','N','No') include_in_export,
     print_col_width                       print_column_width,
     print_col_align                       print_column_alignment,
     report_column_width                   report_column_width,
     COLUMN_COMMENT                        column_comment,
     --
     r.LAST_UPDATED_BY                     last_updated_by,
     r.LAST_UPDATED_ON                     last_updated_on,
     --
     region.id                             region_id,
     r.id                                  region_report_column_id,
     --
     substr(r.COLUMN_ALIAS,1,30)
     ||' s='||r.COLUMN_DISPLAY_SEQUENCE
     ||' h='||substr(r.COLUMN_HEADING,1,15)||length(r.COLUMN_HEADING)
     ||substr(r.COLUMN_FORMAT,1,15)||length(r.COLUMN_FORMAT)
     ||' e='||substr(r.COLUMN_HTML_EXPRESSION,1,15)||length(r.COLUMN_HTML_EXPRESSION)
     ||substr(r.COLUMN_CSS_CLASS,1,20)
     ||substr(r.COLUMN_CSS_STYLE,1,20)
     ||substr(r.COLUMN_HIT_HIGHLIGHT,1,15)||length(r.COLUMN_HIT_HIGHLIGHT)
     ||' l='||substr(r.COLUMN_LINK,1,20)||length(r.COLUMN_LINK)
     ||substr(r.COLUMN_LINKTEXT,1,15)||length(r.COLUMN_LINKTEXT)
     ||substr(r.COLUMN_LINK_ATTR,1,15)||length(r.COLUMN_LINK_ATTR)
     ||substr(r.COLUMN_LINK_CHECKSUM_TYPE,1,15)
     ||' a='||substr(r.COLUMN_ALIGNMENT,1,6)||substr(r.HEADING_ALIGNMENT,1,6)
     ||' s='||DEFAULT_SORT_COLUMN_SEQUENCE
     ||substr(DEFAULT_SORT_DIR,1,6)
     ||substr(r.DISABLE_SORT_COLUMN,1,10)
     ||substr(r.SUM_COLUMN,1,10)
     ||substr(r.HIDDEN_COLUMN,1,15)
     ||' c='||substr(r.DISPLAY_WHEN_COND_TYPE,1,20)
      ||substr(r.DISPLAY_WHEN_CONDITION,1,15)||length(r.DISPLAY_WHEN_CONDITION)
     ||substr(r.DISPLAY_WHEN_CONDITION2,1,15)||length(r.DISPLAY_WHEN_CONDITION2)
     ||' a='||substr(decode(substr(r.REPORT_COLUMN_REQUIRED_ROLE,1,1),'!','Not ')||
     nvl((select name
     from   wwv_flow_security_schemes
     where  to_char(id) = ltrim(r.REPORT_COLUMN_REQUIRED_ROLE,'!')
     and    flow_id = f.id),
            r.REPORT_COLUMN_REQUIRED_ROLE),1,30)
     ||' d='||substr(r.DISPLAY_AS,1,20)
     ||' l='||substr(decode((select lov_name
      from wwv_flow_lists_of_values$
      where id = r.NAMED_LOV),null,null,
      (select lov_name
      from wwv_flow_lists_of_values$
      where id = r.NAMED_LOV)),1,30)
     ||substr(r.INLINE_LOV,1,30)||substr(r.LOV_SHOW_NULLS,1,20)||substr(r.LOV_DISPLAY_EXTRA,1,6)||substr(r.LOV_NULL_VALUE,1,20)||r.COLUMN_WIDTH||r.COLUMN_HEIGHT
     ||' c='||substr(r.CATTRIBUTES,1,20)||length(r.CATTRIBUTES)
     ||' c='||substr(r.CATTRIBUTES_ELEMENT,1,20)||length(r.CATTRIBUTES_ELEMENT)
     ||' pk='||r.PK_COL_SOURCE_TYPE||sys.dbms_lob.substr(r.PK_COL_SOURCE,20,1)||sys.dbms_lob.getlength(r.PK_COL_SOURCE)
     ||' d='||substr(r.DERIVED_COLUMN,1,6)
     ||' d='||substr(r.COLUMN_DEFAULT,1,20)||length(r.COLUMN_DEFAULT)
     ||' t='||r.COLUMN_DEFAULT_TYPE||include_in_export||print_col_width||print_col_align
     component_signature
from WWV_FLOW_REGION_REPORT_COLUMN r,
     wwv_flow_steps p,
     wwv_flow_page_plugs region,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
             (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu
       or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
       or d.sgid              = w.PROVISIONING_COMPANY_ID )
      and f.security_group_id = w.PROVISIONING_COMPANY_ID
      and s.security_group_id = w.PROVISIONING_COMPANY_ID
      and s.schema = f.owner
      and f.security_group_id = p.security_group_id
      and f.security_group_id = r.security_group_id
      and f.id = p.flow_id
      and f.id = region.flow_id
      and p.id = region.page_id
      and region.id = r.region_id
      and (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'))
      and w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_PROC" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"PROCESS_NAME",
"EXECUTION_SEQUENCE",
"PROCESS_POINT",
"PROCESS_POINT_CODE",
"REGION_ID",
"REGION_NAME",
"PROCESS_TYPE",
"PROCESS_TYPE_CODE",
"RUNTIME_WHERE_CLAUSE",
"PROCESS_SOURCE",
"ATTRIBUTE_01",
"ATTRIBUTE_02",
"ATTRIBUTE_03",
"ATTRIBUTE_04",
"ATTRIBUTE_05",
"ATTRIBUTE_06",
"ATTRIBUTE_07",
"ATTRIBUTE_08",
"ATTRIBUTE_09",
"ATTRIBUTE_10",
"ATTRIBUTE_11",
"ATTRIBUTE_12",
"ATTRIBUTE_13",
"ATTRIBUTE_14",
"ATTRIBUTE_15",
"PROCESS_ERROR_MESSAGE",
"ERROR_DISPLAY_LOCATION",
"WHEN_BUTTON_PRESSED",
"WHEN_BUTTON_PRESSED_ID",
"ONLY_FOR_CHANGED_ROWS",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"EXEC_COND_FOR_EACH_ROW",
"RUN_PROCESS",
"RETURN_KEY_INTO_ITEM_1",
"RETURN_KEY_INTO_ITEM_2",
"SUCCESS_MESSAGE",
"BUILD_OPTION",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"PROCESS_ID",
"COMPONENT_SIGNATURE") AS
  select
     w.short_name                   workspace,
     w.display_name                 workspace_display_name,
     p.flow_id                      application_id,
     f.name                         application_name,
     p.id                           page_id,
     p.name                         page_name,
     --
     pr.process_name                process_name,
     pr.process_sequence            execution_sequence,
     --
     decode(pr.process_point,
       'RETURN_VALUE','DISPLAY_VALUE',
       'AFTER_AUTHENTICATION','On New Instance After Authentication',
       'BEFORE_HEADER','On Load - Before Header',
       'AFTER_HEADER','On Load - After Header',
       'BEFORE_BOX_BODY','On Load - Before Regions',
       'AFTER_BOX_BODY','On Load - After Regions',
       'BEFORE_FOOTER','On Load - Before Footer',
       'AFTER_FOOTER','On Load - After Footer',
       'ON_SUBMIT_BEFORE_COMPUTATION','On Submit - Before Computations and Validations ',
       'AFTER_SUBMIT','On Submit - After Computations and Validations',
       'ON_DEMAND','On Demand - Run this process when requested by AJAX',
       'AFTER_ERROR_HEADER','On Error - After Header',
       'BEFORE_ERROR_FOOTER','On Error - Before Footer',
       pr.process_point)            process_point,
     pr.process_point               process_point_code,
     pr.region_id,
     ( select plug_name
         from wwv_flow_page_plugs
        where id = pr.region_id )   region_name,
     --
     case substr(pr.process_type, 1, 7)
       when 'NATIVE_' then
           ( select display_name from wwv_flow_plugins where flow_id = 4411 and plugin_type = 'PROCESS TYPE' and name = substr(pr.process_type, 8) )
       when 'PLUGIN_' then
           ( select display_name from wwv_flow_plugins where flow_id = p.flow_id and plugin_type = 'PROCESS TYPE' and name = substr(pr.process_type, 8) )
       else
           decode(pr.process_type,
               'RETURN_VALUE','DISPLAY_VALUE',
               'GET_NEXT_OR_PREV_PK','Get Next or Previous Primary Key Value',
               'INITIALIZE_PAGINATION_FOR_ALL_PAGES','Reset Pagination For All Pages',
               'INITIALIZE_PAGE_PAGINATION','Reset Pagination For Page(s) (PageID,PageID,PageID)',
               'CLEAR_CACHE_CURRENT_FLOW','Clear Cache For Current Application (removes all session state for current application)',
               'CLEAR_CACHE_FOR_FLOWS','Clear Cache For Applications (removes all session state for listed applications)',
               'ADD_ROWS_TO_TABULAR_FORM','Add rows to tabular form',
               'WEB_SERVICE','Web Service',
               'CLOSE_WINDOW','Close popup window',
               'PLSQL','PL/SQL anonymous block',
               'PLSQL_DBMS_JOB','PL/SQL DBMS JOB (runs anonymous block asynchronously)',
               'RESET_PAGINATION','Reset Pagination',
               'CLEAR_CACHE_FOR_PAGES','Clear Cache for all Items on Pages (PageID,PageID,PageID)',
               'CLEAR_CACHE_FOR_ITEMS','Clear Cache for Items (ITEM,ITEM,ITEM)',
               'DML_FETCH_ROW','Automated Row Fetch',
               'DML_PROCESS_ROW','Automatic Row Processing (DML)',
               'SET_PREFERENCE_TO_ITEM_VALUE','Set Preference to value of Item',
               'SET_PREFERENCE_TO_ITEM_VALUE_IF_ITEM_NOT_NULL','Set Preference to value of Item if item is not null (PreferenceName:ITEM)',
               'MULTI_ROW_UPDATE','Multi Row Update',
               'RESET_SESSION_STATE','Clear Cache For Current Session (removes all state for current session)',
               'RESET_USER_PREFERENCES','Reset Preferences (remove all preferences for current user)',
               'INITIALIZE_ALL_PAGE_ITEMS','Initialize all page items',
               'ON_DEMAND','On Demand - Run an on-demand application process',
               'MULTI_ROW_DELETE','Multi Row Delete',
               pr.process_type)
     end                          process_type,
     pr.process_type              process_type_code,
     --pr.ITEM_NAME,
     case
       when pr.process_type = 'GET_NEXT_OR_PREV_PK' /* stores the where clause in PROCESS_SOURCE instead of RUNTIME_WHERE_CLAUSE */
        and instr(pr.process_sql_clob, ':', 1, 13) > 0
       then
           replace(to_char(substr(pr.process_sql_clob, instr(pr.process_sql_clob, ':', 1, 13)+1, 4000)), '<cbchoesc>', ':')
       else
           pr.runtime_where_clause
     end                          runtime_where_clause,
     pr.process_sql_clob          process_source,
     pr.attribute_01,
     pr.attribute_02,
     pr.attribute_03,
     pr.attribute_04,
     pr.attribute_05,
     pr.attribute_06,
     pr.attribute_07,
     pr.attribute_08,
     pr.attribute_09,
     pr.attribute_10,
     pr.attribute_11,
     pr.attribute_12,
     pr.attribute_13,
     pr.attribute_14,
     pr.attribute_15,
     pr.process_error_message       process_error_message,
     pr.error_display_location      error_display_location,
     --
     (select button_name
      from wwv_flow_step_buttons
      where id = pr.process_when_button_id
      union
      select name
      from wwv_flow_step_items
      where id = pr.process_when_button_id)
                                    when_button_pressed,
     pr.process_when_button_id      when_button_pressed_id,
     case nvl(pr.only_for_changed_rows, 'Y')
       when 'Y' then 'Yes'
       when 'N' then 'No'
     end                            only_for_changed_rows,
     --
     nvl((select r from apex_standard_conditions where d = pr.process_when_type),pr.process_when_type)
                                    condition_type,
     pr.process_when_type           condition_type_code,
     pr.process_when                condition_expression1,
     pr.process_when2               condition_expression2,
     case nvl(pr.exec_cond_for_each_row, 'N')
       when 'Y' then 'Yes'
       when 'N' then 'No'
     end                            exec_cond_for_each_row,
     --pr.PROCESS_WHEN_TYPE2,
     --
     decode(pr.process_is_stateful_y_n,
       'Y','Once Per Session or When Reset',
       'N','Once Per Page Visit (default)',
       pr.PROCESS_IS_STATEFUL_Y_N)  run_process,
     --
     pr.return_key_into_item1       return_key_into_item_1,
     pr.return_key_into_item2       return_key_into_item_2,
     pr.process_success_message     success_message,
     --
     (select case when pr.required_patch > 0 then patch_name else '{Not '||patch_name||'}' end patch_name
     from wwv_flow_patches
     where id=abs(pr.required_patch))    build_option,
     --
     decode(substr(pr.security_scheme,1,1),'!','Not ')||
     nvl((select name
      from   wwv_flow_security_schemes
      where  to_char(id) = ltrim(pr.security_scheme,'!')
      and    flow_id = f.id),
      pr.security_scheme)           authorization_scheme,
     pr.security_scheme             authorization_scheme_id,
     --
     pr.last_updated_by             last_updated_by,
     pr.last_updated_on             last_updated_on,
     pr.process_comment             component_comment,
     pr.id                          process_id,
     --
     lpad(pr.PROCESS_SEQUENCE,5,'00000')
     ||',point='||decode(pr.PROCESS_POINT,
       'RETURN_VALUE','DISPLAY_VALUE',
       'AFTER_AUTHENTICATION','On New Instance After Authentication',
       'BEFORE_HEADER','On Load - Before Header',
       'AFTER_HEADER','On Load - After Header',
       'BEFORE_BOX_BODY','On Load - Before Regions',
       'AFTER_BOX_BODY','On Load - After Regions',
       'BEFORE_FOOTER','On Load - Before Footer',
       'AFTER_FOOTER','On Load - After Footer',
       'ON_SUBMIT_BEFORE_COMPUTATION','On Submit - Before Computations and Validations ',
       'AFTER_SUBMIT','On Submit - After Computations and Validations',
       'ON_DEMAND','On Demand - Run this process when requested by AJAX',
       'AFTER_ERROR_HEADER','On Error - After Header',
       'BEFORE_ERROR_FOOTER','On Error - Before Footer',
       pr.PROCESS_POINT)
     ||',type='||decode(pr.PROCESS_TYPE,
       'RETURN_VALUE','DISPLAY_VALUE',
       'GET_NEXT_OR_PREV_PK','Get Next or Previous Primary Key Value',
       'INITIALIZE_PAGINATION_FOR_ALL_PAGES','Reset Pagination For All Pages',
       'INITIALIZE_PAGE_PAGINATION','Reset Pagination For Page(s) (PageID,PageID,PageID)',
       'CLEAR_CACHE_CURRENT_FLOW','Clear Cache For Current Application (removes all session state for current application)',
       'CLEAR_CACHE_FOR_FLOWS','Clear Cache For Applications (removes all session state for listed applications)',
       'ADD_ROWS_TO_TABULAR_FORM','Add rows to tabular form',
       'WEB_SERVICE','Web Service',
       'CLOSE_WINDOW','Close popup window',
       'PLSQL','PL/SQL anonymous block',
       'PLSQL_DBMS_JOB','PL/SQL DBMS JOB (runs anonymous block asynchronously)',
       'RESET_PAGINATION','Reset Pagination',
       'CLEAR_CACHE_FOR_PAGES','Clear Cache for all Items on Pages (PageID,PageID,PageID)',
       'CLEAR_CACHE_FOR_ITEMS','Clear Cache for Items (ITEM,ITEM,ITEM)',
       'DML_FETCH_ROW','Automated Row Fetch',
       'DML_PROCESS_ROW','Automatic Row Processing (DML)',
       'SET_PREFERENCE_TO_ITEM_VALUE','Set Preference to value of Item',
       'SET_PREFERENCE_TO_ITEM_VALUE_IF_ITEM_NOT_NULL','Set Preference to value of Item if item is not null (PreferenceName:ITEM)',
       'MULTI_ROW_UPDATE','Multi Row Update',
       'RESET_SESSION_STATE','Clear Cache For Current Session (removes all state for current session)',
       'RESET_USER_PREFERENCES','Reset Preferences (remove all preferences for current user)',
       'INITIALIZE_ALL_PAGE_ITEMS','Initialize all page items',
       'ON_DEMAND','On Demand - Run an on-demand application process',
       'MULTI_ROW_DELETE','Multi Row Delete',
       pr.PROCESS_TYPE)
       ||',src='||sys.dbms_lob.substr(pr.PROCESS_SQL_CLOB,30,1)||'.'||
       sys.dbms_lob.getlength(pr.PROCESS_SQL_CLOB)
       ||(select ',wbp='||button_name n from wwv_flow_step_buttons where id = pr.PROCESS_WHEN_BUTTON_ID
       union
       select ',wbp='||name n from wwv_flow_step_items where id = pr.PROCESS_WHEN_BUTTON_ID)
       ||decode(pr.PROCESS_ERROR_MESSAGE,null,null,',errm='||
       substr(pr.PROCESS_ERROR_MESSAGE,1,20)||length(pr.PROCESS_ERROR_MESSAGE))
       ||decode(pr.PROCESS_SUCCESS_MESSAGE,null,null,',succm='||
       substr(pr.PROCESS_SUCCESS_MESSAGE,1,20)||length(pr.PROCESS_SUCCESS_MESSAGE))
       ||nvl((select name from wwv_flow_security_schemes where to_char(id) = ltrim(pr.SECURITY_SCHEME,'!') and flow_id = f.id),pr.SECURITY_SCHEME)
       ||',cond='||pr.PROCESS_WHEN_TYPE
       ||substr(pr.PROCESS_WHEN,1,20)||length(pr.PROCESS_WHEN)||'.'
       ||substr(pr.PROCESS_WHEN2,1,20)||length(pr.PROCESS_WHEN2)
       ||(select PATCH_NAME from wwv_flow_patches where id=abs(pr.REQUIRED_PATCH))
       ||decode(pr.PROCESS_IS_STATEFUL_Y_N,'Y','Once Per Session or When Reset','N','Once Per Page Visit (default)',pr.PROCESS_IS_STATEFUL_Y_N)
     ||',key='||pr.RETURN_KEY_INTO_ITEM1||pr.RETURN_KEY_INTO_ITEM1
     component_signature
from wwv_flow_step_processing pr,
     wwv_flow_steps p,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu
       or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
       or d.sgid              = w.PROVISIONING_COMPANY_ID )
      and f.security_group_id = w.PROVISIONING_COMPANY_ID
      and s.security_group_id = w.PROVISIONING_COMPANY_ID
      and s.schema = f.owner
      and f.security_group_id = p.security_group_id
      and f.security_group_id = pr.security_group_id
      and f.id = p.flow_id
      and f.id = pr.flow_id
      and p.id = pr.flow_step_id
      and (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'))
      and w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_COMP" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"ITEM_NAME",
"EXECUTION_SEQUENCE",
"COMPUTATION_POINT",
"COMPUTATION_TYPE",
"COMPUTATION",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"ERROR_MESSAGE",
"BUILD_OPTION",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"COMPONENT_SIGNATURE",
"COMPUTATION_ID") AS
  select
     w.short_name                   workspace,
     w.display_name                 workspace_display_name,
     p.flow_id                      application_id,
     f.name                         application_name,
     p.id                           page_id,
     p.name                         page_name,
     --
     c.COMPUTATION_ITEM             item_name,
     c.COMPUTATION_SEQUENCE         execution_sequence,
     --
     decode(c.COMPUTATION_POINT,
       'ON_NEW_INSTANCE','On New Instance (e.g. On Login)',
       'BEFORE_HEADER','Before Header',
       'AFTER_HEADER','After Header',
       'BEFORE_BOX_BODY','Before Region(s)',
       'AFTER_BOX_BODY','After Region(s)',
       'BEFORE_FOOTER','Before Footer',
       'AFTER_FOOTER','After Footer',
       'AFTER_SUBMIT','After Submit',
       c.COMPUTATION_POINT)         computation_point,
     --
     decode(c.COMPUTATION_TYPE,
        'STATIC_ASSIGNMENT','Static Assignment',
        'FUNCTION_BODY','PL/SQL Function Body',
        'QUERY','SQL Query (return single value)',
        'QUERY_COLON','SQL Query (return colon separated value)',
        'SQL_EXPRESSION','SQL Expression',
        'PLSQL_EXPRESSION','PL/SQL Expression',
        'ITEM_VALUE','Item Value',
        c.COMPUTATION_TYPE)         computation_type,
     --c.COMPUTATION_PROCESSED        computation_processed,
     c.COMPUTATION                  computation,
     --
     decode(c.COMPUTE_WHEN_TYPE,'%'||'null%',null,
     nvl((select r from apex_standard_conditions where d = c.COMPUTE_WHEN_TYPE),c.COMPUTE_WHEN_TYPE))
                                    condition_type,
     c.compute_when_type            condition_type_code,
     c.COMPUTE_WHEN                 condition_expression1,
     c.COMPUTE_WHEN_TEXT            condition_expression2,
     c.COMPUTATION_ERROR_MESSAGE    error_message,
     (select case when c.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from wwv_flow_patches
     where id= abs(c.REQUIRED_PATCH))    build_option,
     --
     decode(substr(c.SECURITY_SCHEME,1,1),'!','Not ')||
     nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id) = ltrim(c.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     c.SECURITY_SCHEME)             authorization_scheme,
     c.SECURITY_SCHEME              authorization_scheme_id,
     c.LAST_UPDATED_BY              last_updated_by,
     c.LAST_UPDATED_ON              last_updated_on,
     c.COMPUTATION_COMMENT          component_comment,
     --
     c.COMPUTATION_ITEM
     ||c.COMPUTATION_SEQUENCE
     ||c.COMPUTATION_POINT
     ||c.COMPUTATION_TYPE
     ||length(c.COMPUTATION)
     ||c.COMPUTE_WHEN_TYPE
     ||length(c.COMPUTE_WHEN)||length(c.COMPUTE_WHEN_TEXT)
     ||length(c.COMPUTATION_ERROR_MESSAGE)
     ||(select case when c.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from wwv_flow_patches
     where id= abs(c.REQUIRED_PATCH))
     ||decode(substr(c.SECURITY_SCHEME,1,1),'!','Not ')||
     nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id) = ltrim(c.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     c.SECURITY_SCHEME)             component_signature,
     --
     c.id                           computation_id
from wwv_flow_step_computations c,
     wwv_flow_steps p,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = p.security_group_id and
      f.security_group_id = c.security_group_id and
      f.id = p.flow_id and
      f.id = c.flow_id and
      p.id = c.flow_step_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_BRANCHES" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"BRANCH_NAME",
"BRANCH_ACTION",
"BRANCH_POINT",
"WHEN_BUTTON_PRESSED",
"BRANCH_TYPE",
"PROCESS_SEQUENCE",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"SAVE_STATE_BEFORE_BRANCH",
"BUILD_OPTION",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"BRANCH_ID",
"BRANCH_WHEN_BUTTON_ID",
"COMPONENT_SIGNATURE") AS
  select
     w.short_name                   workspace,
     w.display_name                 workspace_display_name,
     p.flow_id                      application_id,
     f.name                         application_name,
     p.id                           page_id,
     p.name                         page_name,
     --
     b.branch_name                  branch_name,
     b.BRANCH_ACTION                branch_action,
     b.BRANCH_POINT                 branch_point,
     decode(b.BRANCH_WHEN_BUTTON_ID,
     null,null,(select button_name
      from wwv_flow_step_buttons
      where id = b.BRANCH_WHEN_BUTTON_ID
      union
      select name
      from wwv_flow_step_items
      where id = b.BRANCH_WHEN_BUTTON_ID))
                                    when_button_pressed,
     decode(b.BRANCH_TYPE,
       'BRANCH_TO_FUNCTION_RETURNING_PAGE','Branch to Function Returning a Page',
       'BRANCH_TO_FUNCTION_RETURNING_URL', 'Branch to Function Returning a URL',
       'BRANCH_TO_PAGE_IDENT_BY_ITEM',     'Branch to Page Identified by Item (Use Item Name)',
       'BRANCH_TO_PAGE_ACCEPT',            'Branch to Page Accept Processing (not common)',
       'BRANCH_TO_STEP',                   'Branch to Page',
       'BRANCH_TO_URL_IDENT_BY_ITEM',      'Branch to URL Identified by Item (Use Item Name)',
       'PLSQL',                            'Branch to PL/SQL Procedure',
       'REDIRECT_URL',                     'Branch to Page or URL',
       b.BRANCH_TYPE)               branch_type,
     b.BRANCH_SEQUENCE              process_sequence,
     --b.CLEAR_PAGE_CACHE,
     nvl((select r from apex_standard_conditions where d = b.BRANCH_CONDITION_TYPE),b.BRANCH_CONDITION_TYPE)
                                    condition_type,
     b.branch_condition_type        condition_type_code,
     b.BRANCH_CONDITION             condition_expression1,
     b.BRANCH_CONDITION_TEXT        condition_expression2,
     decode(nvl(b.save_state_before_branch_yn,'N'),'N','No','Yes')  save_state_before_branch,
     (select case when b.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from wwv_flow_patches
     where id=  abs(b.REQUIRED_PATCH))   build_option,
     --
     decode(substr(b.SECURITY_SCHEME,1,1),'!','Not ')||
     nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id) = ltrim(b.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     b.SECURITY_SCHEME)             authorization_scheme,
     b.SECURITY_SCHEME              authorization_scheme_id,
     b.LAST_UPDATED_BY              last_updated_by,
     b.LAST_UPDATED_ON              last_updated_on,
     b.BRANCH_COMMENT               component_comment,
     b.id                           branch_id,
     b.BRANCH_WHEN_BUTTON_ID        branch_when_button_id,
     --
     'Point='||BRANCH_POINT
     ||',seq='||lpad(b.BRANCH_SEQUENCE,5,'00000')
     ||',act='||substr(b.BRANCH_ACTION,1,30)||'.'||length(b.BRANCH_ACTION)
     ||',type='||decode(b.BRANCH_TYPE,
       'BRANCH_TO_FUNCTION_RETURNING_PAGE','Branch to Function Returning a Page',
       'BRANCH_TO_FUNCTION_RETURNING_URL', 'Branch to Function Returning a URL',
       'BRANCH_TO_PAGE_IDENT_BY_ITEM',     'Branch to Page Identified by Item (Use Item Name)',
       'BRANCH_TO_PAGE_ACCEPT',            'Branch to Page Accept Processing (not common)',
       'BRANCH_TO_STEP',                   'Branch to Page',
       'BRANCH_TO_URL_IDENT_BY_ITEM',      'Branch to URL Identified by Item (Use Item Name)',
       'PLSQL',                            'Branch to PL/SQL Procedure',
       'REDIRECT_URL',                     'Branch to Page or URL',
       b.BRANCH_TYPE)||'.'
     ||decode(b.BRANCH_WHEN_BUTTON_ID,null,null,(select button_name from wwv_flow_step_buttons where id = b.BRANCH_WHEN_BUTTON_ID
     union
     select name from wwv_flow_step_items where id = b.BRANCH_WHEN_BUTTON_ID))||
     decode(substr(b.SECURITY_SCHEME,1,1),'!','Not ')||
     nvl((select name from wwv_flow_security_schemes where to_char(id) = ltrim(b.SECURITY_SCHEME,'!') and flow_id = f.id),b.SECURITY_SCHEME)||
     'cond='||nvl((select r from apex_standard_conditions where d = b.BRANCH_CONDITION_TYPE),b.BRANCH_CONDITION_TYPE)||
        '.'||substr(b.BRANCH_CONDITION,1,20)||'.'||length(b.BRANCH_CONDITION)||'.'||length(b.BRANCH_CONDITION_TEXT)||
     'save='||decode(nvl(b.save_state_before_branch_yn,'N'),'N','No','Yes')||
     'build='||(select PATCH_NAME from wwv_flow_patches where id=  abs(b.REQUIRED_PATCH))
     component_signature
from wwv_flow_step_branches b,
     wwv_flow_steps p,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID ) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = p.security_group_id and
      f.security_group_id = b.security_group_id and
      f.id = p.flow_id and
      f.id = b.flow_id and
      p.id = b.flow_step_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_VAL" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"VALIDATION_NAME",
"VALIDATION_SEQUENCE",
"REGION_ID",
"REGION_NAME",
"VALIDATION_TYPE",
"VALIDATION_TYPE_CODE",
"VALIDATION_EXPRESSION1",
"VALIDATION_EXPRESSION2",
"ALWAYS_EXECUTE",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"EXEC_COND_FOR_EACH_ROW",
"WHEN_BUTTON_PRESSED",
"WHEN_BUTTON_PRESSED_ID",
"ONLY_FOR_CHANGED_ROWS",
"VALIDATION_FAILURE_TEXT",
"ASSOCIATED_ITEM",
"ASSOCIATED_COLUMN",
"ERROR_DISPLAY_LOCATION",
"BUILD_OPTION",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"VALIDATION_ID",
"COMPONENT_SIGNATURE") AS
  select
     w.short_name                  workspace,
     w.display_name                workspace_display_name,
     p.flow_id                     application_id,
     f.name                        application_name,
     p.id                          page_id,
     p.name                        page_name,
     --
     v.VALIDATION_NAME             validation_name,
     v.VALIDATION_SEQUENCE         validation_sequence,
     v.TABULAR_FORM_REGION_ID      region_id,
     ( select plug_name
         from wwv_flow_page_plugs
        where id = v.tabular_form_region_id ) region_name,
     --
     decode(v.VALIDATION_TYPE,
        'EXISTS','Exists',
        'FUNC_BODY_RETURNING_BOOLEAN','Function Returning Boolean',
        'FUNC_BODY_RETURNING_ERR_TEXT','Function Returning Error Text',
        'ITEM_NOT_NULL','Item\Column specified is NOT NULL',
        'ITEM_IN_VALIDATION_CONTAINS_AT_LEAST_ONE_CHAR_IN_STRING2','Item\Column in Expression 1 contains at least one of the characters in Expression 2',
        'ITEM_IN_VALIDATION_CONTAINS_ONLY_CHAR_IN_STRING2','Item\Column in Expression 1 contains only characters in Expression 2',
        'ITEM_IN_VALIDATION_NOT_EQ_STRING2','Item\Column in Expression 1 does NOT equal string literal in Expression2',
        'ITEM_IN_VALIDATION_CONTAINS_NO_CHAR_IN_STRING2','Item\Column in Expression 1 does not contain any of the characters in Expression 2',
        'ITEM_IN_VALIDATION_EQ_STRING2','Item\Column in Expression 1 equals string literal in Expression 2',
        'ITEM_IN_VALIDATION_NOT_IN_STRING2','Item\Column in Expression 1 is NOT contained in Expression 2',
        'ITEM_IN_VALIDATION_IN_STRING2','Item\Column in Expression 1 is contained in Expression 2',
        'ITEM_NOT_ZERO','Item\Column specified is NOT zero',
        'ITEM_CONTAINS_NO_SPACES','Item\Column specified contains no spaces',
        'ITEM_NOT_NULL_OR_ZERO','Item\Column specified is NOT NULL or zero',
        'ITEM_IS_ALPHANUMERIC','Item\Column specified is alphanumeric',
        'ITEM_IS_NUMERIC','Item\Column specified is numeric',
        'ITEM_IS_DATE','Item\Column specified is a valid date',
        'ITEM_IS_TIMESTAMP','Item\Column specified is a valid timestamp',
        'REGULAR_EXPRESSION','Item\Column in Expression 1 matches Regular Expression in Expression 2',
        'NOT_EXISTS','NOT Exists',
        'PLSQL_ERROR','PL/SQL Error',
        'PLSQL_EXPRESSION','PL/SQL Expression',
        'SQL_EXPRESION','SQL Expression',
         v.VALIDATION_TYPE)        validation_type,
     v.validation_type             validation_type_code,
     v.VALIDATION                  validation_expression1,
     v.VALIDATION2                 validation_expression2,
     --
     case nvl(v.always_execute, 'N')
       when 'Y' then 'Yes'
       when 'N' then 'No'
     end                           always_execute,
     nvl((select r from apex_standard_conditions where d = v.VALIDATION_CONDITION_TYPE),v.VALIDATION_CONDITION_TYPE)
                                   condition_type,
     v.validation_condition_type   condition_type_code,
     v.VALIDATION_CONDITION        condition_expression1,
     v.VALIDATION_CONDITION2       condition_expression2,
     case nvl(v.exec_cond_for_each_row, 'N')
       when 'Y' then 'Yes'
       when 'N' then 'No'
     end                           exec_cond_for_each_row,
     --
     (select button_name
      from wwv_flow_step_buttons
      where id = v.WHEN_BUTTON_PRESSED
      union
      select name
      from wwv_flow_step_items
      where id = v.WHEN_BUTTON_PRESSED)
                                   when_button_pressed,
     v.WHEN_BUTTON_PRESSED         when_button_pressed_id,
     case nvl(v.only_for_changed_rows, 'Y')
       when 'Y' then 'Yes'
       when 'N' then 'No'
     end                           only_for_changed_rows,
     --
     v.ERROR_MESSAGE               validation_failure_text,
     (select name from wwv_flow_step_items
      where id = v.ASSOCIATED_ITEM and
            flow_id = f.id)        associated_item,
     v.associated_column           associated_column,
     v.ERROR_DISPLAY_LOCATION      error_display_location,
     (select case when v.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from wwv_flow_patches
     where id= abs(v.REQUIRED_PATCH))   build_option,
     --
     decode(substr(v.SECURITY_SCHEME,1,1),'!','Not ')||
     nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id) = ltrim(v.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     v.SECURITY_SCHEME)            authorization_scheme,
     v.SECURITY_SCHEME             authorization_scheme_id,
     --
     v.LAST_UPDATED_BY             last_updated_by,
     v.LAST_UPDATED_ON             last_updated_on,
     v.VALIDATION_COMMENT          component_comment,
     v.id                          validation_id,
     'seq='||v.VALIDATION_SEQUENCE
     ||',item='||(select name from wwv_flow_step_items where id=v.ASSOCIATED_ITEM)
     ||',type='||v.VALIDATION_TYPE
     ||',val='||substr(v.VALIDATION,1,40)||'.'||length(v.VALIDATION)||'.'
      ||substr(v.VALIDATION2,1,40)||'.'||length(v.VALIDATION2)||'.'
     ||decode(v.VALIDATION_CONDITION_TYPE,null,null,',cond='||v.VALIDATION_CONDITION_TYPE||'.'||
         substr(v.VALIDATION_CONDITION,1,30)||length(v.VALIDATION_CONDITION)||'.'||
         substr(v.VALIDATION_CONDITION2,1,30)||length(v.VALIDATION_CONDITION2))
     component_signature
from wwv_flow_step_validations v,
     wwv_flow_steps p,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID ) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = p.security_group_id and
      f.security_group_id = v.security_group_id and
      f.id = p.flow_id and
      f.id = v.flow_id and
      p.id = v.flow_step_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_BUTTONS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"BUTTON_SEQUENCE",
"REGION",
"REGION_ID",
"BUTTON_NAME",
"BUTTON_STATIC_ID",
"BUTTON_TEMPLATE",
"BUTTON_TEMPLATE_ID",
"BUTTON_IS_HOT",
"IMAGE_NAME",
"LABEL",
"DISPLAY_POSITION",
"NEW_GRID",
"NEW_GRID_ROW",
"NEW_GRID_COLUMN",
"GRID_COLUMN",
"GRID_COLUMN_SPAN",
"ALIGNMENT",
"BUTTON_ACTION",
"BUTTON_ACTION_CODE",
"REDIRECT_URL",
"EXECUTE_VALIDATIONS",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"IMAGE_ATTRIBUTES",
"BUTTON_CSS_CLASSES",
"BUTTON_ATTRIBUTES",
"DATABASE_ACTION",
"BUILD_OPTION",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"BUTTON_POSITION",
"BUTTON_ID",
"COMPONENT_SIGNATURE") AS
  select
     w.short_name                  workspace,
     w.display_name                workspace_display_name,
     p.flow_id                     application_id,
     f.name                        application_name,
     p.id                          page_id,
     p.name                        page_name,
     --
     b.BUTTON_SEQUENCE             button_sequence,
     (select plug_name
      from wwv_flow_page_plugs
      where id=b.BUTTON_PLUG_ID)   region,
     b.button_plug_id              region_id,
     b.BUTTON_NAME                 button_name,
     b.button_static_id            button_static_id,
     (select template_name
      from wwv_flow_button_templates
      where b.BUTTON_IMAGE =
         'template:'||to_char(id)
      and flow_id = f.id)          button_template,
     decode(substr(b.BUTTON_IMAGE,1,9),'template:',substr(b.BUTTON_IMAGE,10),null)  button_template_id,
     case b.button_is_hot
       when 'Y' then 'Yes'
       when 'N' then 'No'
     end                           button_is_hot,
     decode(substr(b.BUTTON_IMAGE,1,9),'template:',null,b.BUTTON_IMAGE) image_name,
     b.BUTTON_IMAGE_ALT            label,
     b.BUTTON_POSITION             display_position,
     to_char(null)                 new_grid,
     to_char(null)                 new_grid_row,
     to_char(null)                 new_grid_column,
     to_number(null)               grid_column,
     to_number(null)               grid_column_span,
     b.BUTTON_ALIGNMENT            alignment,
     --
     decode(b.button_action,
                'SUBMIT',           'Submit Page',
                'REDIRECT_PAGE',    'Redirect to Page in this Application',
                'REDIRECT_URL',     'Redirect to URL',
                'DEFINED_BY_DA',    'Defined by Dynamic Action',
                                    b.button_action)        button_action,
     b.button_action               button_action_code,
     b.BUTTON_REDIRECT_URL         redirect_url,
     case nvl(b.button_execute_validations, 'Y')
       when 'Y' then 'Yes'
       when 'N' then 'No'
     end                           execute_validations,
     --
     nvl((select r from apex_standard_conditions where d = b.BUTTON_CONDITION_TYPE),b.BUTTON_CONDITION_TYPE)
                                   condition_type,
     b.button_condition_type       condition_type_code,
     b.BUTTON_CONDITION            condition_expression1,
     b.BUTTON_CONDITION2           condition_expression2,
     b.BUTTON_IMAGE_ATTRIBUTES     image_attributes,
     b.button_css_classes          button_css_classes,
     b.BUTTON_CATTRIBUTES          button_attributes,
     decode(
        b.DATABASE_ACTION,
        'DELETE','SQL DELETE action',
        'INSERT','SQL INSERT action',
        'UPDATE','SQL UPDATE action',
        b.DATABASE_ACTION)         database_action,
     --
     (select case when b.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from wwv_flow_patches
     where id= abs(b.REQUIRED_PATCH))   build_option,
     --
     decode(substr(b.SECURITY_SCHEME,1,1),'!','Not ')||
     nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id)= ltrim(b.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     b.SECURITY_SCHEME)            authorization_scheme,
     b.SECURITY_SCHEME             authorization_scheme_id,
     --
     b.LAST_UPDATED_BY             last_updated_by,
     b.LAST_UPDATED_ON             last_updated_on,
     b.BUTTON_COMMENT              component_comment,
     'Region Position'             button_position,
     b.id                          button_id,
     --
     b.BUTTON_NAME
     ||',s='||rpad(b.BUTTON_SEQUENCE,5,'00000')
     ||',r='||(select plug_name from wwv_flow_page_plugs where id=b.BUTTON_PLUG_ID)
     ||',bs='||b.button_static_id
     ||' t='||(select template_name from wwv_flow_button_templates where b.BUTTON_IMAGE = 'template:'||to_char(id) and flow_id = f.id)
     ||' label='||b.BUTTON_IMAGE_ALT
     ||' p='||b.BUTTON_POSITION
     ||' a='||b.BUTTON_ALIGNMENT
     ||' ba='||b.button_action
     ||' u='||substr(b.BUTTON_REDIRECT_URL,1,30)||length(b.BUTTON_REDIRECT_URL)
     ||' c='||b.BUTTON_CONDITION_TYPE
     ||substr(b.BUTTON_CONDITION,1,20)||length(b.BUTTON_CONDITION)||'.'
     ||substr(b.BUTTON_CONDITION2,1,20)||length(b.BUTTON_CONDITION2)
     ||' ii='||substr(b.BUTTON_IMAGE_ATTRIBUTES,1,20)||length(b.BUTTON_IMAGE_ATTRIBUTES)
     ||' ca='||substr(b.BUTTON_CATTRIBUTES,1,20)||length(b.BUTTON_CATTRIBUTES)
     ||' b='||decode(
        b.DATABASE_ACTION,
        'DELETE','SQLDELETE',
        'INSERT','SQLINSERT',
        'UPDATE','SQLUPDATE',
        b.DATABASE_ACTION)
     ||' b='||(select PATCH_NAME
     from wwv_flow_patches
     where id= abs(b.REQUIRED_PATCH))
     ||' s='||decode(substr(b.SECURITY_SCHEME,1,1),'!','Not ')||
     nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id)= ltrim(b.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     b.SECURITY_SCHEME)
     component_signature
from wwv_flow_step_buttons b,
     wwv_flow_steps p,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = p.security_group_id and
      f.security_group_id = b.security_group_id and
      f.id = p.flow_id and
      f.id = b.flow_id and
      p.id = b.flow_step_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0
union all
select
    w.short_name                    workspace,
    w.display_name                  workspace_display_name,
    p.flow_id                       application_id,
    f.name                          application_name,
    p.id                            page_id,
    p.name                          page_name,
    --
    i.ITEM_SEQUENCE                 button_sequence,
    (select plug_name
     from wwv_flow_page_plugs
     where id = i.ITEM_PLUG_ID)     region,
    i.item_plug_id                  region_id,
    i.name                          button_name,
    null                            button_static_id,
    --
    (select template_name
       from wwv_flow_button_templates
      where i.tag_attributes =
        'template:'||to_char(id)
      and flow_id = f.id)           button_template,
    decode(substr(i.tag_attributes,1,9),'template:',substr(i.tag_attributes,10),null)
                                    button_template_id,
    case i.button_is_hot
      when 'Y' then 'Yes'
      when 'N' then 'No'
    end                             button_is_hot,
    decode(substr(i.BUTTON_IMAGE,1,9),'template:',null,i.BUTTON_IMAGE) image_name,
    i.PROMPT                        label,
    null                            display_position,
    case i.new_grid
      when 'Y' then 'Yes'
      else 'No'
    end                             new_grid,
    case i.begin_on_new_line
      when 'YES' then 'Yes'
      else 'No'
    end                             new_grid_row,
    case i.begin_on_new_field
      when 'YES' then 'Yes'
      else 'No'
    end                             new_grid_column,
    i.grid_column                   grid_column,
    i.colspan                       grid_column_span,
    null                            alignment,
    --
    decode(i.button_action,
                'SUBMIT',           'Submit Page',
                'REDIRECT_PAGE',    'Redirect to Page in this Application',
                'REDIRECT_URL',     'Redirect to URL',
                'DEFINED_BY_DA',    'Defined by Dynamic Action',
                                    i.button_action)        button_action,
    i.button_action               button_action_code,
    i.BUTTON_REDIRECT_URL         redirect_url,
    case nvl(i.button_execute_validations, 'Y')
      when 'Y' then 'Yes'
      when 'N' then 'No'
    end                             execute_validations,
    --
    nvl((select r from apex_standard_conditions where d = i.DISPLAY_WHEN_TYPE),i.DISPLAY_WHEN_TYPE)
                                    condition_type,
    i.display_when_type             condition_type_code,
    i.DISPLAY_WHEN                  condition_expression1,
    i.DISPLAY_WHEN2                 condition_expression2,
    --
    null                            image_attributes,
    i.tag_css_classes               button_css_classes,
    null                            button_attributes,
    null                            database_action,
    (select case when i.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(i.REQUIRED_PATCH))   build_option,
    --
    decode(substr(i.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from   wwv_flow_security_schemes
     where  to_char(id) = ltrim(i.SECURITY_SCHEME,'!')
     and    flow_id = f.id),
     i.SECURITY_SCHEME)             authorization_scheme,
    i.SECURITY_SCHEME               authorization_scheme_id,
    i.LAST_UPDATED_BY               last_updated_by,
    i.LAST_UPDATED_ON               last_updated_on,
    i.ITEM_COMMENT                  component_comment,
    'Among region items'            button_position,
    i.id                            button_id,
    --
    lpad(i.ITEM_SEQUENCE,5,'00000')
    ||' r='||(select plug_name
     from wwv_flow_page_plugs
     where id = i.ITEM_PLUG_ID)
    ||' n='||i.name
    ||' l='||substr(i.PROMPT,1,40)||length(i.PROMPT)
    ||' ba='||i.button_action
    ||' u='||substr(i.BUTTON_REDIRECT_URL,1,30)||length(i.BUTTON_REDIRECT_URL)
    ||' c='||i.DISPLAY_WHEN_TYPE
    ||'.'||substr(i.DISPLAY_WHEN,1,20)||length(i.DISPLAY_WHEN)
    ||'.'||substr(i.DISPLAY_WHEN2,1,20)||length(i.DISPLAY_WHEN2)
    ||' bo='||(select case when i.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(i.REQUIRED_PATCH))
    ||' sec='||decode(substr(i.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from   wwv_flow_security_schemes
     where  to_char(id) = ltrim(i.SECURITY_SCHEME,'!')
     and    flow_id = f.id),
     i.SECURITY_SCHEME)
    ||' ItemButton'
    component_signature
from wwv_flow_step_items i,
     wwv_flow_steps p,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = p.security_group_id and
      f.id = p.flow_id and
      f.id = i.flow_id and
      p.id = i.flow_step_id and
      nvl(i.display_as,'x') = 'BUTTON' and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_DA" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"DYNAMIC_ACTION_NAME",
"DYNAMIC_ACTION_SEQUENCE",
"WHEN_ELEMENT",
"WHEN_SELECTION_TYPE",
"WHEN_REGION",
"WHEN_REGION_ID",
"WHEN_BUTTON",
"WHEN_BUTTON_ID",
"CONDITION_PAGE_ITEM",
"WHEN_CONDITION",
"WHEN_EXPRESSION",
"WHEN_EVENT_SCOPE",
"WHEN_EVENT_STATIC_CONTAINER",
"WHEN_EVENT_INTERNAL_NAME",
"WHEN_EVENT_NAME",
"WHEN_EVENT_CUSTOM_NAME",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"BUILD_OPTION",
"BUILD_OPTION_ID",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY",
"COMPONENT_COMMENT",
"DYNAMIC_ACTION_ID",
"NUMBER_OF_ACTIONS",
"COMPONENT_SIGNATURE") AS
  select  w.short_name                                            workspace,
        w.display_name                                          workspace_display_name,
        e.flow_id                                               application_id,
        f.name                                                  application_name,
        e.page_id                                               page_id,
        p.name                                                  page_name,
        --
        e.name                                                  dynamic_action_name,
        e.event_sequence                                        dynamic_action_sequence,
        e.triggering_element                                    when_element,
        decode(e.triggering_element_type,
            'ITEM',             'Item',
            'BUTTON',           'Button',
            'REGION',           'Region',
            'COLUMN',           'Column',
            'DOM_OBJECT',       'DOM Object',
            'JQUERY_SELECTOR',  'jQuery Selector',
                                e.triggering_element_type)      when_selection_type,
        nvl((select plug_name
               from wwv_flow_page_plugs
              where id = e.triggering_region_id),
            e.triggering_region_id)                             when_region,
        e.triggering_region_id                                  when_region_id,
        --
        decode(e.triggering_button_id,
            null,   null,
                    (select button_name
                       from wwv_flow_step_buttons
                      where id = e.triggering_button_id
                      union
                     select name
                       from wwv_flow_step_items
                      where id = e.triggering_button_id))       when_button,
        e.triggering_button_id                                  when_button_id,
        e.condition_page_item,
        --
        decode(e.triggering_condition_type,
            'EQUALS',               'equal to',
            'NOT_EQUALS',           'not equal to',
            'GREATER_THAN',         'greater than',
            'GREATER_THAN_OR_EQUAL','greater than or equal to',
            'LESS_THAN',            'less than',
            'LESS_THAN_OR_EQUAL',   'less than or equal to',
            'NULL',                 'is null',
            'NOT_NULL',             'is not null',
            'IN_LIST',              'in list',
            'NOT_IN_LIST',          'not in list',
            'JAVASCRIPT_EXPRESSION','JavaScript expression',
                                    e.triggering_condition_type)when_condition,
        e.triggering_expression                                 when_expression,
        --
        e.bind_type                                             when_event_scope,
        e.bind_delegate_to_selector                             when_event_static_container,
        e.bind_event_type                                       when_event_internal_name,
        (select d
          from wwv_flow_javascript_events
         where r = e.bind_event_type)                           when_event_name,
        e.bind_event_type_custom                                when_event_custom_name,
        --
        nvl((select r
               from apex_standard_conditions
              where d = e.display_when_type),
            e.display_when_type)                                condition_type,
        e.display_when_type                                     condition_type_code,
        e.display_when_cond                                     condition_expression1,
        e.display_when_cond2                                    condition_expression2,
        --
        (select case when e.required_patch > 0 then
                    patch_name
                else
                    '{Not '||patch_name||'}'
                end patch_name
           from wwv_flow_patches
          where id = abs(e.required_patch))                     build_option,
        e.required_patch                                        build_option_id,
        --
        decode(substr(e.security_scheme,1,1),'!','Not ')||
        nvl((select name
               from wwv_flow_security_schemes
              where to_char(id) = ltrim(e.security_scheme,'!')
                and flow_id = e.id),
            e.security_scheme)                                  authorization_scheme,
        e.security_scheme                                       authorization_scheme_id,
        --
        e.last_updated_on                                       last_updated_on,
        e.last_updated_by                                       last_updated_by,
        e.da_event_comment                                      component_comment,
        e.id                                                    dynamic_action_id,
        --
        (select count(*)
           from wwv_flow_page_da_actions
          where event_id = e.id)                                number_of_actions,
        --
        'name='     || e.name ||
        ',seq='     || lpad(e.event_sequence,5,'00000') ||
        ',tee='     || substr(e.triggering_element,1,30) ||
        ',teet='    || e.triggering_element_type ||
        ',ter='     || nvl( (select plug_name
                              from wwv_flow_page_plugs
                             where id=e.triggering_region_id),
                            e.triggering_region_id) ||
        ',teb='     || decode(e.triggering_button_id,
                                null,   null,
                                        (select button_name
                                           from wwv_flow_step_buttons
                                          where id = e.triggering_button_id
                                          union
                                         select name
                                           from wwv_flow_step_items
                                          where id = e.triggering_button_id)) ||
        ',tec='     || e.triggering_condition_type ||
        ',teexp='   || substr(e.triggering_expression,1,30) ||
        ',tebt='    || e.bind_type ||
        ',tebdts='  || e.bind_delegate_to_selector ||
        ',tebe='    || e.bind_event_type ||
        ',cond='    || e.display_when_type ||
                       substr(e.display_when_cond,1,20) ||
                       length(e.display_when_cond) ||
                       length(e.display_when_cond2) ||
        ',build='   || nvl( (select patch_name
                               from wwv_flow_patches
                              where id = abs(e.required_patch)),
                            e.required_patch) ||
        ' auth='    || decode(substr(e.security_scheme,1,1),'!','Not ')||
                       nvl( (select name
                              from wwv_flow_security_schemes
                             where to_char(id)= ltrim(e.security_scheme,'!')
                               and flow_id = e.id),
                            e.security_scheme)                  component_signature
  from  wwv_flow_page_da_events e,
        wwv_flow_steps p,
        wwv_flows f,
        wwv_flow_companies w,
        wwv_flow_company_schemas s,
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) d
where (s.schema  = cu  or
        (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
        d.sgid              = w.PROVISIONING_COMPANY_ID) and
        f.security_group_id = w.PROVISIONING_COMPANY_ID and
        s.security_group_id = w.PROVISIONING_COMPANY_ID and
        s.schema = f.owner and
        f.security_group_id = p.security_group_id and
        f.security_group_id = e.security_group_id and
        f.id = p.flow_id and
        f.id = e.flow_id and
        p.id = e.page_id and
        (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
        w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_DA_ACTS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"DYNAMIC_ACTION_ID",
"DYNAMIC_ACTION_NAME",
"ACTION_NAME",
"ACTION_CODE",
"ACTION_SEQUENCE",
"DYNAMIC_ACTION_EVENT_RESULT",
"EXECUTE_ON_PAGE_INIT",
"AFFECTED_ELEMENTS",
"AFFECTED_ELEMENTS_TYPE",
"AFFECTED_REGION",
"AFFECTED_REGION_ID",
"AFFECTED_BUTTON",
"AFFECTED_BUTTON_ID",
"ATTRIBUTE_01",
"ATTRIBUTE_02",
"ATTRIBUTE_03",
"ATTRIBUTE_04",
"ATTRIBUTE_05",
"ATTRIBUTE_06",
"ATTRIBUTE_07",
"ATTRIBUTE_08",
"ATTRIBUTE_09",
"ATTRIBUTE_10",
"ATTRIBUTE_11",
"ATTRIBUTE_12",
"ATTRIBUTE_13",
"ATTRIBUTE_14",
"ATTRIBUTE_15",
"STOP_EXECUTION_ON_ERROR",
"WAIT_FOR_RESULT",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"ACTION_ID",
"COMPONENT_SIGNATURE") AS
  select  fa.workspace                                        workspace,
        fa.workspace_display_name                           workspace_display_name,
        fa.application_id                                   application_id,
        fa.application_name                                 application_name,
        a.page_id                                           page_id,
        p.name                                              page_name,
        a.event_id                                          dynamic_action_id,
        e.name                                              dynamic_action_name,
        case substr(a.action, 1, 7)
          when 'NATIVE_' then
              ( select display_name from wwv_flow_plugins where flow_id = 4411 and plugin_type = 'DYNAMIC ACTION' and name = substr(a.action, 8) )
          when 'PLUGIN_' then
              ( select display_name from wwv_flow_plugins where flow_id = a.flow_id and plugin_type = 'DYNAMIC ACTION' and name = substr(a.action, 8) )
          else a.action
        end                                                 action_name,
        a.action                                            action_code,
        a.action_sequence                                   action_sequence,
        decode(a.event_result,  'TRUE',     'True',
                                'FALSE',    'False',
                                            a.event_result )                dynamic_action_event_result,
        decode(a.execute_on_page_init,  'Y',    'Yes',
                                        'N',    'No',
                                                a.execute_on_page_init )    execute_on_page_init,
        a.affected_elements                                 affected_elements,
        decode(a.affected_elements_type,
            'ITEM',                 'Item',
            'REGION',               'Region',
            'COLUMN',               'Column',
            'DOM_OBJECT',           'DOM Object',
            'JQUERY_SELECTOR',      'jQuery Selector',
            'TRIGGERING_ELEMENT',   'Triggering Element',
            'EVENT_SOURCE',         'Event Source',
                                a.affected_elements_type)   affected_elements_type,
        nvl((select plug_name
               from wwv_flow_page_plugs
              where id = a.affected_region_id),
            a.affected_region_id)                           affected_region,
        a.affected_region_id                                affected_region_id,
        decode(a.affected_button_id,
            null,   null,
                    (select button_name
                       from wwv_flow_step_buttons
                      where id = a.affected_button_id
                      union
                     select name
                       from wwv_flow_step_items
                      where id = a.affected_button_id))     affected_button,
        a.affected_button_id                                affected_button_id,
        a.attribute_01                                      attribute_01,
        a.attribute_02                                      attribute_02,
        a.attribute_03                                      attribute_03,
        a.attribute_04                                      attribute_04,
        a.attribute_05                                      attribute_05,
        a.attribute_06                                      attribute_06,
        a.attribute_07                                      attribute_07,
        a.attribute_08                                      attribute_08,
        a.attribute_09                                      attribute_09,
        a.attribute_10                                      attribute_10,
        a.attribute_11                                      attribute_11,
        a.attribute_12                                      attribute_12,
        a.attribute_13                                      attribute_13,
        a.attribute_14                                      attribute_14,
        a.attribute_15                                      attribute_15,
        case when a.stop_execution_on_error = 'Y' then 'Yes' else 'No' end as
                                                            stop_execution_on_error,
        case a.wait_for_result
            when 'Y' then 'Yes'
            when 'N' then 'No'
        end                                                 wait_for_result,
        a.last_updated_by                                   last_updated_by,
        a.last_updated_on                                   last_updated_on,
        a.da_action_comment                                 component_comment,
        a.id                                                action_id,
        --
        'action='   || a.action ||
        ',seq='     || lpad(a.action_sequence,5,'00000') ||
        ',er='      || a.event_result ||
        ',eopi='    || a.execute_on_page_init ||
        ',ae='      || substr(a.affected_elements,1,30) ||
        ',aet='     || a.affected_elements_type ||
        ',aer='     || nvl( (select plug_name
                               from wwv_flow_page_plugs
                              where id=a.affected_region_id),
                            a.affected_region_id) ||
        ',aeb='     || decode(a.affected_button_id,
                                null,   null,
                                        (select button_name
                                           from wwv_flow_step_buttons
                                          where id = a.affected_button_id
                                          union
                                         select name
                                           from wwv_flow_step_items
                                          where id = a.affected_button_id)) ||
        ',seoe='    || a.stop_execution_on_error ||
        ',wfr='     || a.wait_for_result
        component_signature
  from  wwv_flow_page_da_actions a,
        wwv_flow_page_da_events e,
        wwv_flow_authorized fa,
        wwv_flow_steps p
 where  a.flow_id = fa.application_id
   and  e.id      = a.event_id
   and  p.flow_id = a.flow_id
   and  p.id      = a.page_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_BUILD_OPTIONS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"BUILD_OPTION_NAME",
"BUILD_OPTION_STATUS",
"STATUS_ON_EXPORT",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"BUILD_OPTION_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    b.PATCH_NAME                     build_option_name,
    decode(b.PATCH_STATUS,
        'INCLUDE','Include',
        'EXCLUDE','Exclude',
        b.patch_status)              build_option_status,
    decode(nvl(b.DEFAULT_ON_EXPORT,
        b.patch_status),
        'INCLUDE','Include',
        'EXCLUDE','Exclude',
        b.DEFAULT_ON_EXPORT)         status_on_export,
    --b.ATTRIBUTE1                   attribute1,
    --b.ATTRIBUTE2                   attribute2,
    --b.ATTRIBUTE3                   attribute3,
    --b.ATTRIBUTE4                   attribute4,
    b.LAST_UPDATED_BY                last_updated_by,
    b.LAST_UPDATED_ON                last_updated_on,
    b.PATCH_COMMENT                  component_comment,
    b.id                             build_option_id,
    --
    b.PATCH_NAME
    ||' s='||decode(b.PATCH_STATUS,
        'INCLUDE','Include',
        'EXCLUDE','Exclude',
        b.patch_status)
    ||' e='||decode(nvl(b.DEFAULT_ON_EXPORT,
        b.patch_status),
        'INCLUDE','Include',
        'EXCLUDE','Exclude',
        b.DEFAULT_ON_EXPORT)
    component_signature
from wwv_flow_patches b,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = b.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_TABS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"TAB_SET",
"DISPLAY_SEQUENCE",
"TAB_NAME",
"WHEN_CURRENT_TAB_IMAGE",
"WHEN_NOT_CURRENT_TAB_IMAGE",
"TAB_IMAGE_ATTRIBUTES",
"TAB_LABEL",
"TAB_PAGE",
"TAB_ALSO_CURRENT_FOR_PAGES",
"PARENT_TABSET",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"BUILD_OPTION",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"TAB_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    t.TAB_SET                        tab_set,
    t.TAB_SEQUENCE                   display_sequence,
    t.TAB_NAME                       tab_name,
    t.TAB_IMAGE                      when_current_tab_image,
    t.TAB_NON_CURRENT_IMAGE          when_not_current_tab_image,
    t.TAB_IMAGE_ATTRIBUTES           tab_image_attributes,
    t.TAB_TEXT                       tab_label,
    t.TAB_STEP                       tab_page,
    t.TAB_ALSO_CURRENT_FOR_PAGES     tab_also_current_for_pages,
    t.TAB_PARENT_TABSET              parent_tabset,
    --
    nvl((select r from apex_standard_conditions where d = t.DISPLAY_CONDITION_TYPE),t.DISPLAY_CONDITION_TYPE)
                                     condition_type,
    t.display_condition_type         condition_type_code,
    t.TAB_PLSQL_CONDITION            condition_expression1,
    t.TAB_DISP_COND_TEXT             condition_expression2,
    --
    (select case when t.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(t.REQUIRED_PATCH))    build_option,
     --
    decode(substr(t.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id)= ltrim(t.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     t.SECURITY_SCHEME)              authorization_scheme,
    t.SECURITY_SCHEME                authorization_scheme_id,
    --
    t.LAST_UPDATED_BY                last_updated_by,
    t.LAST_UPDATED_ON                last_updated_on,
    t.TAB_COMMENT                    component_comment,
    t.id                             tab_id,
    --
    t.TAB_SET
    ||' '||lpad(t.TAB_SEQUENCE,5,'00000')
    ||' '||t.TAB_NAME
    ||substr(t.TAB_IMAGE,1,30)||length(t.TAB_IMAGE)
    ||substr(t.TAB_NON_CURRENT_IMAGE,1,30)||length(t.TAB_NON_CURRENT_IMAGE)
    ||substr(t.TAB_IMAGE_ATTRIBUTES,1,30)||length(t.TAB_IMAGE_ATTRIBUTES)
    ||' text='||substr(t.TAB_TEXT,1,30)||length(t.TAB_TEXT)
    ||' p='||t.TAB_STEP
    ||' a='||substr(t.TAB_ALSO_CURRENT_FOR_PAGES,1,30)||length(t.TAB_ALSO_CURRENT_FOR_PAGES)
    ||substr(t.TAB_PARENT_TABSET,1,30)||length(t.TAB_PARENT_TABSET)
    ||' c='||t.DISPLAY_CONDITION_TYPE
    ||substr(t.TAB_PLSQL_CONDITION,1,30)||length(t.TAB_PLSQL_CONDITION)
    ||substr(t.TAB_DISP_COND_TEXT,1,30)||length(t.TAB_DISP_COND_TEXT)
    ||(select PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(t.REQUIRED_PATCH))
    ||decode(substr(t.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id)= ltrim(t.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     t.SECURITY_SCHEME)
    component_signature
from wwv_flow_tabs t,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID ) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = t.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PARENT_TABS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"TAB_SET",
"DISPLAY_SEQUENCE",
"TAB_NAME",
"WHEN_CURRENT_IMAGE",
"WHEN_NON_CURRENT_IMAGE",
"IMAGE_ATTRIBUTES",
"TAB_LABEL",
"TAB_TARGET",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"CURRENT_FOR_TABSET",
"BUILD_OPTION",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"PARENT_TAB_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    t.TAB_SET                        tab_set,
    t.TAB_SEQUENCE                   display_sequence,
    t.TAB_NAME                       tab_name,
    t.TAB_IMAGE                      when_current_image,
    t.TAB_NON_CURRENT_IMAGE          when_non_current_image,
    t.TAB_IMAGE_ATTRIBUTES           image_attributes,
    t.TAB_TEXT                       tab_label,
    t.TAB_TARGET                     tab_target,
    --
    nvl((select r from apex_standard_conditions where d = t.DISPLAY_CONDITION_TYPE),t.DISPLAY_CONDITION_TYPE)
                                     condition_type,
    t.display_condition_type         condition_type_code,
    t.DISPLAY_CONDITION              condition_expression1,
    t.DISPLAY_CONDITION2             condition_expression2,
    --
    t.CURRENT_ON_TABSET              current_for_tabset,
    --
    (select case when t.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(t.REQUIRED_PATCH))    build_option,
    --
    decode(substr(t.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id)= ltrim(t.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     t.SECURITY_SCHEME)              authorization_scheme,
    t.SECURITY_SCHEME                authorization_scheme_id,
    --
    t.LAST_UPDATED_BY                last_updated_by,
    t.LAST_UPDATED_ON                last_updated_on,
    t.TAB_COMMENT                    component_comment,
    t.id                             parent_tab_id,
    --
    t.TAB_SET
    ||' '||lpad(t.TAB_SEQUENCE,5,'00000')
    ||' '||substr(t.TAB_NAME              ,1,30)||length(t.TAB_NAME             )
    ||' '||substr(t.TAB_IMAGE             ,1,30)||length(t.TAB_IMAGE            )
    ||' '||substr(t.TAB_NON_CURRENT_IMAGE ,1,30)||length(t.TAB_NON_CURRENT_IMAGE)
    ||' '||substr(t.TAB_IMAGE_ATTRIBUTES  ,1,30)||length(t.TAB_IMAGE_ATTRIBUTES )
    ||' '||substr(t.TAB_TEXT              ,1,30)||length(t.TAB_TEXT             )
    ||' '||substr(t.TAB_TARGET            ,1,30)||length(t.TAB_TARGET           )
    ||' cond='||t.DISPLAY_CONDITION_TYPE
    ||substr(t.DISPLAY_CONDITION,1,30)||length(t.DISPLAY_CONDITION)
    ||substr(t.DISPLAY_CONDITION2,1,30)||length(t.DISPLAY_CONDITION2)
    ||' ct='||t.CURRENT_ON_TABSET
    ||' bo='||(select PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(t.REQUIRED_PATCH))
    ||' sec='||decode(substr(t.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id)= ltrim(t.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     t.SECURITY_SCHEME)
    component_signature
from wwv_flow_toplevel_tabs t,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = t.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_SUPP_OBJECTS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"BUILD_OPTIONS",
"INCLUDE_IN_APPLICATION_EXPORT",
"WELCOME_MESSAGE",
"LICENSE_MESSAGE",
"VALIDATION_MESSAGE",
"INSTALLATION_MESSAGE",
"INSTALLATION_SUCCESS_MESSAGE",
"INSTALLATION_FAILURE_MESSAGE",
"INSTALLATION_SCRIPTS",
"UPGRADE_WHEN_QUERY",
"UPGRADE_MESSAGE",
"UPGRADE_CONFIRM_MESSAGE",
"UPGRADE_SUCCESS_MESSAGE",
"UPGRADE_FAILURE_MESSAGE",
"UPGRADE_SCRIPTS",
"DEINSTALL_MESSAGE",
"DEINSTALL_SUCCESS_MESSAGE",
"DEINSTALLATION_SCRIPT",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"CREATED_BY",
"CREATED_ON",
"CONFIGURATION_MESSAGE",
"BUILD_OPTIONS_MESSAGE",
"REQUIRED_FREE_KB",
"REQUIRED_SYSTEM_PRIVILEGES",
"REQUIRED_NAMES_AVAILABLE",
"SUPPORTING_OBJECT_ID") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    (select count(*)
    from wwv_flow_install_build_opt
    where install_id = i.id)         build_options,
    --
    decode(i.INCLUDE_IN_EXPORT_YN,
      'Y','Yes',
      'N','No',
      i.INCLUDE_IN_EXPORT_YN)        include_in_application_export,
    i.WELCOME_MESSAGE                ,
    i.LICENSE_MESSAGE                ,
    i.VALIDATION_MESSAGE             ,
    --
    i.INSTALL_MESSAGE                installation_message,
    i.INSTALL_SUCCESS_MESSAGE        installation_success_message,
    i.INSTALL_FAILURE_MESSAGE        installation_failure_message,
    (select count(*)
     from wwv_flow_install_scripts
     where i.id = install_id
       and nvl(script_type,'INSTALL') = 'INSTALL')
                                     installation_scripts,
    --
    i.get_version_sql_query          upgrade_when_query,
    i.upgrade_message                upgrade_message,
    i.upgrade_confirm_message        upgrade_confirm_message,
    i.upgrade_success_message        upgrade_success_message,
    i.upgrade_failure_message        upgrade_failure_message,
    (select count(*)
     from wwv_flow_install_scripts
     where i.id = install_id
       and nvl(script_type,'INSTALL') = 'UPGRADE')
                                     upgrade_scripts,
    --
    --
    i.DEINSTALL_MESSAGE              ,
    i.DEINSTALL_SUCCESS_MESSAGE      ,
    --i.DEINSTALL_FAILURE_MESSAGE      ,
    i.DEINSTALL_SCRIPT               deinstallation_script,
    --
    --i.PROMPT_SUBSTITUTION_01_YN      ,
    --i.PROMPT_SUBSTITUTION_02_YN      ,
    --i.PROMPT_SUBSTITUTION_03_YN      ,
    --i.PROMPT_SUBSTITUTION_04_YN      ,
    --i.PROMPT_SUBSTITUTION_05_YN      ,
    --i.PROMPT_SUBSTITUTION_06_YN      ,
    --i.PROMPT_SUBSTITUTION_07_YN      ,
    --i.PROMPT_SUBSTITUTION_08_YN      ,
    --i.PROMPT_SUBSTITUTION_09_YN      ,
    --i.PROMPT_SUBSTITUTION_10_YN      ,
    --i.PROMPT_SUBSTITUTION_11_YN      ,
    --i.PROMPT_SUBSTITUTION_12_YN      ,
    --i.PROMPT_SUBSTITUTION_13_YN      ,
    --i.PROMPT_SUBSTITUTION_14_YN      ,
    --i.PROMPT_SUBSTITUTION_15_YN      ,
    --i.PROMPT_SUBSTITUTION_16_YN      ,
    --i.PROMPT_SUBSTITUTION_17_YN      ,
    --i.PROMPT_SUBSTITUTION_18_YN      ,
    --i.PROMPT_SUBSTITUTION_19_YN      ,
    --i.PROMPT_SUBSTITUTION_20_YN      ,
    ----
    --i.PROMPT_IF_MULT_AUTH_YN         ,
    --i.PROMPT_BUILD_OPTIONS           ,
    --
    i.LAST_UPDATED_BY                ,
    i.LAST_UPDATED_ON                ,
    i.CREATED_BY                     ,
    i.CREATED_ON                     ,
    --
    --i.INSTALL_PROMPT_01              ,
    --i.INSTALL_PROMPT_02              ,
    --i.INSTALL_PROMPT_03              ,
    --i.INSTALL_PROMPT_04              ,
    --i.INSTALL_PROMPT_05              ,
    --i.INSTALL_PROMPT_06              ,
    --i.INSTALL_PROMPT_07              ,
    --i.INSTALL_PROMPT_08              ,
    --i.INSTALL_PROMPT_09              ,
    --i.INSTALL_PROMPT_10              ,
    --i.INSTALL_PROMPT_11              ,
    --i.INSTALL_PROMPT_12              ,
    --i.INSTALL_PROMPT_13              ,
    --i.INSTALL_PROMPT_14              ,
    --i.INSTALL_PROMPT_15              ,
    --i.INSTALL_PROMPT_16              ,
    --i.INSTALL_PROMPT_17              ,
    --i.INSTALL_PROMPT_18              ,
    --i.INSTALL_PROMPT_19              ,
    --i.INSTALL_PROMPT_20              ,
    i.CONFIGURATION_MESSAGE          ,
    -- obsolete i.TRIGGER_INSTALL_WHEN_COND      ,
    -- obsolete i.TRIGGER_INSTALL_WHEN_EXP1      ,
    -- obsolete i.TRIGGER_INSTALL_WHEN_EXP2      ,
    -- obsolete i.TRIGGER_FAILURE_MESSAGE        ,
    i.BUILD_OPTIONS_MESSAGE          ,
    i.REQUIRED_FREE_KB               ,
    i.REQUIRED_SYS_PRIVS             required_system_privileges,
    i.REQUIRED_NAMES_AVAILABLE       ,
    --
    i.id                             supporting_object_id
from wwv_flow_install i,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      f.id = i.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_SUPP_OBJ_BOPT" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"BUILD_OPTION",
"DEFAULT_STATUS",
"DEVELOPER_COMMENT",
"INSTALL_BUILD_OPTION_ID") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    (select patch_name
     from   wwv_flow_patches
     where  id=i.BUILD_OPT_ID)       build_option,
    --
    decode(
    (select patch_status
     from   wwv_flow_patches
     where  id=i.BUILD_OPT_ID),
     'INCLUDE','Include',
     'EXCLUDE','Exclude',
     i.BUILD_OPT_ID)                 default_status,
    --
    (select patch_comment
     from   wwv_flow_patches
     where  id=i.BUILD_OPT_ID)       developer_comment,
     i.id                            install_build_option_id
from wwv_flow_install_build_opt i,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      f.id = i.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_SUPP_OBJ_SCR" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"SCRIPT_NAME",
"EXECUTION_SEQUENCE",
"SCRIPT_TYPE",
"SQL_SCRIPT",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"CREATED_BY",
"CREATED_ON",
"SUPPORTING_OBJECT_SCRIPT_ID") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    i.NAME                           script_name,
    i.SEQUENCE                       execution_sequence,
    decode(i.SCRIPT_TYPE,
           'UPGRADE','Upgrade',
           'INSTALL','Install',
           i.SCRIPT_TYPE)            script_type,
    --
    i.SCRIPT                         sql_script,
    --
    nvl((select r from apex_standard_conditions where d = i.condition_type), i.condition_type) condition_type,
    i.CONDITION_TYPE                 condition_type_code,
    i.CONDITION                      condition_expression1,
    i.CONDITION2                     condition_expression2,
    --
    i.LAST_UPDATED_BY                last_updated_by,
    i.LAST_UPDATED_ON                last_updated_on,
    i.CREATED_BY                     created_by,
    i.CREATED_ON                     created_on,
    --
    i.ID                             supporting_object_script_id
from wwv_flow_install_scripts i,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      f.id = i.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_SUPP_OBJ_CHCK" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"CHECK_ID",
"CHECK_NAME",
"CHECK_SEQUENCE",
"CHECK_TYPE",
"CHECK_EXPRESSION1",
"CHECK_EXPRESSION2",
"ERROR_MESSAGE",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"CREATED_BY",
"CREATED_ON") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    c.ID                             check_id,
    c.NAME                           check_name,
    c.SEQUENCE                       check_sequence,
    --
    c.CHECK_TYPE                     check_type,
    c.CHECK_CONDITION                check_expression1,
    c.CHECK_CONDITION2               check_expression2,
    --
    --c.SUCCESS_MESSAGE                ,
    c.FAILURE_MESSAGE                error_message,
    --
    nvl((select r from apex_standard_conditions where d = c.condition_type), c.condition_type) condition_type,
    c.CONDITION_TYPE                 condition_type_code,
    c.CONDITION                      condition_expression1,
    c.CONDITION2                     condition_expression2,
    --
    c.LAST_UPDATED_BY                last_updated_by,
    c.LAST_UPDATED_ON                last_updated_on,
    c.CREATED_BY                     created_by,
    c.CREATED_ON                     created_on
from
     wwv_flow_install_checks c,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      f.id = c.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_TRANSLATIONS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"TRANSLATABLE_MESSAGE",
"LANGUAGE_CODE",
"MESSAGE_TEXT",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"DEVELOPER_COMMENT",
"TRANSLATION_ENTRY_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    t.NAME                           translatable_message,
    t.MESSAGE_LANGUAGE               language_code,
    --
    t.MESSAGE_TEXT                   message_text,
    t.LAST_UPDATED_BY                last_updated_by,
    t.LAST_UPDATED_ON                last_updated_on,
    t.MESSAGE_COMMENT                developer_comment,
    t.id                             translation_entry_id,
    t.name || ' l=' || t.message_language || ' m=' || substr(t.message_text, 1, 30) || length(t.message_text)
        as component_signature
from WWV_FLOW_MESSAGES$ t,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      f.id = t.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'))
  /* keep this not exists */
  and not exists ( select 1
                     from wwv_flow_language_map m
                    where m.translation_flow_id = f.id
                      and m.security_group_id   = f.security_group_id
                      and f.authentication_id   <> trunc(f.authentication_id) )
  and w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_ITEMS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"ITEM_NAME",
"SCOPE",
"DATA_TYPE",
"SESSION_STATE_PROTECTION",
"BUILD_OPTION",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"APPLICATION_ITEM_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.id                             application_id,
    f.name                           application_name,
    --
    i.name                           item_name,
    i.scope                          scope,
    --i.name_length
    i.data_type                      data_type,
    --i.is_persistent                  ,
    i.protection_level               session_state_protection,
    (select case when i.required_patch > 0 then patch_name else '{Not '||patch_name||'}' end patch_name
     from   wwv_flow_patches
     where  id =abs(i.required_patch))    build_option,
    i.last_updated_by                ,
    i.last_updated_on                ,
    i.item_comment                   component_comment,
    i.id                             application_item_id,
    --
    i.name
    ||' dt='||i.data_type
    ||' prot='||i.protection_level
    ||' bo='||(select patch_name
     from   wwv_flow_patches
     where  id =i.required_patch)
    component_signature
from wwv_flow_items i,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.provisioning_company_id) and
      f.security_group_id = w.provisioning_company_id and
      s.schema = f.owner and
      s.security_group_id = w.provisioning_company_id and
      f.id = i.flow_id and
      (d.sgid != 0 or nvl(f.build_status,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.provisioning_company_id != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PROCESSES" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PROCESS_SEQUENCE",
"PROCESS_POINT",
"PROCESS_TYPE",
"PROCESS_TYPE_CODE",
"PROCESS_NAME",
"PROCESS",
"ATTRIBUTE_01",
"ATTRIBUTE_02",
"ATTRIBUTE_03",
"ATTRIBUTE_04",
"ATTRIBUTE_05",
"ATTRIBUTE_06",
"ATTRIBUTE_07",
"ATTRIBUTE_08",
"ATTRIBUTE_09",
"ATTRIBUTE_10",
"ATTRIBUTE_11",
"ATTRIBUTE_12",
"ATTRIBUTE_13",
"ATTRIBUTE_14",
"ATTRIBUTE_15",
"ERROR_MESSAGE",
"ERROR_DISPLAY_LOCATION",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"BUILD_OPTION",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"APPLICATION_PROCESS_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    p.PROCESS_SEQUENCE               process_sequence,
    --
    decode(p.PROCESS_POINT,
      'BEFORE_HEADER','On Load: Before Header (page template header)',
      'AFTER_HEADER','On Load: After Header (page template header)',
      'BEFORE_BOX_BODY','On Load: Before Body Region(s)',
      'AFTER_BOX_BODY','On Load: After Body Region(s)',
      'BEFORE_FOOTER','On Load: Before Footer (page template footer)',
      'AFTER_FOOTER','On Load: After Footer (page template footer)',
      'ON_SUBMIT_BEFORE_COMPUTATION','On Submit: After Page Submission - Before Computations and Validations',
      'AFTER_SUBMIT','On Submit: After Page Submission - After Computations and Validations',
      'AFTER_AUTHENTICATION','On New Session: After Authentication',
      'ON_DEMAND','On Demand: Run this application process when requested by a page process',
      p.process_point)               process_point,
    --
    decode(p.PROCESS_TYPE,
      'PLSQL','PL/SQL Anonymous Block',
      p.PROCESS_TYPE)                process_type,
    p.process_type                   process_type_code,
    --
    p.PROCESS_NAME                   process_name,
    p.PROCESS_SQL_CLOB               process,
    p.attribute_01,
    p.attribute_02,
    p.attribute_03,
    p.attribute_04,
    p.attribute_05,
    p.attribute_06,
    p.attribute_07,
    p.attribute_08,
    p.attribute_09,
    p.attribute_10,
    p.attribute_11,
    p.attribute_12,
    p.attribute_13,
    p.attribute_14,
    p.attribute_15,
    p.PROCESS_ERROR_MESSAGE          error_message,
    p.error_display_location         error_display_location,
    --
    nvl((select r
    from apex_standard_conditions
    where d = p.PROCESS_WHEN_TYPE ),
    p.PROCESS_WHEN_TYPE)
                                     condition_type,
    p.process_when_type              condition_type_code,
    p.PROCESS_WHEN                   condition_expression1,
    p.PROCESS_WHEN2                  condition_expression2,
    --p.PROCESS_WHEN_TYPE2             ,
    --p.ITEM_NAME                      ,
    nvl((select case when p.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(p.REQUIRED_PATCH)),
     p.REQUIRED_PATCH)               build_option,
     --
     decode(substr(p.SECURITY_SCHEME,1,1),'!','Not ')||
     nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id)= ltrim(p.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     p.SECURITY_SCHEME)              authorization_scheme,
    p.SECURITY_SCHEME                authorization_scheme_id,
    p.LAST_UPDATED_BY                last_updated_by,
    p.LAST_UPDATED_ON                last_updated_on,
    p.PROCESS_COMMENT                component_comment,
    p.id                             application_process_id,
    --
    p.PROCESS_NAME
    ||' seq='||lpad(p.PROCESS_SEQUENCE,5,'00000')
    ||' '||p.PROCESS_POINT
    ||' '||decode(p.PROCESS_TYPE,'PLSQL','PL/SQL Anonymous Block',p.PROCESS_TYPE)
    ||' txt='||sys.dbms_lob.substr(p.PROCESS_SQL_CLOB,50,1)||sys.dbms_lob.getlength(p.PROCESS_SQL_CLOB)
    ||' m='||substr(p.PROCESS_ERROR_MESSAGE,1,30)||length(p.PROCESS_ERROR_MESSAGE)
    ||' cond='||p.PROCESS_WHEN_TYPE
    ||substr(p.PROCESS_WHEN,1,20)||length(p.PROCESS_WHEN)
    ||substr(p.PROCESS_WHEN2,1,20)||length(p.PROCESS_WHEN2)
    ||' b='||nvl((select name from    wwv_flow_security_schemes where   to_char(id)= abs(p.REQUIRED_PATCH) and flow_id = f.id),p.REQUIRED_PATCH)
    ||' s='||decode(substr(p.SECURITY_SCHEME,1,1),'!','Not ')||
     nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id)= ltrim(p.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     p.SECURITY_SCHEME)
    component_signature
from wwv_flow_processing p,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      f.id = p.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_COMPUTATIONS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"COMPUTATION_SEQUENCE",
"COMPUTATION_ITEM",
"COMPUTATION_POINT",
"COMPUTATION_TYPE",
"COMPUTATION",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"BUILD_OPTION",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"ERROR_MESSAGE",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"APPLICATION_COMPUTATION_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    c.COMPUTATION_SEQUENCE           computation_sequence,
    c.COMPUTATION_ITEM               computation_item,
    c.COMPUTATION_POINT              computation_point,
    --c.COMPUTATION_ITEM_TYPE
    c.COMPUTATION_TYPE               computation_type,
    --c.COMPUTATION_PROCESSED          computation_processed,
    c.COMPUTATION                    computation,
    --
    decode(substr(c.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id)= ltrim(c.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     c.SECURITY_SCHEME)              authorization_scheme,
    c.SECURITY_SCHEME                authorization_scheme_id,
    --
    nvl((select case when c.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(c.REQUIRED_PATCH)),
     c.REQUIRED_PATCH)               build_option,
    --
    nvl((select r from apex_standard_conditions where d = c.COMPUTE_WHEN_TYPE),c.COMPUTE_WHEN_TYPE)
                                     condition_type,
    c.compute_when_type              condition_type_code,
    c.COMPUTE_WHEN                   condition_expression1,
    c.COMPUTE_WHEN_TEXT              condition_expression2,
    --
    c.COMPUTATION_ERROR_MESSAGE      error_message,
    c.LAST_UPDATED_BY                last_updated_by,
    c.LAST_UPDATED_ON                last_updated_on,
    c.COMPUTATION_COMMENT            component_comment,
    c.id                             application_computation_id,
    --
    c.COMPUTATION_ITEM
    ||' seq='||lpad(c.COMPUTATION_SEQUENCE,5,'00000')
    ||' p='||c.COMPUTATION_POINT
    ||' t='||c.COMPUTATION_TYPE
    ||' c='||substr(c.COMPUTATION,1,50)||length(c.COMPUTATION)
    ||' s='||decode(substr(c.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id)= ltrim(c.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     c.SECURITY_SCHEME)
    ||' c='||c.COMPUTE_WHEN_TYPE
    ||substr(c.COMPUTE_WHEN,1,30)||length(c.COMPUTE_WHEN)
    ||substr(c.COMPUTE_WHEN_TEXT,1,30)||length(c.COMPUTE_WHEN_TEXT)
    ||' m='||substr(c.COMPUTATION_ERROR_MESSAGE,1,30)||length(c.COMPUTATION_ERROR_MESSAGE)
    component_signature
from wwv_flow_computations c,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = c.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_SHORTCUTS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"SHORTCUT_NAME",
"SHORTCUT_TYPE",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"ERROR_TEXT",
"BUILD_OPTION",
"SHORTCUT",
"IS_SUBSCRIBED",
"SUBSCRIBED_FROM",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENTS",
"SHORTCUT_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    s.SHORTCUT_NAME                  shortcut_name,
    --s.SHORTCUT_CONSIDERATION_SEQ     consideration_sequence,
    s.SHORTCUT_TYPE                  shortcut_type,
    nvl((select r from apex_standard_conditions where d = s.SHORTCUT_CONDITION_TYPE1),s.SHORTCUT_CONDITION_TYPE1)
                                     condition_type,
    s.shortcut_condition_type1       condition_type_code,
    s.SHORTCUT_CONDITION1            condition_expression1,
    --s.SHORTCUT_CONDITION_TYPE2       ,
    s.SHORTCUT_CONDITION2            condition_expression2,
    s.ERROR_TEXT                     error_text,
    (select case when s.build_option > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(s.BUILD_OPTION))      build_option,
    s.SHORTCUT                       shortcut,
    --
    decode(s.REFERENCE_ID,
    null,'No','Yes')                 is_subscribed,
    (select flow_id||'. '||name n
     from wwv_flow_shortcuts
     where id = s.reference_id)      subscribed_from,
    --
    s.LAST_UPDATED_BY                last_updated_by,
    s.LAST_UPDATED_ON                last_updated_on,
    s.COMMENTS                       component_comments,
    s.id                             shortcut_id,
    --
    s.SHORTCUT_NAME
    ||' '||s.SHORTCUT_TYPE
    ||' cond='||s.SHORTCUT_CONDITION_TYPE1
    ||substr(s.SHORTCUT_CONDITION1,1,30)||length(s.shortcut_condition1)||'.'
    ||substr(s.SHORTCUT_CONDITION2,1,30)||length(s.shortcut_condition2)
    ||' e='||substr(s.ERROR_TEXT,1,30)||length(s.ERROR_TEXT)
    ||' bo='||(select PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(s.BUILD_OPTION))
    ||' s='||sys.dbms_lob.substr(s.SHORTCUT,50,1)||sys.dbms_lob.getlength(s.SHORTCUT)
    ||' r='||decode(s.REFERENCE_ID,null,'No','Yes')
    component_signature
from wwv_flow_shortcuts s,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas ws,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (ws.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      ws.security_group_id = w.PROVISIONING_COMPANY_ID and
      ws.schema = f.owner and
      f.id = s.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_TREES" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"TREE_NAME",
"TREE_TYPE",
"TREE_QUERY",
"FLOW_ITEM",
"MAXIMUM_LEVELS",
"UNEXPANDED_PARENT",
"UNEXPANDED_PARENT_LAST",
"EXPANDED_PARENT",
"EXPANDED_PARENT_LAST",
"LEAF_NODE",
"LEAF_NODE_LAST",
"DRILL_UP",
"NAME_LINK_ANCHOR_TAG",
"NAME_LINK_NOT_ANCHOR_TAG",
"INDENT_VERTICAL_LINE",
"INDENT_VERTICAL_LINE_LAST",
"BEFORE_TREE",
"AFTER_TREE",
"LEVEL_1_TEMPLATE",
"LEVEL_2_TEMPLATE",
"LEVEL_3_TEMPLATE",
"LEVEL_4_TEMPLATE",
"LEVEL_5_TEMPLATE",
"LEVEL_6_TEMPLATE",
"LEVEL_7_TEMPLATE",
"LEVEL_8_TEMPLATE",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"APPLICATION_TREE_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    t.TREE_NAME                      tree_name,
    t.TREE_TYPE                      tree_type,
    t.TREE_QUERY                     tree_query,
    t.FLOW_ITEM                      ,
    t.MAX_LEVELS                     maximum_levels,
    t.UNEXPANDED_PARENT              ,
    t.UNEXPANDED_PARENT_LAST         ,
    t.EXPANDED_PARENT                ,
    t.EXPANDED_PARENT_LAST           ,
    t.LEAF_NODE                      ,
    t.LEAF_NODE_LAST                 ,
    t.DRILL_UP                       ,
    t.NAME_LINK_ANCHOR_TAG           ,
    t.NAME_LINK_NOT_ANCHOR_TAG       ,
    t.INDENT_VERTICAL_LINE           ,
    t.INDENT_VERTICAL_LINE_LAST      ,
    t.BEFORE_TREE                    ,
    t.AFTER_TREE                     ,
    t.LEVEL_1_TEMPLATE               ,
    t.LEVEL_2_TEMPLATE               ,
    t.LEVEL_3_TEMPLATE               ,
    t.LEVEL_4_TEMPLATE               ,
    t.LEVEL_5_TEMPLATE               ,
    t.LEVEL_6_TEMPLATE               ,
    t.LEVEL_7_TEMPLATE               ,
    t.LEVEL_8_TEMPLATE               ,
    --
    t.LAST_UPDATED_BY                last_updated_by,
    t.LAST_UPDATED_ON                last_updated_on,
    --
    t.TREE_COMMENT                   component_comment,
    t.id                             application_tree_id,
    --
    t.TREE_NAME
    ||' t='||t.TREE_TYPE
    ||substr(t.TREE_QUERY,1,50)||length(t.tree_query)
    ||' i='||t.FLOW_ITEM
    ||' l='||t.MAX_LEVELS
    ||'.'||length(t.UNEXPANDED_PARENT        )
    ||'.'||length(t.UNEXPANDED_PARENT_LAST   )
    ||'.'||length(t.EXPANDED_PARENT          )
    ||'.'||length(t.EXPANDED_PARENT_LAST     )
    ||'.'||length(t.LEAF_NODE                )
    ||'.'||length(t.LEAF_NODE_LAST           )
    ||'.'||length(t.DRILL_UP                 )
    ||'.'||length(t.NAME_LINK_ANCHOR_TAG     )
    ||'.'||length(t.NAME_LINK_NOT_ANCHOR_TAG )
    ||'.'||length(t.INDENT_VERTICAL_LINE     )
    ||'.'||length(t.INDENT_VERTICAL_LINE_LAST)
    ||'.'||length(t.BEFORE_TREE              )
    ||'.'||length(t.AFTER_TREE               )
    ||'.'||length(t.LEVEL_1_TEMPLATE         )
    ||'.'||length(t.LEVEL_2_TEMPLATE         )
    ||'.'||length(t.LEVEL_3_TEMPLATE         )
    ||'.'||length(t.LEVEL_4_TEMPLATE         )
    ||'.'||length(t.LEVEL_5_TEMPLATE         )
    ||'.'||length(t.LEVEL_6_TEMPLATE         )
    ||'.'||length(t.LEVEL_7_TEMPLATE         )
    ||'.'||length(t.LEVEL_8_TEMPLATE         )
    component_signature
from wwv_flow_trees t,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = t.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_TREES" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"REGION_ID",
"REGION_NAME",
"TREE_ID",
"TREE_QUERY",
"TREE_SOURCE",
"TREE_TEMPLATE",
"TREE_CLICK_ACTION",
"TREE_START_VALUE",
"TREE_START_ITEM",
"TREE_SELECTED_NODE",
"SHOW_HINTS",
"TREE_HINT_TEXT",
"TREE_HAS_FOCUS",
"TREE_BUTTON_OPTION",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    p.id                             page_id,
    p.name                           page_name,
    t.region_id                      region_id,
    (select plug_name
     from wwv_flow_page_plugs
     where id = t.region_id)         region_name,
    --
    t.id                             tree_id,
    t.TREE_QUERY                     tree_query,
    t.TREE_SOURCE                    tree_source,
    t.TREE_TEMPLATE                  tree_template,
    t.TREE_CLICK_ACTION              tree_click_action,
    t.TREE_START_VALUE               tree_start_value,
    t.TREE_START_ITEM                tree_start_item,
    t.TREE_SELECTED_NODE             tree_selected_node,
    t.SHOW_HINTS                     show_hints,
    t.TREE_HINT_TEXT                 tree_hint_text,
    t.TREE_HAS_FOCUS                 tree_has_focus,
    t.TREE_BUTTON_OPTION             tree_button_option,
    --
    t.LAST_UPDATED_BY                last_updated_by,
    t.LAST_UPDATED_ON                last_updated_on,
    --
    t.TREE_COMMENT                   component_comment,
    --
    p.NAME
    ||' t='||t.TREE_SOURCE
    ||substr(t.TREE_QUERY,1,50)||length(t.tree_query)
    ||' hints='||t.SHOW_HINTS||':'||t.TREE_HINT_TEXT
    ||' links='||t.TREE_CLICK_ACTION
    ||' start='||t.TREE_START_VALUE||':'||t.TREE_START_ITEM
    ||' attributes='||t.TREE_BUTTON_OPTION||':'||t.TREE_HAS_FOCUS||':'||t.TREE_TEMPLATE
    component_signature
from wwv_flow_tree_regions t,
     wwv_flow_steps p,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = p.security_group_id and
      f.id = p.flow_id and
      f.id = t.flow_id and
      p.id = t.page_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_NAV_BAR" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"DISPLAY_SEQUENCE",
"BEGINS_ON_NEW_LINE",
"CELL_COLUMN_SPAN",
"ICON_IMAGE",
"ICON_SUBTEXT",
"ICON_TARGET",
"ICON_IMAGE_ALT",
"ICON_HEIGHT",
"ICON_WIDTH",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"ONCLICK_JAVASCRIPT",
"BUILD_OPTION",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"IS_SUBSCRIBED",
"SUBSCRIBED_FROM",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"NAV_BAR_ID",
"IS_FEEDBACK_LINK",
"REFERENCED_NAV_BAR_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    n.ICON_SEQUENCE                  display_sequence,
    decode(n.BEGINS_ON_NEW_LINE,
       'YES','Yes',
       'NO','No',
       n.BEGINS_ON_NEW_LINE)         begins_on_new_line,
    n.CELL_COLSPAN                   cell_column_span,
    --
    n.ICON_IMAGE                     ,
    --n.ICON_IMAGE2                    ,
    --n.ICON_IMAGE3                    ,
    n.ICON_SUBTEXT                   ,
    --n.ICON_SUBTEXT2                  ,
    --n.ICON_SUBTEXT3                  ,
    n.ICON_TARGET                    ,
    n.ICON_IMAGE_ALT                 ,
    n.ICON_HEIGHT                    ,
    n.ICON_WIDTH                     ,
    --n.ICON_HEIGHT2                   ,
    --n.ICON_WIDTH2                    ,
    --n.ICON_HEIGHT3                   ,
    --n.ICON_WIDTH3                    ,
    --
    nvl((select r from apex_standard_conditions where d = n.ICON_BAR_DISP_COND_TYPE),n.ICON_BAR_DISP_COND_TYPE)
                                     condition_type,
    n.icon_bar_disp_cond_type        condition_type_code,
    n.ICON_BAR_DISP_COND             condition_expression1,
    n.ICON_BAR_FLOW_COND_INSTR       condition_expression2,
    --
    n.ONCLICK                        onclick_javascript,
    --
    (select case when n.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(n.REQUIRED_PATCH))    build_option,
     --
    decode(substr(n.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id)= ltrim(n.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     n.SECURITY_SCHEME)              authorization_scheme,
    n.SECURITY_SCHEME                authorization_scheme_id,
    --
    decode(n.REFERENCE_ID,
    null,'No','Yes')                 is_subscribed,
    (select flow_id||'. '||name n
     from wwv_flow_icon_bar
     where id = n.reference_id)      subscribed_from,
    --
    n.LAST_UPDATED_BY                last_updated_by,
    n.LAST_UPDATED_ON                last_updated_on,
    n.ICON_BAR_COMMENT               component_comment,
    n.id                             nav_bar_id,
    decode(n.nav_entry_is_feedback_yn,'Y','Yes','No') is_feedback_link,
    n.REFERENCE_ID                   referenced_nav_bar_id,
    --
    lpad(n.ICON_SEQUENCE,5,'00000')
    ||decode(n.BEGINS_ON_NEW_LINE,
       'YES','Yes',
       'NO','No',
       n.BEGINS_ON_NEW_LINE)
    ||n.CELL_COLSPAN
    ||' img='||n.ICON_IMAGE
    ||' '||substr(n.ICON_SUBTEXT,1,30)||length(n.ICON_SUBTEXT)
    ||' t='||substr(n.ICON_TARGET,1,30)||length(n.ICON_TARGET)
    ||' a='||substr(n.ICON_IMAGE_ALT,1,20)||length(n.ICON_IMAGE_ALT)
    ||n.ICON_HEIGHT
    ||n.ICON_WIDTH
    ||' c='||n.ICON_BAR_DISP_COND_TYPE
    ||substr(n.ICON_BAR_DISP_COND,1,30)||length(n.ICON_BAR_DISP_COND)
    ||substr(n.ICON_BAR_FLOW_COND_INSTR,1,30)||length(n.ICON_BAR_FLOW_COND_INSTR)
    ||' ck='||substr(n.ONCLICK,1,20)||length(n.onclick)
    ||' bo='||
    (select PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(n.REQUIRED_PATCH))
    ||' a='||decode(substr(n.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id)= ltrim(n.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     n.SECURITY_SCHEME)
    ||' s='||decode(n.REFERENCE_ID,
    null,'No','Yes')
    component_signature
from wwv_flow_icon_bar n,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = n.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_LOVS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"LIST_OF_VALUES_NAME",
"LOV_TYPE",
"LIST_OF_VALUES_QUERY",
"LOV_ENTRIES",
"IS_SUBSCRIBED",
"SUBSCRIBED_FROM",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"LOV_ID",
"REFERENCED_LOV_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    l.LOV_NAME                       list_of_values_name,
    --
    decode(substr(l.lov_query,1,1),
    '.','Static','Dynamic')          lov_type,
    decode(substr(l.lov_query,1,1),
    '.',null,l.LOV_QUERY)
                                     list_of_values_query,
    (select count(*)
    from wwv_flow_list_of_values_data
    where flow_id = f.id and
          lov_id = l.id)             lov_entries,
    --
    decode(l.REFERENCE_ID,null,'No','Yes')
                                     is_subscribed,
    (select flow_id||'. '||name n
     from wwv_flow_lists_of_values$
     where id = l.reference_id)      subscribed_from,
    --
    l.LAST_UPDATED_BY                last_updated_by,
    l.LAST_UPDATED_ON                last_updated_on,
    l.LOV_COMMENT                    component_comment,
    --
    l.ID                             lov_id,
    l.REFERENCE_ID                   referenced_lov_id,
    --
    l.LOV_NAME
    ||' t='||decode(substr(l.lov_query,1,1),'.','Static','Dynamic')
    ||' q='||decode(substr(l.lov_query,1,1),'.',null,substr(l.LOV_QUERY,1,30)||length(l.LOV_QUERY))
    ||' ref='||decode(l.REFERENCE_ID,null,'No','Yes')
    component_signature
from wwv_flow_lists_of_values$ l,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = l.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_LOV_ENTRIES" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"LIST_OF_VALUES_NAME",
"DISPLAY_SEQUENCE",
"DISPLAY_VALUE",
"RETURN_VALUE",
"LOV_ENTRY_TEMPLATE",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"BUILD_OPTION",
"PRIMARY_APPLICATION_ID",
"TRANSLATED_APP_LANGUAGE",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"LOV_ID",
"LOV_ENTRY_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    (select lov_name from wwv_flow_lists_of_values$ where id = l.lov_id) list_of_values_name,
    l.LOV_DISP_SEQUENCE              display_sequence,
    l.LOV_DISP_VALUE                 display_value,
    l.LOV_RETURN_VALUE               return_value,
    --
    l.LOV_TEMPLATE                   lov_entry_template,
    -- conditionality
    nvl((select r from apex_standard_conditions where d = l.LOV_DISP_COND_TYPE),l.LOV_DISP_COND_TYPE)
                                     condition_type,
    l.lov_disp_cond_type             condition_type_code,
    l.LOV_DISP_COND                  condition_expression1,
    l.LOV_DISP_COND2                 condition_expression2,
    (select case when l.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(l.REQUIRED_PATCH))    build_option,
    --
    -- translation columns
    nvl((select PRIMARY_APPLICATION_ID
     from   APEX_APPLICATION_TRANS_MAP
     where  f.id = TRANSLATED_APPLICATION_ID),f.id) primary_application_id,
    lower(substr(nvl((select TRANSLATED_APP_LANGUAGE
     from   APEX_APPLICATION_TRANS_MAP
     where  f.id = TRANSLATED_APPLICATION_ID),f.FLOW_LANGUAGE),1,2)) TRANSLATED_APP_LANGUAGE,
    --
    l.LAST_UPDATED_BY                last_updated_by,
    l.LAST_UPDATED_ON                last_updated_on,
    l.LOV_DATA_COMMENT               component_comment,
    --
    l.LOV_ID                         lov_id,
    l.id                             lov_entry_id,
    --
    (select lov_name from wwv_flow_lists_of_values$ where id = l.lov_id)
    ||' seq='||lpad(l.LOV_DISP_SEQUENCE,5,'00000')
    ||' v='||substr(l.LOV_DISP_VALUE,1,30)||length(l.LOV_DISP_VALUE)
    ||' r='||substr(l.LOV_RETURN_VALUE,1,30)||length(l.LOV_RETURN_VALUE)
    ||' t='||l.LOV_TEMPLATE
    ||' cond='||l.LOV_DISP_COND_TYPE
    ||substr(l.LOV_DISP_COND,1,30)||length(l.LOV_DISP_COND)
    ||substr(l.LOV_DISP_COND2,1,30)||length(l.LOV_DISP_COND2)
    ||' bo='||(select PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(l.REQUIRED_PATCH))
    component_signature
from wwv_flow_list_of_values_data l,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = l.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_AUTH" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"IS_CURRENT_AUTHENTICATION",
"IS_SUBSCRIBED",
"SCHEME_TYPE",
"SCHEME_TYPE_CODE",
"AUTHENTICATION_SCHEME_NAME",
"INVALID_SESSION_TYPE",
"INVALID_SESSION_URL",
"PLSQL_CODE",
"VERIFICATION_FUNCTION",
"PRE_AUTHENTICATION_PROCESS",
"POST_AUTHENTICATION_PROCESS",
"COOKIE_NAME",
"COOKIE_PATH",
"COOKIE_DOMAIN",
"COOKIE_SECURE",
"LOGOUT_URL",
"ATTRIBUTE_01",
"ATTRIBUTE_02",
"ATTRIBUTE_03",
"ATTRIBUTE_04",
"ATTRIBUTE_05",
"ATTRIBUTE_06",
"ATTRIBUTE_07",
"ATTRIBUTE_08",
"ATTRIBUTE_09",
"ATTRIBUTE_10",
"ATTRIBUTE_11",
"ATTRIBUTE_12",
"ATTRIBUTE_13",
"ATTRIBUTE_14",
"ATTRIBUTE_15",
"HELP_TEXT",
"COMMENTS",
"AUTHENTICATION_SCHEME_ID",
"REFERENCED_SCHEMA_ID",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"CREATED_BY",
"CREATED_ON",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.id                             application_id,
    f.name                           application_name,
    --
    case
      when f.authentication_id = a.id then 'Y'
      else 'N'
    end                              is_current_authentication,
    decode(a.reference_id,
      null,'No','Yes')               is_subscribed,
    case substr(a.scheme_type, 1, 7)
      when 'NATIVE_' then
          ( select display_name
              from wwv_flow_plugins
             where flow_id = 4411
               and plugin_type = 'AUTHENTICATION TYPE'
               and name = substr(a.scheme_type, 8) )
      when 'PLUGIN_' then
          ( select display_name
              from wwv_flow_plugins
             where flow_id = a.flow_id
               and plugin_type = 'AUTHENTICATION TYPE'
               and name = substr(a.scheme_type, 8) )
      else a.scheme_type
    end                              scheme_type,
    a.scheme_type                    scheme_type_code,
    a.name                           authentication_scheme_name,
    --
    a.invalid_session_type           invalid_session_type,
    a.invalid_session_url            invalid_session_url,
    --
    a.plsql_code                     plsql_code,
    a.verification_function          verification_function,
    a.pre_auth_process               pre_authentication_process,
    a.post_auth_process              post_authentication_process,
    --
    a.cookie_name                    cookie_name,
    a.cookie_path                    cookie_path,
    a.cookie_domain                  cookie_domain,
    decode(a.use_secure_cookie_yn,'Y','Yes','N','No','No') cookie_secure,
    --
    a.logout_url                     logout_url,
    --
    a.attribute_01                   attribute_01,
    a.attribute_02                   attribute_02,
    a.attribute_03                   attribute_03,
    a.attribute_04                   attribute_04,
    a.attribute_05                   attribute_05,
    a.attribute_06                   attribute_06,
    a.attribute_07                   attribute_07,
    a.attribute_08                   attribute_08,
    a.attribute_09                   attribute_09,
    a.attribute_10                   attribute_10,
    a.attribute_11                   attribute_11,
    a.attribute_12                   attribute_12,
    a.attribute_13                   attribute_13,
    a.attribute_14                   attribute_14,
    a.attribute_15                   attribute_15,
    --
    a.help_text                      help_text,
    a.comments                       comments,
    --
    a.id                             authentication_scheme_id,
    a.reference_id                   referenced_schema_id,
    --
    a.last_updated_by                last_updated_by,
    a.last_updated_on                last_updated_on,
    a.created_by                     created_by,
    a.created_on                     created_on,
    --
    a.name
    || ' '                                       || a.scheme_type
    || ' '                                       || decode(a.reference_id,null,'No','Yes')
    || substr(a.invalid_session_type ,1,20)      || length(a.invalid_session_type )         || '.'
    || substr(a.invalid_session_url ,1,20)       || length(a.invalid_session_url )          || '.'
    || sys.dbms_lob.substr(a.pre_auth_process,20,1)  || sys.dbms_lob.getlength(a.pre_auth_process)  || '.'
    || sys.dbms_lob.substr(a.post_auth_process,20,1) || sys.dbms_lob.getlength(a.post_auth_process) || '.'
    || substr(a.cookie_name         ,1,20)       || length(a.cookie_name         )          || '.'
    || substr(a.cookie_path         ,1,20)       || length(a.cookie_path         )          || '.'
    || substr(a.cookie_domain       ,1,20)       || length(a.cookie_domain       )          || '.'
    || substr(a.use_secure_cookie_yn,1,1)        || length(a.use_secure_cookie_yn)          || '.'
    || substr(a.attribute_01        ,1,20)       || length(a.attribute_01        )          || '.'
    || substr(a.attribute_02        ,1,20)       || length(a.attribute_02        )          || '.'
    || substr(a.attribute_03        ,1,20)       || length(a.attribute_03        )          || '.'
    || substr(a.attribute_04        ,1,20)       || length(a.attribute_04        )          || '.'
    || substr(a.attribute_05        ,1,20)       || length(a.attribute_05        )          || '.'
    || substr(a.attribute_06        ,1,20)       || length(a.attribute_06        )          || '.'
    || substr(a.attribute_07        ,1,20)       || length(a.attribute_07        )          || '.'
    || substr(a.attribute_08        ,1,20)       || length(a.attribute_08        )          || '.'
    || substr(a.attribute_09        ,1,20)       || length(a.attribute_09        )          || '.'
    || substr(a.attribute_10        ,1,20)       || length(a.attribute_10        )          || '.'
    || substr(a.attribute_11        ,1,20)       || length(a.attribute_11        )          || '.'
    || substr(a.attribute_12        ,1,20)       || length(a.attribute_12        )          || '.'
    || substr(a.attribute_13        ,1,20)       || length(a.attribute_13        )          || '.'
    || substr(a.attribute_14        ,1,20)       || length(a.attribute_14        )          || '.'
    || substr(a.attribute_15        ,1,20)       || length(a.attribute_15        )
    component_signature
from wwv_flow_authentications a,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu
    or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
    or d.sgid              = w.PROVISIONING_COMPANY_ID)
   and f.security_group_id = w.provisioning_company_id
   and s.security_group_id = w.provisioning_company_id
   and s.schema = f.owner
   and f.id = a.flow_id
   and (d.sgid != 0 or nvl(f.build_status,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'))
   and w.provisioning_company_id != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_AUTHORIZATION" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"AUTHORIZATION_SCHEME_NAME",
"SCHEME_TYPE",
"SCHEME_TYPE_CODE",
"ATTRIBUTE_01",
"ATTRIBUTE_02",
"ATTRIBUTE_03",
"ATTRIBUTE_04",
"ATTRIBUTE_05",
"ATTRIBUTE_06",
"ATTRIBUTE_07",
"ATTRIBUTE_08",
"ATTRIBUTE_09",
"ATTRIBUTE_10",
"ATTRIBUTE_11",
"ATTRIBUTE_12",
"ATTRIBUTE_13",
"ATTRIBUTE_14",
"ATTRIBUTE_15",
"ERROR_MESSAGE",
"CACHING",
"IS_SUBSCRIBED",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"AUTHORIZATION_SCHEME_ID",
"REFERENCED_SCHEME_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    a.NAME                           authorization_scheme_name,
    case substr(a.scheme_type, 1, 7)
      when 'NATIVE_' then
          ( select display_name from wwv_flow_plugins where flow_id = 4411 and plugin_type = 'AUTHORIZATION TYPE' and name = substr(a.scheme_type, 8) )
      when 'PLUGIN_' then
          ( select display_name from wwv_flow_plugins where flow_id = a.flow_id and plugin_type = 'AUTHORIZATION TYPE' and name = substr(a.scheme_type, 8) )
      else a.scheme_type
    end                              scheme_type,
    a.SCHEME_TYPE                    scheme_type_code,
    a.attribute_01,
    a.attribute_02,
    a.attribute_03,
    a.attribute_04,
    a.attribute_05,
    a.attribute_06,
    a.attribute_07,
    a.attribute_08,
    a.attribute_09,
    a.attribute_10,
    a.attribute_11,
    a.attribute_12,
    a.attribute_13,
    a.attribute_14,
    a.attribute_15,
    --
    a.ERROR_MESSAGE                  error_message,
    --
    decode(a.CACHING,
      'BY_USER_BY_PAGE_VIEW','Once per page view',
      'BY_USER_BY_SESSION','Once per session',
      a.CACHING)                     caching,
    decode(a.REFERENCE_ID,null,'No','Yes') is_subscribed,
    a.LAST_UPDATED_BY                last_updated_by,
    a.LAST_UPDATED_ON                last_updated_on,
    a.COMMENTS                       component_comment,
    --
    a.id                             authorization_scheme_id,
    a.REFERENCE_ID                   referenced_scheme_id,
    --
    substr(a.NAME,1,30)||length(a.NAME         )
    ||' t='||substr(a.SCHEME_TYPE  ,1,30)||length(a.SCHEME_TYPE  )
    ||' e='||substr(a.ERROR_MESSAGE,1,30)||length(a.ERROR_MESSAGE)
    ||' s='||decode(a.CACHING,'BY_USER_BY_PAGE_VIEW','Once per page view','BY_USER_BY_SESSION','Once per session',substr(a.CACHING,1,20))
    ||' r='||decode(a.REFERENCE_ID,null,'No','Yes')
    component_signature
from WWV_FLOW_SECURITY_SCHEMES a,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = a.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_WEB_SERVICES" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"WEB_SERVICE_NAME",
"URL",
"ACTION",
"PROXY_OVERRIDE",
"SOAP_VERSION",
"SOAP_ENVELOPE",
"FLOW_ITEMS_COMMA_DELIMITED",
"STATIC_PARM_01",
"STATIC_PARM_02",
"STATIC_PARM_03",
"STATIC_PARM_04",
"STATIC_PARM_05",
"STATIC_PARM_06",
"STATIC_PARM_07",
"STATIC_PARM_08",
"STATIC_PARM_09",
"STATIC_PARM_10",
"STYLESHEET",
"IS_SUBSCRIBED",
"SUBSCRIBED_FROM",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"WEB_SERVICE_ID",
"COMPONENT_SIGNATURE") AS
  select
    ws.short_name                          workspace,
    ws.display_name                         workspace_display_name,
    f.ID                                   application_id,
    f.NAME                                 application_name,
    --
    w.NAME                                 web_service_name,
    w.URL                                  ,
    w.ACTION                               ,
    w.PROXY_OVERRIDE                       ,
    w.soap_version                         ,
    w.SOAP_ENVELOPE                        ,
    w.FLOW_ITEMS_COMMA_DELIMITED           ,
    w.STATIC_PARM_01                       ,
    w.STATIC_PARM_02                       ,
    w.STATIC_PARM_03                       ,
    w.STATIC_PARM_04                       ,
    w.STATIC_PARM_05                       ,
    w.STATIC_PARM_06                       ,
    w.STATIC_PARM_07                       ,
    w.STATIC_PARM_08                       ,
    w.STATIC_PARM_09                       ,
    w.STATIC_PARM_10                       ,
    w.STYLESHEET                           ,
    --
    decode(w.REFERENCE_ID,
        null,'No','Yes')                   is_subscribed,
    (select flow_id||'. '||name n
     from wwv_flow_shared_web_services
     where id = w.id)                      subscribed_from,
    --
    w.LAST_UPDATED_BY                      last_updated_by,
    w.LAST_UPDATED_ON                      last_updated_on,
    --
    w.id                                   web_service_id,
    --
    substr(w.name, 1, 30) || length(w.name) ||
    ' u=' || substr(w.url, 1, 30) || length(w.url) ||
    ' a=' || substr(w.action, 1, 30) || ' sv=' || w.soap_version ||
    ' p1=' || substr(w.static_parm_01, 1, 30) || length(w.static_parm_01) ||
    ' p2=' || substr(w.static_parm_02, 1, 30) || length(w.static_parm_02) ||
    ' p3=' || substr(w.static_parm_03, 1, 30) || length(w.static_parm_03)
    as component_signature
from wwv_flow_shared_web_services w,
     wwv_flows f,
     wwv_flow_companies ws,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = ws.PROVISIONING_COMPANY_ID) and
      f.security_group_id = ws.PROVISIONING_COMPANY_ID and
      s.security_group_id = ws.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = w.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      ws.PROVISIONING_COMPANY_ID != 0 and
      (user in ('SYS','SYSTEM', 'APEX_040200') or ws.PROVISIONING_COMPANY_ID != 10);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_BREADCRUMBS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"BREADCRUMB_NAME",
"BREADCRUMB_ENTRIES",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"BREADCRUMB_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    m.NAME                           breadcrumb_name,
    --
    (select count(*) from wwv_flow_menu_options where menu_id = m.id) breadcrumb_entries,
    --
    m.LAST_UPDATED_BY                last_updated_by,
    m.LAST_UPDATED_ON                last_updated_on,
    m.MENU_COMMENT                   component_comment,
    m.id                             breadcrumb_id,
    --
    m.NAME
    component_signature
from wwv_flow_menus m,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = m.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_BC_ENTRIES" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PARENT_BREADCRUMB_ID",
"BREADCRUMB_ID",
"ENTRY_LABEL",
"ENTRY_LONG_LABEL",
"URL",
"DEFINED_FOR_PAGE",
"CURRENT_FOR_PAGES",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"BUILD_OPTION",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"BREADCRUMB_ENTRY_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    m.PARENT_ID                      parent_breadcrumb_id,
    m.MENU_ID                        breadcrumb_id,
    --m.OPTION_SEQUENCE                display_sequence,
    m.SHORT_NAME                     entry_label,
    m.LONG_NAME                      entry_long_label,
    m.LINK                           url,
    m.PAGE_ID                        defined_for_page,
    m.ALSO_CURRENT_FOR_PAGES         current_for_pages,
    --
    nvl((select r from apex_standard_conditions where d = m.DISPLAY_WHEN_COND_TYPE),m.DISPLAY_WHEN_COND_TYPE)
                                     condition_type,
    m.display_when_cond_type         condition_type_code,
    m.DISPLAY_WHEN_CONDITION         condition_expression1,
    m.DISPLAY_WHEN_CONDITION2        condition_expression2,
    --
    decode(substr(m.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from    wwv_flow_security_schemes
     where   to_char(id)= ltrim(m.SECURITY_SCHEME,'!')
     and     flow_id = f.id),
     m.SECURITY_SCHEME)              authorization_scheme,
    m.SECURITY_SCHEME                authorization_scheme_id,
     --
    (select case when m.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(m.REQUIRED_PATCH) )   build_option,
    m.LAST_UPDATED_BY                last_updated_by,
    m.LAST_UPDATED_ON                last_updated_on,
    m.MENU_OPTION_COMMENT            component_comment,
    m.id                             breadcrumb_entry_id,
    --
    substr(m.SHORT_NAME,1,30)||length(m.SHORT_NAME)
    ||substr(m.LONG_NAME,1,30)||length(m.LONG_NAME)
    ||' l='||substr(m.LINK,1,30)||length(m.LINK)
    ||' p='||PAGE_ID
    ||' c='||substr(m.ALSO_CURRENT_FOR_PAGES,1,30)||length(m.ALSO_CURRENT_FOR_PAGES)
    ||' cond='||m.DISPLAY_WHEN_COND_TYPE
    ||substr(m.DISPLAY_WHEN_CONDITION,1,30)||length(m.DISPLAY_WHEN_CONDITION)
    ||substr(m.DISPLAY_WHEN_CONDITION2,1,30)||length(m.DISPLAY_WHEN_CONDITION2)
    ||' sec='||decode(substr(m.SECURITY_SCHEME,1,1),'!','Not ')||
      nvl((select name from wwv_flow_security_schemes where   to_char(id)= ltrim(m.SECURITY_SCHEME,'!') and flow_id = f.id), m.SECURITY_SCHEME)
    ||' bo='||(select PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(m.REQUIRED_PATCH) )
    component_signature
from wwv_flow_menu_options m,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = m.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_LISTS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"LIST_NAME",
"LIST_TYPE",
"LIST_TYPE_CODE",
"LIST_QUERY",
"BUILD_OPTION",
"LIST_ENTRIES",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"LIST_ID",
"COMPONENT_SIGNATURE",
"TEMPLATE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    l.NAME                           list_name,
    decode(l.list_type,null,'Static',
                      'STATIC','Static',
                      'SQL_QUERY','SQL Query',
                      'FUNCTION_RETURNING_SQL_QUERY','Function Returning SQL Query') list_type,
    decode(l.list_type,null,'STATIC',l.list_type) list_type_code,
    l.list_query                     list_query,
    --l.LIST_STATUS                    list_status,
    --l.LIST_DISPLAYED,
    (select case when l.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(l.REQUIRED_PATCH))    build_option,
    (select count(*) from wwv_flow_list_items where list_id = l.id) list_entries,
    --
    l.LAST_UPDATED_BY                last_updated_by,
    l.LAST_UPDATED_ON                last_updated_on,
    l.LIST_COMMENT                   component_comment,
    l.ID                             list_id,
    --
    l.NAME
    ||' s='||l.LIST_STATUS
    ||' bo='||(select PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(l.REQUIRED_PATCH))
    component_signature,
    --
    -- For compatibility with SQL Developer
    to_char(null) template
from wwv_flow_lists l,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = l.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_LIST_ENTRIES" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"LIST_NAME",
"PARENT_ENTRY_TEXT",
"DISPLAY_SEQUENCE",
"ENTRY_TEXT",
"ENTRY_TARGET",
"ENTRY_IMAGE",
"ENTRY_IMAGE_ATTRIBUTES",
"ENTRY_IMAGE_ALT_ATTRIBUTE",
"CURRENT_FOR_PAGES_TYPE",
"CURRENT_FOR_PAGES_TYPE_CODE",
"CURRENT_FOR_PAGES_EXPRESSION",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"COUNT_CLICKS",
"CLICK_COUNT_CATEGORY",
"ENTRY_ATTRIBUTE_01",
"ENTRY_ATTRIBUTE_02",
"ENTRY_ATTRIBUTE_03",
"ENTRY_ATTRIBUTE_04",
"ENTRY_ATTRIBUTE_05",
"ENTRY_ATTRIBUTE_06",
"ENTRY_ATTRIBUTE_07",
"ENTRY_ATTRIBUTE_08",
"ENTRY_ATTRIBUTE_09",
"ENTRY_ATTRIBUTE_10",
"TRANSLATE_ATTRIBUTES",
"BUILD_OPTION",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"PRIMARY_APPLICATION_ID",
"TRANSLATED_APP_LANGUAGE",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_COMMENT",
"LIST_ID",
"LIST_ENTRY_PARENT_ID",
"LIST_ENTRY_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    l.NAME                           list_name,
    --
    --e.SUB_ITEM_COUNT                 ,
    --e.PARENT_LIST_ITEM_ID            ,
    (select list_item_link_text
     from   wwv_flow_list_items
     where  id = e.PARENT_LIST_ITEM_ID and
            flow_id = e.flow_id)     parent_entry_text,
    --e.LIST_ITEM_TYPE                 ,
    --e.LIST_ITEM_STATUS               ,
    --e.ITEM_DISPLAYED                 ,
    e.LIST_ITEM_DISPLAY_SEQUENCE     display_sequence,
    e.LIST_ITEM_LINK_TEXT            entry_text,
    e.LIST_ITEM_LINK_TARGET          entry_target,
    --
    e.LIST_ITEM_ICON                 entry_image,
    e.LIST_ITEM_ICON_ATTRIBUTES      entry_image_attributes,
    e.LIST_ITEM_ICON_ALT_ATTRIBUTE   entry_image_alt_attribute,
    --e.LIST_ITEM_ICON_EXP             ,
    --e.LIST_ITEM_ICON_EXP_ATTR        ,
    --e.LIST_ITEM_OWNER                ,
    --
    decode(e.LIST_ITEM_CURRENT_TYPE,
      'ALWAYS',                      'Always',
      'COLON_DELIMITED_PAGE_LIST',   'Colon Delimited Page List',
      'EXISTS',                      'Exists SQL Query',
      'NEVER',                       'Never',
      'NOT_EXISTS',                  'Not Exists SQL Query',
      'PLSQL_EXPRESSION',            'PL/SQL Expression',
      'PAGE_RANGE',                  'Page Range (X-Y)',
      e.LIST_ITEM_CURRENT_TYPE)      current_for_pages_type,
    e.list_item_current_type         current_for_pages_type_code,
    e.LIST_ITEM_CURRENT_FOR_PAGES    current_for_pages_expression,
    --
    nvl((select r from apex_standard_conditions where d = e.LIST_ITEM_DISP_COND_TYPE),e.LIST_ITEM_DISP_COND_TYPE)
                                     condition_type,
    e.list_item_disp_cond_type       condition_type_code,
    e.LIST_ITEM_DISP_CONDITION       condition_expression1,
    --e.LIST_ITEM_DISP_COND_TYPE2      ,
    e.LIST_ITEM_DISP_CONDITION2      condition_expression2,
    --
    decode(e.LIST_COUNTCLICKS_Y_N,
      'Y','Yes','N','No',
      e.LIST_COUNTCLICKS_Y_N)        count_clicks,
    e.LIST_COUNTCLICKS_CAT           click_count_category,
    --
    e.LIST_TEXT_01                   entry_attribute_01,
    e.LIST_TEXT_02                   entry_attribute_02,
    e.LIST_TEXT_03                   entry_attribute_03,
    e.LIST_TEXT_04                   entry_attribute_04,
    e.LIST_TEXT_05                   entry_attribute_05,
    e.LIST_TEXT_06                   entry_attribute_06,
    e.LIST_TEXT_07                   entry_attribute_07,
    e.LIST_TEXT_08                   entry_attribute_08,
    e.LIST_TEXT_09                   entry_attribute_09,
    e.LIST_TEXT_10                   entry_attribute_10,
    e.translate_list_text_y_n        translate_attributes,
    --e.LIST_TEXT_11                   entry_attribute_11,
    --e.LIST_TEXT_12                   entry_attribute_12,
    --e.LIST_TEXT_13                   entry_attribute_13,
    --e.LIST_TEXT_14                   entry_attribute_14,
    --e.LIST_TEXT_15                   entry_attribute_15,
    --e.LIST_TEXT_16                   entry_attribute_16,
    --e.LIST_TEXT_17                   entry_attribute_17,
    --e.LIST_TEXT_18                   entry_attribute_18,
    --e.LIST_TEXT_19                   entry_attribute_19,
    --e.LIST_TEXT_20                   entry_attribute_20,
    --
    (select case when e.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(e.REQUIRED_PATCH))    build_option,
    --
    decode(substr(e.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from   wwv_flow_security_schemes
     where  to_char(id) = ltrim(e.SECURITY_SCHEME,'!')
     and    flow_id = f.id),
     e.SECURITY_SCHEME)              authorization_scheme,
    e.SECURITY_SCHEME                authorization_scheme_id,
    --
    -- translation columns
    nvl((select PRIMARY_APPLICATION_ID
     from   APEX_APPLICATION_TRANS_MAP
     where  f.id = TRANSLATED_APPLICATION_ID),f.id) primary_application_id,
    lower(substr(nvl((select TRANSLATED_APP_LANGUAGE
     from   APEX_APPLICATION_TRANS_MAP
     where  f.id = TRANSLATED_APPLICATION_ID),f.FLOW_LANGUAGE),1,2)) TRANSLATED_APP_LANGUAGE,
    --
    e.LAST_UPDATED_BY                last_updated_by,
    e.LAST_UPDATED_ON                last_updated_on,
    e.LIST_ITEM_COMMENT              component_comment,
    e.list_id                        list_id,
    e.PARENT_LIST_ITEM_ID            list_entry_parent_id,
    e.id                             list_entry_id,
    --
    l.NAME
    ||' p='||(select list_item_link_text from wwv_flow_list_items where  id = e.PARENT_LIST_ITEM_ID and flow_id = e.flow_id)
    ||' '||lpad(e.LIST_ITEM_DISPLAY_SEQUENCE,5,'00000')
    ||' '||substr(e.LIST_ITEM_LINK_TEXT      ,1,30)
    ||' '||substr(e.LIST_ITEM_LINK_TARGET    ,1,30)||length(e.LIST_ITEM_LINK_TARGET)
    ||' '||substr(e.LIST_ITEM_ICON           ,1,30)
    ||' '||substr(e.LIST_ITEM_ICON_ATTRIBUTES,1,30)||length(e.LIST_ITEM_ICON_ATTRIBUTES)
    ||' '||decode(e.LIST_ITEM_CURRENT_TYPE,
      'ALWAYS',                      'Always',
      'COLON_DELIMITED_PAGE_LIST',   'Colon Delimited Page List',
      'EXISTS',                      'Exists SQL Query',
      'NEVER',                       'Never',
      'NOT_EXISTS',                  'Not Exists SQL Query',
      'PLSQL_EXPRESSION',            'PL/SQL Expression',
      e.LIST_ITEM_CURRENT_TYPE)
    ||' '||substr(e.LIST_ITEM_CURRENT_FOR_PAGES,1,30)||length(e.LIST_ITEM_CURRENT_FOR_PAGES)
    ||' c='||e.LIST_ITEM_DISP_COND_TYPE
    ||substr(e.LIST_ITEM_DISP_CONDITION,1,30)||length(e.LIST_ITEM_DISP_CONDITION)
    ||substr(e.LIST_ITEM_DISP_CONDITION2,1,30)||length(e.LIST_ITEM_DISP_CONDITION2)
    ||' c='||decode(e.LIST_COUNTCLICKS_Y_N,
      'Y','Yes','N','No',
      e.LIST_COUNTCLICKS_Y_N)
    ||' c='||e.LIST_COUNTCLICKS_CAT
    ||' t='
    ||length(e.LIST_TEXT_01)
    ||length(e.LIST_TEXT_02)
    ||length(e.LIST_TEXT_03)
    ||length(e.LIST_TEXT_04)
    ||length(e.LIST_TEXT_05)
    ||length(e.LIST_TEXT_06)
    ||length(e.LIST_TEXT_07)
    ||length(e.LIST_TEXT_08)
    ||length(e.LIST_TEXT_09)
    ||length(e.LIST_TEXT_10)
    ||translate_list_text_y_n
    ||' b='||(select PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(e.REQUIRED_PATCH))
    ||' s='||decode(substr(e.SECURITY_SCHEME,1,1),'!','Not ')||
    nvl((select name
     from   wwv_flow_security_schemes
     where  to_char(id) = ltrim(e.SECURITY_SCHEME,'!')
     and    flow_id = f.id),
     e.SECURITY_SCHEME)
    component_signature
from wwv_flow_list_items e,
     wwv_flow_lists l,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = l.flow_id and
      l.id = e.list_Id and
      f.id = e.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_THEMES" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"THEME_NUMBER",
"THEME_NAME",
"UI_TYPE_ID",
"UI_TYPE_NAME",
"REFERENCE_ID",
"IS_LOCKED",
"DEFAULT_PAGE_TEMPLATE",
"DEFAULT_BUTTON_TEMPLATE",
"DEFAULT_REGION_TEMPLATE",
"DEFAULT_CHART_RG_TEMPLATE",
"DEFAULT_FORM_RG_TEMPLATE",
"DEFAULT_REPORT_REGION_TEMPLATE",
"DEFAULT_TABULAR_FORM_TEMPLATE",
"DEFAULT_WIZARD_TEMPLATE",
"DEFAULT_BREADCRUMB_RG_TEMPLATE",
"DEFAULT_LIST_REGION_TEMPLATE",
"DEFAULT_IRR_TEMPLATE",
"DEFAULT_HEADER_TEMPLATE",
"DEFAULT_FOOTER_TEMPLATE",
"DEFAULT_REPORT_ROW_TEMPLATE",
"DEFAULT_ITEM_LABEL_TEMPLATE",
"DEFAULT_BREADCRUMB_TEMPLATE",
"DEFAULT_CALENDAR_TEMPLATE",
"DEFAULT_LIST_TEMPLATE",
"DEFAULT_OPTION_LABEL",
"DEFAULT_REQUIRED_LABEL",
"DEFAULT_PAGE_TRANSITION",
"DEFAULT_POPUP_TRANSITION",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY",
"CALENDAR_ICON_IMAGE_NAME",
"CALENDAR_ICON_ATTRIBUTES",
"THEME_ID",
"THEME_DESCRIPTION",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                                                                                             workspace,
    w.display_name                                                                                           workspace_display_name,
    f.ID                                                                                                     application_id,
    f.NAME                                                                                                   application_name,
    --
    t.theme_id                                                                                               theme_number,
    t.theme_name                                                                                             theme_name,
    t.ui_type_id,
    uit.name                                                                                                 ui_type_name,
    t.reference_id,
    t.is_locked,
    (select name from wwv_flow_templates where id = t.default_page_template)                                 default_page_template,
    --t.error_template                   ,
    --t.printer_friendly_template        ,
    --t.breadcrumb_display_point         ,
    --t.sidebar_display_point,
    --t.login_template                   ,
    (select template_name from wwv_flow_button_templates where id = t.default_button_template )              default_button_template,
    (select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_region_template)  default_region_template,
    (select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_chart_template)   default_chart_rg_template,
    (select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_form_template)    default_form_rg_template,
    (select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_reportr_template) default_report_region_template,
    (select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_tabform_template) default_tabular_form_template,
    (select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_wizard_template)  default_wizard_template,
    (select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_menur_template)   default_breadcrumb_rg_template,
    (select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_listr_template)   default_list_region_template,
    (select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_irr_template)     default_irr_template,
    (select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_header_template)  default_header_template,
    (select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_footer_template)  default_footer_template,
    (select row_template_name from wwv_flow_row_templates where id = t.default_report_template)              default_report_row_template,
    (select template_Name from wwv_flow_field_templates where id = t.default_label_template)                 default_item_label_template,
    (select name from wwv_flow_menu_templates where id = t.default_menu_template)                            default_breadcrumb_template,
    (select name from wwv_flow_cal_templates where id = t.default_calendar_template)                         default_calendar_template,
    (select list_template_name from wwv_flow_list_templates where id = t.default_list_template)              default_list_template,
    (select template_Name from wwv_flow_field_templates where id = t.default_option_label)                   default_option_label,
    (select template_Name from wwv_flow_field_templates where id = t.default_required_label)                 default_required_label,
    t.default_page_transition,
    t.default_popup_transition,
    --
    t.last_updated_on                                                                                        last_updated_on,
    t.last_updated_by                                                                                        last_updated_by,
    t.calendar_icon                                                                                          calendar_icon_image_name,
    t.calendar_icon_attr                                                                                     calendar_icon_attributes,
    t.id                                                                                                     theme_id,
    t.theme_description                                                                                      theme_description,
    --
    t.theme_id
    ||' n='||substr(t.theme_name                                                                                             ,1,30)
    ||' p='||substr((select name from wwv_flow_templates where id = t.default_page_template)                                 ,1,30)
    ||' e='||substr((select name from wwv_flow_templates where id = t.error_template),1,30)
    ||' b='||substr((select template_name from wwv_flow_button_templates where id = t.default_button_template )              ,1,30)
    ||' r='||substr((select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_region_template)  ,1,30)
    ||' c='||substr((select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_chart_template)   ,1,30)
    ||' f='||substr((select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_form_template)    ,1,30)
    ||' r='||substr((select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_reportr_template) ,1,30)
    ||' t='||substr((select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_tabform_template) ,1,30)
    ||' w='||substr((select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_wizard_template)  ,1,30)
    ||' b='||substr((select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_menur_template)   ,1,30)
    ||' l='||substr((select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_listr_template)   ,1,30)
    ||' i='||substr((select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_irr_template)     ,1,30)
    ||' h='||substr((select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_header_template)  ,1,30)
    ||' f='||substr((select page_plug_template_name from wwv_flow_page_plug_templates where id = t.default_footer_template)  ,1,30)
    ||' r='||substr((select row_template_name from wwv_flow_row_templates where id = t.default_report_template)              ,1,30)
    ||' i='||substr((select template_Name from wwv_flow_field_templates where id = t.default_label_template)                 ,1,30)
    ||' b='||substr((select name from wwv_flow_menu_templates where id = t.default_menu_template)                            ,1,30)
    ||' c='||substr((select name from wwv_flow_cal_templates where id = t.default_calendar_template)                         ,1,30)
    ||' l='||substr((select list_template_name from wwv_flow_list_templates where id = t.default_list_template)              ,1,30)
    ||' l='||substr((select template_Name from wwv_flow_field_templates where id = t.default_option_label)                   ,1,30)
    ||' l='||substr((select template_Name from wwv_flow_field_templates where id = t.default_required_label)                 ,1,30)
    ||' c='||substr(t.calendar_icon,1,30)
    ||' c='||substr(t.calendar_icon_attr,1,30)
    component_signature
from wwv_flow_themes t,
     wwv_flow_ui_types uit,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID)
  and f.security_group_id = w.PROVISIONING_COMPANY_ID
  and s.security_group_id = w.PROVISIONING_COMPANY_ID
  and s.schema = f.owner
  and f.id = t.flow_id
  and (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'))
  and w.PROVISIONING_COMPANY_ID != 0
  and uit.id = t.ui_type_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_THEME_STYLES" ("THEME_STYLE_ID",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"THEME_NUMBER",
"NAME",
"CSS_FILE_URLS",
"IS_CURRENT",
"IS_SUBSCRIBED",
"SUBSCRIBED_FROM",
"SUBSCRIBED_FROM_ID",
"COMPONENT_COMMENT",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select s.id                              as theme_style_id,
       f.workspace,
       f.workspace_display_name,
       f.application_id,
       f.application_name,
       s.theme_id                        as theme_number,
       s.name,
       s.css_file_urls,
       case s.is_current
         when 'Y' then 'Yes'
         else 'No'
       end as is_current,
       nvl2(s.reference_id, 'Yes', 'No') as is_subscribed,
       ( select s2.flow_id||'. '||s2.name
           from wwv_flow_theme_styles s2
          where s2.id = s.reference_id ) as subscribed_from,
       s.reference_id                    as subscribed_from_id,
       s.component_comment,
       s.created_by,
       s.created_on,
       s.last_updated_by,
       s.last_updated_on
  from wwv_flow_authorized f,
       wwv_flow_theme_styles s
 where s.flow_id = f.application_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPL_THEME_DISPLAY_POINTS" ("THEME_DISPLAY_POINT_ID",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"THEME_NUMBER",
"NAME",
"PLACEHOLDER",
"HAS_GRID_SUPPORT",
"MAX_FIXED_GRID_COLUMNS",
"IS_SUBSCRIBED",
"SUBSCRIBED_FROM",
"SUBSCRIBED_FROM_ID",
"COMPONENT_COMMENT",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select d.id                              as theme_display_point_id,
       f.workspace,
       f.workspace_display_name,
       f.application_id,
       f.application_name,
       d.theme_id                        as theme_number,
       d.name,
       d.placeholder,
       case d.has_grid_support
         when 'Y' then 'Yes'
         else 'No'
       end as has_grid_support,
       d.max_fixed_grid_columns,
       nvl2(d.reference_id, 'Yes', 'No') as is_subscribed,
       ( select d2.flow_id||'. '||d2.name
           from wwv_flow_theme_display_points d2
          where d2.id = d.reference_id ) as subscribed_from,
       d.reference_id                    as subscribed_from_id,
       d.component_comment,
       d.created_by,
       d.created_on,
       d.last_updated_by,
       d.last_updated_on
  from wwv_flow_authorized f,
       wwv_flow_theme_display_points d
 where d.flow_id = f.application_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_TEMP_PAGE" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"TEMPLATE_NAME",
"IS_POPUP",
"JAVASCRIPT_FILE_URLS",
"JAVASCRIPT_CODE",
"JAVASCRIPT_CODE_ONLOAD",
"CSS_FILE_URLS",
"INLINE_CSS",
"HEADER_TEMPLATE",
"PAGE_BODY",
"FOOTER_TEMPLATE",
"SUCCESS_MESSAGE",
"CURRENT_TAB",
"CURRENT_TAB_FONT_ATTR",
"NON_CURRENT_TAB",
"NON_CURRENT_TAB_FONT_ATTR",
"CURRENT_IMAGE_TAB",
"NON_CURRENT_IMAGE_TAB",
"CURRENT_PARENT_TAB",
"CURRENT_PARENT_TAB_ATTR",
"NONCURRENT_PARENT_TAB",
"NONCURRENT_PARENT_TAB_ATTR",
"NAVIGATION_BAR",
"NAVBAR_ENTRY",
"MESSAGE",
"GRID_TYPE",
"GRID_TYPE_CODE",
"GRID_MAX_COLUMNS",
"GRID_ALWAYS_USE_MAX_COLUMNS",
"GRID_HAS_COLUMN_SPAN",
"GRID_EMIT_EMPTY_LEADING_COLS",
"GRID_EMIT_EMPTY_TRAILING_COLS",
"GRID_TEMPLATE",
"GRID_ROW_TEMPLATE",
"GRID_COLUMN_TEMPLATE",
"GRID_FIRST_COLUMN_ATTRIBUTES",
"GRID_LAST_COLUMN_ATTRIBUTES",
"GRID_JAVASCRIPT_DEBUG_CODE",
"GRID_TABLE_ATTRIBUTES",
"MULTICOLUMN_REGION_TABLE_ATTR",
"HAS_EDIT_LINKS",
"ERROR_PAGE_TEMPLATE",
"IS_SUBSCRIBED",
"SUBSCRIBED_FROM",
"THEME_NUMBER",
"THEME_CLASS",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"TRANSLATABLE",
"COMPONENT_COMMENT",
"TEMPLATE_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    t.NAME                           template_name,
    --t.LOOK
    --
    t.is_popup,
    t.javascript_file_urls,
    t.javascript_code,
    t.javascript_code_onload,
    t.css_file_urls,
    t.inline_css,
    t.HEADER_TEMPLATE                ,
    t.BOX                            page_body,
    t.FOOTER_TEMPLATE                ,
    --
    t.SUCCESS_MESSAGE                ,
    t.CURRENT_TAB                    ,
    t.CURRENT_TAB_FONT_ATTR          ,
    t.NON_CURRENT_TAB                ,
    t.NON_CURRENT_TAB_FONT_ATTR      ,
    t.CURRENT_IMAGE_TAB              ,
    t.NON_CURRENT_IMAGE_TAB          ,
    t.TOP_CURRENT_TAB                Current_Parent_Tab,
    t.TOP_CURRENT_TAB_FONT_ATTR      Current_Parent_Tab_attr,
    t.TOP_NON_CURRENT_TAB            NonCurrent_Parent_Tab,
    t.TOP_NON_CURRENT_TAB_FONT_ATTR  NonCurrent_Parent_Tab_attr,
    --
    t.NAVIGATION_BAR                 ,
    t.NAVBAR_ENTRY                   ,
    --t.BODY_TITLE                     ,
    t.MESSAGE                        ,
    --t.ATTRIBUTE1                     ,
    --t.ATTRIBUTE2                     ,
    --t.ATTRIBUTE3                     ,
    --t.ATTRIBUTE4                     ,
    --t.ATTRIBUTE5                     ,
    --t.ATTRIBUTE6                     ,
    --t.DEFAULT_BUTTON_POSITION        ,
    --t.TABLE_BGCOLOR                  ,
    --t.HEADING_BGCOLOR                ,
    --t.TABLE_CATTRIBUTES              ,
    --t.FONT_SIZE                      ,
    --t.FONT_FACE                      ,
    case t.grid_type
      when 'TABLE'    then 'Table'
      when 'FIXED'    then 'Fixed'
      when 'VARIABLE' then 'Variable'
    end                               as grid_type,
    t.grid_type                       as grid_type_code,
    t.grid_max_columns,
    case t.grid_always_use_max_columns
      when 'Y' then 'Yes'
      when 'N' then 'No'
    end                               as grid_always_use_max_columns,
    case t.grid_has_column_span
      when 'Y' then 'Yes'
      when 'N' then 'No'
    end                               as grid_has_column_span,
    case t.grid_emit_empty_leading_cols
      when 'Y' then 'Yes'
      when 'N' then 'No'
    end                               as grid_emit_empty_leading_cols,
    case t.grid_emit_empty_trailing_cols
      when 'Y' then 'Yes'
      when 'N' then 'No'
    end                               as grid_emit_empty_trailing_cols,
    t.grid_template,
    t.grid_row_template,
    t.grid_column_template,
    t.grid_first_column_attributes,
    t.grid_last_column_attributes,
    t.grid_javascript_debug_code,
    t.REGION_TABLE_CATTRIBUTES        as grid_table_attributes,
    t.REGION_TABLE_CATTRIBUTES        as MultiColumn_Region_Table_Attr, /* for backward compatibility */
    --
    --t.APP_TAB_BEFORE_TABS            ,
    --t.APP_TAB_CURRENT_TAB            ,
    --t.APP_TAB_NON_CURRENT_TAB        ,
    --t.APP_TAB_AFTER_TABS             ,
    --
    case t.has_edit_links
      when 'Y' then 'Yes'
      when 'N' then 'No'
    end                              as has_edit_links,
    --
    t.ERROR_PAGE_TEMPLATE            ,
    --
    decode(t.REFERENCE_ID,
    null,'No','Yes')                 is_subscribed,
    (select flow_id||'. '||name
     from wwv_flow_templates
     where id = t.REFERENCE_ID)      subscribed_from,
    --
    --t.BREADCRUMB_DEF_REG_POS         ,
    --t.SIDEBAR_DEF_REG_POS            ,
    --t.REQUIRED_PATCH                 ,
    t.THEME_ID                       theme_number,
    decode(t.THEME_CLASS_ID,
      '1', 'One Level Tabs',
      '2', 'Two Level Tabs',
      '3', 'No Tabs',
      '4', 'Popup',
      '5', 'Printer Friendly',
      '6', 'Login',
      '7', 'Unknown',
      '8',  'Custom 1',
      '9',  'Custom 2',
      '10', 'Custom 3',
      '11', 'Custom 4',
      '12', 'Custom 5',
      '13', 'Custom 6',
      '14', 'Custom 7',
      '15', 'Custom 8',
      '16', 'One Level Tabs with Sidebar',
      '17', 'No Tabs with Sidebar',
      '18', 'Two Level Tabs with Sidebar',
      t.THEME_CLASS_ID)              theme_class,
    t.LAST_UPDATED_BY                last_updated_by,
    t.LAST_UPDATED_ON                last_updated_on,
    decode(
       t.TRANSLATE_THIS_TEMPLATE,
       'N','No','Y','Yes','Yes')     translatable,
    t.TEMPLATE_COMMENT               component_comment,
    t.id                             template_id,
    --
    substr(t.NAME,1,40)||'.'||length(t.NAME)
    ||' h='||sys.dbms_lob.substr(t.HEADER_TEMPLATE                  ,40,1)||'.'||sys.dbms_lob.getlength(t.HEADER_TEMPLATE                )
    ||' b='||sys.dbms_lob.substr(t.BOX                              ,40,1)||'.'||sys.dbms_lob.getlength(t.BOX                            )
    ||' f='||sys.dbms_lob.substr(t.FOOTER_TEMPLATE                  ,40,1)||'.'||sys.dbms_lob.getlength(t.FOOTER_TEMPLATE                )
    ||' s='||substr(t.SUCCESS_MESSAGE                  ,1,40)||'.'||length(t.SUCCESS_MESSAGE                )
    ||' t='||substr(t.CURRENT_TAB                      ,1,40)||'.'||length(t.CURRENT_TAB                    )
    ||' t='||substr(t.CURRENT_TAB_FONT_ATTR            ,1,40)||'.'||length(t.CURRENT_TAB_FONT_ATTR          )
    ||' n='||substr(t.NON_CURRENT_TAB                  ,1,40)||'.'||length(t.NON_CURRENT_TAB                )
    ||' n='||substr(t.NON_CURRENT_TAB_FONT_ATTR        ,1,40)||'.'||length(t.NON_CURRENT_TAB_FONT_ATTR      )
    ||' i='||substr(t.CURRENT_IMAGE_TAB                ,1,40)||'.'||length(t.CURRENT_IMAGE_TAB              )
    ||' i='||substr(t.NON_CURRENT_IMAGE_TAB            ,1,40)||'.'||length(t.NON_CURRENT_IMAGE_TAB          )
    ||' t='||substr(t.TOP_CURRENT_TAB                  ,1,40)||'.'||length(t.TOP_CURRENT_TAB                )
    ||' t='||substr(t.TOP_CURRENT_TAB_FONT_ATTR        ,1,40)||'.'||length(t.TOP_CURRENT_TAB_FONT_ATTR      )
    ||' t='||substr(t.TOP_NON_CURRENT_TAB              ,1,40)||'.'||length(t.TOP_NON_CURRENT_TAB            )
    ||' t='||substr(t.TOP_NON_CURRENT_TAB_FONT_ATTR    ,1,40)||'.'||length(t.TOP_NON_CURRENT_TAB_FONT_ATTR  )
    ||' n='||substr(t.NAVIGATION_BAR                   ,1,40)||'.'||length(t.NAVIGATION_BAR                 )
    ||' n='||substr(t.NAVBAR_ENTRY                     ,1,40)||'.'||length(t.NAVBAR_ENTRY                   )
    ||' m='||substr(t.MESSAGE                          ,1,40)||'.'||length(t.MESSAGE                        )
    ||' e='||substr(t.ERROR_PAGE_TEMPLATE              ,1,40)||'.'||length(t.ERROR_PAGE_TEMPLATE            )
    --
    ||' s='||decode(t.REFERENCE_ID,null,'No','Yes')
    ||' t='||t.THEME_ID
    ||' c='||decode(t.THEME_CLASS_ID,
      '1', 'One Level Tabs',
      '2', 'Two Level Tabs',
      '3', 'No Tabs',
      '4', 'Popup',
      '5', 'Printer Friendly',
      '6', 'Login',
      '7', 'Unknown',
      '8',  'Custom 1',
      '9',  'Custom 2',
      '10', 'Custom 3',
      '11', 'Custom 4',
      '12', 'Custom 5',
      '13', 'Custom 6',
      '14', 'Custom 7',
      '15', 'Custom 8',
      '16', 'One Level Tabs with Sidebar',
      '17', 'No Tabs with Sidebar',
      '18', 'Two Level Tabs with Sidebar',
      t.THEME_CLASS_ID)
    ||' t='||t.TRANSLATE_THIS_TEMPLATE
    component_signature
from wwv_flow_templates t,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = t.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPL_TEMP_PAGE_DP" ("PAGE_TMPL_DISPLAY_POINT_ID",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_TEMPLATE_ID",
"NAME",
"PLACEHOLDER",
"HAS_GRID_SUPPORT",
"MAX_FIXED_GRID_COLUMNS",
"COMPONENT_COMMENT",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select d.id                      as page_tmpl_display_point_id,
       f.workspace,
       f.workspace_display_name,
       f.application_id,
       f.application_name,
       d.page_template_id        as page_template_id,
       d.name,
       d.placeholder,
       case d.has_grid_support
         when 'Y' then 'Yes'
         else 'No'
       end as has_grid_support,
       d.max_fixed_grid_columns,
       d.component_comment,
       d.created_by,
       d.created_on,
       d.last_updated_by,
       d.last_updated_on
  from wwv_flow_authorized f,
       wwv_flow_page_tmpl_disp_points d
 where d.flow_id = f.application_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_TEMP_REGION" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"TEMPLATE_NAME",
"THEME_NUMBER",
"THEME_CLASS",
"LAYOUT",
"TEMPLATE",
"TEMPLATE2",
"TEMPLATE3",
"SUB_REGION_HEADER_TEMPLATE",
"SUB_REGION_HEADER_ENTRY_TEMPL",
"SUB_REGION_TEMPLATE",
"PLUG_TABLE_BGCOLOR",
"PLUG_HEADING_BGCOLOR",
"PLUG_FONT_SIZE",
"DEFAULT_FIELD_TEMPLATE_ID",
"DEFAULT_REQ_FIELD_TEMPLATE_ID",
"DEFAULT_LABEL_ALIGNMENT",
"DEFAULT_FIELD_ALIGNMENT",
"DEFAULT_BUTTON_TEMPLATE_ID",
"DEFAULT_BUTTON_POSITION",
"IS_SUBSCRIBED",
"SUBSCRIBED_FROM",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"TRANSLATABLE",
"COMPONENT_COMMENT",
"REGION_TEMPLATE_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    t.PAGE_PLUG_TEMPLATE_NAME        template_name,
    t.THEME_ID                       theme_number,
    --
    decode(t.THEME_CLASS_ID,
        'RETURN_VALUE','DISPLAY_VALUE',
        '1','Hide and Show Region',
        '2','Sidebar Region',
        '3','Sidebar Region, Alternative 1',
        '4','Button Region with Title',
        '5','Navigation Region',
        '6','Breadcrumb Region',
        '7','Borderless Region',
        '8','Form Region',
        '9','Reports Region',
        '10','Reports Region, Alternative 1',
        '11','Region without Title',
        '12','Wizard Region',
        '13','Reports Region 100% Width',
        '16','Navigation Region, Alternative 1',
        '17','Button Region without Title',
        '18','Bracketed Region',
        '19','Region without Buttons and Title',
        '20','Wizard Region with Icon',
        '21','Custom 1',
        '22','Custom 2',
        '23','Custom 3',
        '24','Custom 4',
        '25','Custom 5',
        '26','Custom 6',
        '27','Custom 7',
        '28','Custom 8',
        '29','List Region with Icon',
        '30','Chart Region',
        t.theme_class_id)            theme_class,
    --
    t.layout,
    t.template,
    t.template2,
    t.template3,
    t.sub_plug_header_template       as sub_region_header_template,
    t.sub_plug_header_entry_template as sub_region_header_entry_templ,
    t.sub_plug_template              as sub_region_template,
    t.plug_table_bgcolor,
    t.plug_heading_bgcolor,
    t.plug_font_size,
    t.default_field_template_id,
    t.default_req_field_template_id,
    t.default_label_alignment,
    t.default_field_alignment,
    t.default_button_template_id,
    t.default_button_position,
    --
    decode(t.REFERENCE_ID,
    null,'No','Yes')                 is_subscribed,
    (select flow_id||'. '||name
     from WWV_FLOW_PAGE_PLUG_TEMPLATES
     where id = t.REFERENCE_ID)      subscribed_from,
    --
    t.LAST_UPDATED_BY                last_updated_by,
    t.LAST_UPDATED_ON                last_updated_on,
    decode(t.TRANSLATE_THIS_TEMPLATE,
      'N','No','Y','Yes','Yes')      translatable,
    t.TEMPLATE_COMMENT               component_comment,
    t.id                             region_template_id,
    --
    t.PAGE_PLUG_TEMPLATE_NAME
    ||' t='||t.THEME_ID
    ||' c='||THEME_CLASS_ID
    ||' 1='||sys.dbms_lob.substr(t.TEMPLATE,40,1)||'.'||sys.dbms_lob.getlength(t.TEMPLATE)
    ||' 2='||sys.dbms_lob.substr(t.TEMPLATE2,40,1)||'.'||sys.dbms_lob.getlength(t.TEMPLATE2)
    ||' 3='||sys.dbms_lob.substr(t.TEMPLATE3,40,1)||'.'||sys.dbms_lob.getlength(t.TEMPLATE3)
    ||' b='||substr(t.PLUG_TABLE_BGCOLOR,1,20)
    ||' b='||substr(t.PLUG_HEADING_BGCOLOR,1,20)
    ||' f='||substr(t.PLUG_FONT_SIZE,1,20)
    ||' t='||TRANSLATE_THIS_TEMPLATE
    ||' r='||decode(t.REFERENCE_ID,null,'N','Y')
    component_signature
from WWV_FLOW_PAGE_PLUG_TEMPLATES t,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = t.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPL_TEMP_REGION_DP" ("REGION_TMPL_DISPLAY_POINT_ID",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"REGION_TEMPLATE_ID",
"NAME",
"PLACEHOLDER",
"HAS_GRID_SUPPORT",
"MAX_FIXED_GRID_COLUMNS",
"COMPONENT_COMMENT",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select d.id                      as region_tmpl_display_point_id,
       f.workspace,
       f.workspace_display_name,
       f.application_id,
       f.application_name,
       d.plug_template_id        as region_template_id,
       d.name,
       d.placeholder,
       case d.has_grid_support
         when 'Y' then 'Yes'
         else 'No'
       end as has_grid_support,
       d.max_fixed_grid_columns,
       d.component_comment,
       d.created_by,
       d.created_on,
       d.last_updated_by,
       d.last_updated_on
  from wwv_flow_authorized f,
       wwv_flow_plug_tmpl_disp_points d
 where d.flow_id = f.application_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_TEMP_LABEL" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"THEME_NUMBER",
"THEME_CLASS",
"TEMPLATE_NAME",
"BEFORE_LABEL",
"AFTER_LABEL",
"BEFORE_ITEM",
"AFTER_ITEM",
"IS_SUBSCRIBED",
"SUBSCRIBED_FROM",
"ON_ERROR_BEFORE_LABEL",
"ON_ERROR_AFTER_LABEL",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY",
"TRANSLATE_THIS_TEMPLATE",
"COMPONENT_COMMENT",
"LABEL_TEMPLATE_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    t.THEME_ID                       theme_number,
    decode(t.THEME_CLASS_ID,
      '1','Optional Label with Help',
      '2','Required Label with Help',
      '3','Optional Label',
      '4','Required Label',
      '5','Custom 1',
      '6','Custom 2',
      '7','Custom 3',
      '8','Custom 4',
      '9','Custom 5',
      '10','Custom 6',
      '11','Custom 7',
      '12','Custom 8',
      '13','No Label',
      t.THEME_CLASS_ID)              theme_class,
    --
    t.TEMPLATE_NAME                  template_name,
    t.TEMPLATE_BODY1                 before_label,
    t.TEMPLATE_BODY2                 after_label,
    --
    t.BEFORE_ITEM                    before_item,
    t.AFTER_ITEM                     after_item,
    --
    decode(t.REFERENCE_ID,
    null,'No','Yes')                 is_subscribed,
    (select flow_id||'. '||name
     from WWV_FLOW_FIELD_TEMPLATES
     where id = t.REFERENCE_ID)      subscribed_from,
    --
    t.ON_ERROR_BEFORE_LABEL,
    t.ON_ERROR_AFTER_LABEL,
    t.LAST_UPDATED_ON                last_updated_on,
    t.LAST_UPDATED_BY                last_updated_by,
    t.TRANSLATE_THIS_TEMPLATE        ,
    t.TEMPLATE_COMMENT               component_comment,
    t.id                             label_template_id,
    --
    t.TEMPLATE_NAME
    ||' t='||t.THEME_ID
    ||' c='||t.THEME_CLASS_ID
    ||' 1='||substr(t.TEMPLATE_BODY1,1,40)||length(t.TEMPLATE_BODY1)
    ||' 2='||substr(t.TEMPLATE_BODY2,1,40)||length(t.TEMPLATE_BODY2)
    ||' r='||decode(t.REFERENCE_ID,null,'N','Y')
    ||' e='||substr(t.ON_ERROR_BEFORE_LABEL,1,40)||length(t.ON_ERROR_BEFORE_LABEL)
    ||' e='||substr(t.ON_ERROR_AFTER_LABEL,1,40)||length(t.ON_ERROR_AFTER_LABEL)
    ||' t='||t.TRANSLATE_THIS_TEMPLATE
    component_signature
from WWV_FLOW_FIELD_TEMPLATES t,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
       from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = t.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_TEMP_LIST" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"TEMPLATE_NAME",
"LIST_TEMPLATE_CURRENT",
"LIST_TEMPLATE_NONCURRENT",
"LIST_TEMPLATE_BEFORE_ROWS",
"LIST_TEMPLATE_AFTER_ROWS",
"BETWEEN_ITEMS",
"BEFORE_SUB_LIST",
"AFTER_SUB_LIST",
"BETWEEN_SUB_LIST_ITEMS",
"SUB_LIST_ITEM_CURRENT",
"SUB_LIST_ITEM_NONCURRENT",
"ITEM_TEMPLATE_CURR_W_CHILD",
"ITEM_TEMPLATE_NONCURR_W_CHILD",
"SUB_TEMPLATE_CURR_W_CHILD",
"SUB_TEMPLATE_NONCURR_W_CHILD",
"FIRST_LIST_TEMPLATE_NONCURRENT",
"FIRST_LIST_TEMPLATE_CURRENT",
"F_ITEM_TEMPLATE_CURR_W_CHILD",
"FITEM_TEMPLATE_NONCURR_W_CHILD",
"IS_SUBSCRIBED",
"SUBSCRIBED_FROM",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"THEME_NUMBER",
"THEME_CLASS",
"TRANSLATE_THIS_TEMPLATE",
"COMPONENT_COMMENT",
"LIST_TEMPLATE_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    t.LIST_TEMPLATE_NAME             template_name,
    t.LIST_TEMPLATE_CURRENT,
    t.LIST_TEMPLATE_NONCURRENT,
    t.LIST_TEMPLATE_BEFORE_ROWS,
    t.LIST_TEMPLATE_AFTER_ROWS,
    t.BETWEEN_ITEMS,
    t.BEFORE_SUB_LIST,
    t.AFTER_SUB_LIST,
    t.BETWEEN_SUB_LIST_ITEMS,
    t.SUB_LIST_ITEM_CURRENT,
    t.SUB_LIST_ITEM_NONCURRENT,
    t.ITEM_TEMPLATE_CURR_W_CHILD,
    t.ITEM_TEMPLATE_NONCURR_W_CHILD,
    t.SUB_TEMPLATE_CURR_W_CHILD,
    t.SUB_TEMPLATE_NONCURR_W_CHILD,
    --
    t.FIRST_LIST_TEMPLATE_NONCURRENT,
    t.FIRST_LIST_TEMPLATE_CURRENT,
    t.F_ITEM_TEMPLATE_CURR_W_CHILD,
    t.FITEM_TEMPLATE_NONCURR_W_CHILD,
    --
    decode(t.REFERENCE_ID,
    null,'No','Yes')                 is_subscribed,
    (select flow_id||'. '||name
     from WWV_FLOW_LIST_TEMPLATES
     where id = t.REFERENCE_ID)      subscribed_from,
    --
    t.LAST_UPDATED_BY                ,
    t.LAST_UPDATED_ON                ,
    t.THEME_ID                       theme_number,
    decode(t.THEME_CLASS_ID,
       '1','Vertical Unordered List with Bullets',
       '2','Vertical Ordered List',
       '3','Horizontal Links List',
       '4','Horizontal Images with Label List',
       '5','Vertical Images List',
       '6','Button List',
       '7','Tabbed Navigation List',
       '9','Custom 1',
       '10','Custom 2',
       '11','Custom 3',
       '12','Custom 4',
       '13','Custom 5',
       '14','Custom 6',
       '15','Custom 7',
       '16','Custom 8',
       '17','Wizard Progress List',
       '18','Vertical Unordered List without Bullets',
       '19','Vertical Sidebar List',
       '20','Pull Down Menu',
       '21','Pull Down Menu with Image',
       '22','Hierarchical Expanding',
       '23','Hierarchical Expanded',
       t.THEME_CLASS_ID)             theme_class,
    t.TRANSLATE_THIS_TEMPLATE,
    t.LIST_TEMPLATE_COMMENT          component_comment,
    t.id                             list_template_id,
    --
    t.LIST_TEMPLATE_NAME
    ||' t='||t.THEME_ID
    ||' c='||t.THEME_CLASS_ID
    ||' 1='||sys.dbms_lob.substr(t.LIST_TEMPLATE_CURRENT,40,1)||'.'||sys.dbms_lob.getlength(t.LIST_TEMPLATE_CURRENT)
    ||' 2='||sys.dbms_lob.substr(t.LIST_TEMPLATE_NONCURRENT,40,1)||'.'||sys.dbms_lob.getlength(t.LIST_TEMPLATE_NONCURRENT)
    ||' 3='||sys.dbms_lob.substr(t.SUB_LIST_ITEM_CURRENT,40,1)||'.'||sys.dbms_lob.getlength(t.SUB_LIST_ITEM_CURRENT)
    ||' 4='||sys.dbms_lob.substr(t.SUB_LIST_ITEM_NONCURRENT,40,1)||'.'||sys.dbms_lob.getlength(t.SUB_LIST_ITEM_NONCURRENT)
    ||' 5='||sys.dbms_lob.substr(t.ITEM_TEMPLATE_CURR_W_CHILD,40,1)||'.'||sys.dbms_lob.getlength(t.ITEM_TEMPLATE_CURR_W_CHILD)
    ||' 6='||sys.dbms_lob.substr(t.ITEM_TEMPLATE_NONCURR_W_CHILD,40,1)||'.'||sys.dbms_lob.getlength(t.ITEM_TEMPLATE_NONCURR_W_CHILD)
    ||' 7='||sys.dbms_lob.substr(t.SUB_TEMPLATE_CURR_W_CHILD,40,1)||'.'||sys.dbms_lob.getlength(t.SUB_TEMPLATE_CURR_W_CHILD)
    ||' 8='||sys.dbms_lob.substr(t.SUB_TEMPLATE_NONCURR_W_CHILD,40,1)||'.'||sys.dbms_lob.getlength(t.SUB_TEMPLATE_NONCURR_W_CHILD)
    ||' t='||t.TRANSLATE_THIS_TEMPLATE
    ||' r='||decode(t.REFERENCE_ID,null,'N','Y')
    ||' b='||substr(t.LIST_TEMPLATE_BEFORE_ROWS,1,20)||length(t.LIST_TEMPLATE_BEFORE_ROWS)
    ||' a='||substr(t.LIST_TEMPLATE_AFTER_ROWS,1,20)||length(t.LIST_TEMPLATE_AFTER_ROWS)
    ||' b='||substr(t.BETWEEN_ITEMS,1,20)||length(t.BETWEEN_ITEMS)
    ||' b='||substr(t.BEFORE_SUB_LIST,1,20)||length(t.BEFORE_SUB_LIST)
    ||' a='||substr(t.AFTER_SUB_LIST,1,20)||length(t.AFTER_SUB_LIST)
    ||' b='||substr(t.BETWEEN_SUB_LIST_ITEMS,1,20)||length(t.BETWEEN_SUB_LIST_ITEMS)
    component_signature
from WWV_FLOW_LIST_TEMPLATES t,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = t.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_TEMP_BC" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"THEME_NUMBER",
"THEME_CLASS",
"TEMPLATE_NAME",
"BEFORE_FIRST",
"CURRENT_PAGE_OPTION",
"NON_CURRENT_PAGE_OPTION",
"BREADCRUMB_LINK_ATTRIBUTES",
"BETWEEN_LEVELS",
"AFTER_LAST",
"MAX_LEVELS",
"START_WITH",
"IS_SUBSCRIBED",
"SUBSCRIBED_FROM",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"TRANSLATABLE",
"COMPONENT_COMMENTS",
"BREADCRUMB_TEMPLATE_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    t.THEME_ID                       theme_number,
    --
    decode(t.THEME_CLASS_ID,
      '1','Breadcrumb',
      '2','Hierarchical',
      '3','Custom 1',
      '4','Custom 2',
      '5','Custom 3',
      '6','Custom 4',
      '7','Custom 5',
      '8','Custom 6',
      '9','Custom 7',
      '10','Custom 10',
      t.THEME_CLASS_ID)              theme_class,
    --
    t.NAME                           template_name,
    t.BEFORE_FIRST                   ,
    t.CURRENT_PAGE_OPTION            ,
    t.NON_CURRENT_PAGE_OPTION        ,
    t.MENU_LINK_ATTRIBUTES           breadcrumb_link_attributes,
    t.BETWEEN_LEVELS                 ,
    t.AFTER_LAST                     ,
    t.MAX_LEVELS                     ,
    decode(t.START_WITH_NODE,
       'CHILD_MENU','Child Breadcrumb Entries',
       'CURRENT_MENU','Current Breadcrumb',
       'PARENT_MENU','Parent Breadcrumb Entries',
       'PARENT_TO_LEAF','Parent to Leaf (breadcrumb style)',
       t.START_WITH_NODE)            start_with,
    --
    decode(t.REFERENCE_ID,
    null,'No','Yes')                 is_subscribed,
    (select flow_id||'. '||name
     from WWV_FLOW_MENU_TEMPLATES
     where id = t.REFERENCE_ID)      subscribed_from,
    --
    t.LAST_UPDATED_BY                last_updated_by,
    t.LAST_UPDATED_ON                last_updated_on,
    decode(t.TRANSLATE_THIS_TEMPLATE,
      'Y','Yes','N','No','Yes')      translatable,
    t.TEMPLATE_COMMENTS              component_comments,
    t.id                             breadcrumb_template_id,
    --
    t.NAME
    ||' t='||t.THEME_ID
    ||' c='||t.THEME_CLASS_ID
    ||' 1='||substr(t.BEFORE_FIRST           ,1,30)||length(t.BEFORE_FIRST           )
    ||' 2='||substr(t.CURRENT_PAGE_OPTION    ,1,30)||length(t.CURRENT_PAGE_OPTION    )
    ||' 3='||substr(t.NON_CURRENT_PAGE_OPTION,1,30)||length(t.NON_CURRENT_PAGE_OPTION)
    ||' 4='||substr(t.MENU_LINK_ATTRIBUTES   ,1,30)||length(t.MENU_LINK_ATTRIBUTES   )
    ||' 5='||substr(t.BETWEEN_LEVELS         ,1,30)||length(t.BETWEEN_LEVELS         )
    ||' 6='||substr(t.AFTER_LAST             ,1,30)||length(t.AFTER_LAST             )
    ||' l='||t.MAX_LEVELS
    ||' r='||decode(t.REFERENCE_ID,null,'N','Y')
    ||' n='||t.START_WITH_NODE
    component_signature
from WWV_FLOW_MENU_TEMPLATES t,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = t.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_TEMP_REPORT" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"TEMPLATE_NAME",
"TEMPLATE_TYPE",
"BEFORE_COLUMN_HEADING",
"COLUMN_HEADING_TEMPLATE",
"COLUMN_HEADING_SORT_ASC_TEMP",
"COLUMN_HEADING_SORT_DESC_TEMP",
"COLUMN_HEADING_SORT_TEMP",
"AFTER_COLUMN_HEADING",
"COL_TEMPLATE1",
"COL_TEMPLATE_CONDITION1",
"COL_TEMPLATE_DISPLAY_COND1",
"COL_TEMPLATE2",
"COL_TEMPLATE_CONDITION2",
"COL_TEMPLATE_DISPLAY_COND2",
"COL_TEMPLATE3",
"COL_TEMPLATE_CONDITION3",
"COL_TEMPLATE_DISPLAY_COND3",
"COL_TEMPLATE4",
"COL_TEMPLATE_CONDITION4",
"COL_TEMPLATE_DISPLAY_COND4",
"COL_TEMPLATE_BEFORE_ROWS",
"COL_TEMPLATE_AFTER_ROWS",
"COL_TEMPLATE_BEFORE_FIRST",
"COL_TEMPLATE_AFTER_LAST",
"PAGINATION_TEMPLATE",
"NEXT_PAGE_TEMPLATE",
"PREVIOUS_PAGE_TEMPLATE",
"NEXT_SET_TEMPLATE",
"PREVIOUS_SET_TEMPLATE",
"ROW_STYLE_MOUSE_OVER",
"ROW_STYLE_CHECKED",
"IS_SUBSCRIBED",
"SUBSCRIBED_FROM",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"THEME_NUMBER",
"THEME_CLASS",
"TRANSLATE_THIS_TEMPLATE",
"COMPONENT_COMMENT",
"COMPONENT_SIGNATURE",
"TEMPLATE_ID") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    t.ROW_TEMPLATE_NAME              template_name,
    decode(t.ROW_TEMPLATE_TYPE,
      'GENERIC_COLUMNS','Generic Columns (column template)',
      'NAMED_COLUMNS','Named Column (row template)',
      t.ROW_TEMPLATE_TYPE)           template_type,
      --
    t.before_column_heading          ,
    t.COLUMN_HEADING_TEMPLATE        ,
    t.column_heading_sort_asc_temp,
    t.column_heading_sort_desc_temp,
    t.column_heading_sort_temp,
    t.after_column_heading           ,
    t.ROW_TEMPLATE1                  col_TEMPLATE1                ,
    t.ROW_TEMPLATE_CONDITION1        col_TEMPLATE_CONDITION1      ,
    t.ROW_TEMPLATE_DISPLAY_COND1     col_TEMPLATE_DISPLAY_COND1   ,
    t.ROW_TEMPLATE2                  col_TEMPLATE2                ,
    t.ROW_TEMPLATE_CONDITION2        col_TEMPLATE_CONDITION2      ,
    t.ROW_TEMPLATE_DISPLAY_COND2     col_TEMPLATE_DISPLAY_COND2   ,
    t.ROW_TEMPLATE3                  col_TEMPLATE3                ,
    t.ROW_TEMPLATE_CONDITION3        col_TEMPLATE_CONDITION3      ,
    t.ROW_TEMPLATE_DISPLAY_COND3     col_TEMPLATE_DISPLAY_COND3   ,
    t.ROW_TEMPLATE4                  col_TEMPLATE4                ,
    t.ROW_TEMPLATE_CONDITION4        col_TEMPLATE_CONDITION4      ,
    t.ROW_TEMPLATE_DISPLAY_COND4     col_TEMPLATE_DISPLAY_COND4   ,
    t.ROW_TEMPLATE_BEFORE_ROWS       col_TEMPLATE_BEFORE_ROWS     ,
    t.ROW_TEMPLATE_AFTER_ROWS        col_TEMPLATE_AFTER_ROWS      ,
    t.ROW_TEMPLATE_BEFORE_FIRST      col_TEMPLATE_BEFORE_FIRST    ,
    t.ROW_TEMPLATE_AFTER_LAST        col_TEMPLATE_AFTER_LAST      ,
    --t.ROW_TEMPLATE_TABLE_ATTRIBUTES  col_TEMPLATE_TABLE_ATTRIBUTES,
    t.PAGINATION_TEMPLATE            ,
    t.NEXT_PAGE_TEMPLATE             ,
    t.PREVIOUS_PAGE_TEMPLATE         ,
    t.NEXT_SET_TEMPLATE              ,
    t.PREVIOUS_SET_TEMPLATE          ,
    t.ROW_STYLE_MOUSE_OVER           ,
    --t.ROW_STYLE_MOUSE_OUT            ,
    t.ROW_STYLE_CHECKED              ,
    --t.ROW_STYLE_UNCHECKED            ,
    --
    decode(t.REFERENCE_ID,
    null,'No','Yes')                 is_subscribed,
    (select flow_id||'. '||name
     from WWV_FLOW_ROW_TEMPLATES
     where id = t.REFERENCE_ID)      subscribed_from,
    --
    t.LAST_UPDATED_BY                ,
    t.LAST_UPDATED_ON                ,
    t.THEME_ID                       theme_number,
    --
    decode(t.THEME_CLASS_ID,
      '1','Borderless',
      '2','Horizontal Border',
      '3','One Column Unordered List',
      '4','Standard',
      '5','Standard, Alternating Row Colors',
      '6','Value Attribute Pairs',
      '7','Custom 1',
      '8','Custom 2',
      '9','Custom 3',
      '10','Custom 4',
      '11','Custom 5',
      '12','Custom 6',
      '13','Custom 7',
      '14','Custom 8',
      t.THEME_CLASS_ID)              theme_class,
    decode(t.TRANSLATE_THIS_TEMPLATE,
       'Y','Yes','N','No','Yes')     translate_this_template,
    t.ROW_TEMPLATE_COMMENT           component_comment,
    --
    t.ROW_TEMPLATE_NAME
    ||' t='||t.THEME_ID
    ||' c='||t.THEME_CLASS_ID
    ||' t='||t.ROW_TEMPLATE_TYPE
    ||' 1='||sys.dbms_lob.substr(t.ROW_TEMPLATE1,1,40)||sys.dbms_lob.getlength(t.ROW_TEMPLATE1)
    ||' c='||substr(t.ROW_TEMPLATE_CONDITION1   ,1,20)||length(t.ROW_TEMPLATE_CONDITION1)
    ||' c='||substr(t.ROW_TEMPLATE_DISPLAY_COND1,1,20)||length(t.ROW_TEMPLATE_DISPLAY_COND1)
    ||' 2='||sys.dbms_lob.substr(t.ROW_TEMPLATE2,1,40)||sys.dbms_lob.getlength(t.ROW_TEMPLATE2)
    ||' c='||substr(t.ROW_TEMPLATE_CONDITION2   ,1,20)||length(t.ROW_TEMPLATE_CONDITION2)
    ||' c='||substr(t.ROW_TEMPLATE_DISPLAY_COND2,1,20)||length(t.ROW_TEMPLATE_DISPLAY_COND2)
    ||' 3='||sys.dbms_lob.substr(t.ROW_TEMPLATE3,1,40)||sys.dbms_lob.getlength(t.ROW_TEMPLATE3)
    ||' c='||substr(t.ROW_TEMPLATE_CONDITION3   ,1,20)||length(t.ROW_TEMPLATE_CONDITION3)
    ||' c='||substr(t.ROW_TEMPLATE_DISPLAY_COND3,1,20)||length(t.ROW_TEMPLATE_DISPLAY_COND3)
    ||' 4='||sys.dbms_lob.substr(t.ROW_TEMPLATE4,1,40)||sys.dbms_lob.getlength(t.ROW_TEMPLATE4)
    ||decode(t.REFERENCE_ID,null,'N','Y')
    component_signature,
    t.id template_id
from WWV_FLOW_ROW_TEMPLATES t,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = t.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_TEMP_CALENDAR" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"TEMPLATE_NAME",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"THEME_NUMBER",
"THEME_CLASS",
"TRANSLATABLE",
"IS_SUBSCRIBED",
"SUBSCRIBED_FROM",
"MONTH_TITLE_FORMAT",
"DAY_OF_WEEK_FORMAT",
"MONTH_OPEN_FORMAT",
"MONTH_CLOSE_FORMAT",
"DAY_TITLE_FORMAT",
"DAY_OPEN_FORMAT",
"DAY_CLOSE_FORMAT",
"TODAY_OPEN_FORMAT",
"WEEKEND_TITLE_FORMAT",
"WEEKEND_OPEN_FORMAT",
"WEEKEND_CLOSE_FORMAT",
"NONDAY_TITLE_FORMAT",
"NONDAY_OPEN_FORMAT",
"NONDAY_CLOSE_FORMAT",
"WEEK_TITLE_FORMAT",
"WEEK_OPEN_FORMAT",
"WEEK_CLOSE_FORMAT",
"DAILY_TITLE_FORMAT",
"DAILY_OPEN_FORMAT",
"DAILY_CLOSE_FORMAT",
"WEEKLY_TITLE_FORMAT",
"WEEKLY_DAY_OF_WEEK_FORMAT",
"WEEKLY_MONTH_OPEN_FORMAT",
"WEEKLY_MONTH_CLOSE_FORMAT",
"WEEKLY_DAY_TITLE_FORMAT",
"WEEKLY_DAY_OPEN_FORMAT",
"WEEKLY_DAY_CLOSE_FORMAT",
"WEEKLY_TODAY_OPEN_FORMAT",
"WEEKLY_WEEKEND_TITLE_FORMAT",
"WEEKLY_WEEKEND_OPEN_FORMAT",
"WEEKLY_WEEKEND_CLOSE_FORMAT",
"WEEKLY_TIME_OPEN_FORMAT",
"WEEKLY_TIME_CLOSE_FORMAT",
"WEEKLY_TIME_TITLE_FORMAT",
"WEEKLY_HOUR_OPEN_FORMAT",
"WEEKLY_HOUR_CLOSE_FORMAT",
"DAILY_DAY_OF_WEEK_FORMAT",
"DAILY_MONTH_TITLE_FORMAT",
"DAILY_MONTH_OPEN_FORMAT",
"DAILY_MONTH_CLOSE_FORMAT",
"DAILY_DAY_TITLE_FORMAT",
"DAILY_DAY_OPEN_FORMAT",
"DAILY_DAY_CLOSE_FORMAT",
"DAILY_TODAY_OPEN_FORMAT",
"DAILY_TIME_OPEN_FORMAT",
"DAILY_TIME_CLOSE_FORMAT",
"DAILY_TIME_TITLE_FORMAT",
"DAILY_HOUR_OPEN_FORMAT",
"DAILY_HOUR_CLOSE_FORMAT",
"AGENDA_FORMAT",
"AGENDA_PAST_DAY_FORMAT",
"AGENDA_TODAY_DAY_FORMAT",
"AGENDA_FUTURE_DAY_FORMAT",
"AGENDA_PAST_ENTRY_FORMAT",
"AGENDA_TODAY_ENTRY_FORMAT",
"AGENDA_FUTURE_ENTRY_FORMAT",
"MONTH_DATA_FORMAT",
"MONTH_DATA_ENTRY_FORMAT",
"COMPONENT_COMMENT",
"CALENDAR_TEMPLATE_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    t.NAME                           template_name,
    t.LAST_UPDATED_BY                ,
    t.LAST_UPDATED_ON                ,
    t.THEME_ID                       theme_number,
    decode(t.THEME_CLASS_ID,
       '1','Calendar',
       '2','Calendar, Alternative 1',
       '3','Small Calendar',
       '4','Custom 1',
       '5','Custom 2',
       '6','Custom 3',
       '7','Custom 4',
       '8','Custom 5',
       '9','Custom 6',
       '10','Custom 7',
       '11','Custom 8',
       t.THEME_CLASS_ID)             theme_class,
    --
    decode(t.TRANSLATE_THIS_TEMPLATE,
      'Y','Yes','N','No','Yes')      translatable,
    --
    decode(t.REFERENCE_ID,
    null,'No','Yes')                 is_subscribed,
    (select flow_id||'. '||name
     from WWV_FLOW_CAL_TEMPLATES
     where id = t.REFERENCE_ID)      subscribed_from,
    --
    t.MONTH_TITLE_FORMAT             ,
    t.DAY_OF_WEEK_FORMAT             ,
    t.MONTH_OPEN_FORMAT              ,
    t.MONTH_CLOSE_FORMAT             ,
    t.DAY_TITLE_FORMAT               ,
    t.DAY_OPEN_FORMAT                ,
    t.DAY_CLOSE_FORMAT               ,
    t.TODAY_OPEN_FORMAT              ,
    t.WEEKEND_TITLE_FORMAT           ,
    t.WEEKEND_OPEN_FORMAT            ,
    t.WEEKEND_CLOSE_FORMAT           ,
    t.NONDAY_TITLE_FORMAT            ,
    t.NONDAY_OPEN_FORMAT             ,
    t.NONDAY_CLOSE_FORMAT            ,
    t.WEEK_TITLE_FORMAT              ,
    t.WEEK_OPEN_FORMAT               ,
    t.WEEK_CLOSE_FORMAT              ,
    t.DAILY_TITLE_FORMAT             ,
    t.DAILY_OPEN_FORMAT              ,
    t.DAILY_CLOSE_FORMAT             ,
    t.weekly_title_format            ,
    t.weekly_day_of_week_format      ,
    t.weekly_month_open_format       ,
    t.weekly_month_close_format      ,
    t.weekly_day_title_format        ,
    t.weekly_day_open_format         ,
    t.weekly_day_close_format        ,
    t.weekly_today_open_format       ,
    t.weekly_weekend_title_format    ,
    t.weekly_weekend_open_format     ,
    t.weekly_weekend_close_format    ,
    t.weekly_time_open_format        ,
    t.weekly_time_close_format       ,
    t.weekly_time_title_format       ,
    t.weekly_hour_open_format        ,
    t.weekly_hour_close_format       ,
    t.daily_day_of_week_format       ,
    t.daily_month_title_format       ,
    t.daily_month_open_format        ,
    t.daily_month_close_format       ,
    t.daily_day_title_format         ,
    t.daily_day_open_format          ,
    t.daily_day_close_format         ,
    t.daily_today_open_format        ,
    t.daily_time_open_format         ,
    t.daily_time_close_format        ,
    t.daily_time_title_format        ,
    t.daily_hour_open_format         ,
    t.daily_hour_close_format        ,
    t.agenda_format                  ,
    t.agenda_past_day_format         ,
    t.agenda_today_day_format        ,
    t.agenda_future_day_format       ,
    t.agenda_past_entry_format       ,
    t.agenda_today_entry_format      ,
    t.agenda_future_entry_format     ,
    t.month_data_format              ,
    t.month_data_entry_format        ,
    t.TEMPLATE_COMMENTS              component_comment,
    t.id                             calendar_template_id,
    --
    t.NAME
    ||' t='||t.THEME_ID
    ||' c='||t.THEME_CLASS_ID
    component_signature
from WWV_FLOW_CAL_TEMPLATES t,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = t.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_TEMP_BUTTON" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"THEME_NUMBER",
"THEME_CLASS",
"TEMPLATE_NAME",
"TEMPLATE",
"HOT_TEMPLATE",
"IS_SUBSCRIBED",
"SUBSCRIBED_FROM",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"TRANSLATABLE",
"COMPONENT_COMMENT",
"BUTTON_TEMPLATE_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    t.THEME_ID                       theme_number,
    decode(t.THEME_CLASS_ID,
       '1','Button',
       '2','Button, Alternative 3',
       '4','Button, Alternative 1',
       '5','Button, Alternative 2',
       '6','Custom 1',
       '7','Custom 2',
       '8','Custom 3',
       '9','Custom 4',
       '10','Custom 5',
       '11','Custom 6',
       '12','Custom 7',
       '13','Custom 8',
       t.THEME_CLASS_ID)             theme_class,
    --
    t.TEMPLATE_NAME                  template_name,
    t.TEMPLATE,
    t.hot_template,
    --
    decode(t.REFERENCE_ID,
    null,'No','Yes')                 is_subscribed,
    (select flow_id||'. '||name
     from WWV_FLOW_button_TEMPLATES
     where id = t.REFERENCE_ID)      subscribed_from,
    --
    t.LAST_UPDATED_BY                last_updated_by,
    t.LAST_UPDATED_ON                last_updated_on,
    --
    decode(t.TRANSLATE_THIS_TEMPLATE,
      'Y','Yes','N','No','Yes')      translatable,
    t.TEMPLATE_COMMENT               component_comment,
    t.id                             button_template_id,
    --
    t.template_name
    ||' t='||t.THEME_ID
    ||' c='||t.THEME_CLASS_ID
    component_signature
from WWV_FLOW_button_TEMPLATES t,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = t.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_TEMP_POPUPLOV" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"POPUP_ICON",
"POPUP_ICON_ATTR",
"POPUP_ICON2",
"POPUP_ICON_ATTR2",
"PAGE_TITLE",
"PAGE_HTML_HEAD",
"PAGE_BODY_ATTR",
"BEFORE_FIELD_TEXT",
"AFTER_FIELD_TEXT",
"PAGE_HEADING_TEXT",
"PAGE_FOOTER_TEXT",
"BEFORE_RESULT_SET",
"AFTER_RESULT_SET",
"FILTER_WIDTH",
"FILTER_MAX_WIDTH",
"FILTER_TEXT_ATTR",
"FIND_BUTTON_TEXT",
"FIND_BUTTON_IMAGE",
"FIND_BUTTON_ATTR",
"CLOSE_BUTTON_TEXT",
"CLOSE_BUTTON_IMAGE",
"CLOSE_BUTTON_ATTR",
"NEXT_BUTTON_TEXT",
"NEXT_BUTTON_IMAGE",
"NEXT_BUTTON_ATTR",
"PREV_BUTTON_TEXT",
"PREV_BUTTON_IMAGE",
"PREV_BUTTON_ATTR",
"SCROLLBARS",
"RESIZABLE",
"WIDTH",
"HEIGHT",
"RESULT_ROW_X_OF_Y",
"RESULT_ROWS_PER_PG",
"WHEN_NO_DATA_FOUND_MESSAGE",
"BEFORE_FIRST_FETCH_MESSAGE",
"MINIMUM_CHARACTERS_REQUIRED",
"THEME_NUMBER",
"THEME_CLASS",
"IS_SUBSCRIBED",
"SUBSCRIBED_FROM",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY",
"TRANSLATABLE",
"COMPONENT_COMMENT",
"TEMPLATE_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.ID                             application_id,
    f.NAME                           application_name,
    --
    t.POPUP_ICON                     ,
    t.POPUP_ICON_ATTR                ,
    t.POPUP_ICON2                    ,
    t.POPUP_ICON_ATTR2               ,
    --t.PAGE_NAME                      ,
    t.PAGE_TITLE                     ,
    t.PAGE_HTML_HEAD                 ,
    t.PAGE_BODY_ATTR                 ,
    t.BEFORE_FIELD_TEXT              ,
    t.AFTER_FIELD_TEXT               ,
    t.PAGE_HEADING_TEXT              ,
    t.PAGE_FOOTER_TEXT               ,
    t.BEFORE_RESULT_SET              ,
    t.AFTER_RESULT_SET               ,
    t.FILTER_WIDTH                   ,
    t.FILTER_MAX_WIDTH               ,
    t.FILTER_TEXT_ATTR               ,
    t.FIND_BUTTON_TEXT               ,
    t.FIND_BUTTON_IMAGE              ,
    t.FIND_BUTTON_ATTR               ,
    t.CLOSE_BUTTON_TEXT              ,
    t.CLOSE_BUTTON_IMAGE             ,
    t.CLOSE_BUTTON_ATTR              ,
    t.NEXT_BUTTON_TEXT               ,
    t.NEXT_BUTTON_IMAGE              ,
    t.NEXT_BUTTON_ATTR               ,
    t.PREV_BUTTON_TEXT               ,
    t.PREV_BUTTON_IMAGE              ,
    t.PREV_BUTTON_ATTR               ,
    t.SCROLLBARS                     ,
    t.RESIZABLE                      ,
    t.WIDTH                          ,
    t.HEIGHT                         ,
    t.RESULT_ROW_X_OF_Y              ,
    t.RESULT_ROWS_PER_PG             ,
    t.WHEN_NO_DATA_FOUND_MESSAGE     ,
    t.BEFORE_FIRST_FETCH_MESSAGE     ,
    t.MINIMUM_CHARACTERS_REQUIRED    ,
    t.THEME_ID                       theme_number,
    --
    decode(t.THEME_CLASS_ID,
     '1','Standard',
     t.THEME_CLASS_ID)               theme_class,
    --
    decode(t.REFERENCE_ID,
    null,'No','Yes')                 is_subscribed,
    (select flow_id||'. '||name
     from WWV_FLOW_POPUP_LOV_TEMPLATE
     where id = t.REFERENCE_ID)      subscribed_from,
    --
    t.LAST_UPDATED_ON                last_updated_on,
    t.LAST_UPDATED_BY                last_updated_by,
    decode(t.TRANSLATE_THIS_TEMPLATE,
      'N','No','Y','Yes','Yes')      translatable,
    t.TEMPLATE_COMMENT               component_comment,
    t.id                             template_id,
    --
    'pop'
    ||' ='||substr(POPUP_ICON                 ,1,20)||length(POPUP_ICON                 )
    ||' ='||substr(POPUP_ICON_ATTR            ,1,20)||length(POPUP_ICON_ATTR            )
    ||' ='||substr(POPUP_ICON2                ,1,20)||length(POPUP_ICON2                )
    ||' ='||substr(POPUP_ICON_ATTR2           ,1,20)||length(POPUP_ICON_ATTR2           )
    ||' ='||substr(PAGE_TITLE                 ,1,20)||length(PAGE_TITLE                 )
    ||' ='||substr(PAGE_HTML_HEAD             ,1,20)||length(PAGE_HTML_HEAD             )
    ||' ='||substr(PAGE_BODY_ATTR             ,1,20)||length(PAGE_BODY_ATTR             )
    ||' ='||substr(BEFORE_FIELD_TEXT          ,1,20)||length(BEFORE_FIELD_TEXT          )
    ||' ='||substr(AFTER_FIELD_TEXT           ,1,20)||length(AFTER_FIELD_TEXT           )
    ||' ='||substr(PAGE_HEADING_TEXT          ,1,20)||length(PAGE_HEADING_TEXT          )
    ||' ='||substr(PAGE_FOOTER_TEXT           ,1,20)||length(PAGE_FOOTER_TEXT           )
    ||' ='||substr(BEFORE_RESULT_SET          ,1,20)||length(BEFORE_RESULT_SET          )
    ||' ='||substr(AFTER_RESULT_SET           ,1,20)||length(AFTER_RESULT_SET           )
    ||' ='||substr(FILTER_WIDTH               ,1,20)||length(FILTER_WIDTH               )
    ||' ='||substr(FILTER_MAX_WIDTH           ,1,20)||length(FILTER_MAX_WIDTH           )
    ||' ='||substr(FILTER_TEXT_ATTR           ,1,20)||length(FILTER_TEXT_ATTR           )
    ||' ='||substr(FIND_BUTTON_TEXT           ,1,20)||length(FIND_BUTTON_TEXT           )
    ||' ='||substr(FIND_BUTTON_IMAGE          ,1,20)||length(FIND_BUTTON_IMAGE          )
    ||' ='||substr(FIND_BUTTON_ATTR           ,1,20)||length(FIND_BUTTON_ATTR           )
    ||' ='||substr(CLOSE_BUTTON_TEXT          ,1,20)||length(CLOSE_BUTTON_TEXT          )
    ||' ='||substr(CLOSE_BUTTON_IMAGE         ,1,20)||length(CLOSE_BUTTON_IMAGE         )
    ||' ='||substr(CLOSE_BUTTON_ATTR          ,1,20)||length(CLOSE_BUTTON_ATTR          )
    ||' ='||substr(NEXT_BUTTON_TEXT           ,1,20)||length(NEXT_BUTTON_TEXT           )
    ||' ='||substr(NEXT_BUTTON_IMAGE          ,1,20)||length(NEXT_BUTTON_IMAGE          )
    ||' ='||substr(NEXT_BUTTON_ATTR           ,1,20)||length(NEXT_BUTTON_ATTR           )
    ||' ='||substr(PREV_BUTTON_TEXT           ,1,20)||length(PREV_BUTTON_TEXT           )
    ||' ='||substr(PREV_BUTTON_IMAGE          ,1,20)||length(PREV_BUTTON_IMAGE          )
    ||' ='||substr(PREV_BUTTON_ATTR           ,1,20)||length(PREV_BUTTON_ATTR           )
    ||' ='||substr(SCROLLBARS                 ,1,20)||length(SCROLLBARS                 )
    ||' ='||substr(RESIZABLE                  ,1,20)||length(RESIZABLE                  )
    ||' ='||substr(WIDTH                      ,1,20)||length(WIDTH                      )
    ||' ='||substr(HEIGHT                     ,1,20)||length(HEIGHT                     )
    ||' ='||substr(RESULT_ROW_X_OF_Y          ,1,20)||length(RESULT_ROW_X_OF_Y          )
    ||' ='||RESULT_ROWS_PER_PG
    ||' ='||substr(WHEN_NO_DATA_FOUND_MESSAGE ,1,20)||length(WHEN_NO_DATA_FOUND_MESSAGE )
    ||' ='||substr(BEFORE_FIRST_FETCH_MESSAGE ,1,20)||length(BEFORE_FIRST_FETCH_MESSAGE )
    ||' ='||substr(MINIMUM_CHARACTERS_REQUIRED,1,20)||length(MINIMUM_CHARACTERS_REQUIRED)
    ||' r='||decode(t.REFERENCE_ID,null,'N','Y')
    component_signature
from WWV_FLOW_POPUP_LOV_TEMPLATE t,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = t.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_TEMPLATES" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"THEME_NUMBER",
"TEMPLATE_TYPE",
"TEMPLATE_NAME",
"REFERENCE_COUNT",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY",
"IS_SUBSCRIBED",
"IS_DEFAULT",
"TEMPLATE_ID") AS
  select
  w.short_name                          workspace,
  w.display_name                        workspace_display_name,
  ff.ID                                 application_id,
  ff.NAME                               application_name,
  x.theme_id                            theme_number,
  decode(x.template_type,
  'PAGE','Page',
  'REGION','Region',
  'LABEL','Item Label',
  'LIST','List',
  'POPUP_LOV','Popup List of Values',
  'CALENDAR','Calendar',
  'MENU','Breadcrumb',
  'BUTTON','Button',
  'REPORT','Report',
  'GRID', 'Grid',
  x.template_type)                      template_type,
  x.template_name                       template_name,
  x.reference_count                     reference_count,
  x.last_updated_on                     last_updated_on,
  x.last_updated_by                     last_updated_by,
  decode(x.reference_id,null,
      'No',0,'No','Yes')                is_subscribed,
  decode(x.is_default,0,'No','Yes')     is_default,
  tid                                   template_id
from
     wwv_flows ff,
     wwv_flow_companies w,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d,
(
select
    flow_id,
    'POPUP_LOV' template_type,
    'Popup LOV' template_name,
    1 reference_count,
    last_updated_on,
    last_updated_by,
    null reference_id,
    1 is_default,
    0 preview,
    theme_id,
    id tid
from wwv_flow_popup_lov_template plt
union all
select
    flow_id,
    'CALENDAR' template_type,
    NAME template_name,
    (select count(*) from WWV_FLOW_CALS where template_id = c.id and flow_id = c.flow_id )+
    (select count(*) from wwv_flow_themes where flow_id = c.flow_id and theme_id = c.theme_id and default_calendar_template = c.id) reference_count,
    last_updated_on,
    last_updated_by,
    reference_id,
    (select count(*) from wwv_flow_themes where flow_id = c.flow_id and theme_id = c.theme_id and default_calendar_template = c.id) is_default,
    0 preview,
    theme_id,
    id tid
from wwv_flow_cal_templates c
union all
select
    flow_id,
    'MENU'   template_type,
    NAME     template_name,
    (select count(*) from wwv_flow_page_plugs r where r.flow_id = m.flow_id and r.menu_template_id = m.id)+
    (select count(*) from wwv_flow_themes where flow_id = m.flow_id and theme_id = m.theme_id and default_menu_template = m.id)
    reference_count,
    last_updated_on,
    last_updated_by,
    reference_id,
    (select count(*) from wwv_flow_themes where flow_id = m.flow_id and theme_id = m.theme_id and default_menu_template = m.id) is_default,
    0 preview,
    theme_id,
    id tid
from wwv_flow_menu_templates m
union all
select
    flow_id,
    'BUTTON'             template_type,
    TEMPLATE_NAME        template_name,
    (select count(*)
     from wwv_flow_step_buttons sb
     where sb.flow_id = b.flow_id and
           substr(sb.button_image,1,9) = 'template:' and
           substr(sb.button_image,10) = to_char(b.id))+
    (select count(*) from wwv_flow_step_items si
     where flow_id = b.flow_id and
     si.TAG_ATTRIBUTES = 'template:'||to_char(b.id))+
    (select count(*) from wwv_flow_themes where flow_id = b.flow_id and theme_id = b.theme_id and default_button_template = b.id) reference_count,
    last_updated_on,
    last_updated_by,
    reference_id,
    (select count(*) from wwv_flow_themes where flow_id = b.flow_id and theme_id = b.theme_id and default_button_template = b.id) is_default,
    0 preview,
    theme_id,
    id tid
from wwv_flow_button_templates b
union all
select
    flow_id,
    'LABEL' template_type,
    TEMPLATE_NAME template_name,
    (select count(*) from wwv_flow_step_items i where i.flow_id = f.flow_id and i.ITEM_FIELD_TEMPLATE = f.id)+
    (select count(*) from wwv_flow_themes where flow_id = f.flow_id and theme_id = f.theme_id and default_label_template = f.id) reference_count,
    last_updated_on, last_updated_by, reference_id,
    (select count(*) from wwv_flow_themes where flow_id = f.flow_id and theme_id = f.theme_id and default_label_template = f.id) is_default,
    0 preview,
    theme_id,
    id tid
from wwv_flow_field_templates f
union all
select
    flow_id,
    'LIST' template_type,
    l.LIST_TEMPLATE_NAME template_name,
    (select count(*) from wwv_flow_page_plugs p where p.flow_id = l.flow_id and p.list_template_id = l.id) +
    (select count(*) from wwv_flow_themes where flow_id = l.flow_id and theme_id = l.theme_id and default_list_template = l.id) reference_count,
    last_updated_on, last_updated_by, reference_id,
    (select count(*) from wwv_flow_themes where flow_id = l.flow_id and theme_id = l.theme_id and default_list_template = l.id) is_default,
    0 preview,
    theme_id,
    id tid
from wwv_flow_list_templates l
union all
select
    flow_id,
    'REPORT'                 template_type,
    ROW_TEMPLATE_NAME        template_name,
    (select count(*) from wwv_flow_page_plugs p where flow_id = ro.flow_id and p.PLUG_QUERY_ROW_TEMPLATE = ro.id) +
    (select count(*) from wwv_flow_themes where flow_id = ro.flow_id and theme_id = ro.theme_id and default_report_template = ro.id) reference_count,
    last_updated_on, last_updated_by, reference_id,
    (select count(*) from wwv_flow_themes where flow_id = ro.flow_id and theme_id = ro.theme_id and default_report_template = ro.id) is_default,
    ro.id preview,
    theme_id,
    id tid
from wwv_flow_row_templates ro
union all
select
    flow_id,
    'PAGE' template_type,
    name         template_name,
    (select count(*) from wwv_flow_steps s where flow_id = p.flow_id and s.step_template = p.id) +
    (select count(*) from wwv_flow_themes where flow_id = p.flow_id and theme_id = p.theme_id and DEFAULT_PAGE_TEMPLATE = p.id) +
    (select count(*) from wwv_flow_themes where flow_id = p.flow_id and theme_id = p.theme_id and error_template=p.id) +
    (select count(*) from wwv_flow_themes where flow_id = p.flow_id and theme_id = p.theme_id and printer_friendly_template=p.id) reference_count,
    last_updated_on, last_updated_by, reference_id,
    (select count(*) from wwv_flow_themes where flow_id = p.flow_id and theme_id = p.theme_id and DEFAULT_PAGE_TEMPLATE=p.id) is_default,
    p.id preview,
    theme_id,
    id tid
from wwv_flow_templates p
union all
select
    flow_id,
    'REGION' template_type,
    PAGE_PLUG_TEMPLATE_NAME template_name,
    (select count(*) from wwv_flow_page_plugs p where flow_id = r.flow_id and p.PLUG_TEMPLATE = r.id) +
    (select count(*) from wwv_flow_themes where flow_id = r.flow_id and theme_id = r.theme_id and default_region_template = r.id) reference_count,
    last_updated_on,
    last_updated_by,
    reference_id,
    (select count(*) from wwv_flow_themes where flow_id = r.flow_id and theme_id = r.theme_id and default_region_template = r.id)  is_default,
    r.id preview,
    theme_id,
    id tid
from wwv_flow_page_plug_templates r
) x
where (ff.owner  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      ff.security_group_id = w.PROVISIONING_COMPANY_ID and
      ff.id = x.flow_id and
      (d.sgid != 0 or nvl(ff.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_MAP" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"PAGE_TITLE",
"BREADCRUMB",
"FULL_BREADCRUMB",
"HELP_TEXT") AS
  select w.short_name                 workspace,
       w.display_name               workspace_display_name,
       p.flow_id                    application_id,
       (select name
        from wwv_flows
        where id = p.flow_id)       application_name,
       p.id                         page_id,
       p.name                       page_name,
       p.step_title                 page_title,
       --
       breadcrumb                   breadcrumb,
       ltrim((select max(short_name)
       from wwv_flow_menu_options b2
       where c.ggggg_parent_id = b2.id) ||
       ggggg_parent||' > '||
       gggg_parent||' > '||
       ggg_parent||' > '||
       great_grand_parent||' > '||
       grand_parent||' > '||
       parent_breadcrumb||' > '||
       breadcrumb,' >')             full_breadcrumb,
       help_text
from wwv_flow_steps p,
     wwv_flow_companies w,
(
select flow_id, page_id, breadcrumb_id, breadcrumb, parent_breadcrumb, grand_parent,
       great_grand_parent, ggg_parent,gggg_parent,
       (select max(short_name) from wwv_flow_menu_options b2
       where b.gggg_parent_id = b2.id and b.flow_id = b2.flow_id) ggggg_parent,
       (select max(parent_id) from wwv_flow_menu_options b2
       where b.gggg_parent_id = b2.id and b.flow_id = b2.flow_id) ggggg_parent_id
from
(
select flow_id, page_id, breadcrumb_id, breadcrumb, parent_breadcrumb, grand_parent,
       great_grand_parent, ggg_parent,
       (select max(short_name) from wwv_flow_menu_options b2
       where a.ggg_parent_id = b2.id and a.flow_id = b2.flow_id) gggg_parent,
       (select max(parent_id) from wwv_flow_menu_options b2
       where a.ggg_parent_id = b2.id and a.flow_id = b2.flow_id) gggg_parent_id
from
(
select flow_id, page_id, breadcrumb_id, breadcrumb, parent_breadcrumb, grand_parent,
       great_grand_parent,
       (select max(short_name) from wwv_flow_menu_options b2
       where z.great_grand_parent_id = b2.id and z.flow_id = b2.flow_id) ggg_parent,
       (select max(parent_id) from wwv_flow_menu_options b2
       where z.great_grand_parent_id = b2.id and z.flow_id = b2.flow_id) ggg_parent_id
from
(
select flow_id, page_id, breadcrumb_id, breadcrumb, parent_breadcrumb, grand_parent,
       (select max(short_name) from wwv_flow_menu_options b2
       where y.grand_parent_id = b2.id and y.flow_id = b2.flow_id) great_grand_parent,
       (select max(parent_id) from wwv_flow_menu_options b2
       where y.grand_parent_id = b2.id and y.flow_id = b2.flow_id) great_grand_parent_id
from
(
select flow_id, page_id, breadcrumb_id, breadcrumb, parent_breadcrumb,
       (select max(short_name) from wwv_flow_menu_options b2
       where x.parent_id = b2.id) grand_parent,
       (select max(parent_id) from wwv_flow_menu_options b2
       where x.parent_id = b2.id and x.flow_id = b2.flow_id) grand_parent_id
from
(
select flow_id, b.id breadcrumb_id, page_id, short_name breadcrumb,
       (select max(short_name) from wwv_flow_menu_options b2
       where b.parent_id = b2.id and b.flow_id = b2.flow_id) parent_breadcrumb,
       (select max(parent_id) from wwv_flow_menu_options b2
       where b.parent_id = b2.id and b.flow_id = b2.flow_id) parent_id
from wwv_flow_menu_options b
) x
) y
) z
) a
) b
) c
where p.id = c.page_id(+)
and  p.flow_id = c.flow_id
and  w.provisioning_company_id = p.flow_id
and (user = (select owner from wwv_flows where id = p.flow_id) or
     p.security_group_id = (select nvl(nv('FLOW_SECURITY_GROUP_ID'),0) sgid from sys.dual));

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_DICTIONARY" ("APEX_VIEW_NAME",
"COLUMN_ID",
"COLUMN_NAME",
"COMMENTS",
"COMMENT_TYPE",
"PARENT_VIEW") AS
  select apex_view_name,
       column_id,
       column_name,
       comments,
       comment_type,
       parent_view
from
(
select t.table_name   apex_view_name,
       t.column_id    column_id,
       t.column_name  column_name,
       c.comments     comments,
       'Column'       comment_type,
       case
         when        t.table_name      ='APEX_APPLICATIONS'              then 'APEX_WORKSPACES'
         when        t.table_name      ='APEX_APPLICATION_LOV_ENTRIES'   then 'APEX_APPLICATION_LOVS'
         when        t.table_name      ='APEX_APPLICATION_PAGE_ITEMS'    then 'APEX_APPLICATION_PAGE_REGIONS'
         when        t.table_name      ='APEX_APPLICATION_PAGE_BUTTONS'  then 'APEX_APPLICATION_PAGE_REGIONS'
         when        t.table_name      ='APEX_APPL_PLUGIN_ATTRIBUTES'    then 'APEX_APPL_PLUGINS'
         when        t.table_name      ='APEX_APPL_PLUGIN_ATTR_VALUES'   then 'APEX_APPL_PLUGIN_ATTRIBUTES'
         when        t.table_name      ='APEX_APPL_PLUGIN_FILES'         then 'APEX_APPL_PLUGINS'
         when        t.table_name      ='APEX_APPL_PLUGIN_EVENTS'        then 'APEX_APPL_PLUGINS'
         when        t.table_name      ='APEX_APPLICATION_LIST_ENTRIES'  then 'APEX_APPLICATION_LISTS'
         when        t.table_name      ='APEX_APPLICATION_TEMPLATES'     then 'APEX_APPLICATION_THEMES'
         when        t.table_name      ='APEX_APPLICATION_THEME_STYLES'  then 'APEX_APPLICATION_THEMES'
         when        t.table_name      ='APEX_APPL_THEME_DISPLAY_POINTS' then 'APEX_APPLICATION_THEMES'
         when        t.table_name      ='APEX_APPL_TEMP_PAGE_DP'         then 'APEX_APPLICATION_TEMP_PAGE'
         when        t.table_name      ='APEX_APPL_TEMP_REGION_DP'       then 'APEX_APPLICATION_TEMP_REGION'
         when substr(t.table_name,1,26)='APEX_APPLICATION_SUPP_OBJ_'     then 'APEX_APPLICATION_SUPP_OBJECTS'
         when substr(t.table_name,1,18)='APEX_WORKSPACE_LOG'             then 'APEX_WORKSPACE_ACTIVITY_LOG'
         when substr(t.table_name,1,21)='APEX_APPLICATION_TEMP'          then 'APEX_APPLICATION_THEMES'
         when substr(t.table_name,1,30)='APEX_APPLICATION_PAGE_RPT_COLS' then 'APEX_APPLICATION_PAGE_RPT'
         when substr(t.table_name,1,25)='APEX_APPLICATION_PAGE_RPT'      then 'APEX_APPLICATION_PAGE_REGIONS'
         when substr(t.table_name,1,30)='APEX_APPLICATION_PAGE_FLASH5_S' then 'APEX_APPLICATION_PAGE_FLASH5'
         when substr(t.table_name,1,29)='APEX_APPLICATION_PAGE_FLASH_S'  then 'APEX_APPLICATION_PAGE_FLASH_CH'
         when substr(t.table_name,1,27)='APEX_APPLICATION_PAGE_TREES'    then 'APEX_APPLICATION_PAGE_TREES'
         when substr(t.table_name,1,25)='APEX_APPLICATION_PAGE_IR_'      then 'APEX_APPLICATION_PAGE_IR'
         when        t.table_name      ='APEX_APPLICATION_PAGE_IR'       then 'APEX_APPLICATION_PAGE_REGIONS'
         when substr(t.table_name,1,28)='APEX_APPLICATION_PAGE_FLASH5'   then 'APEX_APPLICATION_PAGE_REGIONS'
         when substr(t.table_name,1,27)='APEX_APPLICATION_PAGE_FLASH'    then 'APEX_APPLICATION_PAGE_REGIONS'
         when        t.table_name      ='APEX_APPLICATION_PAGE_DA_ACTS'  then 'APEX_APPLICATION_PAGE_DA'
         when substr(t.table_name,1,22)='APEX_APPLICATION_PAGE_'         then 'APEX_APPLICATION_PAGES'
         when substr(t.table_name,1,15)='APEX_WORKSPACE_'                then 'APEX_WORKSPACES'
         when substr(t.table_name,1,17)='APEX_APPLICATION_' or
              substr(t.table_name,1,10)='APEX_APPL_'                     then 'APEX_APPLICATIONS'
         when        t.table_name      ='APEX_TEAM_FEEDBACK_FOLLOWUP'    then 'APEX_TEAM_FEEDBACK'
         when substr(t.table_name,1,10)='APEX_TEAM_'                     then 'APEX_WORKSPACES'
         when        t.table_name      ='APEX_WS_APPLICATIONS'           then 'APEX_WORKSPACES'
         when        t.table_name      ='APEX_WS_APP_PAGES'              then 'APEX_WS_APPLICATIONS'
         when        t.table_name      ='APEX_WS_DATA_GRID'              then 'APEX_WS_APPLICATIONS'
         when        t.table_name      ='APEX_WS_DATA_GRID_COL'          then 'APEX_WS_DATA_GRID'
         when        t.table_name      ='APEX_APPL_LOAD_TABLE_LOOKUPS'   then 'APEX_APPL_LOAD_TABLES'
         when        t.table_name      ='APEX_APPL_LOAD_TABLE_RULES'     then 'APEX_APPL_LOAD_TABLES'
         end         parent_view,
       case
         when        t.table_name      ='APEX_WORKSPACES'                then null
         when        t.table_name      ='APEX_APPLICATIONS'              then 'APEX_WORKSPACES/'
         when        t.table_name      ='APEX_APPLICATION_LOV_ENTRIES'   then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_LOVS/'
         when        t.table_name      ='APEX_APPLICATION_PAGE_ITEMS'    then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGE_REGIONS/'
         when        t.table_name      ='APEX_APPLICATION_PAGE_BUTTONS'  then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGE_REGIONS/'
         when        t.table_name      ='APEX_APPL_PLUGIN_ATTRIBUTES'    then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPL_PLUGINS/'
         when        t.table_name      ='APEX_APPL_PLUGIN_ATTR_VALUES'   then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPL_PLUGINS/APEX_APPL_PLUGIN_ATTRIBUTES/'
         when        t.table_name      ='APEX_APPL_PLUGIN_FILES'         then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPL_PLUGINS/'
         when        t.table_name      ='APEX_APPL_PLUGIN_EVENTS'        then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPL_PLUGINS/'
         when        t.table_name      ='APEX_APPLICATION_LIST_ENTRIES'  then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_LISTS/'
         when        t.table_name      ='APEX_APPLICATION_TEMPLATES'     then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_THEMES/'
         when        t.table_name      ='APEX_APPLICATION_THEME_STYLES'  then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_THEMES/'
         when        t.table_name      ='APEX_APPL_THEME_DISPLAY_POINTS' then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_THEMES/'
         when        t.table_name      ='APEX_APPL_TEMP_PAGE_DP'         then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_THEMES/APEX_APPLICATION_TEMP_PAGE/'
         when        t.table_name      ='APEX_APPL_TEMP_REGION_DP'       then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_THEMES/APEX_APPLICATION_TEMP_REGION/'
         when substr(t.table_name,1,18)='APEX_WORKSPACE_LOG'             then 'APEX_WORKSPACES/APEX_WORKSPACE_ACTIVITY_LOG/'
         when substr(t.table_name,1,26)='APEX_APPLICATION_SUPP_OBJ_'     then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_SUPP_OBJECTS/'
         when substr(t.table_name,1,21)='APEX_APPLICATION_TEMP'          then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_THEMES/'
         when substr(t.table_name,1,30)='APEX_APPLICATION_PAGE_RPT_COLS' then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/APEX_APPLICATION_PAGE_RPT/'
         when substr(t.table_name,1,25)='APEX_APPLICATION_PAGE_RPT'      then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/'
         when substr(t.table_name,1,30)='APEX_APPLICATION_PAGE_FLASH5_S' then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/APEX_APPLICATION_PAGE_FLASH5/'
         when substr(t.table_name,1,29)='APEX_APPLICATION_PAGE_FLASH_S'  then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/APEX_APPLICATION_PAGE_FLASH_CH/'
         when substr(t.table_name,1,25)='APEX_APPLICATION_PAGE_IR_'      then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/APEX_APPLICATION_PAGE_IR/'
         when        t.table_name      ='APEX_APPLICATION_PAGE_IR'       then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/'
         when substr(t.table_name,1,28)='APEX_APPLICATION_PAGE_FLASH5'   then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/'
         when substr(t.table_name,1,27)='APEX_APPLICATION_PAGE_FLASH'    then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/'
         when substr(t.table_name,1,27)='APEX_APPLICATION_PAGE_TREES'    then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/'
         when        t.table_name      ='APEX_APPLICATION_PAGE_DA_ACTS'  then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_DA/'
         when substr(t.table_name,1,22)='APEX_APPLICATION_PAGE_'         then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/'
         when substr(t.table_name,1,15)='APEX_WORKSPACE_'                then 'APEX_WORKSPACES/'
         when substr(t.table_name,1,17)='APEX_APPLICATION_'              then 'APEX_WORKSPACES/APEX_APPLICATIONS/'
         when        t.table_name      ='APEX_TEAM_FEEDBACK_FOLLOWUP'    then 'APEX_WORKSPACES/APEX_TEAM_FEEDBACK/'
         when substr(t.table_name,1,10)='APEX_TEAM_'                     then 'APEX_WORKSPACES/'
         when        t.table_name      ='APEX_WS_APPLICATIONS'           then 'APEX_WORKSPACES/'
         when        t.table_name      ='APEX_WS_APP_PAGES'              then 'APEX_WORKSPACES/APEX_WS_APPLICATIONS/'
         when        t.table_name      ='APEX_WS_DATA_GRID'              then 'APEX_WORKSPACES/APEX_WS_APPLICATIONS/'
         when        t.table_name      ='APEX_WS_DATA_GRID_COL'          then 'APEX_WORKSPACES/APEX_WS_APPLICATIONS/APEX_WS_DATA_GRID/'
     when        t.table_name      ='APEX_APPL_LOAD_TABLE_LOOKUPS'   then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPL_LOAD_TABLES/'
     when        t.table_name      ='APEX_APPL_LOAD_TABLE_RULES'     then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPL_LOAD_TABLES/'
         end ||t.table_name        path
from  sys.all_tab_columns t, sys.all_col_comments c
where t.owner = 'APEX_040200' and
      t.owner = c.owner and
      t.table_name = c.table_name and
      t.column_Name = c.column_name and
      (t.table_name like 'APEX\_APPL\_%' escape '\'
      or t.table_name like 'APEX_APPLICATION%'
      or t.table_name like 'APEX_TEAM%'
      or t.table_name like 'APEX_WORKSPACE%'
      or t.table_name = 'APEX_THEMES'
      or t.table_name like 'APEX_UI_DEFAULTS%'
      or t.table_name like 'APEX_WS%') and
      t.table_name != 'apex_dictionary'
union all
select t.view_name   apex_view_name,
       0             column_id,
       null          column_name,
       c.comments    apex_view_comments,
       'View'        comment_type,
       case
         when        t.view_name      ='APEX_APPLICATIONS'              then 'APEX_WORKSPACES'
         when        t.view_name      ='APEX_APPLICATION_LOV_ENTRIES'   then 'APEX_APPLICATION_LOVS'
         when        t.view_name      ='APEX_APPLICATION_PAGE_ITEMS'    then 'APEX_APPLICATION_PAGE_REGIONS'
         when        t.view_name      ='APEX_APPLICATION_PAGE_BUTTONS'  then 'APEX_APPLICATION_PAGE_REGIONS'
         when        t.view_name      ='APEX_APPL_PLUGIN_ATTRIBUTES'    then 'APEX_APPL_PLUGINS'
         when        t.view_name      ='APEX_APPL_PLUGIN_ATTR_VALUES'   then 'APEX_APPL_PLUGIN_ATTRIBUTES'
         when        t.view_name      ='APEX_APPL_PLUGIN_FILES'         then 'APEX_APPL_PLUGINS'
         when        t.view_name      ='APEX_APPL_PLUGIN_EVENTS'        then 'APEX_APPL_PLUGINS'
         when        t.view_name      ='APEX_APPLICATION_LIST_ENTRIES'  then 'APEX_APPLICATION_LISTS'
         when        t.view_name      ='APEX_APPLICATION_TEMPLATES'     then 'APEX_APPLICATION_THEMES'
         when        t.view_name      ='APEX_APPLICATION_THEME_STYLES'  then 'APEX_APPLICATION_THEMES'
         when        t.view_name      ='APEX_APPL_THEME_DISPLAY_POINTS' then 'APEX_APPLICATION_THEMES'
         when        t.view_name      ='APEX_APPL_TEMP_PAGE_DP'         then 'APEX_APPLICATION_TEMP_PAGE'
         when        t.view_name      ='APEX_APPL_TEMP_REGION_DP'       then 'APEX_APPLICATION_TEMP_REGION'
         when substr(t.view_name,1,26)='APEX_APPLICATION_SUPP_OBJ_'     then 'APEX_APPLICATION_SUPP_OBJECTS'
         when substr(t.view_name,1,18)='APEX_WORKSPACE_LOG'             then 'APEX_WORKSPACE_ACTIVITY_LOG'
         when substr(t.view_name,1,21)='APEX_APPLICATION_TEMP'          then 'APEX_APPLICATION_THEMES'
         when substr(t.view_name,1,30)='APEX_APPLICATION_PAGE_RPT_COLS' then 'APEX_APPLICATION_PAGE_RPT'
         when substr(t.view_name,1,25)='APEX_APPLICATION_PAGE_RPT'      then 'APEX_APPLICATION_PAGE_REGIONS'
         when substr(t.view_name,1,30)='APEX_APPLICATION_PAGE_FLASH5_S' then 'APEX_APPLICATION_PAGE_FLASH5'
         when substr(t.view_name,1,29)='APEX_APPLICATION_PAGE_FLASH_S'  then 'APEX_APPLICATION_PAGE_FLASH_CH'
         when substr(t.view_name,1,25)='APEX_APPLICATION_PAGE_IR_'      then 'APEX_APPLICATION_PAGE_IR'
         when        t.view_name      ='APEX_APPLICATION_PAGE_IR'       then 'APEX_APPLICATION_PAGE_PAGE_REGIONS'
         when substr(t.view_name,1,28)='APEX_APPLICATION_PAGE_FLASH5'   then 'APEX_APPLICATION_PAGE_REGIONS'
         when substr(t.view_name,1,27)='APEX_APPLICATION_PAGE_FLASH'    then 'APEX_APPLICATION_PAGE_REGIONS'
         when substr(t.view_name,1,27)='APEX_APPLICATION_PAGE_TREES'    then 'APEX_APPLICATION_PAGE_REGIONS'
         when        t.view_name      ='APEX_APPLICATION_PAGE_DA_ACTS'  then 'APEX_APPLICATION_PAGE_DA'
         when substr(t.view_name,1,22)='APEX_APPLICATION_PAGE_'         then 'APEX_APPLICATION_PAGES'
         when substr(t.view_name,1,15)='APEX_WORKSPACE_'                then 'APEX_WORKSPACES'
         when substr(t.view_name,1,17)='APEX_APPLICATION_' or
              substr(t.view_name,1,10)='APEX_APPL_'                     then 'APEX_APPLICATIONS'
         when        t.view_name      ='APEX_TEAM_FEEDBACK_FOLLOWUP'    then 'APEX_TEAM_FEEDBACK'
         when substr(t.view_name,1,10)='APEX_TEAM_'                     then 'APEX_WORKSPACES'
         when        t.view_name      ='APEX_WS_APPLICATIONS'           then 'APEX_WORKSPACES'
         when        t.view_name      ='APEX_WS_APP_PAGES'              then 'APEX_WS_APPLICATIONS'
         when        t.view_name      ='APEX_WS_DATA_GRID'              then 'APEX_WS_APPLICATIONS'
         when        t.view_name      ='APEX_WS_DATA_GRID_COL'          then 'APEX_WS_DATA_GRID'
         when        t.view_name      ='APEX_APPL_LOAD_TABLE_LOOKUPS'   then 'APEX_APPL_LOAD_TABLES'
         when        t.view_name      ='APEX_APPL_LOAD_TABLE_RULES'     then 'APEX_APPL_LOAD_TABLES'
         end         parent_view,
       case
         when        t.view_name      ='APEX_WORKSPACES'                then null
         when        t.view_name      ='APEX_APPLICATIONS'              then 'APEX_WORKSPACES/'
         when        t.view_name      ='APEX_APPLICATION_LOV_ENTRIES'   then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_LOVS/'
         when        t.view_name      ='APEX_APPLICATION_PAGE_ITEMS'    then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGE_REGIONS/'
         when        t.view_name      ='APEX_APPLICATION_PAGE_BUTTONS'  then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGE_REGIONS/'
         when        t.view_name      ='APEX_APPL_PLUGIN_ATTRIBUTES'    then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPL_PLUGINS/'
         when        t.view_name      ='APEX_APPL_PLUGIN_ATTR_VALUES'   then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPL_PLUGINS/APEX_APPL_PLUGIN_ATTRIBUTES/'
         when        t.view_name      ='APEX_APPL_PLUGIN_FILES'         then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPL_PLUGINS/'
         when        t.view_name      ='APEX_APPL_PLUGIN_EVENTS'        then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPL_PLUGINS/'
         when        t.view_name      ='APEX_APPLICATION_LIST_ENTRIES'  then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_LISTS/'
         when        t.view_name      ='APEX_APPLICATION_TEMPLATES'     then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_THEMES/'
         when        t.view_name      ='APEX_APPLICATION_THEME_STYLES'  then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_THEMES/'
         when        t.view_name      ='APEX_APPL_THEME_DISPLAY_POINTS' then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_THEMES/'
         when        t.view_name      ='APEX_APPL_TEMP_PAGE_DP'         then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_THEMES/APEX_APPLICATION_TEMP_PAGE/'
         when        t.view_name      ='APEX_APPL_TEMP_REGION_DP'       then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_THEMES/APEX_APPLICATION_TEMP_REGION/'
         when substr(t.view_name,1,18)='APEX_WORKSPACE_LOG'             then 'APEX_WORKSPACES/APEX_WORKSPACE_ACTIVITY_LOG/'
         when substr(t.view_name,1,26)='APEX_APPLICATION_SUPP_OBJ_'     then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_SUPP_OBJECTS/'
         when substr(t.view_name,1,21)='APEX_APPLICATION_TEMP'          then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_THEMES/'
         when substr(t.view_name,1,30)='APEX_APPLICATION_PAGE_RPT_COLS' then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/APEX_APPLICATION_PAGE_RPT/'
         when substr(t.view_name,1,25)='APEX_APPLICATION_PAGE_RPT'      then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/'
         when substr(t.view_name,1,30)='APEX_APPLICATION_PAGE_FLASH5_S' then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/APEX_APPLICATION_PAGE_FLASH5/'
         when substr(t.view_name,1,29)='APEX_APPLICATION_PAGE_FLASH_S'  then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/APEX_APPLICATION_PAGE_FLASH_CH/'
         when substr(t.view_name,1,25)='APEX_APPLICATION_PAGE_IR_'      then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/APEX_APPLICATION_PAGE_IR/'
         when        t.view_name      ='APEX_APPLICATION_PAGE_IR'       then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/'
         when substr(t.view_name,1,28)='APEX_APPLICATION_PAGE_FLASH5'   then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/'
         when substr(t.view_name,1,27)='APEX_APPLICATION_PAGE_FLASH'    then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/'
         when substr(t.view_name,1,27)='APEX_APPLICATION_PAGE_TREES'    then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_REGIONS/'
         when        t.view_name      ='APEX_APPLICATION_PAGE_DA_ACTS'  then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/APEX_APPLICATION_PAGE_DA/'
         when substr(t.view_name,1,22)='APEX_APPLICATION_PAGE_'         then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPLICATION_PAGES/'
         when substr(t.view_name,1,15)='APEX_WORKSPACE_'                then 'APEX_WORKSPACES/'
         when substr(t.view_name,1,17)='APEX_APPLICATION_'              then 'APEX_WORKSPACES/APEX_APPLICATIONS/'
         when substr(t.view_name,1,10)='APEX_APPL_'                     then 'APEX_WORKSPACES/APEX_APPLICATIONS/'
         when        t.view_name      ='APEX_TEAM_FEEDBACK_FOLLOWUP'    then 'APEX_WORKSPACES/APEX_TEAM_FEEDBACK/'
         when substr(t.view_name,1,10)='APEX_TEAM_'                     then 'APEX_WORKSPACES/'
         when        t.view_name      ='APEX_WS_APPLICATIONS'           then 'APEX_WORKSPACES/'
         when        t.view_name      ='APEX_WS_APP_PAGES'              then 'APEX_WORKSPACES/APEX_WS_APPLICATIONS/'
         when        t.view_name      ='APEX_WS_DATA_GRID'              then 'APEX_WORKSPACES/APEX_WS_APPLICATIONS/'
         when        t.view_name      ='APEX_WS_DATA_GRID_COL'          then 'APEX_WORKSPACES/APEX_WS_APPLICATIONS/APEX_WS_DATA_GRID/'
         when        t.view_name      ='APEX_APPL_LOAD_TABLE_LOOKUPS'   then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPL_LOAD_TABLES/'
         when        t.view_name      ='APEX_APPL_LOAD_TABLE_RULES'     then 'APEX_WORKSPACES/APEX_APPLICATIONS/APEX_APPL_LOAD_TABLES/'
         end ||t.view_name        path
from  sys.all_views t, sys.all_tab_comments c
where t.owner = 'APEX_040200' and
      t.owner = c.owner and
      t.view_name = c.table_name and
      (t.view_name like 'APEX\_APPL\_%' escape '\'
      or t.view_name like 'APEX_APPLICATION%'
      or t.view_name like 'APEX_WORKSPACE%'
      or t.view_name like 'APEX_TEAM%'
      or t.view_name = 'APEX_THEMES'
      or t.view_name like 'APEX_UI_DEFAULTS%'
      or t.view_name like 'APEX_WS%')
order by 7,2
) x;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WORKSPACE_ACCESS_LOG" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"USER_NAME",
"AUTHENTICATION_METHOD",
"APPLICATION_SCHEMA_OWNER",
"ACCESS_DATE",
"SECONDS_AGO",
"IP_ADDRESS",
"AUTHENTICATION_RESULT",
"CUSTOM_STATUS_TEXT",
"WORKSPACE_ID") AS
  select
    w.short_name             workspace,
    w.display_name           workspace_display_name,
    l.APPLICATION            application_id,
    f.name                   application_name,
    upper(l.LOGIN_NAME)      user_name,
    l.AUTHENTICATION_METHOD  authentication_method,
    l.OWNER                  application_schema_owner,
    l.ACCESS_DATE,
    86400 * (sysdate - l.access_date) seconds_ago,
    l.IP_ADDRESS,
    --l.REMOTE_USER,
    decode(nvl(l.authentication_result,0),
        0,'AUTH_SUCCESS',
        1,'AUTH_UNKNOWN_USER',
        2,'AUTH_ACCOUNT_LOCKED',
        3,'AUTH_ACCOUNT_EXPIRED',
        4,'AUTH_PASSWORD_INCORRECT',
        5,'AUTH_PASSWORD_FIRST_USE',
        6,'AUTH_ATTEMPTS_EXCEEDED',
        7,'AUTH_INTERNAL_ERROR',
        authentication_result) authentication_result,
    l.CUSTOM_STATUS_TEXT       custom_status_text,
    l.SECURITY_GROUP_ID        workspace_id
from WWV_FLOW_USER_ACCESS_LOG_V l,
     wwv_flow_companies w,
     wwv_flows f,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (l.security_group_id in (select security_group_id from  wwv_flow_company_schemas where schema  = cu) or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = l.security_group_id) and
       --
      l.security_group_id = w.PROVISIONING_COMPANY_ID and
      l.application = f.id(+) and
      l.ACCESS_DATE > sysdate - 14 and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WORKSPACE_ACTIVITY_LOG" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APEX_USER",
"APPLICATION_ID",
"APPLICATION_NAME",
"APPLICATION_SCHEMA_OWNER",
"PAGE_ID",
"PAGE_NAME",
"VIEW_DATE",
"THINK_TIME",
"SECONDS_AGO",
"LOG_CONTEXT",
"ELAPSED_TIME",
"ROWS_QUERIED",
"IP_ADDRESS",
"AGENT",
"APEX_SESSION_ID",
"ERROR_MESSAGE",
"ERROR_ON_COMPONENT_TYPE",
"ERROR_ON_COMPONENT_NAME",
"PAGE_VIEW_MODE",
"APPLICATION_INFO",
"INTERACTIVE_REPORT_ID",
"IR_SAVED_REPORT_ID",
"IR_SEARCH",
"WS_APPLICATION_ID",
"WS_PAGE_ID",
"WS_DATAGRID_ID",
"CONTENT_LENGTH",
"REGIONS_FROM_CACHE",
"WORKSPACE_ID") AS
  select
           w.short_name              workspace,
           w.display_name            workspace_display_name,
           l.userid                  apex_user,
           l.flow_id                 application_id,
           f.name                    application_name,
           f.owner                   application_schema_owner,
           l.step_id                 page_id,
           (select name
            from wwv_flow_steps
            where id = l.step_id and
                  flow_id = f.id)    page_name,
           l.time_stamp              view_date,
           round(86400 * (l.time_stamp - lag(l.time_stamp) over (order by l.time_stamp, l.flow_id, l.userid, l.session_id))) think_time,
           round(86400 * (sysdate - l.time_stamp))     seconds_ago,
           --l.component_type          component_type,
           --l.component_name          component_name,
           l.component_attribute     log_context,
           --l.information             page_view_information,
           l.elap                    elapsed_time,
           l.num_rows                rows_queried,
           l.ip_address              ip_address,
           l.USER_AGENT              agent,
           l.session_id              apex_session_id,
           l.sqlerrm                 error_message,
           l.sqlerrm_component_type  error_on_component_type,
           l.sqlerrm_component_name  error_on_component_name,
           decode(l.page_mode,
             'D','Dynamic',
             'C','Cache Created',
             'R','Cached',
             'P','Partial Page',
             'A','Page Processing',
             l.page_mode)            page_view_mode,
           l.application_info,
           -- ir log
           l.worksheet_id            interactive_report_id,
           l.ir_report_id            ir_saved_report_id,
           l.ir_search               ir_search,
           -- websheet log
           l.websheet_id             ws_application_id,
           l.webpage_id              ws_page_id,
           l.datagrid_id             ws_datagrid_id,
           --
           l.content_length,
           --
           nvl(l.cached_regions,0)   regions_from_cache,
           l.security_group_id       workspace_id
from wwv_flow_activity_log l,
     wwv_flow_companies w,
     wwv_flows f,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (l.security_group_id in (select security_group_id from  wwv_flow_company_schemas where schema = cu) or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = l.security_group_id) and
       --
      l.security_group_id = w.PROVISIONING_COMPANY_ID and
      l.flow_id = f.id(+) and
      l.time_stamp > sysdate - 14 and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WORKSPACE_LOG_SUMMARY" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_VIEWS",
"DISTINCT_PAGES",
"TOTAL_ELAPSED_TIME",
"AVERAGE_ELAPSED_TIME",
"MINIMUM_ELAPSED_TIME",
"MAXIMUM_ELAPSED_TIME",
"TOTAL_ROWS_QUERIED",
"IP_ADDRESSES",
"AGENTS",
"APEX_SESSIONS",
"PAGE_VIEWS_WITH_ERRORS",
"DYNAMIC_PAGE_VIEWS",
"CACHED_PAGE_VIEWS",
"FIRST_VIEW",
"LAST_VIEW",
"PERIOD_IN_DAYS") AS
  select
           w.short_name                           workspace,
           w.display_name                         workspace_display_name,
           l.flow_id                              application_id,
           f.name                                 application_name,
           count(*)                               page_views,
           count(distinct l.step_id)              distinct_pages,
           sum(l.elap)                            total_elapsed_time,
           avg(l.elap)                            average_elapsed_time,
           min(l.elap)                            minimum_elapsed_time,
           max(l.elap)                            maximum_elapsed_time,
           sum(l.num_rows)                        total_rows_queried,
           count(distinct l.ip_address)           ip_addresses,
           count(distinct l.USER_AGENT)           agents,
           count(distinct l.session_id)           apex_sessions,
           sum(decode(l.sqlerrm,null,0,1))        page_views_with_errors,
           sum(decode(l.page_mode,'D',1,'C',1,0)) dynamic_page_views,
           sum(decode(l.page_mode,'R',1,0))       cached_page_views,
           min(l.time_stamp)                      first_view,
           max(l.time_stamp)                      last_view,
           max(l.time_stamp)-min(l.time_stamp)    period_in_days
from wwv_flow_activity_log l,
     wwv_flows f,
     wwv_flow_companies w,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
       from sys.dual) d
where (l.security_group_id in (select security_group_id from  wwv_flow_company_schemas where schema = cu) or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
       d.sgid              = l.security_group_id) and
       --
       l.security_group_id = w.PROVISIONING_COMPANY_ID and
       l.flow_id = f.id(+) and
       l.time_stamp > sysdate - 14 and
      w.PROVISIONING_COMPANY_ID != 0
group by w.short_name, w.display_name, l.flow_id, f.name;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WORKSPACE_LOG_SUMMARY_USR" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APEX_USER",
"APPLICATIONS",
"PAGE_VIEWS",
"DISTINCT_PAGES",
"TOTAL_ELAPSED_TIME",
"AVERAGE_ELAPSED_TIME",
"MINIMUM_ELAPSED_TIME",
"MAXIMUM_ELAPSED_TIME",
"TOTAL_ROWS_QUERIED",
"DISTINCT_IP_ADDRESSES",
"DISTINCT_AGENTS",
"DISTINCT_APEX_SESSIONS",
"PAGE_VIEWS_WITH_ERRORS",
"DYNAMIC_PAGE_VIEWS",
"CACHED_PAGE_VIEWS",
"FIRST_VIEW",
"LAST_VIEW",
"PERIOD_IN_DAYS",
"LAST_1_MINUTE",
"LAST_5_MINUTES",
"LAST_10_MINUTES",
"LAST_15_MINUTES",
"LAST_30_MINUTES",
"LAST_1_HOUR",
"LAST_2_HOURS",
"LAST_6_HOURS",
"LAST_12_HOURS",
"LAST_24_HOURS",
"LAST_48_HOURS",
"LAST_7_DAYS",
"LAST_14_DAYS",
"TODAY_HH01",
"TODAY_HH02",
"TODAY_HH03",
"TODAY_HH04",
"TODAY_HH05",
"TODAY_HH06",
"TODAY_HH07",
"TODAY_HH08",
"TODAY_HH09",
"TODAY_HH10",
"TODAY_HH11",
"TODAY_HH12",
"TODAY_HH13",
"TODAY_HH14",
"TODAY_HH15",
"TODAY_HH16",
"TODAY_HH17",
"TODAY_HH18",
"TODAY_HH19",
"TODAY_HH20",
"TODAY_HH21",
"TODAY_HH22",
"TODAY_HH23",
"TODAY_HH24",
"TODAY") AS
  select
           w.short_name                           workspace,
           w.display_name                         workspace_display_name,
           nvl(l.userid,'PUBLIC')                 apex_user,
           count(distinct l.flow_id)              applications,
           count(*)                               page_views,
           count(distinct l.flow_id||'.'||l.step_id) distinct_pages,
           sum(l.elap)                            total_elapsed_time,
           avg(l.elap)                            average_elapsed_time,
           min(l.elap)                            minimum_elapsed_time,
           max(l.elap)                            maximum_elapsed_time,
           sum(l.num_rows)                        total_rows_queried,
           count(distinct l.ip_address)           distinct_ip_addresses,
           count(distinct l.USER_AGENT)           distinct_agents,
           count(distinct l.session_id)           distinct_apex_sessions,
           sum(decode(l.sqlerrm,null,0,1))        page_views_with_errors,
           sum(decode(l.page_mode,'D',1,'C',1,0)) dynamic_page_views,
           sum(decode(l.page_mode,'R',1,0))       cached_page_views,
           min(l.time_stamp)                      first_view,
           max(l.time_stamp)                      last_view,
           max(l.time_stamp)-min(l.time_stamp)    period_in_days,
           --
           sum(decode(greatest(s.the_date - (1/1440),l.time_stamp),l.time_stamp,1,0) )  last_1_minute,
           sum(decode(greatest(s.the_date - (5/1440),l.time_stamp),l.time_stamp,1,0) )  last_5_minutes,
           sum(decode(greatest(s.the_date - (10/1440),l.time_stamp),l.time_stamp,1,0) ) last_10_minutes,
           sum(decode(greatest(s.the_date - (15/1440),l.time_stamp),l.time_stamp,1,0) ) last_15_minutes,
           sum(decode(greatest(s.the_date - (30/1440),l.time_stamp),l.time_stamp,1,0) ) last_30_minutes,
           sum(decode(greatest(s.the_date - (1/24),l.time_stamp),l.time_stamp,1,0) )    last_1_hour,
           sum(decode(greatest(s.the_date - (2/24),l.time_stamp),l.time_stamp,1,0) )    last_2_hours,
           sum(decode(greatest(s.the_date - (6/24),l.time_stamp),l.time_stamp,1,0) )    last_6_hours,
           sum(decode(greatest(s.the_date - (2/24),l.time_stamp),l.time_stamp,1,0) )    last_12_hours,
           sum(decode(greatest(s.the_date - 1,l.time_stamp),l.time_stamp,1,0)      )    last_24_hours,
           sum(decode(greatest(s.the_date - 2,l.time_stamp),l.time_stamp,1,0)      )    last_48_hours,
           sum(decode(greatest(s.the_date - 7,l.time_stamp),l.time_stamp,1,0)      )    last_7_days,
           sum(decode(greatest(s.the_date - 14,l.time_stamp),l.time_stamp,1,0)     )    last_14_days,
           --
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'01',1,0),0))  today_HH01,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'02',1,0),0))  today_HH02,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'03',1,0),0))  today_HH03,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'04',1,0),0))  today_HH04,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'05',1,0),0))  today_HH05,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'06',1,0),0))  today_HH06,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'07',1,0),0))  today_HH07,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'08',1,0),0))  today_HH08,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'09',1,0),0))  today_HH09,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'10',1,0),0))  today_HH10,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'11',1,0),0))  today_HH11,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'12',1,0),0))  today_HH12,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'13',1,0),0))  today_HH13,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'14',1,0),0))  today_HH14,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'15',1,0),0))  today_HH15,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'16',1,0),0))  today_HH16,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'17',1,0),0))  today_HH17,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'18',1,0),0))  today_HH18,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'19',1,0),0))  today_HH19,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'20',1,0),0))  today_HH20,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'21',1,0),0))  today_HH21,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'22',1,0),0))  today_HH22,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'23',1,0),0))  today_HH23,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,decode(to_char(l.time_stamp,'HH24'),'24',1,0),0))  today_HH24,
           sum(decode(greatest(trunc(s.the_date),l.time_stamp),l.time_stamp,1,0))                                              today
from wwv_flow_activity_log l,
     wwv_flows f,
     wwv_flow_companies w,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d,
     (select sysdate the_date from sys.dual) s
where (l.security_group_id in (select security_group_id from  wwv_flow_company_schemas where schema = cu) or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
       d.sgid              = l.security_group_id) and
       --
       l.security_group_id = w.PROVISIONING_COMPANY_ID and
       l.flow_id = f.id(+) and
       l.time_stamp > sysdate - 14 and
      w.PROVISIONING_COMPANY_ID != 0
group by w.short_name, w.display_name, nvl(l.userid,'PUBLIC');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WORKSPACE_LOG_ARCHIVE" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"LOG_DAY",
"WORKSPACE_ID",
"APPLICATION_ID",
"PAGE_EVENTS",
"PAGE_VIEWS",
"PAGE_ACCEPTS",
"PARTIAL_PAGE_VIEWS",
"WEBSHEET_VIEWS",
"ROWS_FETCHED",
"IR_SEARCHES",
"DISTINCT_PAGES",
"DISTINCT_USERS",
"DISTINCT_SESSIONS",
"AVERAGE_RENDER_TIME",
"MEDIAN_RENDER_TIME",
"MAXIMUM_RENDER_TIME",
"TOTAL_RENDER_TIME",
"ERROR_COUNT",
"CONTENT_LENGTH") AS
  select
    w.short_name                           workspace,
    w.display_name                         workspace_display_name,
    l.LOG_DAY,
    l.WORKSPACE_ID,
    l.APPLICATION_ID,
    l.PAGE_EVENTS,
    l.PAGE_VIEWS,
    l.PAGE_ACCEPTS,
    l.PARTIAL_PAGE_VIEWS,
    l.WEBSHEET_VIEWS,
    l.ROWS_FETCHED,
    l.IR_SEARCHES,
    l.DISTINCT_PAGES,
    l.DISTINCT_USERS,
    l.DISTINCT_SESSIONS,
    l.AVERAGE_RENDER_TIME,
    l.MEDIAN_RENDER_TIME,
    l.MAXIMUM_RENDER_TIME,
    l.TOTAL_RENDER_TIME,
    l.ERROR_COUNT,
    l.content_length
from WWV_FLOW_LOG_HISTORY l,
     wwv_flow_companies w,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (l.workspace_id in (select security_group_id from  wwv_flow_company_schemas where schema = cu) or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = l.workspace_id) and
      l.workspace_id = w.PROVISIONING_COMPANY_ID and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_ALL_AUTH" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"COMPONENT_TYPE",
"COMPONENT_NAME",
"AUTHORIZATION_SCHEME",
"STATUS") AS
  select workspace, workspace_display_name, application_id, application_name, null page_id, 'Application'            component_type, application_name                component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATIONS                where authorization_scheme is not null
union all select workspace, workspace_display_name, application_id, application_name, null page_id, 'Breadcrumb Entry'       component_type, ENTRY_LABEL                     component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATION_BC_ENTRIES      where authorization_scheme is not null
union all select workspace, workspace_display_name, application_id, application_name, null page_id, 'Application Compuation' component_type, COMPUTATION_ITEM                component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATION_COMPUTATIONS    where authorization_scheme is not null
union all select workspace, workspace_display_name, application_id, application_name, null page_id, 'List Entry'             component_type, ENTRY_TEXT                      component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATION_LIST_ENTRIES    where authorization_scheme is not null
union all select workspace, workspace_display_name, application_id, application_name, null page_id, 'Navigation Bar'         component_type, ICON_SUBTEXT                    component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATION_NAV_BAR         where authorization_scheme is not null
union all select workspace, workspace_display_name, application_id, application_name, page_id,      'Page'                   component_type, page_name                       component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATION_PAGES           where authorization_scheme is not null
union all select workspace, workspace_display_name, application_id, application_name, page_id,      'Page Branch'            component_type, nvl(branch_name, substr(BRANCH_ACTION,1,30))      component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATION_PAGE_BRANCHES   where authorization_scheme is not null
union all select workspace, workspace_display_name, application_id, application_name, page_id,      'Page Button'            component_type, BUTTON_NAME                     component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATION_PAGE_BUTTONS    where authorization_scheme is not null
union all select workspace, workspace_display_name, application_id, application_name, page_id,      'Page Computation'       component_type, ITEM_NAME                       component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATION_PAGE_COMP       where authorization_scheme is not null
union all select workspace, workspace_display_name, application_id, application_name, page_id,      'Page Item'              component_type, item_name                       component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATION_PAGE_ITEMS      where authorization_scheme is not null
union all select workspace, workspace_display_name, application_id, application_name, page_id,      'Page Process'           component_type, process_name                    component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATION_PAGE_PROC       where authorization_scheme is not null
union all select workspace, workspace_display_name, application_id, application_name, page_id,      'Page Region'            component_type, region_name                     component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATION_PAGE_REGIONS    where authorization_scheme is not null
union all select workspace, workspace_display_name, application_id, application_name, page_id,      'Page Report Column'     component_type, region_name||'. '||column_alias component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATION_PAGE_RPT_COLS   where authorization_scheme is not null
union all select workspace, workspace_display_name, application_id, application_name, page_id,      'Page Validation'        component_type, VALIDATION_NAME                 component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATION_PAGE_VAL        where authorization_scheme is not null
union all select workspace, workspace_display_name, application_id, application_name, null page_id, 'Parent Tab'             component_type, tab_name                        component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATION_PARENT_TABS     where authorization_scheme is not null
union all select workspace, workspace_display_name, application_id, application_name, null page_id, 'Application Process'    component_type, process_name                    component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATION_PROCESSES       where authorization_scheme is not null
union all select workspace, workspace_display_name, application_id, application_name, null page_id, 'Tab'                    component_type, tab_name                        component_name, authorization_scheme, decode(replace(translate(authorization_scheme,'1234567890!','00000000000'),'0',null),null,'Invalid','Valid') status  from APEX_APPLICATION_TABS            where authorization_scheme is not null;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WORKSPACE_CLICKS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"CATEGORY",
"APEX_USER",
"CLICKDATE",
"CLICK_ID",
"CLICKER_IP",
"WORKSPACE_ID") AS
  select short_name                   workspace,
           display_name                 workspace_display_name,
           category                     category,
           flow_user                    apex_user,
           clickdate                    clickdate,
           a.id                         click_id,
           ip                           clicker_ip,
           provisioning_company_id      workspace_id
      from (select clickdate, category, l.id, flow_user, ip, w.provisioning_company_id,
                   w.short_name, w.display_name, w.first_schema_provisioned
              from wwv_flow_clickthru_log$ l, wwv_flow_companies w
             where l.security_group_id = w.provisioning_company_id
            union all
            select clickdate, category, l.id, flow_user, ip, w.provisioning_company_id,
                   w.short_name, w.display_name, w.first_schema_provisioned
              from wwv_flow_clickthru_log2$ l, wwv_flow_companies w
             where l.security_group_id = w.provisioning_company_id
            ) a,
            wwv_flow_company_schemas s,
            (select nvl(nv('FLOW_SECURITY_GROUP_ID'),0) sgid from sys.dual) d
      where s.security_group_id = a.provisioning_company_id
        and a.first_schema_provisioned = s.schema
        and (d.sgid = a.provisioning_company_id or user = s.schema or user in ('SYS','SYSTEM','APEX_040200')) and
      (user in ('SYS','SYSTEM', 'APEX_040200') or a.PROVISIONING_COMPANY_ID != 10);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPL_PLUGINS" ("PLUGIN_ID",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PLUGIN_TYPE",
"NAME",
"DISPLAY_NAME",
"CATEGORY",
"SUPPORTED_UI_TYPES",
"FILE_PREFIX",
"PLSQL_CODE",
"RENDER_FUNCTION",
"AJAX_FUNCTION",
"VALIDATION_FUNCTION",
"EXECUTION_FUNCTION",
"SESSION_SENTRY_FUNCTION",
"INVALID_SESSION_FUNCTION",
"AUTHENTICATION_FUNCTION",
"POST_LOGOUT_FUNCTION",
"BUILDER_VALIDATION_FUNCTION",
"MIGRATION_FUNCTION",
"STANDARD_ATTRIBUTES",
"SQL_MIN_COLUMN_COUNT",
"SQL_MAX_COLUMN_COUNT",
"SQL_EXAMPLES",
"SUBSTITUTE_ATTRIBUTES",
"IS_SUBSCRIBED",
"SUBSCRIBED_FROM",
"SUBSCRIBED_FROM_ID",
"SUBSCRIBE_PLUGIN_SETTINGS",
"HELP_TEXT",
"VERSION_IDENTIFIER",
"ABOUT_URL",
"COMPONENT_COMMENT",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_SIGNATURE",
"ATTRIBUTE_01",
"ATTRIBUTE_02",
"ATTRIBUTE_03",
"ATTRIBUTE_04",
"ATTRIBUTE_05",
"ATTRIBUTE_06",
"ATTRIBUTE_07",
"ATTRIBUTE_08",
"ATTRIBUTE_09",
"ATTRIBUTE_10",
"ATTRIBUTE_11",
"ATTRIBUTE_12",
"ATTRIBUTE_13",
"ATTRIBUTE_14",
"ATTRIBUTE_15") AS
  select p.id                        as plugin_id,
       f.workspace,
       f.workspace_display_name,
       f.application_id,
       f.application_name,
       case p.plugin_type
         when 'ITEM TYPE'           then 'Item Type'
         when 'DYNAMIC ACTION'      then 'Dynamic Action'
         when 'REGION TYPE'         then 'Region Type'
         when 'REPORT COLUMN TYPE'  then 'Report Column Type'
         when 'VALIDATION TYPE'     then 'Validation Type'
         when 'PROCESS TYPE'        then 'Process Type'
         when 'AUTHENTICATION TYPE' then 'Authentication Type'
         when 'AUTHORIZATION TYPE'  then 'Authorization Type'
         else                       p.plugin_type
       end                         as plugin_type,
       p.name,
       p.display_name,
       p.category,
       p.supported_ui_types,
       p.image_prefix              as file_prefix,
       p.plsql_code,
       p.render_function,
       p.ajax_function,
       p.validation_function,
       p.execution_function,
       p.session_sentry_function,
       p.invalid_session_function,
       p.authentication_function,
       p.post_logout_function,
       p.builder_validation_function,
       p.migration_function,
       p.standard_attributes,
       p.sql_min_column_count,
       p.sql_max_column_count,
       p.sql_examples,
       p.substitute_attributes,
       nvl2(p.reference_id, 'Yes', 'No') as is_subscribed,
       ( select s.flow_id||'. '||s.display_name
           from wwv_flow_plugins s
          where s.id = p.reference_id )  as subscribed_from,
       p.reference_id                    as subscribed_from_id,
       case p.subscribe_plugin_settings
         when 'Y' then 'Yes'
         else          'No'
       end                               as subscribe_plugin_settings,
       p.help_text,
       p.version_identifier,
       p.about_url,
       p.plugin_comment                  as component_comment,
       p.created_by,
       p.created_on,
       p.last_updated_by,
       p.last_updated_on,
       p.name || ' ' || substr(p.display_name, 1, 30) || length(p.display_name) ||
       ' t=' || p.plugin_type || ' c=' || p.category || ' v=' || p.version_identifier ||
       ' u=' || substr(p.about_url, 1, 30) || length(p.about_url)
       as component_signature,
       -- For compatibility with existing applications (bug# 14545162)
       -- Obsolete columns because they are accessible with view apex_appl_plugin_settings
       s.attribute_01,
       s.attribute_02,
       s.attribute_03,
       s.attribute_04,
       s.attribute_05,
       s.attribute_06,
       s.attribute_07,
       s.attribute_08,
       s.attribute_09,
       s.attribute_10,
       s.attribute_11,
       s.attribute_12,
       s.attribute_13,
       s.attribute_14,
       s.attribute_15
  from wwv_flow_authorized f,
       wwv_flow_plugins p,
       wwv_flow_plugin_settings s
 where p.flow_id         = f.application_id
   and s.flow_id (+)     = p.flow_id
   and s.plugin_type (+) = p.plugin_type
   and s.plugin (+)      = 'PLUGIN_' || p.name;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPL_PLUGIN_ATTRIBUTES" ("PLUGIN_ATTRIBUTE_ID",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PLUGIN_ID",
"PLUGIN_NAME",
"ATTRIBUTE_SCOPE",
"ATTRIBUTE_SEQUENCE",
"DISPLAY_SEQUENCE",
"PROMPT",
"ATTRIBUTE_TYPE",
"IS_REQUIRED",
"DEFAULT_VALUE",
"DISPLAY_LENGTH",
"MAX_LENGTH",
"SQL_MIN_COLUMN_COUNT",
"SQL_MAX_COLUMN_COUNT",
"COLUMN_DATA_TYPES",
"IS_TRANSLATABLE",
"DEPENDING_ON_ATTRIBUTE_ID",
"DEPENDING_ON_CONDITION_TYPE",
"DEPENDING_ON_EXPRESSION",
"HELP_TEXT",
"COMPONENT_COMMENT",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select a.id                 as plugin_attribute_id,
       f.workspace,
       f.workspace_display_name,
       f.application_id,
       f.application_name,
       a.plugin_id,
       p.name               as plugin_name,
       case a.attribute_scope
         when 'APPLICATION' then 'Application'
         when 'COMPONENT'   then 'Component'
         else a.attribute_scope
       end                  as attribute_scope,
       a.attribute_sequence,
       a.display_sequence,
       a.prompt,
       case a.attribute_type
         when 'CHECKBOX'         then 'Checkbox'
         when 'SELECT LIST'      then 'Select List'
         when 'TEXT'             then 'Text'
         when 'TEXTAREA'         then 'Textarea'
         when 'NUMBER'           then 'Number'
         when 'INTEGER'          then 'Integer'
         when 'PAGE ITEM'        then 'Page Item'
         when 'PAGE ITEMS'       then 'Page Items'
         when 'PAGE NUMBER'      then 'Page Number'
         when 'SQL'              then 'SQL Query'
         when 'PLSQL'            then 'PL/SQL Code'
         when 'PLSQL EXPRESSION' then 'PL/SQL Expression'
         else a.attribute_type
       end                  as attribute_type,
       case a.is_required
         when 'Y' then 'Yes'
         else          'No'
       end                  as is_required,
       a.default_value,
       a.display_length,
       a.max_length,
       a.sql_min_column_count,
       a.sql_max_column_count,
       a.column_data_types,
       a.is_translatable,
       a.depending_on_attribute_id,
       case a.depending_on_condition_type
         when 'EQUALS'       then 'equal to'
         when 'NOT_EQUALS'   then 'not equal to'
         when 'NULL'         then 'is null'
         when 'NOT_NULL'     then 'is not null'
         when 'IN_LIST'      then 'in list'
         when 'NOT_IN_LIST'  then 'not in list'
         else a.depending_on_condition_type
       end depending_on_condition_type,
       a.depending_on_expression,
       a.help_text,
       a.attribute_comment  as component_comment,
       a.created_by,
       a.created_on,
       a.last_updated_by,
       a.last_updated_on
  from wwv_flow_authorized f,
       wwv_flow_plugins p,
       wwv_flow_plugin_attributes a
 where p.flow_id   = f.application_id
   and a.plugin_id = p.id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPL_PLUGIN_ATTR_VALUES" ("PLUGIN_ATTRIBUTE_VALUE_ID",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PLUGIN_ATTRIBUTE_ID",
"PLUGIN_ATTRIBUTE_PROMPT",
"DISPLAY_SEQUENCE",
"DISPLAY_VALUE",
"RETURN_VALUE",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select v.id                 as plugin_attribute_value_id,
       f.workspace,
       f.workspace_display_name,
       f.application_id,
       f.application_name,
       v.plugin_attribute_id,
       a.prompt             as plugin_attribute_prompt,
       v.display_sequence,
       v.display_value,
       v.return_value,
       v.created_by,
       v.created_on,
       v.last_updated_by,
       v.last_updated_on
  from wwv_flow_authorized f,
       wwv_flow_plugin_attr_values v,
       wwv_flow_plugin_attributes a
 where v.flow_id = f.application_id
   and a.id      = v.plugin_attribute_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPL_PLUGIN_FILES" ("PLUGIN_FILE_ID",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PLUGIN_ID",
"PLUGIN_NAME",
"FILE_NAME",
"MIME_TYPE",
"FILE_CHARSET",
"FILE_CONTENT",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select a.id                 as plugin_file_id,
       f.workspace,
       f.workspace_display_name,
       f.application_id,
       f.application_name,
       a.plugin_id,
       p.name               as plugin_name,
       a.file_name,
       a.mime_type,
       a.file_charset,
       a.file_content,
       a.created_by,
       a.created_on,
       a.last_updated_by,
       a.last_updated_on
  from wwv_flow_authorized f,
       wwv_flow_plugins p,
       wwv_flow_plugin_files a
 where p.flow_id   = f.application_id
   and a.plugin_id = p.id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPL_PLUGIN_EVENTS" ("PLUGIN_EVENT_ID",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PLUGIN_ID",
"PLUGIN_NAME",
"NAME",
"DISPLAY_NAME",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select e.id                 as plugin_event_id,
       f.workspace,
       f.workspace_display_name,
       f.application_id,
       f.application_name,
       e.plugin_id,
       p.name               as plugin_name,
       e.name,
       e.display_name,
       e.created_by,
       e.created_on,
       e.last_updated_by,
       e.last_updated_on
  from wwv_flow_authorized f,
       wwv_flow_plugins p,
       wwv_flow_plugin_events e
 where p.flow_id   = f.application_id
   and e.plugin_id = p.id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPL_PLUGIN_SETTINGS" ("PLUGIN_SETTING_ID",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PLUGIN_TYPE",
"PLUGIN",
"PLUGIN_CODE",
"ATTRIBUTE_01",
"ATTRIBUTE_02",
"ATTRIBUTE_03",
"ATTRIBUTE_04",
"ATTRIBUTE_05",
"ATTRIBUTE_06",
"ATTRIBUTE_07",
"ATTRIBUTE_08",
"ATTRIBUTE_09",
"ATTRIBUTE_10",
"ATTRIBUTE_11",
"ATTRIBUTE_12",
"ATTRIBUTE_13",
"ATTRIBUTE_14",
"ATTRIBUTE_15",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select p.id                        as plugin_setting_id,
       f.workspace,
       f.workspace_display_name,
       f.application_id,
       f.application_name,
       p.plugin_type,
       case substr(p.plugin, 1, 7)
         when 'NATIVE_' then
             ( select display_name from wwv_flow_plugins where flow_id = 4411 and plugin_type = p.plugin_type and name = substr(p.plugin, 8) )
         when 'PLUGIN_' then
             ( select display_name from wwv_flow_plugins where flow_id = p.flow_id and plugin_type = p.plugin_type and name = substr(p.plugin, 8) )
         else p.plugin
       end            as plugin,
       p.plugin       as plugin_code,
       p.attribute_01,
       p.attribute_02,
       p.attribute_03,
       p.attribute_04,
       p.attribute_05,
       p.attribute_06,
       p.attribute_07,
       p.attribute_08,
       p.attribute_09,
       p.attribute_10,
       p.attribute_11,
       p.attribute_12,
       p.attribute_13,
       p.attribute_14,
       p.attribute_15,
       p.created_by,
       p.created_on,
       p.last_updated_by,
       p.last_updated_on
  from wwv_flow_authorized f,
       wwv_flow_plugin_settings p
 where p.flow_id = f.application_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_FLASH_CH" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"REGION_ID",
"REGION_NAME",
"CHART_ID",
"CHART_TYPE",
"CHART_TITLE",
"CHART_WIDTH",
"CHART_HEIGHT",
"CHART_ANIMATION",
"DISPLAY_ATTR",
"DIAL_TICK_ATTR",
"MARGINS",
"OMIT_LABEL_INTERVAL",
"COLOR_SCHEME",
"CUSTOM_COLORS",
"BGTYPE",
"BGCOLOR1",
"BGCOLOR2",
"GRADIENT_ROTATION",
"X_AXIS_TITLE",
"X_AXIS_MIN",
"X_AXIS_MAX",
"X_AXIS_GRID_SPACING",
"X_AXIS_PREFIX",
"X_AXIS_POSTFIX",
"X_AXIS_GROUP_SEP",
"X_AXIS_DECIMAL_PLACE",
"Y_AXIS_TITLE",
"Y_AXIS_MIN",
"Y_AXIS_MAX",
"Y_AXIS_GRID_SPACING",
"Y_AXIS_PREFIX",
"Y_AXIS_POSTFIX",
"Y_AXIS_GROUP_SEP",
"Y_AXIS_DECIMAL_PLACE",
"ASYNC_UPDATE",
"ASYNC_TIME",
"NAMES_FONT",
"NAMES_ROTATION",
"VALUES_FONT",
"VALUES_ROTATION",
"HINTS_FONT",
"LEGEND_FONT",
"GRID_LABELS_FONT",
"CHART_TITLE_FONT",
"X_AXIS_TITLE_FONT",
"Y_AXIS_TITLE_FONT",
"USE_CHART_XML",
"CHART_XML",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.id                             application_id,
    f.name                           application_name,
    p.id                             page_id,
    p.name                           page_name,
    c.region_id                      region_id,
    (select plug_name
     from wwv_flow_page_plugs
     where id = c.region_id)         region_name,
    c.id                             chart_id,
    decode(c.default_chart_type,
    '2DColumn', '2D Column',
    '2DColumn_Line', '2D Column Line',
    '2DDoughnut', '2D Doughnut',
    '2DLine', '2D Line',
    '2DPie', '2D Pie',
    '3DColumn', '3D Column',
    '3DPie', '3D Pie',
    'Candlestick', 'Candlestick',
    'GaugeChart', 'Dial',
    'DIALSWEEP', 'Dial (Sweep)',
    'Horizontal2DColumn', 'Horizontal 2D Column',
    'Horizontal3DColumn', 'Horizontal 3D Column',
    'HorizontalRange3DColumn', 'Horizontal Range 3D Column',
    'HorizontalRange2DColumn', 'HorizontalRange 2D Column',
    'Inverse2DLine', 'Inverse 2D Line',
    'Range2DColumn', 'Range 2D Column',
    'Range3DColumn', 'Range 3D Column',
    'dot', 'Scatter',
    'Stacked2DColumn', 'Stacked 2D Column',
    '2DSTACKED_PCT', 'Stacked 2D Column (Percent)',
    'Stacked3DColumn', 'Stacked 3D Column',
    '3DSTACKED_PCT', 'Stacked 3D Column (Percent)',
    'StackedHorizontal2DColumn', 'Stacked Horizontal 2D Column',
    '2DHSTACKED_PCT', 'Stacked Horizontal 2D Column (Percent)',
    'StackedHorizontal3DColumn', 'Stacked Horizontal 3D Column',
    '3DHSTACKED_PCT', 'Stacked Horizontal 3D Column (Percent)',
    c.default_chart_type)            chart_type,
    c.chart_title                    chart_title,
    c.chart_width                    chart_width,
    c.chart_height                   chart_height,
    c.chart_animation                chart_animation,
    c.display_attr                   display_attr,
    c.dial_tick_attr                 dial_tick_attr,
    c.margins                        margins,
    c.omit_label_interval            omit_label_interval,
    c.color_scheme                   color_scheme,
    c.custom_colors                  custom_colors,
    c.bgtype                         bgtype,
    c.bgcolor1                       bgcolor1,
    c.bgcolor2                       bgcolor2,
    c.gradient_rotation              gradient_rotation,
    c.x_axis_title                   x_axis_title,
    c.x_axis_min                     x_axis_min,
    c.x_axis_max                     x_axis_max,
    c.x_axis_grid_spacing            x_axis_grid_spacing,
    c.x_axis_prefix                  x_axis_prefix,
    c.x_axis_postfix                 x_axis_postfix,
    c.x_axis_group_sep               x_axis_group_sep,
    c.x_axis_decimal_place           x_axis_decimal_place,
    c.y_axis_title                   y_axis_title,
    c.y_axis_min                     y_axis_min,
    c.y_axis_max                     y_axis_max,
    c.y_axis_grid_spacing            y_axis_grid_spacing,
    c.y_axis_prefix                  y_axis_prefix,
    c.y_axis_postfix                 y_axis_postfix,
    c.y_axis_group_sep               y_axis_group_sep,
    c.y_axis_decimal_place           y_axis_decimal_place,
    c.async_update                   async_update,
    c.async_time                     async_time,
    c.names_font                     names_font,
    c.names_rotation                 names_rotation,
    c.values_font                    values_font,
    c.values_rotation                values_rotation,
    c.hints_font                     hints_font,
    c.legend_font                    legend_font,
    c.grid_labels_font               grid_labels_font,
    c.chart_title_font               chart_title_font,
    c.x_axis_title_font              x_axis_title_font,
    c.y_axis_title_font              y_axis_title_font,
    c.use_chart_xml                  use_chart_xml,
    c.chart_xml                      chart_xml,
    --
    c.updated_by                     last_updated_by,
    c.updated_on                     last_updated_on,
    --
    decode(c.default_chart_type,
    '2DColumn', '2D Column',
    '2DColumn_Line', '2D Column Line',
    '2DDoughnut', '2D Doughnut',
    '2DLine', '2D Line',
    '2DPie', '2D Pie',
    '3DColumn', '3D Column',
    '3DPie', '3D Pie',
    'Candlestick', 'Candlestick',
    'GaugeChart', 'Dial',
    'DIALSWEEP', 'Dial (Sweep)',
    'Horizontal2DColumn', 'Horizontal 2D Column',
    'Horizontal3DColumn', 'Horizontal 3D Column',
    'HorizontalRange3DColumn', 'Horizontal Range 3D Column',
    'HorizontalRange2DColumn', 'HorizontalRange 2D Column',
    'Inverse2DLine', 'Inverse 2D Line',
    'Range2DColumn', 'Range 2D Column',
    'Range3DColumn', 'Range 3D Column',
    'dot', 'Scatter',
    'Stacked2DColumn', 'Stacked 2D Column',
    '2DSTACKED_PCT', 'Stacked 2D Column (Percent)',
    'Stacked3DColumn', 'Stacked 3D Column',
    '3DSTACKED_PCT', 'Stacked 3D Column (Percent)',
    'StackedHorizontal2DColumn', 'Stacked Horizontal 2D Column',
    '2DHSTACKED_PCT', 'Stacked Horizontal 2D Column (Percent)',
    'StackedHorizontal3DColumn', 'Stacked Horizontal 3D Column',
    '3DHSTACKED_PCT', 'Stacked Horizontal 3D Column (Percent)',
    c.default_chart_type)
    ||' attr='||c.chart_width||c.chart_height||c.chart_animation||c.display_attr||c.dial_tick_attr||c.margins||c.omit_label_interval
    ||' color='||c.color_scheme||substr(c.custom_colors,1,20)||'.'||length(c.custom_colors)
               ||c.bgtype||substr(c.bgcolor1,1,20)||'.'||length(c.bgcolor1)||substr(c.bgcolor2,1,20)||'.'||length(c.bgcolor2)
    ||' rotation='||c.gradient_rotation||':'||c.names_rotation||':'||c.values_rotation
    ||' title='||substr(c.chart_title,1,20)||'.'||length(c.chart_title)
    ||substr(c.x_axis_title,1,20)||'.'||length(c.x_axis_title)
    ||substr(c.y_axis_title,1,20)||'.'||length(c.y_axis_title)
    ||' axis='||c.x_axis_min||':'||c.x_axis_max||':'||c.x_axis_grid_spacing||substr(c.x_axis_prefix,1,20)||':'||substr(c.x_axis_postfix,1,20)||':'||c.x_axis_group_sep||':'||c.x_axis_decimal_place
              ||c.y_axis_min||':'||c.y_axis_max||':'||c.y_axis_grid_spacing||substr(c.y_axis_prefix,1,20)||':'||substr(c.y_axis_postfix,1,20)||':'||c.y_axis_group_sep||':'||c.y_axis_decimal_place
    ||' font='||c.names_font||c.values_font||c.hints_font||c.legend_font||c.grid_labels_font||c.chart_title_font||c.x_axis_title_font||c.y_axis_title_font
    ||' xml='||decode(c.use_chart_xml,'Y',
                      sys.dbms_lob.substr(c.chart_xml,30,1)||'.'||sys.dbms_lob.getlength(c.chart_xml),
                      null)
    ||' refresh='||c.async_update||c.async_time
    component_signature
from wwv_flow_flash_charts c,
     wwv_flow_steps p,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = p.security_group_id and
      f.id = p.flow_id and
      f.id = c.flow_id and
      p.id = c.page_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_FLASH_S" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"REGION_ID",
"REGION_NAME",
"CHART_ID",
"SERIES_ID",
"SERIES_SEQ",
"SERIES_NAME",
"SERIES_QUERY",
"SERIES_QUERY_TYPE",
"SERIES_QUERY_PARSE_OPT",
"SERIES_QUERY_NO_DATA_FOUND",
"SERIES_QUERY_ROW_COUNT_MAX",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.id                             application_id,
    f.name                           application_name,
    c.page_id                        page_id,
    (select name
     from wwv_flow_steps
     where id = c.page_id
     and flow_id = c.flow_id)        page_name,
    c.region_id                      region_id,
    (select plug_name
     from wwv_flow_page_plugs
     where id = c.region_id
     and flow_id = c.flow_id)        region_name,
    --
    cs.chart_id                      chart_id,
    cs.id                            series_id,
    cs.series_seq                    series_seq,
    cs.series_name                   series_name,
    cs.series_query                  series_query,
    cs.series_query_type             series_query_type,
    cs.series_query_parse_opt        series_query_parse_opt,
    cs.series_query_no_data_found    series_query_no_data_found,
    cs.series_query_row_count_max    series_query_row_count_max,
    cs.updated_on                    last_updated_on,
    cs.updated_by                    last_updated_by,
    --
    cs.series_name
    ||' seq='||lpad(cs.series_seq,5,'00000')
    ||' q='||sys.dbms_lob.substr(cs.series_query,20,1)||'.'||sys.dbms_lob.getlength(cs.series_query)
    ||' max='||cs.series_query_row_count_max
    ||' nd_msg='|| substr(cs.series_query_no_data_found ,1,20)||length(cs.series_query_no_data_found)
    component_signature
from wwv_flow_flash_chart_series cs,
     wwv_flow_flash_charts c,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = cs.flow_id and
      c.id = cs.chart_id and
      c.flow_id = cs.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_FLASH5" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"REGION_ID",
"REGION_NAME",
"CHART_ID",
"CHART_TYPE",
"CHART_RENDERING",
"CHART_TITLE",
"CHART_NAME",
"CHART_WIDTH",
"CHART_HEIGHT",
"CHART_ANIMATION",
"PIE_ATTR",
"DISPLAY_ATTR",
"DIAL_TICK_ATTR",
"GANTT_ATTR",
"GANTT_DATE_FORMAT",
"GANTT_START_DATE",
"GANTT_END_DATE",
"MAP_ATTR",
"MAP_SOURCE",
"MARGINS",
"COLOR_SCHEME",
"CUSTOM_COLORS",
"MAP_UNDEF_COLOR_SCHEME",
"MAP_UNDEF_CUSTOM_COLORS",
"CHART_BGTYPE",
"CHART_BGCOLOR",
"CHART_BGCOLOR2",
"CHART_BGCORNERS",
"CHART_GRADIENT_ANGLE",
"GRID_BGTYPE",
"GRID_BGCOLOR",
"GRID_BGCOLOR2",
"GRID_GRADIENT_ANGLE",
"X_AXIS_TITLE",
"X_AXIS_TITLE_FONT",
"X_AXIS_TITLE_ROTATION",
"X_AXIS_MIN",
"X_AXIS_MAX",
"X_AXIS_SCROLL_START",
"X_AXIS_SCROLL_END",
"X_AXIS_SCROLL_RANGE",
"X_AXIS_SCROLL_RANGE_UNIT",
"X_AXIS_LABEL_ROTATION",
"X_AXIS_LABEL_FONT",
"X_AXIS_PREFIX",
"X_AXIS_POSTFIX",
"X_AXIS_DECIMAL_PLACE",
"X_AXIS_MAJOR_INTERVAL",
"X_AXIS_MINOR_INTERVAL",
"Y_AXIS_TITLE",
"Y_AXIS_TITLE_FONT",
"Y_AXIS_TITLE_ROTATION",
"Y_AXIS_MIN",
"Y_AXIS_MAX",
"Y_AXIS_SCROLL_START",
"Y_AXIS_SCROLL_END",
"Y_AXIS_SCROLL_RANGE",
"Y_AXIS_SCROLL_RANGE_UNIT",
"Y_AXIS_LABEL_ROTATION",
"Y_AXIS_LABEL_FONT",
"Y_AXIS_PREFIX",
"Y_AXIS_POSTFIX",
"Y_AXIS_DECIMAL_PLACE",
"Y_AXIS_MAJOR_INTERVAL",
"Y_AXIS_MINOR_INTERVAL",
"VALUES_PREFIX",
"VALUES_POSTFIX",
"ASYNC_UPDATE",
"ASYNC_TIME",
"VALUES_FONT",
"VALUES_ROTATION",
"TOOLTIP_FONT",
"LEGEND_TITLE",
"LEGEND_FONT",
"LEGEND_TITLE_FONT",
"GRID_LABELS_FONT",
"CHART_TITLE_FONT",
"GAUGE_LABELS_FONT",
"USE_CHART_XML",
"CHART_XML",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.id                             application_id,
    f.name                           application_name,
    p.id                             page_id,
    p.name                           page_name,
    c.region_id                      region_id,
    (select plug_name
     from wwv_flow_page_plugs
     where id = c.region_id)         region_name,
    c.id                             chart_id,
    decode(c.chart_type,
    '2DColumn', '2D Column',
    '2DColumn_Line', '2D Column Line',
    '2DDoughnut', '2D Doughnut',
    '2DLine', '2D Line',
    '2DPie', '2D Pie',
    '3DColumn', '3D Column',
    '3DPie', '3D Pie',
    'Candlestick', 'Candlestick',
    'GaugeChart', 'Dial',
    'DIALSWEEP', 'Dial (Sweep)',
    'Horizontal2DColumn', 'Horizontal 2D Column',
    'Horizontal3DColumn', 'Horizontal 3D Column',
    'HorizontalRange3DColumn', 'Horizontal Range 3D Column',
    'HorizontalRange2DColumn', 'HorizontalRange 2D Column',
    'Inverse2DLine', 'Inverse 2D Line',
    'Range2DColumn', 'Range 2D Column',
    'Range3DColumn', 'Range 3D Column',
    'dot', 'Scatter',
    'ScatterMarker','Scatter',
    'Stacked2DColumn', 'Stacked 2D Column',
    '2DSTACKED_PCT', 'Stacked 2D Column (Percent)',
    'Stacked3DColumn', 'Stacked 3D Column',
    '3DSTACKED_PCT', 'Stacked 3D Column (Percent)',
    'StackedHorizontal2DColumn', 'Stacked Horizontal 2D Column',
    '2DHSTACKED_PCT', 'Stacked Horizontal 2D Column (Percent)',
    'StackedHorizontal3DColumn', 'Stacked Horizontal 3D Column',
    '3DHSTACKED_PCT', 'Stacked Horizontal 3D Column (Percent)',
    'ProjectGantt','Project Gantt',
    'ResourceGantt','Resource Gantt',
    'Map','Map',
    c.chart_type)                    chart_type,
    decode(c.chart_rendering,
    'FLASH_PREFERRED','Flash Chart',
    'SVG_ONLY','HTML5 Chart')        chart_rendering,
    c.chart_title                    chart_title,
    c.chart_name                     chart_name,
    c.chart_width                    chart_width,
    c.chart_height                   chart_height,
    c.chart_animation                chart_animation,
    c.pie_attr                       pie_attr,
    c.display_attr                   display_attr,
    c.dial_tick_attr                 dial_tick_attr,
    c.gantt_attr                     gantt_attr,
    c.gantt_date_format              gantt_date_format,
    c.gantt_start_date               gantt_start_date,
    c.gantt_end_date                 gantt_end_date,
    c.map_attr                       map_attr,
    c.map_source                     map_source,
    c.margins                        margins,
    c.color_scheme                   color_scheme,
    c.custom_colors                  custom_colors,
    c.map_undef_color_scheme         map_undef_color_scheme,
    c.map_undef_custom_colors        map_undef_custom_colors,
    c.chart_bgtype                   chart_bgtype,
    c.chart_bgcolor                  chart_bgcolor,
    c.chart_bgcolor2                 chart_bgcolor2,
    c.chart_bgcorners                chart_bgcorners,
    c.chart_gradient_angle           chart_gradient_angle,
    c.grid_bgtype                    grid_bgtype,
    c.grid_bgcolor                   grid_bgcolor,
    c.grid_bgcolor2                  grid_bgcolor2,
    c.grid_gradient_angle            grid_gradient_angle,
    c.x_axis_title                   x_axis_title,
    c.x_axis_title_font              x_axis_title_font,
    c.x_axis_title_rotation          x_axis_title_rotation,
    c.x_axis_min                     x_axis_min,
    c.x_axis_max                     x_axis_max,
    c.x_axis_scroll_start            x_axis_scroll_start,
    c.x_axis_scroll_end              x_axis_scroll_end,
    c.x_axis_scroll_range            x_axis_scroll_range,
    c.x_axis_scroll_range_unit       x_axis_scroll_range_unit,
    c.x_axis_label_rotation          x_axis_label_rotation,
    c.x_axis_label_font              x_axis_label_font,
    c.x_axis_prefix                  x_axis_prefix,
    c.x_axis_postfix                 x_axis_postfix,
    c.x_axis_decimal_place           x_axis_decimal_place,
    c.x_axis_major_interval          x_axis_major_interval,
    c.x_axis_minor_interval          x_axis_minor_interval,
    c.y_axis_title                   y_axis_title,
    c.y_axis_title_font              y_axis_title_font,
    c.y_axis_title_rotation          y_axis_title_rotation,
    c.y_axis_min                     y_axis_min,
    c.y_axis_max                     y_axis_max,
    c.y_axis_scroll_start            y_axis_scroll_start,
    c.y_axis_scroll_end              y_axis_scroll_end,
    c.y_axis_scroll_range            y_axis_scroll_range,
    c.y_axis_scroll_range_unit       y_axis_scroll_range_unit,
    c.y_axis_label_rotation          y_axis_label_rotation,
    c.y_axis_label_font              y_axis_label_font,
    c.y_axis_prefix                  y_axis_prefix,
    c.y_axis_postfix                 y_axis_postfix,
    c.y_axis_decimal_place           y_axis_decimal_place,
    c.y_axis_major_interval          y_axis_major_interval,
    c.y_axis_minor_interval          y_axis_minor_interval,
    c.values_prefix                  values_prefix,
    c.values_postfix                 values_postfix,
    c.async_update                   async_update,
    c.async_time                     async_time,
    c.values_font                    values_font,
    c.values_rotation                values_rotation,
    c.tooltip_font                   tooltip_font,
    c.legend_title                   legend_title,
    c.legend_font                    legend_font,
    c.legend_title_font              legend_title_font,
    c.grid_labels_font               grid_labels_font,
    c.chart_title_font               chart_title_font,
    c.gauge_labels_font              gauge_labels_font,
    c.use_chart_xml                  use_chart_xml,
    c.chart_xml                      chart_xml,
    --
    c.updated_by                     last_updated_by,
    c.updated_on                     last_updated_on,
    --
    decode(c.chart_type,
    '2DColumn', '2D Column',
    '2DColumn_Line', '2D Column Line',
    '2DDoughnut', '2D Doughnut',
    '2DLine', '2D Line',
    '2DPie', '2D Pie',
    '3DColumn', '3D Column',
    '3DPie', '3D Pie',
    'Candlestick', 'Candlestick',
    'GaugeChart', 'Dial',
    'DIALSWEEP', 'Dial (Sweep)',
    'Horizontal2DColumn', 'Horizontal 2D Column',
    'Horizontal3DColumn', 'Horizontal 3D Column',
    'HorizontalRange3DColumn', 'Horizontal Range 3D Column',
    'HorizontalRange2DColumn', 'HorizontalRange 2D Column',
    'Inverse2DLine', 'Inverse 2D Line',
    'Range2DColumn', 'Range 2D Column',
    'Range3DColumn', 'Range 3D Column',
    'dot', 'Scatter',
    'ScatterMarker','Scatter',
    'Stacked2DColumn', 'Stacked 2D Column',
    '2DSTACKED_PCT', 'Stacked 2D Column (Percent)',
    'Stacked3DColumn', 'Stacked 3D Column',
    '3DSTACKED_PCT', 'Stacked 3D Column (Percent)',
    'StackedHorizontal2DColumn', 'Stacked Horizontal 2D Column',
    '2DHSTACKED_PCT', 'Stacked Horizontal 2D Column (Percent)',
    'StackedHorizontal3DColumn', 'Stacked Horizontal 3D Column',
    '3DHSTACKED_PCT', 'Stacked Horizontal 3D Column (Percent)',
    'ProjectGantt','Project Gantt',
    'ResourceGantt','Resource Gantt',
    'Map','Map',
    c.chart_type)
    ||' attr='||c.chart_width||c.chart_height||c.chart_animation||c.display_attr||c.dial_tick_attr||c.gantt_attr||c.map_attr||c.pie_attr||c.margins
    ||' rendering='||decode(c.chart_rendering,'FLASH_PREFERRED','Flash Chart','SVG_ONLY','HTML5 Chart')
    ||' color='||c.color_scheme||substr(c.custom_colors,1,20)||'.'||length(c.custom_colors)
               ||c.map_undef_color_scheme||substr(c.map_undef_custom_colors,1,20)||'.'||length(c.map_undef_custom_colors)
               ||c.chart_bgtype||substr(c.chart_bgcolor,1,20)||'.'||length(c.chart_bgcolor)||substr(c.chart_bgcolor2,1,20)||'.'||length(c.chart_bgcolor2)
               ||c.grid_bgtype||substr(c.grid_bgcolor,1,20)||'.'||length(c.grid_bgcolor)||substr(c.grid_bgcolor2,1,20)||'.'||length(c.grid_bgcolor2)
    ||' rotation='||c.chart_gradient_angle||':'||c.grid_gradient_angle||':'||c.x_axis_title_rotation||':'||c.x_axis_label_rotation||':'||c.y_axis_title_rotation||':'||c.y_axis_label_rotation||':'||c.values_rotation
    ||' title='||substr(c.chart_title,1,20)||'.'||length(c.chart_title)
    ||substr(c.x_axis_title,1,20)||'.'||length(c.x_axis_title)
    ||substr(c.y_axis_title,1,20)||'.'||length(c.y_axis_title)
    ||' name='||substr(c.chart_name,1,20)||'.'||length(c.chart_name)
    ||' axis='||c.x_axis_min||':'||c.x_axis_max||':'||substr(c.x_axis_prefix,1,20)||':'||substr(c.x_axis_postfix,1,20)||':'||c.x_axis_decimal_place
              ||':'||c.x_axis_major_interval||':'||c.x_axis_minor_interval||':'
              ||c.y_axis_min||':'||c.y_axis_max||':'||substr(c.y_axis_prefix,1,20)||':'||substr(c.y_axis_postfix,1,20)||':'||c.y_axis_decimal_place
              ||':'||c.y_axis_major_interval||':'||c.y_axis_minor_interval||':'||substr(c.values_prefix,1,20)||':'||substr(c.values_postfix,1,20)
    ||' font='||c.x_axis_label_font||c.y_axis_label_font||c.values_font||c.tooltip_font||c.legend_title_font||c.legend_font||c.grid_labels_font||c.gauge_labels_font||c.chart_title_font||c.x_axis_title_font||c.y_axis_title_font
    ||' xml='||decode(c.use_chart_xml,'Y',
                      sys.dbms_lob.substr(c.chart_xml,30,1)||'.'||sys.dbms_lob.getlength(c.chart_xml),
                      null)
    ||' refresh='||c.async_update||c.async_time
    component_signature
from wwv_flow_flash_charts_5 c,
     wwv_flow_steps p,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = p.security_group_id and
      f.id = p.flow_id and
      f.id = c.flow_id and
      p.id = c.page_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_FLASH5_S" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"PAGE_NAME",
"REGION_ID",
"REGION_NAME",
"CHART_ID",
"SERIES_ID",
"SERIES_SEQ",
"SERIES_NAME",
"SERIES_TYPE",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"BUILD_OPTION",
"BUILD_OPTION_ID",
"SERIES_QUERY_TYPE",
"SERIES_QUERY",
"SERIES_AJAX_ITEMS_TO_SUBMIT",
"SERIES_QUERY_PARSE_OPT",
"SERIES_QUERY_NO_DATA_FOUND",
"SERIES_QUERY_ROW_COUNT_MAX",
"ACTION_LINK",
"SHOW_ACTION_LINK",
"ACTION_LINK_CHECKSUM_TYPE",
"CONDITION_TYPE",
"CONDITION_TYPE_CODE",
"CONDITION_EXPRESSION1",
"CONDITION_EXPRESSION2",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.id                             application_id,
    f.name                           application_name,
    c.page_id                        page_id,
    (select name
     from wwv_flow_steps
     where id = c.page_id
     and flow_id = c.flow_id)        page_name,
    c.region_id                      region_id,
    (select plug_name
     from wwv_flow_page_plugs
     where id = c.region_id
     and flow_id = c.flow_id)        region_name,
    --
    cs.chart_id                      chart_id,
    cs.id                            series_id,
    cs.series_seq                    series_seq,
    cs.series_name                   series_name,
    cs.series_type                   series_type,
    decode(substr(cs.series_required_role,1,1),'!','Not ')||
    nvl((select name
     from   wwv_flow_security_schemes
     where  to_char(id) = ltrim(cs.series_required_role,'!')
     and    flow_id = f.id),
     cs.series_required_role)        authorization_scheme,
    cs.series_required_role          authorization_scheme_id,
    (select case when cs.required_patch > 0 then PATCH_NAME else '{Not '||PATCH_NAME||'}' end PATCH_NAME
     from   wwv_flow_patches
     where  id =abs(cs.REQUIRED_PATCH))   build_option,
    cs.required_patch                build_option_id,
    cs.series_query_type             series_query_type,
    cs.series_query                  series_query,
    cs.series_ajax_items_to_submit   series_ajax_items_to_submit,
    cs.series_query_parse_opt        series_query_parse_opt,
    cs.series_query_no_data_found    series_query_no_data_found,
    cs.series_query_row_count_max    series_query_row_count_max,
    cs.action_link                   action_link,
    cs.show_action_link              show_action_link,
    cs.action_link_checksum_type     action_link_checksum_type,
    nvl((select r from apex_standard_conditions where d = cs.DISPLAY_WHEN_COND_TYPE),cs.DISPLAY_WHEN_COND_TYPE)
                                     condition_type,
    cs.display_when_cond_type        condition_type_code,
    cs.DISPLAY_WHEN_CONDITION        condition_expression1,
    cs.DISPLAY_WHEN_CONDITION2       condition_expression2,
    cs.updated_on                    last_updated_on,
    cs.updated_by                    last_updated_by,
    --
    cs.series_name
    ||' seq='||lpad(cs.series_seq,5,'00000')
    ||' q='||sys.dbms_lob.substr(cs.series_query,20,1)||'.'||sys.dbms_lob.getlength(cs.series_query)
    ||' max='||cs.series_query_row_count_max
    ||' nd_msg='|| substr(cs.series_query_no_data_found ,1,20)||length(cs.series_query_no_data_found)
    ||' link='||substr(cs.action_link,1,20)||':'||cs.show_action_link
    component_signature
from wwv_flow_flash_chart5_series cs,
     wwv_flow_flash_charts_5 c,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = cs.flow_id and
      c.id = cs.chart_id and
      c.flow_id = cs.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_IR" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"INTERACTIVE_REPORT_ID",
"REGION_ID",
"REGION_NAME",
"NUMBER_OF_COLUMNS",
"NUMBER_OF_COLUMN_GROUPS",
"NUMBER_OF_ALT_DEFAULT_REPORTS",
"NUMBER_OF_PUBLIC_REPORTS",
"NUMBER_OF_PRIVATE_REPORTS",
"MAX_ROW_COUNT",
"MAX_ROW_COUNT_MESSAGE",
"NO_DATA_FOUND_MESSAGE",
"MAX_ROWS_PER_PAGE",
"SEARCH_BUTTON_LABEL",
"PAGE_ITEMS_TO_SUBMIT",
"SORT_ASC_IMAGE",
"SORT_ASC_IMAGE_ATTR",
"SORT_DESC_IMAGE",
"SORT_DESC_IMAGE_ATTR",
"BASE_TABLE_OR_VIEW",
"SQL_QUERY",
"SHOW_NULLS_AS",
"PAGINATION_SCHEME",
"PAGINATION_DISPLAY_POSITION",
"BUTTON_TEMPLATE",
"SHOW_FINDER_DROP_DOWN",
"SHOW_REPORTS_SELECT_LIST",
"SHOW_DISPLAY_ROW_COUNT",
"SHOW_SEARCH_BAR",
"SHOW_SEARCH_TEXTBOX",
"SHOW_ACTIONS_MENU",
"ACTIONS_MENU_ICON",
"FINDER_ICON",
"SHOW_SELECT_COLUMNS",
"SHOW_ROWS_PER_PAGE",
"SHOW_FILTER",
"SHOW_SORT",
"SHOW_CONTROL_BREAK",
"SHOW_HIGHLIGHT",
"SHOW_COMPUTE",
"SHOW_AGGREGATE",
"SHOW_CHART",
"SHOW_GROUP_BY",
"SHOW_NOTIFY",
"SHOW_FLASHBACK",
"SHOW_SAVE",
"SHOW_SAVE_PUBLIC",
"SAVE_PUBLIC_AUTH_SCHEME",
"SAVE_PUBLIC_AUTH_SCHEME_ID",
"SHOW_RESET",
"SHOW_DOWNLOAD",
"SHOW_HELP",
"DOWNLOAD_FORMATS",
"FILENAME",
"SEPARATOR",
"ENCLOSED_BY",
"DETAIL_LINK_TYPE",
"DETAIL_LINK_TARGET",
"DETAIL_LINK_TEXT",
"DETAIL_LINK_ATTRIBUTES",
"DETAIL_LINK_CHECKSUM_TYPE",
"DETAIL_LINK_CONDITION_TYPE",
"DETAIL_LINK_COND_TYPE_CODE",
"DETAIL_LINK_COND_EXPRESSION",
"DETAIL_LINK_COND_EXPRESSION2",
"DETAIL_LINK_AUTH_SCHEME",
"DETAIL_LINK_AUTH_SCHEME_ID",
"ALIAS",
"REPORT_ID_ITEM",
"MAX_QUERY_COST",
"EMAIL_FROM",
"ICON_VIEW_ENABLED_YN",
"ICON_VIEW_USE_CUSTOM",
"ICON_VIEW_CUSTOM_LINK",
"ICON_VIEW_LINK_COLUMN",
"ICON_VIEW_IMG_SRC_COLUMN",
"ICON_VIEW_LABEL_COLUMN",
"ICON_VIEW_IMG_ATTR_TEXT",
"ICON_VIEW_ALT_TEXT",
"ICON_VIEW_TITLE_TEXT",
"ICON_VIEW_COLUMNS_PER_ROW",
"DETAIL_VIEW_ENABLED_YN",
"DETAIL_VIEW_BEFORE_ROWS",
"DETAIL_VIEW_FOR_EACH_ROW",
"DETAIL_VIEW_AFTER_ROWS",
"INTERNAL_UID",
"CREATED_ON",
"CREATED_BY",
"UPDATED_ON",
"UPDATED_BY",
"COMPONENT_SIGNATURE") AS
  select
w.short_name                 workspace,
w.display_name               workspace_display_name,
f.id                         application_id,
f.name                       application_name,
ir.page_id                   page_id,
ir.id                        interactive_report_id,
ir.region_id                 region_id,
r.plug_name                  region_name,
--
(select count(*) from wwv_flow_worksheet_columns where worksheet_id = ir.id) number_of_columns,
(select count(*) from wwv_flow_worksheet_col_groups where worksheet_id = ir.id) number_of_column_groups,
(select count(*) from wwv_flow_worksheet_rpts where worksheet_id = ir.id and session_id is null and nvl(is_default,'N')='Y' and application_user='APXWS_ALTERNATIVE') number_of_alt_default_reportS,
(select count(*) from wwv_flow_worksheet_rpts where worksheet_id = ir.id and session_id is null and nvl(is_default,'N')='N' and status='PUBLIC') number_of_public_reports,
(select count(*) from wwv_flow_worksheet_rpts where worksheet_id = ir.id and session_id is null and nvl(is_default,'N')='N' and status='PRIVATE') number_of_private_reports,
ir.max_row_count             ,
ir.max_row_count_message     ,
ir.no_data_found_message     ,
ir.max_rows_per_page         ,
ir.search_button_label       ,
r.ajax_items_to_submit       page_items_to_submit, /* Only for compatibility */
ir.sort_asc_image            ,
ir.sort_asc_image_attr       ,
ir.sort_desc_image           ,
ir.sort_desc_image_attr      ,
ir.base_table_or_view        ,
ir.sql_query                 ,
--
ir.show_nulls_as             ,
decode(ir.pagination_type,
   'ROWS_X_TO_Y_OF_Z','Row Ranges X to Y of Z (no pagination)',
   'ROWS_X_TO_Y','Row Ranges X to Y (no pagination)',
   'SEARCH_ENGINE','Search Engine 1,2,3,4 (set based pagination)',
   'COMPUTED_BUT_NOT_DISPLAYED','Use Externally Created Pagination Buttons',
   'ROW_RANGES','Row Ranges 1-15 16-30 (with set pagination)',
   'ROW_RANGES_IN_SELECT_LIST','Row Ranges 1-15 16-30 in select list (with pagination)',
   'ROW_RANGES_WITH_LINKS','Row Ranges X to Y of Z (with pagination)',
   'NEXT_PREVIOUS_LINKS','Row Ranges X to Y (with next and previous links)',
   ir.pagination_type)       pagination_scheme,
decode(ir.pagination_display_position,
  'BOTTOM_LEFT','Bottom - Left',
  'BOTTOM_RIGHT','Bottom - Right',
  'TOP_LEFT','Top - Left',
  'TOP_RIGHT','Top - Right',
  'TOP_AND_BOTTOM_LEFT','Top and Bottom - Left',
  'TOP_AND_BOTTOM_RIGHT','Top and Bottom - Right',
  ir.pagination_display_position)     pagination_display_position,
(select template_name
 from wwv_flow_button_templates
 where ir.button_template = id
 and flow_id = f.id)          button_template,
--
decode(ir.show_finder_drop_down ,'Y','Yes','N','No',ir.show_finder_drop_down ) show_finder_drop_down ,
decode(ir.report_list_mode,'TABS', 'Yes','No') show_reports_select_list,
decode(ir.show_display_row_count,'Y','Yes','N','No',ir.show_display_row_count) show_display_row_count,
decode(ir.show_search_bar       ,'Y','Yes','N','No',ir.show_search_bar       ) show_search_bar       ,
decode(ir.show_search_textbox   ,'Y','Yes','N','No',ir.show_search_textbox   ) show_search_textbox   ,
decode(ir.show_actions_menu     ,'Y','Yes','N','No',ir.show_actions_menu     ) show_actions_menu     ,
ir.actions_menu_icon         ,
ir.finder_icon               ,
decode(ir.show_select_columns,'Y','Yes','N','No',ir.show_select_columns) show_select_columns,
decode(ir.show_rows_per_page ,'Y','Yes','N','No',ir.show_rows_per_page)  show_rows_per_page,
decode(ir.show_filter        ,'Y','Yes','N','No',ir.show_filter        ) show_filter        ,
decode(ir.show_sort          ,'Y','Yes','N','No',ir.show_sort          ) show_sort          ,
decode(ir.show_control_break ,'Y','Yes','N','No',ir.show_control_break ) show_control_break ,
decode(ir.show_highlight     ,'Y','Yes','N','No',ir.show_highlight     ) show_highlight     ,
decode(ir.show_computation   ,'Y','Yes','N','No',ir.show_computation   ) show_compute       ,
decode(ir.show_aggregate     ,'Y','Yes','N','No',ir.show_aggregate     ) show_aggregate     ,
decode(ir.show_chart         ,'Y','Yes','N','No',ir.show_chart         ) show_chart         ,
decode(ir.show_group_by      ,'Y','Yes','N','No',ir.show_group_by      ) show_group_by      ,
decode(ir.show_notify        ,'Y','Yes','N','No',ir.show_notify        ) show_notify        ,
decode(ir.show_flashback     ,'Y','Yes','N','No',ir.show_flashback     ) show_flashback     ,
decode(ir.allow_report_saving,'Y','Yes','N','No',ir.allow_report_saving) show_save          ,
decode(ir.allow_save_rpt_public,'Y','Yes','N','No',ir.allow_save_rpt_public) show_save_public,
decode(substr(ir.save_rpt_public_auth_scheme,1,1),'!','Not ')||
nvl((select name
 from   wwv_flow_security_schemes
 where  to_char(id) = ltrim(ir.save_rpt_public_auth_scheme,'!')
 and    flow_id = f.id),
 ir.save_rpt_public_auth_scheme)  save_public_auth_scheme,
ir.save_rpt_public_auth_scheme    save_public_auth_scheme_id,
decode(ir.show_reset         ,'Y','Yes','N','No',ir.show_reset         ) show_reset         ,
decode(ir.show_download      ,'Y','Yes','N','No',ir.show_download      ) show_download      ,
decode(ir.show_help          ,'Y','Yes','N','No',ir.show_help          ) show_help          ,
ir.download_formats          ,
ir.download_filename         filename,
ir.csv_output_separator      separator,
ir.csv_output_enclosed_by    enclosed_by,
--
decode(ir.show_detail_link,
       'Y', 'Single Row View',
       'C', 'Custom Link target',
       'N', 'No Link Column') detail_link_type,
ir.detail_link                detail_link_target,
ir.detail_link_text           detail_link_text,
ir.detail_link_attr           detail_link_attributes,
ir.detail_link_checksum_type  detail_link_checksum_type,
nvl((select r from apex_standard_conditions where d = ir.detail_link_condition_type),ir.detail_link_condition_type)
                                     detail_link_condition_type,
ir.detail_link_condition_type detail_link_cond_type_code,
ir.detail_link_cond           detail_link_cond_expression,
ir.detail_link_cond2          detail_link_cond_expression2,
decode(substr(ir.detail_link_auth_SCHEME,1,1),'!','Not ')||
nvl((select name
 from   wwv_flow_security_schemes
 where  to_char(id) = ltrim(ir.detail_link_auth_scheme,'!')
 and    flow_id = f.id),
 ir.detail_link_auth_scheme)  detail_link_auth_scheme,
ir.detail_link_auth_scheme    detail_link_auth_scheme_id,
--
ir.alias                      alias,
ir.report_id_item             ,
ir.max_query_cost             ,
ir.email_from                 ,
--
    decode(icon_view_enabled_yn,'Y','Yes','N','No','No') icon_view_enabled_yn,
    decode(icon_view_use_custom,'Y','Yes','N','No','No') icon_view_use_custom,
    icon_view_custom_link     ,
    icon_view_link_column     ,
    icon_view_img_src_column  ,
    icon_view_label_column    ,
    icon_view_img_attr_text   ,
    icon_view_alt_text        ,
    icon_view_title_text      ,
    icon_view_columns_per_row ,
    --
    decode(detail_view_enabled_yn,'Y','Yes','N','No','No') detail_view_enabled_yn,
    detail_view_before_rows,
    detail_view_for_each_row,
    detail_view_after_rows,
--
ir.internal_uid,
--
ir.created_on,
ir.created_by,
ir.updated_on,
ir.updated_by,
--
'Interactive Report'||
' rc='||ir.max_row_count||
' '||length(ir.max_row_count_message)||
length(ir.no_data_found_message)||
ir.max_rows_per_page||
substr(ir.search_button_label,1,30)||
length(r.ajax_items_to_submit)||
length(ir.sort_asc_image)||
length(ir.sort_asc_image_attr)||
length(ir.sort_desc_image)||
length(ir.sort_desc_image_attr)||
substr(ir.show_nulls_as,1,30)||
' p='||ir.pagination_type||
' '||ir.pagination_display_position||
' '||substr(ir.actions_menu_icon,1,30)||
' '||substr(ir.finder_icon,1,30)||
' opt='||ir.show_finder_drop_down||
ir.show_display_row_count||
ir.show_search_bar||
ir.show_search_textbox||
ir.show_actions_menu||
ir.show_select_columns||
ir.show_rows_per_page||
ir.show_filter||
ir.show_sort||
ir.show_control_break||
ir.show_highlight||
ir.show_computation||
ir.show_aggregate||
ir.show_chart||
ir.show_group_by||
ir.show_notify||
ir.show_flashback||
ir.allow_report_saving||
ir.allow_save_rpt_public||
ir.save_rpt_public_auth_scheme||
ir.show_reset||
ir.show_download||
ir.show_help||
' rpts='||ir.report_list_mode||
' dl='||substr(ir.download_formats,1,40)||
' fn='||substr(ir.download_filename,1,30)||
ir.csv_output_separator||
ir.csv_output_enclosed_by||
ir.show_detail_link||
' l='||substr(ir.detail_link,1,30)||
' lt='||substr(ir.detail_link_text,1,30)||
substr(ir.detail_link_attr,1,30)||
ir.detail_link_checksum_type||
' lc='||ir.detail_link_condition_type||
length(ir.detail_link_cond)||
length(ir.detail_link_cond2)||
ir.detail_link_auth_SCHEME||
' a='||substr(ir.alias,1,30)||
ir.report_id_item||
ir.max_query_cost||
ir.email_from
component_signature
--
from wwv_flow_worksheets ir,
     wwv_flow_page_plugs r,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = ir.security_group_id and
      r.id (+) = ir.region_id and
      f.id = ir.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_IR_COL" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"INTERACTIVE_REPORT_ID",
"REGION_ID",
"COLUMN_ID",
"COLUMN_ALIAS",
"DISPLAY_ORDER",
"COLUMN_GROUP",
"COLUMN_GROUP_ID",
"REPORT_LABEL",
"FORM_LABEL",
"HTML_EXPRESSION",
"COLUMN_LINK",
"COLUMN_LINKTEXT",
"COLUMN_LINK_ATTR",
"COLUMN_LINK_CHECKSUM_TYPE",
"ALLOW_SORTING",
"ALLOW_FILTERING",
"ALLOW_HIGHLIGHTING",
"ALLOW_CTRL_BREAKS",
"ALLOW_AGGREGATIONS",
"ALLOW_COMPUTATIONS",
"ALLOW_CHARTING",
"ALLOW_GROUP_BY",
"ALLOW_HIDE",
"COLUMN_TYPE",
"DISPLAY_TEXT_AS",
"HEADING_ALIGNMENT",
"COLUMN_ALIGNMENT",
"FORMAT_MASK",
"TZ_DEPENDENT",
"FILTER_LOV_SOURCE",
"NAMED_LOV",
"RPT_LOV",
"FILTER_DATE_RANGES",
"DISPLAY_CONDITION_TYPE",
"DISPLAY_CONDITION_TYPE_CODE",
"DISPLAY_CONDITION",
"DISPLAY_CONDITION2",
"HELP_TEXT",
"AUTHORIZATION_SCHEME",
"AUTHORIZATION_SCHEME_ID",
"COLUMN_EXPR",
"COMPONENT_COMMENT",
"CREATED_ON",
"CREATED_BY",
"UPDATED_ON",
"UPDATED_BY",
"COMPONENT_SIGNATURE") AS
  select
w.short_name                workspace,
w.display_name              workspace_display_name,
f.id                        application_id,
f.name                      application_name,
ir.page_id                   page_id,
ir.id                       interactive_report_id,
ir.region_id                region_id,
c.id                        column_id,
c.db_column_name            column_alias,
c.display_order             display_order,
(select name from wwv_flow_worksheet_col_groups where id = c.group_id) column_group,
c.group_id                  column_group_id,
c.report_label              report_label,
c.column_label              form_label,
c.column_html_expression    html_expression,
c.column_link               ,
c.column_linktext           ,
c.column_link_attr          ,
c.column_link_checksum_type ,
--
decode(c.allow_sorting     ,'Y','Yes','N','No',c.allow_sorting     ) allow_sorting     ,
decode(c.allow_filtering   ,'Y','Yes','N','No',c.allow_filtering   ) allow_filtering   ,
decode(c.allow_highlighting   ,'Y','Yes','N','No',c.allow_highlighting) allow_highlighting,
decode(c.allow_ctrl_breaks ,'Y','Yes','N','No',c.allow_ctrl_breaks ) allow_ctrl_breaks ,
decode(c.allow_aggregations,'Y','Yes','N','No',c.allow_aggregations) allow_aggregations,
decode(c.allow_computations,'Y','Yes','N','No',c.allow_computations) allow_computations,
decode(c.allow_charting    ,'Y','Yes','N','No',c.allow_charting    ) allow_charting    ,
decode(c.allow_group_by    ,'Y','Yes','N','No',c.allow_group_by    ) allow_group_by    ,
decode(c.allow_hide        ,'Y','Yes','N','No',c.allow_hide        ) allow_hide        ,
--
c.column_type               ,
c.display_text_as           ,
c.heading_alignment         ,
c.column_alignment          ,
c.format_mask               ,
tz_dependent                ,
--
decode(c.rpt_show_filter_lov,
       'D','Default Based on Column Type',
       'S','Use Defined List of Values to Filter Exact Match',
       'C','Use Defined List of Values to Filter Word Contains',
       '1','Use Named List of Values to Filter Exact Match',
       '2','Use Named List of Values to Filter Word Contains',
       'N','None',
       c.rpt_show_filter_lov)
                            filter_lov_source,
(select lov_name
   from wwv_flow_lists_of_values$
  where id = c.rpt_named_lov
)                           named_lov,
c.rpt_lov                   ,
c.rpt_filter_date_ranges    filter_date_ranges,
--
nvl((select r from apex_standard_conditions where d = c.display_condition_type), c.display_condition_type)
                            display_condition_type,
c.display_condition_type    display_condition_type_code,
c.display_condition         ,
c.display_condition2        ,
--
c.help_text                 ,
--
decode(substr(c.SECURITY_SCHEME,1,1),'!','Not ')||
nvl((select name
 from   wwv_flow_security_schemes
 where  to_char(id) = ltrim(c.SECURITY_SCHEME,'!')
 and    flow_id = f.id),
 c.SECURITY_SCHEME)             authorization_scheme,
c.security_scheme               authorization_scheme_id,
c.column_expr,
c.column_comment                component_comment,
--
c.created_on,
c.created_by,
c.updated_on,
c.updated_by,
--
'Interactive Report Column-'||
c.db_column_name||
' s='||c.display_order||
' g='||(select name from wwv_flow_worksheet_col_groups where id = c.group_id)||
' l='||c.report_label||
substr(c.column_label,1,30)||
substr(c.column_link,1,30)||
substr(c.column_linktext,1,30)||
substr(c.column_link_attr,1,30)||
c.column_link_checksum_type||
c.allow_sorting||
c.allow_filtering||
c.allow_highlighting||
c.allow_ctrl_breaks||
c.allow_aggregations||
c.allow_computations||
c.allow_charting||
c.allow_group_by||
c.allow_hide||
c.column_type||
c.display_text_as||
' ha='||c.heading_alignment||
' ca='||c.column_alignment||
' f='||c.format_mask||
c.rpt_show_filter_lov||
' lov='||length(c.rpt_lov)||
' d='||c.rpt_filter_date_ranges||
' cond='||c.display_condition_type||
length(c.display_condition)||
length(c.display_condition2)||
' h='||length(c.help_text)||
' as='||decode(substr(c.SECURITY_SCHEME,1,1),'!','Not ')||
nvl((select name
 from   wwv_flow_security_schemes
 where  to_char(id) = ltrim(c.SECURITY_SCHEME,'!')
 and    flow_id = f.id),
 c.SECURITY_SCHEME)
component_signature
from wwv_flow_worksheet_columns c,
     wwv_flow_worksheets ir,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = c.security_group_id and
      f.id = ir.flow_id and ir.id = c.worksheet_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_IR_CGRPS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"INTERACTIVE_REPORT_ID",
"COLUMN_GROUP_NAME",
"COLUMN_GROUP_DESCRIPTION",
"DISPLAY_SEQUENCE",
"COLUMNS",
"CREATED_ON",
"CREATED_BY",
"UPDATED_ON",
"UPDATED_BY") AS
  select
w.short_name                workspace,
w.display_name              workspace_display_name,
f.id                        application_id,
f.name                      application_name,
cg.worksheet_id             interactive_report_id,
cg.name                     column_group_name,
cg.description              column_group_description,
cg.display_sequence         display_sequence,
--
(select count(*) from wwv_flow_worksheet_columns where group_id = cg.id) columns,
--
cg.created_on                ,
cg.created_by                ,
cg.updated_on                ,
cg.updated_by
from wwv_flow_worksheet_col_groups cg,
     wwv_flow_worksheets ws,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = cg.security_group_id and
      f.id = ws.flow_id and ws.id = cg.worksheet_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_IR_RPT" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"INTERACTIVE_REPORT_ID",
"REPORT_ID",
"APPLICATION_USER",
"REPORT_NAME",
"REPORT_ALIAS",
"SESSION_ID",
"BASE_REPORT_ID",
"REPORT_DESCRIPTION",
"DISPLAY_SEQUENCE",
"REPORT_VIEW_MODE",
"STATUS",
"CATEGORY_ID",
"REPORT_TYPE",
"REPORT_LINK_EXAMPLE",
"DISPLAY_ROWS",
"REPORT_COLUMNS",
"SORT_COLUMN_1",
"SORT_DIRECTION_1",
"SORT_COLUMN_2",
"SORT_DIRECTION_2",
"SORT_COLUMN_3",
"SORT_DIRECTION_3",
"SORT_COLUMN_4",
"SORT_DIRECTION_4",
"SORT_COLUMN_5",
"SORT_DIRECTION_5",
"SORT_COLUMN_6",
"SORT_DIRECTION_6",
"BREAK_ON",
"BREAK_ENABLED_ON",
"SUM_COLUMNS_ON_BREAK",
"AVG_COLUMNS_ON_BREAK",
"MAX_COLUMNS_ON_BREAK",
"MIN_COLUMNS_ON_BREAK",
"MEDIAN_COLUMNS_ON_BREAK",
"COUNT_COLUMNS_ON_BREAK",
"COUNT_DISTNT_COL_ON_BREAK",
"FLASHBACK_MINUTES",
"FLASHBACK_ENABLED",
"CHART_TYPE",
"CHART_LABEL_COLUMN",
"CHART_LABEL_TITLE",
"CHART_VALUE_COLUMN",
"CHART_AGGREGATE",
"CHART_VALUE_TITLE",
"CHART_SORT_ORDER",
"CREATED_ON",
"CREATED_BY",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY") AS
  select
w.short_name                 workspace,
w.display_name               workspace_display_name,
f.id                         application_id,
f.name                       application_name,
r.page_id                    page_id,
r.worksheet_id               interactive_report_id,
r.id                         report_id,
r.application_user           application_user,
r.name                       report_name,
r.report_alias               ,
r.session_id                 ,
r.base_report_id             ,
r.description                report_description,
r.report_seq                 display_sequence,
(case when r.view_mode is null or r.view_mode = 'REPORT' then r.report_type
 else r.view_mode end)       report_view_mode,
r.status                     ,
r.category_id                ,
(case when r.is_default = 'Y' and r.application_user='APXWS_DEFAULT' then 'PRIMARY_DEFAULT'
      when r.is_default = 'Y' and r.application_user='APXWS_ALTERNATIVE' then 'ALTERNATIVE_DEFAULT'
      when r.session_id is null and r.status='PUBLIC' then 'PUBLIC'
      when r.session_id is null and r.status='PRIVATE' then 'PRIVATE'
 else 'SESSION' end)         report_type,
--
(case when r.report_alias is not null then
     (select 'f?p='||f.id||':'||r.page_id||':&APP_SESSION.:IR_REPORT_'||r.report_alias from sys.dual)
 end)                        report_link_example,
r.display_rows               ,
r.report_columns             ,
--
r.sort_column_1              ,
r.sort_direction_1           ,
r.sort_column_2              ,
r.sort_direction_2           ,
r.sort_column_3              ,
r.sort_direction_3           ,
r.sort_column_4              ,
r.sort_direction_4           ,
r.sort_column_5              ,
r.sort_direction_5           ,
r.sort_column_6              ,
r.sort_direction_6           ,
--
r.break_on                   ,
r.break_enabled_on           ,
--
r.sum_columns_on_break       ,
r.avg_columns_on_break       ,
r.max_columns_on_break       ,
r.min_columns_on_break       ,
r.median_columns_on_break    ,
r.count_columns_on_break     ,
r.count_distnt_col_on_break  ,
--
r.flashback_mins_ago         flashback_minutes,
decode(r.flashback_enabled,'Y','Yes','N','No',r.flashback_enabled) flashback_enabled,
--
r.chart_type                 ,
r.chart_label_column         ,
r.chart_label_title          ,
r.chart_value_column         ,
r.chart_aggregate            ,
r.chart_value_title          ,
decode(r.chart_sorting,
       'DEFAULT','Default',
       'VALUE_DESC','Value - Descending',
       'VALUE_ASC','Value - Ascending',
       'LABEL_DESC','Label - Descending',
       'LAVEL_ASC','Label - Ascending',
       r.chart_sorting)  chart_sort_order,
--
r.created_on        ,
r.created_by        ,
r.updated_on        last_updated_on,
r.updated_by        last_updated_by
--
from wwv_flow_worksheet_rpts r,
     wwv_flow_worksheets ws,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = r.security_group_id and
      f.id = ws.flow_id and ws.id = r.worksheet_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_IR_COMP" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"INTERACTIVE_REPORT_ID",
"REPORT_ID",
"APPLICATION_USER",
"REPORT_NAME",
"COMPUTATION_ID",
"COMPUTATION_COLUMN_ALIAS",
"COMPUTATION_COLUMN_IDENTIFIER",
"COMPUTATION_EXPRESSION",
"COMPUTATION_FORMAT_MASK",
"COMPUTATION_COLUMN_TYPE",
"COMPUTATION_REPORT_LABEL",
"COMPUTATION_FORM_LABEL",
"CREATED_ON",
"CREATED_BY",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY") AS
  select
w.short_name          workspace,
w.display_name        workspace_display_name,
f.id                  application_id,
f.name                application_name,
r.page_id             page_id,
r.worksheet_id        interactive_report_id,
r.id                  report_id,
r.application_user    application_user,
r.name                report_name,
c.id                  computation_id,
c.db_column_name      computation_column_alias,
c.column_identifier   computation_column_identifier,
c.computation_expr    computation_expression,
c.format_mask         computation_format_mask,
c.column_type         computation_column_type,
c.report_label        computation_report_label,
c.column_label        computation_form_label,
-- audit
--
c.created_on        ,
c.created_by        ,
c.updated_on        last_updated_on,
c.updated_by        last_updated_by
--
from wwv_flow_worksheet_computation c,
     wwv_flow_worksheet_rpts r,
     wwv_flow_worksheets ws,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = r.security_group_id and
      f.id = ws.flow_id and ws.id = r.worksheet_id and r.id = c.report_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_IR_COND" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"INTERACTIVE_REPORT_ID",
"REPORT_ID",
"APPLICATION_USER",
"REPORT_NAME",
"CONDITION_ID",
"CONDITION_NAME",
"CONDITION_TYPE",
"CONDITION_ALLOW_DELETE",
"TIME_ZONE",
"CONDITION_COLUMN_NAME",
"CONDITION_OPERATOR",
"CONDITION_EXPR_TYPE",
"CONDITION_EXPRESSION",
"CONDITION_EXPRESSION2",
"CONDITION_SQL",
"CONDITION_DISPLAY",
"CONDITION_ENABLED",
"HIGHLIGHT_SEQUENCE",
"HIGHLIGHT_ROW_COLOR",
"HIGHLIGHT_ROW_FONT_COLOR",
"HIGHLIGHT_CELL_COLOR",
"HIGHLIGHT_CELL_FONT_COLOR",
"CREATED_ON",
"CREATED_BY",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY") AS
  select
w.short_name          workspace,
w.display_name        workspace_display_name,
f.id                  application_id,
f.name                application_name,
r.page_id             page_id,
r.worksheet_id        interactive_report_id,
r.id                  report_id,
r.application_user    application_user,
r.name                report_name,
c.id                  condition_id,
c.name                condition_name,
decode(c.condition_type,'FILTER','Filter','HIGHLIGHT','Highlight','SEARCH','Search',c.condition_type)
                      condition_type,
decode(c.allow_delete,'Y','Yes','N','No',c.allow_delete)
                      condition_allow_delete,
c.time_zone           time_zone,
-- filter expression
c.column_name         condition_column_name,
c.operator            condition_operator,
c.expr_type           condition_expr_type,
c.expr                condition_expression,
c.expr2               condition_expression2,
c.condition_sql       condition_sql,
c.condition_display   condition_display,
-- enabled?
decode(c.enabled,'Y','Yes','N','No',c.enabled)
                      condition_enabled,
-- highlighting settings
c.highlight_sequence  ,
c.row_bg_color        highlight_row_color,
c.row_font_color      highlight_row_font_color,
c.column_bg_color     highlight_cell_color,
c.column_font_color   highlight_cell_font_color,
-- audit
--
c.created_on        ,
c.created_by        ,
c.updated_on        last_updated_on,
c.updated_by        last_updated_by
--
from wwv_flow_worksheet_conditions c,
     wwv_flow_worksheet_rpts r,
     wwv_flow_worksheets ws,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = r.security_group_id and
      f.id = ws.flow_id and ws.id = r.worksheet_id and r.id = c.report_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_IR_CAT" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"INTERACTIVE_REPORT_ID",
"CATEGORY_ID",
"CATEGORY_NAME",
"APPLICATION_USER",
"PARENT_CATEGORY_ID",
"DISPLAY_SEQUENCE") AS
  select
w.short_name         workspace,
w.display_name       workspace_display_name,
f.id                 application_id,
f.name               application_name,
c.worksheet_id       interactive_report_id,
c.id                 category_id,
c.name               category_name,
c.application_user   application_user,
c.base_cat_id        parent_category_id,
c.display_sequence   display_sequence
from wwv_flow_worksheet_categories c,
     wwv_flow_worksheets ws,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = c.security_group_id and
      f.id = ws.flow_id and ws.id = c.worksheet_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_IR_SUB" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"INTERACTIVE_REPORT_ID",
"WEBSHEET_ID",
"REPORT_ID",
"REPORT_NAME",
"NOTIFY_ID",
"OWNER",
"LANGUAGE",
"EMAIL_FROM",
"EMAIL_ADDRESS",
"EMAIL_SUBJECT",
"START_DATE",
"END_DATE",
"END_DAY",
"END_DAY_UNIT",
"OFFSET_DATE",
"NOTIFY_INTERVAL",
"STATUS",
"ERROR_MESSAGE",
"CREATED_ON",
"CREATED_BY",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY") AS
  select
w.short_name          workspace,
w.display_name        workspace_display_name,
f.id                  application_id,
f.name                application_name,
r.page_id             page_id,
r.worksheet_id        interactive_report_id,
n.websheet_id         websheet_id,
r.id                  report_id,
r.name                report_name,
n.id                  notify_id,
n.owner               owner,
n.language            language,
n.email_from          email_from,
n.email_address       email_address,
n.email_subject       email_subject,
n.start_date          start_date,
n.end_date            end_date,
n.end_day             end_day,
n.end_day_unit        end_day_unit,
n.offset_date         offset_date,
decode(n.notify_interval,'D','Daily','W','Weekly','M','Monthly',n.notify_interval)
                      notify_interval,
n.status              ,
n.notify_error        error_message,
n.created_on          ,
n.created_by          ,
n.updated_on          last_updated_on,
n.updated_by          last_updated_by
--
from wwv_flow_worksheet_notify n,
     wwv_flow_worksheet_rpts r,
     wwv_flow_worksheets ws,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = r.security_group_id and
      f.id = ws.flow_id and ws.id = r.worksheet_id and r.id = n.report_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_PAGE_IR_GRPBY" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"PAGE_ID",
"INTERACTIVE_REPORT_ID",
"WEBSHEET_ID",
"REPORT_ID",
"APPLICATION_USER",
"REPORT_NAME",
"GROUP_BY_ID",
"GROUP_BY_COLUMNS",
"CREATED_ON",
"CREATED_BY",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY",
"FUNCTION_01",
"FUNCTION_COLUMN_01",
"FUNCTION_DB_COLUMN_NAME_01",
"FUNCTION_LABEL_01",
"FUNCTION_FORMAT_MASK_01",
"FUNCTION_SUM_01",
"FUNCTION_02",
"FUNCTION_COLUMN_02",
"FUNCTION_DB_COLUMN_NAME_02",
"FUNCTION_LABEL_02",
"FUNCTION_FORMAT_MASK_02",
"FUNCTION_SUM_02",
"FUNCTION_03",
"FUNCTION_COLUMN_03",
"FUNCTION_DB_COLUMN_NAME_03",
"FUNCTION_LABEL_03",
"FUNCTION_FORMAT_MASK_03",
"FUNCTION_SUM_03",
"FUNCTION_04",
"FUNCTION_COLUMN_04",
"FUNCTION_DB_COLUMN_NAME_04",
"FUNCTION_LABEL_04",
"FUNCTION_FORMAT_MASK_04",
"FUNCTION_SUM_04",
"FUNCTION_05",
"FUNCTION_COLUMN_05",
"FUNCTION_DB_COLUMN_NAME_05",
"FUNCTION_LABEL_05",
"FUNCTION_FORMAT_MASK_05",
"FUNCTION_SUM_05",
"FUNCTION_06",
"FUNCTION_COLUMN_06",
"FUNCTION_DB_COLUMN_NAME_06",
"FUNCTION_LABEL_06",
"FUNCTION_FORMAT_MASK_06",
"FUNCTION_SUM_06",
"SORT_COLUMN_01",
"SORT_DIRECTION_01",
"SORT_COLUMN_02",
"SORT_DIRECTION_02",
"SORT_COLUMN_03",
"SORT_DIRECTION_03",
"SORT_COLUMN_04",
"SORT_DIRECTION_04") AS
  select
w.short_name          workspace,
w.display_name        workspace_display_name,
f.id                  application_id,
f.name                application_name,
r.page_id             page_id,
r.worksheet_id        interactive_report_id,
g.websheet_id         websheet_id,
r.id                  report_id,
r.application_user    application_user,
r.name                report_name,
g.id                  group_by_id,
group_by_columns      ,
g.created_on          ,
g.created_by          ,
g.updated_on          last_updated_on,
g.updated_by          last_updated_by,
g.function_01         ,
g.function_column_01  ,
g.function_db_column_name_01 ,
g.function_label_01          ,
g.function_format_mask_01    ,
g.function_sum_01            ,
g.function_02                ,
g.function_column_02         ,
g.function_db_column_name_02 ,
g.function_label_02          ,
g.function_format_mask_02    ,
g.function_sum_02            ,
g.function_03                ,
g.function_column_03         ,
g.function_db_column_name_03 ,
g.function_label_03          ,
g.function_format_mask_03    ,
g.function_sum_03            ,
g.function_04                ,
g.function_column_04         ,
g.function_db_column_name_04 ,
g.function_label_04          ,
g.function_format_mask_04    ,
g.function_sum_04            ,
g.function_05                ,
g.function_column_05         ,
g.function_db_column_name_05 ,
g.function_label_05          ,
g.function_format_mask_05    ,
g.function_sum_05            ,
g.function_06                ,
g.function_column_06         ,
g.function_db_column_name_06 ,
g.function_label_06          ,
g.function_format_mask_06    ,
g.function_sum_06            ,
--
g.sort_column_01             ,
g.sort_direction_01          ,
g.sort_column_02             ,
g.sort_direction_02          ,
g.sort_column_03             ,
g.sort_direction_03          ,
g.sort_column_04             ,
g.sort_direction_04
--
from wwv_flow_worksheet_group_by g,
     wwv_flow_worksheet_rpts r,
     wwv_flow_worksheets ws,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.security_group_id = r.security_group_id and
      f.id = ws.flow_id and ws.id = r.worksheet_id and r.id = g.report_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_DEVELOPER_AUDIT_LOG" ("APPLICATION_ID",
"DEVELOPER",
"AUDIT_DATE",
"UPDATED",
"AUDIT_ACTION",
"PAGE_ID",
"PAGE_NAME",
"COMPONENT",
"COMPONENT_NAME",
"OBJECT_NAME",
"SECURITY_GROUP_ID",
"FLOW_TABLE_PK") AS
  select
       flow_id              application_id,
       flow_user            developer,
       audit_date           audit_date,
       audit_date           updated,
       audit_action         audit_action,
       page_id              page_id,
       (select name
        from wwv_flow_steps
        where flow_id = a.flow_id and
            id = a.page_id) page_name,
       FLOW_TABLE           component,
       decode(FLOW_TABLE,
'WWV_FLOW_PAGE_PLUGS',(select plug_name from wwv_flow_page_plugs where id = a.flow_table_pk),
'WWV_FLOW_ITEMS',(select name from wwv_flow_items where id = a.flow_table_pk),
'WWV_FLOW_STEP_BRANCHES',(select nvl(branch_name, substr(BRANCH_ACTION,1,50)) from wwv_flow_step_branches where id=a.flow_table_pk),
'WWV_FLOW_PROCESSING',(select process_name from wwv_flow_processing where id=a.flow_table_pk),
'WWV_FLOW_TOPLEVEL_TABS',(select TAB_NAME from WWV_FLOW_TOPLEVEL_TABS where id=a.flow_table_pk),
'WWV_FLOW_LISTS_OF_VALUES_DATA',(select lov_return_value from WWV_FLOW_LIST_OF_VALUES_DATA where id=a.flow_table_pk),
'WWV_FLOW_STEP_ITEM_HELP',(select name from wwv_flow_step_items where id = (select flow_item_id from WWV_FLOW_STEP_ITEM_HELP where id=a.flow_table_pk)),
'WWV_FLOW_DEVELOPERS',(select USERID from WWV_FLOW_DEVELOPERS where id=a.flow_table_pk),
'WWV_FLOW_LISTS_OF_VALUES$',(select LOV_NAME from WWV_FLOW_LISTS_OF_VALUES$ where id=a.flow_table_pk),
'WWV_FLOW_PAGE_PLUG_TEMPLATES',(select PAGE_PLUG_TEMPLATE_NAME from WWV_FLOW_PAGE_PLUG_TEMPLATES where id=a.flow_table_pk),
'WWV_FLOW_PLUG_TMPL_DISP_POINTS',(select name from wwv_flow_plug_tmpl_disp_points where id=a.flow_table_pk),
'WWV_FLOWS',flow_id,
'WWV_FLOW_STEP_COMPUTATIONS',(select COMPUTATION_ITEM from WWV_FLOW_STEP_COMPUTATIONS where id=a.flow_table_pk),
'WWV_FLOW_ICON_BAR',(select ICON_SEQUENCE||'. '||ICON_SUBTEXT n from WWV_FLOW_ICON_BAR where id=a.flow_table_pk),
'WWV_FLOW_STEP_BUTTONS',(select BUTTON_NAME||' "'||BUTTON_IMAGE_ALT||'"' n from wwv_flow_step_buttons where id=a.flow_table_pk),
'WWV_FLOW_STEPS',flow_table_pk,
'WWV_FLOW_COMPUTATIONS',(select COMPUTATION_SEQUENCE||'. '||COMPUTATION_ITEM n from WWV_FLOW_COMPUTATIONS where id=a.flow_table_pk),
'WWV_FLOW_TEMPLATES',(select NAME from WWV_FLOW_TEMPLATES where id=a.flow_table_pk),
'WWV_FLOW_TABS',(select TAB_NAME||' "'||tab_text||'"' n from WWV_FLOW_TABS where id=a.flow_table_pk),
'WWV_FLOW_STEP_ITEMS',(select name from wwv_flow_step_items where id = a.flow_table_pk),
'WWV_FLOW_MESSAGES$',(select NAME from WWV_FLOW_MESSAGES$ where id = a.flow_table_pk),
'WWV_FLOW_LIST_ITEMS',(select LIST_ITEM_LINK_TEXT from wwv_flow_list_items where id=a.flow_table_pk),
'WWV_FLOW_STEP_VALIDATIONS',(select VALIDATION_SEQUENCE||'. '||VALIDATION_NAME n from WWV_FLOW_STEP_VALIDATIONS where id = a.flow_table_pk),
'WWV_FLOW_STEP_PROCESSING',(select process_name from wwv_flow_step_processing where id=a.flow_table_pk),
'WWV_FLOW_ROW_TEMPLATES',(select ROW_TEMPLATE_NAME from WWV_FLOW_ROW_TEMPLATES where id=a.flow_table_pk),
'WWV_FLOW_LISTS',(select NAME from WWV_FLOW_LISTS where id=a.flow_table_pk),
'WWV_FLOW_THEMES',(select theme_id||'. '||THEME_NAME n from WWV_FLOW_THEMES where id=a.flow_table_pk),
'WWV_FLOW_THEME_STYLES',(select name from wwv_flow_theme_styles where id=a.flow_table_pk),
'WWV_FLOW_THEME_DISPLAY_POINTS',(select name from wwv_flow_theme_display_points where id=a.flow_table_pk),
'WWV_FLOW_SHORTCUTS',(select SHORTCUT_NAME from WWV_FLOW_SHORTCUTS where id=a.flow_table_pk),
'WWV_FLOW_MENU_OPTIONS',(select short_name from wwv_flow_menu_options where id = a.flow_table_pk),
'WWV_FLOW_LIST_TEMPLATES',(select LIST_TEMPLATE_NAME from WWV_FLOW_LIST_TEMPLATES where id=a.flow_table_pk),
'WWV_FLOW_SHARED_WEB_SERVICES',(select NAME from WWV_FLOW_SHARED_WEB_SERVICES where id = a.flow_table_pk),
'WWV_FLOW_AUTHENTICATIONS',(select NAME from WWV_FLOW_AUTHENTICATIONS where id=a.flow_table_pk),
'WWV_FLOW_SECURITY_SCHEMES',(select NAME from WWV_FLOW_SECURITY_SCHEMES where id = a.flow_table_pk),
'WWV_FLOW_TREES',(select TREE_NAME from WWV_FLOW_TREES where id = a.flow_table_pk),
'WWV_FLOW_SHARED_QUERIES',(select NAME from WWV_FLOW_SHARED_QUERIES where id = a.flow_table_pk),
'WWV_FLOW_REPORT_LAYOUTS',(select REPORT_LAYOUT_NAME from WWV_FLOW_REPORT_LAYOUTS where id = a.flow_table_pk),
'WWV_FLOW_LOAD_TABLES',(select name from WWV_FLOW_LOAD_TABLES where id = a.flow_table_pk),
'WWV_FLOW_LOAD_TABLE_LOOKUPS',(select LOAD_COLUMN_NAME||' . '||LOOKUP_TABLE_NAME n from WWV_FLOW_LOAD_TABLE_LOOKUPS where id=a.flow_table_pk ),
'WWV_FLOW_LOAD_TABLE_RULES',(select LOAD_COLUMN_NAME||' . '||RULE_NAME||' . '||RULE_TYPE n from WWV_FLOW_LOAD_TABLE_RULES where id=a.flow_table_pk),
'WWV_FLOW_UI_TYPES', (select name from wwv_flow_ui_types where id = a.flow_table_pk),
'WWV_FLOW_USER_INTERFACES', (select display_name from wwv_flow_user_interfaces where id = a.flow_table_pk),
'WWV_FLOW_PLUGIN_SETTINGS', (select plugin from wwv_flow_plugin_settings where id = a.flow_table_pk),
'WWV_FLOW_PLUGINS', (select display_name from wwv_flow_plugins where id = a.flow_table_pk),
FLOW_TABLE_PK) component_name,
object_name,
security_group_id,
flow_table_pk
from   wwv_flow_builder_audit_trail a;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_DEVELOPER_ACTIVITY_LOG" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"DEVELOPER",
"AUDIT_DATE",
"AUDIT_ACTION",
"PAGE_ID",
"PAGE_NAME",
"COMPONENT",
"COMPONENT_NAME",
"OBJECT_NAME",
"WORKSPACE_ID",
"COMPONENT_ID") AS
  select
    w.short_name           workspace,
    w.display_name         workspace_display_name,
    f.ID                   application_id,
    f.NAME                 application_name,
    a.flow_user            developer,
    a.audit_date           audit_date,
    decode(a.audit_action,
       'I','Insert',
       'U','Update',
       'D','Delete',
       a.audit_action)     audit_action,
    a.page_id              page_id,
    (select name
     from wwv_flow_steps
     where flow_id = a.flow_id and
         id = a.page_id) page_name,
    --
    decode(a.flow_table,
       'WWV_FLOWS'                    , 'Application Attributes',
       'WWV_FLOW_USER_INTERFACES'     , 'Application User Interfaces',
       'WWV_FLOW_COMPUTATIONS'        , 'Application Computation',
       'WWV_FLOW_DEVELOPERS'          , 'Application Developers (Administration)',
       'WWV_FLOW_EFFECTIVE_USERID_MAP', 'Effective User ID (Administration)',
       'WWV_FLOW_ENTRY_POINTS'        , 'Entry Points',
       'WWV_FLOW_ENTRY_POINT_ARGS'    , 'Entry Point Arguments',
       'WWV_FLOW_ICON_BAR'            , 'Navigation Bar',
       'WWV_FLOW_LISTS'               , 'Lists',
       'WWV_FLOW_ITEMS'               , 'Application Items',
       'WWV_FLOW_LISTS_OF_VALUES$'    , 'List of Values',
       'WWV_FLOW_LISTS_OF_VALUES_DATA', 'List of Values Entry',
       'WWV_FLOW_LIST_ITEMS'          , 'List Item',
       'WWV_FLOW_LIST_TEMPLATES'      , 'List Template',
       'WWV_FLOW_MENU_OPTIONS'        , 'Breadcrumb Entry',
       'WWV_FLOW_MESSAGES$'           , 'Messages',
       'WWV_FLOW_PAGE_DA_ACTIONS'     , 'Dynamic Action - Actions',
       'WWV_FLOW_PAGE_DA_EVENTS'      , 'Dynamic Action - Events',
       'WWV_FLOW_PAGE_PLUGS'          , 'Region Attributes',
       'WWV_FLOW_PAGE_PLUG_TEMPLATES' , 'Region Template',
       'WWV_FLOW_PATCHES'             , 'Build Options',
       'WWV_FLOW_PLUGINS'             , 'Plug-ins',
       'WWV_FLOW_PLUGIN_ATTRIBUTES'   , 'Plug-in Attributes',
       'WWV_FLOW_PLUGIN_ATTR_VALUES'  , 'Plug-in Attribute Values',
       'WWV_FLOW_PLUGIN_FILES'        , 'Plug-in Files',
       'WWV_FLOW_PLUGIN_EVENTS'       , 'Plug-in Events',
       'WWV_FLOW_PLUGIN_SETTINGS'     , 'Plug-in Settings',
       'WWV_FLOW_PROCESSING'          , 'Application Process',
       'WWV_FLOW_ROW_TEMPLATES'       , 'Row Template',
       'WWV_FLOW_SHORTCUTS'           , 'Shortcuts',
       'WWV_FLOW_STEPS'               , 'Page Attributes',
       'WWV_FLOW_STEP_BRANCHES'       , 'Page Branch',
       'WWV_FLOW_STEP_BRANCH_ARGS'    , 'Page Branch Arguments',
       'WWV_FLOW_STEP_BUTTONS'        , 'Page Button',
       'WWV_FLOW_STEP_COMPUTATIONS'   , 'Page Computation',
       'WWV_FLOW_STEP_ITEMS'          , 'Page Item',
       'WWV_FLOW_STEP_ITEM_HELP'      , 'Page Item Help Text',
       'WWV_FLOW_STEP_PROCESSING'     , 'Page Process',
       'WWV_FLOW_STEP_VALIDATIONS'    , 'Page Validation',
       'WWV_FLOW_TABS'                , 'Tabs',
       'WWV_FLOW_TEMPLATES'           , 'Page Template',
       'WWV_FLOW_THEMES'              , 'Theme',
       'WWV_FLOW_THEME_STYLES'        , 'Theme Style',
       'WWV_FLOW_THEME_DISPLAY_POINTS', 'Theme Display Points',
       'WWV_FLOW_PLUG_TMPL_DISP_POINTS','Region Template Display Points',
       'WWV_FLOW_TOPLEVEL_TABS'       , 'Parent Tab',
       'WWV_FLOW_SHARED_WEB_SERVICES' , 'Web Service',
       'WWV_FLOW_AUTHENTICATIONS'     , 'Authentication Scheme',
       'WWV_FLOW_SECURITY_SCHEMES'    , 'Authorization Scheme',
       'WWV_FLOW_TREES'               , 'Tree',
       'WWV_FLOW_SHARED_QUERIES'      , 'Report Query',
       'WWV_FLOW_REPORT_LAYOUTS'      , 'Report Layout',
       'WWV_FLOW_LOAD_TABLES'         , 'Data Load Tables',
       'WWV_FLOW_LOAD_TABLE_LOOKUPS'  , 'Data Load Table Lookups',
       'WWV_FLOW_LOAD_TABLE_RULES'    , 'Data Load Table Transformation Rules',
       'WWV_FLOW_UI_TYPES'            , 'User Interface Types',
       a.flow_table) component,
       decode(FLOW_TABLE,
'WWV_FLOW_PAGE_PLUGS',(select plug_name from wwv_flow_page_plugs where id = a.flow_table_pk),
'WWV_FLOW_ITEMS',(select name from wwv_flow_items where id = a.flow_table_pk),
'WWV_FLOW_STEP_BRANCHES',(select nvl(branch_name, substr(BRANCH_ACTION,1,50)) from wwv_flow_step_branches where id=a.flow_table_pk),
'WWV_FLOW_PROCESSING',(select process_name from wwv_flow_processing where id=a.flow_table_pk),
'WWV_FLOW_TOPLEVEL_TABS',(select TAB_NAME from WWV_FLOW_TOPLEVEL_TABS where id=a.flow_table_pk),
'WWV_FLOW_LISTS_OF_VALUES_DATA',(select lov_return_value from WWV_FLOW_LIST_OF_VALUES_DATA where id=a.flow_table_pk),
'WWV_FLOW_STEP_ITEM_HELP',(select name from wwv_flow_step_items where id = (select flow_item_id from WWV_FLOW_STEP_ITEM_HELP where id=a.flow_table_pk)),
'WWV_FLOW_DEVELOPERS',(select USERID from WWV_FLOW_DEVELOPERS where id=a.flow_table_pk),
'WWV_FLOW_LISTS_OF_VALUES$',(select LOV_NAME from WWV_FLOW_LISTS_OF_VALUES$ where id=a.flow_table_pk),
'WWV_FLOW_PAGE_DA_ACTIONS',(select action from wwv_flow_page_da_actions where id=a.flow_table_pk),
'WWV_FLOW_PAGE_DA_EVENTS',(select name from wwv_flow_page_da_events where id=a.flow_table_pk),
'WWV_FLOW_PAGE_PLUG_TEMPLATES',(select PAGE_PLUG_TEMPLATE_NAME from WWV_FLOW_PAGE_PLUG_TEMPLATES where id=a.flow_table_pk),
'WWV_FLOW_PLUGINS',(select display_name from wwv_flow_plugins where id=a.flow_table_pk),
'WWV_FLOW_PLUGIN_ATTRIBUTES',(select prompt from wwv_flow_plugin_attributes where id=a.flow_table_pk),
'WWV_FLOW_PLUGIN_ATTR_VALUES',(select display_value from wwv_flow_plugin_attr_values where id=a.flow_table_pk),
'WWV_FLOW_PLUGIN_FILES',(select file_name from wwv_flow_plugin_files where id=a.flow_table_pk),
'WWV_FLOW_PLUGIN_EVENTS',(select display_name from wwv_flow_plugin_events where id=a.flow_table_pk),
'WWV_FLOWS',flow_id,
'WWV_FLOW_STEP_COMPUTATIONS',(select COMPUTATION_ITEM from WWV_FLOW_STEP_COMPUTATIONS where id=a.flow_table_pk),
'WWV_FLOW_ICON_BAR',(select ICON_SEQUENCE||'. '||ICON_SUBTEXT n from WWV_FLOW_ICON_BAR where id=a.flow_table_pk),
'WWV_FLOW_STEP_BUTTONS',(select BUTTON_NAME||' "'||BUTTON_IMAGE_ALT||'"' n from wwv_flow_step_buttons where id=a.flow_table_pk),
'WWV_FLOW_STEPS',flow_table_pk,
'WWV_FLOW_COMPUTATIONS',(select COMPUTATION_SEQUENCE||'. '||COMPUTATION_ITEM n from WWV_FLOW_COMPUTATIONS where id=a.flow_table_pk),
'WWV_FLOW_TEMPLATES',(select NAME from WWV_FLOW_TEMPLATES where id=a.flow_table_pk),
'WWV_FLOW_TABS',(select TAB_NAME||' "'||tab_text||'"' n from WWV_FLOW_TABS where id=a.flow_table_pk),
'WWV_FLOW_STEP_ITEMS',(select name from wwv_flow_step_items where id = a.flow_table_pk),
'WWV_FLOW_MESSAGES$',(select NAME from WWV_FLOW_MESSAGES$ where id = a.flow_table_pk),
'WWV_FLOW_LIST_ITEMS',(select LIST_ITEM_LINK_TEXT from wwv_flow_list_items where id=a.flow_table_pk),
'WWV_FLOW_STEP_VALIDATIONS',(select VALIDATION_SEQUENCE||'. '||VALIDATION_NAME n from WWV_FLOW_STEP_VALIDATIONS where id = a.flow_table_pk),
'WWV_FLOW_STEP_PROCESSING',(select process_name from wwv_flow_step_processing where id=a.flow_table_pk),
'WWV_FLOW_ROW_TEMPLATES',(select ROW_TEMPLATE_NAME from WWV_FLOW_ROW_TEMPLATES where id=a.flow_table_pk),
'WWV_FLOW_LISTS',(select NAME from WWV_FLOW_LISTS where id=a.flow_table_pk),
'WWV_FLOW_THEMES',(select theme_id||'. '||THEME_NAME n from WWV_FLOW_THEMES where id=a.flow_table_pk),
'WWV_FLOW_THEME_STYLES',(select name from wwv_flow_theme_styles where id=a.flow_table_pk),
'WWV_FLOW_THEME_DISPLAY_POINTS',(select name from wwv_flow_theme_display_points where id=a.flow_table_pk),
'WWV_FLOW_PLUG_TMPL_DISP_POINTS',(select name from wwv_flow_plug_tmpl_disp_points where id=a.flow_table_pk),
'WWV_FLOW_SHORTCUTS',(select SHORTCUT_NAME from WWV_FLOW_SHORTCUTS where id=a.flow_table_pk),
'WWV_FLOW_MENU_OPTIONS',(select short_name from wwv_flow_menu_options where id = a.flow_table_pk),
'WWV_FLOW_LIST_TEMPLATES',(select LIST_TEMPLATE_NAME from WWV_FLOW_LIST_TEMPLATES where id=a.flow_table_pk),
'WWV_FLOW_SHARED_WEB_SERVICES',(select NAME from WWV_FLOW_SHARED_WEB_SERVICES where id = a.flow_table_pk),
'WWV_FLOW_AUTHENTICATIONS',(select NAME from WWV_FLOW_AUTHENTICATIONS where id=a.flow_table_pk),
'WWV_FLOW_SECURITY_SCHEMES',(select NAME from WWV_FLOW_SECURITY_SCHEMES where id = a.flow_table_pk),
'WWV_FLOW_TREES',(select TREE_NAME from WWV_FLOW_TREES where id = a.flow_table_pk),
'WWV_FLOW_SHARED_QUERIES',(select NAME from WWV_FLOW_SHARED_QUERIES where id = a.flow_table_pk),
'WWV_FLOW_REPORT_LAYOUTS',(select REPORT_LAYOUT_NAME from WWV_FLOW_REPORT_LAYOUTS where id = a.flow_table_pk),
'WWV_FLOW_LOAD_TABLES',(select TABLE_NAME from WWV_FLOW_LOAD_TABLES where id = a.flow_table_pk),
'WWV_FLOW_LOAD_TABLE_LOOKUPS',(select LOAD_COLUMN_NAME||' . '||LOOKUP_TABLE_NAME n from WWV_FLOW_LOAD_TABLE_LOOKUPS where id=a.flow_table_pk ),
'WWV_FLOW_LOAD_TABLE_RULES',(select LOAD_COLUMN_NAME||' . '||RULE_NAME||' . '||RULE_TYPE n from WWV_FLOW_LOAD_TABLE_RULES where id=a.flow_table_pk),
'WWV_FLOW_UI_TYPES', (select name from wwv_flow_ui_types where id = a.flow_table_pk),
'WWV_FLOW_USER_INTERFACES', (select display_name from wwv_flow_user_interfaces where id = a.flow_table_pk),
'WWV_FLOW_PLUGIN_SETTINGS', (select plugin from wwv_flow_plugin_settings where id = a.flow_table_pk),
FLOW_TABLE_PK) component_name,
    a.object_name,
    a.security_group_id   workspace_id,
    a.flow_table_pk       component_id
from
     wwv_flow_builder_audit_trail a,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      f.security_group_id = s.SECURITY_GROUP_ID and
      s.schema = f.owner and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'))
  /* keep this not exists */
  and not exists ( select 1
                     from wwv_flow_language_map m
                    where m.translation_flow_id = f.id
                      and m.security_group_id   = f.security_group_id
                      and f.authentication_id   <> trunc(f.authentication_id) )
  and w.PROVISIONING_COMPANY_ID != 0
  and a.flow_id = f.id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_RELEASE" ("VERSION_NO",
"API_COMPATIBILITY",
"PATCH_APPLIED") AS
  select (select wwv_flows_release from sys.dual) version_no,
       (select wwv_flows_version from sys.dual) api_compatibility,
       (select wwv_flow_platform.get_preference('APEX_3_0_1_PATCH') from sys.dual) patch_applied
  from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_UI_DEFAULTS_TABLES" ("SCHEMA",
"TABLE_NAME",
"FORM_REGION_TITLE",
"REPORT_REGION_TITLE",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select schema,
       table_name,
       form_region_title,
       report_region_title,
       created_by,
       created_on,
       last_updated_by,
       last_updated_on
  from wwv_flow_hnt_table_info
 where schema = user;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_UI_DEFAULTS_GROUPS" ("SCHEMA",
"TABLE_NAME",
"GROUP_NAME",
"DESCRIPTION",
"DISPLAY_SEQUENCE",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select t.schema,
       t.table_name,
       g.group_name,
       g.description,
       g.display_sequence,
       g.created_by,
       g.created_on,
       g.last_updated_by,
       g.last_updated_on
  from wwv_flow_hnt_groups g,
       wwv_flow_hnt_table_info t
 where t.schema   = user
   and g.table_id = t.table_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_UI_DEFAULTS_COLUMNS" ("SCHEMA",
"TABLE_NAME",
"COLUMN_NAME",
"LABEL",
"HELP_TEXT",
"GROUP_NAME",
"MASK_FORM",
"DISPLAY_SEQ_FORM",
"DISPLAY_IN_FORM",
"DISPLAY_AS_FORM",
"FORM_ATTRIBUTE_01",
"FORM_ATTRIBUTE_02",
"FORM_ATTRIBUTE_03",
"FORM_ATTRIBUTE_04",
"FORM_ATTRIBUTE_05",
"FORM_ATTRIBUTE_06",
"FORM_ATTRIBUTE_07",
"FORM_ATTRIBUTE_08",
"FORM_ATTRIBUTE_09",
"FORM_ATTRIBUTE_10",
"FORM_ATTRIBUTE_11",
"FORM_ATTRIBUTE_12",
"FORM_ATTRIBUTE_13",
"FORM_ATTRIBUTE_14",
"FORM_ATTRIBUTE_15",
"DISPLAY_AS_TAB_FORM",
"DISPLAY_SEQ_REPORT",
"DISPLAY_IN_REPORT",
"DISPLAY_AS_REPORT",
"MASK_REPORT",
"AGGREGATE_BY",
"DEFAULT_VALUE",
"REQUIRED",
"ALIGNMENT",
"DISPLAY_WIDTH",
"MAX_WIDTH",
"HEIGHT",
"GROUP_BY",
"SEARCHABLE",
"LOV_QUERY",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select t.schema,
       t.table_name,
       c.column_name,
       c.label,
       c.help_text,
       g.group_name,
       c.mask_form,
       c.display_seq_form,
       c.display_in_form,
       c.display_as_form,
       c.form_attribute_01,
       c.form_attribute_02,
       c.form_attribute_03,
       c.form_attribute_04,
       c.form_attribute_05,
       c.form_attribute_06,
       c.form_attribute_07,
       c.form_attribute_08,
       c.form_attribute_09,
       c.form_attribute_10,
       c.form_attribute_11,
       c.form_attribute_12,
       c.form_attribute_13,
       c.form_attribute_14,
       c.form_attribute_15,
       c.display_as_tab_form,
       c.display_seq_report,
       c.display_in_report,
       c.display_as_report,
       c.mask_report,
       c.aggregate_by,
       c.default_value,
       c.required,
       c.alignment,
       c.display_width,
       c.max_width,
       c.height,
       c.group_by,
       c.searchable,
       c.lov_query,
       c.created_by,
       c.created_on,
       c.last_updated_by,
       c.last_updated_on
  from wwv_flow_hnt_column_info c,
       wwv_flow_hnt_table_info t,
       wwv_flow_hnt_groups g
 where t.schema   = user
   and c.table_id = t.table_id
   and c.group_id = g.group_id (+);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_UI_DEFAULTS_LOV_DATA" ("SCHEMA",
"TABLE_NAME",
"COLUMN_NAME",
"LOV_DISP_SEQUENCE",
"LOV_DISP_VALUE",
"LOV_RETURN_VALUE",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select t.schema,
       t.table_name,
       c.column_name,
       l.lov_disp_sequence,
       l.lov_disp_value,
       l.lov_return_value,
       l.last_updated_by,
       l.last_updated_on
  from wwv_flow_hnt_lov_data l,
       wwv_flow_hnt_column_info c,
       wwv_flow_hnt_table_info t
 where t.schema    = user
   and l.column_id = c.column_id
   and c.table_id  = t.table_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_UI_DEFAULTS_ATTR_DICT" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"COLUMN_NAME",
"SYNONYM_OF",
"LABEL",
"HELP_TEXT",
"FORMAT_MASK",
"DEFAULT_VALUE",
"FORM_FORMAT_MASK",
"FORM_DISPLAY_WIDTH",
"FORM_DISPLAY_HEIGHT",
"FORM_DATA_TYPE",
"REPORT_FORMAT_MASK",
"REPORT_COL_ALIGNMENT",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select
    w.short_name   workspace,
    w.display_name workspace_display_name,
    --
    syn.syn_name column_name,
    case when c.column_name != syn.syn_name
         then c.column_name
         end synonym_of,
    c.label,
    c.help_text,
    c.format_mask,
    c.default_value,
    c.form_format_mask,
    c.form_display_width,
    c.form_display_height,
    c.form_data_type,
    c.report_format_mask,
    c.report_col_alignment,
    c.created_by,
    c.created_on,
    c.last_updated_by,
    c.last_updated_on
from wwv_flow_hnt_column_dict c,
     wwv_flow_hnt_col_dict_syn syn,
     wwv_flow_company_schemas s,
     wwv_flow_companies w,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      c.security_group_id = w.PROVISIONING_COMPANY_ID and
      c.column_id = syn.column_id and
      syn.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      d.sgid != 0 and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_THEMES" ("THEME_NUMBER",
"THEME_NAME",
"THEME_TYPE",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"WORKSPACE_ID") AS
  select x.theme_number,
       x.theme_name,
       x.theme_type,
       x.workspace,
       x.workspace_display_name,
       x.workspace_id
from (-- repository theme
      select 'Theme - '||i theme_name,
             i theme_number,
             'BUILTIN' theme_type,
             null workspace,
             null workspace_display_name,
             null workspace_id
      from wwv_flow_dual100
      where i <=20
      union all
      -- public theme
      select distinct wwv_flow_escape.html(t.theme_name)||' - '||t.theme_id theme_name,
             theme_id theme_number,
             'PUBLIC' theme_type,
             null workspace,
             null workspace_display_name,
             null workspace_id
      from wwv_flow_themes t,
           wwv_flow_companies w,
           wwv_flow_company_schemas s,
           (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                   (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
              from sys.dual) d
      where (s.schema  = cu  or
            (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
            d.sgid              = w.PROVISIONING_COMPANY_ID) and
            s.security_group_id = w.provisioning_company_id and
            (user in ('SYS','SYSTEM', 'APEX_040200') or w.provisioning_company_id != 10) and
            t.security_group_id = 11 and
            t.theme_security_group_id is null
      union all
      -- workspace theme
      select distinct wwv_flow_escape.html(t.theme_name)||' - '||t.theme_id theme_name,
             theme_id theme_number,
             'WORKSPACE' theme_type,
             w.short_name workspace,
             w.display_name workspace_display_name,
             w.provisioning_company_id workspace_id
      from wwv_flow_themes t,
           wwv_flow_companies w,
           wwv_flow_company_schemas s,
           (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                   (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
              from sys.dual) d
      where (s.schema  = cu  or
            (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
            d.sgid              = w.PROVISIONING_COMPANY_ID) and
            s.security_group_id = w.provisioning_company_id and
            (user in ('SYS','SYSTEM', 'APEX_040200') or w.provisioning_company_id != 10) and
            t.security_group_id = 11 and
            w.provisioning_company_id = t.theme_security_group_id and
            (t.theme_security_group_id = d.sgid or t.theme_security_group_id = s.security_group_id)
      ) x
order by 1;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_TEAM_FEEDBACK" ("WORKSPACE_ID",
"WORKSPACE_NAME",
"WORKSPACE_DISPLAY_NAME",
"FEEDBACK_ID",
"FEEDBACK_NUMBER",
"FEEDBACK",
"FEEDBACK_TYPE",
"FEEDBACK_STATUS",
"DEPLOYMENT_SYSTEM",
"APPLICATION_ID",
"APPLICATION_NAME",
"APPLICATION_VERSION",
"PAGE_ID",
"PAGE_NAME",
"PAGE_LAST_UPDATED_BY",
"PAGE_LAST_UPDATED",
"LOGGING_SESSION_ID",
"LOGGING_APEX_USER",
"LOGGING_USER_EMAIL",
"SESSION_STATE",
"PARSING_SCHEMA",
"SCREEN_WIDTH",
"SCREEN_HEIGHT",
"HTTP_USER_AGENT",
"REMOTE_ADDR",
"REMOTE_USER",
"HTTP_HOST",
"SERVER_NAME",
"SERVER_PORT",
"LOGGING_WORKSPACE_NAME",
"LOGGING_WORKSPACE_ID",
"LOGGING_EMAIL",
"SESSION_INFO",
"TAGS",
"DEVELOPER_COMMENT",
"PUBLIC_RESPONSE",
"LOGGED_AS_BUG_ID",
"LOGGED_AS_FEATURE_ID",
"LOGGED_AS_TODO_ID",
"LABEL_01",
"LABEL_02",
"LABEL_03",
"LABEL_04",
"LABEL_05",
"LABEL_06",
"LABEL_07",
"LABEL_08",
"ATTRIBUTE_01",
"ATTRIBUTE_02",
"ATTRIBUTE_03",
"ATTRIBUTE_04",
"ATTRIBUTE_05",
"ATTRIBUTE_06",
"ATTRIBUTE_07",
"ATTRIBUTE_08",
"CREATED_BY",
"CREATED_ON",
"UPDATED_BY",
"UPDATED_ON") AS
  select
    w.PROVISIONING_COMPANY_ID   workspace_id,
    w.short_name                workspace_name,
    w.display_name              workspace_display_name,
    --
    f.ID                        feedback_id,
    f.deployment_system||
    f.feedback_id               feedback_number,
    f.FEEDBACK_COMMENT          feedback,
    f.FEEDBACK_TYPE             feedback_type,
    f.FEEDBACK_STATUS           feedback_status,
    f.deployment_system         deployment_system,
    --
    f.APPLICATION_ID            application_id,
    f.APPLICATION_NAME          application_name,
    f.APPLICATION_VERSION       application_version,
    f.PAGE_ID                   page_id,
    f.PAGE_NAME                 page_name,
    f.PAGE_LAST_UPDATED_BY      page_last_updated_by,
    f.PAGE_LAST_UPDATED_ON      page_last_updated,
    f.SESSION_ID                logging_session_id,
    f.APEX_USER                 logging_apex_user,
    f.user_email                logging_user_email,
    --
    f.SESSION_STATE,
    f.PARSING_SCHEMA,
    f.screen_width,
    f.screen_height,
    f.HTTP_USER_AGENT,
    f.REMOTE_ADDR,
    f.REMOTE_USER,
    f.HTTP_HOST,
    f.SERVER_NAME,
    f.SERVER_PORT,
    --
    f.LOGGED_BY_WORKSPACE_NAME   logging_workspace_name,
    f.LOGGING_SECURITY_GROUP_ID  logging_workspace_id,
    f.LOGGING_EMAIL,
    --
    f.SESSION_INFO               session_info,
    f.tags                       tags,
    f.DEVELOPER_COMMENT          developer_comment,
    f.public_response            public_response,
    f.BUG_ID                     logged_as_bug_id,
    f.FEATURE_ID                 logged_as_feature_id,
    f.TASK_ID                    logged_as_todo_id,
    --
    f.LABEL_01,
    f.LABEL_02,
    f.LABEL_03,
    f.LABEL_04,
    f.LABEL_05,
    f.LABEL_06,
    f.LABEL_07,
    f.LABEL_08,
    --
    f.ATTRIBUTE_01,
    f.ATTRIBUTE_02,
    f.ATTRIBUTE_03,
    f.ATTRIBUTE_04,
    f.ATTRIBUTE_05,
    f.ATTRIBUTE_06,
    f.ATTRIBUTE_07,
    f.ATTRIBUTE_08,
    --
    f.CREATED_BY,
    f.CREATED_ON,
    f.UPDATED_BY,
    f.UPDATED_ON
from
    wwv_flow_feedback f,
    wwv_flow_companies w
where
    f.security_group_id = w.PROVISIONING_COMPANY_ID and
    w.PROVISIONING_COMPANY_ID in (
       select security_group_id
       from   wwv_flow_company_schemas s,
              (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                      (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
                 from sys.dual) d
        where (s.schema  = cu  or
              (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
              d.sgid              = w.PROVISIONING_COMPANY_ID)) and
              (user in ('SYS', 'SYSTEM', 'APEX_040200') or w.PROVISIONING_COMPANY_ID != 10);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_TEAM_FEEDBACK_FOLLOWUP" ("WORKSPACE_ID",
"WORKSPACE_NAME",
"WORKSPACE_DISPLAY_NAME",
"FOLLOWUP_ID",
"FEEDBACK_ID",
"FOLLOW_UP",
"EMAIL",
"CREATED_BY",
"CREATED_ON",
"UPDATED_BY",
"UPDATED_ON") AS
  select
    w.PROVISIONING_COMPANY_ID   workspace_id,
    w.short_name                workspace_name,
    w.display_name              workspace_display_name,
    --
    f.ID                        followup_id,
    f.feedback_id               feedback_id,
    --
    f.follow_up,
    f.email,
    --
    f.CREATED_BY,
    f.CREATED_ON,
    f.UPDATED_BY,
    f.UPDATED_ON
from
    wwv_flow_feedback_followup f,
    wwv_flow_feedback fe,
    wwv_flow_companies w
where
    f.feedback_id = fe.id and
    fe.security_group_id = w.PROVISIONING_COMPANY_ID and
    w.PROVISIONING_COMPANY_ID in (
       select security_group_id
       from   wwv_flow_company_schemas s,
              (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                      (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
                 from sys.dual) d
      where (s.schema  = cu  or
            (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
            d.sgid              = w.PROVISIONING_COMPANY_ID)) and
            (user in ('SYS', 'SYSTEM', 'APEX_040200') or w.PROVISIONING_COMPANY_ID != 10);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_DEBUG_MESSAGES" ("ID",
"PAGE_VIEW_ID",
"MESSAGE_TIMESTAMP",
"ELAPSED_TIME",
"EXECUTION_TIME",
"MESSAGE",
"APPLICATION_ID",
"PAGE_ID",
"SESSION_ID",
"APEX_USER",
"MESSAGE_LEVEL",
"WORKSPACE_ID") AS
  select id,
       page_view_id,
       message_timestamp,
       elap as elapsed_time,
       extract(second from (lead(message_timestamp) over (partition by page_view_id order by id) - message_timestamp)) +
       extract(minute from (lead(message_timestamp) over (partition by page_view_id order by id) - message_timestamp)) * 60 as execution_time,
       message,
       flow_id as application_id,
       page_id,
       session_id,
       apex_user,
       message_level,
       security_group_id as workspace_id
  from ( select m.*
           from wwv_flow_debug_messages m,
                wwv_flow_companies w
          where m.security_group_id = w.provisioning_company_id
            and w.provisioning_company_id in (
                    select security_group_id
                      from wwv_flow_company_schemas s,
                           (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                                   (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
                              from sys.dual) d
                     where (s.schema  = cu  or
                           (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
                            d.sgid              = w.PROVISIONING_COMPANY_ID)
                    )
              and (user in ('SYS', 'SYSTEM', 'APEX_040200') or w.PROVISIONING_COMPANY_ID != 10)
          union all
         select m.*
           from wwv_flow_debug_messages2 m,
                wwv_flow_companies w
          where m.security_group_id = w.provisioning_company_id
            and w.provisioning_company_id in (
                    select security_group_id
                      from wwv_flow_company_schemas s,
                           (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                                   (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
                              from sys.dual) d
                     where (s.schema  = cu  or
                           (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
                            d.sgid              = w.PROVISIONING_COMPANY_ID)
                    )
            and (user in ('SYS', 'SYSTEM', 'APEX_040200') or w.PROVISIONING_COMPANY_ID != 10)
       );

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_TRANS_DYNAMIC" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"WORKSPACE_ID",
"APPLICATION_ID",
"APPLICATION_NAME",
"MESSAGE_ID",
"FROM_MESSAGE",
"TO_MESSAGE",
"LANGUAGE_CODE",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.security_group_id              workspace_id,
    f.id                             application_id,
    f.name                           application_name,
    --
    t.id                             message_id,
    t.translate_from_text            from_message,
    t.translate_to_text              to_message,
    t.translate_to_lang_code         language_code,
    t.last_updated_by                last_updated_by,
    t.last_updated_on                last_updated_on
from wwv_flow_dynamic_translations$ t,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      f.id = t.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'))
  /* keep this not exists */
  and not exists ( select 1
                     from wwv_flow_language_map m
                    where m.translation_flow_id = f.id
                      and m.security_group_id   = f.security_group_id
                      and f.authentication_id   <> trunc(f.authentication_id) )
  and w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPLICATION_TRANS_REPOS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"WORKSPACE_ID",
"APPLICATION_ID",
"APPLICATION_NAME",
"TRANSLATED_APPLICATION_ID",
"APPLICATION_PAGE_ID",
"ID",
"FROM_ID",
"TO_ID",
"FROM_STRING",
"TO_STRING",
"ATTRIBUTE_DESCRIPTION",
"LANGUAGE_CODE",
"TRANSLATABLE",
"INTERNAL_ATTRIBUTE_NAME",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.security_group_id              workspace_id,
    f.id                             application_id,
    f.name                           application_name,
    t.translated_flow_id             translated_application_id,
    t.page_id                        application_page_id,
    --
    t.id                             id,
    t.translate_from_id              from_id,
    t.translate_to_id                to_id,
    t.translate_from_text            from_string,
    t.translate_to_text              to_string,
    c.column_description             attribute_description,
    t.translate_to_lang_code         language_code,
    case
        when c.template_translatable = 'N' then 'Y'
        when c.template_translatable = 'Y' and t.template_translatable = 'Y' then 'Y'
        else 'N'
    end translatable,
    replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(decode(table_name,'WWV_FLOWS','APEX_APPLICATIONS', replace(table_name,'WWV_FLOW','APEX')), '_PLUGS','_REGIONS'), '_WORKSHEET_', '_IR_'),'_STEP','_PAGE'),'MENU_','BREADCRUMB_'),'DA_ACTIONS','DYNAMIC_ACTIONS'),'WORKSHEETS','INTERACTIVE_REPORTS'),'ICON_BAR','NAVIGATION_BAR'),'PLUG_TEMPLATES','REGION_TEMPLATES'),'_CAL_','_CALENDAR_'),'_TOPLEVEL_','_PARENT_'),'_FIELD_','_LABEL_') || '.' || column_name internal_attribute_name,
    t.created_by                     created_by,
    t.created_on                     created_on,
    t.last_updated_by                last_updated_by,
    t.last_updated_on                last_updated_on
from wwv_flow_translatable_text$ t,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     wwv_flow_translatable_cols$ c,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      f.id = t.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN'))
  /* keep this not exists */
  and not exists ( select 1
                     from wwv_flow_language_map m
                    where m.translation_flow_id = f.id
                      and m.security_group_id   = f.security_group_id
                      and f.authentication_id   <> trunc(f.authentication_id) )
  and w.PROVISIONING_COMPANY_ID != 0
  and t.translate_from_flow_table = c.table_name
  and t.translate_from_flow_column = c.column_name;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPL_LOAD_TABLES" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"WORKSPACE_ID",
"APPLICATION_ID",
"APPLICATION_NAME",
"NAME",
"OWNER",
"TABLE_NAME",
"UNIQUE_COLUMN_1",
"UNIQUE_COLUMN_2",
"UNIQUE_COLUMN_3",
"WIZARD_PAGE_IDS",
"IS_UK1_CASE_SENSITIVE",
"IS_UK2_CASE_SENSITIVE",
"IS_UK3_CASE_SENSITIVE",
"LOOKUPS",
"RULES",
"VERSION_COLUMN_NAME",
"COLUMN_NAMES_LOV_ID",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"COMMENTS",
"LOAD_TABLE_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
   w.display_name                   workspace_display_name,
   f.security_group_id              workspace_id,
   --
    f.id                             application_id,
    f.name                           application_name,
    --
    t.name                           name,
    t.owner                          owner,
   t.table_name                     table_name,
   t.unique_column_1                unique_column_1,
   t.unique_column_2                unique_column_2,
   t.unique_column_3                unique_column_3,
    t.wizard_page_ids                wizard_page_ids,
   --
   t.is_uk1_case_sensitive          is_uk1_case_sensitive,
   t.is_uk2_case_sensitive          is_uk2_case_sensitive,
   t.is_uk3_case_sensitive          is_uk3_case_sensitive,
    --
   (select count(*) from wwv_flow_load_table_lookups where load_table_id = t.id ) lookups,
   (select count(*) from wwv_flow_load_table_rules where load_table_id = t.id ) rules,
   --
   t.version_column_name             version_column_name,
   t.column_names_lov_id             column_names_lov_id,
   --
   t.created_by                      created_by,
   t.created_on                      created_on,
   t.last_updated_by                 last_updated_by,
   t.last_updated_on                 last_updated_on,
   t.comments                        comments,
   t.id                              load_table_id,
   --
   t.table_name
    ||' uk1= '||t.unique_column_1
    ||' cs1= '||t.is_uk1_case_sensitive
    ||' uk2= '||nvl(t.unique_column_2,'n/a')
    ||' cs2= '||nvl(t.is_uk2_case_sensitive,'n/a')
    ||' uk3= '||nvl(t.unique_column_3,'n/a')
    ||' cs3= '||nvl(t.is_uk3_case_sensitive,'n/a')
   component_signature
   from wwv_flow_load_tables t,
     wwv_flows f,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = t.flow_id and
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPL_LOAD_TABLE_LOOKUPS" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"WORKSPACE_ID",
"TABLE_NAME",
"LOAD_TABLE_ID",
"LOAD_COLUMN_NAME",
"LOOKUP_OWNER",
"LOOKUP_TABLE_NAME",
"KEY_COLUMN",
"DISPLAY_COLUMN",
"WHERE_CLAUSE",
"ALTERNATIVE_KEY_COLUMN1",
"ALTERNATIVE_DISPLAY_COLUMN1",
"ALTERNATIVE_KEY_COLUMN2",
"ALTERNATIVE_DISPLAY_COLUMN2",
"INSERT_NEW_VALUE",
"ERROR_MESSAGE",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"LOOKUP_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                     workspace,
    w.display_name                   workspace_display_name,
    f.id                             application_id,
    f.name                           application_name,
   f.security_group_id              workspace_id,
    --
   t.table_name                     table_name,
   --
   l.load_table_id                  load_table_id,
   l.load_column_name               load_column_name,
    --
    l.lookup_owner                   lookup_owner,
   l.lookup_table_name              lookup_table_name,
   l.key_column                     key_column,
   l.display_column                 display_column,
    l.where_clause                   where_clause,
   l.alternative_key_column1        alternative_key_column1,
   l.alternative_display_column1    alternative_display_column1,
   l.alternative_key_column2        alternative_key_column2,
   l.alternative_display_column2    alternative_display_column2,
   decode (l.insert_new_value,
             null, null, 'Y', 'Yes',
          'N', 'No')             insert_new_value,
   l.error_message                  error_message,
   --
   l.created_by                      created_by,
   l.created_on                      created_on,
   l.last_updated_by                 last_updated_by,
   l.last_updated_on                 last_updated_on,
   l.id                              lookup_id,
    --
   t.table_name
   ||' ldc= '||l.load_column_name
    ||' lkt= '||l.lookup_table_name
    ||' lkk= '||l.key_column
    ||' lkd= '||l.display_column
   ||' lkka= '||nvl(l.alternative_key_column1, 'n/a')
   ||' lkda= '||nvl(l.alternative_display_column1, 'n/a')
   ||' lkka= '||nvl(l.alternative_key_column2, 'n/a')
   ||' lkda= '||nvl(l.alternative_display_column2, 'n/a')
   ||' nwk= '||decode (l.insert_new_value,
             null, null, 'Y', 'Yes', 'N', 'No')
    ||' err= '||nvl(l.error_message, 'null')
   component_signature
from  wwv_flow_load_table_lookups l,
    wwv_flow_load_tables t,
    wwv_flows f,
    wwv_flow_companies w,
    wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = l.flow_id and
     t.id = l.load_table_id and
     f.id = t.flow_id and
     --
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_APPL_LOAD_TABLE_RULES" ("WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"APPLICATION_ID",
"APPLICATION_NAME",
"WORKSPACE_ID",
"TABLE_NAME",
"LOAD_TABLE_ID",
"LOAD_COLUMN_NAME",
"RULE_NAME",
"RULE_TYPE",
"RULE_SEQUENCE",
"RULE_EXPRESSION1",
"RULE_EXPRESSION2",
"ERROR_MESSAGE",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON",
"RULE_ID",
"COMPONENT_SIGNATURE") AS
  select
    w.short_name                      workspace,
    w.display_name                    workspace_display_name,
    f.id                              application_id,
    f.name                            application_name,
   f.security_group_id               workspace_id,
    --
   t.table_name                      table_name,
   --
   l.load_table_id                   load_table_id,
   l.load_column_name                load_column_name,
   l.rule_name                       rule_name,
   l.rule_type                       rule_type,
   l.rule_sequence                   rule_sequence,
   l.rule_expression1                rule_expression1,
   l.rule_expression2                rule_expression2,
   l.error_message                   error_message,
   --
   l.created_by                      created_by,
   l.created_on                      created_on,
   l.last_updated_by                 last_updated_by,
   l.last_updated_on                 last_updated_on,
   --
   l.id                              rule_id,
    --
    t.table_name
    ||' c= '||l.load_column_name
    ||' rn= '||l.rule_name
    ||' rt= '||l.rule_type
   ||' exp1= '||nvl(l.rule_expression1, 'n/a')
   ||' exp2= '||nvl(l.rule_expression2, 'n/a')
    ||' err= '||nvl(l.error_message, 'null')
   component_signature
from  wwv_flow_load_table_rules l,
    wwv_flow_load_tables t,
    wwv_flows f,
    wwv_flow_companies w,
    wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      f.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.schema = f.owner and
      f.id = l.flow_id and
     t.id = l.load_table_id and
     f.id = t.flow_id and
     --
      (d.sgid != 0 or nvl(f.BUILD_STATUS,'x') not in ('RUN_ONLY','RUN_AND_HIDDEN')) and
      w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_REST_RESOURCE_HANDLERS" ("WORKSPACE_ID",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"TEMPLATE_ID",
"URI_TEMPLATE",
"SOURCE_TYPE",
"FORMAT",
"HANDLER_ID",
"METHOD",
"MIMES_ALLOWED",
"ITEMS_PER_PAGE",
"REQUIRE_HTTPS",
"SOURCE",
"PARAMETERS",
"ROW_VERSION_NUMBER",
"COMMENTS",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select
    w.provisioning_company_id                       workspace_id,
    w.short_name                                    workspace,
    w.display_name                                  workspace_display_name,
    h.template_id                                   template_id,
    t.uri_template                                  uri_template,
    decode(h.source_type,'QUERY','Query',
                    'QUERY_1_ROW','Query One Row',
                    'FEED','Feed',
                    'PLSQL','PL/SQL',
                    'MEDIA','Media Resource')       source_type,
    decode(h.format,'DEFAULT','Default',
                    'CSV')                          format,
    h.id                                            handler_id,
    h.method                                        method,
    h.mimes_allowed                                 mimes_allowed,
    h.items_per_page                                items_per_page,
    decode(h.require_https,'YES','Yes',
                                 'NO','No')         require_https,
    h.source                                        source,
    (select count(*) from wwv_flow_rt$parameters where handler_id = h.id and security_group_id = h.security_group_id) parameters,
    h.row_version_number                            row_version_number,
    h.comments                                      comments,
    h.created_by,
    h.created_on,
    h.UPDATED_BY                                    last_updated_by,
    h.UPDATED_ON                                    last_updated_on
from wwv_flow_rt$handlers h,
     wwv_flow_company_schemas s,
     wwv_flow_companies w,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d,
     wwv_flow_rt$templates t
where (s.schema  = cu
   or (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
   or  d.sgid              = w.PROVISIONING_COMPANY_ID)
  and  w.PROVISIONING_COMPANY_ID != 0
  and  h.security_group_id = w.provisioning_company_id
  and  s.security_group_id = w.PROVISIONING_COMPANY_ID
  and  t.id = h.template_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_REST_RESOURCE_MODULES" ("WORKSPACE_ID",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"MODULE_ID",
"MODULE_NAME",
"URI_PREFIX",
"PARSING_SCHEMA",
"ORIGINS_ALLOWED",
"ITEMS_PER_PAGE",
"PRIVILEGE",
"TEMPLATES",
"STATUS",
"COMMENTS",
"ROW_VERSION_NUMBER",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select
    w.provisioning_company_id                         workspace_id,
    w.short_name                                      workspace,
    w.display_name                                    workspace_display_name,
    m.id                                              module_id,
    m.name                                            module_name,
    m.uri_prefix                                      uri_prefix,
    m.parsing_schema                                  parsing_schema,
    m.origins_allowed                                 origins_allowed,
    m.items_per_page                                  items_per_page,
    (select label from wwv_flow_rt$privileges
      where id = m.privilege_id
        and security_group_id = m.security_group_id)  privilege,
    (select count(*) from wwv_flow_rt$templates
      where module_id = m.id
        and security_group_id = m.security_group_id)  templates,
    m.status                                          status,
    m.comments                                        comments,
    m.row_version_number                              row_version_number,
    m.created_by,
    m.created_on,
    m.UPDATED_BY                                      last_updated_by,
    m.UPDATED_ON                                      last_updated_on
from wwv_flow_rt$modules m,
     wwv_flow_company_schemas s,
     wwv_flow_companies w,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu
   or  (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
   or  d.sgid              = w.PROVISIONING_COMPANY_ID)
  and  m.security_group_id = w.provisioning_company_id
  and  s.security_group_id = w.PROVISIONING_COMPANY_ID
  and  w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_REST_RESOURCE_PARAMETERS" ("WORKSPACE_ID",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"HANDLER_NAME",
"HANDLER_ID",
"PARAMETER_ID",
"PARAMETER_NAME",
"BIND_VARIABLE_NAME",
"SOURCE_TYPE",
"ACCESS_METHOD",
"PARAM_TYPE",
"ROW_VERSION_NUMBER",
"COMMENTS",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select
    w.provisioning_company_id                        workspace_id,
    w.short_name                                     workspace,
    w.display_name                                   workspace_display_name,
    (select method from wwv_flow_rt$handlers
      where id = p.handler_id
        and security_group_id = p.security_group_id) handler_name,
    p.handler_id                                     handler_id,
    p.id                                             parameter_id,
    p.name                                           parameter_name,
    p.bind_variable_name                             bind_variable_name,
    decode(p.source_type,'URI','URI',
                    'HEADER','HTTP Header',
                    'RESPONSE','Response Body')      source_type,
    decode(p.access_method,'IN','IN',
                           'OUT','OUT',
                           'INOUT','IN/OUT')         access_method,
    decode(p.param_type,'STRING','String',
                        'INT','Int',
                        'DOUBLE','Double',
                        'BOOLEAN','Boolean',
                        'LONG','Long',
                        'TIMESTAMP','Timestamp')     param_type,
    p.row_version_number                             row_version_number,
    p.comments                                       comments,
    p.created_by,
    p.created_on,
    p.UPDATED_BY                                     last_updated_by,
    p.UPDATED_ON                                     last_updated_on
from wwv_flow_rt$parameters p,
     wwv_flow_company_schemas s,
     wwv_flow_companies w,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where  (s.schema  = cu
   or  (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
   or  d.sgid              = w.PROVISIONING_COMPANY_ID)
  and  p.security_group_id = w.provisioning_company_id
  and  s.security_group_id = w.PROVISIONING_COMPANY_ID
  and  w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_REST_RESOURCE_TEMPLATES" ("WORKSPACE_ID",
"WORKSPACE",
"WORKSPACE_DISPLAY_NAME",
"TEMPLATE_ID",
"MODULE_ID",
"MODULE_NAME",
"URI_TEMPLATE",
"PRIORITY",
"ETAG_TYPE",
"ETAG_QUERY",
"HANDLERS",
"ROW_VERSION_NUMBER",
"COMMENTS",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select
    w.provisioning_company_id                        workspace_id,
    w.short_name                                     workspace,
    w.display_name                                   workspace_display_name,
    t.id                                             template_id,
    t.module_id                                      module_id,
    (select name from wwv_flow_rt$modules
      where id = t.module_id
        and security_group_id = t.security_group_id) module_name,
    t.uri_template                                   uri_template,
    t.priority                                       priority,
    t.etag_type                                      etag_type,
    t.etag_query                                     etag_query,
    (select count(*) from wwv_flow_rt$handlers
      where template_id = t.id
        and security_group_id = t.security_group_id) handlers,
    t.row_version_number                             row_version_number,
    t.comments                                       comments,
    t.created_by,
    t.created_on,
    t.UPDATED_BY                                     last_updated_by,
    t.UPDATED_ON                                     last_updated_on
from wwv_flow_rt$templates t,
     wwv_flow_company_schemas s,
     wwv_flow_companies w,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where  (s.schema  = cu
   or  (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
   or  d.sgid              = w.PROVISIONING_COMPANY_ID)
  and  t.security_group_id = w.provisioning_company_id
  and  s.security_group_id = w.PROVISIONING_COMPANY_ID
  and  w.PROVISIONING_COMPANY_ID != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_COMPONENT_SIGNATURES" ("PAGE_ID",
"PAGE_NAME",
"COMPONENT",
"COMPONENT_NAME",
"COMPONENT_SIGNATURE",
"APPLICATION_1",
"APPLICATION_2") AS
  select page_id,
       page_name,
       component,
       component_name,
       component_signature,
       sum(decode(application_id,x.a1,1,0)) as application_1,
       sum(decode(application_id,x.a2,1,0)) as application_2
  from
       (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x,
       (
        select 'PAGE' component,
               page_id,
               page_name,
               lpad(page_id,5,'00000')||'. '||page_title component_name,
               component_signature,
               application_id
          from APEX_APPLICATION_PAGES,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='PAGE')
         union all
        select 'PAGE.VALIDATION' component,
               page_id,
               page_name,
               VALIDATION_NAME component_name,
               component_signature,
               application_id
          from APEX_APPLICATION_PAGE_VAL,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='PAGE.VALIDATION')
         union all
        select 'PAGE.BRANCH' component,
               page_id,
               page_name,
               nvl(branch_name, substr(BRANCH_ACTION,1,40)||length(branch_action)) component_name,
               component_signature,
               application_id
          from APEX_APPLICATION_PAGE_BRANCHES,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='PAGE.BRANCH')
         union all
        select 'PAGE.COMPUTATION' component,
               page_id,
               page_name,
               ITEM_NAME component_name,
               component_signature,
               application_id
          from apex_application_page_comp,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='PAGE.COMPUTATION')
         union all
        select 'PAGE.PROCESS' component,
               page_id,
               page_name,
               PROCESS_NAME component_name,
               component_signature,
               application_id
          from APEX_APPLICATION_PAGE_PROC,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='PAGE.PROCESS')
         union all
        select 'PAGE.REGION' component,
               page_id,
               page_name,
               region_name component_name,
               component_signature,
               application_id
          from APEX_APPLICATION_PAGE_REGIONS,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='PAGE.REGION')
         union all
        select 'PAGE.ITEM' component,
               page_id,
               page_name,
               item_name component_name,
               component_signature,
               application_id
          from APEX_APPLICATION_PAGE_ITEMS,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='PAGE.ITEM')
         union all
        select 'PAGE.BUTTON' component,
               page_id,
               page_name,
               button_name component_name,
               component_signature,
               application_id
          from APEX_APPLICATION_PAGE_BUTTONS,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='PAGE.BUTTON')
         union all
        select 'AUTHENTICATION' component,
               0 page_id,
               null page_name,
               authentication_scheme_name as component_name,
               component_signature,
               application_id
          from apex_application_auth,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='AUTHENTICATION')
         union all
        select 'LOV.ENTRY' component,
               0 page_id,
               null page_name,
               LIST_OF_VALUES_NAME||'.'||substr(display_value,1,50) component_name,
               component_signature,
               application_id
          from apex_application_lov_entries,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='LOV.ENTRY')
         union all
        select 'LOV' component,
               0 page_id,
               null page_name,
               LIST_OF_VALUES_NAME component_name,
               component_signature,
               application_id
          from APEX_APPLICATION_LOVS,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='LOV')
         union all
        select 'APPLICATION.PROCESS' component,
               0 page_id,
               null page_name,
               process_name component_name,
               component_signature,
               application_id
          from apex_application_processes,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='APPLICATION.PROCESS')
         union all
        select 'APPLICATION.COMPUTATION' component,
               0 page_id,
               null page_name,
               computation_item component_name,
               component_signature,
               application_id
          from apex_application_computations,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='APPLICATION.COMPUTATION')
         union all
        select 'NAVBAR' component,
               0 page_id,
               null page_name,
               ICON_SUBTEXT component_name,
               component_signature,
               application_id
          from APEX_APPLICATION_NAV_BAR,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='NAVBAR')
         union all
        select 'TAB' component,
               t.tab_page page_id,
               (select name from wwv_flow_steps where flow_id=t.application_id and id=t.tab_page) page_name,
               tab_name component_name,
               component_signature,
               application_id
          from apex_application_tabs t,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='TAB')
         union all
        select 'PARENT.TAB' component,
               0 page_id,
               null page_name,
               tab_name component_name,
               component_signature,
               application_id
          from apex_application_parent_tabs t,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='PARENT.TAB')
         union all
        select 'BREADCRUMB' component,
               0 page_id,
               null page_name,
               BREADCRUMB_NAME component_name,
               component_signature,
               application_id
          from APEX_APPLICATION_BREADCRUMBS,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='BREADCRUMB')
         union all
        select 'LIST' component,
               0 page_id,
               null page_name,
               LIST_NAME component_name,
               component_signature,
               application_id
          from apex_application_lists,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='LIST')
         union all
        select 'LIST.ENTRY' component,
               0 page_id,
               null page_name,
               list_name||'.'||entry_text component_name,
               component_signature,
               application_id
          from apex_application_list_entries,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='LIST.ENTRY')
         union all
        select 'TREE' component,
               0 page_id,
               null page_name,
               tree_name component_name,
               component_signature,
               application_id
          from apex_application_trees,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='TREE')
         union all
        select 'SHORTCUT' component,
               0 page_id,
               null page_name,
               shortcut_name component_name,
               component_signature,
               application_id
          from apex_application_shortcuts,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='SHORTCUT')
         union all
        select 'APPLICATION.ITEM' component,
               0 page_id,
               null page_name,
               ITEM_NAME component_name,
               component_signature,
               application_id
          from apex_application_items,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='APPLICATION.ITEM')
         union all
        select 'BUILD.OPTION' component,
               0 page_id,
               null page_name,
               build_option_name component_name,
               component_signature,
               application_id
          from apex_application_build_options,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='BUILD.OPTION')
         union all
        select 'BREADCRUMB.ENTRY' component,
               DEFINED_FOR_PAGE page_id,
               (select name from wwv_flow_steps where id = DEFINED_FOR_PAGE and flow_id = application_id) page_name,
               ENTRY_LABEL component_name,
               component_signature,
               application_id
          from APEX_APPLICATION_BC_ENTRIES,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='BREADCRUMB.ENTRY')
         union all
        select 'APPLICATION.ATTRIBUTES' component,
               0 page_id,
               null page_name,
               application_name component_name,
               component_signature,
               application_id
          from APEX_APPLICATIONS,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='APPLICATION.ATTRIBUTES')
         union all
        select 'PAGE.REGION' component,
               page_id,
               (select name from wwv_flow_steps where id = v.page_id and flow_id = v.application_id) page_name,
               (select plug_name from wwv_flow_page_plugs where flow_id = v.application_id and id = v.region_id)||' - IR'
                   as component_name,
               component_signature,
               application_id
          from apex_application_page_ir v,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where v.application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='PAGE.REGION')
         union all
        select 'REPORT.COLUMN' component,
               page_id,
               (select name from wwv_flow_steps where id = v.page_id and flow_id = v.application_id) page_name,
               v.report_label component_name,
               component_signature,
               application_id
          from apex_application_page_ir_col v,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where v.application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='REPORT.COLUMN')
         union all
        select 'REPORT.COLUMN' component,
               page_id,
               page_name,
               REGION_NAME||'.'||substr(column_alias,1,255) component_name,
               component_signature,
               application_id
          from apex_application_page_rpt_cols,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='REPORT.COLUMN')
         union all
        select 'AUTHORIZATION' component,
               0 page_id,
               null page_name,
               AUTHORIZATION_SCHEME_NAME component_name,
               component_signature,
               application_id
          from apex_application_authorization,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='AUTHORIZATION')
         union all
        select 'THEME' component,
               0 page_id,
               null page_name,
               theme_name component_name,
               component_signature,
               application_id
          from apex_application_themes,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='THEME')
         union all
        select 'TEMPLATE.CALENDAR' component,
               0 page_id,
               null page_name,
               template_name component_name,
               component_signature,
               application_id
          from apex_application_temp_calendar,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='TEMPLATE.CALENDAR')
         union all
        select 'TEMPLATE.BUTTON' component,
               0 page_id,
               null page_name,
               template_name component_name,
               component_signature,
               application_id
          from apex_application_temp_button,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='TEMPLATE.BUTTON')
         union all
        select 'TEMPLATE.POPUP' component,
               0 page_id,
               null page_name,
               'POPUP' component_name,
               component_signature,
               application_id
          from apex_application_temp_popuplov,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='TEMPLATE.POPUP')
         union all
        select 'TEMPLATE.REPORT' component,
               0 page_id,
               null page_name,
               template_name component_name,
               component_signature,
               application_id
          from apex_application_temp_report,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='TEMPLATE.REPORT')
         union all
        select 'TEMPLATE.BREADCRUMB' component,
               0 page_id,
               null page_name,
               template_name component_name,
               component_signature,
               application_id
          from apex_application_temp_bc,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='TEMPLATE.BREADCRUMB')
         union all
        select 'TEMPLATE.LIST' component,
               0 page_id,
               null page_name,
               template_name component_name,
               component_signature,
               application_id
          from apex_application_temp_list,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='TEMPLATE.LIST')
         union all
        select 'TEMPLATE.LABEL' component,
               0 page_id,
               null page_name,
               template_name component_name,
               component_signature,
               application_id
          from apex_application_temp_label,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='TEMPLATE.LABEL')
         union all
        select 'TEMPLATE.REGION' component,
               0 page_id,
               null page_name,
               template_name component_name,
               component_signature,
               application_id
          from APEX_APPLICATION_TEMP_REGION,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='TEMPLATE.REGION')
         union all
        select 'TEMPLATE.PAGE' component,
               0 page_id,
               null page_name,
               template_name component_name,
               component_signature,
               application_id
          from apex_application_temp_page,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='TEMPLATE.PAGE')
         union all
        select 'FLASH_CHART' component,
               page_id,
               page_name,
               region_name||'.'||chart_type component_name,
               component_signature,
               application_id
          from apex_application_page_flash_ch,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='FLASH_CHART')
         union all
        select 'FLASH_CHART.SERIES' component,
               page_id,
               page_name,
               region_name||'.'||series_name component_name,
               component_signature,
               application_id
          from apex_application_page_flash_s,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1,x.a2)
           and (nvl(x.c,'0')='0' or x.c='FLASH_CHART.SERIES')
         union all
        select 'WEB.SERVICE' component,
               0 as page_id,
               null as page_name,
               web_service_name as component_name,
               component_signature,
               application_id
          from apex_application_web_services,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1, x.a2)
           and (nvl(x.c,'0')='0' or x.c='WEB.SERVICE')
         union all
        select 'DATA.LOADING' component,
               0 as page_id,
               null as page_name,
               name as component_name,
               component_signature,
               application_id
          from apex_appl_load_tables,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1, x.a2)
           and (nvl(x.c,'0')='0' or x.c='DATA.LOADING')
         union all
        select 'PLUGIN' component,
               0 as page_id,
               null as page_name,
               display_name as component_name,
               component_signature,
               application_id
          from apex_appl_plugins,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1, x.a2)
           and (nvl(x.c,'0')='0' or x.c='PLUGIN')
         union all
        select 'TEXT.MESSAGE' component,
               0 as page_id,
               null as page_name,
               translatable_message as component_name,
               component_signature,
               application_id
          from apex_application_translations,
               (select nv('APEX_APPLICATION_1') a1, nv('APEX_APPLICATION_2') a2, v('APEX_COMPONENT') c from sys.dual) x
         where application_id in (x.a1, x.a2)
           and (nvl(x.c,'0')='0' or x.c='TEXT.MESSAGE')
       ) d
 group by page_id, page_name, component, component_signature, component_name;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WS_APPLICATIONS" ("WORKSPACE",
"APPLICATION_ID",
"WORKSPACE_ID",
"APPLICATION_NAME",
"OWNER",
"DESCRIPTION",
"STATUS",
"LOGIN_URL",
"LOGOUT_URL",
"HOME_PAGE_ID",
"PAGE_STYLE",
"CUSTOM_CSS",
"SHOW_RESET_PASSWD_YN",
"ALLOW_SQL_YN",
"ALLOW_PUBLIC_ACCESS_YN",
"LOGIN_PAGE_MESSAGE",
"AUTH_ID",
"ACL_TYPE",
"DATE_FORMAT",
"LANGUAGE",
"TERRITORY",
"LOGO_TYPE",
"LOGO_TEXT",
"LOGO_TEXT_ATTRIBUTES",
"LOGO_IMAGE_SIZE",
"LOGO_IMAGE_FILENAME",
"LOGO_IMAGE_MIMETYPE",
"LOGO_IMAGE_CHARSET",
"LOGO_IMAGE_LAST_UPDATE",
"LOGO_IMAGE_ATTRIBUTES",
"LOGO_FILEPATH",
"LOGO_FILEPATH_ATTRIBUTES",
"EMAIL_FROM",
"CREATED_ON",
"CREATED_BY",
"UPDATED_ON",
"UPDATED_BY") AS
  select
   w.short_name                workspace,
   a.id                        application_id,
   a.security_group_id         workspace_id,
   a.name                      application_name,
   a.OWNER,
   a.DESCRIPTION,
   a.STATUS,
   a.LOGIN_URL,
   a.LOGOUT_URL,
   a.HOME_PAGE_ID,
   a.page_style,
   a.custom_css,
   a.show_reset_passwd_yn,
   a.allow_sql_yn,
   a.allow_public_access_yn,
   a.login_page_message,
   a.AUTH_ID,
   a.ACL_TYPE,
   a.DATE_FORMAT,
   a.language,
   a.territory,
   a.LOGO_TYPE,
   a.LOGO_TEXT,
   a.LOGO_TEXT_ATTRIBUTES,
   sys.dbms_lob.getlength(a.LOGO_IMAGE) logo_image_size,
   a.LOGO_IMAGE_FILENAME,
   a.LOGO_IMAGE_MIMETYPE,
   a.LOGO_IMAGE_CHARSET,
   a.LOGO_IMAGE_LAST_UPDATE,
   a.LOGO_IMAGE_ATTRIBUTES,
   a.LOGO_FILEPATH,
   a.LOGO_FILEPATH_ATTRIBUTES,
   a.email_from,
   --
   a.created_on,
   a.created_by,
   a.updated_on,
   a.updated_by
from
     wwv_flow_ws_applications a,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.is_apex$_schema = 'Y' and
      a.security_group_id = w.PROVISIONING_COMPANY_ID and
      w.provisioning_company_id != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WS_APP_PAGES" ("WORKSPACE",
"APPLICATION_ID",
"PAGE_ID",
"WORKSPACE_ID",
"APPLICATION_NAME",
"PAGE_NAME",
"PAGE_OWNER",
"PAGE_STATUS",
"PAGE_DESCRIPTION",
"PAGE_PARENT_ID",
"PAGE_UPPER_NAME",
"PAGE_NUMBER",
"PAGE_ALIAS",
"CREATED_ON",
"CREATED_BY",
"UPDATED_ON",
"UPDATED_BY") AS
  select
   w.short_name                workspace,
   a.id                        application_id,
   p.id                        page_id,
   a.security_group_id         workspace_id,
   a.name                      application_name,
--
    p.NAME                      page_name,
    p.OWNER                     page_owner,
   p.STATUS                    page_status,
   p.DESCRIPTION               page_description,
   p.PARENT_PAGE_ID            page_parent_id,
   p.UPPER_NAME                page_upper_name,
   p.PAGE_NUMBER               page_number,
   p.PAGE_ALIAS                page_alias,
   --
   p.created_on,
   p.created_by,
   p.updated_on,
   p.updated_by
from
     wwv_flow_ws_applications a,
     WWV_FLOW_WS_WEBPAGES p,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.is_apex$_schema = 'Y' and
      a.id = p.ws_app_id and
      p.security_group_id = w.PROVISIONING_COMPANY_ID and
      a.security_group_id = w.PROVISIONING_COMPANY_ID and
      w.provisioning_company_id != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WS_DATA_GRID" ("WORKSPACE",
"APPLICATION_ID",
"APPLICATION_NAME",
"INTERACTIVE_REPORT_ID",
"DATA_GRID_ID",
"DATA_GRID_NAME",
"DATA_GRID_ALIAS",
"CREATED_ON",
"CREATED_BY",
"UPDATED_ON",
"UPDATED_BY") AS
  select
w.short_name                workspace,
a.id                        application_id,
a.name                      application_name,
dg.worksheet_id             interactive_report_id,
dg.id                       data_grid_id,
dg.websheet_name            data_grid_name,
dg.websheet_alias           data_grid_alias,
--
dg.created_on               ,
dg.created_by               ,
dg.updated_on               ,
dg.updated_by
from wwv_flow_ws_websheet_attr dg,
     wwv_flow_ws_applications a,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.is_apex$_schema = 'Y' and
      a.security_group_id = w.PROVISIONING_COMPANY_ID and
      a.security_group_id = dg.security_group_id and
      a.id = dg.ws_app_id and
      dg.websheet_type = 'DATA' and
      w.provisioning_company_id != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_WS_DATA_GRID_COL" ("WORKSPACE",
"APPLICATION_ID",
"APPLICATION_NAME",
"INTERACTIVE_REPORT_ID",
"DATA_GRID_ID",
"COLUMN_ID",
"COLUMN_ALIAS",
"DISPLAY_ORDER",
"COLUMN_GROUP",
"COLUMN_GROUP_ID",
"REPORT_LABEL",
"FORM_LABEL",
"COLUMN_LINK",
"COLUMN_LINKTEXT",
"COLUMN_LINK_ATTR",
"COLUMN_LINK_CHECKSUM_TYPE",
"ALLOW_SORTING",
"ALLOW_FILTERING",
"ALLOW_HIGHLIGHTING",
"ALLOW_CTRL_BREAKS",
"ALLOW_AGGREGATIONS",
"ALLOW_COMPUTATIONS",
"ALLOW_CHARTING",
"ALLOW_GROUP_BY",
"ALLOW_HIDE",
"COLUMN_TYPE",
"DISPLAY_TEXT_AS",
"HEADING_ALIGNMENT",
"COLUMN_ALIGNMENT",
"FORMAT_MASK",
"TZ_DEPENDENT",
"FILTER_LOV_SOURCE",
"FILTER_DATE_RANGES",
"HELP_TEXT",
"COLUMN_EXPR",
"COMPONENT_COMMENT",
"CREATED_ON",
"CREATED_BY",
"UPDATED_ON",
"UPDATED_BY") AS
  select
w.short_name                workspace,
a.id                        application_id,
a.name                      application_name,
ir.id                       interactive_report_id,
dg.id                       data_grid_id,
c.id                        column_id,
c.db_column_name            column_alias,
c.display_order             display_order,
(select name from wwv_flow_worksheet_col_groups where id = c.group_id) column_group,
c.group_id                  column_group_id,
c.report_label              report_label,
c.column_label              form_label,
c.column_link               ,
c.column_linktext           ,
c.column_link_attr          ,
c.column_link_checksum_type ,
--
decode(c.allow_sorting     ,'Y','Yes','N','No',c.allow_sorting     ) allow_sorting     ,
decode(c.allow_filtering   ,'Y','Yes','N','No',c.allow_filtering   ) allow_filtering   ,
decode(c.allow_highlighting   ,'Y','Yes','N','No',c.allow_highlighting) allow_highlighting,
decode(c.allow_ctrl_breaks ,'Y','Yes','N','No',c.allow_ctrl_breaks ) allow_ctrl_breaks ,
decode(c.allow_aggregations,'Y','Yes','N','No',c.allow_aggregations) allow_aggregations,
decode(c.allow_computations,'Y','Yes','N','No',c.allow_computations) allow_computations,
decode(c.allow_charting    ,'Y','Yes','N','No',c.allow_charting    ) allow_charting    ,
decode(c.allow_group_by    ,'Y','Yes','N','No',c.allow_group_by    ) allow_group_by    ,
decode(c.allow_hide        ,'Y','Yes','N','No',c.allow_hide        ) allow_hide        ,
--
c.column_type               ,
c.display_text_as           ,
c.heading_alignment         ,
c.column_alignment          ,
c.format_mask               ,
tz_dependent                ,
--
decode(c.rpt_show_filter_lov,
       'D','Default Based on Column Type',
       'S','Use Defined List of Values to Filter Exact Match',
       'C','Use Defined List of Values to Filter Word Contains',
       '1','Use Named List of Values to Filter Exact Match',
       '2','Use Named List of Values to Filter Word Contains',
       'N','None',
       c.rpt_show_filter_lov)
                            filter_lov_source,
c.rpt_filter_date_ranges    filter_date_ranges,
--
c.help_text                 ,
--
c.column_expr,
c.column_comment                component_comment,
--
c.created_on,
c.created_by,
c.updated_on,
c.updated_by
from wwv_flow_worksheet_columns c,
     wwv_flow_worksheets ir,
     wwv_flow_ws_websheet_attr dg,
     wwv_flow_ws_applications a,
     wwv_flow_companies w,
     wwv_flow_company_schemas s,
     (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
            (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
        from sys.dual) d
where (s.schema  = cu  or
      (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
      d.sgid              = w.PROVISIONING_COMPANY_ID) and
      s.security_group_id = w.PROVISIONING_COMPANY_ID and
      s.is_apex$_schema = 'Y' and
      a.security_group_id = w.provisioning_company_id and
      a.security_group_id = c.security_group_id and
      a.security_group_id = dg.security_group_id and
      a.id = dg.ws_app_id and
      ir.id = dg.worksheet_id and
      ir.id = c.worksheet_id and
      dg.websheet_type = 'DATA' and
      w.provisioning_company_id != 0;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_SYS_ALL_SYNONYMS" ("OWNER",
"SYNONYM_NAME",
"TABLE_OWNER",
"TABLE_NAME",
"DB_LINK") AS
  select owner,
       synonym_name,
       table_owner,
       table_name,
       db_link
  from sys.all_synonyms;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_SYS_ALL_OBJECTS" ("OWNER",
"OBJECT_NAME",
"SUBOBJECT_NAME",
"OBJECT_ID",
"DATA_OBJECT_ID",
"OBJECT_TYPE",
"CREATED",
"LAST_DDL_TIME",
"TIMESTAMP",
"STATUS",
"TEMPORARY",
"GENERATED",
"SECONDARY") AS
  select owner,
       object_name,
       subobject_name,
       object_id,
       data_object_id,
       object_type,
       created,
       last_ddl_time,
       timestamp,
       status,
       temporary,
       generated,
       secondary
  from sys.all_objects;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_SYS_ALL_CONSTRAINTS" ("OWNER",
"CONSTRAINT_NAME",
"CONSTRAINT_TYPE",
"TABLE_NAME",
"SEARCH_CONDITION",
"R_OWNER",
"R_CONSTRAINT_NAME",
"DELETE_RULE",
"STATUS",
"DEFERRABLE",
"DEFERRED",
"VALIDATED",
"GENERATED",
"BAD",
"RELY",
"LAST_CHANGE",
"INDEX_OWNER",
"INDEX_NAME",
"INVALID",
"VIEW_RELATED") AS
  select owner,
       constraint_name,
       constraint_type,
       table_name,
       search_condition,
       r_owner,
       r_constraint_name,
       delete_rule,
       status,
       deferrable,
       deferred,
       validated,
       generated,
       bad,
       rely,
       last_change,
       index_owner,
       index_name,
       invalid,
       view_related
  from sys.all_constraints;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_SYS_ALL_DEPENDENCIES" ("OWNER",
"NAME",
"TYPE",
"REFERENCED_OWNER",
"REFERENCED_NAME",
"REFERENCED_TYPE",
"REFERENCED_LINK_NAME",
"DEPENDENCY_TYPE") AS
  select owner,
       name,
       type,
       referenced_owner,
       referenced_name,
       referenced_type,
       referenced_link_name,
       dependency_type
  from sys.all_dependencies;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_BUG_STATUS_CODES" ("ID",
"THE_NAME") AS
  select 10 id, wwv_flow_lang.system_message('ENTERED') the_name from sys.dual union all
select 20 id, wwv_flow_lang.system_message('CONFIRMED') the_name from sys.dual union all
select 30 id, wwv_flow_lang.system_message('ASSIGNED') the_name from sys.dual union all
select 40 id, wwv_flow_lang.system_message('IN_PROGRESS') the_name from sys.dual union all
select 80 id, wwv_flow_lang.system_message('FIXED_IN_DEVELOPMENT') the_name from sys.dual union all
select 90 id, wwv_flow_lang.system_message('CONFIRMED_BY_QA') the_name from sys.dual union all
select 100 id, wwv_flow_lang.system_message('COMPLETE') the_name from sys.dual union all
select 200 id, wwv_flow_lang.system_message('DUPLICATE') the_name from sys.dual union all
select 300 id, wwv_flow_lang.system_message('NOT_FEASIBLE_TO_FIX') the_name from sys.dual union all
select 0 id, wwv_flow_lang.system_message('NOT_A_BUG') the_name from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_BUG_SEVERITY" ("ID",
"THE_NAME") AS
  select 1 id, wwv_flow_lang.system_message('PRODUCTION_DOWN') the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('NO_WORKAROUND_AVAILABLE') the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('SIGNIFICANT_IMPACT') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('MODERATE_IMPACT') the_name from sys.dual union all
select 5 id, wwv_flow_lang.system_message('MINIMAL_IMPACT') the_name from sys.dual union all
select 0 id, wwv_flow_lang.system_message('UNKNOWN') the_name from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_BUG_PRIORITY" ("ID",
"THE_NAME") AS
  select 1 id, wwv_flow_lang.system_message('ASAP') the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('BY_NEXT_PATCH') the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('BY_NEXT_RELEASE') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('NOT_PRORITIZED') the_name from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_FEATURE_DESIRABILITY" ("ID",
"THE_NAME") AS
  select 1 id, wwv_flow_lang.system_message('MARQUEE_FEATURE')      the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('HIGHLY_DESIRABLE')     the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('DESIRABLE')   the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('NOT_DESIRABLE')        the_name from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_FEATURE_PRIORITIES" ("ID",
"THE_NAME") AS
  select 1 id, wwv_flow_lang.system_message('ASAP') the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('PRIORITIZED') the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('NORMAL_PRIORITY') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('LOW_PRIORITY') the_name from sys.dual union all
select 5 id, wwv_flow_lang.system_message('NOT_PRIORITIZED') the_name from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_FEATURE_DOCSTATUS" ("ID",
"THE_NAME") AS
  select 0 id, wwv_flow_lang.system_message('NO_STATUS')        the_name from sys.dual union all
select 1 id, wwv_flow_lang.system_message('NOT_STARTED')      the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('RESEARCHING')      the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('NEED_INFORMATION') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('WRITING')          the_name from sys.dual union all
select 5 id, wwv_flow_lang.system_message('REVIEWING')        the_name from sys.dual union all
select 6 id, wwv_flow_lang.system_message('COMPLETED')        the_name from sys.dual union all
select 7 id, wwv_flow_lang.system_message('ARCHIVED')         the_name from sys.dual union all
select 10 id, wwv_flow_lang.system_message('NOT_REQUIRED')    the_name from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_FEATURE_TESTSTAT" ("ID",
"THE_NAME") AS
  select 0 id, wwv_flow_lang.system_message('NO_STATUS')        the_name from sys.dual union all
select 1 id, wwv_flow_lang.system_message('NOT_STARTED')      the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('RESEARCHING')      the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('WRITING')          the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('REVIEWING')        the_name from sys.dual union all
select 5 id, wwv_flow_lang.system_message('COMPLETED')        the_name from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_FEATURE_SECSTAT" ("ID",
"THE_NAME") AS
  select 0 id, wwv_flow_lang.system_message('NO_STATUS')           the_name from sys.dual union all
select 1 id, wwv_flow_lang.system_message('NEEDS_REVIEW')        the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('REVIEWING')           the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('PROBLEMS_IDENTIFIED') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('PROBLEMS_CORRECTED')  the_name from sys.dual union all
select 5 id, wwv_flow_lang.system_message('COMPLETE_NO_ISSUES') the_name from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_FEATURE_ACCSTAT" ("ID",
"THE_NAME") AS
  select 0 id, wwv_flow_lang.system_message('NO_STATUS')           the_name from sys.dual union all
select 1 id, wwv_flow_lang.system_message('NEEDS_REVIEW')        the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('REVIEWING')           the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('PROBLEMS_IDENTIFIED') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('PROBLEMS_CORRECTED')  the_name from sys.dual union all
select 5 id, wwv_flow_lang.system_message('COMPLETE_NO_ISSUES') the_name from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_FEATURE_GLOBSTAT" ("ID",
"THE_NAME") AS
  select 0 id, wwv_flow_lang.system_message('NO_STATUS')           the_name from sys.dual union all
select 1 id, wwv_flow_lang.system_message('NEEDS_REVIEW')        the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('REVIEWING')           the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('PROBLEMS_IDENTIFIED') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('PROBLEMS_CORRECTED')  the_name from sys.dual union all
select 5 id, wwv_flow_lang.system_message('COMPLETE_NO_ISSUES') the_name from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_FEATURE_UISTAT" ("ID",
"THE_NAME") AS
  select 0 id, wwv_flow_lang.system_message('NO_STATUS')           the_name from sys.dual union all
select 1 id, wwv_flow_lang.system_message('NEEDS_REVIEW')        the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('REVIEWING')           the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('PROBLEMS_IDENTIFIED') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('PROBLEMS_CORRECTED')  the_name from sys.dual union all
select 5 id, wwv_flow_lang.system_message('COMPLETE_NO_ISSUES') the_name from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_FEATURE_DEF_ST_CODES" ("PCT_COMPLETE",
"STATUS_NAME") AS
  select 0   pct_complete, wwv_flow_lang.system_message('NOT_STARTED')                  status_name from sys.dual union all
select 10  pct_complete, wwv_flow_lang.system_message('UNDER_CONSIDERATION')          status_name from sys.dual union all
select 20  pct_complete, wwv_flow_lang.system_message('APPROVED')                     status_name from sys.dual union all
select 30  pct_complete, wwv_flow_lang.system_message('ASSIGNED')                     status_name from sys.dual union all
select 40  pct_complete, wwv_flow_lang.system_message('WORK_INITIATED')               status_name from sys.dual union all
select 50  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 60  pct_complete, wwv_flow_lang.system_message('SIGNIFICANT_PROGRESS')         status_name from sys.dual union all
select 70  pct_complete, wwv_flow_lang.system_message('DEMONSTRABLE')                 status_name from sys.dual union all
select 80  pct_complete, wwv_flow_lang.system_message('FUNCTIONALLY_COMPLETE')        status_name from sys.dual union all
select 90  pct_complete, wwv_flow_lang.system_message('INTEGRATION_COMPLETE')         status_name from sys.dual union all
select 100 pct_complete, wwv_flow_lang.system_message('COMPLETE')                     status_name from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_TASK_DEF_STATUS_CODES" ("PCT_COMPLETE",
"STATUS_NAME") AS
  select 0   pct_complete, wwv_flow_lang.system_message('NOT_STARTED')                  status_name from sys.dual union all
select 10  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 20  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 30  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 40  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 50  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 60  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 70  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 80  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 90  pct_complete, wwv_flow_lang.system_message('WORK_PROGRESSING')             status_name from sys.dual union all
select 100 pct_complete, wwv_flow_lang.system_message('COMPLETE')                     status_name from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_FEATURE_COLS" ("CNAME",
"CMESSAGE") AS
  select 'FEATURE_NAME' cname, wwv_flow_lang.system_message('FEATURE_NAME') cmessage from sys.dual union all
select 'FEATURE_OWNER' cname, wwv_flow_lang.system_message('FEATURE_OWNER') cmessage from sys.dual union all
select 'FOCUS_AREA' cname, wwv_flow_lang.system_message('FOCUS_AREA') cmessage from sys.dual union all
select 'RELEASE ' cname, wwv_flow_lang.system_message('RELEASE ') cmessage from sys.dual union all
select 'FEATURE_DESC' cname, wwv_flow_lang.system_message('FEATURE_DESC') cmessage from sys.dual union all
select 'GLOBALIZATION_IMPACT' cname, wwv_flow_lang.system_message('GLOBALIZATION_IMPACT') cmessage from sys.dual union all
select 'DOC_IMPACT' cname, wwv_flow_lang.system_message('DOC_IMPACT') cmessage from sys.dual union all
select 'TESTING_IMPACT' cname, wwv_flow_lang.system_message('TESTING_IMPACT') cmessage from sys.dual union all
select 'SECURITY_IMPACT' cname, wwv_flow_lang.system_message('SECURITY_IMPACT') cmessage from sys.dual union all
select 'ACCESSIBILITY_IMPACT' cname, wwv_flow_lang.system_message('ACCESSIBILITY_IMPACT') cmessage from sys.dual union all
select 'FEATURE_TAGS' cname, wwv_flow_lang.system_message('FEATURE_TAGS') cmessage from sys.dual union all
select 'FEATURE_PRIORITY' cname, wwv_flow_lang.system_message('FEATURE_PRIORITY') cmessage from sys.dual union all
select 'FEATURE_STATUS' cname, wwv_flow_lang.system_message('FEATURE_STATUS') cmessage from sys.dual union all
select 'APPLICATION_ID' cname, wwv_flow_lang.system_message('APPLICATION_ID') cmessage from sys.dual union all
select 'FEATURE_DESIRABILITY' cname, wwv_flow_lang.system_message('FEATURE_DESIRABILITY') cmessage from sys.dual union all
select 'PARENT_FEATURE_ID' cname, wwv_flow_lang.system_message('PARENT_FEATURE_ID') cmessage from sys.dual union all
select 'DUE_DATE' cname, wwv_flow_lang.system_message('DUE_DATE') cmessage from sys.dual union all
select 'START_DATE' cname, wwv_flow_lang.system_message('START_DATE') cmessage from sys.dual union all
select 'EVENT_ID' cname, wwv_flow_lang.system_message('EVENT_ID') cmessage from sys.dual union all
select 'DOC_STATUS' cname, wwv_flow_lang.system_message('DOC_STATUS') cmessage from sys.dual union all
select 'USER_INTERFACE_IMPACT' cname, wwv_flow_lang.system_message('USER_INTERFACE_IMPACT') cmessage from sys.dual union all
select 'DOC_WRITER' cname, wwv_flow_lang.system_message('DOC_WRITER') cmessage from sys.dual union all
select 'FEATURE_CONTRIBUTOR' cname, wwv_flow_lang.system_message('FEATURE_CONTRIBUTOR') cmessage from sys.dual union all
select 'JUSTIFICATION' cname, wwv_flow_lang.system_message('JUSTIFICATION') cmessage from sys.dual union all
select 'GLOBALIZATION_ASSIGNEE' cname, wwv_flow_lang.system_message('GLOBALIZATION_ASSIGNEE') cmessage from sys.dual union all
select 'USER_INTERFACE_ASSIGNEE' cname, wwv_flow_lang.system_message('USER_INTERFACE_ASSIGNEE') cmessage from sys.dual union all
select 'TESTING_ASSIGNEE' cname, wwv_flow_lang.system_message('TESTING_ASSIGNEE') cmessage from sys.dual union all
select 'SECURITY_ASSIGNEE' cname, wwv_flow_lang.system_message('SECURITY_ASSIGNEE') cmessage from sys.dual union all
select 'ACCESSIBILITY_ASSIGNEE' cname, wwv_flow_lang.system_message('ACCESSIBILITY_ASSIGNEE') cmessage from sys.dual union all
select 'TESTING_STATUS' cname, wwv_flow_lang.system_message('TESTING_STATUS') cmessage from sys.dual union all
select 'MODULE' cname, wwv_flow_lang.system_message('MODULE  ') cmessage from sys.dual union all
select 'ESTIMATED_EFFORT_IN_HOURS' cname, wwv_flow_lang.system_message('ESTIMATED_EFFORT_IN_HOURS') cmessage from sys.dual union all
select 'SECURITY_STATUS' cname, wwv_flow_lang.system_message('SECURITY_STATUS') cmessage from sys.dual union all
select 'ACCESSIBILITY_STATUS' cname, wwv_flow_lang.system_message('ACCESSIBILITY_STATUS') cmessage from sys.dual union all
select 'GLOBALIZATION_STATUS' cname, wwv_flow_lang.system_message('GLOBALIZATION_STATUS') cmessage from sys.dual union all
select 'USER_INTERFACE_STATUS' cname, wwv_flow_lang.system_message('USER_INTERFACE_STATUS') cmessage from sys.dual;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_TEAM_BUGS" ("WORKSPACE_ID",
"WORKSPACE_NAME",
"BUG_ID",
"FRIENDLY_BUG_NUMBER",
"BUG_TITLE",
"ASSIGNED_TO",
"BUG_SEVERITY",
"BUG_STATUS",
"PRIORITY",
"FIX_BY_RELEASE",
"ESTIMATED_FIX_DATE",
"ACTUAL_FIX_DATE",
"BUG_DESCRIPTION",
"REPORTED_PLATFORM",
"REPORTED_BROWSER",
"REPORTED_OPERATING_SYSTEM",
"RELATED_FEATURE_ID",
"TARGET_MILESTONE_ID",
"RELATED_TODO_ID",
"DUPLICATE_OF_BUG",
"TAGS",
"CUSTOMER_NAME",
"CUSTOMER_ISSUE",
"PRODUCT_COMPONENT",
"PRODUCT_NAME",
"PRODUCT_VERSION",
"IMPACT_OF_FIX",
"APPLICATION_ID",
"PAGE_ID",
"CREATED_BY",
"CREATED_ON",
"UPDATED_BY",
"UPDATED_ON") AS
  select
    w.PROVISIONING_COMPANY_ID   workspace_id,
    w.short_name                workspace_name,
    --
    b.ID                          bug_id,
    b.BUG_ID                      friendly_bug_number,
    b.BUG_TITLE                   bug_title,
    b.ASSIGNED_TO                 assigned_to,
    b.BUG_SEVERITY                bug_severity,
    b.BUG_STATUS                  bug_status,
    b.PRIORITY                    priority,
    b.FIX_BY_RELEASE              fix_by_release,
    --
    b.ESTIMATED_FIX_DATE,
    b.ACTUAL_FIX_DATE,
    --
    b.BUG_DESCRIPTION,
    b.REPORTED_PLATFORM,
    b.REPORTED_BROWSER,
    b.REPORTED_OPERATING_SYSTEM,
    b.FEATURE_ID                  related_feature_id,
    b.TARGET_MILESTONE_ID         target_milestone_id,
    b.TASK_ID                     related_todo_id,
    b.DUPLICATE_OF_BUG,
    b.TAGS,
    --
    b.CUSTOMER_NAME               customer_name,
    b.CUSTOMER_ISSUE              customer_issue,
    --
    b.COMPONENT                   product_component,
    b.PRODUCT                     product_name,
    b.PRODUCT_VERSION             product_version,
    b.IMPACT                      impact_of_fix,
    b.APPLICATION_ID              application_id,
    b.PAGE_ID                     page_id,
    --
    b.CREATED_BY,
    b.CREATED_ON,
    b.UPDATED_BY,
    b.UPDATED_ON
from
    wwv_flow_bugs b,
    wwv_flow_companies w
where
    b.security_group_id = w.PROVISIONING_COMPANY_ID and
    w.PROVISIONING_COMPANY_ID in (
       select security_group_id
       from   wwv_flow_company_schemas s,
              (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                    (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
                 from sys.dual) d
      where (s.schema  = cu  or
            (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
             d.sgid = w.PROVISIONING_COMPANY_ID)) and
    (user in ('SYS', 'SYSTEM', 'APEX_040200') or w.PROVISIONING_COMPANY_ID != 10);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_TEAM_MILESTONES" ("WORKSPACE_ID",
"WORKSPACE_NAME",
"MILESTONE_ID",
"MILESTONE",
"MILESTONE_OWNER",
"MILESTONE_DATE",
"MILESTONE_TYPE",
"RELEASE",
"MILESTONE_DESCRIPTION",
"TAGS",
"CREATED_BY",
"CREATED_ON",
"UPDATED_BY",
"UPDATED_ON",
"FRIENDLY_MILESTONE_ID",
"SELECTABLE_FROM_FEATURES_YN") AS
  select
    w.PROVISIONING_COMPANY_ID   workspace_id,
    w.short_name                workspace_name,
    --
   m.ID                        milestone_id,
   m.EVENT_NAME                milestone,
   m.EVENT_OWNER               milestone_owner,
   m.EVENT_DATE                milestone_date,
   m.EVENT_TYPE                milestone_type,
   m.RELEASE                   release,
   m.EVENT_DESC                milestone_description,
   m.TAGS                      tags,
   --
   m.CREATED_BY,
   m.CREATED_ON,
   m.UPDATED_BY,
   m.UPDATED_ON,
   m.EVENT_ID                  friendly_milestone_id,
   m.SELECTABLE_FROM_FEATURES_YN
from
    WWV_FLOW_EVENTS m,
    wwv_flow_companies w
where
    m.security_group_id = w.PROVISIONING_COMPANY_ID and
    w.PROVISIONING_COMPANY_ID in (
       select security_group_id
       from   wwv_flow_company_schemas s,
              (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                     (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
                 from sys.dual) d
      where (s.schema  = cu  or
            (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
            d.sgid = w.PROVISIONING_COMPANY_ID)) and
            (user in ('SYS', 'SYSTEM', 'APEX_040200') or w.PROVISIONING_COMPANY_ID != 10);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_TEAM_TODOS" ("WORKSPACE_ID",
"WORKSPACE_NAME",
"TODO_ID",
"TODO_FRIENDLY_ID",
"ASSIGNED_TO",
"CONTRIBUTOR",
"TODO_NAME",
"TODO_DESCRIPTION",
"ESTIMATED_EFFORT_IN_HOURS",
"TODO_STATUS",
"TODO_CATEGORY",
"TAGS",
"START_DATE",
"DATE_COMPLETED",
"DUE_DATE",
"APEX_APPLICATION_ID",
"APEX_APPLICATION_PAGE_ID",
"REF_COMPONENT_TYPE",
"PARENT_TODO_ID",
"RELEASE",
"MILESTONE_ID",
"FEATURE_ID",
"PRODUCT_VERSION",
"CREATED_BY",
"CREATED_ON",
"UPDATED_BY",
"UPDATED_ON") AS
  select
    w.PROVISIONING_COMPANY_ID     workspace_id,
    w.short_name                  workspace_name,
    --
   t.ID                          todo_id,
   t.FRIENDLY_ID                 todo_friendly_id,
   t.ASSIGNED_TO                 assigned_to,
   t.CONTRIBUTOR                 contributor,
   t.TASK_NAME                   todo_name,
   t.DESCRIPTION                 todo_description,
   t.ESTIMATED_EFFORT_IN_HOURS   estimated_effort_in_hours,
   t.TASK_STATUS                 todo_status,
   t.TASK_CATEGORY               todo_category,
   t.TASK_TAGS                   tags,
   --
   t.START_DATE                  start_date,
   t.DATE_COMPLETED              date_completed,
   t.DUE_DATE                    due_date,
   --
   t.APPLICATION_ID              apex_application_id,
   t.PAGE_ID                     apex_application_page_id,
   --t.WEBSHEET_ID,
   t.REF_COMPONENT_TYPE,
   --t.CUSTOMER_DETAILS,
   t.PARENT_TASK_ID              parent_todo_id,
   --t.TASK_GROUP                todo_group,
    --
   t.RELEASE                     release,
   t.EVENT_ID                    milestone_id,
   t.FEATURE_ID                  feature_id,
   t.PRODUCT_VERSION             product_version,
   --
   t.CREATED_BY,
   t.CREATED_ON,
   t.UPDATED_BY,
   t.UPDATED_ON
from
    WWV_FLOW_tasks t,
    wwv_flow_companies w
where
    t.security_group_id = w.PROVISIONING_COMPANY_ID and
    w.PROVISIONING_COMPANY_ID in (
       select security_group_id
       from   wwv_flow_company_schemas s,
              (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                      (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
                 from sys.dual) d
      where (s.schema  = cu  or
            (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
            d.sgid = w.PROVISIONING_COMPANY_ID)) and
            (user in ('SYS', 'SYSTEM', 'APEX_040200') or w.PROVISIONING_COMPANY_ID != 10);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_TEAM_FEATURES" ("WORKSPACE_ID",
"WORKSPACE_NAME",
"FEATURE_ID",
"FEATURE_FRIENDLY_ID",
"FEATURE_NAME",
"FEATURE_OWNER",
"FEATURE_CONTRIBUTOR",
"FOCUS_AREA",
"RELEASE",
"FEATURE_DESCRIPTION",
"JUSTIFICATION",
"FEATURE_TAGS",
"FEATURE_PRIORITY",
"FEATURE_STATUS",
"FEATURE_DESIRABILITY",
"DUE_DATE",
"START_DATE",
"MODULE",
"ESTIMATED_EFFORT_IN_HOURS",
"PUBLISHABLE_YN",
"PUBLISHABLE_DESCRIPTION",
"GLOBALIZATION_IMPACT",
"GLOBALIZATION_ASSIGNEE",
"GLOBALIZATION_STATUS",
"USER_INTERFACE_IMPACT",
"USER_INTERFACE_ASSIGNEE",
"USER_INTERFACE_STATUS",
"DOC_IMPACT",
"DOC_STATUS",
"DOC_WRITER",
"TESTING_IMPACT",
"TESTING_ASSIGNEE",
"TESTING_STATUS",
"SECURITY_IMPACT",
"SECURITY_ASSIGNEE",
"SECURITY_STATUS",
"ACCESSIBILITY_IMPACT",
"ACCESSIBILITY_ASSIGNEE",
"ACCESSIBILITY_STATUS",
"APPLICATION_ID",
"PARENT_FEATURE_ID",
"MILESTONE_ID",
"CREATED_BY",
"CREATED_ON",
"UPDATED_BY",
"UPDATED_ON") AS
  select
    w.PROVISIONING_COMPANY_ID     workspace_id,
    w.short_name                  workspace_name,
    --
    f.id                          feature_id,
    f.feature_id                  feature_friendly_id,
    f.feature_name,
    f.feature_owner,
    f.feature_contributor,
    f.focus_area,
    f.release,
    f.feature_desc                feature_description,
    f.justification,
    f.feature_tags,
    f.feature_priority,
    f.feature_status,
    f.feature_desirability,
    f.due_date,
    f.start_date,
    f.module,
    f.estimated_effort_in_hours,
    --
    f.publishable_yn,
    f.publishable_description,
    --
    f.globalization_impact,
    f.globalization_assignee,
    f.globalization_status,
    --
    f.user_interface_impact,
    f.user_interface_assignee,
    f.user_interface_status,
    --
    f.doc_impact,
    f.doc_status,
    f.doc_writer,
    --
    f.testing_impact,
    f.testing_assignee,
    f.testing_status,
    --
    f.security_impact,
    f.security_assignee,
    f.security_status,
    --
    f.accessibility_impact,
    f.accessibility_assignee,
    f.accessibility_status,
    --
    f.application_id,
    f.parent_feature_id,
    f.event_id                    milestone_id,
    --
    f.created_by,
    f.created_on,
    f.updated_by,
    f.updated_on
from
    wwv_flow_features f,
    wwv_flow_companies w
where
    f.security_group_id = w.PROVISIONING_COMPANY_ID and
    w.PROVISIONING_COMPANY_ID in (
       select security_group_id
       from   wwv_flow_company_schemas s,
              (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                      (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
                 from sys.dual) d
      where (s.schema  = cu  or
             (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y' or
             d.sgid              = w.PROVISIONING_COMPANY_ID)) and
            (user in ('SYS', 'SYSTEM', 'APEX_040200') or w.PROVISIONING_COMPANY_ID != 10);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_MIGRATION_PROJECTS" ("PROJECT_ID",
"PROJECT_NAME",
"DESCRIPTION",
"ACCDB_PATHNAME",
"JETVERSION",
"MIGRATION_TYPE",
"ACCESSVERSION",
"PROJECT_OWNER",
"SCHEMA",
"WORKSPACE",
"WORKSPACE_ID",
"LAST_MODIFIED_ON",
"LAST_MODIFIED_BY") AS
  select
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
   d.description                                   description,
     --
        a.dbpathname                                    accdb_pathname,
     --
        a.jetversion                                    jetversion,
     --
        d.migration_type                                migration_type,
     --
        a.accessversion                                 accessversion,
     --
        d.created_by                                    project_owner,
     --
        s.schema                                        schema,
     --
        w.short_name                                    workspace,
     --
        w.provisioning_company_id                       workspace_id,
     --
        d.last_updated_on                               last_modified_on,
     --
        d.last_updated_by                               last_modified_by
     --
from
        wwv_mig_access a,
     --
        wwv_flow_company_schemas s,
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where
        (s.schema  = cu
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
 or     g.sgid = w.PROVISIONING_COMPANY_ID)
and     w.PROVISIONING_COMPANY_ID != 0
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.PROVISIONING_COMPANY_ID, a.project_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_MIGRATION_ACC_PROJECTS" ("PROJECT_ID",
"PROJECT_NAME",
"DESCRIPTION",
"MIGRATION_TYPE",
"PROJECT_OWNER",
"ACCDB_PATHNAME",
"TABLES",
"QUERIES",
"FORMS",
"REPORTS",
"PAGES",
"MODULES",
"RELATIONS",
"JETVERSION",
"ACCESSVERSION",
"DBNAME",
"DBID",
"DBSIZE",
"ISAPPDB",
"ISATTACHEDDB",
"STARTUPFORM",
"LINKDBID",
"CREATED_BY",
"LAST_MODIFIED_ON",
"LAST_MODIFIED_BY",
"SCHEMA",
"WORKSPACE",
"WORKSPACE_ID") AS
  select
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.description                                   description,
     --
        d.migration_type                                migration_type,
     --
        d.created_by                                    project_owner,
     --
        a.dbpathname                                    accdb_pathname,
     --
       (select count(*) from wwv_mig_acc_tables
        where project_id = a.project_id
        and security_group_id = a.security_group_id
        and dbid = a.dbid)                              tables,
     --
       (select count(*) from wwv_mig_acc_queries
        where project_id = a.project_id
        and security_group_id = a.security_group_id
        and dbid = a.dbid)                              queries,
     --
       (select count(*) from wwv_mig_acc_forms
        where project_id = a.project_id
        and security_group_id = a.security_group_id
        and dbid = a.dbid)                              forms,
     --
       (select count(*) from wwv_mig_acc_reports
        where project_id = a.project_id
        and security_group_id = a.security_group_id
        and dbid = a.dbid)                              reports,
     --
       (select count(*) from wwv_mig_acc_pages
        where project_id = a.project_id
        and security_group_id = a.security_group_id
        and dbid = a.dbid)                              pages,
     --
       (select count(*) from wwv_mig_acc_modules
        where project_id = a.project_id
        and security_group_id = a.security_group_id
        and dbid = a.dbid)                              modules,
     --
       (select count(*) from wwv_mig_acc_relations
        where project_id = a.project_id
        and security_group_id = a.security_group_id
        and dbid = a.dbid)                              relations,
     --
        a.jetversion                                    jetversion,
     --
        a.accessversion                                 accessversion,
     --
        a.dbname                                        dbname,
     --
        a.dbid                                          dbid,
     --
        a.dbsize                                        dbsize,
     --
        a.isappdb                                       isappdb,
     --
        a.isattacheddb                                  isattacheddb,
     --
        a.startupform                                   startupform,
     --
        a.linkdbid                                      linkdbid,
     --
        a.created_by                                    created_by,
     --
        d.last_updated_on                               last_modified_on,
     --
        d.last_updated_by                               last_modified_by,
     --
        s.schema                                        schema,
     --
        w.short_name                                    workspace,
     --
        w.provisioning_company_id                       workspace_id
from
        wwv_mig_access a,
     --
        wwv_flow_company_schemas s,
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
where
       (s.schema  = cu
 or    (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
 or     g.sgid = w.PROVISIONING_COMPANY_ID)
and     w.PROVISIONING_COMPANY_ID != 0
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.PROVISIONING_COMPANY_ID, a.project_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_MIGRATION_ACC_TABLES" ("PROJECT_ID",
"PROJECT_NAME",
"MIGRATION_TYPE",
"DBID",
"TABLE_ID",
"TABLE_NAME",
"VALIDATION_TEXT",
"VALIDATION_RULE",
"NUMBER_OFROWS",
"DESCRIPTION",
"SOURCE_TABLENAME",
"CREATED_ON",
"CREATED_BY",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY",
"SCHEMA",
"WORKSPACE",
"WORKSPACE_ID") AS
  select
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.migration_type                                migration_type,
     --
        a.dbid                                          dbid,
     --
        f.tblid                                         table_id,
     --
        f.tblname                                       table_name,
     --
        f.validationtext                                validation_text,
     --
        f.validationrule                                validation_rule,
     --
        f.numberofrows                                  number_ofrows,
     --
        f.description                                   description,
     --
        f.sourcetablename                               source_tablename,
     --
        f.created_on                                    created_on,
     --
        f.created_by                                    created_by,
     --
        a.last_updated_on                               last_updated_on,
     --
        a.last_updated_by                               last_updated_by,
     --
   s.schema                                        schema,
     --
   w.short_name                                    workspace,
     --
   w.provisioning_company_id                       workspace_id
     --
from
        wwv_mig_access a,
     --
        wwv_mig_acc_tables f,
     --
        wwv_flow_company_schemas s,
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where
        (s.schema  = cu
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
 or     g.sgid = w.PROVISIONING_COMPANY_ID)
and     w.PROVISIONING_COMPANY_ID != 0
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     f.security_group_id = a.security_group_id
and     f.project_id = a.project_id
and     f.dbid = a.dbid
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.provisioning_company_id, f.project_id, f.tblid, f.dbid;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_MIGRATION_ACC_FORMS" ("PROJECT_ID",
"PROJECT_NAME",
"MIGRATION_TYPE",
"DBID",
"FORM_ID",
"FORM_NAME",
"FORM_CAPTION",
"GRIDX",
"GRIDY",
"HAS_MODULE",
"INSIDE_HEIGHT",
"INSIDE_WIDTH",
"LOGICAL_PAGEWIDTH",
"MODAL",
"POPUP",
"RECORDSOURCE",
"TAG",
"VISIBLE",
"WIDTH",
"CREATED_ON",
"CREATED_BY",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY",
"STARTUPFORM",
"SCHEMA",
"WORKSPACE",
"WORKSPACE_ID") AS
  select
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.migration_type                                migration_type,
     --
        a.dbid                                          dbid,
     --
        f.formid                                       form_id,
     --
        f.formname                                     form_name,
     --
        f.formcaption                                  form_caption,
     --
        f.gridx                                        gridx,
     --
        f.gridy                                        gridy,
     --
        f.hasmodule                                    has_module,
     --
        f.insideheight                                 inside_height,
     --
        f.insidewidth                                  inside_width,
     --
        f.logicalpagewidth                             logical_pagewidth,
     --
        f.modal                                        modal,
     --
        f.popup                                        popup,
     --
        f.recordsource                                 recordsource,
     --
        f.tag                                          tag,
     --
        f.visible                                      visible,
     --
        f.width                                        width,
     --
        f.created_on                                   created_on,
     --
        f.created_by                                   created_by,
     --
        a.last_updated_on                              last_updated_on,
     --
        a.last_updated_by                              last_updated_by,
     --
        decode(a.startupform, f.formname, a.startupform, null) startupform,
     --
   s.schema                                        schema,
     --
   w.short_name                                    workspace,
     --
   w.provisioning_company_id                       workspace_id
     --
from
        wwv_mig_access a,
     --
        wwv_mig_acc_forms f,
     --
        wwv_flow_company_schemas s,
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where
        (s.schema  = cu
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
 or     g.sgid = w.PROVISIONING_COMPANY_ID)
and     w.PROVISIONING_COMPANY_ID != 0
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     f.security_group_id = a.security_group_id
and     f.project_id = a.project_id
and     f.dbid = a.dbid
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.provisioning_company_id, f.project_id, f.formid, f.dbid;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_MIGRATION_ACC_RPTS" ("PROJECT_ID",
"PROJECT_NAME",
"MIGRATION_TYPE",
"DBID",
"REPORT_ID",
"REPORT_NAME",
"REPORT_CAPTION",
"GRIDX",
"GRIDY",
"HAS_MODULE",
"PAGE_FOOTER",
"PAGE_HEADER",
"RECORDSOURCE",
"TAG",
"VISIBLE",
"WIDTH",
"CREATED_ON",
"CREATED_BY",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY",
"SCHEMA",
"WORKSPACE",
"WORKSPACE_ID") AS
  select
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.migration_type                                migration_type,
     --
        a.dbid                                          dbid,
     --
        r.reportid                                      report_id,
     --
        r.repname                                       report_name,
     --
        r.repcaption                                    report_caption,
     --
        r.gridx                                         gridx,
     --
        r.gridy                                         gridy,
     --
        r.hasmodule                                     has_module,
     --
        r.pagefooter                                    page_footer,
     --
        r.pageheader                                    page_header,
     --
        r.recordsource                                  recordsource,
     --
        r.tag                                           tag,
     --
        r.visible                                       visible,
     --
        r.width                                         width,
     --
        r.created_on                                    created_on,
     --
        r.created_by                                    created_by,
     --
        a.last_updated_on                              last_updated_on,
     --
        a.last_updated_by                              last_updated_by,
     --
        s.schema                                        schema,
     --
        w.short_name                                    workspace,
     --
        w.provisioning_company_id                       workspace_id
     --
from
        wwv_mig_access a,
     --
        wwv_mig_acc_reports r,
     --
        wwv_flow_company_schemas s,
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where
        (s.schema  = cu
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
 or     g.sgid = w.PROVISIONING_COMPANY_ID)
and     w.PROVISIONING_COMPANY_ID != 0
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     r.security_group_id = a.security_group_id
and     r.project_id = a.project_id
and     r.dbid = a.dbid
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.provisioning_company_id, r.project_id, r.reportid, r.dbid;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_MIGRATION_ACC_QUERIES" ("PROJECT_ID",
"PROJECT_NAME",
"MIGRATION_TYPE",
"DBID",
"QUERY_ID",
"QUERY_TYPE",
"QUERY_NAME",
"QUERY_SQL",
"CREATED_ON",
"CREATED_BY",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY",
"SCHEMA",
"WORKSPACE",
"WORKSPACE_ID") AS
  select
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.migration_type                                migration_type,
     --
        a.dbid                                          dbid,
     --
        f.qryid                                         query_id,
     --
        f.qrytype                                       query_type,
     --
        f.qryname                                       query_name,
     --
        f.qrysql                                        query_sql,
     --
        f.created_on                                    created_on,
     --
        f.created_by                                    created_by,
     --
        a.last_updated_on                               last_updated_on,
     --
        a.last_updated_by                               last_updated_by,
     --
   s.schema                                        schema,
     --
   w.short_name                                    workspace,
     --
   w.provisioning_company_id                       workspace_id
     --
from
        wwv_mig_access a,
     --
        wwv_mig_acc_queries f,
     --
        wwv_flow_company_schemas s,
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where
        (s.schema  = cu
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
 or     g.sgid  = w.PROVISIONING_COMPANY_ID)
and     w.PROVISIONING_COMPANY_ID != 0
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     f.security_group_id = a.security_group_id
and     f.project_id = a.project_id
and     f.dbid = a.dbid
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.provisioning_company_id, f.project_id, f.qryid, f.dbid;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_MIGRATION_REV_FORMS" ("PROJECT_ID",
"PROJECT_NAME",
"MIGRATION_TYPE",
"DBID",
"FORM_ID",
"PARENT_FORMID",
"FORM_NAME",
"SOURCE_NAME",
"SOURCE_TYPE",
"SOURCE_SYNTAX",
"SOURCE_STATUS",
"OWNER",
"STATUS",
"MIG_TYPE",
"CREATED_ON",
"CREATED_BY",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY",
"SCHEMA",
"WORKSPACE",
"WORKSPACE_ID") AS
  select
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.migration_type                                migration_type,
     --
        a.dbid                                          dbid,
     --
        f.formid                                        form_id,
     --
        f.parent_formid                                 parent_formid,
     --
        f.form_name                                     form_name,
     --
        f.source_name                                   source_name,
     --
        f.source_type                                   source_type,
     --
        f.source_syntax                                 source_syntax,
     --
        f.source_status                                 source_status,
     --
        f.owner                                         owner,
     --
        f.status                                        status,
     --
        f.mig_type                                      mig_type,
     --
        f.created_on                                    created_on,
     --
        f.created_by                                    created_by,
     --
        a.last_updated_on                               last_updated_on,
     --
        a.last_updated_by                               last_updated_by,
     --
   s.schema                                        schema,
     --
   w.short_name                                    workspace,
     --
   w.provisioning_company_id                       workspace_id
     --
from
        wwv_mig_access a,
     --
        wwv_mig_rev_forms f,
     --
        wwv_flow_company_schemas s,
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where
        (s.schema  = cu
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
 or     g.sgid  = w.PROVISIONING_COMPANY_ID)
and     w.PROVISIONING_COMPANY_ID != 0
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     f.security_group_id = a.security_group_id
and     f.project_id = a.project_id
and     f.dbid = a.dbid
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.provisioning_company_id, f.project_id, f.formid, f.dbid;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_MIGRATION_REV_RPTS" ("PROJECT_ID",
"PROJECT_NAME",
"MIGRATION_TYPE",
"DBID",
"REPORT_ID",
"REPORT_NAME",
"SOURCE_NAME",
"SOURCE_TYPE",
"SOURCE_SYNTAX",
"SOURCE_STATUS",
"OWNER",
"STATUS",
"CREATED_ON",
"CREATED_BY",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY",
"SCHEMA",
"WORKSPACE",
"WORKSPACE_ID") AS
  select
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.migration_type                                migration_type,
     --
        a.dbid                                          dbid,
     --
        r.reportid                                      report_id,
     --
        r.report_name                                   report_name,
     --
        r.source_name                                   source_name,
     --
        r.source_type                                   source_type,
     --
        r.source_syntax                                 source_syntax,
     --
        r.source_status                                 source_status,
     --
        r.owner                                         owner,
     --
        r.status                                        status,
     --
        r.created_on                                    created_on,
     --
        r.created_by                                    created_by,
     --
        a.last_updated_on                               last_updated_on,
     --
        a.last_updated_by                               last_updated_by,
     --
        s.schema                                        schema,
     --
        w.short_name                                    workspace,
     --
        w.provisioning_company_id                       workspace_id
     --
from
        wwv_mig_access a,
     --
        wwv_mig_rev_reports r,
     --
        wwv_flow_company_schemas s,
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where
        (s.schema  = cu
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
 or     g.sgid  = w.PROVISIONING_COMPANY_ID)
and     w.PROVISIONING_COMPANY_ID != 0
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     r.security_group_id = a.security_group_id
and     r.project_id = a.project_id
and     r.dbid = a.dbid
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.provisioning_company_id, r.project_id, r.reportid, r.dbid;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_MIGRATION_REV_QUERIES" ("PROJECT_ID",
"PROJECT_NAME",
"MIGRATION_TYPE",
"DBID",
"QUERY_ID",
"ORIG_QRY_NAME",
"MIG_VIEW_NAME",
"ORIG_SQL",
"MIG_SQL",
"OWNER",
"STATUS",
"CREATED_ON",
"CREATED_BY",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY",
"SCHEMA",
"WORKSPACE",
"WORKSPACE_ID") AS
  select
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.migration_type                                migration_type,
     --
        a.dbid                                          dbid,
     --
        f.qryid                                         query_id,
     --
        f.orig_qry_name                                 orig_qry_name,
     --
        f.mig_view_name                                 mig_view_name,
     --
        f.orig_sql                                      orig_sql,
     --
        f.mig_sql                                       mig_sql,
     --
        f.owner                                         owner,
     --
        f.status                                        status,
     --
        f.created_on                                    created_on,
     --
        f.created_by                                    created_by,
     --
        a.last_updated_on                               last_updated_on,
     --
        a.last_updated_by                               last_updated_by,
     --
   s.schema                                        schema,
     --
   w.short_name                                    workspace,
     --
   w.provisioning_company_id                       workspace_id
     --
from
        wwv_mig_access a,
     --
        wwv_mig_rev_queries f,
     --
        wwv_flow_company_schemas s,
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where
        (s.schema  = cu
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
 or     g.sgid  = w.PROVISIONING_COMPANY_ID)
and     w.PROVISIONING_COMPANY_ID != 0
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     f.security_group_id = a.security_group_id
and     f.project_id = a.project_id
and     f.dbid = a.dbid
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.provisioning_company_id, f.project_id, f.qryid, f.dbid;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."APEX_MIGRATION_REV_TABLES" ("PROJECT_ID",
"PROJECT_NAME",
"MIGRATION_TYPE",
"DBID",
"TABLE_ID",
"ORIG_TABLE_NAME",
"MIG_TABLE_NAME",
"OWNER",
"STATUS",
"PRIMARYKEY_NAME",
"CREATED_ON",
"CREATED_BY",
"LAST_UPDATED_ON",
"LAST_UPDATED_BY",
"SCHEMA",
"WORKSPACE",
"WORKSPACE_ID") AS
  select
        a.project_id                                    project_id,
     --
        d.migration_name                                project_name,
     --
        d.migration_type                                migration_type,
     --
        a.dbid                                          dbid,
     --
        f.tblid                                         table_id,
     --
        f.orig_table_name                               orig_table_name,
     --
        f.mig_table_name                                mig_table_name,
     --
        f.owner                                         owner,
     --
        f.status                                        status,
     --
        f.primarykey_name                               primarykey_name,
     --
        f.created_on                                    created_on,
     --
        f.created_by                                    created_by,
     --
        a.last_updated_on                               last_updated_on,
     --
        a.last_updated_by                               last_updated_by,
     --
   s.schema                                        schema,
     --
   w.short_name                                    workspace,
     --
   w.provisioning_company_id                       workspace_id
     --
from
        wwv_mig_access a,
     --
        wwv_mig_rev_tables f,
     --
        wwv_flow_company_schemas s,
     --
        wwv_mig_projects d,
     --
        wwv_flow_companies w,
     --
        (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid,
                (select sys_context('USERENV','CURRENT_USER') from sys.dual) cu
           from sys.dual) g
     --
where
        (s.schema  = cu
 or     (select wwv_flow_security.has_apex_administrator_role_yn(cu) from sys.dual)='Y'
 or     g.sgid  = w.PROVISIONING_COMPANY_ID)
and     w.PROVISIONING_COMPANY_ID != 0
and     a.database_schema = s.schema
and     a.project_id = d.id
and     a.security_group_id = d.security_group_id
and     f.security_group_id = a.security_group_id
and     f.project_id = a.project_id
and     f.dbid = a.dbid
and     w.provisioning_company_id = a.security_group_id
and     w.provisioning_company_id = s.security_group_id
order by w.provisioning_company_id, f.project_id, f.tblid, f.dbid;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_UI_TYPES_DEV" ("ID",
"NAME",
"DISPLAY_NAME",
"BASED_ON_UI_TYPE_ID",
"AUTODETECT_JS_FILE_URLS",
"AUTODETECT_JS_FUNCTION_BODY",
"AUTODETECT_PLSQL_FUNCTION_BODY",
"SECURITY_GROUP_ID",
"CREATED_BY",
"CREATED_ON",
"LAST_UPDATED_BY",
"LAST_UPDATED_ON") AS
  select id,
       name,
       case
         when security_group_id is null then wwv_flow_lang.system_message('UI_TYPE.' || name)
         else name
       end as display_name,
       based_on_ui_type_id,
       autodetect_js_file_urls,
       autodetect_js_function_body,
       autodetect_plsql_function_body,
       security_group_id,
       created_by,
       created_on,
       last_updated_by,
       last_updated_on
  from wwv_flow_ui_types
 where (  security_group_id is null
       or security_group_id = ( select v('WORKSPACE_ID') from sys.dual )
       );

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_SEARCH_RESULT_DEV" ("FLOW_ID",
"PATH",
"ORDER_VALUE",
"ATTRIBUTE_NAME",
"ATTRIBUTE_VALUE",
"LINK_URL") AS
  select n001    as flow_id,
       c001    as path,
       c002    as order_value,
       c003    as attribute_name,
       clob001 as attribute_value,
       c004    as link_url
  from wwv_flow_collections
 where collection_name = 'FLOW_SEARCH_RESULT'
;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "APEX_040200"."WWV_FLOW_ADVISOR_RESULT_DEV" ("FLOW_ID",
"PATH",
"ORDER_VALUE",
"ATTRIBUTE_NAME",
"ATTRIBUTE_VALUE",
"LINK_URL",
"CHECK_DESCRIPTION",
"CATEGORY_DESCRIPTION",
"MESSAGE_TEXT",
"HELP_TEXT",
"CATEGORY_ID",
"CHECK_ID") AS
  select n001    as flow_id,
       c001    as path,
       c002    as order_value,
       c003    as attribute_name,
       clob001 as attribute_value,
       c004    as link_url,
       c005    as check_description,
       c006    as category_description,
       c007    as message_text,
       c008    as help_text,
       n002    as category_id,
       n003    as check_id
  from wwv_flow_collections
 where collection_name = 'FLOW_ADVISOR_RESULT'
;

