-- Product Analysis

-- Revenue by Product
SELECT
product,
SUM(close_value) AS revenue
FROM sales_pipeline
WHERE deal_stage='Won'
GROUP BY product
ORDER BY revenue DESC;

-- Revenue by Product Series
SELECT
p.series,
SUM(sp.close_value) AS revenue
FROM sales_pipeline sp
JOIN products p
ON sp.product = p.product
WHERE sp.deal_stage='Won'
GROUP BY p.series
ORDER BY revenue DESC;

-- Average Deal Size by Product
SELECT
product,
AVG(close_value) AS avg_deal_size
FROM sales_pipeline
WHERE deal_stage='Won'
GROUP BY product
ORDER BY avg_deal_size DESC;