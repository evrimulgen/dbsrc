CREATE USER "ORACLE_OCM" IDENTIFIED BY VALUES 'S:8FB790A65325CA6858454A857A4FE43D14E09D2FE5AFFD505315366FCCDD;H:E996810BF4EA0012FDF5CC7AB81C9146;T:DBA1465474E3F9A86331D26371E49331E69A21B706EE37372E83136F47631967DB97C8A673FB2A6A9DFCC41ADB8F5B97DB2F09AC5A1214974B232D8EFF6BA51D96CDC8D21F303A750400150F9A1B7781;5A2E026A9157958C'
      DEFAULT TABLESPACE "USERS"
      TEMPORARY TABLESPACE "TEMP"
      PASSWORD EXPIRE
      ACCOUNT LOCK;

ALTER USER "ORACLE_OCM" DEFAULT ROLE ALL;
CREATE OR REPLACE NONEDITIONABLE PACKAGE "ORACLE_OCM"."MGMT_DB_LL_METRICS" AS

TYPE GenericCurType IS REF CURSOR;
/*
This is the version of the livelink package.
Update this if there is any change in the PL/SQL.
Its read by the configVersion.pl script to obtain the installed version
of the PL/SQL.
*/
ORACLE_DATABASE_META_VER CONSTANT VARCHAR(17) := '10.3.7.0.2';
VERSION_817 CONSTANT VARCHAR(3) := '817';
VERSION_9i CONSTANT VARCHAR(3) := '9i';
VERSION_9iR2 CONSTANT VARCHAR(4) := '9iR2';
VERSION_10gR1 CONSTANT VARCHAR(5) := '10gR1';
VERSION_10gR2 CONSTANT VARCHAR(5) := '10gR2';
VERSION_11gR1 CONSTANT VARCHAR(5) := '11gR1';
VERSION_11gR2 CONSTANT VARCHAR(5) := '11gR2';
VERSION_12gR1 CONSTANT VARCHAR(5) := '12gR1';
MIN_SUPPORTED_VERSION CONSTANT VARCHAR2(10) := '08.1.7.0.0';
/*
	Not Supported Version
*/
NOT_SUPPORTED_VERSION CONSTANT VARCHAR(3) := 'NSV';
/*
	Higher Supported Version
*/
HIGHER_SUPPORTED_VERSION CONSTANT VARCHAR(3) := 'HSV';

/*
Puts the config data into the file
By default, this procedure does not raise an exception.
To raise an exception, pass "raise_exp" as TRUE.
*/
procedure collect_config_metrics(directory_location IN VARCHAR2,
  raise_exp BOOLEAN DEFAULT FALSE);

/*
Write some DB info to a file (for RAC discovery/ADR info collection)
By default, this procedure does not raise an exception.
To raise an exception, pass "raise_exp" as TRUE.
*/
procedure write_db_ccr_file(directory_location IN VARCHAR2,
  raise_exp BOOLEAN DEFAULT FALSE);

/*
Puts the statistics config data into the file
By default, this procedure does not raise an exception.
To raise an exception, pass "raise_exp" as TRUE.
*/
procedure collect_stats_metrics(directory_location IN VARCHAR2,
  raise_exp BOOLEAN DEFAULT FALSE);

/*
 Compute the version category
*/
FUNCTION get_version_category RETURN VARCHAR2;

END MGMT_DB_LL_METRICS;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "ORACLE_OCM"."MGMT_CONFIG" AS
/*
Submit a job to collect the configuration.
Basically, a job with what->printCollectConfigMetrics(<collection directory>
*/
procedure submit_job;

/*
Runs the configuration collection job now.
*/
procedure run_now;

/*
Stop the job.
*/
procedure stop_job;

/*
Print the job details.
*/
procedure print_job_details;

/*
Config collection job
*/
procedure collect_config;


/*
Statistics collection job
*/
procedure collect_stats;

END MGMT_CONFIG;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "ORACLE_OCM"."MGMT_CONFIG_UTL"
AUTHID CURRENT_USER AS
/*
Create or replace the directory object to recreate the path based on
new ORACLE_HOME.
Note:
  1. This procedure is executed with invoker's rights. This is needed so that
     ORACLE_OCM user does not need to be granted "execute" permission on "dbms_system" package.
     Only SYS would be able to run this procedure without error as it has the privilege to execute "dbms_system" and re-create
     the directory object ORACLE_OCM_CONFIG_DIR owned by it.
  2. This procedure is only supported from release 10.2 onwards that supports dbms_system.get_env.
*/
procedure create_replace_dir_obj;
END MGMT_CONFIG_UTL;
/

