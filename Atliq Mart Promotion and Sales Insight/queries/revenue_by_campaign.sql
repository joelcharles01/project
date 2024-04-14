Use retail_events_db;
 
SELECT 
    c.campaign_name,
    (SELECT SUM(base_price * quantity_sold_before_promo) / 1000000) AS revenue_before_promo,
    (SELECT SUM(base_price * quantity_sold_after_promo) / 1000000) AS revenue_after_promo
FROM
    fact_events f
        LEFT JOIN
    dim_campaigns c ON f.campaign_id = c.campaign_id
GROUP BY campaign_name;