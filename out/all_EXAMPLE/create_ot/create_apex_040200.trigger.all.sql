CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_CG_CT_TXTSGMNT"
    before insert or update on wwv_mig_olb_cg_ct_textsegment
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_COMPANIES_T1"
    before insert or update on wwv_flow_companies
    for each row
declare
  l_found  boolean;
  l_prefix varchar2(255);
begin
    if :new.provisioning_company_id = 20 and :new.short_name not in ('ORACLE','COM.ORACLE.APEX.APPLICATIONS') then
        raise_application_error(-20001,wwv_flow_lang.system_message('TRIGGER.SGID_RESERVED'));
    end if;
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.allow_to_be_purged_yn is null then
        :new.allow_to_be_purged_yn := 'Y';
    end if;
    :new.short_name := trim(upper(:new.short_name));
    if :new.display_name is null then
        :new.display_name := :new.short_name;
    end if;
    if inserting then
        :new.created_on := sysdate;
        if :new.account_status is null then
            :new.account_status := 'AVAILABLE';
        elsif :new.account_status = 'ASSIGNED' then
            :new.assigned_on := sysdate;
        end if;
    elsif updating then
        if :new.account_status = 'ASSIGNED' and nvl(:old.account_status,'AVAILABLE') = 'AVAILABLE' then
            :new.assigned_on := sysdate;
        end if;
    end if;
    :new.cloud_group_name   := upper(:new.cloud_group_name);
    :new.cloud_service_name := upper(:new.cloud_service_name);
    :new.host_prefix        := upper(:new.host_prefix);
    if inserting and :new.path_prefix is null then
        l_prefix := regexp_replace(upper(:new.short_name),'[^' || 'A-Z0-9_-]','_');
        l_found  := false;
        for c1 in ( select null
                      from wwv_flow_companies
                     where path_prefix = l_prefix
                       and provisioning_company_id <> :new.provisioning_company_id)
        loop
            l_found := true;
            exit;
        end loop;
        -- path prefix already in use, get a unique value for the path prefix
        if l_found then
            :new.path_prefix := to_char(wwv_flow_id.next_val);
        else
            :new.path_prefix := l_prefix;
        end if;
    elsif updating then
        :new.path_prefix := trim(upper(:new.path_prefix));
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_COMPANIES_T2"
    before delete on wwv_flow_companies
    for each row
begin
    wwv_flow.g_workspace_delete_in_progress := true;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_COMPANIES_T3"
    after delete on wwv_flow_companies
    for each row
begin
    wwv_flow.g_workspace_delete_in_progress := false;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_COMPANY_SCHEMAS_T1"
    before insert or update on wwv_flow_company_schemas
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    :new.schema := upper(:new.schema);
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PLATFORM_PREFS_T1"
    before insert or update on wwv_flow_platform_prefs
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    :new.security_group_id := 10;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_UI_TYPES_T1"
    before insert or update on wwv_flow_ui_types
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    -- created / last updated
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_UI_TYPE_AUDIT"
    before insert or update or delete on wwv_flow_ui_types
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_UI_TYPES',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name, :old.name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_UI_TYPE_FEATURES_T1"
    before insert or update on wwv_flow_ui_type_features
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    -- created / last updated
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOWS_T1"
    before insert or update on wwv_flows
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    :new.webdb_logging := case nvl(wwv_flow_platform.get_preference('APPLICATION_ACTIVITY_LOGGING'), 'U') /* U=Use Application Settings */
                            when 'A' /* Always */ then 'YES'
                            when 'N' /* Never  */ then 'NO'
                            else                       nvl(:new.webdb_logging, 'YES')
                          end;

    if nvl(wwv_flow_platform.get_preference('APPLICATION_ACTIVITY_LOGGING'), 'U') = 'O' /* O=Off for New and Packaged Applications */
       and wwv_flow_security.g_security_group_id = 11 and (:new.id between 7000 and 8000 or :new.id = 8950) then
        --
        :new.webdb_logging := 'NO';
    end if;

    -- Cleanup the application image prefix if it's equal to the instance image prefix or the /i/ default
    -- This will allow easier migration of applications between APEX instances which have different image prefixes (bug #15969515)
    if :new.flow_image_prefix in ( '/i/', wwv_flow.g_image_prefix ) then
        :new.flow_image_prefix := null;
    end if;

    -- default debugging to no
    if inserting and :new.application_tab_set is null then
        :new.application_tab_set := 0; -- sets debugging off
    end if;
    :new.flow_language          := lower(:new.flow_language);
    :new.substitution_string_01 := upper(:new.substitution_string_01);
    :new.substitution_string_02 := upper(:new.substitution_string_02);
    :new.substitution_string_03 := upper(:new.substitution_string_03);
    :new.substitution_string_04 := upper(:new.substitution_string_04);
    :new.substitution_string_05 := upper(:new.substitution_string_05);
    :new.substitution_string_06 := upper(:new.substitution_string_06);
    :new.substitution_string_07 := upper(:new.substitution_string_07);
    :new.substitution_string_08 := upper(:new.substitution_string_08);
    if :new.build_status is null then
       :new.build_status := 'RUN_AND_BUILD';
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- owner
    --
    :new.owner := upper(:new.owner);
    if inserting or :new.owner <> nvl(:old.owner, :new.owner) then
        for i in ( select min(case when schema = :new.owner then schema end) over () found_schema,
                          schema first_schema
                     from wwv_flow_company_schemas
                    where security_group_id = :new.security_group_id )
        loop
            if i.found_schema is null then
                wwv_flow_debug.trace (
                    'owner "%s" not found, reverting to "%s"',
                    :new.owner,
                    i.first_schema );
                :new.owner := i.first_schema;
            else
                wwv_flow_debug.trace (
                    'accepting owner change to "%s"',
                    i.found_schema );
            end if;
            exit;
        end loop;
    end if;
    --
    if inserting and :new.global_id is null then
        :new.global_id := wwv_flow_id.next_val;
    end if;
    --
    -- trim white space
    --
    for i in 1..10 loop
        :new.CUSTOM_AUTHENTICATION_PROCESS  := rtrim(:new.CUSTOM_AUTHENTICATION_PROCESS );
        :new.CUSTOM_AUTHENTICATION_PROCESS  := rtrim(:new.CUSTOM_AUTHENTICATION_PROCESS ,chr(10));
        :new.CUSTOM_AUTHENTICATION_PROCESS  := rtrim(:new.CUSTOM_AUTHENTICATION_PROCESS ,chr(13));
    end loop;

    :new.alias := upper(:new.alias);

    if :new.alias is null then
       :new.alias := 'F_'||:new.id;
    end if;

    if updating and :old.checksum_salt is null or :new.checksum_salt <> :old.checksum_salt then
        :new.checksum_salt_last_reset := sysdate;
    end if;
    --
    -- last updated
    --
    if user <> 'SYS' then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
        if inserting then
           :new.created_on := sysdate;
           :new.created_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOWS_AUDIT"
    before insert or update or delete on wwv_flows
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then
       l_action := 'I';
    elsif updating then
       -- skip audit procedure call if update is just updating the audit column
       if :new.last_updated_on <> :old.last_updated_on then
           return;
       end if;
       l_action := 'U';
    else
       l_action := 'D';
    end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOWS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_APP_GROUPS_T1"
    before insert or update on wwv_flow_application_groups
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_APP_COMMENTS_T1"
    before insert or update on wwv_flow_app_comments
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- clean up whitespace in pages
    --
    for i in 1..10 loop
    	  :new.pages := replace(:new.pages,'  ',' ');
    end loop;
    :new.pages := trim(:new.pages);
    :new.pages := replace(:new.pages,':',',');
    :new.pages := replace(:new.pages,' ',',');
    :new.pages := replace(:new.pages,',,',', ');
    :new.pages := rtrim(:new.pages,',');
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        :new.updated_by := wwv_flow.g_user;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := wwv_flow.g_user;
    end if;
    update wwv_flows
    set last_updated_on = sysdate,
        last_updated_by = wwv_flow.g_user
    where id = :new.flow_id and
        security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_USER_INTERFACE_T1"
    before insert or update on wwv_flow_user_interfaces
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    -- The FK to wwv_flow_steps is defined to automatically set to NULL
    -- if the related record in wwv_flow_steps is deleted. We need to handle
    -- 2 cases related to this:

    -- Firstly, we want to prevent this from setting the global_page_id to NULL,
    -- in the case where a page import is being performed, which inhrenently
    -- deletes the page and would otherwise cause the constraint to set global_page_id
    -- to NULL (bug #14532258).
    -- Note: Application import is not affected by this, because the entire
    -- flow is deleted, which cascade deletes down through all the dependent
    -- objects. Then the application is just re-created in the normal way,
    -- from afresh.
    if updating and :new.global_page_id is null and wwv_flow.g_import_in_progress then
        :new.global_page_id := :old.global_page_id;
    end if;

    -- Secondly, because the FK uses flow_id and global_page_id, the required
    -- flow_id would be set to NULL as well which we don't want.
    if updating and :new.flow_id is null then
        :new.flow_id := :old.flow_id;
    end if;


    -- created / last updated
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        --
        update wwv_flows
           set last_updated_on = sysdate,
               last_updated_by = wwv_flow.g_user
         where id                = :new.flow_id
           and security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_USER_INT_AUDIT"
    before insert or update or delete on wwv_flow_user_interfaces
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_USER_INTERFACES',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.display_name, :old.display_name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_SECURITY_SCHEMES_T1"
    before insert or update on wwv_flow_security_schemes
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_SEC_SCHEMES_AUDIT"
    before insert or update or delete on wwv_flow_security_schemes
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_SECURITY_SCHEMES',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name,:old.name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_TEMPLATE_PREFS_T1"
    before insert or update on wwv_flow_template_preferences
    for each row
begin
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_BANNER_T1"
    before insert or update on wwv_flow_banner
    for each row
begin
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LANGUAGES_T1"
    before insert or update on wwv_flow_languages
    for each row
begin
    :new.lang_id_upper := upper(:new.lang_id);
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LANGUAGE_MAP_T1"
    before insert or update on wwv_flow_language_map
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        :new.created_on := sysdate;
        :new.created_by := wwv_flow.g_user;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated and trans_flow_lang_code_root
    --
    :new.trans_flow_lang_code_root := substr(:new.translation_flow_language_code,1,2);
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_TRANSLATABLE_TEXT_T1"
    before insert or update on wwv_flow_translatable_text$
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    if :new.template_translatable is null then
        :new.template_translatable := 'N';
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- inserting
    --
    if inserting and not wwv_flow.g_import_in_progress then
       :new.created_on := sysdate;
       :new.created_by := nvl(wwv_flow.g_user,user);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_DYNAMIC_TRANS_T1"
    before insert or update on WWV_FLOW_DYNAMIC_TRANSLATIONS$
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- inserting
    --
    if inserting and not wwv_flow.g_import_in_progress then
       :new.created_on := sysdate;
       :new.created_by := nvl(wwv_flow.g_user,user);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_DEVELOPER_LOG_T1"
    before insert or update on wwv_flow_developer_log
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    :new.event_date := sysdate;
    :new.event_user := nvl(wwv_flow.g_user,user);

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PAGE_CACHE_T1"
    before insert or update on wwv_flow_page_cache
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
        :new.cached_on := sysdate;
        :new.cached_by := wwv_flow.g_user;
        :new.request   := wwv_flow.g_request;
        if :new.language is null then
           :new.language  := upper(substr(wwv_flow.g_flow_language,1,2));
        end if;
    end if;

    --
    -- vpd
    --
    --:new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    :new.security_group_id := nvl(wwv_flow_security.g_curr_flow_security_group_id,0);
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        :new.updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PAGE_CODE_CACHE_T1"
    before insert or update on wwv_flow_page_code_cache
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_TEMPLATES_T1"
    before insert or update on wwv_flow_templates
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_TMPLTS_AUDIT"
    before insert or update or delete on wwv_flow_templates
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then
       l_action := 'I';
    elsif updating then
       l_action := 'U';
    else
       l_action := 'D';
    end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_TEMPLATES',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PAGE_TMPL_DP_T1"
    before insert or update on wwv_flow_page_tmpl_disp_points
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    -- created / last updated
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        --
        update wwv_flow_templates
           set last_updated_on = sysdate,
               last_updated_by = wwv_flow.g_user
         where id                = :new.page_template_id
           and security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PAGE_TMPL_DP_AUDIT"
    before insert or update or delete on wwv_flow_page_tmpl_disp_points
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PAGE_TMPL_DISP_POINTS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name, :old.name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_REQUIRED_ROLES_T1"
    before insert or update on wwv_flow_required_roles
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_FIELD_TEMPLATES_T1"
    before insert or update on wwv_flow_field_templates
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_ICON_BAR_T1"
    before insert or update on wwv_flow_icon_bar
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_ICON_BAR_AUDIT"
    before insert or update or delete on wwv_flow_icon_bar
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then
       l_action := 'I';
    elsif updating then
       l_action := 'U';
    else
       l_action := 'D';
    end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_ICON_BAR',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(nvl(:new.icon_image_alt,:new.icon_subtext),
                            nvl(:old.icon_image_alt,:old.icon_subtext)));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PROCESSING_T1"
    before insert or update on wwv_flow_processing
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_PROCESSING_AUDIT"
    before insert or update or delete on wwv_flow_processing
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then
       l_action := 'I';
    elsif updating then
       l_action := 'U';
    else
       l_action := 'D';
    end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PROCESSING',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.process_name,:old.process_name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_ITEMS_T1"
    before insert or update on wwv_flow_items
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    -----------------
    -- default values
    --
    if :new.data_type is null then
        :new.data_type := 'VARCHAR';
    end if;
    :new.name_length := length(:new.name);
    :new.name := upper(:new.name);
    if :new.is_Persistent is null then
        :new.is_Persistent := 'Y';
    end if;

    --
    -- name
    --
    :new.name := upper(:new.name);

    --
    -- cascade to computations
    --
    if updating and :new.name != upper(:old.name) then
        begin
            update wwv_flow_computations
                set computation_item = :new.name
                where flow_id = :new.flow_id
                and upper(computation_item) = upper(:old.name);
            --
            update wwv_flow_step_computations
                set computation_item = :new.name
                where flow_id = :new.flow_id
                and upper(computation_item) = upper(:old.name);
        exception when others then null;
        end;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_ITEMS_T2"
    before delete on wwv_flow_items
    for each row
begin
    --
    -- cascade delete flow and step computations referencing item
    --
    if nvl(wwv_flow_api.g_mode,'x') != 'REPLACE' then
        begin
            delete wwv_flow_computations
                where upper(computation_item) = upper(:old.name)
                and flow_id = :old.flow_id
                and security_group_id = :old.security_group_id;
            delete wwv_flow_step_computations
                where upper(computation_item) = upper(:old.name)
                and flow_id = :old.flow_id
                and security_group_id = :old.security_group_id;
        exception when others then null;
        end;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_ITEMS_AUDIT"
    before insert or update or delete on wwv_flow_items
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then
       l_action := 'I';
    elsif updating then
       l_action := 'U';
    else
       l_action := 'D';
    end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_ITEMS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_VALIDATIONS_T1"
    before insert or update on wwv_flow_validations
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
       if inserting then
          :new.created_on := sysdate;
          :new.created_by := wwv_flow.g_user;
       end if;
    end if;
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end wwv_flow_validations_t1;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_VAL_AUDIT"
    before insert or update or delete on wwv_flow_validations
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then
       l_action := 'I';
    elsif updating then
       l_action := 'U';
    else
       l_action := 'D';
    end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_VALIDATIONS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.validation_name,:old.validation_name));
    exception when others then null;
    end;
