-- Validate Numerical Fields

-- Negative Revenue
SELECT *
FROM sales_pipeline
WHERE close_value < 0;

-- Negative Product Prices
SELECT *
FROM products
WHERE sales_price < 0;

-- Unrealistic Employee Counts
SELECT *
FROM accounts
WHERE employees < 0;