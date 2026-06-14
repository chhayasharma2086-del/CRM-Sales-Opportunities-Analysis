-- Sales Team Analysis

-- Revenue by Sales Agent
/*Who generates the most revenue?*/
SELECT
sales_agent,
SUM(close_value) AS revenue
FROM sales_pipeline
WHERE deal_stage='Won'
GROUP BY sales_agent
ORDER BY revenue DESC;

-- Opportunities by Sales Agent
SELECT
sales_agent,
COUNT(*) AS opportunities
FROM sales_pipeline
GROUP BY sales_agent
ORDER BY opportunities DESC;

-- Win Rate by Sales Agent
/*Who closes deals most effectively?*/
SELECT
sales_agent,
ROUND(
100.0 *
SUM(CASE WHEN deal_stage='Won' THEN 1 ELSE 0 END)
/
SUM(CASE WHEN deal_stage IN ('Won','Lost') THEN 1 ELSE 0 END),
2
) AS win_rate
FROM sales_pipeline
GROUP BY sales_agent
ORDER BY win_rate DESC;

-- Average Deal Size by Agent
/*Who closes the largest deals?*/
SELECT
sales_agent,
AVG(close_value) AS avg_deal_size
FROM sales_pipeline
WHERE deal_stage='Won'
GROUP BY sales_agent
ORDER BY avg_deal_size DESC;





