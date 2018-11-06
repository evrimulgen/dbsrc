
BEGIN
declare error_num1 exception;PRAGMA EXCEPTION_INIT(error_num1, -29357);begin dbms_resource_manager.create_consumer_group(consumer_group => 'BATCH_GROUP', comment => 'Consumer group for batch operations');exception when error_num1 then NULL;when others then raise; end;
COMMIT;
END;
/


BEGIN
declare error_num1 exception;PRAGMA EXCEPTION_INIT(error_num1, -29357);begin dbms_resource_manager.create_consumer_group(consumer_group => 'INTERACTIVE_GROUP', comment => 'Consumer group for interactive, OLTP operations');exception when error_num1 then NULL;when others then raise; end;
COMMIT;
END;
/


BEGIN
declare error_num1 exception;PRAGMA EXCEPTION_INIT(error_num1, -29357);begin dbms_resource_manager.create_consumer_group(consumer_group => 'LOW_GROUP', comment => 'Consumer group for low-priority sessions');exception when error_num1 then NULL;when others then raise; end;
COMMIT;
END;
/


BEGIN
declare error_num1 exception;PRAGMA EXCEPTION_INIT(error_num1, -29357);begin dbms_resource_manager.create_consumer_group(consumer_group => 'ETL_GROUP', comment => 'Consumer group for ETL');exception when error_num1 then NULL;when others then raise; end;
COMMIT;
END;
/


BEGIN
declare error_num1 exception;PRAGMA EXCEPTION_INIT(error_num1, -29357);begin dbms_resource_manager.create_consumer_group(consumer_group => 'DSS_GROUP', comment => 'Consumer group for DSS queries');exception when error_num1 then NULL;when others then raise; end;
COMMIT;
END;
/


BEGIN
declare error_num1 exception;PRAGMA EXCEPTION_INIT(error_num1, -29357);begin dbms_resource_manager.create_consumer_group(consumer_group => 'DSS_CRITICAL_GROUP', comment => 'Consumer group for critical DSS queries');exception when error_num1 then NULL;when others then raise; end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.set_scheduler_attribute(attribute=>'MAX_JOB_SLAVE_PROCESSES',
value=>NULL);
exception
when others then
 if sqlcode = -27469 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.set_scheduler_attribute(attribute=>'LOG_HISTORY',
value=>'30');
exception
when others then
 if sqlcode = -27469 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.set_scheduler_attribute(attribute=>'DEFAULT_TIMEZONE',
value=>'PST8PDT');
exception
when others then
 if sqlcode = -27469 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.set_scheduler_attribute(attribute=>'EMAIL_SERVER',
value=>NULL);
exception
when others then
 if sqlcode = -27469 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.set_scheduler_attribute(attribute=>'EMAIL_SERVER_ENCRYPTION',
value=>'NONE');
exception
when others then
 if sqlcode = -27469 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.set_scheduler_attribute(attribute=>'EMAIL_SERVER_CREDENTIAL',
value=>NULL);
exception
when others then
 if sqlcode = -27469 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.set_scheduler_attribute(attribute=>'EMAIL_SENDER',
value=>NULL);
exception
when others then
 if sqlcode = -27469 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.set_scheduler_attribute(attribute=>'EVENT_EXPIRY_TIME',
value=>NULL);
exception
when others then
 if sqlcode = -27469 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.disable( 'SYS."MONDAY_WINDOW"',force=>TRUE);
