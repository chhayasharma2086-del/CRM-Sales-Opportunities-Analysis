-- Create SQL View
CREATE VIEW crm_sales_analysis AS
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
    sp.close_value,

    DATEDIFF(sp.close_date, sp.engage_date) AS sales_cycle_days,

    CASE
        WHEN sp.deal_stage = 'Won' THEN 'Won'
        WHEN sp.deal_stage = 'Lost' THEN 'Lost'
        ELSE 'Open'
    END AS deal_status

FROM sales_pipeline sp
LEFT JOIN accounts a
    ON sp.account = a.account
LEFT JOIN sales_teams st
    ON sp.sales_agent = st.sales_agent
LEFT JOIN products p
    ON sp.product = p.product;
    
    SELECT *
FROM crm_sales_analysis;