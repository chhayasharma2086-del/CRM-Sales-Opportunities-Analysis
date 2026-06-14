-- Category Standardization Check

-- Sector Values
SELECT DISTINCT sector
FROM accounts
ORDER BY sector;

-- Regional Office Values
SELECT DISTINCT regional_office
FROM sales_teams;

-- Deal Stages
SELECT DISTINCT deal_stage
FROM sales_pipeline;