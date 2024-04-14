Use retail_events_db;
 
Use retail_events_db;
 
SELECT 
    p.category,
    ((SELECT (quantity_sold_after_promo - quantity_sold_before_promo) / quantity_sold_after_promo) * 100) AS ISU_percentage
FROM
    fact_events f
        LEFT JOIN
    dim_products p ON f.product_code = p.product_code
WHERE
    f.campaign_id = 'CAMP_DIW_01'
GROUP BY p.category
ORDER BY ISU_percentage DESC;