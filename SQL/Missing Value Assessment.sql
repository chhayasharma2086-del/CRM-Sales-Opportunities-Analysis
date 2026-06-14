-- Missing Value Assessment

-- Accounts Table
SELECT
SUM(CASE WHEN account IS NULL THEN 1 ELSE 0 END) AS account_nulls,
SUM(CASE WHEN sector IS NULL THEN 1 ELSE 0 END) AS sector_nulls,
SUM(CASE WHEN revenue IS NULL THEN 1 ELSE 0 END) AS revenue_nulls,
SUM(CASE WHEN employees IS NULL THEN 1 ELSE 0 END) AS employee_nulls
FROM accounts;

-- Sales Teams
SELECT
SUM(CASE WHEN sales_agent IS NULL THEN 1 ELSE 0 END) AS agent_nulls,
SUM(CASE WHEN manager IS NULL THEN 1 ELSE 0 END) AS manager_nulls,
SUM(CASE WHEN regional_office IS NULL THEN 1 ELSE 0 END) AS region_nulls
FROM sales_teams;

-- Products
SELECT
SUM(CASE WHEN product IS NULL THEN 1 ELSE 0 END) AS product_nulls,
SUM(CASE WHEN sales_price IS NULL THEN 1 ELSE 0 END) AS price_nulls
FROM products;

-- Sales Pipeline
SELECT
SUM(CASE WHEN opportunity_id IS NULL THEN 1 ELSE 0 END) AS opp_nulls,
SUM(CASE WHEN sales_agent IS NULL THEN 1 ELSE 0 END) AS agent_nulls,
SUM(CASE WHEN product IS NULL THEN 1 ELSE 0 END) AS product_nulls,
SUM(CASE WHEN account IS NULL THEN 1 ELSE 0 END) AS account_nulls,
SUM(CASE WHEN deal_stage IS NULL THEN 1 ELSE 0 END) AS stage_nulls,
SUM(CASE WHEN engage_date IS NULL THEN 1 ELSE 0 END) AS engage_nulls,
SUM(CASE WHEN close_date IS NULL THEN 1 ELSE 0 END) AS close_nulls,
SUM(CASE WHEN close_value IS NULL THEN 1 ELSE 0 END) AS closeval_nulls
FROM sales_pipeline;