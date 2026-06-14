-- Sales Cycle Analysis

-- Average Sales Cycle
/*How long does it take to close a deal?*/
SELECT
AVG(DATEDIFF(close_date, engage_date)) AS avg_sales_cycle_days
FROM sales_pipeline
WHERE deal_stage='Won';

-- Sales Cycle by Product
SELECT
product,
AVG(DATEDIFF(close_date, engage_date)) AS avg_days
FROM sales_pipeline
WHERE deal_stage='Won'
GROUP BY product
ORDER BY avg_days DESC;

-- Sales Cycle by Sector
SELECT
a.sector,
AVG(DATEDIFF(sp.close_date, sp.engage_date)) AS avg_days
FROM sales_pipeline sp
JOIN accounts a
ON sp.account = a.account
WHERE sp.deal_stage='Won'
GROUP BY a.sector;