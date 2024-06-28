-- Hands-on: Optimizing and Scaling On-Premise Data Engineering for BI Dashboards
-- Task 2: Concat all Sales Channel tables and create as a new table into DB2

CREATE TABLE "db2_retail"."bi_dashboard_sales"."sales_channel" AS
SELECT
  d_year,
  d_qoy,
  d_moy,
  d_dom,
  'ss' AS channel,
  s_store_name AS channel_name,
  ss_sales_price_total AS sales_price_total
FROM
  "db2_retail"."bi_dashboard_sales"."sales_ss"
UNION ALL
SELECT
  d_year,
  d_qoy,
  d_moy,
  d_dom,
  'cs' AS channel,
  cc_name AS channel_name,
  cs_sales_price_total AS sales_price_total
FROM
  "db2_retail"."bi_dashboard_sales"."sales_cs"
UNION ALL
SELECT
  d_year,
  d_qoy,
  d_moy,
  d_dom,
  'ws' AS channel,
  web_name AS channel_name,
  ws_sales_price_total AS sales_price_total
FROM
  "db2_retail"."bi_dashboard_sales"."sales_ws4"
