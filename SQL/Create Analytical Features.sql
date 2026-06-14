-- Create Analytical Features

-- Sales Cycle Days
/*Measures how long deals take to close.*/
SELECT
    DATEDIFF(close_date, engage_date) AS sales_cycle_days
FROM sales_pipeline;

-- Deal Status
/*Create simplified categories.*/
SELECT
    deal_stage,
    CASE
        WHEN deal_stage = 'Won' THEN 'Won'
        WHEN deal_stage = 'Lost' THEN 'Lost'
        ELSE 'Open'
    END AS deal_status
FROM sales_pipeline;

-- Company Age
/*Calculate company age.*/
SELECT
    YEAR(CURRENT_DATE) - year_established AS company_age
FROM accounts;

-- Revenue Per Employee
select
revenue / employees
AS revenue_per_employee
from accounts;

-- Deal Size Category
select
CASE
WHEN close_value < 5000 THEN 'Small'
WHEN close_value < 20000 THEN 'Medium'
ELSE 'Large'
END
AS deal_size_category
from sales_pipeline;