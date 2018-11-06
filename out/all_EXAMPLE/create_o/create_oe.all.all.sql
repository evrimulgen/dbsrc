CREATE USER "OE" IDENTIFIED BY VALUES 'S:B97E2741DDA2C14FF4FFBD1561C3D660C03BC5402FDB058150190C16393D;H:95C8A8735D2D02F516801B94561FD748;T:85E7A906532D994216B461909901FECB83440B1CD6E5C41F5D051498F859FFB459CABEBEACAF2DF831CB1AD3B7E0E2112D6733E8D3C50E7339E527405DE61BA1EE9D7B6E0D16725C7E21773364697544;9C30855E7E0CB02D'
      DEFAULT TABLESPACE "EXAMPLE"
      TEMPORARY TABLESPACE "TEMP"
      PASSWORD EXPIRE
      ACCOUNT LOCK;

GRANT QUERY REWRITE TO "OE";
GRANT CREATE MATERIALIZED VIEW TO "OE";
GRANT CREATE DATABASE LINK TO "OE";
GRANT CREATE VIEW TO "OE";
GRANT CREATE SYNONYM TO "OE";
GRANT UNLIMITED TABLESPACE TO "OE";
GRANT CREATE SESSION TO "OE";
GRANT "RESOURCE" TO "OE";
GRANT "XDBADMIN" TO "OE";
ALTER USER "OE" DEFAULT ROLE ALL;
CREATE SEQUENCE  "OE"."ORDERS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1000 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
CREATE OR REPLACE EDITIONABLE SYNONYM "OE"."COUNTRIES" FOR "HR"."COUNTRIES";
CREATE OR REPLACE EDITIONABLE SYNONYM "OE"."LOCATIONS" FOR "HR"."LOCATIONS";
CREATE OR REPLACE EDITIONABLE SYNONYM "OE"."DEPARTMENTS" FOR "HR"."DEPARTMENTS";
CREATE OR REPLACE EDITIONABLE SYNONYM "OE"."JOBS" FOR "HR"."JOBS";
CREATE OR REPLACE EDITIONABLE SYNONYM "OE"."EMPLOYEES" FOR "HR"."EMPLOYEES";
CREATE OR REPLACE EDITIONABLE SYNONYM "OE"."JOB_HISTORY" FOR "HR"."JOB_HISTORY";
CREATE OR REPLACE EDITIONABLE TYPE "OE"."PRODUCT_INFORMATION_TYP"
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."CUSTOMER_TYP"
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."CATEGORY_TYP"
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."CATEGORY_TYP"
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."CUST_ADDRESS_TYP"

  AS OBJECT
    ( street_address     VARCHAR2(40)
    , postal_code        VARCHAR2(10)
    , city               VARCHAR2(30)
    , state_province     VARCHAR2(10)
    , country_id         CHAR(2)
    );
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."PHONE_LIST_TYP"

  AS VARRAY(5) OF VARCHAR2(25);
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."WAREHOUSE_TYP"

 AS OBJECT
    ( warehouse_id       NUMBER(3)
    , warehouse_name     VARCHAR2(35)
    , location_id        NUMBER(4)
    ) ;
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."ORDER_ITEM_TYP"

 AS OBJECT
    ( order_id           NUMBER(12)
    , line_item_id       NUMBER(3)
    , unit_price         NUMBER(8,2)
    , quantity           NUMBER(8)
    , product_ref  REF   product_information_typ
    ) ;
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."SUBCATEGORY_REF_LIST_TYP"

 AS TABLE OF REF category_typ;
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."PRODUCT_REF_LIST_TYP"

 AS TABLE OF number(6);
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."CATEGORY_TYP"

 AS OBJECT
    ( category_name           VARCHAR2(50)
    , category_description    VARCHAR2(1000)
    , category_id             NUMBER(2)
    , NOT instantiable
      MEMBER FUNCTION category_describe RETURN VARCHAR2
      )
  NOT INSTANTIABLE NOT FINAL
 ALTER TYPE "OE"."CATEGORY_TYP"
 ADD ATTRIBUTE (parent_category_id number(2)) CASCADE
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."SHIPPING_INSTRUCTIONS_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","SHIP_TO_NAME" VARCHAR2(20 CHAR),"SHIP_TO_ADDRESS" VARCHAR2(256 CHAR),"SHIP_TO_PHONE" VARCHAR2(24 CHAR))NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."REJECTION_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","REJECTED_BY" VARCHAR2(10 CHAR),"DATE_REJECTED" DATE,"REASON_REJECTED" VARCHAR2(2048 CHAR))NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."ACTION_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","ACTIONED_BY" VARCHAR2(10 CHAR),"DATE_ACTIONED" DATE)FINAL INSTANTIABLE
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."PART_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","PART_NUMBER" VARCHAR2(14 CHAR),"QUANTITY" NUMBER(12,4),"UNITPRICE" NUMBER(14,2))NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."INVENTORY_TYP"

 AS OBJECT
    ( product_id          NUMBER(6)
    , warehouse           warehouse_typ
    , quantity_on_hand    NUMBER(8)
    ) ;
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."ORDER_ITEM_LIST_TYP"

 AS TABLE OF order_item_typ;
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."LEAF_CATEGORY_TYP"

 UNDER category_typ
    (
    product_ref_list    product_ref_list_typ
    , OVERRIDING MEMBER FUNCTION  category_describe RETURN VARCHAR2
    );
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."COMPOSITE_CATEGORY_TYP"

 UNDER category_typ
      (
    subcategory_ref_list subcategory_ref_list_typ
      , OVERRIDING MEMBER FUNCTION  category_describe RETURN VARCHAR2
      )
  NOT FINAL;
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."ACTION_V" AS VARRAY(4) OF "ACTION_T"
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."LINEITEM_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","ITEMNUMBER" NUMBER(38),"DESCRIPTION" VARCHAR2(256 CHAR),"PART" "PART_T")NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."INVENTORY_LIST_TYP"

 AS TABLE OF inventory_typ;
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."ORDER_TYP"

 AS OBJECT
    ( order_id           NUMBER(12)
    , order_mode         VARCHAR2(8)
    , customer_ref  REF  customer_typ
    , order_status       NUMBER(2)
    , order_total        NUMBER(8,2)
    , sales_rep_id       NUMBER(6)
    , order_item_list    order_item_list_typ
    ) ;
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."CATALOG_TYP"

 UNDER composite_category_typ
      (
    MEMBER FUNCTION getCatalogName RETURN VARCHAR2
       , OVERRIDING MEMBER FUNCTION category_describe RETURN VARCHAR2
      );
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."ACTIONS_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","ACTION" "ACTION_V")NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."LINEITEM_V" AS VARRAY(2147483647) OF "LINEITEM_T"
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."PRODUCT_INFORMATION_TYP"

 AS OBJECT
    ( product_id           NUMBER(6)
    , product_name         VARCHAR2(50)
    , product_description  VARCHAR2(2000)
    , category_id          NUMBER(2)
    , weight_class         NUMBER(1)
    , warranty_period      INTERVAL YEAR(2) TO MONTH
    , supplier_id          NUMBER(6)
    , product_status       VARCHAR2(20)
    , list_price           NUMBER(8,2)
    , min_price            NUMBER(8,2)
    , catalog_url          VARCHAR2(50)
    , inventory_list       inventory_list_typ
    ) ;
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."ORDER_LIST_TYP"

 AS TABLE OF order_typ;
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."LINEITEMS_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","LINEITEM" "LINEITEM_V")NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."CUSTOMER_TYP"
 AS OBJECT
    ( customer_id        NUMBER(6)
    , cust_first_name    VARCHAR2(20)
    , cust_last_name     VARCHAR2(20)
    , cust_address       cust_address_typ
    , phone_numbers      phone_list_typ
    , nls_language       VARCHAR2(3)
    , nls_territory      VARCHAR2(40)
    , credit_limit       NUMBER(9,2)
    , cust_email         VARCHAR2(40)
    , cust_orders        order_list_typ
    )