dbms_scheduler.set_attribute_null( 'SYS."MONDAY_WINDOW"','SCHEDULE_NAME');
dbms_scheduler.set_attribute_null( 'SYS."MONDAY_WINDOW"','START_DATE');
dbms_scheduler.set_attribute_null( 'SYS."MONDAY_WINDOW"','END_DATE');
dbms_scheduler.set_attribute( 'SYS."MONDAY_WINDOW"','REPEAT_INTERVAL',
'freq=daily;byday=MON;byhour=22;byminute=0; bysecond=0');
dbms_scheduler.set_attribute( 'SYS."MONDAY_WINDOW"','RESOURCE_PLAN','"DEFAULT_MAINTENANCE_PLAN"');
dbms_scheduler.set_attribute( 'SYS."MONDAY_WINDOW"','DURATION',
'+000 04:00:00');
dbms_scheduler.set_attribute( 'SYS."MONDAY_WINDOW"','WINDOW_PRIORITY','LOW');
dbms_scheduler.set_attribute( 'SYS."MONDAY_WINDOW"','COMMENTS',
'Monday window for maintenance tasks');
dbms_scheduler.enable( 'SYS."MONDAY_WINDOW"');
exception
when others then
 if sqlcode = -27476 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.disable( 'SYS."TUESDAY_WINDOW"',force=>TRUE);
dbms_scheduler.set_attribute_null( 'SYS."TUESDAY_WINDOW"','SCHEDULE_NAME');
dbms_scheduler.set_attribute_null( 'SYS."TUESDAY_WINDOW"','START_DATE');
dbms_scheduler.set_attribute_null( 'SYS."TUESDAY_WINDOW"','END_DATE');
dbms_scheduler.set_attribute( 'SYS."TUESDAY_WINDOW"','REPEAT_INTERVAL',
'freq=daily;byday=TUE;byhour=22;byminute=0; bysecond=0');
dbms_scheduler.set_attribute( 'SYS."TUESDAY_WINDOW"','RESOURCE_PLAN','"DEFAULT_MAINTENANCE_PLAN"');
dbms_scheduler.set_attribute( 'SYS."TUESDAY_WINDOW"','DURATION',
'+000 04:00:00');
dbms_scheduler.set_attribute( 'SYS."TUESDAY_WINDOW"','WINDOW_PRIORITY','LOW');
dbms_scheduler.set_attribute( 'SYS."TUESDAY_WINDOW"','COMMENTS',
'Tuesday window for maintenance tasks');
dbms_scheduler.enable( 'SYS."TUESDAY_WINDOW"');
exception
when others then
 if sqlcode = -27476 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.disable( 'SYS."WEDNESDAY_WINDOW"',force=>TRUE);
dbms_scheduler.set_attribute_null( 'SYS."WEDNESDAY_WINDOW"','SCHEDULE_NAME');
dbms_scheduler.set_attribute_null( 'SYS."WEDNESDAY_WINDOW"','START_DATE');
dbms_scheduler.set_attribute_null( 'SYS."WEDNESDAY_WINDOW"','END_DATE');
dbms_scheduler.set_attribute( 'SYS."WEDNESDAY_WINDOW"','REPEAT_INTERVAL',
'freq=daily;byday=WED;byhour=22;byminute=0; bysecond=0');
dbms_scheduler.set_attribute( 'SYS."WEDNESDAY_WINDOW"','RESOURCE_PLAN','"DEFAULT_MAINTENANCE_PLAN"');
dbms_scheduler.set_attribute( 'SYS."WEDNESDAY_WINDOW"','DURATION',
'+000 04:00:00');
dbms_scheduler.set_attribute( 'SYS."WEDNESDAY_WINDOW"','WINDOW_PRIORITY','LOW');
dbms_scheduler.set_attribute( 'SYS."WEDNESDAY_WINDOW"','COMMENTS',
'Wednesday window for maintenance tasks');
dbms_scheduler.enable( 'SYS."WEDNESDAY_WINDOW"');
exception
when others then
 if sqlcode = -27476 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.disable( 'SYS."THURSDAY_WINDOW"',force=>TRUE);
