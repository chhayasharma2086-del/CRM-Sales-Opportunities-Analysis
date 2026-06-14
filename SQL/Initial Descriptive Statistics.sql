-- Initial Descriptive Statistics

-- Revenue Distribution
WITH ordered AS (
    SELECT
        close_value,
        ROW_NUMBER() OVER (ORDER BY close_value) AS rn,
        COUNT(*) OVER () AS cnt
    FROM sales_pipeline
    WHERE deal_stage = 'Won'
      AND close_value IS NOT NULL
)
SELECT
    (SELECT MIN(close_value)
     FROM sales_pipeline
     WHERE deal_stage = 'Won') AS MinValue,

    (SELECT MAX(close_value)
     FROM sales_pipeline
     WHERE deal_stage = 'Won') AS MaValue,

    (SELECT AVG(close_value)
     FROM sales_pipeline
     WHERE deal_stage = 'Won') AS AvgValue,

    (SELECT AVG(close_value)
     FROM ordered
     WHERE rn IN (FLOOR((cnt + 1) / 2),
                  FLOOR((cnt + 2) / 2))) AS MedianValue;
                  
 -- Employee Distribution              
SELECT
MIN(employees),
MAX(employees),
AVG(employees)
FROM accounts;                 

-- Company Revenue Distribution 
SELECT
MIN(revenue),
MAX(revenue),
AVG(revenue)
FROM accounts;