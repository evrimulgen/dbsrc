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

COMMENT ON TABLE "OE"."PRODUCTS"  IS 'This view joins product_information and product_descriptions, using NLS
settings to pick the appropriate language-specific product description.';

COMMENT ON TABLE "OE"."SYDNEY_INVENTORY"  IS 'This view shows inventories at the Sydney warehouse.';
COMMENT ON TABLE "OE"."BOMBAY_INVENTORY"  IS 'This view shows inventories at the Bombay warehouse.';
COMMENT ON TABLE "OE"."TORONTO_INVENTORY"  IS 'This view shows inventories at the Toronto warehouse.';