dbms_scheduler.set_attribute_null( 'SYS."THURSDAY_WINDOW"','SCHEDULE_NAME');
dbms_scheduler.set_attribute_null( 'SYS."THURSDAY_WINDOW"','START_DATE');
dbms_scheduler.set_attribute_null( 'SYS."THURSDAY_WINDOW"','END_DATE');
dbms_scheduler.set_attribute( 'SYS."THURSDAY_WINDOW"','REPEAT_INTERVAL',
'freq=daily;byday=THU;byhour=22;byminute=0; bysecond=0');
dbms_scheduler.set_attribute( 'SYS."THURSDAY_WINDOW"','RESOURCE_PLAN','"DEFAULT_MAINTENANCE_PLAN"');
dbms_scheduler.set_attribute( 'SYS."THURSDAY_WINDOW"','DURATION',
'+000 04:00:00');
dbms_scheduler.set_attribute( 'SYS."THURSDAY_WINDOW"','WINDOW_PRIORITY','LOW');
dbms_scheduler.set_attribute( 'SYS."THURSDAY_WINDOW"','COMMENTS',
'Thursday window for maintenance tasks');
dbms_scheduler.enable( 'SYS."THURSDAY_WINDOW"');
exception
when others then
 if sqlcode = -27476 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.disable( 'SYS."FRIDAY_WINDOW"',force=>TRUE);
dbms_scheduler.set_attribute_null( 'SYS."FRIDAY_WINDOW"','SCHEDULE_NAME');
dbms_scheduler.set_attribute_null( 'SYS."FRIDAY_WINDOW"','START_DATE');
dbms_scheduler.set_attribute_null( 'SYS."FRIDAY_WINDOW"','END_DATE');
dbms_scheduler.set_attribute( 'SYS."FRIDAY_WINDOW"','REPEAT_INTERVAL',
'freq=daily;byday=FRI;byhour=22;byminute=0; bysecond=0');
dbms_scheduler.set_attribute( 'SYS."FRIDAY_WINDOW"','RESOURCE_PLAN','"DEFAULT_MAINTENANCE_PLAN"');
dbms_scheduler.set_attribute( 'SYS."FRIDAY_WINDOW"','DURATION',
'+000 04:00:00');
dbms_scheduler.set_attribute( 'SYS."FRIDAY_WINDOW"','WINDOW_PRIORITY','LOW');
dbms_scheduler.set_attribute( 'SYS."FRIDAY_WINDOW"','COMMENTS',
'Friday window for maintenance tasks');
dbms_scheduler.enable( 'SYS."FRIDAY_WINDOW"');
exception
when others then
 if sqlcode = -27476 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.disable( 'SYS."SATURDAY_WINDOW"',force=>TRUE);
dbms_scheduler.set_attribute_null( 'SYS."SATURDAY_WINDOW"','SCHEDULE_NAME');
dbms_scheduler.set_attribute_null( 'SYS."SATURDAY_WINDOW"','START_DATE');
dbms_scheduler.set_attribute_null( 'SYS."SATURDAY_WINDOW"','END_DATE');
dbms_scheduler.set_attribute( 'SYS."SATURDAY_WINDOW"','REPEAT_INTERVAL',
'freq=daily;byday=SAT;byhour=6;byminute=0; bysecond=0');
dbms_scheduler.set_attribute( 'SYS."SATURDAY_WINDOW"','RESOURCE_PLAN','"DEFAULT_MAINTENANCE_PLAN"');
dbms_scheduler.set_attribute( 'SYS."SATURDAY_WINDOW"','DURATION',
'+000 20:00:00');
dbms_scheduler.set_attribute( 'SYS."SATURDAY_WINDOW"','WINDOW_PRIORITY','LOW');
dbms_scheduler.set_attribute( 'SYS."SATURDAY_WINDOW"','COMMENTS',
'Saturday window for maintenance tasks');
dbms_scheduler.enable( 'SYS."SATURDAY_WINDOW"');
exception
when others then
 if sqlcode = -27476 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.disable( 'SYS."SUNDAY_WINDOW"',force=>TRUE);