NOT FINAL;
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."PURCHASEORDER_T" AS OBJECT ("SYS_XDBPD$" "XDB"."XDB$RAW_LIST_T","REFERENCE" VARCHAR2(30 CHAR),"ACTIONS" "ACTIONS_T","REJECTION" "REJECTION_T","REQUESTOR" VARCHAR2(128 CHAR),"USERID" VARCHAR2(10 CHAR),"COST_CENTER" VARCHAR2(4 CHAR),"SHIPPING_INSTRUCTIONS" "SHIPPING_INSTRUCTIONS_T","SPECIAL_INSTRUCTIONS" VARCHAR2(2048 CHAR),"LINEITEMS" "LINEITEMS_T")NOT FINAL INSTANTIABLE
/

CREATE OR REPLACE EDITIONABLE TYPE "OE"."CORPORATE_CUSTOMER_TYP"

 UNDER customer_typ
      ( account_mgr_id     NUMBER(6)
      );
/

GRANT EXECUTE ON "OE"."SHIPPING_INSTRUCTIONS_T" TO "XDB";
GRANT EXECUTE ON "OE"."PURCHASEORDER_T" TO "XDB";
GRANT EXECUTE ON "OE"."LINEITEMS_T" TO "XDB";
GRANT EXECUTE ON "OE"."LINEITEM_V" TO "XDB";
GRANT EXECUTE ON "OE"."LINEITEM_T" TO "XDB";
GRANT EXECUTE ON "OE"."PART_T" TO "XDB";
GRANT EXECUTE ON "OE"."ACTIONS_T" TO "XDB";
GRANT EXECUTE ON "OE"."ACTION_V" TO "XDB";
GRANT EXECUTE ON "OE"."ACTION_T" TO "XDB";
GRANT EXECUTE ON "OE"."REJECTION_T" TO "XDB";
CREATE OR REPLACE EDITIONABLE TYPE BODY "OE"."LEAF_CATEGORY_TYP" AS
    OVERRIDING MEMBER FUNCTION  category_describe RETURN VARCHAR2 IS
    BEGIN
       RETURN  'leaf_category_typ';
    END;
   END;
/

CREATE OR REPLACE EDITIONABLE TYPE BODY "OE"."COMPOSITE_CATEGORY_TYP" AS
    OVERRIDING MEMBER FUNCTION category_describe RETURN VARCHAR2 IS
    BEGIN
      RETURN 'composite_category_typ';
    END;
   END;
/

CREATE OR REPLACE EDITIONABLE TYPE BODY "OE"."CATALOG_TYP" AS
  OVERRIDING MEMBER FUNCTION category_describe RETURN varchar2 IS
  BEGIN
    RETURN 'catalog_typ';
  END;
  MEMBER FUNCTION getCatalogName RETURN varchar2 IS
  BEGIN
    -- Return the category name from the supertype
    RETURN self.category_name;
  END;
END;
/

BEGIN dbms_xmlschema.registerSchema('http://localhost:8080/source/schemas/poSource/xsd/purchaseOrder.xsd',
 '',TRUE,FALSE,FALSE,FALSE,FALSE,'OE'); END;

CREATE TABLE "OE"."ORDER_ITEMS"
   (	"ORDER_ID" NUMBER(12,0),
	"LINE_ITEM_ID" NUMBER(3,0),
	"PRODUCT_ID" NUMBER(6,0),
	"UNIT_PRICE" NUMBER(8,2),
	"QUANTITY" NUMBER(8,0)
   ) ;

CREATE TABLE "OE"."ORDERS"
   (	"ORDER_ID" NUMBER(12,0),
	"ORDER_DATE" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"ORDER_MODE" VARCHAR2(8),
	"CUSTOMER_ID" NUMBER(6,0),
	"ORDER_STATUS" NUMBER(2,0),
	"ORDER_TOTAL" NUMBER(8,2),
	"SALES_REP_ID" NUMBER(6,0),
	"PROMOTION_ID" NUMBER(6,0)
   ) ;

CREATE TABLE "OE"."INVENTORIES"
   (	"PRODUCT_ID" NUMBER(6,0),
	"WAREHOUSE_ID" NUMBER(3,0),
	"QUANTITY_ON_HAND" NUMBER(8,0)
   ) ;

