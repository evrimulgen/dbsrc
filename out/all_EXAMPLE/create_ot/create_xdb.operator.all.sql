CREATE OR REPLACE OPERATOR "XDB"."UNDER_PATH" BINDING
	("SYS"."XMLTYPE", NUMBER, VARCHAR2) RETURN NUMBER
	  WITH INDEX CONTEXT, SCAN CONTEXT "XDB"."XDBHI_IM"
	  COMPUTE ANCILLARY DATA
	   USING "XDB"."XDB_FUNCIMPL"."UNDER_PATH_FUNC",
	("SYS"."XMLTYPE", VARCHAR2) RETURN NUMBER
	  WITH INDEX CONTEXT, SCAN CONTEXT "XDB"."XDBHI_IM"
	  COMPUTE ANCILLARY DATA
	   USING "XDB"."XDB_FUNCIMPL"."UNDER_PATH_FUNC1";

CREATE OR REPLACE OPERATOR "XDB"."EQUALS_PATH" BINDING
	("SYS"."XMLTYPE", VARCHAR2) RETURN NUMBER
	  WITH INDEX CONTEXT, SCAN CONTEXT "XDB"."XDBHI_IM"
	  COMPUTE ANCILLARY DATA
	   USING "XDB"."XDB_FUNCIMPL"."EQUAL_PATH_FUNC";

CREATE OR REPLACE OPERATOR "XDB"."PATH" BINDING
	(NUMBER) RETURN VARCHAR2
	  ANCILLARY TO "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", NUMBER, VARCHAR2), "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", VARCHAR2)
	   USING "XDB"."XDB_ANCOP"."PATH_FUNC";

CREATE OR REPLACE OPERATOR "XDB"."DEPTH" BINDING
	(NUMBER) RETURN NUMBER
	  ANCILLARY TO "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", VARCHAR2), "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", NUMBER, VARCHAR2)
	   USING "XDB"."XDB_ANCOP"."DEPTH_FUNC";

CREATE OR REPLACE OPERATOR "XDB"."ABSPATH" BINDING
	(NUMBER) RETURN VARCHAR2
	  ANCILLARY TO "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", NUMBER, VARCHAR2), "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", VARCHAR2)
	   USING "XDB"."XDB_ANCOP"."ABSPATH_FUNC";

CREATE OR REPLACE OPERATOR "XDB"."ALL_PATH" BINDING
	(NUMBER) RETURN "XDB"."PATH_ARRAY"
	  ANCILLARY TO "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", NUMBER, VARCHAR2), "XDB"."UNDER_PATH" ("SYS"."XMLTYPE", VARCHAR2)
	   USING "XDB_ANCOP"."ALLPATH_FUNC";

CREATE OR REPLACE OPERATOR "XDB"."XMLINDEX_NOOP" BINDING
	("SYS"."XMLTYPE", VARCHAR2) RETURN NUMBER
	  WITH INDEX CONTEXT, SCAN CONTEXT "XDB"."XMLINDEXMETHODS"
	   USING "XDB"."XMLINDEX_FUNCIMPL"."XMLINDEX_NOOP";

