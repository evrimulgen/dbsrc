
BEGIN
DECLARE
ta sys.re$table_alias_list;
vt sys.re$variable_type_list;
BEGIN
ta := sys.re$table_alias_list();
vt := sys.re$variable_type_list();
ta.extend(1);
ta(1) := sys.re$table_alias('TAB','"WM$EVENT_QUEUE_TABLE"');
dbms_rule_imp_obj.import_evaluation_context('"AQ$_WM$EVENT_QUEUE_TABLE_V"', ta, vt, NULL,NULL, 1);
END;
COMMIT;
END;
/


BEGIN
BEGIN
dbms_rule_imp_obj.import_rule_set('"WM$EVENT_QUEUE_R"','"AQ$_WM$EVENT_QUEUE_TABLE_V"',NULL, 1);
END;

COMMIT;
END;
/


BEGIN
BEGIN
dbms_rule_imp_obj.import_rule_set('"WM$EVENT_QUEUE_N"','"AQ$_WM$EVENT_QUEUE_TABLE_V"',NULL, 1);
END;

COMMIT;
END;
/