CREATE TABLE "OE"."PRODUCT_INFORMATION"
   (	"PRODUCT_ID" NUMBER(6,0),
	"PRODUCT_NAME" VARCHAR2(50),
	"PRODUCT_DESCRIPTION" VARCHAR2(2000),
	"CATEGORY_ID" NUMBER(2,0),
	"WEIGHT_CLASS" NUMBER(1,0),
	"WARRANTY_PERIOD" INTERVAL YEAR (2) TO MONTH,
	"SUPPLIER_ID" NUMBER(6,0),
	"PRODUCT_STATUS" VARCHAR2(20),
	"LIST_PRICE" NUMBER(8,2),
	"MIN_PRICE" NUMBER(8,2),
	"CATALOG_URL" VARCHAR2(50)
   ) ;

CREATE TABLE "OE"."PRODUCT_DESCRIPTIONS"
   (	"PRODUCT_ID" NUMBER(6,0),
	"LANGUAGE_ID" VARCHAR2(3),
	"TRANSLATED_NAME" NVARCHAR2(50),
	"TRANSLATED_DESCRIPTION" NVARCHAR2(2000)
   ) ;

CREATE TABLE "OE"."PROMOTIONS"
   (	"PROMO_ID" NUMBER(6,0),
	"PROMO_NAME" VARCHAR2(20)
   ) ;

CREATE TABLE "OE"."CUSTOMERS"
   (	"CUSTOMER_ID" NUMBER(6,0),
	"CUST_FIRST_NAME" VARCHAR2(20),
	"CUST_LAST_NAME" VARCHAR2(20),
	"CUST_ADDRESS" "OE"."CUST_ADDRESS_TYP" ,
	"PHONE_NUMBERS" "OE"."PHONE_LIST_TYP" ,
	"NLS_LANGUAGE" VARCHAR2(3),
	"NLS_TERRITORY" VARCHAR2(30),
	"CREDIT_LIMIT" NUMBER(9,2),
	"CUST_EMAIL" VARCHAR2(40),
	"ACCOUNT_MGR_ID" NUMBER(6,0),
	"CUST_GEO_LOCATION" "MDSYS"."SDO_GEOMETRY" ,
	"DATE_OF_BIRTH" DATE,
	"MARITAL_STATUS" VARCHAR2(20),
	"GENDER" VARCHAR2(1),
	"INCOME_LEVEL" VARCHAR2(20)
   )
 VARRAY "CUST_GEO_LOCATION"."SDO_ELEM_INFO" STORE AS SECUREFILE LOB
 VARRAY "CUST_GEO_LOCATION"."SDO_ORDINATES" STORE AS SECUREFILE LOB ;

CREATE TABLE "OE"."WAREHOUSES"
   (	"WAREHOUSE_ID" NUMBER(3,0),
	"WAREHOUSE_SPEC" "SYS"."XMLTYPE" ,
	"WAREHOUSE_NAME" VARCHAR2(35),
	"LOCATION_ID" NUMBER(4,0),
	"WH_GEO_LOCATION" "MDSYS"."SDO_GEOMETRY"
   )
 VARRAY "WH_GEO_LOCATION"."SDO_ELEM_INFO" STORE AS SECUREFILE LOB
 VARRAY "WH_GEO_LOCATION"."SDO_ORDINATES" STORE AS SECUREFILE LOB ;

CREATE TABLE "OE"."PURCHASEORDER" OF XMLTYPE
  XMLSCHEMA "http://localhost:8080/source/schemas/poSource/xsd/purchaseOrder.xsd" ELEMENT "PurchaseOrder" ID 3986
 VARRAY "XMLDATA"."ACTIONS"."ACTION" STORE AS TABLE "ACTION_TABLE"
 (
 VARRAY "SYS_XDBPD$" STORE AS SECUREFILE LOB ) RETURN AS LOCATOR
 VARRAY "XMLDATA"."LINEITEMS"."LINEITEM" STORE AS TABLE "LINEITEM_TABLE"
 (
 VARRAY "SYS_XDBPD$" STORE AS SECUREFILE LOB
 VARRAY "PART"."SYS_XDBPD$" STORE AS SECUREFILE LOB ) RETURN AS LOCATOR
 VARRAY "XMLEXTRA"."NAMESPACES" STORE AS SECUREFILE LOB "NAMESPACES627_L"
 VARRAY "XMLEXTRA"."EXTRADATA" STORE AS SECUREFILE LOB "EXTRADATA626_L"
 VARRAY "XMLDATA"."SYS_XDBPD$" STORE AS SECUREFILE LOB "SYS_XDBPD$621_L"
 VARRAY "XMLDATA"."ACTIONS"."SYS_XDBPD$" STORE AS SECUREFILE LOB "SYS_XDBPD$622_L"
 VARRAY "XMLDATA"."REJECTION"."SYS_XDBPD$" STORE AS SECUREFILE LOB "SYS_XDBPD$623_L"
 VARRAY "XMLDATA"."SHIPPING_INSTRUCTIONS"."SYS_XDBPD$" STORE AS SECUREFILE LOB "SYS_XDBPD$624_L"
 VARRAY "XMLDATA"."LINEITEMS"."SYS_XDBPD$" STORE AS SECUREFILE LOB "SYS_XDBPD$625_L";

CREATE TABLE "OE"."CATEGORIES_TAB" OF "OE"."CATEGORY_TYP"

 NESTED TABLE TREAT(SYS_NC_ROWINFO$ AS "OE"."LEAF_CATEGORY_TYP")."PRODUCT_REF_LIST" STORE AS "PRODUCT_REF_LIST_NESTEDTAB"
 RETURN AS VALUE
 NESTED TABLE TREAT(SYS_NC_ROWINFO$ AS "OE"."COMPOSITE_CATEGORY_TYP")."SUBCATEGORY_REF_LIST" STORE AS "SUBCATEGORY_REF_LIST_NESTEDTAB"
 RETURN AS VALUE;

