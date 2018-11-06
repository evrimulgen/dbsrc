CREATE OR REPLACE OPERATOR "MDSYS"."SDO_NN" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	  COMPUTE ANCILLARY DATA
	   USING "PRVT_IDX"."NN",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	  COMPUTE ANCILLARY DATA
	   USING "PRVT_IDX"."NN",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	  COMPUTE ANCILLARY DATA
	   USING "PRVT_IDX"."NN",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	  COMPUTE ANCILLARY DATA
	   USING "PRVT_IDX"."NN",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	  COMPUTE ANCILLARY DATA
	   USING "PRVT_IDX"."NN",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	  COMPUTE ANCILLARY DATA
	   USING "PRVT_IDX"."NN",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	  COMPUTE ANCILLARY DATA
	   USING "PRVT_IDX"."NN",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	  COMPUTE ANCILLARY DATA
	   USING "PRVT_IDX"."NN";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_NN_DISTANCE" BINDING
	(NUMBER) RETURN NUMBER
	  ANCILLARY TO "MDSYS"."SDO_NN" ("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY", VARCHAR2), "MDSYS"."SDO_NN" ("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY", VARCHAR2), "MDSYS"."SDO_NN" ("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY", VARCHAR2), "MDSYS"."SDO_NN" ("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY", VARCHAR2), "MDSYS"."SDO_NN" ("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY"), "MDSYS"."SDO_NN" ("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY"), "MDSYS"."SDO_NN" ("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY"), "MDSYS"."SDO_NN" ("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY")
	   USING "PRVT_IDX"."NNDISTANCE";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_RELATE" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."RELATE",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."RELATE",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."RELATE",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."RELATE";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_ANYINTERACT" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."ANYINTERACT",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."ANYINTERACT",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."ANYINTERACT",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."ANYINTERACT",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."ANYINTERACT",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."ANYINTERACT",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_OBJECT_ARRAY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."ANYINTERACT";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_CONTAINS" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."CONTAINS",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."CONTAINS",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."CONTAINS",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."CONTAINS",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."CONTAINS",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."CONTAINS",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_OBJECT_ARRAY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."CONTAINS";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_INSIDE" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."INSIDE",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."INSIDE",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."INSIDE",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."INSIDE",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."INSIDE",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."INSIDE",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_OBJECT_ARRAY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."INSIDE";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_TOUCH" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."TOUCH",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."TOUCH",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."TOUCH",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."TOUCH",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."TOUCH",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."TOUCH",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_OBJECT_ARRAY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."TOUCH";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_EQUAL" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."EQUAL",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."EQUAL",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."EQUAL",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."EQUAL",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."EQUAL",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."EQUAL",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_OBJECT_ARRAY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."EQUAL";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_COVERS" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."COVERS",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."COVERS",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."COVERS",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."COVERS",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."COVERS",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."COVERS",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_OBJECT_ARRAY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."COVERS";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_COVEREDBY" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."COVEREDBY",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."COVEREDBY",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."COVEREDBY",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."COVEREDBY",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."COVEREDBY",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."COVEREDBY",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_OBJECT_ARRAY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."COVEREDBY";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_OVERLAPS" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."OVERLAP",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."OVERLAP",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."OVERLAP",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."OVERLAP",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."OVERLAP",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."OVERLAP",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_OBJECT_ARRAY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."OVERLAP";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_OVERLAPBDYDISJOINT" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."OVERLAPBDYDISJOINT",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."OVERLAPBDYDISJOINT",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."OVERLAPBDYDISJOINT",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."OVERLAPBDYDISJOINT",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."OVERLAPBDYDISJOINT",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."OVERLAPBDYDISJOINT",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_OBJECT_ARRAY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."OVERLAPBDYDISJOINT";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_OVERLAPBDYINTERSECT" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."OVERLAPBDYINTERSECT",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."OVERLAPBDYINTERSECT",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."OVERLAPBDYINTERSECT",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."OVERLAPBDYINTERSECT",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."OVERLAPBDYINTERSECT",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."OVERLAPBDYINTERSECT",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_OBJECT_ARRAY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."OVERLAPBDYINTERSECT";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_ON" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."SDOON",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."SDOON",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."SDOON",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."SDOON",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."SDO_ON",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."SDO_ON",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_OBJECT_ARRAY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."SDO_ON";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_FILTER" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."FILTER",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."FILTER",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."FILTER",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."FILTER",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."FILTER",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."FILTER",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_GEOMETRY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."FILTER",
	("MDSYS"."SDO_TOPO_GEOMETRY", "MDSYS"."SDO_TOPO_OBJECT_ARRAY") RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_TPFNS"."FILTER";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_RTREE_FILTER" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."FILTER";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_RTREE_RELATE" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."RELATE";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_WITHIN_DISTANCE" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."WITHIN_DISTANCE",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."SDO_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."WITHIN_DISTANCE",
	("MDSYS"."ST_GEOMETRY", "MDSYS"."ST_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."WITHIN_DISTANCE",
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."ST_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."WITHIN_DISTANCE";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_INT_RELATE" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY", ROWID, VARCHAR2, VARCHAR2, VARCHAR2, NUMBER, NUMBER, NUMBER) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."RELATE";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_INT_FILTER" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY", ROWID, VARCHAR2, VARCHAR2, VARCHAR2, NUMBER, NUMBER, NUMBER) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."FILTER";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_INT2_RELATE" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."RELATE";

CREATE OR REPLACE OPERATOR "MDSYS"."SDO_INT2_FILTER" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."FILTER";

CREATE OR REPLACE OPERATOR "MDSYS"."LOCATOR_WITHIN_DISTANCE" BINDING
	("MDSYS"."SDO_GEOMETRY", "MDSYS"."SDO_GEOMETRY", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."SDO_INDEX_METHOD_10I"
	   USING "SDO_3GL"."WITHIN_DISTANCE";

CREATE OR REPLACE OPERATOR "MDSYS"."RTREE_FILTER" BINDING
	("MDSYS"."SDO_MBR", "MDSYS"."SDO_MBR", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."RTREE_INDEX_METHOD"
	   USING "SDO_RTREE_ADMIN"."FILTER";

CREATE OR REPLACE OPERATOR "MDSYS"."RTREE_NN" BINDING
	("MDSYS"."SDO_MBR", "MDSYS"."SDO_MBR", VARCHAR2) RETURN VARCHAR2
	  WITH INDEX CONTEXT, SCAN CONTEXT "MDSYS"."RTREE_INDEX_METHOD"
	   USING "SDO_RTREE_ADMIN"."NN";
