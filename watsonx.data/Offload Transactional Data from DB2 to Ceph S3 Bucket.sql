-- Hands-on: Optimizing and Scaling On-Premise Data Engineering for BI Dashboards/Reports
-- Task 1: Offload Transactional Data from DB2 to Ceph S3 Bucket

-- Sales Channel 1: Store Sales
CREATE TABLE "ceph_retail"."sales"."store_sales_YOUR_NAME" AS
SELECT
  *
FROM
  "db2_retail"."sales"."store_sales";

-- Sales Channel 2: Catalog Sales
CREATE TABLE "ceph_retail"."sales"."catalog_sales_YOUR_NAME" AS
SELECT
  *
FROM
  "db2_retail"."sales"."catalog_sales";

-- Sales Channel 3: Web Sales
CREATE TABLE "ceph_retail"."sales"."web_sales_YOUR_NAME" AS
SELECT
  *
FROM
  "db2_retail"."sales"."web_sales";
