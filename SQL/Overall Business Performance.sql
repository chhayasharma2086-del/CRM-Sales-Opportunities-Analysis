-- Overall Business Performance

-- Total Opportunities
/*Measures the total number of sales opportunities tracked by the CRM*/
SELECT COUNT(*) AS total_opportunities
FROM sales_pipeline;

-- Opportunities by Deal Stage
/*Which stage has the most opportunities?
Is the pipeline heavily concentrated in early stages?*/
SELECT
deal_stage,
COUNT(*) AS opportunity_count
FROM sales_pipeline
GROUP BY deal_stage
ORDER BY opportunity_count DESC;

-- Won vs Lost Deals
SELECT
deal_stage,
COUNT(*) AS total_deals
FROM sales_pipeline
WHERE deal_stage IN ('Won','Lost')
GROUP BY deal_stage;

-- Total Revenue
/*Executive Dashboard Revenue KPI*/
SELECT
SUM(close_value) AS total_revenue
FROM sales_pipeline
WHERE deal_stage = 'Won';

-- Average Deal Size
/*Shows the typical value of a successful sale*/
SELECT
AVG(close_value) AS avg_deal_size
FROM sales_pipeline
WHERE deal_stage = 'Won';

-- Overall Win Rate
/*Win Rate = Won Deals ÷ (Won + Lost Deals)*/
SELECT
ROUND(
100.0 *
SUM(CASE WHEN deal_stage='Won' THEN 1 ELSE 0 END)
/
SUM(CASE WHEN deal_stage IN ('Won','Lost') THEN 1 ELSE 0 END),
2
) AS win_rate 
from sales_pipeline;