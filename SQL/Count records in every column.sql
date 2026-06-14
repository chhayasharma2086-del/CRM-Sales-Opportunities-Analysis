-- Count records in every column

-- -- Accounts Table
SELECT
  COUNT(account) AS account_count,
  COUNT(sector) AS sector_count,
  COUNT(year_established) AS year_established_count,
  COUNT(revenue) AS revenue_count,
  COUNT(employees) AS employees_count,
  COUNT(office_location) AS office_location_count,
  COUNT(subsidiary_of) AS subsidiary_of_count
FROM accounts;

-- Products
SELECT
  COUNT(product) AS product_count,
  COUNT(series) AS series_count,
  COUNT(sales_price) AS sales_price_count
FROM products;

-- Sales Teams
SELECT
  COUNT(sales_agent) AS sales_agent_count,
  COUNT(manager) AS manager_count,
  COUNT(regional_office) AS regional_office_count
FROM sales_teams;

-- Sales Pipeline
SELECT
  COUNT(opportunity_id) AS opportunity_id_count,
  COUNT(sales_agent) AS sales_agent_count,
  COUNT(product) AS product_count,
  COUNT(account) AS account_count,
  COUNT(deal_stage) AS deal_stage_count,
  COUNT(engage_date) AS engage_date_count,
  COUNT(close_date) AS close_date_count,
  COUNT(close_value) AS close_value_count
FROM sales_pipeline;


