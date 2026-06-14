-- Handle Referential Integrity Issues

-- Missing Account
SELECT DISTINCT sp.account
FROM sales_pipeline sp
LEFT JOIN accounts a
ON sp.account = a.account
WHERE a.account IS NULL;

-- Missing Products
UPDATE sales_pipeline
SET product = 'GTX Pro'
WHERE product = 'GTXPro';

SELECT DISTINCT sp.product
FROM sales_pipeline sp
LEFT JOIN products p
ON sp.product = p.product
WHERE p.product IS NULL;

-- Missing Sales Agents
SELECT DISTINCT sp.sales_agent
FROM sales_pipeline sp
LEFT JOIN sales_teams st
ON sp.sales_agent = st.sales_agent
WHERE st.sales_agent IS NULL;