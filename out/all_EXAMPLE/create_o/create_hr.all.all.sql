CREATE USER "HR" IDENTIFIED BY VALUES 'S:ABAD2BF86C9DE0BEC44F386FA6BDED81EF2F3BC57BD280906FE04C5AEB3B;H:9553E7958806E6940C04DB2BCB8E1C23;T:AE231F2651C600D583D5FD9FFE5ADD729E375A0813687BFF1AB7ACE146B9C4AE2B3DF73D2FDA5160D528892C04F0E2AFE94FCDB7431E49857408F92E977333EE1DDFF8C8E9434EA4B4A04AE56EA47EE0;6399F3B38EDF3288'
      DEFAULT TABLESPACE "USERS"
      TEMPORARY TABLESPACE "TEMP"
      PASSWORD EXPIRE
      ACCOUNT LOCK;

GRANT CREATE DATABASE LINK TO "HR";
GRANT CREATE SEQUENCE TO "HR";
GRANT CREATE VIEW TO "HR";
GRANT CREATE SYNONYM TO "HR";
GRANT UNLIMITED TABLESPACE TO "HR";
GRANT ALTER SESSION TO "HR";
GRANT CREATE SESSION TO "HR";
GRANT "RESOURCE" TO "HR";
ALTER USER "HR" DEFAULT ROLE ALL;
CREATE SEQUENCE  "HR"."LOCATIONS_SEQ"  MINVALUE 1 MAXVALUE 9900 INCREMENT BY 100 START WITH 3300 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "HR"."DEPARTMENTS_SEQ"  MINVALUE 1 MAXVALUE 9990 INCREMENT BY 10 START WITH 280 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "HR"."EMPLOYEES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 207 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE TABLE "HR"."COUNTRIES"
   (	"COUNTRY_ID" CHAR(2),
	"COUNTRY_NAME" VARCHAR2(40),
	"REGION_ID" NUMBER,
	 CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS ;

CREATE TABLE "HR"."JOB_HISTORY"
   (	"EMPLOYEE_ID" NUMBER(6,0),
	"START_DATE" DATE,
	"END_DATE" DATE,
	"JOB_ID" VARCHAR2(10),
	"DEPARTMENT_ID" NUMBER(4,0)
   ) ;

CREATE TABLE "HR"."EMPLOYEES"
   (	"EMPLOYEE_ID" NUMBER(6,0),
	"FIRST_NAME" VARCHAR2(20),
	"LAST_NAME" VARCHAR2(25),
	"EMAIL" VARCHAR2(25),
	"PHONE_NUMBER" VARCHAR2(20),
	"HIRE_DATE" DATE,
	"JOB_ID" VARCHAR2(10),
	"SALARY" NUMBER(8,2),
	"COMMISSION_PCT" NUMBER(2,2),
	"MANAGER_ID" NUMBER(6,0),
	"DEPARTMENT_ID" NUMBER(4,0)
   ) ;

CREATE TABLE "HR"."JOBS"
   (	"JOB_ID" VARCHAR2(10),
	"JOB_TITLE" VARCHAR2(35),
	"MIN_SALARY" NUMBER(6,0),
	"MAX_SALARY" NUMBER(6,0)
   ) ;

CREATE TABLE "HR"."DEPARTMENTS"
   (	"DEPARTMENT_ID" NUMBER(4,0),
	"DEPARTMENT_NAME" VARCHAR2(30),
	"MANAGER_ID" NUMBER(6,0),
	"LOCATION_ID" NUMBER(4,0)
   ) ;

CREATE TABLE "HR"."LOCATIONS"
   (	"LOCATION_ID" NUMBER(4,0),
	"STREET_ADDRESS" VARCHAR2(40),
	"POSTAL_CODE" VARCHAR2(12),
	"CITY" VARCHAR2(30),
	"STATE_PROVINCE" VARCHAR2(25),
	"COUNTRY_ID" CHAR(2)
   ) ;

CREATE TABLE "HR"."REGIONS"
   (	"REGION_ID" NUMBER,
	"REGION_NAME" VARCHAR2(25)
   ) ;

GRANT REFERENCES ON "HR"."COUNTRIES" TO "OE";
GRANT SELECT ON "HR"."LOCATIONS" TO "OE";
GRANT REFERENCES ON "HR"."LOCATIONS" TO "OE";
GRANT SELECT ON "HR"."DEPARTMENTS" TO "OE";
GRANT SELECT ON "HR"."JOBS" TO "OE";
GRANT REFERENCES ON "HR"."EMPLOYEES" TO "OE";
GRANT SELECT ON "HR"."EMPLOYEES" TO "OE";
GRANT SELECT ON "HR"."JOB_HISTORY" TO "OE";
GRANT SELECT ON "HR"."COUNTRIES" TO "OE";
COMMENT ON COLUMN "HR"."COUNTRIES"."COUNTRY_ID" IS 'Primary key of countries table.';
COMMENT ON COLUMN "HR"."COUNTRIES"."COUNTRY_NAME" IS 'Country name';
COMMENT ON COLUMN "HR"."COUNTRIES"."REGION_ID" IS 'Region ID for the country. Foreign key to region_id column in the departments table.';
COMMENT ON TABLE "HR"."COUNTRIES"  IS 'country table. Contains 25 rows. References with locations table.';
COMMENT ON COLUMN "HR"."JOB_HISTORY"."EMPLOYEE_ID" IS 'A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the employee table';

COMMENT ON COLUMN "HR"."JOB_HISTORY"."START_DATE" IS 'A not null column in the complex primary key employee_id+start_date.
Must be less than the end_date of the job_history table. (enforced by
constraint jhist_date_interval)';

COMMENT ON COLUMN "HR"."JOB_HISTORY"."END_DATE" IS 'Last day of the employee in this job role. A not null column. Must be
greater than the start_date of the job_history table.
(enforced by constraint jhist_date_interval)';

COMMENT ON COLUMN "HR"."JOB_HISTORY"."JOB_ID" IS 'Job role in which the employee worked in the past; foreign key to
job_id column in the jobs table. A not null column.';

COMMENT ON COLUMN "HR"."JOB_HISTORY"."DEPARTMENT_ID" IS 'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table';
COMMENT ON TABLE "HR"."JOB_HISTORY"  IS 'Table that stores job history of the employees. If an employee
changes departments within the job or changes jobs within the department,
new rows get inserted into this table with old job information of the
employee. Contains a complex primary key: employee_id+start_date.
Contains 25 rows. References with jobs, employees, and departments tables.';

COMMENT ON COLUMN "HR"."EMPLOYEES"."EMPLOYEE_ID" IS 'Primary key of employees table.';
COMMENT ON COLUMN "HR"."EMPLOYEES"."FIRST_NAME" IS 'First name of the employee. A not null column.';
COMMENT ON COLUMN "HR"."EMPLOYEES"."LAST_NAME" IS 'Last name of the employee. A not null column.';
COMMENT ON COLUMN "HR"."EMPLOYEES"."EMAIL" IS 'Email id of the employee';
COMMENT ON COLUMN "HR"."EMPLOYEES"."PHONE_NUMBER" IS 'Phone number of the employee; includes country code and area code';
COMMENT ON COLUMN "HR"."EMPLOYEES"."HIRE_DATE" IS 'Date when the employee started on this job. A not null column.';
COMMENT ON COLUMN "HR"."EMPLOYEES"."JOB_ID" IS 'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.';

COMMENT ON COLUMN "HR"."EMPLOYEES"."SALARY" IS 'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)';

COMMENT ON COLUMN "HR"."EMPLOYEES"."COMMISSION_PCT" IS 'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage';

COMMENT ON COLUMN "HR"."EMPLOYEES"."MANAGER_ID" IS 'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)';

COMMENT ON COLUMN "HR"."EMPLOYEES"."DEPARTMENT_ID" IS 'Department id where employee works; foreign key to department_id
column of the departments table';

COMMENT ON TABLE "HR"."EMPLOYEES"  IS 'employees table. Contains 107 rows. References with departments,
jobs, job_history tables. Contains a self reference.';

COMMENT ON COLUMN "HR"."JOBS"."JOB_ID" IS 'Primary key of jobs table.';
COMMENT ON COLUMN "HR"."JOBS"."JOB_TITLE" IS 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT';
COMMENT ON COLUMN "HR"."JOBS"."MIN_SALARY" IS 'Minimum salary for a job title.';
COMMENT ON COLUMN "HR"."JOBS"."MAX_SALARY" IS 'Maximum salary for a job title';
COMMENT ON TABLE "HR"."JOBS"  IS 'jobs table with job titles and salary ranges. Contains 19 rows.
References with employees and job_history table.';

COMMENT ON COLUMN "HR"."DEPARTMENTS"."DEPARTMENT_ID" IS 'Primary key column of departments table.';
COMMENT ON COLUMN "HR"."DEPARTMENTS"."DEPARTMENT_NAME" IS 'A not null column that shows name of a department. Administration,
Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public
Relations, Sales, Finance, and Accounting. ';

COMMENT ON COLUMN "HR"."DEPARTMENTS"."MANAGER_ID" IS 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.';
COMMENT ON COLUMN "HR"."DEPARTMENTS"."LOCATION_ID" IS 'Location id where a department is located. Foreign key to location_id column of locations table.';
COMMENT ON TABLE "HR"."DEPARTMENTS"  IS 'Departments table that shows details of departments where employees
work. Contains 27 rows; references with locations, employees, and job_history tables.';

COMMENT ON COLUMN "HR"."LOCATIONS"."LOCATION_ID" IS 'Primary key of locations table';
COMMENT ON COLUMN "HR"."LOCATIONS"."STREET_ADDRESS" IS 'Street address of an office, warehouse, or production site of a company.
Contains building number and street name';

COMMENT ON COLUMN "HR"."LOCATIONS"."POSTAL_CODE" IS 'Postal code of the location of an office, warehouse, or production site
of a company. ';

COMMENT ON COLUMN "HR"."LOCATIONS"."CITY" IS 'A not null column that shows city where an office, warehouse, or
production site of a company is located. ';

COMMENT ON COLUMN "HR"."LOCATIONS"."STATE_PROVINCE" IS 'State or Province where an office, warehouse, or production site of a
company is located.';

COMMENT ON COLUMN "HR"."LOCATIONS"."COUNTRY_ID" IS 'Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table.';

COMMENT ON TABLE "HR"."LOCATIONS"  IS 'Locations table that contains specific address of a specific office,
warehouse, and/or production site of a company. Does not store addresses /
locations of customers. Contains 23 rows; references with the
departments and countries tables. ';

CREATE OR REPLACE EDITIONABLE PROCEDURE "HR"."ADD_JOB_HISTORY"
  (  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history;
/

CREATE OR REPLACE EDITIONABLE PROCEDURE "HR"."SECURE_DML"
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;
/


ALTER PROCEDURE "HR"."SECURE_DML"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2018-10-12 12:11:45'
/


ALTER PROCEDURE "HR"."ADD_JOB_HISTORY"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2018-10-12 12:11:45'
/

CREATE INDEX "HR"."JHIST_DEPARTMENT_IX" ON "HR"."JOB_HISTORY" ("DEPARTMENT_ID")
  ;

CREATE UNIQUE INDEX "HR"."JHIST_EMP_ID_ST_DATE_PK" ON "HR"."JOB_HISTORY" ("EMPLOYEE_ID", "START_DATE")
  ;

CREATE INDEX "HR"."JHIST_JOB_IX" ON "HR"."JOB_HISTORY" ("JOB_ID")
  ;

CREATE INDEX "HR"."JHIST_EMPLOYEE_IX" ON "HR"."JOB_HISTORY" ("EMPLOYEE_ID")
  ;

CREATE UNIQUE INDEX "HR"."EMP_EMAIL_UK" ON "HR"."EMPLOYEES" ("EMAIL")
  ;

CREATE UNIQUE INDEX "HR"."EMP_EMP_ID_PK" ON "HR"."EMPLOYEES" ("EMPLOYEE_ID")
  ;

CREATE INDEX "HR"."EMP_DEPARTMENT_IX" ON "HR"."EMPLOYEES" ("DEPARTMENT_ID")
  ;

CREATE INDEX "HR"."EMP_JOB_IX" ON "HR"."EMPLOYEES" ("JOB_ID")
  ;

CREATE INDEX "HR"."EMP_MANAGER_IX" ON "HR"."EMPLOYEES" ("MANAGER_ID")
  ;

CREATE INDEX "HR"."EMP_NAME_IX" ON "HR"."EMPLOYEES" ("LAST_NAME", "FIRST_NAME")
  ;

CREATE UNIQUE INDEX "HR"."JOB_ID_PK" ON "HR"."JOBS" ("JOB_ID")
  ;

CREATE UNIQUE INDEX "HR"."DEPT_ID_PK" ON "HR"."DEPARTMENTS" ("DEPARTMENT_ID")
  ;

CREATE INDEX "HR"."DEPT_LOCATION_IX" ON "HR"."DEPARTMENTS" ("LOCATION_ID")
  ;

CREATE INDEX "HR"."LOC_CITY_IX" ON "HR"."LOCATIONS" ("CITY")
  ;

CREATE INDEX "HR"."LOC_STATE_PROVINCE_IX" ON "HR"."LOCATIONS" ("STATE_PROVINCE")
  ;

CREATE INDEX "HR"."LOC_COUNTRY_IX" ON "HR"."LOCATIONS" ("COUNTRY_ID")
  ;

CREATE UNIQUE INDEX "HR"."LOC_ID_PK" ON "HR"."LOCATIONS" ("LOCATION_ID")
  ;

CREATE UNIQUE INDEX "HR"."REG_ID_PK" ON "HR"."REGIONS" ("REGION_ID")
  ;

ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_ID_ST_DATE_PK" PRIMARY KEY ("EMPLOYEE_ID", "START_DATE")
  USING INDEX  ENABLE;

ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_DATE_INTERVAL" CHECK (end_date > start_date) ENABLE;
ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_EMP_ID_PK" PRIMARY KEY ("EMPLOYEE_ID")
  USING INDEX  ENABLE;

ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_EMAIL_UK" UNIQUE ("EMAIL")
  USING INDEX  ENABLE;

ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_SALARY_MIN" CHECK (salary > 0) ENABLE;
ALTER TABLE "HR"."JOBS" ADD CONSTRAINT "JOB_ID_PK" PRIMARY KEY ("JOB_ID")
  USING INDEX  ENABLE;

ALTER TABLE "HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_ID_PK" PRIMARY KEY ("DEPARTMENT_ID")
  USING INDEX  ENABLE;

ALTER TABLE "HR"."LOCATIONS" ADD CONSTRAINT "LOC_ID_PK" PRIMARY KEY ("LOCATION_ID")
  USING INDEX  ENABLE;

ALTER TABLE "HR"."REGIONS" ADD CONSTRAINT "REG_ID_PK" PRIMARY KEY ("REGION_ID")
  USING INDEX  ENABLE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "HR"."EMP_DETAILS_VIEW" ("EMPLOYEE_ID",
"JOB_ID",
"MANAGER_ID",
"DEPARTMENT_ID",
"LOCATION_ID",
"COUNTRY_ID",
"FIRST_NAME",
"LAST_NAME",
"SALARY",
"COMMISSION_PCT",
"DEPARTMENT_NAME",
"JOB_TITLE",
"CITY",
"STATE_PROVINCE",
"COUNTRY_NAME",
"REGION_NAME") AS
  SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
WITH READ ONLY;

ALTER TABLE "HR"."COUNTRIES" ADD CONSTRAINT "COUNTR_REG_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "HR"."REGIONS" ("REGION_ID") ENABLE;

ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "HR"."JOBS" ("JOB_ID") ENABLE;

ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_FK" FOREIGN KEY ("EMPLOYEE_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;

ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "HR"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;

ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "HR"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;

ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "HR"."JOBS" ("JOB_ID") ENABLE;

ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_MANAGER_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;

ALTER TABLE "HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_LOC_FK" FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "HR"."LOCATIONS" ("LOCATION_ID") ENABLE;

ALTER TABLE "HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_MGR_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;

ALTER TABLE "HR"."LOCATIONS" ADD CONSTRAINT "LOC_C_ID_FK" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "HR"."COUNTRIES" ("COUNTRY_ID") ENABLE;

CREATE OR REPLACE EDITIONABLE TRIGGER "HR"."SECURE_EMPLOYEES"
  BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
  secure_dml;
END secure_employees;
/

ALTER TRIGGER "HR"."SECURE_EMPLOYEES" DISABLE;
CREATE OR REPLACE EDITIONABLE TRIGGER "HR"."UPDATE_JOB_HISTORY"
  AFTER UPDATE OF job_id, department_id ON employees
  FOR EACH ROW
BEGIN
  add_job_history(:old.employee_id, :old.hire_date, sysdate,
                  :old.job_id, :old.department_id);
END;
/

ALTER TRIGGER "HR"."UPDATE_JOB_HISTORY" ENABLE;