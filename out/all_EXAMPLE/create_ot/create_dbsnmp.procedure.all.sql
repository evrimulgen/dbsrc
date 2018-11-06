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

