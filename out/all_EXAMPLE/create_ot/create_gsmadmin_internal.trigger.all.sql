CREATE OR REPLACE NONEDITIONABLE TRIGGER "GSMADMIN_INTERNAL"."DONE_TRIGGER" AFTER UPDATE OF status
    ON gsm_requests FOR EACH ROW  WHEN (new.status = 'D')  CALL dbms_gsm_pooladmin.requestDone(:old.request)
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "GSMADMIN_INTERNAL"."CAT_ROLLBACK_TRIGGER" AFTER UPDATE OF status
    ON gsm_requests FOR EACH ROW  WHEN (new.status = 'A')  CALL dbms_gsm_pooladmin.catRollback(:new.request, :new.old_instances)
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "GSMADMIN_INTERNAL"."REQUEST_DELETE_TRIGGER" BEFORE DELETE ON gsm_requests
    FOR EACH ROW  CALL dbms_gsm_pooladmin.requestDone(:old.request)
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "GSMADMIN_INTERNAL"."GSMLOGOFF"
                   BEFORE LOGOFF  ON gsmcatuser.schema
                    CALL dbms_gsm_cloudadmin.checkGSMDown
/

