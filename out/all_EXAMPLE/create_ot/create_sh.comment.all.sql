COMMENT ON COLUMN "SH"."SALES"."PROD_ID" IS 'FK to the products dimension table';
COMMENT ON COLUMN "SH"."SALES"."CUST_ID" IS 'FK to the customers dimension table';
COMMENT ON COLUMN "SH"."SALES"."TIME_ID" IS 'FK to the times dimension table';
COMMENT ON COLUMN "SH"."SALES"."CHANNEL_ID" IS 'FK to the channels dimension table';
COMMENT ON COLUMN "SH"."SALES"."PROMO_ID" IS 'promotion identifier, without FK constraint (intentionally) to show outer join optimization';
COMMENT ON COLUMN "SH"."SALES"."QUANTITY_SOLD" IS 'product quantity sold with the transaction';
COMMENT ON COLUMN "SH"."SALES"."AMOUNT_SOLD" IS 'invoiced amount to the customer';
COMMENT ON TABLE "SH"."SALES"  IS 'facts table, without a primary key; all rows are uniquely identified by the combination of all foreign keys';
COMMENT ON COLUMN "SH"."COUNTRIES"."COUNTRY_ID" IS 'primary key';
COMMENT ON COLUMN "SH"."COUNTRIES"."COUNTRY_NAME" IS 'country name';
COMMENT ON COLUMN "SH"."COUNTRIES"."COUNTRY_SUBREGION" IS 'e.g. Western Europe, to allow hierarchies';
COMMENT ON COLUMN "SH"."COUNTRIES"."COUNTRY_REGION" IS 'e.g. Europe, Asia';
COMMENT ON TABLE "SH"."COUNTRIES"  IS 'country dimension table (snowflake)';
COMMENT ON COLUMN "SH"."CUSTOMERS"."CUST_ID" IS 'primary key';
COMMENT ON COLUMN "SH"."CUSTOMERS"."CUST_FIRST_NAME" IS 'first name of the customer';
COMMENT ON COLUMN "SH"."CUSTOMERS"."CUST_LAST_NAME" IS 'last name of the customer';
COMMENT ON COLUMN "SH"."CUSTOMERS"."CUST_GENDER" IS 'gender; low cardinality attribute';
COMMENT ON COLUMN "SH"."CUSTOMERS"."CUST_YEAR_OF_BIRTH" IS 'customer year of birth';
COMMENT ON COLUMN "SH"."CUSTOMERS"."CUST_MARITAL_STATUS" IS 'customer marital status; low cardinality attribute';
COMMENT ON COLUMN "SH"."CUSTOMERS"."CUST_STREET_ADDRESS" IS 'customer street address';
COMMENT ON COLUMN "SH"."CUSTOMERS"."CUST_POSTAL_CODE" IS 'postal code of the customer';
COMMENT ON COLUMN "SH"."CUSTOMERS"."CUST_CITY" IS 'city where the customer lives';
COMMENT ON COLUMN "SH"."CUSTOMERS"."CUST_STATE_PROVINCE" IS 'customer geography: state or province';
COMMENT ON COLUMN "SH"."CUSTOMERS"."COUNTRY_ID" IS 'foreign key to the countries table (snowflake)';
COMMENT ON COLUMN "SH"."CUSTOMERS"."CUST_MAIN_PHONE_NUMBER" IS 'customer main phone number';
COMMENT ON COLUMN "SH"."CUSTOMERS"."CUST_INCOME_LEVEL" IS 'customer income level';
COMMENT ON COLUMN "SH"."CUSTOMERS"."CUST_CREDIT_LIMIT" IS 'customer credit limit';
COMMENT ON COLUMN "SH"."CUSTOMERS"."CUST_EMAIL" IS 'customer email id';
COMMENT ON TABLE "SH"."CUSTOMERS"  IS 'dimension table';
COMMENT ON COLUMN "SH"."PROMOTIONS"."PROMO_ID" IS 'primary key column';
COMMENT ON COLUMN "SH"."PROMOTIONS"."PROMO_NAME" IS 'promotion description';
COMMENT ON COLUMN "SH"."PROMOTIONS"."PROMO_SUBCATEGORY" IS 'enables to investigate promotion hierarchies';
COMMENT ON COLUMN "SH"."PROMOTIONS"."PROMO_CATEGORY" IS 'promotion category';
COMMENT ON COLUMN "SH"."PROMOTIONS"."PROMO_COST" IS 'promotion cost, to do promotion effect calculations';
COMMENT ON COLUMN "SH"."PROMOTIONS"."PROMO_BEGIN_DATE" IS 'promotion begin day';
COMMENT ON COLUMN "SH"."PROMOTIONS"."PROMO_END_DATE" IS 'promotion end day';
COMMENT ON TABLE "SH"."PROMOTIONS"  IS 'dimension table without a PK-FK relationship with the facts table, to show outer join functionality';
COMMENT ON COLUMN "SH"."CHANNELS"."CHANNEL_ID" IS 'primary key column';
COMMENT ON COLUMN "SH"."CHANNELS"."CHANNEL_DESC" IS 'e.g. telesales, internet, catalog';
COMMENT ON COLUMN "SH"."CHANNELS"."CHANNEL_CLASS" IS 'e.g. direct, indirect';
COMMENT ON TABLE "SH"."CHANNELS"  IS 'small dimension table';
COMMENT ON COLUMN "SH"."PRODUCTS"."PROD_ID" IS 'primary key';
COMMENT ON COLUMN "SH"."PRODUCTS"."PROD_NAME" IS 'product name';
COMMENT ON COLUMN "SH"."PRODUCTS"."PROD_DESC" IS 'product description';
COMMENT ON COLUMN "SH"."PRODUCTS"."PROD_SUBCATEGORY" IS 'product subcategory';
COMMENT ON COLUMN "SH"."PRODUCTS"."PROD_SUBCATEGORY_DESC" IS 'product subcategory description';
COMMENT ON COLUMN "SH"."PRODUCTS"."PROD_CATEGORY" IS 'product category';
COMMENT ON COLUMN "SH"."PRODUCTS"."PROD_CATEGORY_DESC" IS 'product category description';
COMMENT ON COLUMN "SH"."PRODUCTS"."PROD_WEIGHT_CLASS" IS 'product weight class';
COMMENT ON COLUMN "SH"."PRODUCTS"."PROD_UNIT_OF_MEASURE" IS 'product unit of measure';
COMMENT ON COLUMN "SH"."PRODUCTS"."PROD_PACK_SIZE" IS 'product package size';
COMMENT ON COLUMN "SH"."PRODUCTS"."SUPPLIER_ID" IS 'this column';
COMMENT ON COLUMN "SH"."PRODUCTS"."PROD_STATUS" IS 'product status';
COMMENT ON COLUMN "SH"."PRODUCTS"."PROD_LIST_PRICE" IS 'product list price';
COMMENT ON COLUMN "SH"."PRODUCTS"."PROD_MIN_PRICE" IS 'product minimum price';
COMMENT ON TABLE "SH"."PRODUCTS"  IS 'dimension table';
COMMENT ON COLUMN "SH"."TIMES"."TIME_ID" IS 'primary key; day date, finest granularity, CORRECT ORDER';
COMMENT ON COLUMN "SH"."TIMES"."DAY_NAME" IS 'Monday to Sunday, repeating';
COMMENT ON COLUMN "SH"."TIMES"."DAY_NUMBER_IN_WEEK" IS '1 to 7, repeating';
COMMENT ON COLUMN "SH"."TIMES"."DAY_NUMBER_IN_MONTH" IS '1 to 31, repeating';
COMMENT ON COLUMN "SH"."TIMES"."CALENDAR_WEEK_NUMBER" IS '1 to 53, repeating';
COMMENT ON COLUMN "SH"."TIMES"."FISCAL_WEEK_NUMBER" IS '1 to 53, repeating';
COMMENT ON COLUMN "SH"."TIMES"."WEEK_ENDING_DAY" IS 'date of last day in week, CORRECT ORDER';
COMMENT ON COLUMN "SH"."TIMES"."CALENDAR_MONTH_NUMBER" IS '1 to 12, repeating';
COMMENT ON COLUMN "SH"."TIMES"."FISCAL_MONTH_NUMBER" IS '1 to 12, repeating';
COMMENT ON COLUMN "SH"."TIMES"."CALENDAR_MONTH_DESC" IS 'e.g. 1998-01, CORRECT ORDER';
COMMENT ON COLUMN "SH"."TIMES"."FISCAL_MONTH_DESC" IS 'e.g. 1998-01, CORRECT ORDER';
COMMENT ON COLUMN "SH"."TIMES"."DAYS_IN_CAL_MONTH" IS 'e.g. 28,31, repeating';
COMMENT ON COLUMN "SH"."TIMES"."DAYS_IN_FIS_MONTH" IS 'e.g. 25,32, repeating';
COMMENT ON COLUMN "SH"."TIMES"."END_OF_CAL_MONTH" IS 'last day of calendar month';
COMMENT ON COLUMN "SH"."TIMES"."END_OF_FIS_MONTH" IS 'last day of fiscal month';
COMMENT ON COLUMN "SH"."TIMES"."CALENDAR_MONTH_NAME" IS 'January to December, repeating';
COMMENT ON COLUMN "SH"."TIMES"."FISCAL_MONTH_NAME" IS 'January to December, repeating';
COMMENT ON COLUMN "SH"."TIMES"."CALENDAR_QUARTER_DESC" IS 'e.g. 1998-Q1, CORRECT ORDER';
COMMENT ON COLUMN "SH"."TIMES"."FISCAL_QUARTER_DESC" IS 'e.g. 1999-Q3, CORRECT ORDER';
COMMENT ON COLUMN "SH"."TIMES"."DAYS_IN_CAL_QUARTER" IS 'e.g. 88,90, repeating';
COMMENT ON COLUMN "SH"."TIMES"."DAYS_IN_FIS_QUARTER" IS 'e.g. 88,90, repeating';
COMMENT ON COLUMN "SH"."TIMES"."END_OF_CAL_QUARTER" IS 'last day of calendar quarter';
COMMENT ON COLUMN "SH"."TIMES"."END_OF_FIS_QUARTER" IS 'last day of fiscal quarter';
COMMENT ON COLUMN "SH"."TIMES"."CALENDAR_QUARTER_NUMBER" IS '1 to 4, repeating';
COMMENT ON COLUMN "SH"."TIMES"."FISCAL_QUARTER_NUMBER" IS '1 to 4, repeating';
COMMENT ON COLUMN "SH"."TIMES"."CALENDAR_YEAR" IS 'e.g. 1999, CORRECT ORDER';
COMMENT ON COLUMN "SH"."TIMES"."FISCAL_YEAR" IS 'e.g. 1999, CORRECT ORDER';
COMMENT ON COLUMN "SH"."TIMES"."DAYS_IN_CAL_YEAR" IS '365,366 repeating';
COMMENT ON COLUMN "SH"."TIMES"."DAYS_IN_FIS_YEAR" IS 'e.g. 355,364, repeating';
COMMENT ON COLUMN "SH"."TIMES"."END_OF_CAL_YEAR" IS 'last day of cal year';
COMMENT ON COLUMN "SH"."TIMES"."END_OF_FIS_YEAR" IS 'last day of fiscal year';
COMMENT ON TABLE "SH"."TIMES"  IS 'Time dimension table to support multiple hierarchies and materialized views';