GRANT SELECT ON "OE"."CUSTOMERS" TO "PM";
GRANT SELECT ON "OE"."PROMOTIONS" TO "BI";
GRANT SELECT ON "OE"."PRODUCT_DESCRIPTIONS" TO "BI";
GRANT SELECT ON "OE"."PRODUCT_DESCRIPTIONS" TO "PM";
GRANT SELECT ON "OE"."PRODUCT_INFORMATION" TO "BI";
GRANT SELECT ON "OE"."PRODUCT_INFORMATION" TO "PM";
GRANT REFERENCES ON "OE"."PRODUCT_INFORMATION" TO "PM";
GRANT SELECT ON "OE"."INVENTORIES" TO "BI";
GRANT SELECT ON "OE"."INVENTORIES" TO "PM";
GRANT SELECT ON "OE"."ORDERS" TO "BI";
GRANT SELECT ON "OE"."ORDERS" TO "PM";
GRANT SELECT ON "OE"."ORDER_ITEMS" TO "BI";
GRANT SELECT ON "OE"."ORDER_ITEMS" TO "PM";
GRANT SELECT ON "OE"."WAREHOUSES" TO "BI";
GRANT SELECT ON "OE"."WAREHOUSES" TO "PM";
GRANT SELECT ON "OE"."CUSTOMERS" TO "BI";
COMMENT ON COLUMN "OE"."CUSTOMERS"."CUSTOMER_ID" IS 'Primary key column.';
COMMENT ON COLUMN "OE"."CUSTOMERS"."CUST_FIRST_NAME" IS 'NOT NULL constraint.';
COMMENT ON COLUMN "OE"."CUSTOMERS"."CUST_LAST_NAME" IS 'NOT NULL constraint.';
COMMENT ON COLUMN "OE"."CUSTOMERS"."CUST_ADDRESS" IS 'Object column of type address_typ.';
COMMENT ON COLUMN "OE"."CUSTOMERS"."PHONE_NUMBERS" IS 'Varray column of type phone_list_typ';
COMMENT ON COLUMN "OE"."CUSTOMERS"."CREDIT_LIMIT" IS 'Check constraint.';
COMMENT ON COLUMN "OE"."CUSTOMERS"."ACCOUNT_MGR_ID" IS 'References hr.employees.employee_id.';
COMMENT ON COLUMN "OE"."CUSTOMERS"."CUST_GEO_LOCATION" IS 'SDO (spatial) column.';
COMMENT ON TABLE "OE"."CUSTOMERS"  IS 'Contains customers data either entered by an employee or by the customer
him/herself over the Web.';

COMMENT ON COLUMN "OE"."WAREHOUSES"."WAREHOUSE_ID" IS 'Primary key column.';
COMMENT ON COLUMN "OE"."WAREHOUSES"."LOCATION_ID" IS 'Primary key column, references hr.locations.location_id.';
COMMENT ON COLUMN "OE"."WAREHOUSES"."WH_GEO_LOCATION" IS 'SDO (spatial) column.';
COMMENT ON TABLE "OE"."WAREHOUSES"  IS 'Warehouse data unspecific to any industry.';
COMMENT ON COLUMN "OE"."ORDER_ITEMS"."ORDER_ID" IS 'Part of concatenated primary key, references orders.order_id.';
COMMENT ON COLUMN "OE"."ORDER_ITEMS"."LINE_ITEM_ID" IS 'Part of concatenated primary key.';
COMMENT ON COLUMN "OE"."ORDER_ITEMS"."PRODUCT_ID" IS 'References product_information.product_id.';
COMMENT ON TABLE "OE"."ORDER_ITEMS"  IS 'Example of many-to-many resolution.';
COMMENT ON COLUMN "OE"."ORDERS"."ORDER_ID" IS 'PRIMARY KEY column.';
COMMENT ON COLUMN "OE"."ORDERS"."ORDER_DATE" IS 'TIMESTAMP WITH LOCAL TIME ZONE column, NOT NULL constraint.';
COMMENT ON COLUMN "OE"."ORDERS"."ORDER_MODE" IS 'CHECK constraint.';
COMMENT ON COLUMN "OE"."ORDERS"."ORDER_STATUS" IS '0: Not fully entered, 1: Entered, 2: Canceled - bad credit, -
3: Canceled - by customer, 4: Shipped - whole order, -
5: Shipped - replacement items, 6: Shipped - backlog on items, -
7: Shipped - special delivery, 8: Shipped - billed, 9: Shipped - payment plan,-
10: Shipped - paid';

COMMENT ON COLUMN "OE"."ORDERS"."ORDER_TOTAL" IS 'CHECK constraint.';
COMMENT ON COLUMN "OE"."ORDERS"."SALES_REP_ID" IS 'References hr.employees.employee_id.';
COMMENT ON COLUMN "OE"."ORDERS"."PROMOTION_ID" IS 'Sales promotion ID. Used in SH schema';
COMMENT ON TABLE "OE"."ORDERS"  IS 'Contains orders entered by a salesperson as well as over the Web.';
COMMENT ON COLUMN "OE"."INVENTORIES"."PRODUCT_ID" IS 'Part of concatenated primary key, references product_information.product_id.';
COMMENT ON COLUMN "OE"."INVENTORIES"."WAREHOUSE_ID" IS 'Part of concatenated primary key, references warehouses.warehouse_id.';
COMMENT ON TABLE "OE"."INVENTORIES"  IS 'Tracks availability of products by product_it and warehouse_id.';
COMMENT ON COLUMN "OE"."PRODUCT_INFORMATION"."PRODUCT_ID" IS 'Primary key column.';
COMMENT ON COLUMN "OE"."PRODUCT_INFORMATION"."PRODUCT_DESCRIPTION" IS 'Primary language description corresponding to translated_description in
oe.product_descriptions, added to provide non-NLS text columns for OC views
to accss.';

COMMENT ON COLUMN "OE"."PRODUCT_INFORMATION"."CATEGORY_ID" IS 'Low cardinality column, can be used for bitmap index.
Schema SH uses it as foreign key';

COMMENT ON COLUMN "OE"."PRODUCT_INFORMATION"."WEIGHT_CLASS" IS 'Low cardinality column, can be used for bitmap index.';
COMMENT ON COLUMN "OE"."PRODUCT_INFORMATION"."WARRANTY_PERIOD" IS 'INTERVAL YEAER TO MONTH column, low cardinality, can be used for bitmap
index.';

COMMENT ON COLUMN "OE"."PRODUCT_INFORMATION"."SUPPLIER_ID" IS 'Offers possibility of extensions outside Common Schema.';
COMMENT ON COLUMN "OE"."PRODUCT_INFORMATION"."PRODUCT_STATUS" IS 'Check constraint. Appropriate for complex rules, such as "All products in
status PRODUCTION must have at least one inventory entry." Also appropriate
for a trigger auditing status change.';

