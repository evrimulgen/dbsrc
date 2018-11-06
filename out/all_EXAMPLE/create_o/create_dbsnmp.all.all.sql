CREATE USER "DBSNMP" IDENTIFIED BY VALUES 'S:8B0218F15EBE519268A4266BF4AE3FCC78A1DA3FF88A25552D5ABFE32D7D;H:ABBCDC5CD29150388884FA4D59ABADD6;T:084DCFAB89A265FB78E04FC4BA52786A5BD23376D83C290091EB3E13A0DB736C01A01AD22BCD728599A609A04CE1FF4EA04C092278334F85156E3C8A0BA78FEF8CC21BD539A8F8CAF87412B63E70D168;E066D214D5421CCC'
      DEFAULT TABLESPACE "SYSAUX"
      TEMPORARY TABLESPACE "TEMP"
      PASSWORD EXPIRE
      ACCOUNT LOCK;

ALTER USER "DBSNMP" DEFAULT ROLE ALL;
CREATE SEQUENCE  "DBSNMP"."MGMT_RESPONSE_CAPTURE_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ORDER  NOCYCLE  NOPARTITION ;
CREATE SEQUENCE  "DBSNMP"."MGMT_RESPONSE_SNAPSHOT_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ORDER  NOCYCLE  NOPARTITION ;
CREATE OR REPLACE NONEDITIONABLE SYNONYM "DBSNMP"."MGMT_BSLN" FOR "DBSNMP"."BSLN";
CREATE OR REPLACE NONEDITIONABLE TYPE "DBSNMP"."BSLN_METRIC_T" as object
  (metric_id number
  ,status    varchar2(16)
  );
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DBSNMP"."BSLN_VARIANCE_T" as object
  (metric_id             number
  ,bsln_guid             raw(16)
  ,timegrouping          varchar2(2)
  ,timegroup_hours       number
  ,timegroup_cardinality number
  ,timegroup_variance    number
  );
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DBSNMP"."BSLN_OBSERVATION_T" as object
  (metric_id number
  ,bsln_guid raw(16)
  ,timegroup varchar2(5)
  ,obs_time  date
  ,obs_value number
  );
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DBSNMP"."BSLN_STATISTICS_T" as object
  (bsln_guid        raw(16)
  ,metric_id        number
  ,compute_date     date
  ,timegrouping     varchar2(2)
  ,timegroup        varchar2(5)
  ,sample_count     number
  ,average          number
  ,minimum          number
  ,maximum          number
  ,sdev             number
  ,pctile_25        number
  ,pctile_50        number
  ,pctile_75        number
  ,pctile_90        number
  ,pctile_95        number
  ,pctile_99        number
  ,est_sample_count number
  ,est_slope        number
  ,est_intercept    number
  ,est_fit_quality  number
  ,est_pctile_999   number
  ,est_pctile_9999  number
  );
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DBSNMP"."BSLN_METRIC_SET" as table of bsln_metric_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DBSNMP"."BSLN_VARIANCE_SET" as table of bsln_variance_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DBSNMP"."BSLN_OBSERVATION_SET" as table of bsln_observation_t;
/

CREATE OR REPLACE NONEDITIONABLE TYPE "DBSNMP"."BSLN_STATISTICS_SET" as table of bsln_statistics_t;
/

