-- Manager & Regional Analysis

-- Revenue by Manager
SELECT
st.manager,
SUM(sp.close_value) AS revenue
FROM sales_pipeline sp
JOIN sales_teams st
ON sp.sales_agent = st.sales_agent
WHERE sp.deal_stage='Won'
GROUP BY st.manager
ORDER BY revenue DESC;

-- Revenue by Regional Office
SELECT
st.regional_office,
SUM(sp.close_value) AS revenue
FROM sales_pipeline sp
JOIN sales_teams st
ON sp.sales_agent = st.sales_agent
WHERE sp.deal_stage='Won'
GROUP BY st.regional_office
ORDER BY revenue DESC;

-- Win Rate by Region
SELECT
st.regional_office,
ROUND(
100.0 *
SUM(CASE WHEN sp.deal_stage='Won' THEN 1 ELSE 0 END)
/
SUM(CASE WHEN sp.deal_stage IN ('Won','Lost') THEN 1 ELSE 0 END),
2
) AS win_rate
FROM sales_pipeline sp
JOIN sales_teams st
ON sp.sales_agent = st.sales_agent
GROUP BY st.regional_office
ORDER BY win_rate DESC;