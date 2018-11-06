
BEGIN
dbms_scheduler.create_job('"ORACLE_APEX_PURGE_SESSIONS"',
job_type=>'STORED_PROCEDURE', job_action=>
'WWV_FLOW_CACHE.PURGE_SESSIONS'
, number_of_arguments=>0,
start_date=>TO_TIMESTAMP_TZ('07-JUL-2014 06.29.54.833453000 AM -07:00','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'), repeat_interval=>
'FREQ=HOURLY;BYMINUTE=0'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
NULL
);
dbms_scheduler.enable('"ORACLE_APEX_PURGE_SESSIONS"');
COMMIT;
END;
/


BEGIN
dbms_scheduler.create_job('"ORACLE_APEX_MAIL_QUEUE"',
job_type=>'STORED_PROCEDURE', job_action=>
'WWV_FLOW_MAIL.PUSH_QUEUE_IMMEDIATE'
, number_of_arguments=>0,
start_date=>TO_TIMESTAMP_TZ('07-JUL-2014 06.29.55.278873000 AM -07:00','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'), repeat_interval=>
'FREQ=MINUTELY;BYMINUTE=0,5,10,15,20,25,30,35,40,45,50,55;BYSECOND=0'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
NULL
);
dbms_scheduler.enable('"ORACLE_APEX_MAIL_QUEUE"');
COMMIT;
END;
/


BEGIN
dbms_scheduler.create_job('"ORACLE_APEX_WS_NOTIFICATIONS"',
job_type=>'STORED_PROCEDURE', job_action=>
'WWV_FLOW_WORKSHEET_API.DO_NOTIFY'
, number_of_arguments=>0,
start_date=>TO_TIMESTAMP_TZ('07-JUL-2014 06.29.55.281735000 AM -07:00','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'), repeat_interval=>
'FREQ=MINUTELY;BYMINUTE=0,30;BYSECOND=0'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
NULL
);
dbms_scheduler.enable('"ORACLE_APEX_WS_NOTIFICATIONS"');
COMMIT;
END;
/


BEGIN
dbms_scheduler.create_job('"ORACLE_APEX_DAILY_MAINTENANCE"',
job_type=>'STORED_PROCEDURE', job_action=>
'WWV_FLOW_MAINT.DAILY_MAINTENANCE'
, number_of_arguments=>0,
start_date=>TO_TIMESTAMP_TZ('07-JUL-2014 06.29.55.284760000 AM -07:00','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'), repeat_interval=>
'FREQ=DAILY;BYHOUR=1;BYMINUTE=0;BYSECOND=0'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
NULL
);
dbms_scheduler.enable('"ORACLE_APEX_DAILY_MAINTENANCE"');
COMMIT;
END;
/

