Use retail_events_db;
 
 
SELECT 
    p.product_name,
    p.category,
    ((SELECT (quantity_sold_after_promo - quantity_sold_before_promo) / quantity_sold_after_promo) * 100) AS ISR_percentage
FROM
    fact_events f
        LEFT JOIN
    dim_products p ON f.product_code = p.product_code
GROUP BY p.category
ORDER BY ISR_percentage DESC
LIMIT 5;