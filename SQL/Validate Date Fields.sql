-- Validate Date Fields

-- Close Date Before Engage Date
SELECT *
FROM sales_pipeline
WHERE close_date < engage_date;

-- Missing Engagement Dates
SELECT *
FROM sales_pipeline
WHERE engage_date IS NULL;