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
