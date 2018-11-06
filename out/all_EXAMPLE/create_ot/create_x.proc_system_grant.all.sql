
BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE('MANAGE_ANY','"OEM_MONITOR"',TRUE);
COMMIT;
END;
/


BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE('MANAGE_ANY','"SYSTEM"',TRUE);
COMMIT;
END;
/


BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE('MANAGE_ANY','"AQ_ADMINISTRATOR_ROLE"',TRUE);
COMMIT;
END;
/


BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE('DEQUEUE_ANY','"SYSTEM"',TRUE);
COMMIT;
END;
/


BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE('DEQUEUE_ANY','"AQ_ADMINISTRATOR_ROLE"',TRUE);
COMMIT;
END;
/


BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE('ENQUEUE_ANY','"SYSTEM"',TRUE);
COMMIT;
END;
/


BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE('ENQUEUE_ANY','"AQ_ADMINISTRATOR_ROLE"',TRUE);
COMMIT;
END;
/


BEGIN
execute immediate ('CREATE TABLE TEMP_JAVA_PRIVS AS SELECT KIND, GRANTEE, TYPE_SCHEMA, TYPE_NAME, NAME, ACTION, ENABLED FROM DBA_JAVA_POLICY WHERE ROWNUM > 1');
COMMIT;
END;
/


