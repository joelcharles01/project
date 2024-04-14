Use retail_events_db;
 
SELECT DISTINCTROW
    (p.product_code), p.product_name, f.base_price
FROM
    dim_products p
        LEFT JOIN
    fact_events f ON p.product_code = f.product_code
WHERE
    base_price > 500
        AND promo_type = 'BOGOF'
ORDER BY base_price DESC;