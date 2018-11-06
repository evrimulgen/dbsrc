CREATE OR REPLACE NONEDITIONABLE TRIGGER "LBACSYS"."LBAC$AFTER_DROP"
  AFTER DROP ON DATABASE
  BEGIN
   LBACSYS.lbac_events.after_drop(dbms_standard.dictionary_obj_type,
                          dbms_standard.dictionary_obj_name,
                          dbms_standard.dictionary_obj_owner);
  END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "LBACSYS"."LBAC$AFTER_CREATE"
  AFTER CREATE ON DATABASE
  BEGIN
  LBACSYS.lbac_events.after_create(dbms_standard.dictionary_obj_type,
                            dbms_standard.dictionary_obj_name,
                            dbms_standard.dictionary_obj_owner);
  END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "LBACSYS"."LBAC$BEFORE_ALTER"
  BEFORE ALTER ON DATABASE
  BEGIN
    LBACSYS.lbac_events.before_alter(dbms_standard.dictionary_obj_type,
                             dbms_standard.dictionary_obj_name,
                             dbms_standard.dictionary_obj_owner);
  END;
/