COMMENT ON TABLE "OE"."PRODUCT_INFORMATION"  IS 'Non-industry-specific data in various categories.';
COMMENT ON COLUMN "OE"."PRODUCT_DESCRIPTIONS"."PRODUCT_ID" IS 'Primary key column.';
COMMENT ON COLUMN "OE"."PRODUCT_DESCRIPTIONS"."LANGUAGE_ID" IS 'Primary key column.';
COMMENT ON TABLE "OE"."PRODUCT_DESCRIPTIONS"  IS 'Non-industry-specific design, allows selection of NLS-setting-specific data
derived at runtime, for example using the products view.';

CREATE OR REPLACE EDITIONABLE FUNCTION "OE"."GET_PHONE_NUMBER_F"
  (p_in INTEGER, p_phonelist phone_list_typ)
RETURN VARCHAR2 AS
  TYPE phone_list IS VARRAY(5) OF VARCHAR2(25);
  phone_out varchar2(25) := null;
  v_size INTEGER;
BEGIN
    IF p_phonelist.FIRST IS NULL OR
       p_in > (p_phonelist.LAST + 1) - p_phonelist.FIRST THEN
      RETURN phone_out;
    ELSE
      phone_out := p_phonelist(p_in);
      RETURN phone_out;
    END IF;
END;
/


ALTER FUNCTION "OE"."GET_PHONE_NUMBER_F"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2018-10-12 12:12:35'
/

CREATE INDEX "OE"."CUST_ACCOUNT_MANAGER_IX" ON "OE"."CUSTOMERS" ("ACCOUNT_MGR_ID")
  ;

CREATE INDEX "OE"."CUST_LNAME_IX" ON "OE"."CUSTOMERS" ("CUST_LAST_NAME")
  ;

CREATE INDEX "OE"."CUST_EMAIL_IX" ON "OE"."CUSTOMERS" ("CUST_EMAIL")
  ;

CREATE UNIQUE INDEX "OE"."CUSTOMERS_PK" ON "OE"."CUSTOMERS" ("CUSTOMER_ID")
  ;

CREATE INDEX "OE"."WHS_LOCATION_IX" ON "OE"."WAREHOUSES" ("LOCATION_ID")
  ;

CREATE UNIQUE INDEX "OE"."WAREHOUSES_PK" ON "OE"."WAREHOUSES" ("WAREHOUSE_ID")
  ;

CREATE INDEX "OE"."ITEM_ORDER_IX" ON "OE"."ORDER_ITEMS" ("ORDER_ID")
  ;

CREATE INDEX "OE"."ITEM_PRODUCT_IX" ON "OE"."ORDER_ITEMS" ("PRODUCT_ID")
  ;

CREATE UNIQUE INDEX "OE"."ORDER_ITEMS_PK" ON "OE"."ORDER_ITEMS" ("ORDER_ID", "LINE_ITEM_ID")
  ;

CREATE UNIQUE INDEX "OE"."ORDER_ITEMS_UK" ON "OE"."ORDER_ITEMS" ("ORDER_ID", "PRODUCT_ID")
  ;

CREATE UNIQUE INDEX "OE"."ORDER_PK" ON "OE"."ORDERS" ("ORDER_ID")
  ;

CREATE INDEX "OE"."ORD_SALES_REP_IX" ON "OE"."ORDERS" ("SALES_REP_ID")
  ;

CREATE INDEX "OE"."ORD_CUSTOMER_IX" ON "OE"."ORDERS" ("CUSTOMER_ID")
  ;

CREATE INDEX "OE"."ORD_ORDER_DATE_IX" ON "OE"."ORDERS" ("ORDER_DATE")
  ;

CREATE INDEX "OE"."INVENTORY_IX" ON "OE"."INVENTORIES" ("WAREHOUSE_ID", "PRODUCT_ID")
  ;

CREATE INDEX "OE"."INV_PRODUCT_IX" ON "OE"."INVENTORIES" ("PRODUCT_ID")
  ;

CREATE UNIQUE INDEX "OE"."PRODUCT_INFORMATION_PK" ON "OE"."PRODUCT_INFORMATION" ("PRODUCT_ID")
  ;

CREATE INDEX "OE"."PROD_SUPPLIER_IX" ON "OE"."PRODUCT_INFORMATION" ("SUPPLIER_ID")
  ;

CREATE UNIQUE INDEX "OE"."PRD_DESC_PK" ON "OE"."PRODUCT_DESCRIPTIONS" ("PRODUCT_ID", "LANGUAGE_ID")
  ;

CREATE INDEX "OE"."PROD_NAME_IX" ON "OE"."PRODUCT_DESCRIPTIONS" ("TRANSLATED_NAME")
  ;

CREATE UNIQUE INDEX "OE"."PROMO_ID_PK" ON "OE"."PROMOTIONS" ("PROMO_ID")
  ;

CREATE INDEX "OE"."SYS_FK0000093168N00007$" ON "OE"."PRODUCT_REF_LIST_NESTEDTAB" ("NESTED_TABLE_ID")
  ;

CREATE INDEX "OE"."SYS_FK0000093168N00009$" ON "OE"."SUBCATEGORY_REF_LIST_NESTEDTAB" ("NESTED_TABLE_ID")
  ;

CREATE INDEX "OE"."CUST_UPPER_NAME_IX" ON "OE"."CUSTOMERS" (UPPER("CUST_LAST_NAME"), UPPER("CUST_FIRST_NAME"))
  ;

ALTER TABLE "OE"."CUSTOMERS" ADD CONSTRAINT "CUSTOMER_CREDIT_LIMIT_MAX" CHECK (credit_limit <= 5000) ENABLE;
ALTER TABLE "OE"."CUSTOMERS" ADD CONSTRAINT "CUSTOMER_ID_MIN" CHECK (customer_id > 0) ENABLE;
ALTER TABLE "OE"."CUSTOMERS" ADD CONSTRAINT "CUSTOMERS_PK" PRIMARY KEY ("CUSTOMER_ID")
  USING INDEX  ENABLE;

ALTER TABLE "OE"."WAREHOUSES" ADD CONSTRAINT "WAREHOUSES_PK" PRIMARY KEY ("WAREHOUSE_ID")
  USING INDEX  ENABLE;

