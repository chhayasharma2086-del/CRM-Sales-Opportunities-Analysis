-- Date Validation
-- Verify dates are logical

-- Opportunities Closed Before Engagement
SELECT *
FROM sales_pipeline
WHERE close_date < engage_date;

-- Sales Cycle Duration
SELECT
    MIN(DATEDIFF(close_date, engage_date)) AS MinDays,
    MAX(DATEDIFF(close_date, engage_date)) AS MaxDays,
    AVG(DATEDIFF(close_date, engage_date)) AS AvgDays
FROM sales_pipeline
WHERE close_date IS NOT NULL
  AND engage_date IS NOT NULL;