CREATE TABLE "DBSNMP"."BSLN_TIMEGROUPS"
   (	"HOUR" NUMBER,
	"INTRADAY" VARCHAR2(2),
	"EXTRADAY" VARCHAR2(2),
	 CONSTRAINT "BSLN_TIMEGROUPS_PK" PRIMARY KEY ("HOUR") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS ;

CREATE TABLE "DBSNMP"."MGMT_SNAPSHOT"
   (	"INSTANCE_NUMBER" NUMBER,
	"SNAP_ID" NUMBER,
	"CAPTURE_TIME" DATE,
	"DB_TIME" NUMBER,
	"CPU_TIME" NUMBER,
	"APPLICATION_WAIT_TIME" NUMBER,
	"CLUSTER_WAIT_TIME" NUMBER,
	"USER_IO_WAIT_TIME" NUMBER,
	"CONCURRENCY_WAIT_TIME" NUMBER
   ) ;

CREATE TABLE "DBSNMP"."MGMT_SNAPSHOT_SQL"
   (	"SNAP_ID" NUMBER,
	"SQL_ID" VARCHAR2(13),
	"HASH_VALUE" NUMBER,
	"CHILD_NUMBER" NUMBER,
	"ELAPSED_TIME" NUMBER,
	"EXECUTIONS" NUMBER
   ) ;

CREATE TABLE "DBSNMP"."MGMT_BASELINE"
   (	"INSTANCE_NUMBER" NUMBER,
	"CAPTURE_TIME" DATE,
	"PREV_CAPTURE_TIME" DATE,
	"DB_TIME" NUMBER,
	"CPU_TIME" NUMBER,
	"APPLICATION_WAIT_TIME" NUMBER,
	"CLUSTER_WAIT_TIME" NUMBER,
	"USER_IO_WAIT_TIME" NUMBER,
	"CONCURRENCY_WAIT_TIME" NUMBER
   ) ;

CREATE TABLE "DBSNMP"."MGMT_BASELINE_SQL"
   (	"INSTANCE_NUMBER" NUMBER,
	"SQL_TEXT" VARCHAR2(1000),
	"SQL_ID" VARCHAR2(13),
	"HASH_VALUE" NUMBER,
	"EXECUTIONS" NUMBER,
	"ELAPSED_TIME" NUMBER,
	"T_PER_EXEC" NUMBER
   ) ;

CREATE TABLE "DBSNMP"."MGMT_CAPTURE"
   (	"INSTANCE_NUMBER" NUMBER,
	"CAPTURE_ID" NUMBER,
	"CAPTURE_TIME" DATE,
	"DB_TIME" NUMBER,
	"CPU_TIME" NUMBER,
	"APPLICATION_WAIT_TIME" NUMBER,
	"CLUSTER_WAIT_TIME" NUMBER,
	"USER_IO_WAIT_TIME" NUMBER,
	"CONCURRENCY_WAIT_TIME" NUMBER
   ) ;

CREATE TABLE "DBSNMP"."MGMT_CAPTURE_SQL"
   (	"CAPTURE_ID" NUMBER,
	"SQL_ID" VARCHAR2(13),
	"HASH_VALUE" NUMBER,
	"ELAPSED_TIME" NUMBER,
	"EXECUTIONS" NUMBER
   ) ;

CREATE TABLE "DBSNMP"."MGMT_RESPONSE_CONFIG"
   (	"INSTANCE_NUMBER" NUMBER,
	"STARTUP_TIME" DATE
   ) ;

CREATE TABLE "DBSNMP"."MGMT_LATEST"
   (	"INSTANCE_NUMBER" NUMBER,
	"CAPTURE_ID" NUMBER,
	"CAPTURE_TIME" DATE,
	"PREV_CAPTURE_TIME" DATE,
	"SQL_RESPONSE_TIME" NUMBER,
	"ADJUSTED_SQL_RESPONSE_TIME" NUMBER,
	"BASELINE_SQL_RESPONSE_TIME" NUMBER,
	"RELATIVE_SQL_RESPONSE_TIME" NUMBER,
	"DB_TIME" NUMBER,
	"CPU_TIME" NUMBER,
	"APPLICATION_WAIT_TIME" NUMBER,
	"CLUSTER_WAIT_TIME" NUMBER,
	"USER_IO_WAIT_TIME" NUMBER,
	"CONCURRENCY_WAIT_TIME" NUMBER
   ) ;

CREATE TABLE "DBSNMP"."MGMT_LATEST_SQL"
   (	"CAPTURE_ID" NUMBER,
	"SQL_ID" VARCHAR2(13),
	"HASH_VALUE" NUMBER,
	"EXECUTIONS" NUMBER,
	"ELAPSED_TIME" NUMBER,
	"T_PER_EXEC" NUMBER,
	"ADJUSTED_ELAPSED_TIME" NUMBER
   ) ;

CREATE TABLE "DBSNMP"."MGMT_HISTORY"
   (	"INSTANCE_NUMBER" NUMBER,
	"CAPTURE_ID" NUMBER,
	"CAPTURE_TIME" DATE,
	"PREV_CAPTURE_TIME" DATE,
	"SQL_RESPONSE_TIME" NUMBER,
	"ADJUSTED_SQL_RESPONSE_TIME" NUMBER,
	"BASELINE_SQL_RESPONSE_TIME" NUMBER,
	"RELATIVE_SQL_RESPONSE_TIME" NUMBER,
	"DB_TIME" NUMBER,
	"CPU_TIME" NUMBER,
	"APPLICATION_WAIT_TIME" NUMBER,
	"CLUSTER_WAIT_TIME" NUMBER,
	"USER_IO_WAIT_TIME" NUMBER,
	"CONCURRENCY_WAIT_TIME" NUMBER
   ) ;

CREATE TABLE "DBSNMP"."MGMT_HISTORY_SQL"
   (	"CAPTURE_ID" NUMBER,
	"SQL_ID" VARCHAR2(13),
	"HASH_VALUE" NUMBER,
	"EXECUTIONS" NUMBER,
	"ELAPSED_TIME" NUMBER,
	"T_PER_EXEC" NUMBER,
	"ADJUSTED_ELAPSED_TIME" NUMBER
   ) ;

CREATE TABLE "DBSNMP"."BSLN_METRIC_DEFAULTS"
   (	"METRIC_ID" NUMBER,
	"STATUS" VARCHAR2(16),
	"CATEGORY" VARCHAR2(16)
   ) ;

CREATE TABLE "DBSNMP"."BSLN_BASELINES"
   (	"DBID" NUMBER,
	"INSTANCE_NAME" VARCHAR2(16),
	"BASELINE_ID" NUMBER,
	"BSLN_GUID" RAW(16),
	"TIMEGROUPING" VARCHAR2(2),
	"AUTO_TIMEGROUP" VARCHAR2(1),
	"STATUS" VARCHAR2(16),
	"LAST_COMPUTE_DATE" DATE
   ) ;

CREATE TABLE "DBSNMP"."BSLN_STATISTICS"
   (	"BSLN_GUID" RAW(16),
	"METRIC_ID" NUMBER,
	"COMPUTE_DATE" DATE,
	"TIMEGROUPING" VARCHAR2(2),
	"TIMEGROUP" VARCHAR2(5),
	"SAMPLE_COUNT" NUMBER,
	"AVERAGE" NUMBER,
	"MINIMUM" NUMBER,
	"MAXIMUM" NUMBER,
	"SDEV" NUMBER,
	"PCTILE_25" NUMBER,
	"PCTILE_50" NUMBER,
	"PCTILE_75" NUMBER,
	"PCTILE_90" NUMBER,
	"PCTILE_95" NUMBER,
	"PCTILE_99" NUMBER,
	"EST_SAMPLE_COUNT" NUMBER,
	"EST_SLOPE" NUMBER,
	"EST_INTERCEPT" NUMBER,
	"EST_FIT_QUALITY" NUMBER,
	"EST_PCTILE_999" NUMBER,
	"EST_PCTILE_9999" NUMBER
   ) ;

CREATE TABLE "DBSNMP"."BSLN_THRESHOLD_PARAMS"
   (	"BSLN_GUID" RAW(16),
	"METRIC_ID" NUMBER,
	"THRESHOLD_METHOD" VARCHAR2(16),
	"NUM_OCCURRENCES" NUMBER,
	"WARNING_PARAM" NUMBER,
	"CRITICAL_PARAM" NUMBER,
	"FAIL_ACTION" VARCHAR2(16),
	"ADAPTIVE" VARCHAR2(1),
	"LAST_SET_DATE" DATE,
	"IN_EFFECT" VARCHAR2(1)
   ) ;

CREATE TABLE "DBSNMP"."MGMT_DB_FEATURE_LOG"
   (	"SOURCE" VARCHAR2(30),
	"LAST_UPDATE_DATE" TIMESTAMP (6) WITH TIME ZONE
   ) ;

CREATE GLOBAL TEMPORARY TABLE "DBSNMP"."MGMT_TEMPT_SQL"
   (	"SQL_ID" VARCHAR2(13),
	"HASH_VALUE" NUMBER,
	"ELAPSED_TIME" NUMBER,
	"EXECUTIONS" NUMBER
   ) ON COMMIT DELETE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "DBSNMP"."MGMT_DB_FILE_GTT"
   (	"TABLESPACE_NAME" VARCHAR2(30),
	"MEG" NUMBER,
	"MAX_MEG" NUMBER,
	"FILE_NAME" VARCHAR2(513),
	"FILE_ID" NUMBER,
	"TS#" NUMBER,
	"BLOCKSIZE" NUMBER,
	"FLAG" NUMBER
   ) ON COMMIT DELETE ROWS ;

CREATE GLOBAL TEMPORARY TABLE "DBSNMP"."MGMT_DB_SIZE_GTT"
   (	"TABLESPACE_NAME" VARCHAR2(30),
	"SZ" NUMBER
   ) ON COMMIT DELETE ROWS ;

COMMENT ON TABLE "DBSNMP"."BSLN_METRIC_DEFAULTS"  IS 'Default Attributes of Baselineable Metrics';
COMMENT ON TABLE "DBSNMP"."BSLN_TIMEGROUPS"  IS 'Weekday/Weeknight and Day/Night Timegroup Definitions';
COMMENT ON TABLE "DBSNMP"."BSLN_BASELINES"  IS 'Baselines Designated for Metric Statistics Calculation';
COMMENT ON TABLE "DBSNMP"."BSLN_STATISTICS"  IS 'Metric Statistics for Baselines';
COMMENT ON TABLE "DBSNMP"."BSLN_THRESHOLD_PARAMS"  IS 'Baseline Metric Threshold Parameters';
CREATE OR REPLACE NONEDITIONABLE PACKAGE "DBSNMP"."MGMT_RESPONSE" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
9
402 21f
FGzRNO47I7axCfXBmchUBiXIj/swg2NemMCGfHQ0PPmejj4aiHi+PJQur2/GBoamUK3qTWXq
Q3/B5LVG8QbbC/q+BsU1mG1spqz6tO0xqHpzQiPrndCwsZzB6+9Xh+GpdrasgKgXPckGWntn
Sje4me+guY0FdthTBKafFlsUuQvm+o6PcIVhQD/LFaKz4Le9r9OrNVUE1P9E2Fd1GuKzErj7
5jP9GpQ2AQgVD2kQQyVwB5UCqjJFY30kzQ4nssS1R9rZZFTmYLO8ZkgLvdvncpRUcouTt/KG
V+hMv3OyScnQI1MeEq0sTEIfjqqMc8k2PPUrxrrl1CjbVnjbPuvLKp/XfkQPfh5UZqRkMN9b
w/R4tMCBIy1iPel6wyFVGiPUa9W6r5skywbkxqkKyYLkTHSRRN9DPhEJ/G4qc8se1lJlzFYf
bemtvX6ck8iL6ci+adEZcCQA4BZiLzkSblw863hc7P0YCvIPFIOJqIH9s0lv27CUcBHouBA/
RowII5PDj7+HoNgnGDdSc4akQWOUkg==
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DBSNMP"."BSLN"
as
  ----------------------------------------------------------------------------
  --
  --    package subtypes
  --
  ----------------------------------------------------------------------------

  subtype guid_t             is bsln_baselines.bsln_guid%TYPE;
  subtype timegroup_field_t  is bsln_timegroups.intraday%TYPE;
  subtype timegroup_t        is bsln_statistics.timegroup%TYPE;
  subtype timegrouping_t     is bsln_statistics.timegrouping%TYPE;
  subtype fail_action_t      is bsln_threshold_params.fail_action%TYPE;
  subtype threshold_method_t is bsln_threshold_params.threshold_method%TYPE;
  subtype param_value_t      is bsln_threshold_params.critical_param%TYPE;
  subtype preferred_status_t is bsln_metric_defaults.status%TYPE;

  ----------------------------------------------------------------------------
  --
  --    externally visible constants and subtypes
  --
  ----------------------------------------------------------------------------

  K_TIMEGROUPING_FIELD_X constant varchar2(1) := 'X';
  K_TIMEGROUPING_FIELD_N constant varchar2(1) := 'N';
  K_TIMEGROUPING_FIELD_H constant varchar2(1) := 'H';
  K_TIMEGROUPING_FIELD_W constant varchar2(1) := 'W';
  K_TIMEGROUPING_FIELD_D constant varchar2(1) := 'D';

  K_TIMEGROUPING_XX constant timegrouping_t :=
    K_TIMEGROUPING_FIELD_X||K_TIMEGROUPING_FIELD_X;
  K_TIMEGROUPING_HX constant timegrouping_t :=
    K_TIMEGROUPING_FIELD_H||K_TIMEGROUPING_FIELD_X;
  K_TIMEGROUPING_XD constant timegrouping_t :=
    K_TIMEGROUPING_FIELD_X||K_TIMEGROUPING_FIELD_D;
  K_TIMEGROUPING_HD constant timegrouping_t :=
    K_TIMEGROUPING_FIELD_H||K_TIMEGROUPING_FIELD_D;
  K_TIMEGROUPING_XW constant timegrouping_t :=
    K_TIMEGROUPING_FIELD_X||K_TIMEGROUPING_FIELD_W;
  K_TIMEGROUPING_HW constant timegrouping_t :=
    K_TIMEGROUPING_FIELD_H||K_TIMEGROUPING_FIELD_W;
  K_TIMEGROUPING_NW constant timegrouping_t :=
    K_TIMEGROUPING_FIELD_N||K_TIMEGROUPING_FIELD_W;
  K_TIMEGROUPING_ND constant timegrouping_t :=
    K_TIMEGROUPING_FIELD_N||K_TIMEGROUPING_FIELD_D;
  K_TIMEGROUPING_NX constant timegrouping_t :=
    K_TIMEGROUPING_FIELD_N||K_TIMEGROUPING_FIELD_X;

  K_TIMEGROUP_FIELD_XX constant timegroup_field_t := 'XX';
  K_TIMEGROUP_FIELD_DY constant timegroup_field_t := 'DY';
  K_TIMEGROUP_FIELD_NT constant timegroup_field_t := 'NT';
  K_TIMEGROUP_FIELD_WD constant timegroup_field_t := 'WD';
  K_TIMEGROUP_FIELD_WE constant timegroup_field_t := 'WE';

  K_DEFAULT_NUM_OCCURS constant number := 2;

  K_FAIL_ACTION_UNSET    constant fail_action_t := 'UNSET';
  K_FAIL_ACTION_PRESERVE constant fail_action_t := 'PRESERVE';

  K_METHOD_SIGLVL constant threshold_method_t := 'SIGLVL';
  K_METHOD_PCTMAX constant threshold_method_t := 'PCTMAX';

  K_SIGLVL_95   constant param_value_t := 0.95;
  K_SIGLVL_99   constant param_value_t := 0.99;
  K_SIGLVL_999  constant param_value_t := 0.999;
  K_SIGLVL_9999 constant param_value_t := 0.9999;

  K_TRUE  constant integer := 1;
  K_FALSE constant integer := 0;
  K_YES   constant varchar2(1) := 'Y';
  K_NO    constant varchar2(1) := 'N';

  K_STATUS_ACTIVE   constant bsln_baselines.status%TYPE := 'ACTIVE';
  K_STATUS_INACTIVE constant bsln_baselines.status%TYPE := 'INACTIVE';

  K_STATUS_PREFERRED    constant preferred_status_t := 'PREFERRED';
  K_STATUS_NONPREFERRED constant preferred_status_t := 'NONPREFERRED';

  K_CATEGORY_PERFORMANCE constant bsln_metric_defaults.category%TYPE :=
            'PERFORMANCE';
  K_CATEGORY_DEMAND      constant bsln_metric_defaults.category%TYPE :=
            'DEMAND';
  K_CATEGORY_SHAPE       constant bsln_metric_defaults.category%TYPE :=
            'SHAPE';

  K_SCORE_MAXIMUM   constant number := 10.0;
  K_SCORE_HIGHINC   constant number := 5.0;
  K_SCORE_MEDIUMEXC constant number := 0.0;

  ----------------------------------------------------------------------------
  --
  --    package exception declarations
  --
  ----------------------------------------------------------------------------

  X_INVALID_BASELINE         constant number := -20101;
  X_INVALID_INTERVAL         constant number := -20102;
  -- X_DATASOURCE_NOT_FOUND  constant number := -20103;           -- DEPRECATED
  X_INVALID_THRESHOLD_METHOD constant number := -20104;
  X_INVALID_METRIC           constant number := -20105;
  X_BASELINE_NOT_FOUND       constant number := -20106;
  -- X_SOURCE_CONFLICT       constant number := -20107;           -- DEPRECATED
  X_NOT_SUPPORTED            constant number := -20108;
  X_BSLNTHR_ERROR            constant number := -20109;
  X_DEPRECATION_ERROR        constant number := -20110;
  X_INVALID_TIMEGROUPING     constant number := -20111;

  INVALID_BASELINE         exception;
  INVALID_INTERVAL         exception;
  -- DATASOURCE_NOT_FOUND  exception;                             -- DEPRECATED
  INVALID_THRESHOLD_METHOD exception;
  INVALID_METRIC           exception;
  BASELINE_NOT_FOUND       exception;
  -- SOURCE_CONFLICT       exception;                             -- DEPRECATED
  NOT_SUPPORTED            exception;
  BSLNTHR_ERROR            exception;
  DEPRECATION_ERROR        exception;
  INVALID_TIMEGROUPING     exception;

  PRAGMA EXCEPTION_INIT(INVALID_BASELINE, -20101);
  PRAGMA EXCEPTION_INIT(INVALID_INTERVAL, -20102);
  -- PRAGMA EXCEPTION_INIT(DATASOURCE_NOT_FOUND, -20103);         -- DEPRECATED
  PRAGMA EXCEPTION_INIT(INVALID_THRESHOLD_METHOD, -20104);
  PRAGMA EXCEPTION_INIT(INVALID_METRIC, -20105);
  PRAGMA EXCEPTION_INIT(BASELINE_NOT_FOUND, -20106);
  -- PRAGMA EXCEPTION_INIT(SOURCE_CONFLICT, -20107);              -- DEPRECATED
  PRAGMA EXCEPTION_INIT(NOT_SUPPORTED, -20108);
  PRAGMA EXCEPTION_INIT(BSLNTHR_ERROR, -20109);
  PRAGMA EXCEPTION_INIT(DEPRECATION_ERROR, -20110);
  PRAGMA EXCEPTION_INIT(INVALID_TIMEGROUPING, -20111);

  ----------------------------------------------------------------------------
  --
  --    utility routines
  --
  ----------------------------------------------------------------------------

  function target_uid(dbid_in         in number
                     ,instance_num_in in number)
  return guid_t;

  function this_target_uid
  return guid_t;

  function target_uid(dbid_in          in number
                     ,instance_name_in in varchar2)
  return guid_t
  DETERMINISTIC;

  function metric_uid(metric_id_in in number)
  return guid_t
  DETERMINISTIC;

  function datasource_guid(target_uid_in in guid_t                -- DEPRECATED
                          ,metric_uid_in in guid_t                -- DEPRECATED
                          ,key_value_in  in varchar2 := ' ')      -- DEPRECATED
  return guid_t                                                   -- DEPRECATED
  DETERMINISTIC;                                                  -- DEPRECATED

  function baseline_guid
    (baseline_id_in   in number
    ,instance_name_in in varchar2 := NULL
    ,dbid_in          in number := NULL)
  return guid_t;

  function moving_window_baseline_guid
    (instance_name_in in varchar2 := NULL
    ,dbid_in          in number := NULL)
  return guid_t;

  function timegroup(timegrouping_in in timegrouping_t
                    ,time_in         in date)
  return timegroup_t;

  function subinterval_code(subinterval_key_in in timegrouping_t  -- DEPRECATED
                           ,time_in            in date)           -- DEPRECATED
  return timegroup_t;                                             -- DEPRECATED

  function timegroup(timegrouping_in in timegrouping_t
                    ,hour_of_week_in in binary_integer)
  return timegroup_t;

  ----------------------------------------------------------------------------
  --
  --    administration routines
  --
  ----------------------------------------------------------------------------

  procedure update_moving_window                                  -- DEPRECATED
    (interval_days_in   in number                                 -- DEPRECATED
    ,subinterval_key_in in timegrouping_t                         -- DEPRECATED
    ,target_uid_in      in guid_t := NULL);                       -- DEPRECATED

  procedure create_baseline_static                                -- DEPRECATED
    (name_in            in varchar2                               -- DEPRECATED
    ,interval_begin_in  in date                                   -- DEPRECATED
    ,interval_end_in    in date                                   -- DEPRECATED
    ,subinterval_key_in in timegrouping_t                         -- DEPRECATED
    ,target_uid_in      in guid_t := NULL);                       -- DEPRECATED

  procedure drop_baseline                                         -- DEPRECATED
    (name_in       in varchar2                                    -- DEPRECATED
    ,target_uid_in in guid_t := NULL);                            -- DEPRECATED

  procedure register_datasource                                   -- DEPRECATED
    (dbid_in         in number                                    -- DEPRECATED
    ,instance_num_in in number                                    -- DEPRECATED
    ,metric_id_in    in number);                                  -- DEPRECATED

  procedure deregister_datasource                                 -- DEPRECATED
    (dbid_in         in number                                    -- DEPRECATED
    ,instance_num_in in number                                    -- DEPRECATED
    ,metric_id_in    in number);                                  -- DEPRECATED

  procedure set_default_timegrouping
    (timegrouping_in  in timegrouping_t
    ,instance_name_in in varchar2 := NULL
    ,dbid_in          in number := NULL);

  procedure activate_baseline                                     -- DEPRECATED
    (name_in       in varchar2                                    -- DEPRECATED
    ,target_uid_in in guid_t := NULL);                            -- DEPRECATED

  procedure deactivate_baseline                                   -- DEPRECATED
    (name_in       in varchar2                                    -- DEPRECATED
    ,target_uid_in in guid_t := NULL);                            -- DEPRECATED

  procedure set_threshold_parameters
    (bsln_guid_in        in guid_t
    ,metric_id_in        in number
    ,threshold_method_in in threshold_method_t
    ,warning_param_in    in param_value_t
    ,critical_param_in   in param_value_t
    ,num_occurs_in       in integer := K_DEFAULT_NUM_OCCURS
    ,fail_action_in      in fail_action_t := K_FAIL_ACTION_UNSET);

  procedure set_threshold_parameters                              -- DEPRECATED
    (bsln_guid_in        in guid_t                                -- DEPRECATED
    ,ds_guid_in          in guid_t                                -- DEPRECATED
    ,threshold_method_in in threshold_method_t                    -- DEPRECATED
    ,warning_param_in    in param_value_t                         -- DEPRECATED
    ,critical_param_in   in param_value_t                         -- DEPRECATED
    ,num_occurs_in       in integer := K_DEFAULT_NUM_OCCURS       -- DEPRECATED
    ,fail_action_in      in fail_action_t := K_FAIL_ACTION_UNSET);-- DEPRECATED

  procedure unset_threshold_parameters
    (bsln_guid_in in guid_t
    ,metric_id_in in number);

  ----------------------------------------------------------------------------
  -- enable/disable API, deprecated in 11.1
  ----------------------------------------------------------------------------
  procedure enable;                                               -- DEPRECATED
  procedure disable;                                              -- DEPRECATED
  function is_enabled return integer;                             -- DEPRECATED

  procedure delete_bsln_jobs;                                     -- DEPRECATED

  -----------------------------------------------------------------------------
  --
  --    operational routines
  --
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  -- automation hooks, deprecated in 11.1
  -----------------------------------------------------------------------------
  procedure set_all_thresholds;                                   -- DEPRECATED
  procedure compute_all_statistics;                               -- DEPRECATED

  -----------------------------------------------------------------------------
  -- statistics computation and quality (of extrapolation)
  -----------------------------------------------------------------------------
  function compute_statistics                                     -- DEPRECATED
    (bsln_name_in       in varchar2                               -- DEPRECATED
    ,interval_begin_in  in date                                   -- DEPRECATED
    ,interval_end_in    in date                                   -- DEPRECATED
    ,subinterval_key_in in timegrouping_t                         -- DEPRECATED
    ,target_uid_in      in guid_t := NULL)                        -- DEPRECATED
  return bsln_statistics_set;                                     -- DEPRECATED

  function data_and_model_OK
    (threshold_method_in in threshold_method_t
    ,threshold_param_in  in param_value_t
    ,sample_count_in     in number
    ,fit_quality_in      in number)
  return integer;

  ----------------------------------------------------------------------------
  -- metric quality as signal
  ----------------------------------------------------------------------------

  type signal_rectype is record
    (bsln_guid guid_t
    ,metric_id number
    ,quality   number);

  type signal_cvtype is ref cursor return signal_rectype;

  function metric_signal_qualities
    (bsln_guid_in      in guid_t
    ,metric_ids_in     in bsln_metric_set := NULL
    ,reference_time_in in date)
  return signal_cvtype;

  ----------------------------------------------------------------------------
  --
  --    SLPA declarations for Design by Contract support
  --
  ----------------------------------------------------------------------------
  ASSERTFAIL     EXCEPTION;
  ASSERTFAIL_C   CONSTANT INTEGER := -20999;
  PRAGMA EXCEPTION_INIT(ASSERTFAIL, -20999);
  PKGNAME_C      CONSTANT VARCHAR2(20) := 'BSLN';
  ----------------------------------------------------------------------------
end bsln;
/

CREATE OR REPLACE NONEDITIONABLE PACKAGE "DBSNMP"."BSLN_INTERNAL" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
9
24bf a88
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
/

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "DBSNMP"."MGMT_UPDATE_DB_FEATURE_LOG" (src IN VARCHAR2)
AS
    l_last_update_date mgmt_db_feature_log.last_update_date%TYPE;
    current_date mgmt_db_feature_log.last_update_date%TYPE;
    diff interval day(9) to second(9);
    diff_min NUMBER;
  BEGIN
    current_date := SYSTIMESTAMP;
    SELECT last_update_date
      INTO l_last_update_date
        FROM mgmt_db_feature_log
        WHERE source = src;
    diff := current_date - l_last_update_date;
    diff_min := EXTRACT(DAY FROM diff)*24*60+EXTRACT(HOUR FROM diff)*60+EXTRACT(MINUTE FROM diff);
    -- 2 hours 2x60=120
    IF (diff_min > 120) THEN
    	UPDATE mgmt_db_feature_log set last_update_date = current_date WHERE source = src;
	commit;
    END IF;
  EXCEPTION
    when NO_DATA_FOUND then
      BEGIN
        INSERT INTO mgmt_db_feature_log VALUES (src, systimestamp);
	commit;
      END;
  END;
/


ALTER PROCEDURE "DBSNMP"."MGMT_UPDATE_DB_FEATURE_LOG"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:07'
/

CREATE UNIQUE INDEX "DBSNMP"."INST_NUM_KEY" ON "DBSNMP"."MGMT_SNAPSHOT" ("INSTANCE_NUMBER")
  ;

CREATE UNIQUE INDEX "DBSNMP"."BSLN_METRIC_DEFAULTS_PK" ON "DBSNMP"."BSLN_METRIC_DEFAULTS" ("METRIC_ID")
  ;

CREATE UNIQUE INDEX "DBSNMP"."BSLN_BASELINES_PK2" ON "DBSNMP"."BSLN_BASELINES" ("BSLN_GUID")
  ;

CREATE UNIQUE INDEX "DBSNMP"."BSLN_BASELINES_UK2" ON "DBSNMP"."BSLN_BASELINES" ("DBID", "INSTANCE_NAME", "BASELINE_ID")
  ;

CREATE UNIQUE INDEX "DBSNMP"."BSLN_STATISTICS_PK1" ON "DBSNMP"."BSLN_STATISTICS" ("METRIC_ID", "COMPUTE_DATE", "TIMEGROUP", "BSLN_GUID")
  ;

CREATE UNIQUE INDEX "DBSNMP"."BSLN_THRESHOLDS_PK1" ON "DBSNMP"."BSLN_THRESHOLD_PARAMS" ("BSLN_GUID", "METRIC_ID")
  ;

CREATE UNIQUE INDEX "DBSNMP"."MGMT_DB_FILE_GTT_PK" ON "DBSNMP"."MGMT_DB_FILE_GTT" ("TABLESPACE_NAME", "FILE_ID") ;
CREATE UNIQUE INDEX "DBSNMP"."MGMT_DB_SIZE_GTT_PK" ON "DBSNMP"."MGMT_DB_SIZE_GTT" ("TABLESPACE_NAME") ;
CREATE UNIQUE INDEX "DBSNMP"."MGMT_DB_FEATURE_LOG_PK" ON "DBSNMP"."MGMT_DB_FEATURE_LOG" ("SOURCE")
  ;

ALTER TABLE "DBSNMP"."MGMT_SNAPSHOT" ADD CONSTRAINT "INST_NUM_KEY" UNIQUE ("INSTANCE_NUMBER")
  USING INDEX  ENABLE;

ALTER TABLE "DBSNMP"."BSLN_METRIC_DEFAULTS" ADD CONSTRAINT "BSLN_METRIC_DEFAULTS_PK" PRIMARY KEY ("METRIC_ID")
  USING INDEX  ENABLE;

ALTER TABLE "DBSNMP"."BSLN_BASELINES" ADD CONSTRAINT "BSLN_BASELINES_PK2" PRIMARY KEY ("BSLN_GUID")
  USING INDEX  ENABLE;

ALTER TABLE "DBSNMP"."BSLN_BASELINES" ADD CONSTRAINT "BSLN_BASELINES_UK2" UNIQUE ("DBID", "INSTANCE_NAME", "BASELINE_ID")
  USING INDEX  ENABLE;

ALTER TABLE "DBSNMP"."BSLN_STATISTICS" ADD CONSTRAINT "BSLN_STATISTICS_PK1" PRIMARY KEY ("METRIC_ID", "COMPUTE_DATE", "TIMEGROUP", "BSLN_GUID")
  USING INDEX  ENABLE;

ALTER TABLE "DBSNMP"."BSLN_THRESHOLD_PARAMS" ADD CONSTRAINT "BSLN_THRESHOLDS_PK1" PRIMARY KEY ("BSLN_GUID", "METRIC_ID")
  USING INDEX  ENABLE;

ALTER TABLE "DBSNMP"."MGMT_DB_FILE_GTT" ADD CONSTRAINT "MGMT_DB_FILE_GTT_PK" PRIMARY KEY ("TABLESPACE_NAME", "FILE_ID") ENABLE;
ALTER TABLE "DBSNMP"."MGMT_DB_SIZE_GTT" ADD CONSTRAINT "MGMT_DB_SIZE_GTT_PK" PRIMARY KEY ("TABLESPACE_NAME") ENABLE;
ALTER TABLE "DBSNMP"."MGMT_DB_FEATURE_LOG" ADD CONSTRAINT "MGMT_DB_FEATURE_LOG_PK" PRIMARY KEY ("SOURCE")
  USING INDEX  ENABLE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DBSNMP"."MGMT_RESPONSE_BASELINE" ("INSTANCE_NUMBER",
"SQL_TEXT",
"HASH_VALUE",
"ADDRESS",
"T_PER_EXEC") AS
  SELECT b.instance_number, s.sql_text, s.hash_value, v.address, s.t_per_exec
     FROM dbsnmp.mgmt_baseline b, dbsnmp.mgmt_baseline_sql s, v$sqlarea v
    WHERE b.instance_number = s.instance_number
      AND s.hash_value = v.hash_value;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DBSNMP"."MGMT_BSLN_METRICS" ("METRIC_UID",
