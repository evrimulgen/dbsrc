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