ALTER TABLE "OE"."ORDER_ITEMS" ADD CONSTRAINT "ORDER_ITEMS_PK" PRIMARY KEY ("ORDER_ID", "LINE_ITEM_ID")
  USING INDEX  ENABLE;

ALTER TABLE "OE"."ORDERS" ADD CONSTRAINT "ORDER_MODE_LOV" CHECK (order_mode in ('direct','online')) ENABLE;
ALTER TABLE "OE"."ORDERS" ADD CONSTRAINT "ORDER_TOTAL_MIN" CHECK (order_total >= 0) ENABLE;
ALTER TABLE "OE"."ORDERS" ADD CONSTRAINT "ORDER_PK" PRIMARY KEY ("ORDER_ID")
  USING INDEX  ENABLE;

ALTER TABLE "OE"."INVENTORIES" ADD CONSTRAINT "INVENTORY_PK" PRIMARY KEY ("PRODUCT_ID", "WAREHOUSE_ID")
  USING INDEX (CREATE INDEX "OE"."INVENTORY_IX" ON "OE"."INVENTORIES" ("WAREHOUSE_ID", "PRODUCT_ID")
  )  ENABLE;

ALTER TABLE "OE"."PRODUCT_INFORMATION" ADD CONSTRAINT "PRODUCT_STATUS_LOV" CHECK (product_status in ('orderable'
                                                  ,'planned'
                                                  ,'under development'
                                                  ,'obsolete')
                               ) ENABLE;

ALTER TABLE "OE"."PRODUCT_INFORMATION" ADD CONSTRAINT "PRODUCT_INFORMATION_PK" PRIMARY KEY ("PRODUCT_ID")
  USING INDEX  ENABLE;

ALTER TABLE "OE"."PRODUCT_DESCRIPTIONS" ADD CONSTRAINT "PRODUCT_DESCRIPTIONS_PK" PRIMARY KEY ("PRODUCT_ID", "LANGUAGE_ID")
  USING INDEX (CREATE UNIQUE INDEX "OE"."PRD_DESC_PK" ON "OE"."PRODUCT_DESCRIPTIONS" ("PRODUCT_ID", "LANGUAGE_ID")
  )  ENABLE;

ALTER TABLE "OE"."PROMOTIONS" ADD CONSTRAINT "PROMO_ID_PK" PRIMARY KEY ("PROMO_ID")
  USING INDEX  ENABLE;

ALTER TABLE "OE"."ACTION_TABLE" ADD PRIMARY KEY ("NESTED_TABLE_ID", "SYS_NC_ARRAY_INDEX$")
  USING INDEX  ENABLE;

ALTER TABLE "OE"."LINEITEM_TABLE" ADD PRIMARY KEY ("NESTED_TABLE_ID", "SYS_NC_ARRAY_INDEX$")
  USING INDEX  ENABLE;

ALTER TABLE "OE"."CATEGORIES_TAB" ADD PRIMARY KEY ("CATEGORY_ID")
  USING INDEX  ENABLE;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OE"."PRODUCTS" ("PRODUCT_ID",
"LANGUAGE_ID",
"PRODUCT_NAME",
"CATEGORY_ID",
"PRODUCT_DESCRIPTION",
"WEIGHT_CLASS",
"WARRANTY_PERIOD",
"SUPPLIER_ID",
"PRODUCT_STATUS",
"LIST_PRICE",
"MIN_PRICE",
"CATALOG_URL") AS
  SELECT i.product_id
,      d.language_id
,      CASE WHEN d.language_id IS NOT NULL
            THEN d.translated_name
            ELSE TRANSLATE(i.product_name USING NCHAR_CS)
       END    AS product_name
,      i.category_id
,      CASE WHEN d.language_id IS NOT NULL
            THEN d.translated_description
            ELSE TRANSLATE(i.product_description USING NCHAR_CS)
       END    AS product_description
,      i.weight_class
,      i.warranty_period
,      i.supplier_id
,      i.product_status
,      i.list_price
,      i.min_price
,      i.catalog_url
FROM   product_information  i
,      product_descriptions d
WHERE  d.product_id  (+) = i.product_id
AND    d.language_id (+) = sys_context('USERENV','LANG');

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OE"."SYDNEY_INVENTORY" ("PRODUCT_ID",
"PRODUCT_NAME",
"QUANTITY_ON_HAND") AS
  SELECT p.product_id
,      p.product_name
,      i.quantity_on_hand
FROM   inventories i
,      warehouses  w
,      products    p
WHERE  p.product_id = i.product_id
AND    i.warehouse_id = w.warehouse_id
AND    w.warehouse_name = 'Sydney';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OE"."BOMBAY_INVENTORY" ("PRODUCT_ID",
"PRODUCT_NAME",
"QUANTITY_ON_HAND") AS
  SELECT p.product_id
,      p.product_name
,      i.quantity_on_hand
FROM   inventories i
,      warehouses  w
,      products    p
WHERE  p.product_id = i.product_id
AND    i.warehouse_id = w.warehouse_id
AND    w.warehouse_name = 'Bombay';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OE"."TORONTO_INVENTORY" ("PRODUCT_ID",
"PRODUCT_NAME",
"QUANTITY_ON_HAND") AS
  SELECT p.product_id
,      p.product_name
,      i.quantity_on_hand
FROM   inventories i
,      warehouses  w
,      products    p
WHERE  p.product_id = i.product_id
AND    i.warehouse_id = w.warehouse_id
AND    w.warehouse_name = 'Toronto';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OE"."PRODUCT_PRICES" ("CATEGORY_ID",
"#_OF_PRODUCTS",
"LOW_PRICE",
"HIGH_PRICE") AS
  SELECT category_id
,      COUNT(*)        as "#_OF_PRODUCTS"
,      MIN(list_price) as low_price
,      MAX(list_price) as high_price
FROM   product_information
GROUP BY category_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OE"."ACCOUNT_MANAGERS" ("ACCT_MGR",
"REGION",
"COUNTRY",
"PROVINCE",
"NUM_CUSTOMERS") AS
  SELECT		c.account_mgr_id 		ACCT_MGR,
		cr.region_id 			REGION,
		c.cust_address.country_id 	COUNTRY,
		c.cust_address.state_province 	PROVINCE,
		count(*) 			NUM_CUSTOMERS
