COMMENT ON COLUMN "XDB"."APP_USERS_AND_ROLES"."GUID" IS 'The GUID for user or role/workgroup';
COMMENT ON COLUMN "XDB"."APP_USERS_AND_ROLES"."NAME" IS 'The name of user or role/workgroup';
COMMENT ON COLUMN "XDB"."APP_USERS_AND_ROLES"."ISROLE" IS 'Whether user or role/workgroup';
COMMENT ON TABLE "XDB"."APP_USERS_AND_ROLES"  IS 'Application users and roles/workspaces';
COMMENT ON COLUMN "XDB"."APP_ROLE_MEMBERSHIP"."ROLE_GUID" IS 'The GUID for the role/workgroup';
COMMENT ON COLUMN "XDB"."APP_ROLE_MEMBERSHIP"."MEMBER_GUID" IS 'The GUID of the role member';
COMMENT ON TABLE "XDB"."APP_ROLE_MEMBERSHIP"  IS 'Application role membership';
