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

