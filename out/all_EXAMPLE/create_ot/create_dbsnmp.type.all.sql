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