end wwv_biu_flow_val_audit;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_COMPUTATIONS_T1"
    before insert or update on wwv_flow_computations
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.computation_point is null then
       :new.computation_point := 'AFTER_SUBMIT';
    end if;
    if :new.computation_processed is null then
       :new.computation_processed := 'REPLACE_EXISTING';
    end if;
    if :new.computation_type is null then
       :new.computation_type := 'SQL_EXPRESSION';
    end if;

    --
    -- set name
    --
    :new.computation_item := upper(:new.computation_item);

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_COMPUTATIONS_AUDIT"
    before insert or update or delete on wwv_flow_computations
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_COMPUTATIONS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.computation_item,:old.computation_item));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_TABS_T1"
    before insert or update on wwv_flow_tabs
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    :new.tab_also_current_for_pages :=
       replace(replace(replace(:new.tab_also_current_for_pages,':',','),' ',','),'|',',');
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_TABS_AUDIT"
    before insert or update or delete on wwv_flow_tabs
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_TABS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.tab_name,:old.tab_name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_TOPLEVEL_TABS_T1"
    before insert or update on wwv_flow_toplevel_tabs
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_TL_TABS_AUDIT"
    before insert or update or delete on wwv_flow_toplevel_tabs
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_TOPLEVEL_TABS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.tab_name,:old.tab_name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_TREES_T1"
    before insert or update on  wwv_flow_trees
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_TREES_AUDIT"
    before insert or update or delete on wwv_flow_trees
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_TREES',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.tree_name,:old.tree_name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LISTS_OF_VALUES_T1"
    before insert or update on wwv_flow_lists_of_values$
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.lov_query is null then
       :new.lov_query := '.'||:new.id||'.';
    elsif :new.lov_query = '.' then
       :new.lov_query := '.'||:new.id||'.';
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.LAST_UPDATED_BY := wwv_flow.g_user;
        :new.LAST_UPDATED_ON := sysdate;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_LOV_AUDIT"
    before insert or update or delete on wwv_flow_lists_of_values$
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_LISTS_OF_VALUES$',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.lov_name,:old.lov_name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LISTS_OF_VALUESD_T1"
    before insert or update on wwv_flow_list_of_values_data
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.lov_return_value is null then
       :new.lov_return_value := :new.lov_disp_value;
    end if;
    if :new.lov_disp_value is null then
       :new.lov_disp_value := :new.lov_return_value;
    end if;
    --
    if :new.flow_id is null then
        for c1 in (select flow_id
                     from wwv_flow_lists_of_values$
                    where id = :new.lov_id) loop
            :new.flow_id := c1.flow_id;
            exit;
        end loop;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated, cascade to LOV definition
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_lists_of_values$
           set last_updated_on = sysdate,
               last_updated_by = wwv_flow.g_user
         where id = :new.lov_id
           and flow_id = :new.flow_id
           and security_group_id = :new.security_group_id;

        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_LOVD_AUDIT"
    before insert or update or delete on wwv_flow_list_of_values_data
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_LIST_OF_VALUES_DATA',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.lov_disp_value,:old.lov_disp_value));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_STEPS_T1"
    before insert or update on wwv_flow_steps
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := wwv_flow.g_user;
    end if;
    if (inserting or updating) and :new.id2 is null then
        :new.id2 := wwv_flow_id.next_val;
    end if;
    if :new.step_sub_title_type is null then
        :new.step_sub_title_type := 'TEXT_WITH_SUBSTITUTIONS';
    end if;

    :new.alias := upper(:new.alias);

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    else
        if :new.last_updated_on is null and wwv_flow.g_user is not null then
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    -- cascade update to application
    --
    update wwv_flows set
        last_updated_on = sysdate,
        last_updated_by = wwv_flow.g_user
    where
        id = :new.flow_id and
        security_group_id = :new.security_group_id;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_STEPS_AUDIT"
    before insert or update or delete on wwv_flow_steps
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEPS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PAGE_PLUGS_T1"
    before insert or update on wwv_flow_page_plugs
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.plug_source_type is null then
        :new.plug_source_type := 'STATIC_TEXT';
    end if;
    if :new.plug_query_row_template is not null then
        :new.plug_query_format_out := 'TEMPLATE';
    end if;
    --
    -- remove trailing spaces
    --
    for i in 1..10 loop
        :new.plug_display_when_condition  := rtrim(:new.plug_display_when_condition );
        :new.plug_display_when_condition  := rtrim(:new.plug_display_when_condition ,chr(10));
        :new.plug_display_when_condition  := rtrim(:new.plug_display_when_condition ,chr(13));
    end loop;

    if :new.plug_source is not null then
      wwv_flow_page_cache_api.lob_replace(
        p_lob  => :new.plug_source,
        p_what => chr(13),
        p_with => null);
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    if :new.security_group_id <> 10 and :new.plug_query_parse_override is not null then
       :new.plug_query_parse_override := null;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- last updated page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress then
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_steps set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           flow_id = :new.flow_id and
           id = :new.page_id and
           security_group_id = :new.security_group_id;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOWPAGEPLUGS_AUDIT"
    before insert or update or delete on wwv_flow_page_plugs
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PAGE_PLUGS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.plug_name,:old.plug_name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PG_GENERIC_ATTR_T1"
    before insert or update on wwv_flow_page_generic_attr
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress then
        wwv_flow_audit.g_cascade := true;
        for c1 in (select flow_id, page_id from wwv_flow_page_plugs
                   where id = :new.region_id
                   and security_group_id = :new.security_group_id) loop
            update wwv_flow_steps set
               last_updated_on = sysdate,
               last_updated_by = wwv_flow.g_user
            where
               flow_id = c1.flow_id and
               id = c1.page_id and
               security_group_id = :new.security_group_id;
        end loop;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_TREEREGION_T1"
    before insert or update on  wwv_flow_tree_regions
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_STEP_BUTTONS_T1"
    before insert or update on wwv_flow_step_buttons
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- Check the button name doesn't conflict with a tab name in the same application.
    -- Never do this during an import / or upgrade
    if not wwv_flow.g_import_in_progress then
        -- Then check on inserting, or on updating (but only if the button name has changed)
        if inserting or (updating and :old.button_name <> :new.button_name) then
            -- Finally, check if the button action is one that could submit with a REQUEST equal to the button name
            if :new.button_action is not null and :new.button_action in ('SUBMIT','REDIRECT_URL','DEFINED_BY_DA') then
                for c1 in (select tab_name
                             from wwv_flow_tabs
                            where flow_id = :new.flow_id
                              and tab_name = :new.button_name)
                loop
                    raise_application_error (-20001,wwv_flow_lang.system_message('TRIGGER.BUTTON_TAB_NAMES_NOT_EQUAL'));
                    exit;
                end loop;
            end if;
        end if;
    end if;

    --
    -- remove trailing spaces
    --
    for i in 1..10 loop
        :new.button_condition  := rtrim(:new.button_condition );
        :new.button_condition  := rtrim(:new.button_condition ,chr(10));
        :new.button_condition  := rtrim(:new.button_condition ,chr(13));
    end loop;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- last updated page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress and
       not (updating and :new.button_plug_id is null)
    then
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_steps set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           flow_id = :new.flow_id and
           id = :new.flow_step_id and
           security_group_id = :new.security_group_id;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_STEP_BUTTONS_AUDIT"
    before insert or update or delete on wwv_flow_step_buttons
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_BUTTONS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.button_name,:old.button_name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_STEP_BRANCHES_T1"
    before insert or update on wwv_flow_step_branches
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.branch_condition_type = 'REQUEST_IS_NUMERIC' then
        :new.branch_condition := 'Numeric Check.';
    end if;
    if :new.branch_condition_type = '%null%' then
       :new.branch_condition_type := null;
    end if;
    --
    -- remove trailing spaces
    --
    for i in 1..10 loop
        :new.branch_condition  := rtrim(:new.branch_condition );
        :new.branch_condition  := rtrim(:new.branch_condition ,chr(10));
        :new.branch_condition  := rtrim(:new.branch_condition ,chr(13));
    end loop;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- last updated page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress then
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_steps set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           flow_id = :new.flow_id and
           id = :new.flow_step_id and
           security_group_id = :new.security_group_id;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_STEP_BRANCHES_AUDIT"
    before insert or update or delete on wwv_flow_step_branches
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_BRANCHES',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.branch_name, :old.branch_name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_STEP_BRANCH_ARGS_T1"
    before insert or update on wwv_flow_step_branch_args
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_STEP_BRANCH_ARGS_AUDIT"
    before insert or update or delete on wwv_flow_step_branch_args
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_BRANCH_ARGS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => null);
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_STEP_ITEMS_T1"
    before insert or update on wwv_flow_step_items
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    -----------------
    -- default values
    --
    if :new.begin_on_new_line is null then
        :new.begin_on_new_line := 'YES';
    end if;
    if :new.begin_on_new_field is null then
        :new.begin_on_new_field := 'YES';
    end if;
    if :new.label_alignment is null then
        :new.label_alignment := 'LEFT';
    end if;
    if :new.field_alignment is null then
        :new.field_alignment := 'LEFT';
    end if;
    if :new.lov_display_null is null then
        :new.lov_display_null := 'NO';
    end if;
    if :new.accept_processing is null then
        :new.accept_processing := 'REPLACE_EXISTING';
    end if;
    if :new.is_Persistent is null then
        :new.is_Persistent := 'Y';
    end if;
    -- maintain the length of the item name
    :new.name_length := length(:new.name);
    -- force field into upper case and make sure that some special characters are replaced
    -- Note: keep in sync with wwv_flow_builder.is_valid_item_name and get_valid_item_name
    :new.name := replace (
                     replace (
                         translate(trim(upper(:new.name)), ' :&,.+?%''"', '__________'),
                         '_#',
                         '_H' ),
                     '#',
                     '_H' );
    --
    -- remove trailing whitespace from source column
    :new.source := rtrim(rtrim(ltrim(:new.source)),chr(13)||chr(10));
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    if replace(:new.named_lov,'%null%') is not null then
        begin
        select replace(lov_query,chr(13),null) into :new.lov
          from wwv_flow_lists_of_values$
         where flow_id = :new.flow_id and lov_name = :new.named_lov
           and security_group_id = :new.security_group_id;
        exception when others then null;
        end;
    end if;
    --
    -- A HTML5 date picker should always use the format required by the browser.
    --
    if :new.display_as = wwv_flow_native_item.c_date_picker_html5 then
        if :new.attribute_01 = 'DATE' then
            :new.format_mask := wwv_flow_native_item.c_browser_date_format_mask;
        else
            :new.format_mask := wwv_flow_native_item.c_browser_datetime_format_mask;
        end if;
    end if;
    --
    -- cascade to computations, remove session state
    --
    if updating and :new.name != upper(:old.name) then
        begin
            update wwv_flow_computations
               set computation_item = :new.name
             where flow_id = :new.flow_id
               and security_group_id = :new.security_group_id
               and upper(computation_item) = upper(:old.name);
            --
            update wwv_flow_step_computations
               set computation_item = :new.name
             where flow_id = :new.flow_id
               and security_group_id = :new.security_group_id
               and upper(computation_item) = upper(:old.name);
        exception when others then null;
        end;

        -- Remove existing session state to avoid issues with logic that accesses session state by
        -- item name and not by item ID. Note that the developer who is changing this item may not be
        -- the only one with existing session state for it (therefore, we don't constrain to flow_instance).
        wwv_flow_session_state.clear_all_state_for_id (
            p_item_id        => :new.id,
            p_application_id => :new.flow_id );
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- last updated page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress and
       not (updating and :new.item_plug_id is null)
    then
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_steps set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           flow_id = :new.flow_id and
           id = :new.flow_step_id and
           security_group_id = :new.security_group_id;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_STEP_ITEMS_T2"
    before delete on wwv_flow_step_items
    for each row
begin
    --
    -- cascade delete flow and step computations referencing item
    --
    if nvl(wwv_flow_api.g_mode,'x') != 'REPLACE' then
        begin
            delete wwv_flow_computations
                where upper(computation_item) = upper(:old.name)
                and flow_id = :old.flow_id
                and security_group_id = :old.security_group_id;
            delete wwv_flow_step_computations
                where upper(computation_item) = upper(:old.name)
                and flow_id = :old.flow_id
                and security_group_id = :old.security_group_id;
        exception when others then null;
        end;
    end if;
    --
    -- cascade update to page
    --
    begin
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_steps set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           flow_id = :old.flow_id and
           id = :old.flow_step_id and
           security_group_id = :new.security_group_id;
        wwv_flow_audit.g_cascade := false;
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_STEP_ITEMS_AUDIT"
    before insert or update or delete on wwv_flow_step_items
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_ITEMS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_STEP_ITEM_HELP_T1"
    before insert or update on wwv_flow_step_item_help
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_STEP_ITEM_HELP_A"
    before insert or update or delete on wwv_flow_step_item_help
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_ITEM_HELP',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.help_text,:old.help_text));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_STEP_COMPUTATIONS_T1"
    before insert or update on wwv_flow_step_computations
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if :new.computation_point is null then
       :new.computation_point := 'AFTER_SUBMIT';
    end if;
    if :new.computation_processed is null then
       :new.computation_processed := 'REPLACE_EXISTING';
    end if;
    if :new.computation_type is null then
       :new.computation_type := 'SQL_EXPRESSION';
    end if;
    --
    -- remove trailing spaces
    --
    for i in 1..10 loop
        :new.compute_when  := rtrim(:new.compute_when );
        :new.compute_when  := rtrim(:new.compute_when ,chr(10));
        :new.compute_when  := rtrim(:new.compute_when ,chr(13));
    end loop;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- last updated page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress then
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_steps set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           flow_id = :new.flow_id and
           id = :new.flow_step_id and
           security_group_id = :new.security_group_id;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_STEP_COMP_AUDIT"
    before insert or update or delete on wwv_flow_step_computations
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_COMPUTATIONS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.computation_item,:old.computation_item));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_STEP_VALIDATIONS_T1"
    before insert or update on wwv_flow_step_validations
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    :new.validation_condition := rtrim( :new.validation_condition, ' '||chr(10)||chr(13) );
    --
    -- remove trailing spaces
    --
    for i in 1..10 loop
        :new.validation  := rtrim(:new.validation );
        :new.validation  := rtrim(:new.validation ,chr(10));
        :new.validation  := rtrim(:new.validation ,chr(13));
    end loop;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- last updated page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress then
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_steps set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           flow_id = :new.flow_id and
           id = :new.flow_step_id and
           security_group_id = :new.security_group_id;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_STEP_VALID_AUDIT"
    before insert or update or delete on wwv_flow_step_validations
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_VALIDATIONS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.validation_name,:old.validation_name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_STEP_PROCESSING_T1"
    before insert or update on wwv_flow_step_processing
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- last updated page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress then
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_steps set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           flow_id = :new.flow_id and
           id = :new.flow_step_id and
           security_group_id = :new.security_group_id;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_STEP_PROCESSING_AUDIT"
    before insert or update or delete on wwv_flow_step_processing
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_PROCESSING',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.process_name,:old.process_name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_BUTTON_TEMPLATES_T1"
    before insert or update on wwv_flow_button_templates
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PAGE_PLUG_TEMPL_T1"
    before insert or update on wwv_flow_page_plug_templates
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOWPAGEPLUGTEMP_AUDIT"
    before insert or update or delete on wwv_flow_page_plug_templates
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PAGE_PLUG_TEMPLATES',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.page_plug_template_name,:old.page_plug_template_name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PLUG_TMPL_DP_T1"
    before insert or update on wwv_flow_plug_tmpl_disp_points
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    -- created / last updated
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        --
        update wwv_flow_page_plug_templates
           set last_updated_on = sysdate,
               last_updated_by = wwv_flow.g_user
         where id                = :new.plug_template_id
           and security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PLUG_TMPL_DP_AUDIT"
    before insert or update or delete on wwv_flow_plug_tmpl_disp_points
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PLUG_TMPL_DISP_POINTS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name, :old.name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_ROW_TEMPLATES_T1"
    before insert or update on wwv_flow_row_templates
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.row_template_before_rows is null then
       :new.row_template_before_rows := ' ';
    end if;
    if :new.row_template_after_rows is null then
       :new.row_template_after_rows := ' ';
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOWROWTMPLTS_AUDIT"
    before insert or update or delete on wwv_flow_row_templates
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_ROW_TEMPLATES',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.row_template_name,:old.row_template_name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LIST_TEMPLATES_T1"
    before insert or update on wwv_flow_list_templates
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.list_template_before_rows is null then
       :new.list_template_before_rows := ' ';
    end if;
    if :new.list_template_after_rows is null then
       :new.list_template_after_rows := ' ';
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOWLISTTMPLTS_AUDIT"
    before insert or update or delete on wwv_flow_list_templates
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_LIST_TEMPLATES',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.list_template_name,:old.list_template_name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_CALS_T1"
   before insert or update on wwv_flow_cals
   for each row
begin
   --
   -- ID
   --
   if inserting and :new.id is null then
       :new.id := wwv_flow_id.next_val;
   end if;
   --
   -- Default the display type
   --
   if :new.display_type is null then
       :new.display_type := 'COL';
   end if;
   --
   -- vpd
   --
   if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
   end if;
   --
   -- last updated
   --
   if not wwv_flow.g_import_in_progress then
       :new.last_updated_on := sysdate;
       :new.last_updated_by := wwv_flow.g_user;
       update wwv_flows set
          last_updated_on = sysdate,
          last_updated_by = wwv_flow.g_user
       where
          id = :new.flow_id and
          security_group_id = :new.security_group_id;
   end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_CAL_TEMPLATES_T1"
    before insert or update on wwv_flow_cal_templates
    for each row
begin
    --
    -- ID
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_THEMES_T1"
         before insert or update on wwv_flow_themes
         for each row
begin
    if inserting and :new.id is null then
       :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
            last_updated_on = sysdate,
            last_updated_by = wwv_flow.g_user
        where
            id = :new.flow_id and
            security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOWTHEMES_AUDIT"
         before insert or update or delete on wwv_flow_themes
         for each row
declare
    l_action varchar2(1);
begin
    if inserting then
        l_action := 'I';
    elsif updating then
        l_action := 'U';
    else
        l_action := 'D';
    end if;

     begin
         wwv_flow_audit.audit_action (
            p_table_name  => 'WWV_FLOW_THEMES',
            p_action      => l_action,
            p_table_pk    => nvl(:old.id,:new.id),
            p_object_name => nvl(:new.theme_name,:old.theme_name));
     exception when others then null;
     end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_THEME_STYLES_T1"
    before insert or update on wwv_flow_theme_styles
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    -- created / last updated
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        --
        update wwv_flows
           set last_updated_on = sysdate,
               last_updated_by = wwv_flow.g_user
         where id                = :new.flow_id
           and security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_THEME_STYLE_AUDIT"
    before insert or update or delete on wwv_flow_theme_styles
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_THEME_STYLES',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name, :old.name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_THEME_DISP_POINTS_T1"
    before insert or update on wwv_flow_theme_display_points
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    -- created / last updated
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        --
        update wwv_flows
           set last_updated_on = sysdate,
               last_updated_by = wwv_flow.g_user
         where id                = :new.flow_id
           and security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_THEME_DISP_POIN_AUDIT"
    before insert or update or delete on wwv_flow_theme_display_points
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_THEME_DISPLAY_POINTS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name, :old.name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_SESSIONS_T1"
    before insert or update on wwv_flow_sessions$
    for each row
begin
    --
    -- note: new.id is typically never null on insert
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    --
    --
    --
    if inserting then
        if :new.created_by is null then
            :new.created_by := user;
        end if;
        wwv_flow_security.g_crypto_salt := wwv_flow_crypto.randombytes(p_numbytes => 32);
        if :new.session_id_hashed is null then
            :new.session_id_hashed := wwv_flow_session.generate_unique_hashed_id;
            begin
                :new.ip_address := rawtohex(wwv_flow_security.g_crypto_salt);
            exception when others then
                :new.ip_address := null;
            end;
        end if;
        :new.created_on := sysdate;
        :new.last_changed := sysdate;
        if :new.remote_addr is null then
           :new.remote_addr := wwv_flow_security.get_client_ip_address;
        end if;
    end if;

    :new.session_time_zone := trim(:new.session_time_zone);

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_SESSIONS_T2"
   before delete on WWV_FLOW_SESSIONS$
   for each row
begin
   delete from wwv_flow_worksheet_rpts where session_id = :old.id;
   --
   update wwv_flow_companies
   set last_login = trunc(:old.CREATED_ON)
   where provisioning_company_id = :old.security_group_id and
        (last_login < trunc(:old.CREATED_ON) or last_login is null);
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PREFERENCES_T1"
    before insert or update on wwv_flow_preferences$
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_MESSAGES_T1"
    before insert or update on wwv_flow_messages$
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
    end if;
    :new.name := upper(:new.name);
    :new.message_language := lower(:new.message_language);
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_MESSAGES_AUDIT"
    before insert or update or delete on wwv_flow_messages$
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_MESSAGES$',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PATCHES_T1"
    before insert or update on wwv_flow_patches
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_PATCHES_AUDIT"
    before insert or update or delete on wwv_flow_patches
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PATCHES',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.patch_name,:old.patch_name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_FND_USER_T1"
    before insert or update on wwv_flow_fnd_user
    for each row
begin
    if inserting and :new.user_id is null then
        if :new.user_id is null then :new.user_id := wwv_flow_id.next_val; end if;
    end if;
    if inserting then
        :new.creation_date := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.account_expiry is null then
        :new.account_expiry := sysdate;
    end if;
    if :new.start_date is null then
        :new.start_date := sysdate;
    end if;
    if :new.end_date is null then
        :new.end_date := :new.start_date + (365*20);
    end if;
    :new.user_name := trim(upper(:new.user_name));
    :new.allow_access_to_schemas := upper(:new.allow_access_to_schemas);
    :new.default_date_format := trim(:new.default_date_format);
    :new.last_updated_by := nvl(wwv_flow.g_user,user);
    :new.last_update_date := sysdate;
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    :new.user_name := upper(:new.user_name);
    if INSERTING and :new.web_password is not null then
      if wwv_flow_fnd_user_pw_pref.web_password_format is null or
         wwv_flow_fnd_user_pw_pref.web_password_format = 'CLEAR_TEXT' then
         -- not hashed, so hash it
         :new.web_password2 := sys.utl_raw.cast_to_raw(
             wwv_flow_crypto.one_way_hash_str(:new.web_password||:new.security_group_id||:new.user_name));
         wwv_flow_fnd_user_api.g_password_save := sys.utl_raw.cast_to_raw(wwv_flow_crypto.one_way_hash_str(:new.web_password||:new.security_group_id));
         :new.web_password := null;
         :new.web_password_raw := null;
      elsif wwv_flow_fnd_user_pw_pref.web_password_format = 'HEX_ENCODED_DIGEST' then
         -- already hashed no need to do it again, however decode it
         :new.web_password := sys.utl_raw.cast_to_varchar2(:new.web_password);
         if wwv_flow_api.g_fnd_user_password_action = true then
           :new.web_password_raw := sys.utl_raw.cast_to_raw(:new.web_password);
         end if;
      elsif wwv_flow_fnd_user_pw_pref.web_password_format = 'HEX_ENCODED_DIGEST_V2' then
         -- apex v3.0 format already hashed with security group id and user name
         :new.web_password2 := :new.web_password;
         :new.web_password := null;
         :new.web_password_raw := null;
      elsif wwv_flow_fnd_user_pw_pref.web_password_format = 'DIGEST' then
         -- its already as you want it so do nothing
         null;
      end if;
    elsif UPDATING and :new.web_password is not null then
       if :old.web_password is null or :new.web_password != :old.web_password  then
		       if wwv_flow_fnd_user_pw_pref.web_password_format is null or
		          wwv_flow_fnd_user_pw_pref.web_password_format = 'CLEAR_TEXT' then
		          :new.web_password2 := sys.utl_raw.cast_to_raw(
		              wwv_flow_crypto.one_way_hash_str(:new.web_password||:new.security_group_id||:new.user_name));
              wwv_flow_fnd_user_api.g_password_save := sys.utl_raw.cast_to_raw(wwv_flow_crypto.one_way_hash_str(:new.web_password||:new.security_group_id));
		          :new.web_password := null;
		          :new.web_password_raw := null;
		          :new.account_expiry := sysdate;
		       end if;
		   end if;
    else
    	if :old.web_password2 is not null then
         :new.web_password2 := :old.web_password2;
    	   :new.web_password := null;
         :new.web_password_raw := null;
      elsif :old.web_password is not null then
      	 :new.web_password := :old.web_password;
      end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_FND_USER_T2"
    after insert or update on wwv_flow_fnd_user
    for each row
declare
  l_hist_id number;
  l_found boolean;
begin
    if INSERTING and wwv_flow_fnd_user_api.g_password_save is not null then
        l_hist_id := wwv_flow_id.next_val;
        insert into wwv_flow_password_history
            (id, user_id, password, created, security_group_id)
        values
            (l_hist_id, :new.user_id, wwv_flow_fnd_user_api.g_password_save, trunc(sysdate), :new.security_group_id);
    elsif UPDATING and wwv_flow_fnd_user_api.g_password_save is not null then
        -- insert into history table only if this password with created date of today is not already saved
        l_found := false;
        for c1 in (select id
                     from wwv_flow_password_history
                    where user_id = :new.user_id
                      and password = wwv_flow_fnd_user_api.g_password_save
                      and created = trunc(sysdate)
                      and security_group_id = :new.security_group_id)
        loop
            l_found := true;
            exit;
        end loop;
        if not l_found then
            l_hist_id := wwv_flow_id.next_val;
            insert into wwv_flow_password_history
                (id, user_id, password, created, security_group_id)
            values
                (l_hist_id, :new.user_id, wwv_flow_fnd_user_api.g_password_save, trunc(sysdate), :new.security_group_id);
        end if;
    end if;
    wwv_flow_fnd_user_api.g_password_save := null;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_DEVELOPERS_T1"
    before insert or update on wwv_flow_developers
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.user_id is null then
            :new.user_id := :new.id;
        end if;
    end if;
    :new.userid := upper(:new.userid);
    --
    -- set admin privs
    --
    if instr(:new.DEVELOPER_ROLE,'ADMIN') > 0 then
       :new.DEVELOPER_ROLE := 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL';
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_DEVELOPERS_AUDIT"
    before insert or update or delete on wwv_flow_developers
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_DEVELOPERS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.userid,:old.userid));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LISTS_T1"
    before insert or update on wwv_flow_lists
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
    end if;
    if :new.list_status is null then
        :new.list_status := 'PERSONAL';
    end if;
    if :new.list_displayed is null then
        :new.list_displayed := 'BY_DEFAULT';
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_LISTS_AUDIT"
    before insert or update or delete on wwv_flow_lists
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_LISTS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LIST_ITEMS_T1"
    before insert or update on wwv_flow_list_items
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
    end if;
    if :new.list_item_owner is not null then
        :new.list_item_owner := user;
    end if;
    for c1 in (select flow_id from wwv_flow_lists where id = :new.list_id) loop
        :new.flow_id := c1.flow_id;
        exit;
    end loop;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_LIST_ITEMS_AUDIT"
    before insert or update or delete on wwv_flow_list_items
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_LIST_ITEMS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.list_item_link_text,:old.list_item_link_text));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_SHARED_QUERIES_T1"
  before insert or update on wwv_flow_shared_queries
  for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
	      :new.created_on := sysdate;
	      :new.created_by := v('USER');
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_SHRD_QRY_AUDIT"
    before insert or update or delete on wwv_flow_shared_queries
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_SHARED_QUERIES',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name,:old.name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_SQRY_SQL_STMTS_T1"
  before insert or update on wwv_flow_shared_qry_sql_stmts
  for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
	      :new.created_on := sysdate;
	      :new.created_by := v('USER');
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_IMAGE_REPOSITORY_T1"
    before insert or update on wwv_flow_image_repository
    for each row
