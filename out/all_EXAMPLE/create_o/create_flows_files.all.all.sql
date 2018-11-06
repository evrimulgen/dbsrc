CREATE USER "FLOWS_FILES" IDENTIFIED BY VALUES 'S:7BF3389E903B4BE3AB2389DEB0FFE83B1B459D558F6CCB334DAC9F63F5A3;H:C66E187F9C2885BF94D8F6D6CDC760E9;T:78E5773EF1276B08C1032DB2DC84DCF406A2BC88BD9ED145CE876842D6B92363AB07CA1DEFDF6FB49A3C8B7DA61570FAB230AF996C992A30C624570D50F65B4F2F620ECFCFFD8D0CAA36E99A92C4F638;DE15B03ACA52951D'
      DEFAULT TABLESPACE "SYSAUX"
      TEMPORARY TABLESPACE "TEMP"
      PASSWORD EXPIRE
      ACCOUNT LOCK;

ALTER USER "FLOWS_FILES" DEFAULT ROLE ALL;
CREATE OR REPLACE NONEDITIONABLE SYNONYM "FLOWS_FILES"."WWV_FLOW_SECURITY" FOR "APEX_040200"."WWV_FLOW_SECURITY";
CREATE OR REPLACE NONEDITIONABLE SYNONYM "FLOWS_FILES"."WWV_FLOW_FILE_OBJECT_ID" FOR "APEX_040200"."WWV_FLOW_FILE_OBJECT_ID";
CREATE OR REPLACE NONEDITIONABLE SYNONYM "FLOWS_FILES"."WWV_FLOW_ID" FOR "APEX_040200"."WWV_FLOW_ID";
CREATE OR REPLACE NONEDITIONABLE SYNONYM "FLOWS_FILES"."WWV_FLOW_FILE_API" FOR "APEX_040200"."WWV_FLOW_FILE_API";
CREATE OR REPLACE NONEDITIONABLE SYNONYM "FLOWS_FILES"."WWV_FLOW" FOR "APEX_040200"."WWV_FLOW";
CREATE TABLE "FLOWS_FILES"."WWV_FLOW_FILE_OBJECTS$"
   (	"ID" NUMBER,
	"FLOW_ID" NUMBER,
	"NAME" VARCHAR2(400),
	"PATHID" NUMBER,
	"FILENAME" VARCHAR2(400),
	"TITLE" VARCHAR2(255),
	"MIME_TYPE" VARCHAR2(255),
	"DOC_SIZE" NUMBER,
	"DAD_CHARSET" VARCHAR2(128),
	"CREATED_BY" VARCHAR2(255),
	"CREATED_ON" DATE,
	"UPDATED_BY" VARCHAR2(255),
	"UPDATED_ON" DATE,
	"DELETED_AS_OF" DATE DEFAULT to_date('01-01-0001','DD-MM-YYYY'),
	"LAST_UPDATED" DATE,
	"CONTENT_TYPE" VARCHAR2(128),
	"BLOB_CONTENT" BLOB,
	"LANGUAGE" VARCHAR2(30),
	"DESCRIPTION" VARCHAR2(4000),
	"SECURITY_GROUP_ID" NUMBER,
	"FILE_TYPE" VARCHAR2(255),
	"FILE_CHARSET" VARCHAR2(128)
   ) ;

COMMENT ON TABLE "FLOWS_FILES"."WWV_FLOW_FILE_OBJECTS$"  IS 'General file repository table for all flows applications, used to store SQL Scripts, BLOBs, etc.';
CREATE UNIQUE INDEX "FLOWS_FILES"."WWV_FLOW_FILE_OBJ_PK" ON "FLOWS_FILES"."WWV_FLOW_FILE_OBJECTS$" ("ID")
  ;

CREATE INDEX "FLOWS_FILES"."WWV_FLOW_FILES_FILE_IDX" ON "FLOWS_FILES"."WWV_FLOW_FILE_OBJECTS$" ("SECURITY_GROUP_ID", "FILENAME", "FLOW_ID")
  ;

CREATE INDEX "FLOWS_FILES"."WWV_FLOW_FILES_USER_IDX" ON "FLOWS_FILES"."WWV_FLOW_FILE_OBJECTS$" ("CREATED_BY")
  ;

ALTER TABLE "FLOWS_FILES"."WWV_FLOW_FILE_OBJECTS$" ADD CONSTRAINT "WWV_FLOW_FILE_OBJ_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;

ALTER TABLE "FLOWS_FILES"."WWV_FLOW_FILE_OBJECTS$" ADD UNIQUE ("NAME")
  USING INDEX  ENABLE;

ALTER TABLE "FLOWS_FILES"."WWV_FLOW_FILE_OBJECTS$" ADD CONSTRAINT "WWV_FLOW_FILE_OBJ_FK" FOREIGN KEY ("SECURITY_GROUP_ID")
	  REFERENCES "APEX_040200"."WWV_FLOW_COMPANIES" ("PROVISIONING_COMPANY_ID") ON DELETE CASCADE ENABLE;

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

ALTER TRIGGER "FLOWS_FILES"."WWV_BIU_FLOW_FILE_OBJECTS" ENABLE;
