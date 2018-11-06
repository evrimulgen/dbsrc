CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYSTEM"."REPCATLOGTRIG"
AFTER UPDATE OR DELETE ON system.repcat$_repcatlog
BEGIN
  sys.dbms_alert.signal('repcatlog_alert', '');
END;
/

CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYSTEM"."DEF$_PROPAGATOR_TRIG"
  BEFORE INSERT ON system.def$_propagator
DECLARE
  prop_count  NUMBER;
BEGIN
  SELECT count(*) into prop_count
    FROM system.def$_propagator;

  IF (prop_count > 0) THEN
    -- Raise duplicate propagator error
    sys.dbms_sys_error.raise_system_error(-23394);
  END IF;
END;
/