FROM		customers c, countries cr
WHERE		c.cust_address.country_id = cr.country_id
GROUP BY ROLLUP (c.account_mgr_id,
		 cr.region_id,
		 c.cust_address.country_id,
		 c.cust_address.state_province);

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OE"."CUSTOMERS_VIEW" ("CUSTOMER_ID",
"CUST_FIRST_NAME",
"CUST_LAST_NAME",
"STREET_ADDRESS",
"POSTAL_CODE",
"CITY",
"STATE_PROVINCE",
"COUNTRY_ID",
"COUNTRY_NAME",
"REGION_ID",
"NLS_LANGUAGE",
"NLS_TERRITORY",
"CREDIT_LIMIT",
"CUST_EMAIL",
"PRIMARY_PHONE_NUMBER",
"PHONE_NUMBER_2",
"PHONE_NUMBER_3",
"PHONE_NUMBER_4",
"PHONE_NUMBER_5",
"ACCOUNT_MGR_ID",
"LOCATION_GTYPE",
"LOCATION_SRID",
"LOCATION_X",
"LOCATION_Y",
"LOCATION_Z") AS
  SELECT
  c.customer_id,
  c.cust_first_name,
  c.cust_last_name,
  c.cust_address.street_address street_address,
  c.cust_address.postal_code postal_code,
  c.cust_address.city city,
  c.cust_address.state_province state_province,
  co.country_id,
  co.country_name,
  co.region_id,
  c.nls_language,
  c.nls_territory,
  c.credit_limit,
  c.cust_email,
  substr(get_phone_number_f(1,phone_numbers),1,25) Primary_Phone_number,
  substr(get_phone_number_f(2,phone_numbers),1,25) Phone_number_2,
  substr(get_phone_number_f(3,phone_numbers),1,25) Phone_number_3,
  substr(get_phone_number_f(4,phone_numbers),1,25) Phone_number_4,
  substr(get_phone_number_f(5,phone_numbers),1,25) Phone_number_5,
  c.account_mgr_id,
  c.cust_geo_location.sdo_gtype location_gtype,
  c.cust_geo_location.sdo_srid location_srid,
  c.cust_geo_location.sdo_point.x location_x,
  c.cust_geo_location.sdo_point.y location_y,
  c.cust_geo_location.sdo_point.z location_z
FROM
  countries co,
  customers c
WHERE
  c.cust_address.country_id = co.country_id(+)
;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OE"."ORDERS_VIEW" ("ORDER_ID",
"ORDER_DATE",
"ORDER_MODE",
"CUSTOMER_ID",
"ORDER_STATUS",
"ORDER_TOTAL",
"SALES_REP_ID",
"PROMOTION_ID") AS
  select order_id,
  to_date(to_char(order_date,'DD-MON-YY HH:MI:SS'),'DD-MON-YY HH:MI:SS')    order_date,
order_mode,
customer_id,
order_status,
order_total,
sales_rep_id,
promotion_id
from orders;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OE"."OC_INVENTORIES" OF "OE"."INVENTORY_TYP"
  WITH OBJECT IDENTIFIER (product_id) AS
  SELECT i.product_id,
           warehouse_typ(w.warehouse_id, w.warehouse_name, w.location_id),
           i.quantity_on_hand
    FROM inventories i, warehouses w
    WHERE i.warehouse_id=w.warehouse_id;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OE"."OC_PRODUCT_INFORMATION" OF "OE"."PRODUCT_INFORMATION_TYP"
  WITH OBJECT IDENTIFIER (product_id) AS
  SELECT p.product_id, p.product_name, p.product_description, p.category_id,
           p.weight_class, p.warranty_period, p.supplier_id, p.product_status,
           p.list_price, p.min_price, p.catalog_url,
           CAST(MULTISET(SELECT i.product_id,i.warehouse,i.quantity_on_hand
                         FROM oc_inventories i
                         WHERE p.product_id=i.product_id)
                AS inventory_list_typ)
    FROM product_information p;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OE"."OC_CUSTOMERS" OF "OE"."CUSTOMER_TYP"
  WITH OBJECT IDENTIFIER (customer_id) AS
  SELECT c.customer_id, c.cust_first_name, c.cust_last_name, c.cust_address,
           c.phone_numbers,c.nls_language,c.nls_territory,c.credit_limit,
           c.cust_email,
           CAST(MULTISET(SELECT o.order_id, o.order_mode,
                               MAKE_REF(oc_customers,o.customer_id),
                               o.order_status,
                               o.order_total,o.sales_rep_id,
                               CAST(MULTISET(SELECT l.order_id,l.line_item_id,
                                                    l.unit_price,l.quantity,
                                             MAKE_REF(oc_product_information,
                                                      l.product_id)
                                             FROM order_items l
                                             WHERE o.order_id = l.order_id)
                                    AS order_item_list_typ)
                         FROM orders o
                         WHERE c.customer_id = o.customer_id)
                AS order_list_typ)
     FROM customers c;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OE"."OC_CORPORATE_CUSTOMERS" OF "OE"."CORPORATE_CUSTOMER_TYP"
  UNDER oc_customers AS
  SELECT c.customer_id, c.cust_first_name, c.cust_last_name,
              c.cust_address, c.phone_numbers,c.nls_language,c.nls_territory,
              c.credit_limit, c.cust_email,
              CAST(MULTISET(SELECT o.order_id, o.order_mode,
                               MAKE_REF(oc_customers,o.customer_id),
                               o.order_status,
                               o.order_total,o.sales_rep_id,
                               CAST(MULTISET(SELECT l.order_id,l.line_item_id,
                                         l.unit_price,l.quantity,
                                         make_ref(oc_product_information,
                                                    l.product_id)
                                             FROM order_items l
                                             WHERE o.order_id = l.order_id)
                                    AS order_item_list_typ)
                            FROM orders o
                            WHERE c.customer_id = o.customer_id)
              AS order_list_typ), c.account_mgr_id
     FROM customers c;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "OE"."OC_ORDERS" OF "OE"."ORDER_TYP"
  WITH OBJECT IDENTIFIER (order_id) AS
  SELECT o.order_id, o.order_mode,MAKE_REF(oc_customers,o.customer_id),
        o.order_status,o.order_total,o.sales_rep_id,
       CAST(MULTISET(SELECT l.order_id,l.line_item_id,l.unit_price,l.quantity,
                       make_ref(oc_product_information,l.product_id)
                     FROM order_items l
                     WHERE o.order_id = l.order_id)
            AS order_item_list_typ)
    FROM orders o;