"TAIL_ESTIMATOR",
"THRESHOLD_METHOD_DEFAULT",
"NUM_OCCURRENCES_DEFAULT",
"WARNING_PARAM_DEFAULT",
"CRITICAL_PARAM_DEFAULT") AS
  select bsln.metric_uid(bmd.metric_id)
      ,'EXPTAIL'
      ,'SIGLVL'
      ,1
      ,.999
      ,.9999
  from bsln_metric_defaults bmd
 where bmd.status = 'PREFERRED';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DBSNMP"."MGMT_BSLN_DATASOURCES" ("DATASOURCE_GUID",
"SOURCE_TYPE",
"TARGET_UID",
"METRIC_UID",
"TARGET_GUID",
"METRIC_GUID",
"KEY_VALUE",
"DBID",
"INSTANCE_NUM",
"INSTANCE_NAME",
"METRIC_ID") AS
  select bsln.datasource_guid(bsln.target_uid(d.dbid, i.instance_number),
                            bsln.metric_uid(bmd.metric_id))
      ,'DB'
      ,bsln.target_uid(d.dbid, i.instance_number)
      ,bsln.metric_uid(bmd.metric_id)
      ,null
      ,null
      ,null
      ,d.dbid
      ,i.instance_number
      ,i.instance_name
      ,bmd.metric_id
  from gv$database d, gv$instance i, bsln_metric_defaults bmd;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DBSNMP"."MGMT_BSLN_BASELINES" ("BSLN_GUID",
