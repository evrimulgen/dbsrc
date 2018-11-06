-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE EDITIONABLE VIEW "SH"."PROFITS" ("CHANNEL_ID",
"CUST_ID",
"PROD_ID",
"PROMO_ID",
"TIME_ID",
"UNIT_COST",
"UNIT_PRICE",
"AMOUNT_SOLD",
"QUANTITY_SOLD",
"TOTAL_COST") AS
  SELECT
        s.channel_id,
        s.cust_id,
        s.prod_id,
        s.promo_id,
        s.time_id,
        c.unit_cost,
        c.unit_price,
        s.amount_sold,
        s.quantity_sold,
        c.unit_cost * s.quantity_sold TOTAL_COST
 FROM   costs c, sales s
 WHERE c.prod_id = s.prod_id
   AND c.time_id = s.time_id
   AND c.channel_id = s.channel_id
   AND c.promo_id = s.promo_id;

