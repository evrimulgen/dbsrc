CREATE OR REPLACE NONEDITIONABLE TRIGGER "FLOWS_FILES"."WWV_BIU_FLOW_FILE_OBJECTS"
    before insert or update on wwv_flow_file_objects$
    for each row
begin
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
        if :new.security_group_id is null then
            :new.security_group_id :=
              nvl(wwv_flow_security.g_security_group_id,0);
        end if;
        wwv_flow_file_object_id.g_id := :new.id;
        wwv_flow_file_api.g_file_inserted := true;
        wwv_flow_file_api.g_file_inserted_count := wwv_flow_file_api.g_file_inserted_count + 1;
    elsif updating then
        :new.updated_by := nvl(wwv_flow.g_user,user);
        :new.updated_on := sysdate;
        wwv_flow_file_object_id.g_id := :new.id;
    end if;
    --
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.flow_id is null then
        :new.flow_id := 0;
    end if;
    :new.filename := substr(:new.name,instr(:new.name,'/')+1);
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