begin
    :new.upper_image_name := upper(:new.image_name);
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    --
    if :new.security_group_id = 10 then
      :new.image_tag := '#IMAGE_PREFIX#' || :new.image_name;
    else
      if :new.flow_id = 0 then
        :new.image_tag := '#WORKSPACE_IMAGES#' || :new.image_name;
      else
        :new.image_tag := '#APP_IMAGES#' || :new.image_name;
      end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_CSS_REPOSITORY_T1"
    before insert or update on wwv_flow_css_repository
    for each row
begin
    :new.upper_css_name := upper(:new.css_name);
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    --
    if :new.security_group_id = 10 then
      :new.css_tag := '#IMAGE_PREFIX#' || :new.css_name;
    else
      :new.css_tag := '#COMPANY_IMAGES#' || :new.css_name;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_HTML_REPOSITORY_T1"
    before insert or update on wwv_flow_html_repository
    for each row
begin
    :new.upper_html_name := upper(:new.html_name);
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    --
    if :new.security_group_id = 10 then
      :new.html_tag := '#IMAGE_PREFIX#' || :new.html_name;
    else
      if :new.flow_id = 0 then
        :new.html_tag := '#COMPANY_IMAGES#' || :new.html_name;
      else
        :new.html_tag := '#FLOW_IMAGES#' || :new.html_name;
      end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LOV_VALUES_T1"
    before insert or update on wwv_flow_lov_values
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
    end if;
    if :new.list_owner is null then
        :new.list_owner := nvl(wwv_flow.g_user,user);
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_LOV_VAL_AUDIT"
    before insert or update or delete on wwv_flow_lov_values
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PAGE_LOV_VALUES',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.list_display_value,:old.list_display_value));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_EFF_USERID_MAP_T1"
    before insert or update on wwv_flow_effective_userid_map
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLW_EFF_UID_MAP_AUDIT"
    before insert or update or delete on wwv_flow_effective_userid_map
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_EFFECTIVE_USERID_MAP',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.effective_userid,:old.effective_userid));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_SHORTCUTS_T1"
    before insert or update on wwv_flow_shortcuts
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    :new.shortcut_consideration_seq := nvl(:new.shortcut_consideration_seq,1);
    :new.shortcut_name := upper(:new.shortcut_name);
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_SHORTCUTS_AUDIT"
    before insert or update or delete on wwv_flow_shortcuts
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_SHORTCUTS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.shortcut_name,:old.shortcut_name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_SHORTCUT_UM_T1"
    before insert or update on wwv_flow_shortcut_usage_map
    for each row
begin
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_MAIL_LOG_T1"
    before insert on wwv_flow_mail_log
    for each row
begin
    :new.last_updated_on := sysdate;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_MAIL_QUEUE_T1"
    before insert or update on wwv_flow_mail_queue
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.mail_send_count is null then
            :new.mail_send_count := 0;
        end if;
    end if;
    :new.last_updated_on := sysdate;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_MAIL_ATTACHMENTS_T1"
    before insert or update on wwv_flow_mail_attachments
    for each row
declare
  l_maximum_size_mb integer;
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
    end if;
    :new.last_updated_on := sysdate;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);

    --
    -- If a maximum attachment size is specified in system preferences, then ensure
    -- that this attachment does not exceed the maximum size.
    --
    l_maximum_size_mb := wwv_flow_platform.get_preference('EMAIL_ATTACHMENT_MAX_SIZE_MB');
    if l_maximum_size_mb is not null then
        if sys.dbms_lob.getlength(:new.attachment)/1024/1024 > l_maximum_size_mb then
            raise_application_error (-20023,
                wwv_flow_lang.system_message('WWV_FLOW_MAIL.ADD_ATTACHMENT.ATTACHMENT_EXCEEDS_MAXIMUM_SIZE',
                    round(sys.dbms_lob.getlength(:new.attachment)/1024/1024), l_maximum_size_mb));
        end if;
    end if;


    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_SW_BINDS_T1"
    before insert or update on wwv_flow_sw_binds
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_SW_RESULTS_T1"
    before insert or update on wwv_flow_sw_results
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.started := sysdate;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_SW_DETAIL_RESULTS_T1"
    before insert or update on wwv_flow_sw_detail_results
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.started := sysdate;
    elsif updating then
    	  :new.last_updated := sysdate;
    end if;
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_SW_SQL_CMDS_T1"
    before insert or update on wwv_flow_sw_sql_cmds
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting and not wwv_flow.g_import_in_progress then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_SW_STMTS_T1"
    before insert or update on wwv_flow_sw_stmts
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_IMPORT_EXPORT_T1"
    before insert or update on wwv_flow_import_export
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_COLLECTION_T1"
    before insert or update on wwv_flow_collections$
    for each row
declare
    c_instance_id_shift constant number := 100000000000000;
begin
    :new.user_id           := wwv_flow.g_user;
    :new.session_id        := v('SESSION');
    :new.collection_name   := upper(:new.collection_name);
    :new.flow_id           := v('FLOW_ID');

    if inserting then
        if :new.id is null then
            --
            -- Prepend two digit instance number to support partitioning of
            -- session data (bug# 13562656)
            --
            :new.id := (to_number(sys_context('USERENV', 'INSTANCE'))-1)*c_instance_id_shift+
                       greatest (
                           mod(wwv_flow_id.next_val,
                               c_instance_id_shift),
                           1 );
        end if;
        :new.created_on         := coalesce(:new.created_on, sysdate);
        :new.collection_changed := coalesce(upper(:new.collection_changed), 'N');
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_collection_int.get_security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_COLLECTION_MEMBERS_T1"
    before insert or update on wwv_flow_collection_members$
    for each row
begin
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_collection_int.get_security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_FND_USER_GROUPS_T1"
    before insert or update on wwv_flow_fnd_user_groups
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_FND_GROUP_USERS_T1"
    before insert or update on wwv_flow_fnd_group_users
    for each row
begin
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_REG_UPD_RPT_COLS_T1"
    before insert or update on wwv_flow_region_upd_rpt_cols
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_POPUP_LOV_TEMPLATE_T1"
    before insert or update on wwv_flow_popup_lov_template
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_MENUS_T1"
    before insert or update on wwv_flow_menus
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_MENU_OPTIONS_T1"
    before insert or update on wwv_flow_menu_options
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    if :new.flow_id is null then
        for c1 in (select flow_id
                     from wwv_flow_menus
                    where id = :new.menu_id) loop
            :new.flow_id := c1.flow_id;
            exit;
        end loop;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_MENU_OPT_AUDIT"
    before insert or update or delete on wwv_flow_menu_options
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_MENU_OPTIONS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.short_name,:old.short_name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_MENU_TEMPLATES_T1"
    before insert or update on wwv_flow_menu_templates
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_VERSION_T1"
    before insert on wwv_flow_version$
    for each row
begin
    select wwv_flow_version_seq.nextval,sysdate into :new.seq,:new.date_applied from sys.dual;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_AUTHENTICATIONS_T1"
    before insert or update on wwv_flow_authentications
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_AUTHENT_AUDIT"
    before insert or update or delete on wwv_flow_authentications
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_AUTHENTICATIONS',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name,:old.name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_ENTRY_POINTS_T1"
    before insert or update on wwv_flow_entry_points
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_ENTRY_POINTS_AUDIT"
    before insert or update or delete on wwv_flow_entry_points
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_ENTRY_POINTS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_ENTRY_POINT_ARGS_T1"
    before insert or update on wwv_flow_entry_point_args
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_ENTRY_POINT_ARGS_AUDIT"
    before insert or update or delete on wwv_flow_entry_point_args
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then l_action := 'I'; elsif updating then l_action := 'U'; else l_action := 'D'; end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_ENTRY_POINT_ARGS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => null);
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WEB_SERVICES_T1"
    before insert or update on wwv_flow_shared_web_services
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_SHARED_WS_AUDIT"
    before insert or update or delete on wwv_flow_shared_web_services
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_SHARED_WEB_SERVICES',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name,:old.name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_OPERATIONS_T1"
    before insert or update on wwv_flow_ws_operations
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_PARAMETERS_T1"
    before insert or update on wwv_flow_ws_parameters
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_PARMS_MAP_T1"
    before insert or update on wwv_flow_ws_process_parms_map
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LOCK_PAGE_T1"
    before insert or update on wwv_flow_lock_page
    for each row
begin
    --
    -- ID
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.LOCKED_ON := sysdate;
    end if;
    --
    -- maintain log
    --
    if inserting then
        insert into wwv_flow_lock_page_log
            (lock_id,lock_flow,lock_page,action,developer,lock_comment)
        values
            (:new.id,:new.flow_id,:new.object_id,'LOCK',:new.locked_by,:new.lock_comment);
    end if;
    if updating then
        insert into wwv_flow_lock_page_log
            (lock_id,lock_flow,lock_page,action,developer,lock_comment)
        values
            (:new.id,:new.flow_id,:new.object_id,'UPDATE',:new.locked_by,:new.lock_comment);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LOCK_PAGE_T2"
   before delete on wwv_flow_lock_page
   for each row
begin
insert into wwv_flow_lock_page_log (
   lock_id,lock_flow,lock_page,ACTION,ACTION_DATE,DEVELOPER,lock_comment)
   values (
   :old.id, :old.flow_id, :old.object_id,'UNLOCK',sysdate,v('USER'),:old.lock_comment);
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LOCK_PAGE_LOG_T1"
    before insert or update on wwv_flow_lock_page_log
    for each row
begin
    --
    -- ID
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.action_date := sysdate;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_HNT_TABLE_INFO_T1"
    before insert or update on wwv_flow_hnt_table_info
    for each row
begin
    if inserting and :new.table_id is null then
        :new.table_id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);
    :new.last_updated_on := sysdate;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_HNT_GROUPS_T1"
    before insert or update on wwv_flow_hnt_groups
    for each row
begin
    if inserting and :new.group_id is null then
        :new.group_id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);
    :new.last_updated_on := sysdate;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_HNT_COL_INFO_T1"
    before insert or update on wwv_flow_hnt_column_info
    for each row
begin
    if inserting and :new.column_id is null then
        :new.column_id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);
    :new.last_updated_on := sysdate;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_HNT_LOV_DATA_T1"
    before insert or update on wwv_flow_hnt_lov_data
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);
    :new.last_updated_on := sysdate;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_HNT_COLUMN_DICT_T1"
    before insert or update on wwv_flow_hnt_column_dict
    for each row
begin
    :new.column_name := upper(:new.column_name);

    if inserting and :new.column_id is null then
        :new.column_id := wwv_flow_id.next_val;
    elsif updating
        and :old.column_name != :new.column_name then
        begin
            update wwv_flow_hnt_col_dict_syn
               set syn_name = :new.column_name
             where column_id = :old.column_id
               and syn_name = :old.column_name
               and security_group_id = :old.security_group_id;
        exception when others then null;
        end;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting then
       :new.created_on := sysdate;
       :new.created_by := nvl(wwv_flow.g_user,user);
    end if;

    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_HNT_COLUMN_DICT_T2"
    after insert on wwv_flow_hnt_column_dict
    for each row
begin
    if not wwv_flow.g_import_in_progress then
        insert into wwv_flow_hnt_col_dict_syn
           (column_id, syn_name)
        values
           (:new.column_id, :new.column_name);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_HNT_COL_DICT_SYN_T1"
    before insert or update on wwv_flow_hnt_col_dict_syn
    for each row
begin

    :new.syn_name := upper(:new.syn_name);

    if inserting and :new.syn_id is null then
        :new.syn_id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting then
       :new.created_on := sysdate;
       :new.created_by := nvl(wwv_flow.g_user,user);
    end if;

    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_CHART_SER_ATTR_T1"
    before insert or update on wwv_flow_region_chart_ser_attr
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress then
        wwv_flow_audit.g_cascade := true;
        for c1 in (select flow_id, page_id from wwv_flow_page_plugs
                   where id = :new.region_id
                   and security_group_id = :new.security_group_id) loop
            update wwv_flow_steps set
               last_updated_on = sysdate,
               last_updated_by = wwv_flow.g_user
            where
               flow_id = c1.flow_id and
               id = c1.page_id and
               security_group_id = :new.security_group_id;
        end loop;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_QUERY_DEFINITION_T1"
    before insert or update on wwv_flow_query_definition
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_QUERY_OBJECT_T1"
    before insert or update on wwv_flow_query_object
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_QUERY_COLUMN_T1"
    before insert or update on wwv_flow_query_column
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_QUERY_CONDITION_T1"
    before insert or update on wwv_flow_query_condition
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.operator is null then
        :new.operator := 'NONE';
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_REG_REPORT_COLUMN_T1"
    before insert or update on wwv_flow_region_report_column
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- sync flow id for translations
    --
    if :new.flow_id is null then
         for c1 in (select flow_id
                     from wwv_flow_page_plugs
                     where id = :new.region_id) loop
             :new.flow_id := c1.flow_id;
             exit;
         end loop;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_REGREPORT_FILTER_T1"
    before insert or update on wwv_flow_region_report_filter
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_HNT_PROCEDURE_INFO_T1"
    before insert or update on wwv_flow_hnt_procedure_info
    for each row
begin
    if :new.procedure_id is null then
        :new.procedure_id := wwv_flow_id.next_val;
    end if;

    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    elsif updating then
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
        :new.last_updated_on := sysdate;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_HNT_ARGUMENT_INFO_T1"
    before insert or update on  wwv_flow_hnt_argument_info
    for each row
begin
    if :new.argument_id is null then
        :new.argument_id := wwv_flow_id.next_val;
    end if;

    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    elsif updating then
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
        :new.last_updated_on := sysdate;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PAGE_GROUPS_T1"
    before insert or update on wwv_flow_page_groups
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end wwv_flow_pg_groups;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_ONLINE_HELP_T1"
    before insert on wwv_flow_online_help
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_ONLINE_HELP_JA_T1"
    before insert on wwv_flow_online_help_ja
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_RESTRICTED_SCHEMA_T1"
    before insert or update on wwv_flow_restricted_schemas
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    else
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_RSCHEMA_EXCEPTION_T1"
    before insert or update on wwv_flow_rschema_exceptions
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    else
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_QB_SAVED_QRY_T1"
    before insert on wwv_flow_qb_saved_query
    for each row
begin
    :new.id                 := nvl(:new.id,wwv_flow_id.next_val);
    :new.query_owner        := nvl(:new.query_owner,wwv_flow_user_api.get_default_schema);
    :new.created_by         := nvl(:new.created_by,wwv_flow.g_user);
    :new.created_on         := nvl(:new.created_on,sysdate);
    :new.last_updated_by    := wwv_flow.g_user;
    :new.last_updated_on    := sysdate;
    :new.security_group_id  := nvl(wwv_flow_security.g_security_group_id,0);
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_QB_SAVED_COND_T1"
    before insert on wwv_flow_qb_saved_cond
    for each row
begin
    :new.security_group_id  := nvl(wwv_flow_security.g_security_group_id,0);
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_qb_saved_query set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_QB_SAVED_JOIN_T1"
    before insert on wwv_flow_qb_saved_join
    for each row
begin
    :new.security_group_id  := nvl(wwv_flow_security.g_security_group_id,0);
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_qb_saved_query set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_QB_SAVED_TABS_T1"
    before insert on wwv_flow_qb_saved_tabs
    for each row
begin
    :new.security_group_id  := nvl(wwv_flow_security.g_security_group_id,0);
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_qb_saved_query set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_MODELS_T1"
    before insert or update on wwv_flow_models
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    if inserting then
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.created_on := sysdate;
    elsif updating then
       :new.last_updated_by := nvl(wwv_flow.g_user,user);
       :new.last_updated_on := sysdate;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_MODEL_PAGES_T1"
    before insert or update on wwv_flow_model_pages
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    if inserting then
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.created_on := sysdate;
    elsif updating then
       :new.last_updated_by := nvl(wwv_flow.g_user,user);
       :new.last_updated_on := sysdate;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_MODEL_PAGE_REGIONS_T1"
    before insert or update on wwv_flow_model_page_regions
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    if inserting then
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.created_on := sysdate;
    elsif updating then
       :new.last_updated_by := nvl(wwv_flow.g_user,user);
       :new.last_updated_on := sysdate;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_MODEL_PAGE_COLS_T1"
    before insert or update on wwv_flow_model_page_cols
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    if inserting then
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.created_on := sysdate;
    elsif updating then
       :new.last_updated_by := nvl(wwv_flow.g_user,user);
       :new.last_updated_on := sysdate;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_SC_TRANS_T1"
    before insert or update on wwv_flow_sc_trans
    for each row
declare
  l_tid number;
begin
    -- set security group id if null
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    -- set t_id as I need to amintain the order of transactions as they occured
    if inserting and :new.transaction_id is null then
        select nvl(max(transaction_id),0)+1 into l_tid from wwv_flow_sc_trans where session_id = :new.session_id;
        :new.transaction_id := l_tid;
        :new.transaction_status := 'N';
        :new.created_on := sysdate;
    else
        :new.updated_on := sysdate;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_REPORT_LAYOUTS_T1"
  before insert or update on wwv_flow_report_layouts
  for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
	      :new.created_on := sysdate;
	      :new.created_by := v('USER');
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_RPT_LAYOUTS_AUDIT"
    before insert or update or delete on wwv_flow_report_layouts
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_REPORT_LAYOUTS',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.report_layout_name,:old.report_layout_name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_INSTALL_T1"
    before insert or update on wwv_flow_install
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if :new.flow_id is null then
       :new.flow_id := v('FB_FLOW_ID');
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
       if inserting then
          :new.created_by := nvl(wwv_flow.g_user,user);
          :new.created_on := sysdate;
       elsif updating then
          :new.last_updated_by := nvl(wwv_flow.g_user,user);
          :new.last_updated_on := sysdate;
       end if;
       update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;

    :new.prompt_substitution_01_yn := nvl(:new.prompt_substitution_01_yn, 'N');
    :new.prompt_substitution_02_yn := nvl(:new.prompt_substitution_02_yn, 'N');
    :new.prompt_substitution_03_yn := nvl(:new.prompt_substitution_03_yn, 'N');
    :new.prompt_substitution_04_yn := nvl(:new.prompt_substitution_04_yn, 'N');
    :new.prompt_substitution_05_yn := nvl(:new.prompt_substitution_05_yn, 'N');
    :new.prompt_substitution_06_yn := nvl(:new.prompt_substitution_06_yn, 'N');
    :new.prompt_substitution_07_yn := nvl(:new.prompt_substitution_07_yn, 'N');
    :new.prompt_substitution_08_yn := nvl(:new.prompt_substitution_08_yn, 'N');
    :new.prompt_substitution_09_yn := nvl(:new.prompt_substitution_09_yn, 'N');
    :new.prompt_substitution_10_yn := nvl(:new.prompt_substitution_10_yn, 'N');
    :new.prompt_substitution_11_yn := nvl(:new.prompt_substitution_11_yn, 'N');
    :new.prompt_substitution_12_yn := nvl(:new.prompt_substitution_12_yn, 'N');
    :new.prompt_substitution_13_yn := nvl(:new.prompt_substitution_13_yn, 'N');
    :new.prompt_substitution_14_yn := nvl(:new.prompt_substitution_14_yn, 'N');
    :new.prompt_substitution_15_yn := nvl(:new.prompt_substitution_15_yn, 'N');
    :new.prompt_substitution_16_yn := nvl(:new.prompt_substitution_16_yn, 'N');
    :new.prompt_substitution_17_yn := nvl(:new.prompt_substitution_17_yn, 'N');
    :new.prompt_substitution_18_yn := nvl(:new.prompt_substitution_18_yn, 'N');
    :new.prompt_substitution_19_yn := nvl(:new.prompt_substitution_19_yn, 'N');
    :new.prompt_substitution_20_yn := nvl(:new.prompt_substitution_20_yn, 'N');

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_INSTALL_SCRIPTS_T1"
    before insert or update on wwv_flow_install_scripts
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if :new.flow_id is null then
       :new.flow_id := v('FB_FLOW_ID');
    end if;

    if :new.install_id is null then
       for c1 in (select id from wwv_flow_install where flow_id = :new.flow_id) loop
          :new.install_id := c1.id;
       end loop;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
       if inserting then
          :new.created_by := nvl(wwv_flow.g_user,user);
          :new.created_on := sysdate;
       elsif updating then
          :new.last_updated_by := nvl(wwv_flow.g_user,user);
          :new.last_updated_on := sysdate;
       update wwv_flow_install set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.install_id and
           security_group_id = :new.security_group_id;
       end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_INSTALL_CHECKS_T1"
    before insert or update on wwv_flow_install_checks
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if :new.flow_id is null then
       :new.flow_id := v('FB_FLOW_ID');
    end if;

    if :new.install_id is null then
       for c1 in (select id from wwv_flow_install where flow_id = :new.flow_id) loop
          :new.install_id := c1.id;
       end loop;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
       if inserting then
          :new.created_by := nvl(wwv_flow.g_user,user);
          :new.created_on := sysdate;
       elsif updating then
          :new.last_updated_by := nvl(wwv_flow.g_user,user);
          :new.last_updated_on := sysdate;
       end if;
       update wwv_flow_install set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.install_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_INSTALL_BUILD_OPT_T1"
    before insert or update on wwv_flow_install_build_opt
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if :new.flow_id is null then
       :new.flow_id := v('FB_FLOW_ID');
    end if;

    if :new.install_id is null then
       for c1 in (select id from wwv_flow_install where flow_id = :new.flow_id) loop
          :new.install_id := c1.id;
       end loop;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
       update wwv_flow_install set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.install_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_BUILD_AUDIT_T"
    before insert or update on wwv_flow_builder_audit_trail
    for each row
