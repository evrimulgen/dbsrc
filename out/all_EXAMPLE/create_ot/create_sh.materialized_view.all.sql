CREATE MATERIALIZED VIEW "SH"."CAL_MONTH_SALES_MV" ("CALENDAR_MONTH_DESC", "DOLLARS")
  ON PREBUILT TABLE WITHOUT REDUCED PRECISION
  USING INDEX
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS ENABLE QUERY REWRITE
  AS SELECT   t.calendar_month_desc
  ,        sum(s.amount_sold) AS dollars
  FROM     sales s
  ,        times t
  WHERE    s.time_id = t.time_id
  GROUP BY t.calendar_month_desc;

CREATE MATERIALIZED VIEW "SH"."FWEEK_PSCAT_SALES_MV" ("WEEK_ENDING_DAY", "PROD_SUBCATEGORY", "DOLLARS", "CHANNEL_ID", "PROMO_ID")
  ON PREBUILT TABLE WITHOUT REDUCED PRECISION
  USING INDEX
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS ENABLE QUERY REWRITE
  AS SELECT   t.week_ending_day
  ,        p.prod_subcategory
  ,        sum(s.amount_sold) AS dollars
  ,        s.channel_id
  ,        s.promo_id
  FROM     sales s
  ,        times t
  ,        products p
  WHERE    s.time_id = t.time_id
  AND      s.prod_id = p.prod_id
  GROUP BY t.week_ending_day
  ,        p.prod_subcategory
  ,        s.channel_id
  ,        s.promo_id;

