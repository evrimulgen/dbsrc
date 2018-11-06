BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/XDBSchema.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB'); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/XDBResource.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB'); END;

BEGIN dbms_xmlschema.registerSchema('http://www.w3.org/2001/csx.xml.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB', options=> DBMS_XMLSCHEMA.REGISTER_BINARYXML); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/csx.xmltr.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB', options=> DBMS_XMLSCHEMA.REGISTER_BINARYXML); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/acl.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB', options=> DBMS_XMLSCHEMA.REGISTER_BINARYXML); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/xdbconfig.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB', options=> DBMS_XMLSCHEMA.REGISTER_BINARYXML); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/stats.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB'); END;

BEGIN dbms_xmlschema.registerSchema('http://www.w3.org/2001/csx.XInclude.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB', options=> DBMS_XMLSCHEMA.REGISTER_BINARYXML); END;

BEGIN dbms_xmlschema.registerSchema('http://www.w3.org/1999/csx.xlink.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB', options=> DBMS_XMLSCHEMA.REGISTER_BINARYXML); END;

BEGIN dbms_xmlschema.registerSchema('http://www.w3.org/1999/xlink.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB'); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/XDBFolderListing.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB'); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/xmltr.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB'); END;

BEGIN dbms_xmlschema.registerSchema('http://www.w3.org/2001/xml.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB'); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/XDBStandard.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB'); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/XDBResConfig.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB', options=> DBMS_XMLSCHEMA.REGISTER_BINARYXML); END;

BEGIN dbms_xmlschema.registerSchema('http://xmlns.oracle.com/xdb/dav.xsd',
 '',FALSE,FALSE,FALSE,FALSE,FALSE,'XDB', options=> DBMS_XMLSCHEMA.REGISTER_BINARYXML); END;