begin
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_STANDARD_ICONS_T1"
    before insert or update on wwv_flow_standard_icons
    for each row
begin
    if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_STD_ITEM_TYPES_T1"
    before insert or update on wwv_flow_standard_item_types
    for each row
begin
    if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_BIW_APPBLDPREF"
before insert or update on  wwv_flow_app_build_pref
for each row
begin
  if inserting and :new.id is null then
     :new.id := wwv_flow_id.next_val;
  end if;
  if inserting then
     :new.created_on := sysdate;
     :new.created_by := v('USER');
  end if;
  if updating then
     :new.updated_on := sysdate;
     :new.updated_by := v('USER');
  end if;
  if :new.security_group_id is null then
     :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
  end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_FLASH_CHARTS_T1"
    before insert or update on wwv_flow_flash_charts
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        :new.updated_by := wwv_flow.g_user;
    end if;

    if :new.chart_xml is not null then
      wwv_flow_page_cache_api.lob_replace(
        p_lob  => :new.chart_xml,
        p_what => chr(13),
        p_with => null);
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress then
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_steps set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           flow_id = :new.flow_id and
           id = :new.page_id and
           security_group_id = :new.security_group_id;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_FLASH_CHART_SERIES_T1"
    before insert or update on wwv_flow_flash_chart_series
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        :new.updated_by := wwv_flow.g_user;
    end if;

    if :new.flow_id is null then
        for c1 in (select flow_id
                     from wwv_flow_flash_charts
                    where id = :new.chart_id) loop
            :new.flow_id := c1.flow_id;
            exit;
        end loop;
    end if;

    if :new.series_query is not null then
      wwv_flow_page_cache_api.lob_replace(
        p_lob  => :new.series_query,
        p_what => chr(13),
        p_with => null);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated flash chart, page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress then
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_flash_charts set
           updated_on = sysdate,
           updated_by = wwv_flow.g_user
        where
           flow_id = :new.flow_id and
           id = :new.chart_id and
           security_group_id = :new.security_group_id;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_FLASH_CHARTS_5_T1"
    before insert or update on wwv_flow_flash_charts_5
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        :new.updated_by := wwv_flow.g_user;
    end if;

    if :new.chart_xml is not null then
      wwv_flow_page_cache_api.lob_replace(
        p_lob  => :new.chart_xml,
        p_what => chr(13),
        p_with => null);
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress then
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_steps set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           flow_id = :new.flow_id and
           id = :new.page_id and
           security_group_id = :new.security_group_id;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_FLASH_5_SERIES_T1"
    before insert or update on wwv_flow_flash_chart5_series
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        :new.updated_by := wwv_flow.g_user;
    end if;

    if :new.flow_id is null then
        for c1 in (select flow_id
                     from wwv_flow_flash_charts_5
                    where id = :new.chart_id) loop
            :new.flow_id := c1.flow_id;
            exit;
        end loop;
    end if;

    if :new.series_query is not null then
      wwv_flow_page_cache_api.lob_replace(
        p_lob  => :new.series_query,
        p_what => chr(13),
        p_with => null);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated flash chart, page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress then
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_flash_charts_5 set
           updated_on = sysdate,
           updated_by = wwv_flow.g_user
        where
           flow_id = :new.flow_id and
           id = :new.chart_id and
           security_group_id = :new.security_group_id;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WORKSHEETS_T1"
    before insert or update on wwv_flow_worksheets
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;


    if inserting then
        if :new.internal_uid is null then
            :new.internal_uid := :new.id;
        end if;

        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating and not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;
    --
    -- set owner
    --
    if :new.owner is null then
        :new.owner := :new.created_by;
    end if;
    --
    -- set status
    --
    if :new.status is null then
        :new.status := 'AVAILABLE_FOR_OWNER';
    end if;
    --
    -- by default, reports show up as TABS
    --
    if inserting and :new.report_list_mode is null then
        :new.report_list_mode := 'TABS';
    end if;

    :new.SHOW_SELECT_COLUMNS       := nvl(:new.SHOW_SELECT_COLUMNS,'Y');
    :new.SHOW_ROWS_PER_PAGE        := nvl(:new.SHOW_ROWS_PER_PAGE,'Y');
    :new.SHOW_FILTER               := nvl(:new.SHOW_FILTER,'Y');
    :new.SHOW_CONTROL_BREAK        := nvl(:new.SHOW_CONTROL_BREAK,'Y');
    :new.SHOW_SORT                 := nvl(:new.SHOW_SORT,'Y');
    :new.SHOW_HIGHLIGHT            := nvl(:new.SHOW_HIGHLIGHT,'Y');
    :new.SHOW_AGGREGATE            := nvl(:new.SHOW_AGGREGATE,'Y');
    :new.SHOW_NOTIFY               := nvl(:new.SHOW_NOTIFY,'N');
    :new.SHOW_CHART                := nvl(:new.SHOW_CHART,'Y');
    :new.SHOW_GROUP_BY             := nvl(:new.SHOW_GROUP_BY,'Y');
    :new.SHOW_CALENDAR             := nvl(:new.SHOW_CALENDAR,'Y');
    :new.SHOW_FLASHBACK            := nvl(:new.SHOW_FLASHBACK,'Y');
    :new.SHOW_RESET                := nvl(:new.SHOW_RESET,'Y');
    :new.SHOW_DOWNLOAD             := nvl(:new.SHOW_DOWNLOAD,'Y');
    :new.SHOW_COMPUTATION          := nvl(:new.SHOW_COMPUTATION,'Y');
    :new.SHOW_HELP                 := nvl(:new.SHOW_HELP,'Y');
    :new.SHOW_DETAIL_LINK          := nvl(:new.SHOW_DETAIL_LINK,'Y');
    :new.ALLOW_REPORT_SAVING       := nvl(:new.ALLOW_REPORT_SAVING,'Y');
    :new.ALLOW_SAVE_RPT_PUBLIC     := nvl(:new.ALLOW_SAVE_RPT_PUBLIC,'N');
    :new.ALLOW_REPORT_CATEGORIES   := nvl(:new.ALLOW_REPORT_CATEGORIES,'Y');
    :new.ALLOW_EXCLUDE_NULL_VALUES := nvl(:new.ALLOW_EXCLUDE_NULL_VALUES,'Y');
    :new.ALLOW_HIDE_EXTRA_COLUMNS  := nvl(:new.ALLOW_HIDE_EXTRA_COLUMNS,'Y');

    :new.SHOW_FINDER_DROP_DOWN     := nvl(:new.SHOW_FINDER_DROP_DOWN,'Y');
    :new.SHOW_DISPLAY_ROW_COUNT    := nvl(:new.SHOW_DISPLAY_ROW_COUNT,'N');
    :new.SHOW_SEARCH_BAR           := nvl(:new.SHOW_SEARCH_BAR,'Y');
    :new.SHOW_SEARCH_TEXTBOX       := nvl(:new.SHOW_SEARCH_TEXTBOX,'Y');
    :new.SHOW_ACTIONS_MENU         := nvl(:new.SHOW_ACTIONS_MENU,'Y');

    --
    -- maintain column values
    --
    if :new.flow_id is null then
       :new.flow_id := wwv_flow.g_flow_id;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- last updated page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress and :new.flow_id != 4900 then
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_steps set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           flow_id = :new.flow_id and
           id = :new.page_id and
           security_group_id = :new.security_group_id;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WORKSHEETS_T2"
    before delete on wwv_flow_worksheets
begin
    wwv_flow_worksheet.g_delete_in_progress := true;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WORKSHEETS_T3"
    after delete on wwv_flow_worksheets
begin
    wwv_flow_worksheet.g_delete_in_progress := false;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_CATEGORIES_T1"
    before insert or update on wwv_flow_worksheet_categories
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
        :new.flow_id := nvl(wwv_flow.g_flow_id,0);

    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;
    --
    -- display sequence
    --
    if inserting and :new.display_sequence is null then
        select nvl(max(display_sequence),0) + 1 into :new.display_sequence
          from wwv_flow_worksheet_categories
         where worksheet_id = :new.worksheet_id;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_APPLICATIONS_T1"
    before insert or update on wwv_flow_ws_applications
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;
    --
    if :new.allow_public_access_yn is null then
        :new.allow_public_access_yn := 'N';
    end if;

    --
    -- set owner
    --
    if :new.owner is null then
        :new.owner := :new.created_by;
    end if;
    if inserting or :new.owner <> nvl(:old.owner, :new.owner) then
        for i in ( select min(case when schema = :new.owner then schema end) over () found_schema,
                          nvl (
                              min(case when is_apex$_schema = 'Y' then schema end) over (),
                              schema ) first_schema
                     from wwv_flow_company_schemas
                    where security_group_id = :new.security_group_id )
        loop
            if i.found_schema is null then
                wwv_flow_debug.trace (
                    'owner "%s" not found, reverting to "%s"',
                    :new.owner,
                    i.first_schema );
                :new.owner := i.first_schema;
            else
                wwv_flow_debug.trace (
                    'accepting owner change to "%s"',
                    i.found_schema );
                :new.owner := i.found_schema;
            end if;
            exit;
        end loop;
    end if;
    --
    -- set status
    --
    if :new.status is null then
        :new.status := 'AVAILABLE';
    end if;

    if :new.show_reset_passwd_yn is null then
        :new.show_reset_passwd_yn := 'Y';
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_APP_SO_T1"
    before insert or update on wwv_flow_ws_app_sug_objects
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    end if;

    if substr(:new.object_name,1,1) != '"' then
        :new.object_name := upper(:new.object_name);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- cascade update
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_ws_applications set
            updated_on = sysdate,
            updated_by = wwv_flow.g_user
        where
            id = :new.ws_app_id and
            security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_AUTH_SETUPS_T1"
    before insert or update on wwv_flow_ws_custom_auth_setups
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_WEBSHEET_ATTR_T1"
    before insert or update on wwv_flow_ws_websheet_attr
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        if :new.websheet_owner is null then
           :new.websheet_owner := nvl(wwv_flow.g_user,user);
        end if;
    end if;

    -- populate websheet alias
    if :new.websheet_alias is null then
        select wwv_seq.nextval
        into :new.websheet_alias
        from sys.dual;
    else
        :new.websheet_alias := upper(:new.websheet_alias);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    :new.updated_on := sysdate;
    :new.updated_by := nvl(wwv_flow.g_user,user);

    -- cascade update
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_ws_applications set
            updated_on = sysdate,
            updated_by = wwv_flow.g_user
        where
            id = :new.ws_app_id and
            security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_COL_GROUPS_T1"
    before insert or update on wwv_flow_worksheet_col_groups
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    --
    --
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;
    --
    --
    --
    if :new.display_sequence is null then
        :new.display_sequence := 10;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;
    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress then
        wwv_flow_audit.g_cascade := true;

        update wwv_flow_worksheets set
           updated_on = :new.updated_on,
           updated_by = :new.updated_by
        where
           id = :new.worksheet_id and
           security_group_id = :new.security_group_id;

        if :new.flow_id = 4900 then
            update wwv_flow_ws_websheet_attr set
                updated_on = sysdate,
                updated_by = wwv_flow.g_user
            where
                id = :new.websheet_id and
                security_group_id = :new.security_group_id;
        end if;

        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_LOVS_T1"
    before insert or update on wwv_flow_worksheet_lovs
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- update stamps
    --
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- Update parent timestamp.
    -- This table is used on for Websheet, so update wwv_flow_ws_websheet_attr.
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_ws_websheet_attr set
            updated_on = sysdate,
            updated_by = wwv_flow.g_user
        where
            id = :new.websheet_id and
            security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_LOV_ENTRIES_T1"
    before insert or update on wwv_flow_worksheet_lov_entries
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    --
    --
    if :new.display_sequence is null then
       :new.display_sequence := 10;
    end if;
    --
    -- update stamps
    --
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_worksheet_lovs
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.lov_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_COLUMNS_T1"
    before insert or update on wwv_flow_worksheet_columns
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;
    --
    -- default values
    --
    if :new.report_label is null then
        :new.report_label := :new.column_label;
    elsif :new.column_label is null then
        :new.column_label := :new.report_label;
    end if;

    if :new.is_sortable is null then
        :new.is_sortable := 'Y';
    end if;

    :new.allow_sorting      := nvl(:new.allow_sorting,'Y');
    :new.allow_filtering    := nvl(:new.allow_filtering,'Y');
    :new.allow_highlighting := nvl(:new.allow_highlighting,'Y');
    :new.allow_ctrl_breaks  := nvl(:new.allow_ctrl_breaks,'Y');
    :new.allow_aggregations := nvl(:new.allow_aggregations,'Y');
    :new.allow_computations := nvl(:new.allow_computations,'Y');
    :new.allow_charting     := nvl(:new.allow_charting,'Y');
    :new.allow_group_by     := nvl(:new.allow_group_by,'Y');
    :new.allow_hide         := nvl(:new.allow_hide,'Y');

    if :new.display_text_as is null then
        :new.display_text_as := 'ESCAPE_SC';
    end if;
    if :new.heading_alignment is null then
        :new.heading_alignment := 'CENTER';
    end if;
    if :new.column_alignment is null then
        :new.column_alignment := 'LEFT';
    end if;
    if :new.rpt_show_filter_lov is null then
        :new.rpt_show_filter_lov := 'D';
    end if;
    if :new.rpt_filter_date_ranges is null then
        :new.rpt_filter_date_ranges := 'ALL';
    end if;

    --
    -- security columns
    --
    if :new.others_may_edit is null then
       :new.others_may_edit := 'Y';
    end if;
    if :new.others_may_view is null then
       :new.others_may_view := 'Y';
    end if;

    -- maintain distinct_value_filter
    if :new.display_as = 'TEXTAREA' and :new.rpt_distinct_lov is null then
       :new.rpt_distinct_lov := 'N';
    elsif :new.rpt_distinct_lov is null then
       :new.rpt_distinct_lov := 'Y';
    end if;

    -- use for prototype to get next available col, alter logic later to fill gaps
    if inserting and :new.db_column_name is null then
        :new.db_column_name := wwv_flow_worksheet_standard.get_next_db_column_name(:new.worksheet_id, :new.column_type);
    end if;
    if inserting and :new.display_order is null then
        :new.display_order := wwv_flow_worksheet_standard.get_next_display_order_number(:new.worksheet_id);
    end if;
    if inserting and :new.column_identifier is null then
       :new.column_identifier := wwv_flow_worksheet_standard.get_next_identifier(:new.worksheet_id);
    end if;
    --
    -- sync column headings
    --
    if :new.sync_form_label is null then
       :new.sync_form_label := 'Y';
    end if;
    if :new.sync_form_label = 'Y' then
       :new.column_label := :new.report_label;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;
    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress and not wwv_flow_worksheet.g_delete_in_progress then
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_worksheets set
           updated_on = :new.updated_on,
           updated_by = :new.updated_by
        where
           id = :new.worksheet_id and
           security_group_id = :new.security_group_id;

        if :new.flow_id = 4900 then
            update wwv_flow_ws_websheet_attr set
                updated_on = sysdate,
                updated_by = wwv_flow.g_user
            where
                id = :new.websheet_id and
                security_group_id = :new.security_group_id;
        end if;

        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_RPTS_T1"
    before insert or update on wwv_flow_worksheet_rpts
    for each row