BEGIN
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','EJBCLIENT','SYS','java.lang.RuntimePermission','createClassLoader','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','EJBCLIENT','SYS','java.lang.RuntimePermission','getClassLoader','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','EJBCLIENT','SYS','java.net.SocketPermission','*','connect,resolve','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVADEBUGPRIV','SYS','oracle.aurora.security.JServerPermission','Debug','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVASYSPRIV','SYS','java.io.FilePermission','<<ALL FILES>>','read,write,execute,delete','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVASYSPRIV','SYS','java.io.SerializablePermission','*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVASYSPRIV','SYS','java.lang.RuntimePermission','createClassLoader','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVASYSPRIV','SYS','java.lang.RuntimePermission','getClassLoader','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVASYSPRIV','SYS','java.lang.RuntimePermission','readFileDescriptor','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVASYSPRIV','SYS','java.lang.RuntimePermission','setContextClassLoader','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVASYSPRIV','SYS','java.lang.RuntimePermission','setFactory','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVASYSPRIV','SYS','java.lang.RuntimePermission','setFileDescriptor','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVASYSPRIV','SYS','java.lang.RuntimePermission','setIO','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVASYSPRIV','SYS','java.lang.RuntimePermission','writeFileDescriptor','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVASYSPRIV','SYS','java.net.SocketPermission','*','accept,connect,listen,resolve','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVASYSPRIV','SYS','java.sql.SQLPermission','setLog','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVAUSERPRIV','SYS','java.io.FilePermission','<<ALL FILES>>','read','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVAUSERPRIV','SYS','java.lang.RuntimePermission','accessClassInPackage.*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVAUSERPRIV','SYS','java.lang.RuntimePermission','defineClassInPackage.*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVAUSERPRIV','SYS','java.lang.RuntimePermission','getProtectionDomain','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVAUSERPRIV','SYS','java.lang.RuntimePermission','stopThread','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVAUSERPRIV','SYS','java.net.SocketPermission','*','connect,resolve','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:java.awt.AWTPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:java.io.FilePermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:java.io.SerializablePermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:java.lang.RuntimePermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:java.lang.management.ManagementPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:java.lang.reflect.ReflectPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:java.net.NetPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:java.net.SocketPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:java.security.AllPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:java.security.SecurityPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:java.sql.SQLPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:java.util.PropertyPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:java.util.logging.LoggingPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:javax.management.MBeanPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:javax.management.MBeanServerPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:javax.management.MBeanTrustPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:javax.management.ManagementPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:javax.net.ssl.SSLPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:javax.security.auth.AuthPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:javax.security.auth.kerberos.ServicePermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:oracle.aurora.rdbms.HandlePermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:oracle.aurora.rdbms.security.PolicyTablePermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_ADMIN','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:oracle.aurora.security.JServerPermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_DEPLOY','SYS','java.io.FilePermission','bin/chmod','execute','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_DEPLOY','SYS','java.io.FilePermission','javavm/admin/*','write','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_DEPLOY','SYS','java.io.FilePermission','javavm/deploy/*','read','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_DEPLOY','SYS','java.lang.RuntimePermission','readFileDescriptor','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_DEPLOY','SYS','java.lang.RuntimePermission','writeFileDescriptor','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_DEPLOY','SYS','oracle.aurora.rdbms.HandlePermission','*','*','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_DEPLOY','SYS','oracle.aurora.security.JServerPermission','Deploy','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JAVA_DEPLOY','SYS','oracle.aurora.security.JServerPermission','LoadClassInPackage.oracle.aurora.deploy.*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','java.io.FilePermission','javavm/lib/management/*','read','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','java.io.FilePermission','javavm/lib/management/jmxremote.access','read','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','java.io.FilePermission','javavm/lib/management/management.properties','read','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','java.lang.RuntimePermission','accessClassInPackage.*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','java.lang.RuntimePermission','setContextClassLoader','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','java.lang.management.ManagementPermission','control','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','java.lang.management.ManagementPermission','monitor','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','java.net.SocketPermission','*','accept,connect,listen,resolve','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','java.security.SecurityPermission','createAccessControlContext','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','java.util.PropertyPermission','com.sun.jmx.*','read,write','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','java.util.PropertyPermission','com.sun.management.*','read,write','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','java.util.PropertyPermission','https.proxyHost','read,write','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','java.util.PropertyPermission','java.rmi.server.randomIDs','read,write','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','java.util.PropertyPermission','javax.net.debug','read,write','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','java.util.PropertyPermission','javax.net.ssl.*','read,write','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','java.util.logging.LoggingPermission','control','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','javax.management.MBeanPermission','*','*','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','JMXSERVER','SYS','javax.management.MBeanServerPermission','createMBeanServer','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','MDSYS','SYS','java.io.FilePermission','md\jlib\*','read','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','MDSYS','SYS','java.io.FilePermission','sdo\demo\georaster\jlibs\*','read','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','MDSYS','SYS','java.lang.RuntimePermission','getClassLoader','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','ORDSYS','SYS','java.io.FilePermission','/tmp/*','read,write,delete','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','ORDSYS','SYS','java.lang.RuntimePermission','accessClassInPackage.com.sun.imageio.plugins.jpeg','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','ORDSYS','SYS','java.lang.RuntimePermission','getClassLoader','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','ORDSYS','SYS','java.lang.RuntimePermission','loadLibrary.clib_jiio','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','ORDSYS','SYS','java.lang.RuntimePermission','loadLibrary.oraordim12','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','ORDSYS','SYS','java.lang.RuntimePermission','loadLibrary.ordim12','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','ORDSYS','SYS','java.util.logging.LoggingPermission','control','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','PUBLIC','SYS','java.lang.RuntimePermission','createSecurityManager','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','PUBLIC','SYS','java.lang.RuntimePermission','exitVM','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','PUBLIC','SYS','java.lang.RuntimePermission','getenv.ORACLE_HOME','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','PUBLIC','SYS','java.lang.RuntimePermission','getenv.TNS_ADMIN','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('RESTRICT','PUBLIC','SYS','java.lang.RuntimePermission','loadLibrary.*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','PUBLIC','SYS','java.lang.RuntimePermission','modifyThread','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','PUBLIC','SYS','java.lang.RuntimePermission','modifyThreadGroup','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','PUBLIC','SYS','java.lang.RuntimePermission','preferences','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','PUBLIC','SYS','java.util.PropertyPermission','*','read','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','PUBLIC','SYS','java.util.PropertyPermission','oracle.net.tns_admin','write','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','PUBLIC','SYS','java.util.PropertyPermission','user.language','write','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('RESTRICT','PUBLIC','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:java.lang.RuntimePermission#loadLibrary.*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','PUBLIC','SYS','oracle.aurora.security.JServerPermission','LoadClassInPackage.*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('RESTRICT','PUBLIC','SYS','oracle.aurora.security.JServerPermission','LoadClassInPackage.java.*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('RESTRICT','PUBLIC','SYS','oracle.aurora.security.JServerPermission','LoadClassInPackage.oracle.aurora.*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('RESTRICT','PUBLIC','SYS','oracle.aurora.security.JServerPermission','LoadClassInPackage.oracle.jdbc.*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('RESTRICT','PUBLIC','SYS','oracle.aurora.security.JServerPermission','LoadClassInPackage.oracle.ord.*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','java.lang.RuntimePermission','*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','java.lang.RuntimePermission','createClassLoader','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','java.lang.RuntimePermission','loadLibrary.corejava','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','java.lang.RuntimePermission','loadLibrary.corejava_d','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','java.lang.RuntimePermission','loadLibrary.jox10oraawt','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','java.lang.RuntimePermission','loadLibrary.oraioser','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','java.lang.RuntimePermission','loadLibrary.orajaas','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','java.lang.RuntimePermission','loadLibrary.xaNative','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','java.lang.reflect.ReflectPermission','*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','java.net.NetPermission','*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','java.security.AllPermission','*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','java.security.SecurityPermission','*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','java.util.PropertyPermission','*','write','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','java.util.logging.LoggingPermission','control','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','javax.management.MBeanPermission','*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','javax.management.MBeanServerPermission','*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','javax.management.MBeanTrustPermission','*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','javax.management.ManagementPermission','*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','javax.net.ssl.SSLPermission','*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','javax.security.auth.AuthPermission','*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','javax.security.auth.kerberos.ServicePermission','*','accept,initiate','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','oracle.aurora.rdbms.HandlePermission','*','*','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','oracle.aurora.rdbms.security.PolicyTablePermission','0:oracle.aurora.rdbms.security.PolicyTablePermission#*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','oracle.aurora.security.JServerPermission','*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','oracle.aurora.security.JServerPermission','LoadClassInPackage.java.*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','oracle.aurora.security.JServerPermission','LoadClassInPackage.oracle.aurora.*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYS','SYS','oracle.aurora.security.JServerPermission','LoadClassInPackage.oracle.jdbc.*','','ENABLED');
INSERT INTO TEMP_JAVA_PRIVS VALUES('GRANT','SYSTEM','SYS','java.io.FilePermission','<<ALL FILES>>','read','ENABLED');
COMMIT;
END;
/


BEGIN
DECLARE
   TJP SYS.DBMS_JVM_EXP_PERMS.TEMP_JAVA_POLICY;
   CURSOR C1 IS SELECT KIND,GRANTEE,TYPE_SCHEMA,TYPE_NAME,
                       NAME,ACTION,ENABLED FROM TEMP_JAVA_PRIVS;
BEGIN
   OPEN C1;
   FETCH C1 BULK COLLECT INTO TJP;
   CLOSE C1;
   SYS.DBMS_JVM_EXP_PERMS.IMPORT_JVM_PERMS(TJP);
   EXECUTE IMMEDIATE('DROP TABLE TEMP_JAVA_PRIVS');
END;
COMMIT;
END;
/


BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(SYS.DBMS_RULE_ADM.CREATE_EVALUATION_CONTEXT_OBJ, '"AQ_ADMINISTRATOR_ROLE"',TRUE);

COMMIT;
END;
/


BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(SYS.DBMS_RULE_ADM.CREATE_RULE_OBJ, '"IX"',FALSE);

SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(SYS.DBMS_RULE_ADM.CREATE_RULE_OBJ, '"AQ_ADMINISTRATOR_ROLE"',TRUE);

COMMIT;
END;
/


BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(SYS.DBMS_RULE_ADM.CREATE_RULE_SET_OBJ, '"IX"',FALSE);

SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(SYS.DBMS_RULE_ADM.CREATE_RULE_SET_OBJ, '"AQ_ADMINISTRATOR_ROLE"',TRUE);

COMMIT;
END;
/


BEGIN
execute immediate 'grant DROP ANY SQL TRANSLATION PROFILE to "SYS"';
execute immediate 'grant USE ANY SQL TRANSLATION PROFILE to "SYS"';
execute immediate 'grant ALTER ANY SQL TRANSLATION PROFILE to "SYS"';
execute immediate 'grant USE ANY SQL TRANSLATION PROFILE to "DBA"';
execute immediate 'grant CREATE ANY SQL TRANSLATION PROFILE to "DBA"';
execute immediate 'grant DROP ANY SQL TRANSLATION PROFILE to "DBA"';
execute immediate 'grant CREATE ANY SQL TRANSLATION PROFILE to "SYS"';
execute immediate 'grant CREATE SQL TRANSLATION PROFILE to "DBA"';
execute immediate 'grant CREATE SQL TRANSLATION PROFILE to "SYS"';
execute immediate 'grant ALTER ANY SQL TRANSLATION PROFILE to "DBA"';
COMMIT;
END;
/

