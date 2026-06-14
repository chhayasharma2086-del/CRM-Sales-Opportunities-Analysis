-- Pipeline Funnel Analysis

-- Opportunity Count by Stage
SELECT
deal_stage,
COUNT(*) AS opportunities
FROM sales_pipeline
GROUP BY deal_stage;

-- Pipeline Conversion Analysis
/*Where are opportunities being lost?*/
SELECT
deal_stage,
COUNT(*) AS opportunities,
ROUND(
100.0 * COUNT(*)
/
(SELECT COUNT(*) FROM sales_pipeline),
2
) AS stage_percentage
FROM sales_pipeline
GROUP BY deal_stage;

-- Drop off
/*Where do deals drop off?*/
SELECT
  deal_stage,
  COUNT(*) AS stage_count,
  LAG(COUNT(*)) OVER (ORDER BY deal_stage) AS previous_stage_count,
  ROUND(
    100.0 * COUNT(*) /
    LAG(COUNT(*)) OVER (ORDER BY deal_stage),
    2
  ) AS conversion_rate
FROM sales_pipeline
GROUP BY deal_stage;