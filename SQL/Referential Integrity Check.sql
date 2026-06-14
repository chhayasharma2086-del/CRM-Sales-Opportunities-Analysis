-- Referential Integrity Check(Verify all foreign keys exist)
/* Why Important?
Prevents incorrect joins and missing records in reports.*/

-- Missing Accounts
SELECT DISTINCT sp.account
FROM sales_pipeline sp
LEFT JOIN accounts a
ON sp.account = a.account
WHERE a.account IS NULL;

-- Missing Products
SELECT DISTINCT sp.product
FROM sales_pipeline sp
LEFT JOIN products p
ON sp.product = p.product
WHERE p.product IS NULL;

-- Missing Sales Team
SELECT DISTINCT sp.sales_agent
FROM sales_pipeline sp
LEFT JOIN sales_teams st
ON sp.sales_agent = st.sales_agent
WHERE st.sales_agent IS NULL;

