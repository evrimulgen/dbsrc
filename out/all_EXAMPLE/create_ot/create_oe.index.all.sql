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