dbms_scheduler.set_attribute_null( 'SYS."SUNDAY_WINDOW"','SCHEDULE_NAME');
dbms_scheduler.set_attribute_null( 'SYS."SUNDAY_WINDOW"','START_DATE');
dbms_scheduler.set_attribute_null( 'SYS."SUNDAY_WINDOW"','END_DATE');
dbms_scheduler.set_attribute( 'SYS."SUNDAY_WINDOW"','REPEAT_INTERVAL',
'freq=daily;byday=SUN;byhour=6;byminute=0; bysecond=0');
dbms_scheduler.set_attribute( 'SYS."SUNDAY_WINDOW"','RESOURCE_PLAN','"DEFAULT_MAINTENANCE_PLAN"');
dbms_scheduler.set_attribute( 'SYS."SUNDAY_WINDOW"','DURATION',
'+000 20:00:00');
dbms_scheduler.set_attribute( 'SYS."SUNDAY_WINDOW"','WINDOW_PRIORITY','LOW');
dbms_scheduler.set_attribute( 'SYS."SUNDAY_WINDOW"','COMMENTS',
'Sunday window for maintenance tasks');
dbms_scheduler.enable( 'SYS."SUNDAY_WINDOW"');
exception
when others then
 if sqlcode = -27476 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.disable( 'SYS."WEEKNIGHT_WINDOW"',force=>TRUE);
dbms_scheduler.set_attribute_null( 'SYS."WEEKNIGHT_WINDOW"','SCHEDULE_NAME');
dbms_scheduler.set_attribute_null( 'SYS."WEEKNIGHT_WINDOW"','START_DATE');
dbms_scheduler.set_attribute_null( 'SYS."WEEKNIGHT_WINDOW"','END_DATE');
dbms_scheduler.set_attribute( 'SYS."WEEKNIGHT_WINDOW"','REPEAT_INTERVAL',
'freq=daily;byday=MON,TUE,WED,THU,FRI;byhour=22;byminute=0; bysecond=0');
dbms_scheduler.set_attribute_null( 'SYS."WEEKNIGHT_WINDOW"','RESOURCE_PLAN');
dbms_scheduler.set_attribute( 'SYS."WEEKNIGHT_WINDOW"','DURATION',
'+000 08:00:00');
dbms_scheduler.set_attribute( 'SYS."WEEKNIGHT_WINDOW"','WINDOW_PRIORITY','LOW');
dbms_scheduler.set_attribute( 'SYS."WEEKNIGHT_WINDOW"','COMMENTS',
'Weeknight window - for compatibility only');
exception
when others then
 if sqlcode = -27476 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/


BEGIN
begin
dbms_scheduler.disable( 'SYS."WEEKEND_WINDOW"',force=>TRUE);
dbms_scheduler.set_attribute_null( 'SYS."WEEKEND_WINDOW"','SCHEDULE_NAME');
dbms_scheduler.set_attribute_null( 'SYS."WEEKEND_WINDOW"','START_DATE');
dbms_scheduler.set_attribute_null( 'SYS."WEEKEND_WINDOW"','END_DATE');
dbms_scheduler.set_attribute( 'SYS."WEEKEND_WINDOW"','REPEAT_INTERVAL',
'freq=daily;byday=SAT;byhour=0;byminute=0;bysecond=0');
dbms_scheduler.set_attribute_null( 'SYS."WEEKEND_WINDOW"','RESOURCE_PLAN');
dbms_scheduler.set_attribute( 'SYS."WEEKEND_WINDOW"','DURATION',
'+002 00:00:00');
dbms_scheduler.set_attribute( 'SYS."WEEKEND_WINDOW"','WINDOW_PRIORITY','LOW');
dbms_scheduler.set_attribute( 'SYS."WEEKEND_WINDOW"','COMMENTS',
'Weekend window - for compatibility only');
exception
when others then
 if sqlcode = -27476 then NULL;
else raise;
end if;
end;
COMMIT;
END;
/

