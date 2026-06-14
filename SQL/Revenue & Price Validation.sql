-- Revenue & Price Validation


-- Negative Deal Values
SELECT *
FROM sales_pipeline
WHERE close_value < 0;

-- Zero Deal Values
SELECT *
FROM sales_pipeline
WHERE close_value = 0;

-- Product Price Validation
SELECT *
FROM products
WHERE sales_price <= 0;