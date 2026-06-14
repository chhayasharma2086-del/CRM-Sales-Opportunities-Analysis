-- Create Clean Analysis Dataset

/*Join all tables into one analytical view*/
SELECT
    sp.opportunity_id,
    sp.sales_agent,
    st.manager,
    st.regional_office,

    sp.product,
    p.series,
    p.sales_price,

    sp.account,
    a.sector,
    a.revenue,
    a.employees,
    a.office_location,

    sp.deal_stage,
    sp.engage_date,
    sp.close_date,
    sp.close_value
FROM sales_pipeline sp
LEFT JOIN accounts a
    ON sp.account = a.account
LEFT JOIN sales_teams st
    ON sp.sales_agent = st.sales_agent
LEFT JOIN products p
    ON sp.product = p.product;