declare
    l_col_type varchar2(30);
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;
    if :new.application_user is null then
        :new.application_user := v('APP_USER');
    end if;
    if :new.status is null then
       :new.status := 'PRIVATE';
    end if;
    if :new.display_rows is null then
       :new.display_rows := 15;
    end if;
    if :new.flashback_enabled is null then
       :new.flashback_enabled := 'N';
    end if;
    if :new.report_seq is null then
       :new.report_seq := 10;
    end if;
    if :new.is_default is null then
        :new.is_default := 'N';
    end if;
    if :new.is_default = 'Y' and :new.status = 'PRIVATE' then
        :new.status := 'PUBLIC';
    end if;

    if :new.status = 'PRIVATE' then
        :new.report_alias := null;
    else
        -- populate report alias for base reports
        if :new.report_alias is null and :new.session_id is null then
            select wwv_seq.nextval
            into :new.report_alias
            from sys.dual;
        end if;
    end if;

    -- bug 10399772
    if :new.chart_aggregate = '0' then
        :new.chart_aggregate := null;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_CONDITIONS_T1"
    before insert or update on wwv_flow_worksheet_conditions
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.enabled is null then
        :new.enabled := 'Y';
    end if;
    if inserting and :new.allow_delete is null then
        :new.allow_delete := 'Y';
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    if not wwv_flow.g_import_in_progress then
        --
        -- update parent timestamp
        --
        update wwv_flow_worksheet_rpts
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.report_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_COMPUTATION_T1"
    before insert or update on wwv_flow_worksheet_computation
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;

    if :new.db_column_name is null then
        :new.db_column_name := wwv_flow_worksheet_standard.get_next_computed_column_name(:new.worksheet_id, :new.report_id);
    end if;

    if :new.column_identifier is null then
        :new.column_identifier := wwv_flow_worksheet_standard.get_next_computed_identifier(:new.worksheet_id, :new.report_id);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_worksheet_rpts
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.report_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_GROUP_BY_T1"
    before insert or update on wwv_flow_worksheet_group_by
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;

    if :new.function_01 is not null and :new.function_column_01 is not null then
        :new.function_db_column_name_01 := nvl(:new.function_db_column_name_01,'APXWS_GBFC_01');
    end if;
    if :new.function_02 is not null and :new.function_column_02 is not null then
        :new.function_db_column_name_02 := nvl(:new.function_db_column_name_02,'APXWS_GBFC_02');
    end if;
    if :new.function_03 is not null and :new.function_column_03 is not null then
        :new.function_db_column_name_03 := nvl(:new.function_db_column_name_03,'APXWS_GBFC_03');
    end if;
    if :new.function_04 is not null and :new.function_column_04 is not null then
        :new.function_db_column_name_04 := nvl(:new.function_db_column_name_04,'APXWS_GBFC_04');
    end if;
    if :new.function_05 is not null and :new.function_column_05 is not null then
        :new.function_db_column_name_05 := nvl(:new.function_db_column_name_05,'APXWS_GBFC_05');
    end if;
    if :new.function_06 is not null and :new.function_column_06 is not null then
        :new.function_db_column_name_06 := nvl(:new.function_db_column_name_06,'APXWS_GBFC_06');
    end if;
    if :new.function_07 is not null and :new.function_column_07 is not null then
        :new.function_db_column_name_07 := nvl(:new.function_db_column_name_07,'APXWS_GBFC_07');
    end if;
    if :new.function_08 is not null and :new.function_column_08 is not null then
        :new.function_db_column_name_08 := nvl(:new.function_db_column_name_08,'APXWS_GBFC_08');
    end if;
    if :new.function_09 is not null and :new.function_column_09 is not null then
        :new.function_db_column_name_09 := nvl(:new.function_db_column_name_09,'APXWS_GBFC_09');
    end if;
    if :new.function_10 is not null and :new.function_column_10 is not null then
        :new.function_db_column_name_10 := nvl(:new.function_db_column_name_10,'APXWS_GBFC_10');
    end if;
    if :new.function_11 is not null and :new.function_column_11 is not null then
        :new.function_db_column_name_11 := nvl(:new.function_db_column_name_11,'APXWS_GBFC_11');
    end if;
    if :new.function_12 is not null and :new.function_column_12 is not null then
        :new.function_db_column_name_12 := nvl(:new.function_db_column_name_12,'APXWS_GBFC_12');
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_worksheet_rpts
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.report_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WORKSHEET_NOTIFY_T1"
    before insert or update on wwv_flow_worksheet_notify
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;

    :new.updated_on := sysdate;
    :new.updated_by := nvl(wwv_flow.g_user,user);

    --
    -- set owner
    --
    if :new.owner is null then
        :new.owner := :new.created_by;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_worksheet_rpts
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.report_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_WEBPAGES_T1"
    before insert or update on wwv_flow_ws_webpages
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;
    :new.upper_name := upper(:new.name);

    -- populate page alias
    if :new.page_alias is null then
        select wwv_seq.nextval
        into :new.page_alias
        from sys.dual;
    else
        :new.page_alias := upper(:new.page_alias);
    end if;

    --
    -- set owner
    --
    if :new.owner is null then
        :new.owner := :new.created_by;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- cascade update
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_ws_applications set
            updated_on = sysdate,
            updated_by = wwv_flow.g_user
        where
            id = :new.ws_app_id and
            security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_COL_VAL_T1"
    before insert or update on wwv_flow_ws_col_validations
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;

    :new.updated_on := sysdate;
    :new.updated_by := nvl(wwv_flow.g_user,user);

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- cascade update
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_ws_websheet_attr set
            updated_on = sysdate,
            updated_by = wwv_flow.g_user
        where
            id = :new.websheet_id and
            ws_app_id = :new.ws_app_id and
            security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_DATA_GRID_Q_T1"
    before insert or update on wwv_flow_ws_data_grid_q
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;

    if :new.db_obj_found is null then
        :new.db_obj_found := 'N';
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_DICT_VIEWS_T1"
    before insert or update on wwv_flow_dictionary_views
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_ADV_CAT_T1"
    before insert or update on wwv_flow_advisor_categories
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_ADV_CHK_T1"
    before insert or update on wwv_flow_advisor_checks
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_ADV_CHK__MSG_T1"
    before insert or update on wwv_flow_advisor_check_msgs
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PLUGINS_T1"
    before insert or update on wwv_flow_plugins
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- set name
    :new.name := upper(:new.name);

    -- not set by "Create Plug-In" on 4000:4410 that's why we have to default it
    :new.substitute_attributes := nvl(:new.substitute_attributes, 'Y');

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- created / last updated
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        --
        update wwv_flows
           set last_updated_on = sysdate,
               last_updated_by = wwv_flow.g_user
         where id                = :new.flow_id
           and security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_PLUGIN_AUDIT"
    before insert or update or delete on wwv_flow_plugins
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PLUGINS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.display_name,:old.display_name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PLUGIN_ATTRIBUTES_T1"
    before insert or update on wwv_flow_plugin_attributes
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- delete values when it's no select list anymore
    if updating and :old.attribute_type = 'SELECT LIST' and :new.attribute_type <> 'SELECT LIST' then
        delete wwv_flow_plugin_attr_values
         where plugin_attribute_id = :old.id;
    end if;

    --
    -- created / last updated
    --
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        --
        update wwv_flow_plugins
           set last_updated_on = sysdate,
               last_updated_by = wwv_flow.g_user
         where id                = :new.plugin_id
           and security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_PLUGIN_ATTR_AUDIT"
    before insert or update or delete on wwv_flow_plugin_attributes
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PLUGIN_ATTRIBUTES',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.prompt,:old.prompt) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PLUGIN_ATTR_VALUES_T1"
    before insert or update on wwv_flow_plugin_attr_values
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- created / last updated
    --
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        --
        update wwv_flow_plugin_attributes
           set last_updated_on = sysdate,
               last_updated_by = wwv_flow.g_user
         where id                = :new.plugin_attribute_id
           and security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_PLUGIN_ATTRV_AUDI"
    before insert or update or delete on wwv_flow_plugin_attr_values
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PLUGIN_ATTR_VALUES',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.display_value,:old.display_value) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PLUGIN_FILES_T1"
    before insert or update on wwv_flow_plugin_files
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- created / last updated
    -- Note: always set change attributes so that the caching of files works
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := wwv_flow.g_user;
    end if;
    --
    :new.last_updated_on := sysdate;
    :new.last_updated_by := wwv_flow.g_user;
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_plugins
           set last_updated_on = sysdate,
               last_updated_by = wwv_flow.g_user
         where id                = :new.plugin_id
           and security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_PLUGIN_FILE_AUDIT"
    before insert or update or delete on wwv_flow_plugin_files
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PLUGIN_FILES',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.file_name,:old.file_name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PLUGIN_EVENTS_T1"
    before insert or update on wwv_flow_plugin_events
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    :new.name := lower(:new.name);
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- created / last updated
    -- Note: always set change attributes so that the caching of files works
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := wwv_flow.g_user;
    end if;
    --
    :new.last_updated_on := sysdate;
    :new.last_updated_by := wwv_flow.g_user;
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_plugins
           set last_updated_on = sysdate,
               last_updated_by = wwv_flow.g_user
         where id                = :new.plugin_id
           and security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_PLUGIN_EVNT_AUDIT"
    before insert or update or delete on wwv_flow_plugin_events
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PLUGIN_EVENTS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name,:old.name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PLUGIN_SETTINGS_T1"
    before insert or update on wwv_flow_plugin_settings
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- created / last updated
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
        --
        update wwv_flows
           set last_updated_on = sysdate,
               last_updated_by = wwv_flow.g_user
         where id                = :new.flow_id
           and security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_PLUGIN__SET_AUDIT"
    before insert or update or delete on wwv_flow_plugin_settings
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PLUGIN_SETTINGS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id,    :new.id),
           p_object_name => nvl(:new.plugin,:old.plugin) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_DA_STND_EVENTS_T1"
    before insert or update on wwv_flow_standard_events
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PAGE_DA_EVENTS_T1"
    before insert or update on wwv_flow_page_da_events
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if inserting then
        :new.CREATED_ON := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;

    --
    -- last updated page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress then
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_steps set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           flow_id = :new.flow_id and
           id = :new.page_id and
           security_group_id = :new.security_group_id;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_PAGE_DA_E_AUDIT"
    before insert or update or delete on wwv_flow_page_da_events
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PAGE_DA_EVENTS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name,:old.name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PAGE_DA_ACTIONS_T1"
    before insert or update on wwv_flow_page_da_actions
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if inserting then
        :new.CREATED_ON := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updates
    --
    if not wwv_flow.g_import_in_progress then
        -- for the wwv_flow_page_da_actions table
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
        -- for the parent wwv_flow_page_da_events table, we need to exclude when this trigger has fired as a result of
        -- a parent region being deleted. we can pick this up when affected_region_id is set to null and
        -- affected_elements_type is still REGION (as this can't be done directly in the ui)
        if :old.affected_region_id is not null and :new.affected_region_id is null and
           :old.affected_elements_type = 'REGION' and :new.affected_elements_type = 'REGION' then
            -- do nothing
            null;
        else
            -- update the parent
            wwv_flow_audit.g_cascade := true;
            update wwv_flow_page_da_events set
               last_updated_on = sysdate,
               last_updated_by = nvl(wwv_flow.g_user,user)
            where
               id = :new.event_id and
               security_group_id = :new.security_group_id;
            wwv_flow_audit.g_cascade := false;
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_PAGE_DA_A_AUDIT"
    before insert or update or delete on wwv_flow_page_da_actions
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name  => 'WWV_FLOW_PAGE_DA_ACTIONS',
           p_action      => l_action,
           p_table_pk    => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.action,:old.action) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WORKSPACE_SUMMARY_T1"
    before insert or update on wwv_flow_workspace_summary
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if inserting then
        :new.CREATED_ON := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LOAD_TABLES_T1"
    before insert or update on wwv_flow_load_tables
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,sys_context('USERENV','CURRENT_USER'));
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := nvl(wwv_flow.g_user,sys_context('USERENV','CURRENT_USER'));
        end if;
        update wwv_flows set
           last_updated_on = sysdate,
           last_updated_by = nvl(wwv_flow.g_user,sys_context('USERENV','CURRENT_USER'))
        where
           id = :new.flow_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LOAD_TABLES_AUDIT"
    before insert or update or delete on wwv_flow_load_tables
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                 when inserting then 'I'
                 when updating  then 'U'
                 else                'D'
               end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_LOAD_TABLES',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.name,:old.name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LOADTAB_LOOKUPS_T1"
    before insert or update on wwv_flow_load_table_lookups
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,sys_context('USERENV','CURRENT_USER'));
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := nvl(wwv_flow.g_user,sys_context('USERENV','CURRENT_USER'));
        end if;
        update wwv_flow_load_tables set
           last_updated_on = sysdate,
           last_updated_by = nvl(wwv_flow.g_user,sys_context('USERENV','CURRENT_USER'))
        where
           id = :new.load_table_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LD_TAB_LOOKUPS_AUDIT"
    before insert or update or delete on wwv_flow_load_table_lookups
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                 when inserting then 'I'
                 when updating  then 'U'
                 else                'D'
               end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_LOAD_TABLE_LOOKUPS',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.load_column_name,:old.load_column_name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LOADTAB_RULES_T1"
    before insert or update on wwv_flow_load_table_rules
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,sys_context('USERENV','CURRENT_USER'));
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := nvl(wwv_flow.g_user,sys_context('USERENV','CURRENT_USER'));
        end if;
        update wwv_flow_load_tables set
           last_updated_on = sysdate,
           last_updated_by = nvl(wwv_flow.g_user,sys_context('USERENV','CURRENT_USER'))
        where
           id = :new.load_table_id and
           security_group_id = :new.security_group_id;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LD_TAB_RULES_AUDIT"
    before insert or update or delete on wwv_flow_load_table_rules
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                 when inserting then 'I'
                 when updating  then 'U'
                 else                'D'
               end;
    begin
        wwv_flow_audit.audit_action (
           p_table_name => 'WWV_FLOW_LOAD_TABLE_RULES',
           p_action     => l_action,
           p_table_pk   => nvl(:old.id, :new.id),
           p_object_name => nvl(:new.load_column_name,:old.load_column_name) );
    exception when others then null;
    end;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_FEEDBACK_T1"
before insert or update on wwv_flow_feedback
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        if nvl(:new.APPLICATION_ID,0) >= 4000 and nvl(:new.application_id,0) <= 4999 then
           :new.security_group_id := 10;
        else
           :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
        end if;
    end if;

    if :new.logging_security_group_id is null then
       :new.logging_security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    if :new.logged_by_workspace_name is null then
       for c1 in (select short_name from WWV_FLOW_COMPANIES where PROVISIONING_COMPANY_ID = :new.logging_security_group_id) loop
           :new.logged_by_workspace_name := c1.short_name;
       end loop;
    end if;

    if inserting and not wwv_flow.g_import_in_progress then
       :new.created_by := coalesce(:new.created_by, wwv_flow.g_user, user);
       :new.created_on := coalesce(:new.created_on, current_timestamp);
       :new.updated_by := coalesce(:new.updated_by, wwv_flow.g_user, user);
       :new.updated_on := coalesce(:new.updated_on, current_timestamp);
    elsif updating and not wwv_flow.g_import_in_progress then
       :new.updated_by := coalesce(wwv_flow.g_user, user);
       :new.updated_on := current_timestamp;
    end if;

    -- set feedback ID
	if :new.feedback_id is null and inserting and :new.application_id is not null then
	    select nvl(max(feedback_id),0) + 1 into :new.feedback_id
	    from wwv_flow_feedback
	    where security_group_id = (select security_group_id from wwv_flows where id = :new.application_id);
	end if;
	--
	-- TAG
	--
	wwv_flow_utilities.wwv_flow_team_tag_sync (
	       p_component_type    => 'FEEDBACK',
	       p_component_id      => :new.id,
	       p_new_tags          => rtrim(trim(:new.TAGS),','),
	       p_security_group_id => :new.security_group_id);

end wwv_flow_feedback_t1;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_FEEDBACK_T2"
after delete on wwv_flow_feedback
for each row
begin
    if wwv_flow.g_workspace_delete_in_progress = FALSE then
	      delete from wwv_flow_team_tags where component_id = :old.id;
	  end if;
end wwv_flow_feedback_t2;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_FEEDBACK_FUP_T1"
before insert or update on wwv_flow_feedback_followup
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if inserting and not wwv_flow.g_import_in_progress then
       :new.created_by := coalesce(:new.created_by, wwv_flow.g_user, user);
       :new.created_on := coalesce(:new.created_on, current_timestamp);
       :new.updated_by := coalesce(:new.updated_by, wwv_flow.g_user, user);
       :new.updated_on := coalesce(:new.updated_on, current_timestamp);
    elsif updating and not wwv_flow.g_import_in_progress then
       :new.updated_by := coalesce(wwv_flow.g_user, user);
       :new.updated_on := current_timestamp;
    end if;
end wwv_flow_feedback_fup_t1;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_TEAM_TAGS_T1"
before insert or update on wwv_flow_team_tags
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    :new.tag := upper(:new.tag);
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end wwv_flow_team_tags_t1;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_PURGE_WORKSPACES_TRG1"
    before insert or update on wwv_purge_workspaces
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
        end if;
        --
        if :new.status is null then
            :new.status := 'NEW';
        end if;
        --
        :new.created_ts := systimestamp;
        :new.updated_ts := :new.created_ts;
    else
        :new.updated_ts := systimestamp;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_PURGE_LOG_TRG1"
    before insert on wwv_purge_log
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    :new.created_ts := systimestamp;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_PURGE_EMAILS_TRG1"
    before insert on wwv_purge_emails
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    :new.created_ts := systimestamp;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_PURGE_WORKSPACE_RESP_TRG1"
    before insert on wwv_purge_workspace_responses
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    :new.created_ts := systimestamp;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_PURGE_DATAFILES_TRG1"
    before insert on wwv_purge_datafiles
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    :new.created_ts := systimestamp;
    if :new.status is null then
        :new.status := 'NOT_EVAL';
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_PURGE_SCHEMAS_TRG1"
    before insert on wwv_purge_schemas
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    :new.created_ts := systimestamp;
    if :new.status is null then
        :new.status := 'NOT_EVAL';
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_AUTHORIZED_URLS_T1"
    before insert or update on wwv_flow_authorized_urls
    for each row
begin
    -- normalize the case of the entire URL
    :new.url := trim(lower(:new.url));
    if :new.url is not null then
        :new.url_md5 := sys.utl_raw.cast_to_raw(sys.dbms_obfuscation_toolkit.md5( input_string => :new.url ));
    end if;

    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.last_updated_on := :new.created_on;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if updating then
        :new.last_updated_on := sysdate;
    end if;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_AUTO_FILE_DEL_LOG_T1"
    before insert on wwv_flow_auto_file_delete_log
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    :new.deleted_on := sysdate;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PKG_APP_CATS_BIU"
   before insert or update on wwv_flow_pkg_app_categories
   for each row
begin
   if :new.id is null then
      :new.id := wwv_flow_id.next_val;
   end if;
   if inserting then
      :new.created            := sysdate;
      :new.created_by         := lower(nvl(wwv_flow.g_user,user));
      :new.updated            := sysdate;
      :new.updated_by         := lower(nvl(wwv_flow.g_user,user));
   end if;
   if inserting or updating then
      :new.updated    := sysdate;
      :new.updated_by := lower(nvl(wwv_flow.g_user,user));
   end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PKG_APP_BIU"
   before insert or update on wwv_flow_pkg_applications
   for each row
begin
   if :new.id is null then
      :new.id := wwv_flow_id.next_val;
   end if;
   if inserting then
      :new.created            := sysdate;
      :new.created_by         := lower(nvl(wwv_flow.g_user,user));
      :new.updated            := sysdate;
      :new.updated_by         := lower(nvl(wwv_flow.g_user,user));
   end if;
   if inserting or updating then
      :new.updated    := sysdate;
      :new.updated_by := lower(nvl(wwv_flow.g_user,user));
   end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PKG_APP_IMAGES_BIU"
   before insert or update on wwv_flow_pkg_app_images
   for each row
begin
   if :new.id is null then
      :new.id := wwv_flow_id.next_val;
   end if;
   if inserting then
      :new.created            := sysdate;
      :new.created_by         := lower(nvl(wwv_flow.g_user,user));
      :new.updated            := sysdate;
      :new.updated_by         := lower(nvl(wwv_flow.g_user,user));
   end if;
   if inserting or updating then
      :new.updated    := sysdate;
      :new.updated_by := lower(nvl(wwv_flow.g_user,user));
   end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PKG_APP_MAP_BIU"
   before insert or update on wwv_flow_pkg_app_map
   for each row
begin
   if :new.id is null then
      :new.id := wwv_flow_id.next_val;
   end if;
   if inserting then
      :new.created            := sysdate;
      :new.created_by         := lower(nvl(wwv_flow.g_user,user));
      :new.updated            := sysdate;
      :new.updated_by         := lower(nvl(wwv_flow.g_user,user));
   end if;
   if inserting or updating then
      :new.updated    := sysdate;
      :new.updated_by := lower(nvl(wwv_flow.g_user,user));
   end if;
   if :new.security_group_id is null then
      :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
   end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PKG_APP_INST_LOG_T1"
    before insert or update on wwv_flow_pkg_app_install_log
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.log_seq is null then
            select nvl(max(log_seq),0) + 1 into :new.log_seq
            from wwv_flow_pkg_app_install_log
            where app_id = :new.app_id
            and batch_key = :new.batch_key;
        end if;

        :new.started := localtimestamp;
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;

    :new.updated_on := sysdate;
    :new.updated_by := nvl(wwv_flow.g_user,user);

    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."BIU_WWV_FLOW_RT$PRIVILEGES"
    before insert or update on wwv_flow_rt$privileges
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
       if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."BIU_WWV_FLOW_RT$PRIV_GROUPS"
    before insert or update on wwv_flow_rt$privilege_groups
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."BIU_WWV_FLOW_RT$MODULES"
    before insert or update on wwv_flow_rt$modules
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    -- defaults
    if :new.status is null then
       :new.status := 'NOT_PUBLISHED';
    end if;
    if :new.items_per_page is null then
       :new.items_per_page := 25;
    end if;
    --
    -- verify schema (and possibly revert to first provisioned schema) when
    -- * no parsing_schema given
    -- * parsing schema is '!USER_SCHEMA' but workspace is not 10
    -- * parsing schema is neither '!USER_SCHEMA' nor the old parsing schema
    --
    if     :new.parsing_schema is null
        or (:new.parsing_schema = '!USER_SCHEMA' and :new.security_group_id <> 10)
        or :new.parsing_schema not in ('!USER_SCHEMA', nvl(:old.parsing_schema, :new.parsing_schema))
    then
        --
        -- query workspace schemas for the given parsing schema. found_schema
        -- contains :new.parsing_schema if :new.parsing_schema is a workspace
        -- schema. otherwise, parsing_schema will be set to
        -- first_schema_provisioned.
        --
        for i in ( select min(case when s.schema = :new.parsing_schema then s.schema end) over () found_schema,
                          c.first_schema_provisioned
                     from wwv_flow_company_schemas s,
                          wwv_flow_companies c
                    where s.security_group_id       = c.provisioning_company_id
                      and c.provisioning_company_id = :new.security_group_id )
        loop
            if i.found_schema is null then
                wwv_flow_debug.trace (
                    'parsing schema "%s" not found, reverting to "%s"',
                    :new.parsing_schema,
                    i.first_schema_provisioned );
                :new.parsing_schema := i.first_schema_provisioned;
            else
                wwv_flow_debug.trace (
                    'accepting parsing_schema change to "%s"',
                    i.found_schema );
            end if;
            exit;
        end loop;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."BIU_WWV_FLOW_RT$TEMPLATES"
    before insert or update on wwv_flow_rt$templates
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- defaults
    --
    if :new.priority is null then
       :new.priority := 1;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."BIU_WWV_FLOW_RT$HANDLERS"
    before insert or update on wwv_flow_rt$handlers
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."BIU_WWV_FLOW_RT$PARAMETERS"
    before insert or update on wwv_flow_rt$parameters
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."BIU_WWV_FLOW_RT$CLIENTS"
    before insert on wwv_flow_rt$clients
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."BIU_WWV_FLOW_RT$CLIENT_PRIVS"
    before insert or update on wwv_flow_rt$client_privileges
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."BIU_WWV_FLOW_RT$APPROVALS"
    before insert or update on wwv_flow_rt$approvals
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."BIU_WWV_FLOW_RT$PEND_APPROVALS"
    before insert or update on wwv_flow_rt$pending_approvals
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."BIU_WWV_FLOW_RT$APPROVAL_PRIVS"
    before insert or update on wwv_flow_rt$approval_privs
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."BIU_WWV_FLOW_RT$USER_SESSIONS"
    before insert or update on wwv_flow_rt$user_sessions
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        if :new.updated_by is null then
            :new.updated_by := wwv_flow_security.g_user;
        end if;
        if inserting then
            :new.created_on := sysdate;
            if :new.created_by is null then
                :new.created_by := nvl(wwv_flow_security.g_user,user);
            end if;
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_PROV_COMP_SMOD"
    before insert or update on wwv_flow_provision_serice_mod
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.requested_on := sysdate;
        :new.requested_by := wwv_flow.g_user;
    end if;
    if updating then
        :new.last_status_change_on := sysdate;
        :new.last_status_change_by := wwv_flow.g_user;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting then
         wwv_flow_fnd_developer_api.admin_notify_change_request(
             p_workspace_id   => :new.security_group_id,
             p_admin_userid   => :new.requested_by );
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PROV_SIGNUP_Q_TRIG"
    before insert or update on wwv_flow_prov_signup_q
    for each row