GRANT SELECT ON "OE"."PRODUCTS" TO "BI";
GRANT SELECT ON "OE"."PRODUCT_PRICES" TO "BI";
GRANT SELECT ON "OE"."TORONTO_INVENTORY" TO "BI";
GRANT SELECT ON "OE"."BOMBAY_INVENTORY" TO "BI";
GRANT SELECT ON "OE"."SYDNEY_INVENTORY" TO "BI";
COMMENT ON TABLE "OE"."PRODUCTS"  IS 'This view joins product_information and product_descriptions, using NLS
settings to pick the appropriate language-specific product description.';

COMMENT ON TABLE "OE"."SYDNEY_INVENTORY"  IS 'This view shows inventories at the Sydney warehouse.';
COMMENT ON TABLE "OE"."BOMBAY_INVENTORY"  IS 'This view shows inventories at the Bombay warehouse.';
COMMENT ON TABLE "OE"."TORONTO_INVENTORY"  IS 'This view shows inventories at the Toronto warehouse.';
CREATE OR REPLACE EDITIONABLE TYPE BODY "OE"."LEAF_CATEGORY_TYP" AS
    OVERRIDING MEMBER FUNCTION  category_describe RETURN VARCHAR2 IS
    BEGIN
       RETURN  'leaf_category_typ';
    END;
   END;
/

CREATE OR REPLACE EDITIONABLE TYPE BODY "OE"."COMPOSITE_CATEGORY_TYP" AS
    OVERRIDING MEMBER FUNCTION category_describe RETURN VARCHAR2 IS
    BEGIN
      RETURN 'composite_category_typ';
    END;
   END;
/

CREATE OR REPLACE EDITIONABLE TYPE BODY "OE"."CATALOG_TYP" AS
  OVERRIDING MEMBER FUNCTION category_describe RETURN varchar2 IS
  BEGIN
    RETURN 'catalog_typ';
  END;
  MEMBER FUNCTION getCatalogName RETURN varchar2 IS
  BEGIN
    -- Return the category name from the supertype
    RETURN self.category_name;
  END;
END;
/

ALTER TABLE "OE"."CUSTOMERS" ADD CONSTRAINT "CUSTOMERS_ACCOUNT_MANAGER_FK" FOREIGN KEY ("ACCOUNT_MGR_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ON DELETE SET NULL ENABLE;

ALTER TABLE "OE"."WAREHOUSES" ADD CONSTRAINT "WAREHOUSES_LOCATION_FK" FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "HR"."LOCATIONS" ("LOCATION_ID") ON DELETE SET NULL ENABLE;

ALTER TABLE "OE"."ORDER_ITEMS" ADD CONSTRAINT "ORDER_ITEMS_ORDER_ID_FK" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "OE"."ORDERS" ("ORDER_ID") ON DELETE CASCADE ENABLE NOVALIDATE;

ALTER TABLE "OE"."ORDER_ITEMS" ADD CONSTRAINT "ORDER_ITEMS_PRODUCT_ID_FK" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "OE"."PRODUCT_INFORMATION" ("PRODUCT_ID") ENABLE;

ALTER TABLE "OE"."ORDERS" ADD CONSTRAINT "ORDERS_SALES_REP_FK" FOREIGN KEY ("SALES_REP_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ON DELETE SET NULL ENABLE;

ALTER TABLE "OE"."ORDERS" ADD CONSTRAINT "ORDERS_CUSTOMER_ID_FK" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "OE"."CUSTOMERS" ("CUSTOMER_ID") ON DELETE SET NULL ENABLE;

ALTER TABLE "OE"."INVENTORIES" ADD CONSTRAINT "INVENTORIES_WAREHOUSES_FK" FOREIGN KEY ("WAREHOUSE_ID")
	  REFERENCES "OE"."WAREHOUSES" ("WAREHOUSE_ID") ENABLE NOVALIDATE;

ALTER TABLE "OE"."INVENTORIES" ADD CONSTRAINT "INVENTORIES_PRODUCT_ID_FK" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "OE"."PRODUCT_INFORMATION" ("PRODUCT_ID") ENABLE;

ALTER TABLE "OE"."PRODUCT_DESCRIPTIONS" ADD CONSTRAINT "PD_PRODUCT_ID_FK" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "OE"."PRODUCT_INFORMATION" ("PRODUCT_ID") ENABLE;

CREATE OR REPLACE EDITIONABLE TRIGGER "OE"."INSERT_ORD_LINE"
  BEFORE INSERT ON order_items
  FOR EACH ROW
  DECLARE
    new_line number;
  BEGIN
    SELECT (NVL(MAX(line_item_id),0)+1) INTO new_line
      FROM order_items
      WHERE order_id = :new.order_id;
    :new.line_item_id := new_line;
  END;
/

ALTER TRIGGER "OE"."INSERT_ORD_LINE" ENABLE;
CREATE OR REPLACE EDITIONABLE TRIGGER "OE"."ORDERS_TRG" INSTEAD OF INSERT
 ON oc_orders FOR EACH ROW
BEGIN
   INSERT INTO ORDERS (order_id, order_mode, order_total,
                       sales_rep_id, order_status)
               VALUES (:NEW.order_id, :NEW.order_mode,
                       :NEW.order_total, :NEW.sales_rep_id,
                       :NEW.order_status);
END;
/

ALTER TRIGGER "OE"."ORDERS_TRG" ENABLE;
CREATE OR REPLACE EDITIONABLE TRIGGER "OE"."ORDERS_ITEMS_TRG" INSTEAD OF INSERT ON NESTED
 TABLE order_item_list OF oc_orders FOR EACH ROW
DECLARE
    prod  product_information_typ;
BEGIN
    SELECT DEREF(:NEW.product_ref) INTO prod FROM DUAL;
    INSERT INTO order_items VALUES (prod.product_id, :NEW.order_id,
                                    :NEW.line_item_id, :NEW.unit_price,
                                    :NEW.quantity);
END;
/

ALTER TRIGGER "OE"."ORDERS_ITEMS_TRG" ENABLE;
