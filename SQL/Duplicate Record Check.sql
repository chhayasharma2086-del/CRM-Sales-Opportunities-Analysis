-- Duplicate Record Check
-- Accounts
SELECT account,
COUNT(*)
FROM accounts
GROUP BY account
HAVING COUNT(*) > 1;

-- Products
SELECT product,
COUNT(*)
FROM products
GROUP BY product
HAVING COUNT(*) > 1;

-- Sales Team
SELECT sales_agent,
COUNT(*)
FROM sales_teams
GROUP BY sales_agent
HAVING COUNT(*) > 1;

-- Sales Pipeline
SELECT opportunity_id,
COUNT(*)
FROM sales_pipeline
GROUP BY opportunity_id
HAVING COUNT(*) > 1;