begin
    if inserting and :new.id is null then
       :new.id := 1;
    elsif inserting and :new.id != 1 then
       RAISE_APPLICATION_ERROR(-20000,'Only valid PK for table wwv_flow_prov_signup_q is 1');
    end if;

    if user <> 'SYS' then
        :new.updated := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
        if inserting then
           :new.created := sysdate;
           :new.created_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_PROV_COMPANY"
    before insert or update on wwv_flow_provision_company
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting and :new.admin_id is null then
        :new.admin_id := wwv_flow_id.next_val;
    end if;
    if inserting and :new.security_group_id is null then
        :new.security_group_id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.request_date := sysdate;
    end if;
    :new.company_name := upper(:new.company_name);
    :new.admin_userid := upper(:new.admin_userid);
    :new.schema_name  := upper(:new.schema_name);

    if inserting then
         wwv_flow_fnd_developer_api.admin_notify_new_request(
             p_workspace_name => :new.company_name,
             p_schema_name    => :new.schema_name,
             p_admin_userid   => :new.admin_userid,
             p_admin_email    => :new.admin_email );
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_PROV_AGREE_TRIG"
    before insert or update on wwv_flow_provision_agreement
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if user <> 'SYS' then
        :new.updated := sysdate;
        :new.updated_by := nvl(wwv_flow.g_user,user);
        if inserting then
           :new.created := sysdate;
           :new.created_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_DATA_LOAD_UNLOAD"
    before insert or update on wwv_flow_data_load_unload
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_FLOW_DATA_LOAD_BAD_LOG"
    before insert or update on wwv_flow_data_load_bad_log
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."APEX$_ACL_T1"
before insert or update on "APEX$_ACL"
for each row
begin
    --
    -- maintain pk and timestamps
    --
    :new.username := upper(:new.username);
    if inserting and :new.id is null then
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from sys.dual;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(v('APP_USER'),user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."APEX$_WS_WEBPG_SECTIONS_T1"
before insert or update on "APEX$_WS_WEBPG_SECTIONS"
for each row
declare
    l_sequence_changed varchar2(1) := 'N';
    l_title_changed varchar2(1) := 'N';
    l_content_changed varchar2(1) := 'N';
    procedure clob_upper( p_content in clob, p_content_upper in out nocopy clob)
    is
    l_buf varchar2(32767);
    l_off number;
    l_amt number;
    begin
    if p_content is not null then
        l_amt := 8000;
        l_off := 1;
         sys.dbms_lob.trim( p_content_upper, 0);
         begin
             loop
                 sys.dbms_lob.read( p_content, l_amt, l_off, l_buf );
                 l_buf := upper( l_buf );
                 sys.dbms_lob.writeappend( p_content_upper, length(l_buf), l_buf);
                 l_off := l_off + l_amt;
                 l_amt := 8000;
             end loop;
         exception
             when no_data_found then null;
         end;
     end if;
end clob_upper;
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from sys.dual;
    end if;
    if :new.section_type = 'NAV_PAGE' then
        if :new.nav_include_link is null then
            :new.nav_include_link := 'Y';
        end if;
    end if;
    if inserting and :new.content is not null then
        sys.dbms_lob.createtemporary( :new.content_upper, false, sys.dbms_lob.call );
        clob_upper( :new.content, :new.content_upper );
    elsif updating then
        if :new.content_upper is null then
            sys.dbms_lob.createtemporary( :new.content_upper, false, sys.dbms_lob.call );
        end if;
        clob_upper( :new.content, :new.content_upper );
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(v('APP_USER'),user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
        :new.change_count := 0;
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
        :new.change_count := nvl(:old.change_count,0) + 1;
        if nvl(:old.display_sequence,-999) != nvl(:new.display_sequence,-999) then
            l_sequence_changed := 'Y';
        end if;
        if nvl(:old.title,'jKKwZk') != nvl(:new.title,'jKKwZk') then
            l_title_changed := 'Y';
        end if;
        if sys.dbms_lob.compare(:new.content,:old.content) != 0 or nvl(length(:new.content),0) != nvl(length(:old.content),0) then
            l_content_changed := 'Y';
        end if;
        if l_sequence_changed = 'Y' or l_title_changed = 'Y' or l_content_changed = 'Y' then
            insert into apex$_ws_webpg_section_history (section_id, ws_app_id, webpage_id, old_display_sequence, new_display_sequence,
            old_title, new_title, old_content, new_content, change_date, application_user_id)
            values (:new.id, :new.ws_app_id, :new.webpage_id,
                    decode(l_sequence_changed,'Y',:old.display_sequence,null), decode(l_sequence_changed,'Y',:new.display_sequence,null),
                    decode(l_title_changed,'Y',:old.title,null), decode(l_title_changed,'Y',:new.title,null),
                    decode(l_content_changed,'Y',:old.content,null), decode(l_content_changed,'Y',:new.content,null), sysdate, nvl(v('APP_USER'),user));
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."APEX$_WS_ROWS_T1"
before insert or update on "APEX$_WS_ROWS"
for each row
declare
    l_tag_list apex_application_global.vc_arr2;
    type col_arr is table of varchar2(32767) index by varchar2(255);
    la_col_label col_arr;
    procedure datagrid_logging(
        p_row_id       in number,
        p_ws_app_id    in number,
        p_data_grid_id in number,
        p_col_name     in varchar2,
        p_type         in varchar2,
        p_old_c        in varchar2 default null,
        p_new_c        in varchar2 default null,
        p_old_d        in date default null,
        p_new_d        in date default null,
        p_old_n        in number default null,
        p_new_n        in number default null)
    is
    begin
        case p_type
        when 'C' then
          if (p_old_c is null and p_new_c is not null) or (p_old_c is not null and p_new_c is null) or (p_old_c != p_new_c) then
              insert into apex$_ws_history (row_id, ws_app_id, data_grid_id, column_name, old_value, new_value, change_date, application_user_id)
              values (p_row_id, p_ws_app_id, p_data_grid_id, p_col_name, p_old_c, p_new_c, sysdate, nvl(v('APP_USER'),user));
          end if;
        when 'D' then
          if (p_old_d is null and p_new_d is not null) or (p_old_d is not null and p_new_d is null) or (p_old_d != p_new_d) then
              insert into apex$_ws_history (row_id, ws_app_id, data_grid_id, column_name, old_value,  new_value, change_date, application_user_id)
              values (p_row_id, p_ws_app_id, p_data_grid_id, p_col_name, p_old_d, p_new_d, sysdate, nvl(v('APP_USER'),user));
        	  end if;
        when 'N' then
          if (p_old_n is null and p_new_n is not null) or (p_old_n is not null and p_new_n is null) or (p_old_n != p_new_n) then
              insert into apex$_ws_history (row_id, ws_app_id, data_grid_id, column_name, old_value,  new_value, change_date, application_user_id)
              values (p_row_id, p_ws_app_id, p_data_grid_id, p_col_name, p_old_n, p_new_n, sysdate, nvl(v('APP_USER'),user));
          end if;
        end case;
    end datagrid_logging;
    procedure wa( p_c in out nocopy clob, p_buf in varchar2 )
    is
    l_lf varchar2(2) := unistr('\000a');
    begin
    if p_buf is not null then sys.dbms_lob.writeappend( p_c, length(p_buf||l_lf), upper(p_buf)||l_lf); end if;
    end wa;
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from sys.dual;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(v('APP_USER'),user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.load_order from sys.dual;
        :new.change_count := 0;
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
        :new.change_count := :old.change_count + 1;
    end if;
    --
    -- inserting remove chr 13
    --
    if instr(:new.c001,chr(13)) > 0 then :new.c001 := replace(:new.c001,chr(13),null); end if;
    if instr(:new.c002,chr(13)) > 0 then :new.c002 := replace(:new.c002,chr(13),null); end if;
    if instr(:new.c003,chr(13)) > 0 then :new.c003 := replace(:new.c003,chr(13),null); end if;
    if instr(:new.c004,chr(13)) > 0 then :new.c004 := replace(:new.c004,chr(13),null); end if;
    if instr(:new.c005,chr(13)) > 0 then :new.c005 := replace(:new.c005,chr(13),null); end if;
    if instr(:new.c006,chr(13)) > 0 then :new.c006 := replace(:new.c006,chr(13),null); end if;
    if instr(:new.c007,chr(13)) > 0 then :new.c007 := replace(:new.c007,chr(13),null); end if;
    if instr(:new.c008,chr(13)) > 0 then :new.c008 := replace(:new.c008,chr(13),null); end if;
    if instr(:new.c009,chr(13)) > 0 then :new.c009 := replace(:new.c009,chr(13),null); end if;
    if instr(:new.c010,chr(13)) > 0 then :new.c010 := replace(:new.c010,chr(13),null); end if;
    if instr(:new.c011,chr(13)) > 0 then :new.c011 := replace(:new.c011,chr(13),null); end if;
    if instr(:new.c012,chr(13)) > 0 then :new.c012 := replace(:new.c012,chr(13),null); end if;
    if instr(:new.c013,chr(13)) > 0 then :new.c013 := replace(:new.c013,chr(13),null); end if;
    if instr(:new.c014,chr(13)) > 0 then :new.c014 := replace(:new.c014,chr(13),null); end if;
    if instr(:new.c015,chr(13)) > 0 then :new.c015 := replace(:new.c015,chr(13),null); end if;
    if instr(:new.c016,chr(13)) > 0 then :new.c016 := replace(:new.c016,chr(13),null); end if;
    if instr(:new.c017,chr(13)) > 0 then :new.c017 := replace(:new.c017,chr(13),null); end if;
    if instr(:new.c018,chr(13)) > 0 then :new.c018 := replace(:new.c018,chr(13),null); end if;
    if instr(:new.c019,chr(13)) > 0 then :new.c019 := replace(:new.c019,chr(13),null); end if;
    if instr(:new.c020,chr(13)) > 0 then :new.c020 := replace(:new.c010,chr(23),null); end if;
    if instr(:new.c021,chr(13)) > 0 then :new.c021 := replace(:new.c001,chr(23),null); end if;
    if instr(:new.c022,chr(13)) > 0 then :new.c022 := replace(:new.c002,chr(23),null); end if;
    if instr(:new.c023,chr(13)) > 0 then :new.c023 := replace(:new.c003,chr(23),null); end if;
    if instr(:new.c024,chr(13)) > 0 then :new.c024 := replace(:new.c004,chr(23),null); end if;
    if instr(:new.c025,chr(13)) > 0 then :new.c025 := replace(:new.c005,chr(23),null); end if;
    if instr(:new.c026,chr(13)) > 0 then :new.c026 := replace(:new.c006,chr(23),null); end if;
    if instr(:new.c027,chr(13)) > 0 then :new.c027 := replace(:new.c007,chr(23),null); end if;
    if instr(:new.c028,chr(13)) > 0 then :new.c028 := replace(:new.c008,chr(23),null); end if;
    if instr(:new.c029,chr(13)) > 0 then :new.c029 := replace(:new.c009,chr(23),null); end if;
    if instr(:new.c030,chr(13)) > 0 then :new.c030 := replace(:new.c030,chr(13),null); end if;
    if instr(:new.c031,chr(13)) > 0 then :new.c031 := replace(:new.c031,chr(13),null); end if;
    if instr(:new.c032,chr(13)) > 0 then :new.c032 := replace(:new.c032,chr(13),null); end if;
    if instr(:new.c033,chr(13)) > 0 then :new.c033 := replace(:new.c033,chr(13),null); end if;
    if instr(:new.c034,chr(13)) > 0 then :new.c034 := replace(:new.c034,chr(13),null); end if;
    if instr(:new.c035,chr(13)) > 0 then :new.c035 := replace(:new.c035,chr(13),null); end if;
    if instr(:new.c036,chr(13)) > 0 then :new.c036 := replace(:new.c036,chr(13),null); end if;
    if instr(:new.c037,chr(13)) > 0 then :new.c037 := replace(:new.c037,chr(13),null); end if;
    if instr(:new.c038,chr(13)) > 0 then :new.c038 := replace(:new.c038,chr(13),null); end if;
    if instr(:new.c039,chr(13)) > 0 then :new.c039 := replace(:new.c039,chr(13),null); end if;
    if instr(:new.c040,chr(13)) > 0 then :new.c040 := replace(:new.c040,chr(13),null); end if;
    if instr(:new.c041,chr(13)) > 0 then :new.c041 := replace(:new.c041,chr(13),null); end if;
    if instr(:new.c042,chr(13)) > 0 then :new.c042 := replace(:new.c042,chr(13),null); end if;
    if instr(:new.c043,chr(13)) > 0 then :new.c043 := replace(:new.c043,chr(13),null); end if;
    if instr(:new.c044,chr(13)) > 0 then :new.c044 := replace(:new.c044,chr(13),null); end if;
    if instr(:new.c045,chr(13)) > 0 then :new.c045 := replace(:new.c045,chr(13),null); end if;
    if instr(:new.c046,chr(13)) > 0 then :new.c046 := replace(:new.c046,chr(13),null); end if;
    if instr(:new.c047,chr(13)) > 0 then :new.c047 := replace(:new.c047,chr(13),null); end if;
    if instr(:new.c048,chr(13)) > 0 then :new.c048 := replace(:new.c048,chr(13),null); end if;
    if instr(:new.c049,chr(13)) > 0 then :new.c049 := replace(:new.c049,chr(13),null); end if;
    if instr(:new.c050,chr(13)) > 0 then :new.c050 := replace(:new.c050,chr(13),null); end if;
    if :new.search_clob is null then
        sys.dbms_lob.createtemporary( :new.search_clob, false, sys.dbms_lob.session );
    else
        sys.dbms_lob.trim( :new.search_clob, 0 );
    end if;
    wa(:new.search_clob,:new.c001);wa(:new.search_clob,:new.c002);wa(:new.search_clob,:new.c003);
    wa(:new.search_clob,:new.c004);wa(:new.search_clob,:new.c005);wa(:new.search_clob,:new.c006);
    wa(:new.search_clob,:new.c007);wa(:new.search_clob,:new.c008);wa(:new.search_clob,:new.c009);
    wa(:new.search_clob,:new.c010);wa(:new.search_clob,:new.c011);wa(:new.search_clob,:new.c012);
    wa(:new.search_clob,:new.c013);wa(:new.search_clob,:new.c014);wa(:new.search_clob,:new.c015);
    wa(:new.search_clob,:new.c016);wa(:new.search_clob,:new.c017);wa(:new.search_clob,:new.c018);
    wa(:new.search_clob,:new.c019);wa(:new.search_clob,:new.c020);wa(:new.search_clob,:new.c021);
    wa(:new.search_clob,:new.c022);wa(:new.search_clob,:new.c023);wa(:new.search_clob,:new.c024);
    wa(:new.search_clob,:new.c025);wa(:new.search_clob,:new.c026);wa(:new.search_clob,:new.c027);
    wa(:new.search_clob,:new.c028);wa(:new.search_clob,:new.c029);wa(:new.search_clob,:new.c030);
    wa(:new.search_clob,:new.c031);wa(:new.search_clob,:new.c032);wa(:new.search_clob,:new.c033);
    wa(:new.search_clob,:new.c034);wa(:new.search_clob,:new.c035);wa(:new.search_clob,:new.c036);
    wa(:new.search_clob,:new.c037);wa(:new.search_clob,:new.c038);wa(:new.search_clob,:new.c039);
    wa(:new.search_clob,:new.c040);wa(:new.search_clob,:new.c041);wa(:new.search_clob,:new.c042);
    wa(:new.search_clob,:new.c043);wa(:new.search_clob,:new.c044);wa(:new.search_clob,:new.c045);
    wa(:new.search_clob,:new.c046);wa(:new.search_clob,:new.c047);wa(:new.search_clob,:new.c048);
    wa(:new.search_clob,:new.c049);wa(:new.search_clob,:new.c050);
    --
    -- history
    --
    if updating then
       -- initialize column label array
       for i in 1..50
       loop
           la_col_label('C'||to_char(i,'FM009')) := null;
           la_col_label('N'||to_char(i,'FM009')) := null;
           la_col_label('D'||to_char(i,'FM009')) := null;
       end loop;
       -- get column label array
       for c1 in (select column_alias, report_label
                  from apex_ws_data_grid_col
                  where data_grid_id = :new.data_grid_id)
       loop
           la_col_label(c1.column_alias) := c1.report_label;
       end loop;
       -- strings
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C001'),'C',:old.c001,:new.c001);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C002'),'C',:old.c002,:new.c002);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C003'),'C',:old.c003,:new.c003);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C004'),'C',:old.c004,:new.c004);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C005'),'C',:old.c005,:new.c005);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C006'),'C',:old.c006,:new.c006);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C007'),'C',:old.c007,:new.c007);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C008'),'C',:old.c008,:new.c008);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C009'),'C',:old.c009,:new.c009);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C010'),'C',:old.c010,:new.c010);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C011'),'C',:old.c011,:new.c011);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C012'),'C',:old.c012,:new.c012);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C013'),'C',:old.c013,:new.c013);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C014'),'C',:old.c014,:new.c014);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C015'),'C',:old.c015,:new.c015);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C016'),'C',:old.c016,:new.c016);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C017'),'C',:old.c017,:new.c017);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C018'),'C',:old.c018,:new.c018);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C019'),'C',:old.c019,:new.c019);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C020'),'C',:old.c020,:new.c020);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C021'),'C',:old.c021,:new.c021);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C022'),'C',:old.c022,:new.c022);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C023'),'C',:old.c023,:new.c023);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C024'),'C',:old.c024,:new.c024);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C025'),'C',:old.c025,:new.c025);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C026'),'C',:old.c026,:new.c026);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C027'),'C',:old.c027,:new.c027);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C028'),'C',:old.c028,:new.c028);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C029'),'C',:old.c029,:new.c029);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C030'),'C',:old.c030,:new.c030);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C031'),'C',:old.c031,:new.c031);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C032'),'C',:old.c032,:new.c032);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C033'),'C',:old.c033,:new.c033);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C034'),'C',:old.c034,:new.c034);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C035'),'C',:old.c035,:new.c035);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C036'),'C',:old.c036,:new.c036);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C037'),'C',:old.c037,:new.c037);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C038'),'C',:old.c038,:new.c038);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C039'),'C',:old.c039,:new.c039);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C040'),'C',:old.c040,:new.c040);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C041'),'C',:old.c041,:new.c041);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C042'),'C',:old.c042,:new.c042);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C043'),'C',:old.c043,:new.c043);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C044'),'C',:old.c044,:new.c044);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C045'),'C',:old.c045,:new.c045);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C046'),'C',:old.c046,:new.c046);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C047'),'C',:old.c047,:new.c047);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C048'),'C',:old.c048,:new.c048);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C049'),'C',:old.c049,:new.c049);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C050'),'C',:old.c050,:new.c050);
       -- numbers
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N001'),'N',null,null,null,null,:old.n001,:new.n001);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N002'),'N',null,null,null,null,:old.n002,:new.n002);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N003'),'N',null,null,null,null,:old.n003,:new.n003);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N004'),'N',null,null,null,null,:old.n004,:new.n004);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N005'),'N',null,null,null,null,:old.n005,:new.n005);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N006'),'N',null,null,null,null,:old.n006,:new.n006);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N007'),'N',null,null,null,null,:old.n007,:new.n007);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N008'),'N',null,null,null,null,:old.n008,:new.n008);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N009'),'N',null,null,null,null,:old.n009,:new.n009);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N010'),'N',null,null,null,null,:old.n010,:new.n010);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N011'),'N',null,null,null,null,:old.n011,:new.n011);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N012'),'N',null,null,null,null,:old.n012,:new.n012);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N013'),'N',null,null,null,null,:old.n013,:new.n013);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N014'),'N',null,null,null,null,:old.n014,:new.n014);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N015'),'N',null,null,null,null,:old.n015,:new.n015);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N016'),'N',null,null,null,null,:old.n016,:new.n016);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N017'),'N',null,null,null,null,:old.n017,:new.n017);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N018'),'N',null,null,null,null,:old.n018,:new.n018);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N019'),'N',null,null,null,null,:old.n019,:new.n019);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N020'),'N',null,null,null,null,:old.n020,:new.n020);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N021'),'N',null,null,null,null,:old.n021,:new.n021);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N022'),'N',null,null,null,null,:old.n022,:new.n022);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N023'),'N',null,null,null,null,:old.n023,:new.n023);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N024'),'N',null,null,null,null,:old.n024,:new.n024);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N025'),'N',null,null,null,null,:old.n025,:new.n025);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N026'),'N',null,null,null,null,:old.n026,:new.n026);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N027'),'N',null,null,null,null,:old.n027,:new.n027);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N028'),'N',null,null,null,null,:old.n028,:new.n028);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N029'),'N',null,null,null,null,:old.n029,:new.n029);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N030'),'N',null,null,null,null,:old.n030,:new.n030);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N031'),'N',null,null,null,null,:old.n031,:new.n031);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N032'),'N',null,null,null,null,:old.n032,:new.n032);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N033'),'N',null,null,null,null,:old.n033,:new.n033);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N034'),'N',null,null,null,null,:old.n034,:new.n034);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N035'),'N',null,null,null,null,:old.n035,:new.n035);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N036'),'N',null,null,null,null,:old.n036,:new.n036);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N037'),'N',null,null,null,null,:old.n037,:new.n037);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N038'),'N',null,null,null,null,:old.n038,:new.n038);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N039'),'N',null,null,null,null,:old.n039,:new.n039);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N040'),'N',null,null,null,null,:old.n040,:new.n040);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N041'),'N',null,null,null,null,:old.n041,:new.n041);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N042'),'N',null,null,null,null,:old.n042,:new.n042);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N043'),'N',null,null,null,null,:old.n043,:new.n043);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N044'),'N',null,null,null,null,:old.n044,:new.n044);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N045'),'N',null,null,null,null,:old.n045,:new.n045);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N046'),'N',null,null,null,null,:old.n046,:new.n046);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N047'),'N',null,null,null,null,:old.n047,:new.n047);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N048'),'N',null,null,null,null,:old.n048,:new.n048);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N049'),'N',null,null,null,null,:old.n049,:new.n049);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N050'),'N',null,null,null,null,:old.n050,:new.n050);
       -- dates
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D001'),'D',null,null,:old.d001,:new.d001);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D002'),'D',null,null,:old.d002,:new.d002);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D003'),'D',null,null,:old.d003,:new.d003);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D004'),'D',null,null,:old.d004,:new.d004);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D005'),'D',null,null,:old.d005,:new.d005);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D006'),'D',null,null,:old.d006,:new.d006);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D007'),'D',null,null,:old.d007,:new.d007);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D008'),'D',null,null,:old.d008,:new.d008);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D009'),'D',null,null,:old.d009,:new.d009);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D010'),'D',null,null,:old.d010,:new.d010);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D011'),'D',null,null,:old.d011,:new.d011);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D012'),'D',null,null,:old.d012,:new.d012);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D013'),'D',null,null,:old.d013,:new.d013);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D014'),'D',null,null,:old.d014,:new.d014);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D015'),'D',null,null,:old.d015,:new.d015);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D016'),'D',null,null,:old.d016,:new.d016);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D017'),'D',null,null,:old.d017,:new.d017);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D018'),'D',null,null,:old.d018,:new.d018);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D019'),'D',null,null,:old.d019,:new.d019);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D020'),'D',null,null,:old.d020,:new.d020);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D021'),'D',null,null,:old.d021,:new.d021);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D022'),'D',null,null,:old.d022,:new.d022);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D023'),'D',null,null,:old.d023,:new.d023);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D024'),'D',null,null,:old.d024,:new.d024);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D025'),'D',null,null,:old.d025,:new.d025);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D026'),'D',null,null,:old.d026,:new.d026);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D027'),'D',null,null,:old.d027,:new.d027);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D028'),'D',null,null,:old.d028,:new.d028);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D029'),'D',null,null,:old.d029,:new.d029);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D030'),'D',null,null,:old.d030,:new.d030);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D031'),'D',null,null,:old.d031,:new.d031);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D032'),'D',null,null,:old.d032,:new.d032);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D033'),'D',null,null,:old.d033,:new.d033);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D034'),'D',null,null,:old.d034,:new.d034);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D035'),'D',null,null,:old.d035,:new.d035);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D036'),'D',null,null,:old.d036,:new.d036);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D037'),'D',null,null,:old.d037,:new.d037);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D038'),'D',null,null,:old.d038,:new.d038);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D039'),'D',null,null,:old.d039,:new.d039);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D040'),'D',null,null,:old.d040,:new.d040);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D041'),'D',null,null,:old.d041,:new.d041);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D042'),'D',null,null,:old.d042,:new.d042);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D043'),'D',null,null,:old.d043,:new.d043);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D044'),'D',null,null,:old.d044,:new.d044);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D045'),'D',null,null,:old.d045,:new.d045);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D046'),'D',null,null,:old.d046,:new.d046);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D047'),'D',null,null,:old.d047,:new.d047);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D048'),'D',null,null,:old.d048,:new.d048);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D049'),'D',null,null,:old.d049,:new.d049);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D050'),'D',null,null,:old.d050,:new.d050);
    end if;
    --
    -- set owner
    --
    if :new.owner is null then
        :new.owner := :new.created_by;
    end if;
