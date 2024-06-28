-- Duplicate store data from TPCDS to Hive bucket
CREATE TABLE "hive_data"."sales_mst"."store" AS
SELECT
  *
FROM
  "tpcds"."sf1"."store";


-- Duplicate call_center data from TPCDS to Hive bucket
CREATE TABLE "hive_data"."sales_mst"."call_center" AS
SELECT
  *
FROM
  "tpcds"."sf1"."call_center";


-- Duplicate web_site data from TPCDS to Hive bucket
CREATE TABLE "hive_data"."sales_mst"."web_site" AS
SELECT
  *
FROM
  "tpcds"."sf1"."web_site";


-- Duplicate date_dim data from TPCDS to Hive bucket
CREATE TABLE "hive_data"."sales_mst"."date_dim" AS
SELECT
  *
FROM
  "tpcds"."sf1"."date_dim"
