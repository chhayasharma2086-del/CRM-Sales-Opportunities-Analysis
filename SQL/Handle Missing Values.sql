-- Handle Missing Values

-- Missing Close Values
SELECT *
FROM sales_pipeline
where deal_stage = 'Lost'
and
close_value IS NULL;

UPDATE sales_pipeline
SET close_value = 0
WHERE deal_stage = 'Lost'
AND close_value IS NULL;

SELECT deal_stage,
       COUNT(*) AS total_records,
       COUNT(close_value) AS records_with_close_value
FROM sales_pipeline
GROUP BY deal_stage;

SELECT deal_stage,
       COUNT(*) AS missing_close_value
FROM sales_pipeline
WHERE close_value IS NULL
GROUP BY deal_stage;