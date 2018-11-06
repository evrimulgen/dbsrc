CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."DBPARAMS_T" AS OBJECT (
    param_name     VARCHAR2(30),
    param_value    VARCHAR2(100))
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."RAC_INSTANCE_T" AS OBJECT (
    instance_name  VARCHAR2(30),
    pref_or_avail  CHAR(1)          -- 'P' (preferred)
                                    -- 'A' (available)
)
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."GSM_CHANGE_MESSAGE" AS OBJECT (
   admin_id             NUMBER,
   change_id            NUMBER,
   seq#                 NUMBER,
   command              VARCHAR2(30),
   target               VARCHAR2(64),
   pool_name            VARCHAR2(30),     -- Only for pool admin actions
   additional_params    VARCHAR2(1024)    -- Additional parameters for the command
                                          -- Depends on the command and is not used
                                          -- for all commands.  Uses the same syntax
                                          -- as in the gsmctl command.  For example
                                          -- for START SERVICE may contain the
                                          -- database name:
                                          --        "-database db_name"
)
 ALTER TYPE "GSMADMIN_INTERNAL"."GSM_CHANGE_MESSAGE"
   MODIFY ATTRIBUTE additional_params VARCHAR(4000) CASCADE
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."GSM_T" FORCE IS OBJECT ( name      varchar2(30),
                                         endpoint  varchar2(4000),
                                         ons_port  number,
                                         region    varchar2(30) );
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."REGION_T" FORCE IS OBJECT ( name      varchar2(30),
                                            buddy     varchar2(30) );
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."INSTANCE_T" FORCE IS OBJECT ( virt_name      varchar2(30),
                                              instance_name  varchar2(30) );
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."SERVICE_T" FORCE IS OBJECT (
                                  svc_name        varchar2(64),
                                  svc_network_name              varchar2(512),
                                  svc_failover_method           varchar2(64),
                                  svc_failover_type             varchar2(64),
                                  svc_failover_retries          number(10),
                                  svc_failover_delay            number(10),
                                  svc_runtime_balance           varchar2(12),
                                  svc_dtp                       varchar2(1),
                                  svc_notification              varchar2(3),
                                  svc_load_balance              varchar2(5),
                                  svc_edition                   varchar2(128),
                                  svc_commit_outcome            varchar2(3),
                                  svc_retention_timeout         number,
                                  svc_replay_initiation_timeout number,
                                  svc_session_state_consistency varchar2(128),
                                  svc_pdb                       varchar2(128),
                                  svc_sql_translation_profile   varchar2(261),
                                  svc_lag                       varchar(128),
                                  svc_locality                  number,
                                  svc_region_failover           number);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."SERVICE_DSC_T" force as object(
  service_name              varchar2(100),
  network_name              varchar2(512),
  rlb_goal                  number,
  clb_goal                  number,
  distr_trans               number,
  aq_notifications          number,
  lag_property              number,
  max_lag_value             number,
  failover_method           varchar2(64),
  failover_type             varchar2(64),
  failover_retries          number,
  failover_delay            number,
  edition                   varchar2(128),
  pdb                       varchar2(128),
  commit_outcome            number,
  retention_timeout         number,
  replay_initiation_timeout number,
  session_state_consistency varchar2(128),
  sql_translation_profile   varchar2(261),
  locality                  number,
  region_failover           number,
  role                      number,
  network_number            number,
  server_pool               varchar2(128),
  cardinality               number,

  proxy_db                  number,
  to_be_started             number,
  do_modify_local           number,
  instances                 varchar2(4000),

  -- This parameter specifies the proxy service.
  is_public                 number
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."WARNING_T" force as object (
  code int,
  message varchar2(1024)
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."PARAM_VALUE_T" FORCE is OBJECT (value_string varchar2(1024));
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."MESSAGE_PARAM" is OBJECT (param_string varchar2(30));
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."TVERS_REC" IS OBJECT (
   vers_str       varchar(30), -- string version
   vers_num       number       -- numeric version
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."VERS_LIST" IS VARRAY(5) OF NUMBER;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."GSM_SESSION" IS OBJECT (
   sessionid        NUMBER,    -- session id
   gsmname          VARCHAR2(256)  -- gsm name
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."DBPARAMS_LIST" IS VARRAY(10) OF dbparams_t
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."INSTANCE_LIST" IS TABLE OF rac_instance_t
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."GSM_LIST_T" IS TABLE OF gsm_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."REGION_LIST_T" IS TABLE OF region_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."INSTANCE_LIST_T" IS TABLE OF instance_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."SERVICE_LIST_T" IS TABLE OF service_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."SERVICE_DSC_LIST_T" IS TABLE OF service_dsc_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."WARNING_LIST_T" IS TABLE OF warning_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."MESSAGE_PARAM_LIST" is varray(8) of message_param;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."PARAM_VALUE_LIST_T" IS TABLE OF param_value_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."TVERS_LOOKUP_T" IS TABLE OF tvers_rec;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."VERS_LOOKUP_REC" IS OBJECT (
   vers             number,    -- version to check
   comp_vers        vers_list  -- compatible versions
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."GSM_INFO" IS OBJECT (cloud_name     varchar2(30),
                                           dbpool_name    varchar2(30),
                                           region_name    varchar2(30),
                                           database_num   number,
                                           gsm_list       gsm_list_t,
                                           instance_list  instance_list_t,
                                           region_list    region_list_t,
                                           service_list   service_list_t,
                                           scan_name      varchar2(30),
                                           ons_port       number,
                                           dbrole         varchar(30),
                                           cpu_threshold  number,
                                           srlat_threshold number,
                                           db_vers        number);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."DATABASE_DSC_T" as object (
  version     number,

  do_sync_db   number,
  do_start_svc number,
  do_mod_local_svc number,

  want_ons_config number,

  db_number   number,
  cloud_name  varchar2(100),
  dbpool_name varchar2(100),
  region_name varchar2(100),
  num_inst    number,
  cpu_thld    number,
  disk_thld   number,
  do_force    number,

  service_list   service_dsc_list_t,
  region_list    region_list_t,
  gsm_list       gsm_list_t,

  ons_port  varchar2(256),
  scan_name varchar2(256),
  hostname  varchar2(256),
  db_type   char,

  status number
);
/

CREATE OR REPLACE NONEDITIONABLE TYPE "GSMADMIN_INTERNAL"."VERS_LOOKUP_T" IS TABLE OF vers_lookup_rec;
/

