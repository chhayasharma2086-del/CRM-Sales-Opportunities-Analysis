-- Customer Analysis

-- Revenue by Sector
/*Which industries generate the most revenue?*/
SELECT
a.sector,
SUM(sp.close_value) AS revenue
FROM sales_pipeline sp
JOIN accounts a
ON sp.account = a.account
WHERE sp.deal_stage='Won'
GROUP BY a.sector
ORDER BY revenue DESC;

-- Opportunities by Sector
SELECT
a.sector,
COUNT(*) AS opportunities
FROM sales_pipeline sp
JOIN accounts a
ON sp.account = a.account
GROUP BY a.sector
ORDER BY opportunities DESC;

-- Top Customer Accounts
SELECT
account,
SUM(close_value) AS revenue
FROM sales_pipeline
WHERE deal_stage='Won'
GROUP BY account
ORDER BY revenue DESC
LIMIT 10;

-- Average Deal Size by Sector
SELECT
a.sector,
AVG(sp.close_value) AS avg_deal_size
FROM sales_pipeline sp
JOIN accounts a
ON sp.account = a.account
WHERE sp.deal_stage='Won'
GROUP BY a.sector
ORDER BY avg_deal_size DESC;
