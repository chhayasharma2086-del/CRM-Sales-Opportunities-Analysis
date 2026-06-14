-- Time-Series Analysis

-- Monthly Revenue Trend
SELECT
YEAR(close_date) AS year,
MONTH(close_date) AS month,
SUM(close_value) AS revenue
FROM sales_pipeline
WHERE deal_stage='Won'
GROUP BY YEAR(close_date), MONTH(close_date)
ORDER BY year, month;

-- Monthly Won Deals
SELECT
YEAR(close_date),
MONTH(close_date),
COUNT(*) AS won_deals
FROM sales_pipeline
WHERE deal_stage='Won'
GROUP BY YEAR(close_date), MONTH(close_date);