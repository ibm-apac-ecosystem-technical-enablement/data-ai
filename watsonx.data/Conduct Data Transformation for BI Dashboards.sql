-- Hands-on: Optimizing and Scaling On-Premise Data Engineering for BI Dashboards/Reports
-- Task 2: Conduct Data Transformation for BI Dashboards

-- Sales Channel 1: Store Sales
CREATE TABLE "db2_retail"."bi_dashboard_sales"."sales_ss3" AS
SELECT
  d_year,
  d_qoy,
  d_moy,
  d_dom,
  s_store_name,
  CAST(SUM(ss_sales_price) AS DECIMAL(7, 2)) AS ss_sales_price_total -- Sum the sales price and cast the result to DECIMAL(7, 2) for accurate representation
FROM
  "ceph_retail"."sales"."store_sales" AS store_sales_tbl
  INNER JOIN "hive_data"."sales_mst"."store" AS store_tbl ON store_sales_tbl.ss_store_sk = store_tbl.s_store_sk
  INNER JOIN "hive_data"."datetime_mst"."date_dim" AS date_tbl ON store_sales_tbl.ss_sold_date_sk = date_tbl.d_date_sk
GROUP BY
  d_year,
  d_qoy,
  d_moy,
  d_dom,
  s_store_name
ORDER BY
  d_year,
  d_qoy,
  d_moy,
  d_dom,
  s_store_name;
  
  
-- Sales Channel 2: Catalog Sales
CREATE TABLE "db2_retail"."bi_dashboard_sales"."sales_cs3" AS
SELECT
  d_year,
  d_qoy,
  d_moy,
  d_dom,
  cc_name,
  CAST(SUM(cs_sales_price) AS DECIMAL(7, 2)) AS cs_sales_price_total -- Sum the sales price and cast the result to DECIMAL(7, 2) for accurate representation
FROM
  "ceph_retail"."sales"."catalog_sales" AS catalog_sales_tbl
  INNER JOIN "hive_data"."sales_mst"."call_center" AS cc_tbl ON catalog_sales_tbl.cs_call_center_sk = cc_tbl.cc_call_center_sk
  INNER JOIN "hive_data"."datetime_mst"."date_dim" AS date_tbl ON catalog_sales_tbl.cs_sold_date_sk = date_tbl.d_date_sk
GROUP BY
  d_year,
  d_qoy,
  d_moy,
  d_dom,
  cc_name
ORDER BY
  d_year,
  d_qoy,
  d_moy,
  d_dom,
  cc_name;

  
-- Sales Channel 3: Web Sales
CREATE TABLE "db2_retail"."bi_dashboard_sales"."sales_ws3" AS
SELECT
  d_year,
  d_qoy,
  d_moy,
  d_dom,
  web_name,
  CAST(SUM(ws_sales_price) AS DECIMAL(7, 2)) AS ws_sales_price_total -- Sum the sales price and cast the result to DECIMAL(7, 2) for accurate representation
FROM
  "ceph_retail"."sales"."web_sales" AS web_sales_tbl
  INNER JOIN "hive_data"."sales_mst"."web_site" AS ws_tbl ON web_sales_tbl.ws_web_site_sk = ws_tbl.web_site_sk
  INNER JOIN "hive_data"."datetime_mst"."date_dim" AS date_tbl ON web_sales_tbl.ws_sold_date_sk = date_tbl.d_date_sk
GROUP BY
  d_year,
  d_qoy,
  d_moy,
  d_dom,
  web_name
ORDER BY
  d_year,
  d_qoy,
  d_moy,
  d_dom,
  web_name;