"TARGET_UID",
"NAME",
"TYPE",
"SUBINTERVAL_KEY",
"STATUS") AS
  select bb.bsln_guid
      ,bsln.target_uid(bb.dbid, i.instance_number)
      ,ab.baseline_name
      ,DECODE(ab.baseline_type,
              'MOVING_WINDOW', 'R',
                               'S')
      ,bb.timegrouping
      ,bb.status
  from bsln_baselines bb, dba_hist_baseline_metadata ab, gv$instance i
 where ab.dbid = bb.dbid
   and ab.baseline_id = bb.baseline_id
   and bb.instance_name = i.instance_name
   and ab.baseline_type in ('MOVING_WINDOW', 'STATIC', 'GENERATED');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DBSNMP"."MGMT_BSLN_INTERVALS" ("BSLN_GUID",
"INTERVAL_BEGIN",
"INTERVAL_END",
"INTERVAL_DAYS") AS
  select bb.bsln_guid
      ,case ab.baseline_type when 'MOVING_WINDOW' then NULL
                             else ab.start_snap_time end
      ,case ab.baseline_type when 'MOVING_WINDOW' then NULL
                             else ab.end_snap_time end
      ,case ab.baseline_type when 'MOVING_WINDOW' then ab.moving_window_size
                             else NULL end
  from bsln_baselines bb, dba_hist_baseline ab, gv$instance i
 where ab.dbid = bb.dbid
   and ab.baseline_id = bb.baseline_id
   and i.instance_name = bb.instance_name
   and ab.baseline_type in ('MOVING_WINDOW', 'STATIC', 'GENERATED');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DBSNMP"."MGMT_BSLN_THRESHOLD_PARMS" ("BSLN_GUID",
