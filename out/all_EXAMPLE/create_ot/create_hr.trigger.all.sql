CREATE OR REPLACE EDITIONABLE TRIGGER "HR"."SECURE_EMPLOYEES"
  BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
  secure_dml;
END secure_employees;
/

CREATE OR REPLACE EDITIONABLE TRIGGER "HR"."UPDATE_JOB_HISTORY"
  AFTER UPDATE OF job_id, department_id ON employees
  FOR EACH ROW
BEGIN
  add_job_history(:old.employee_id, :old.hire_date, sysdate,
                  :old.job_id, :old.department_id);
END;
/