end;

/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."APEX$_WS_NOTES_T1"
before insert or update on "APEX$_WS_NOTES"
for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from sys.dual;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(v('APP_USER'),user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."APEX$_WS_LINKS_T1"
before insert or update on "APEX$_WS_LINKS"
for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from sys.dual;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(v('APP_USER'),user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."APEX$_WS_TAGS_T1"
before insert or update on "APEX$_WS_TAGS"
for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from sys.dual;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(v('APP_USER'),user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."APEX$_WS_FILES_T1"
before insert or update on "APEX$_WS_FILES"
for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from sys.dual;
    end if;
    if inserting and :new.image_alias is null then
        :new.image_alias := :new.name;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(v('APP_USER'),user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
        :new.content_last_update := sysdate;
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
        if nvl(length(:new.content),0) <> nvl(length(:old.content),0) then
            :new.content_last_update := sysdate;
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_NEWS_T1"
   before insert or update on wwv_flow_news
   for each row
begin
   --
   -- ID
   --
   if inserting and :new.id is null then
       :new.id := wwv_flow_id.next_val;
   end if;
   --
   -- timestamps
   --
   if inserting then
      :new.created_on := sysdate;
      :new.created_by := wwv_flow.g_user;
   end if;
   --
   -- vpd
   --
   if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
   end if;
   --
   -- last updated
   --
   if not wwv_flow.g_import_in_progress then
       :new.last_updated_on := sysdate;
       :new.last_updated_by := wwv_flow.g_user;
   end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LINKS_T1"
before insert or update on wwv_flow_links
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;

    --
    -- TAG
    --
    wwv_flow_team.wwv_flow_team_tag_sync (
        p_component_type    => 'LINK',
        p_component_id      => :new.id,
        p_new_tags          => :new.TAGS,
        p_security_group_id => :new.security_group_id);
end wv_flow_links_t1;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_LINKS_T2"
after delete on wwv_flow_links
for each row
begin
    if wwv_flow.g_workspace_delete_in_progress = FALSE then
         delete from wwv_flow_team_tags where component_id = :old.id;
     end if;
end wwv_flow_links_t2;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_BUGS_T1"
before insert or update on wwv_flow_bugs
for each row
begin
     if :new.fix_by_release = '%'||'null%' then
        :new.fix_by_release := null;
     end if;
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;
    :new.assigned_to := trim(lower(:new.assigned_to));

    --
    -- TAG
    --
    wwv_flow_team.wwv_flow_team_tag_sync (
        p_component_type    => 'BUG',
        p_component_id      => :new.id,
        p_new_tags          => :new.TAGS,
        p_security_group_id => :new.security_group_id);

    --
    -- friendly id
    --
    if :new.bug_id is null and (inserting or updating) then
       select nvl(max(bug_id),0) + 1 into :new.bug_id from wwv_flow_bugs where security_group_id = nvl(wwv_flow_security.g_security_group_id,0);
    end if;

end wwv_flow_bugs_t1;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_BUGS_T2"
after delete on wwv_flow_bugs
for each row
begin
    if wwv_flow.g_workspace_delete_in_progress = FALSE then
         delete from wwv_flow_team_tags where component_id = :old.id;
     end if;
end wwv_flow_bugs_t2;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_EVENTS_T1"
before insert or update on wwv_flow_events
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;

    if inserting or updating then
       :new.EVENT_OWNER := trim(lower(:new.EVENT_OWNER));

       if :new.event_id is null then
           select nvl(max(event_id),0) + 1
           into:new.event_id
           from wwv_flow_events
           where security_group_id = nvl(wwv_flow_security.g_security_group_id,0);
       end if;
    end if;

    --
    -- TAG
    --
    begin
    wwv_flow_team.wwv_flow_team_tag_sync (
        p_component_type    => 'MILESTONE',
        p_component_id      => :new.id,
        p_new_tags          => :new.TAGS,
        p_security_group_id => :new.security_group_id);
    exception when others then
        null;
    end;
end wwv_flow_events_t1;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_EVENTS_T2"
after delete on wwv_flow_events
for each row
begin
    if wwv_flow.g_workspace_delete_in_progress = FALSE then
         delete from wwv_flow_team_tags where component_id = :old.id;
     end if;
end wwv_flow_events_t2;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_FEATURES_T1"
before insert or update on wwv_flow_features
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;

    :new.feature_owner := trim(lower(:new.feature_owner));
    :new.feature_contributor := trim(lower(:new.feature_contributor));
    :new.globalization_assignee := trim(lower(:new.globalization_assignee));
    :new.user_interface_assignee := trim(lower(:new.user_interface_assignee));
    :new.testing_assignee := trim(lower(:new.testing_assignee));
    :new.security_assignee := trim(lower(:new.security_assignee));
    :new.accessibility_assignee := trim(lower(:new.accessibility_assignee));


    if updating then

    if nvl(:old.FEATURE_NAME,'1') != nvl(:new.FEATURE_NAME,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'FEATURE_NAME','VARCHAR2',:old.FEATURE_NAME,:new.FEATURE_NAME);
    end if;
    if nvl(:old.FEATURE_OWNER,'1') != nvl(:new.FEATURE_OWNER,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'FEATURE_OWNER','VARCHAR2',:old.FEATURE_OWNER,:new.FEATURE_OWNER);
    end if;
    if nvl(:old.FEATURE_CONTRIBUTOR,'1') != nvl(:new.FEATURE_CONTRIBUTOR,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'FEATURE_CONTRIBUTOR','VARCHAR2',:old.FEATURE_CONTRIBUTOR,:new.FEATURE_CONTRIBUTOR);
    end if;
    --
    if nvl(:old.ESTIMATED_EFFORT_IN_HOURS,'1') != nvl(:new.ESTIMATED_EFFORT_IN_HOURS,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'ESTIMATED_EFFORT_IN_HOURS','NUMBER',:old.ESTIMATED_EFFORT_IN_HOURS,:new.ESTIMATED_EFFORT_IN_HOURS);
    end if;
    if nvl(:old.MODULE,'1') != nvl(:new.MODULE,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'MODULE','VARCHAR2',:old.MODULE,:new.MODULE);
    end if;
    --
    if nvl(:old.DOC_STATUS,0) != nvl(:new.DOC_STATUS,0) then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'DOC_STATUS','NUMBER',:old.DOC_STATUS,:new.DOC_STATUS);
    end if;
    if nvl(:old.DOC_WRITER,'1') != nvl(:new.DOC_WRITER,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'DOC_WRITER','VARCHAR2',:old.DOC_WRITER,:new.DOC_WRITER);
    end if;
    --
    if nvl(:old.JUSTIFICATION,'1') != nvl(:new.JUSTIFICATION,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'JUSTIFICATION','VARCHAR2',:old.JUSTIFICATION,:new.JUSTIFICATION);
    end if;
    if nvl(:old.FEATURE_TAGS,'1') != nvl(:new.FEATURE_TAGS,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'FEATURE_TAGS','VARCHAR2',:old.FEATURE_TAGS,:new.FEATURE_TAGS);
    end if;
    --
    --
    if nvl(:old.USER_INTERFACE_IMPACT,'1') != nvl(:new.USER_INTERFACE_IMPACT,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'USER_INTERFACE_IMPACT','VARCHAR2',:old.USER_INTERFACE_IMPACT,:new.USER_INTERFACE_IMPACT);
    end if;
    if nvl(:old.USER_INTERFACE_ASSIGNEE,'1') != nvl(:new.USER_INTERFACE_ASSIGNEE,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'USER_INTERFACE_ASSIGNEE','VARCHAR2',:old.USER_INTERFACE_ASSIGNEE,:new.USER_INTERFACE_ASSIGNEE);
    end if;
    if nvl(:old.USER_INTERFACE_STATUS,0) != nvl(:new.USER_INTERFACE_STATUS,0) then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'USER_INTERFACE_STATUS','NUMBER',:old.USER_INTERFACE_STATUS,:new.USER_INTERFACE_STATUS);
    end if;
    --
    --
    if nvl(:old.GLOBALIZATION_IMPACT,'1') != nvl(:new.GLOBALIZATION_IMPACT,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'GLOBALIZATION_IMPACT','VARCHAR2',:old.GLOBALIZATION_IMPACT,:new.GLOBALIZATION_IMPACT);
    end if;
    if nvl(:old.GLOBALIZATION_ASSIGNEE,'1') != nvl(:new.GLOBALIZATION_ASSIGNEE,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'GLOBALIZATION_ASSIGNEE','VARCHAR2',:old.GLOBALIZATION_ASSIGNEE,:new.GLOBALIZATION_ASSIGNEE);
    end if;
    if nvl(:old.GLOBALIZATION_STATUS,0) != nvl(:new.GLOBALIZATION_STATUS,0) then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'GLOBALIZATION_STATUS','NUMBER',:old.GLOBALIZATION_STATUS,:new.GLOBALIZATION_STATUS);
    end if;
    --
    if nvl(:old.TESTING_IMPACT,'1') != nvl(:new.TESTING_IMPACT,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'TESTING_IMPACT','VARCHAR2',:old.TESTING_IMPACT,:new.TESTING_IMPACT);
    end if;
    if nvl(:old.TESTING_ASSIGNEE,'1') != nvl(:new.TESTING_ASSIGNEE,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'TESTING_ASSIGNEE','VARCHAR2',:old.TESTING_ASSIGNEE,:new.TESTING_ASSIGNEE);
    end if;
    if nvl(:old.TESTING_STATUS,0) != nvl(:new.TESTING_STATUS,0) then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'TESTING_STATUS','NUMBER',:old.TESTING_STATUS,:new.TESTING_STATUS);
    end if;
    --
    --
    if nvl(:old.SECURITY_IMPACT,'1') != nvl(:new.SECURITY_IMPACT,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'SECURITY_IMPACT','VARCHAR2',:old.SECURITY_IMPACT,:new.SECURITY_IMPACT);
    end if;
    if nvl(:old.SECURITY_ASSIGNEE,'1') != nvl(:new.SECURITY_ASSIGNEE,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'SECURITY_ASSIGNEE','VARCHAR2',:old.SECURITY_ASSIGNEE,:new.SECURITY_ASSIGNEE);
    end if;
    if nvl(:old.SECURITY_STATUS,0) != nvl(:new.SECURITY_STATUS,0) then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'SECURITY_STATUS','NUMBER',:old.SECURITY_STATUS,:new.SECURITY_STATUS);
    end if;
    --
    --
    if nvl(:old.ACCESSIBILITY_IMPACT,'1') != nvl(:new.ACCESSIBILITY_IMPACT,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'ACCESSIBILITY_IMPACT','VARCHAR2',:old.ACCESSIBILITY_IMPACT,:new.ACCESSIBILITY_IMPACT);
    end if;
    if nvl(:old.ACCESSIBILITY_ASSIGNEE,'1') != nvl(:new.ACCESSIBILITY_ASSIGNEE,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'ACCESSIBILITY_ASSIGNEE','VARCHAR2',:old.ACCESSIBILITY_ASSIGNEE,:new.ACCESSIBILITY_ASSIGNEE);
    end if;
    if nvl(:old.ACCESSIBILITY_STATUS,0) != nvl(:new.ACCESSIBILITY_STATUS,0) then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'ACCESSIBILITY_STATUS','NUMBER',:old.ACCESSIBILITY_STATUS,:new.ACCESSIBILITY_STATUS);
    end if;
    --
    --
    if nvl(:old.FOCUS_AREA,'1') != nvl(:new.FOCUS_AREA,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'FOCUS_AREA','VARCHAR2',:old.FOCUS_AREA,:new.FOCUS_AREA);
    end if;
    if nvl(:old.RELEASE,'1') != nvl(:new.RELEASE,'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'RELEASE','VARCHAR2',:old.RELEASE,:new.RELEASE);
    end if;

    if nvl(to_char(:old.FEATURE_PRIORITY),'1') != nvl(to_char(:new.FEATURE_PRIORITY),'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'FEATURE_PRIORITY','VARCHAR2',to_char(:old.FEATURE_PRIORITY),to_char(:new.FEATURE_PRIORITY));
    end if;
    if nvl(to_char(:old.FEATURE_STATUS),0) != nvl(to_char(:new.FEATURE_STATUS),0) then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'FEATURE_STATUS','NUMBER',:old.FEATURE_STATUS,:new.FEATURE_STATUS);
    end if;
    if nvl(to_char(:old.FEATURE_DESIRABILITY),'1') != nvl(to_char(:new.FEATURE_DESIRABILITY),'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'FEATURE_DESIRABILITY','VARCHAR2',to_char(:old.FEATURE_DESIRABILITY),to_char(:new.FEATURE_DESIRABILITY));
    end if;
    if nvl(to_char(:old.APPLICATION_ID),'1') != nvl(to_char(:new.APPLICATION_ID),'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'APPLICATION_ID','VARCHAR2',to_char(:old.APPLICATION_ID),to_char(:new.APPLICATION_ID));
    end if;
    if nvl(to_char(:old.PARENT_FEATURE_ID),'1') != nvl(to_char(:new.PARENT_FEATURE_ID),'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'PARENT_FEATURE_ID','VARCHAR2',to_char(:old.PARENT_FEATURE_ID),to_char(:new.PARENT_FEATURE_ID));
    end if;
    if nvl(to_char(:old.DUE_DATE,'YYYYMMDD'),'1') != nvl(to_char(:new.DUE_DATE,'YYYYMMDD'),'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'DUE_DATE','VARCHAR2',to_char(:old.DUE_DATE,'YYYYMMDD'),to_char(:new.DUE_DATE,'YYYYMMDD'));
    end if;
    if nvl(to_char(:old.START_DATE,'YYYYMMDD'),'1') != nvl(to_char(:new.START_DATE,'YYYYMMDD'),'1') then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'START_DATE','VARCHAR2',to_char(:old.START_DATE,'YYYYMMDD'),to_char(:new.START_DATE,'YYYYMMDD'));
    end if;

    if nvl(:old.event_id,0) != nvl(:new.event_id,0) then
       insert into wwv_flow_feature_history
            (feature_id, COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_VARCHAR2,NEW_VALUE_VARCHAR2)
            values
            (:new.id, 'EVENT_ID','NUMBER',:old.event_id,:new.event_id);
    end if;

    /*
    if sys.dbms_lob.get_length(:old.FEATURE_DESC) != sys.dbms_lob.get_length(:new.FEATURE_DESC) then
       insert into wwv_flow_feature_history
            (COLUMN_NAME,COLUMN_DATA_TYPE,OLD_VALUE_CLOB,NEW_VALUE_CLOB)
            values
            ('FEATURE_DESC','CLOB',:old.FEATURE_DESC,:new.FEATURE_DESC);
    end if;
    */

    end if;

    --
    -- TAG
    --
    wwv_flow_team.wwv_flow_team_tag_sync (
           p_component_type    => 'FEATURE',
           p_component_id      => :new.id,
           p_new_tags          => rtrim(trim(:new.FEATURE_TAGS),','),
           p_security_group_id => :new.security_group_id);

    -- set feature id
    if :new.feature_id is null and (inserting or updating) then
        select nvl(max(feature_id),0) + 1 into :new.feature_id
        from wwv_flow_features
        where security_group_id = nvl(wwv_flow_security.g_security_group_id,0);
    end if;

end wwv_flow_features_t1;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_FEATURES_T2"
after delete on wwv_flow_features
for each row
begin
    if wwv_flow.g_workspace_delete_in_progress = FALSE then
         delete from wwv_flow_team_tags where component_id = :old.id;
     end if;
end wwv_flow_features_t2;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_FEATURES_HIST_T1"
before insert or update on wwv_flow_feature_history
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
end wwv_flow_features_hist_t1;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_FEATURE_PROG_T1"
before insert or update on wwv_flow_feature_progress
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;
end wwv_flow_feature_prog_t1;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_TASKS_T1"
before insert or update on wwv_flow_tasks
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;
    --
    -- start date and complete date
    --
    if inserting or updating then
        if :new.task_status is null then
           :new.task_status := 0;
        end if;

        if :new.task_status = 100 and :new.date_completed is null then
           :new.date_completed := sysdate;
        end if;
        if :new.date_completed is not null and :new.task_status < 100 then
           :new.task_status := 100;
        end if;
    end if;

    --
    -- owner
    --
    if inserting or updating then
        :new.assigned_to := trim(lower(:new.assigned_to));
        :new.contributor := trim(lower(:new.contributor));
    end if;

    --
    -- TAGS
    --
    wwv_flow_team.wwv_flow_team_tag_sync (
        p_component_type    => 'TODO',
        p_component_id      => :new.id,
        p_new_tags          => :new.TASK_TAGS,
        p_security_group_id => :new.security_group_id);

    --
    -- task number
    --
    if inserting or updating then
        if :new.FRIENDLY_ID is null then
           for c1 in (
                   select nvl(max(FRIENDLY_ID),0) + 1 x
                   from   wwv_flow_tasks
                   where  security_group_id = wwv_flow_security.g_security_group_id)
                   loop
                   :new.friendly_id := c1.x;
           end loop;
        end if;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_TASKS_T2"
after delete on wwv_flow_tasks
for each row
begin
    if wwv_flow.g_workspace_delete_in_progress = FALSE then
         delete from wwv_flow_team_tags where component_id = :old.id;
     end if;
end wwv_flow_tasks_t2;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_TASK_PROGRESS_T1"
before insert or update on  wwv_flow_task_progress
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;
end wwv_flow_task_progress_T1;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_TASK_DEFAULTS_T1"
before insert or update on  wwv_flow_task_defaults
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;
end wwv_flow_task_defaults_T1;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_TEAMDEV_TC_T1"
before insert or update on wwv_flow_teamdev_tag_cloud
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    if inserting and :new.updated_by is null then
       :new.updated_by :=nvl(wwv_flow.g_user,user);
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := nvl(wwv_flow.g_user,user);
       :new.updated_on := sysdate;
    end if;
end wwv_flow_teamdev_tc_t1;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_TEAM_FILES_T1"
before insert or update on wwv_flow_team_files
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting and :new.created_by is null then
       :new.created_by := nvl(wwv_flow.g_user,USER);
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;

end wwv_flow_team_files_t1;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_PROJECT"
    before insert or update on wwv_mig_projects
    for each row
begin

    -- vpd
    --
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
     end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_MAIN"
    before insert or update on wwv_mig_access
    for each row
begin


     --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    -- vpd
    --
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
     end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_FRM"
    before insert or update on wwv_mig_acc_forms
    for each row
begin

     --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_FRM_CTL"
    before insert or update on wwv_mig_acc_forms_controls
    for each row
begin

     --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_FRM_MDL"
    before insert or update on wwv_mig_acc_forms_modules
    for each row
begin

     --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_FRM_PERM"
    before insert or update on wwv_mig_acc_forms_perm
    for each row
begin

     --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_RPT_GRP"
    before insert or update on wwv_mig_acc_reports
    for each row
begin


     --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_RPT_CTL"
    before insert or update on wwv_mig_acc_rpts_controls
    for each row
begin


     --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_RPT_MDL"
    before insert or update on wwv_mig_acc_rpts_modules
    for each row
begin


     --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_RPT_PERM"
    before insert or update on wwv_mig_acc_rpt_perms
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_TABLE"
    before insert or update on wwv_mig_acc_tables
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_COLUMN"
    before insert or update on wwv_mig_acc_columns
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_INDEX"
    before insert or update on wwv_mig_acc_indexes
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_IDX_COL"
    before insert or update on wwv_mig_acc_indexes_cols
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_TAB_PERM"
    before insert or update on wwv_mig_acc_tab_perm
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_QUERIES"
    before insert or update on wwv_mig_acc_queries
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_REL"
    before insert or update on wwv_mig_acc_relations
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_REL_COL"
    before insert or update on wwv_mig_acc_relation_cols
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_USERS"
    before insert or update on wwv_mig_acc_users
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_GROUPS"
    before insert or update on wwv_mig_acc_groups
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACCGRPSMBRS"
    before insert or update on wwv_mig_acc_grpsmembers
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_MODULES"
    before insert or update on wwv_mig_acc_modules
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_MDL_PERM"
    before insert or update on wwv_mig_acc_modules_perm
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_ACC_PAGES"
    before insert or update on wwv_mig_acc_pages
    for each row
begin

    --insert unique primary key for id
      if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
      end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_WWV_MIG_REV_TABLES"
    before insert or update on  wwv_mig_rev_tables
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    --
    -- last updated
    --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_WWV_MIG_REV_QUERIES"
    before insert or update on  wwv_mig_rev_queries
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    --
    -- last updated
    --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_WWV_MIG_REV_REPORTS"
    before insert or update on  wwv_mig_rev_reports
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    --
    -- last updated
    --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_WWV_MIG_REV_FORMS"
    before insert or update on  wwv_mig_rev_forms
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    --
    -- last updated
    --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_WWV_MIG_REV_APEX"
    before insert or update on  wwv_mig_rev_apexapp
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    --
    --
    -- last updated
    --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    --
    -- created
    --
    if inserting then
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_GEN_APPLICATIONS"
    before insert or update on wwv_mig_generated_applications
    for each row
begin
    --insert unique primary key for id
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
    end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_XMLTAGTABLEMAP"
    before insert or update on wwv_mig_frm_xmltagtablemap
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_RPT_XMLTAGTABLEMAP"
    before insert or update on wwv_mig_rpt_xmltagtablemap
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_PROJ_COMPS"
    before insert or update on wwv_mig_project_components
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_PROJ_TRIGS"
    before insert or update on wwv_mig_project_triggers
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FORMS"
    before insert or update on wwv_mig_forms
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_PLLS"
    before insert or update on wwv_mig_plsql_libs
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_MODULES"
    before insert or update on wwv_mig_frm_modules
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_FORMMODULES"
    before insert or update on wwv_mig_frm_formmodules
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_ATACHEDLIBRARY"
    before insert or update on wwv_mig_frm_attachedlibrary
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_MODULPARAMETER"
    before insert or update on wwv_mig_frm_moduleparameter
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_FMB_MENU"
    before insert or update on wwv_mig_frm_fmb_menu
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_FMB_MENUITEM"
    before insert or update on wwv_mig_frm_fmb_menu_menuitem
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FMB_MNUITEMRL"
    before insert or update on wwv_mig_frm_fmb_menuitem_role
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_REPORT"
    before insert or update on wwv_mig_frm_report
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_OBJECTGROUP"
    before insert or update on wwv_mig_frm_objectgroup
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_OBJGROUPCHILD"
    before insert or update on wwv_mig_frm_objectgroupchild
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_COORDINATES"
    before insert or update on wwv_mig_frm_coordinates
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_ALERTS"
    before insert or update on wwv_mig_frm_alerts
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_TRIGGERS"
    before insert or update on wwv_mig_frm_triggers
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

     -- default tracking info
     --mike
     if inserting or updating then
        if :new.applicable is null then
            :new.applicable := 'Y';
        end if;
        if sys.dbms_lob.getlength(:new.triggertext) = 0 then
           :new.applicable := 'N';
        end if;
        if :new.triggertext is null or :new.triggertext = 'exit_form;' then
           :new.applicable := 'N';
        end if;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_BLOCKS"
    before insert or update on wwv_mig_frm_blocks
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := systimestamp;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_BLK_ITEMS"
    before insert or update on wwv_mig_frm_blk_items
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := systimestamp;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_BLK_ITEM_TRG"
    before insert or update on wwv_mig_frm_blk_item_triggers
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

     -- default tracking info
     --mike
     if inserting or updating then
        if :new.applicable is null then
            :new.applicable := 'Y';
        end if;
        if sys.dbms_lob.getlength(:new.triggertext) = 0 then
           :new.applicable := 'N';
        end if;
        if :new.triggertext is null or :new.triggertext = 'exit_form;' then
           :new.applicable := 'N';
        end if;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_BLK_ITEM_LIE"
    before insert or update on wwv_mig_frm_blk_item_lie
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_BLK_ITEM_RADIO"
    before insert or update on wwv_mig_frm_blk_item_radio
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_BLK_DSA"
    before insert or update on wwv_mig_frm_blk_dsa
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_BLK_DSC"
    before insert or update on wwv_mig_frm_blk_dsc
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_BLK_TRIGGERS"
    before insert or update on wwv_mig_frm_blk_triggers
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

     -- default tracking info
     --mike
     if inserting or updating then
        if :new.applicable is null then
            :new.applicable := 'Y';
        end if;
        if sys.dbms_lob.getlength(:new.triggertext) = 0 then
           :new.applicable := 'N';
        end if;
        if :new.triggertext is null or :new.triggertext = 'exit_form;' then
           :new.applicable := 'N';
        end if;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_BLK_RELATIONS"
    before insert or update on wwv_mig_frm_blk_relations
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_CANVAS"
    before insert or update on wwv_mig_frm_canvas
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_CNVS_GRAPHICS"
    before insert or update on wwv_mig_frm_cnvs_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_CNVG_CPDTXT"
    before insert or update on wwv_mig_frm_cnvg_compoundtext
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_CPDTXT_TXTSGMT"
    before insert or update on wwv_mig_frm_cpdtxt_textsegment
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_CNVS_TABPAGE"
    before insert or update on wwv_mig_frm_cnvs_tabpage
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_EDITOR"
    before insert or update on wwv_mig_frm_editor
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_LOV"
    before insert or update on wwv_mig_frm_lov
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_LOVCOLMAPPING"
    before insert or update on wwv_mig_frm_lovcolumnmapping
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_PROGRAMUNIT"
    before insert or update on wwv_mig_frm_programunit
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_PROPERTYCLASS"
    before insert or update on wwv_mig_frm_propertyclass
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_RECORDGROUPS"
    before insert or update on wwv_mig_frm_recordgroups
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_RECGRPCOLUMN"
    before insert or update on wwv_mig_frm_recordgroupcolumn
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_VISUALATTR"
    before insert or update on wwv_mig_frm_visualattributes
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_WINDOWS"
    before insert or update on wwv_mig_frm_windows
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_REV_APEX_APP"
    before insert or update on  wwv_mig_frm_rev_apex_app
    for each row
begin
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- last updated
    :new.last_updated_on := sysdate;
    :new.last_updated_by := wwv_flow.g_user;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_REV_FORMMODULE"
    before insert or update on wwv_mig_frm_rev_formmodules
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_REV_BLOCKS"
    before insert or update on wwv_mig_frm_rev_blocks
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := systimestamp;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_REV_BLK_ITEMS"
    before insert or update on wwv_mig_frm_rev_blk_items
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := systimestamp;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_REV_LOV"
    before insert or update on wwv_mig_frm_rev_lov
    for each row
begin
    -- insert unique primary key for id
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
    end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_FRM_REV_LCM"
    before insert or update on wwv_mig_frm_rev_lovcolmaps
    for each row
begin
    -- insert unique primary key for id
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
    end if;

    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
    end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_RPTS"
    before insert or update on wwv_mig_rpts
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_REPORT"
    before insert or update on wwv_mig_report
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_REPDATA"
    before insert or update on wwv_mig_rpt_data
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_REPSRC"
    before insert or update on wwv_mig_rpt_datasrc
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_SELECT"
    before insert or update on wwv_mig_rpt_datasrc_select
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_GRP"
    before insert or update on wwv_mig_rpt_datasrc_grp
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_GRP_ITEM"
    before insert or update on wwv_mig_rpt_grp_dataitem
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_GRP_ITEMDESC"
    before insert or update on wwv_mig_rpt_grp_dataitem_desc
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_GRP_ITEMPRIV"
    before insert or update on wwv_mig_rpt_grp_dataitem_priv
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_GRP_SUM"
    before insert or update on wwv_mig_rpt_grp_summary
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_GRP_FORM"
    before insert or update on wwv_mig_rpt_grp_formula
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_GRP_ROW"
    before insert or update on wwv_mig_rpt_grp_rowdelim
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_GRP_FILTER"
    before insert or update on wwv_mig_rpt_grp_filter
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_GRP_FIELD"
    before insert or update on wwv_mig_rpt_grp_field
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_RPT_DATASUM"
    before insert or update on wwv_mig_rpt_data_summary
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_RPTPRIV"
    before insert or update on wwv_mig_rpt_reportprivate
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_MENUS"
    before insert or update on wwv_mig_frm_menus
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_MNU_MODULES"
    before insert or update on wwv_mig_frm_menus_modules
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_MNU_MNUMODULES"
    before insert or update on wwv_mig_frm_menus_menumodules
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_MNU_MODROLES"
    before insert or update on wwv_mig_frm_menusmoduleroles
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_MNU"
    before insert or update on wwv_mig_frm_menu
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_MNUITEM"
    before insert or update on wwv_mig_frm_menu_menuitem
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_MNUITEMRL"
    before insert or update on wwv_mig_frm_menuitem_role
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_MNU_PROGUNIT"
    before insert or update on wwv_mig_frm_menus_programunit
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_MNU_XMLTAGTABLEMAP"
    before insert or update on wwv_mig_menu_xmltagtablemap
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_XMLTAGTABLEMAP"
    before insert or update on wwv_mig_frm_olb_xmltagtablemap
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB"
    before insert or update on wwv_mig_olb
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_MODULES"
    before insert or update on wwv_mig_olb_modules
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OBJECTLIBRARY"
    before insert or update on wwv_mig_olb_objectlibrary
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OBJLIBTAB"
    before insert or update on wwv_mig_olb_objectlibrarytab
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_BLOCK"
    before insert or update on wwv_mig_olb_block
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_CANVAS"
    before insert or update on wwv_mig_olb_canvas
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_PROGRAMUNIT"
    before insert or update on wwv_mig_olb_programunit
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_PROPERTYCLASS"
    before insert or update on wwv_mig_olb_propertyclass
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_VISUALATTRBUTE"
    before insert or update on wwv_mig_olb_visualattribute
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_WINDOW"
    before insert or update on wwv_mig_olb_window
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_ALERT"
    before insert or update on wwv_mig_olb_olt_alert
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_BLOCK"
    before insert or update on wwv_mig_olb_olt_block
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_CANVAS"
    before insert or update on wwv_mig_olb_olt_canvas
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_GRAPHICS"
    before insert or update on wwv_mig_olb_olt_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_ITEM"
    before insert or update on wwv_mig_olb_olt_item
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_MENU"
    before insert or update on wwv_mig_olb_olt_menu
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_OBJGRP"
    before insert or update on wwv_mig_olb_olt_objectgroup
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_REPORT"
    before insert or update on wwv_mig_olb_olt_report
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_TABPAGE"
    before insert or update on wwv_mig_olb_olt_tabpage
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_VA"
    before insert or update on wwv_mig_olb_olt_visualattrbute
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_WINDOW"
    before insert or update on wwv_mig_olb_olt_window
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_BLK_ITEM"
    before insert or update on wwv_mig_olb_blk_item
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_BLK_ITEM_LIE"
    before insert or update on wwv_mig_olb_blk_item_lie
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_BI_TRIGGER"
    before insert or update on wwv_mig_olb_blk_item_trigger
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_BLK_DSC"
    before insert or update on wwv_mig_olb_blk_datasourcecol
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_BLK_TRIGGER"
    before insert or update on wwv_mig_olb_blk_trigger
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_CNVS_GRAPHICS"
    before insert or update on wwv_mig_olb_cnvs_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_BLK_ITEM"
    before insert or update on wwv_mig_olb_olt_blk_item
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_CNV_GRPHCS"
    before insert or update on wwv_mig_olb_olt_cnvs_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_M_MENUITEM"
    before insert or update on wwv_mig_olb_olt_menu_menuitem
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_OB_OBCHILD"
    before insert or update on wwv_mig_olb_olt_ob_objgrpchild
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_TP_GRAPHCS"
    before insert or update on wwv_mig_olb_olt_tabpg_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_T_TP_G_GRAPHCS"
    before insert or update on wwv_mig_olb_t_tp_g_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_T_TP_GG_CT"
    before insert or update on wwv_mig_olb_t_tp_gg_cpdtxt
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_TTPGGCTTS"
    before insert or update on wwv_mig_olb_t_tp_gg_ct_txtsgt
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_T_TP_GG_GRPHCS"
    before insert or update on wwv_mig_olb_t_tp_gg_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_T_TP_GGG_CT"
    before insert or update on wwv_mig_olb_t_tp_ggg_cpdtxt
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_TTPGGGCTTS"
    before insert or update on wwv_mig_olb_t_tp_ggg_ct_txtsgt
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_T_TP_GGGG"
    before insert or update on wwv_mig_olb_t_tp_ggg_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_TTPGGGGCT"
    before insert or update on wwv_mig_olb_t_tp_gggg_cpdtxt
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_TTPGGGGCTTS"
    before insert or update on wwv_mig_olb_t_tp_gggg_ct_txsgt
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_T_TP_GGGGG"
    before insert or update on wwv_mig_olb_t_tp_gggg_graphics
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_TTPGGGGGCT"
    before insert or update on wwv_mig_olb_t_tp_ggggg_cpdtxt
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_TTP5GCTTS"
    before insert or update on wwv_mig_olb_t_tp_ggggg_ct_txst
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_OLT_BI_TRIGGER"
    before insert or update on wwv_mig_olb_olt_blk_item_trigr
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_BIU_MIG_OLB_CG_COMPOUNDTXT"
    before insert or update on wwv_mig_olb_cg_compoundtext
    for each row
begin
    --insert unique primary key for id
     if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- created
        :new.created_by := wwv_flow.g_user;
        :new.created_on := sysdate;
     end if;

    -- vpd
     if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
     end if;

    -- last updated
    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APEX_040200"."WWV_FLOW_WS_APP_AND_AUTH_TRG"
instead of update
on wwv_flow_ws_app_and_auth
for each row
declare
    l_new wwv_flow_ws_app_and_auth%rowtype;
begin
    l_new.id                          := :new.id;
    l_new.security_group_id           := :new.security_group_id;
    l_new.name                        := :new.name;
    l_new.status                      := :new.status;
    l_new.home_page_id                := :new.home_page_id;
    l_new.date_format                 := :new.date_format;
    l_new.language                    := :new.language;
    l_new.territory                   := :new.territory;
    l_new.show_reset_passwd_yn        := :new.show_reset_passwd_yn;
    l_new.email_from                  := :new.email_from;
    l_new.owner                       := :new.owner;
    l_new.description                 := :new.description;
    l_new.login_page_message          := :new.login_page_message;
    l_new.logo_type                   := :new.logo_type;
    l_new.logo_text                   := :new.logo_text;
    l_new.logo_text_attributes        := :new.logo_text_attributes;
    l_new.logo_image                  := :new.logo_image;
    l_new.logo_image_attributes       := :new.logo_image_attributes;
    l_new.logo_filepath               := :new.logo_filepath;
    l_new.logo_filepath_attributes    := :new.logo_filepath_attributes;
    --
    -- authentication
    --
    l_new.auth_id                     := :new.auth_id;
    l_new.authentication              := :new.authentication;
    l_new.logout_url                  := :new.logout_url;
    l_new.ldap_host                   := :new.ldap_host;
    l_new.ldap_port                   := :new.ldap_port;
    l_new.ldap_use_ssl                := :new.ldap_use_ssl;
    l_new.ldap_use_exact_dn           := :new.ldap_use_exact_dn;
    l_new.ldap_string                 := :new.ldap_string;
    l_new.ldap_search_filter          := :new.ldap_search_filter;
    l_new.ldap_edit_function          := :new.ldap_edit_function;
    l_new.ldap_username_escaping      := :new.ldap_username_escaping;
    l_new.page_sentry_function        := :new.page_sentry_function;
    l_new.sess_verify_function        := :new.sess_verify_function;
    l_new.pre_auth_process            := :new.pre_auth_process;
    l_new.auth_function               := :new.auth_function;
    l_new.post_auth_process           := :new.post_auth_process;
    l_new.invalid_session_url         := :new.invalid_session_url;
    l_new.cookie_name                 := :new.cookie_name;
    l_new.cookie_path                 := :new.cookie_path;
    l_new.cookie_domain               := :new.cookie_domain;
    l_new.use_secure_cookie_yn        := :new.use_secure_cookie_yn;
    --
    -- authorization
    --
    l_new.acl_type                    := :new.acl_type;
    l_new.allow_public_access_yn      := :new.allow_public_access_yn;
    --
    -- preferences
    --
    l_new.show_peer_navigation_yn     := :new.show_peer_navigation_yn;
    l_new.show_child_navigation_yn    := :new.show_child_navigation_yn;
    l_new.show_annotations_control_yn := :new.show_annotations_control_yn;
    l_new.allow_sql_yn                := :new.allow_sql_yn;
    --
    -- audit
    --
    l_new.created_by                  := :new.created_by;
    l_new.created_on                  := :new.created_on;
    l_new.updated_by                  := :new.updated_by;
    l_new.updated_on                  := :new.updated_on;

    wwv_flow_ws_security.update_ws_properties (
        p_ws => l_new );
end;
/

