
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
BEGIN
dbms_rule_imp_obj.import_rule_set('"STREAMS_QUEUE_N"','"AQ$_STREAMS_QUEUE_TABLE_V"',NULL, 1);
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
dbms_rule_imp_obj.import_rule_set('"ORDERS_QUEUE_N"','"AQ$_ORDERS_QUEUETABLE_V"',NULL, 1);
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

