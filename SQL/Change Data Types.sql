-- Change datatype

-- Accounts Table
ALTER TABLE accounts
MODIFY COLUMN account VARCHAR(255),
MODIFY COLUMN sector VARCHAR(100),
MODIFY COLUMN year_established INT,
MODIFY COLUMN revenue DECIMAL(12,2),
MODIFY COLUMN employees INT,
MODIFY COLUMN office_location VARCHAR(255),
MODIFY COLUMN subsidiary_of VARCHAR(255);

-- Sales Team Table
ALTER TABLE sales_teams
MODIFY COLUMN sales_agent VARCHAR(255),
MODIFY COLUMN manager VARCHAR(255),
MODIFY COLUMN regional_office VARCHAR(255);

-- Products Table
ALTER TABLE products
MODIFY COLUMN product VARCHAR(255),
MODIFY COLUMN series VARCHAR(255),
MODIFY COLUMN sales_price DECIMAL(12,2);

-- Sales Pipeline Table
ALTER TABLE sales_pipeline
ADD COLUMN engage_date_new DATE,
ADD COLUMN close_date_new DATE;

SET SQL_SAFE_UPDATES = 0;

UPDATE sales_pipeline
SET
    engage_date_new = STR_TO_DATE(NULLIF(engage_date, ''), '%m/%d/%Y'),
    close_date_new = STR_TO_DATE(NULLIF(close_date, ''), '%m/%d/%Y');
    
  SELECT engage_date, engage_date_new,
       close_date, close_date_new
FROM sales_pipeline
LIMIT 20;

ALTER TABLE sales_pipeline
DROP COLUMN engage_date,
DROP COLUMN close_date;

ALTER TABLE sales_pipeline
CHANGE engage_date_new engage_date DATE,
CHANGE close_date_new close_date DATE;

ALTER TABLE sales_pipeline
MODIFY COLUMN opportunity_id VARCHAR(255),
MODIFY COLUMN sales_agent VARCHAR(255),
MODIFY COLUMN product VARCHAR(255),
MODIFY COLUMN account VARCHAR(255),
MODIFY COLUMN deal_stage VARCHAR(100),
MODIFY COLUMN close_value DECIMAL(12,2);