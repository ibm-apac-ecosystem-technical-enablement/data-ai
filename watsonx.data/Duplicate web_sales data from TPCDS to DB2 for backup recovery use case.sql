-- Duplicate web_sales data from TPCDS to DB2 for backup recovery use case
CREATE TABLE "db2_retail"."backup_recovery"."web_sales" AS
SELECT
  *
FROM
  "tpcds"."sf1"."web_sales";