"DATASOURCE_GUID",
"THRESHOLD_METHOD",
"NUM_OCCURRENCES",
"WARNING_PARAM",
"CRITICAL_PARAM",
"FAIL_ACTION") AS
  select btp.bsln_guid
      ,bsln.datasource_guid(bsln.target_uid(bb.dbid, i.instance_number),
                            bsln.metric_uid(btp.metric_id))
      ,btp.threshold_method
      ,btp.num_occurrences
      ,btp.warning_param
      ,btp.critical_param
      ,btp.fail_action
  from bsln_threshold_params btp, bsln_baselines bb, gv$instance i
 where btp.bsln_guid = bb.bsln_guid
   and bb.instance_name = i.instance_name;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "DBSNMP"."MGMT_BSLN_STATISTICS" ("BSLN_GUID",
"DATASOURCE_GUID",
"COMPUTE_DATE",
"SUBINTERVAL_CODE",
"SAMPLE_COUNT",
"AVERAGE",
"MINIMUM",
"MAXIMUM",
"SDEV",
"PCTILE_25",
"PCTILE_50",
"PCTILE_75",
"PCTILE_90",
"PCTILE_95",
"EST_SAMPLE_COUNT",
"EST_SLOPE",
"EST_INTERCEPT",
"EST_FIT_QUALITY",
"EST_PCTILE_99",
"EST_PCTILE_999",
"EST_PCTILE_9999") AS
  select bs.bsln_guid
      ,bsln.datasource_guid(bsln.target_uid(bb.dbid, i.instance_number),
                            bsln.metric_uid(bs.metric_id))
      ,bs.compute_date
      ,bs.timegroup
      ,bs.sample_count
      ,bs.average
      ,bs.minimum
      ,bs.maximum
      ,bs.sdev
      ,bs.pctile_25
      ,bs.pctile_50
      ,bs.pctile_75
      ,bs.pctile_90
      ,bs.pctile_95
      ,bs.est_sample_count
      ,bs.est_slope
      ,bs.est_intercept
      ,bs.est_fit_quality
      ,bs.pctile_99
      ,bs.est_pctile_999
      ,bs.est_pctile_9999
  from bsln_statistics bs, bsln_baselines bb, gv$instance i
 where bs.bsln_guid = bb.bsln_guid
   and bb.instance_name = i.instance_name
   and bs.timegrouping = bb.timegrouping;

