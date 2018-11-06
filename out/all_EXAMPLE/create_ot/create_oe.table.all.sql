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
