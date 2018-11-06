
BEGIN
DECLARE
ta sys.re$table_alias_list;
vt sys.re$variable_type_list;
BEGIN
ta := sys.re$table_alias_list();
vt := sys.re$variable_type_list();
ta.extend(1);
ta(1) := sys.re$table_alias('TAB','"ORDERS_QUEUETABLE"');
dbms_rule_imp_obj.import_evaluation_context('"AQ$_ORDERS_QUEUETABLE_V"', ta, vt, NULL,NULL, 1);
END;
COMMIT;
END;
/


BEGIN
DECLARE
ta sys.re$table_alias_list;
vt sys.re$variable_type_list;
BEGIN
ta := sys.re$table_alias_list();
vt := sys.re$variable_type_list();
ta.extend(1);
ta(1) := sys.re$table_alias('TAB','"STREAMS_QUEUE_TABLE"');
dbms_rule_imp_obj.import_evaluation_context('"AQ$_STREAMS_QUEUE_TABLE_V"', ta, vt, NULL,NULL, 1);
END;
COMMIT;
END;
/


BEGIN
BEGIN
dbms_rule_imp_obj.import_rule_set('"ORDERS_QUEUE_N"','"AQ$_ORDERS_QUEUETABLE_V"',NULL, 1);
END;

COMMIT;
END;
/


BEGIN
BEGIN
dbms_rule_imp_obj.import_rule_set('"ORDERS_QUEUE_R"','"AQ$_ORDERS_QUEUETABLE_V"',NULL, 1);
END;

COMMIT;
END;
/


BEGIN
BEGIN
dbms_rule_imp_obj.import_rule_set('"STREAMS_QUEUE_N"','"AQ$_STREAMS_QUEUE_TABLE_V"',NULL, 1);
END;

COMMIT;
END;
/


BEGIN
BEGIN
dbms_rule_imp_obj.import_rule_set('"STREAMS_QUEUE_R"','"AQ$_STREAMS_QUEUE_TABLE_V"',NULL, 1);
END;

COMMIT;
END;
/


BEGIN
SYS.DBMS_AQ_IMP_INTERNAL.IMPORT_QUEUE(HEXTORAW('780DD98B45B624E6E055000000000001'),'STREAMS_QUEUE_TABLE','STREAMS_QUEUE',0,5,0,0,0,'');
COMMIT;
END;
/


BEGIN
SYS.DBMS_AQ_IMP_INTERNAL.IMPORT_QUEUE(HEXTORAW('780DD98B45B724E6E055000000000001'),'STREAMS_QUEUE_TABLE','AQ$_STREAMS_QUEUE_TABLE_E',1,0,0,0,0,'exception queue');
COMMIT;
END;
/


BEGIN
SYS.DBMS_AQ_IMP_INTERNAL.IMPORT_QUEUE(HEXTORAW('780DD98B45B824E6E055000000000001'),'ORDERS_QUEUETABLE','ORDERS_QUEUE',0,5,0,0,0,'');
COMMIT;
END;
/


BEGIN
SYS.DBMS_AQ_IMP_INTERNAL.IMPORT_QUEUE(HEXTORAW('780DD98B45B924E6E055000000000001'),'ORDERS_QUEUETABLE','AQ$_ORDERS_QUEUETABLE_E',1,0,0,0,0,'exception queue');
COMMIT;
END;
/