COMMENT ON TABLE "DBSNMP"."MGMT_BSLN_METRICS"  IS 'Metrics Eligible for Baselines (10.2)';
COMMENT ON TABLE "DBSNMP"."MGMT_BSLN_DATASOURCES"  IS 'Registered Metric Baseline Datasources (10.2)';
COMMENT ON TABLE "DBSNMP"."MGMT_BSLN_BASELINES"  IS 'Database Metric Baselines (10.2)';
COMMENT ON TABLE "DBSNMP"."MGMT_BSLN_INTERVALS"  IS 'Database Metric Baseline Intervals (10.2)';
COMMENT ON TABLE "DBSNMP"."MGMT_BSLN_THRESHOLD_PARMS"  IS 'Database Metric Baseline Thresholds (10.2)';
COMMENT ON TABLE "DBSNMP"."MGMT_BSLN_STATISTICS"  IS 'Database Metric Baseline Statistics (10.2)';
ALTER TABLE "DBSNMP"."BSLN_STATISTICS" ADD CONSTRAINT "BSLN_STATISTICS_FK" FOREIGN KEY ("BSLN_GUID")
	  REFERENCES "DBSNMP"."BSLN_BASELINES" ("BSLN_GUID") ON DELETE CASCADE ENABLE;

ALTER TABLE "DBSNMP"."BSLN_THRESHOLD_PARAMS" ADD CONSTRAINT "BSLN_THRESHOLDS_FK" FOREIGN KEY ("BSLN_GUID")
	  REFERENCES "DBSNMP"."BSLN_BASELINES" ("BSLN_GUID") ON DELETE CASCADE ENABLE;

