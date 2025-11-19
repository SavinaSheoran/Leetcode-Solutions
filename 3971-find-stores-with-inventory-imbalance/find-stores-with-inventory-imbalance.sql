WITH ranked_inventory AS (
    SELECT 
        store_id,
        product_name,
        quantity,
        price,
        RANK() OVER (PARTITION BY store_id ORDER BY price DESC) AS price_rank_desc,
        RANK() OVER (PARTITION BY store_id ORDER BY price ASC)  AS price_rank_asc
    FROM inventory
),
store_extremes AS (
    SELECT 
        store_id,
        MAX(CASE WHEN price_rank_desc = 1 THEN product_name END) AS most_exp_product,
        MAX(CASE WHEN price_rank_desc = 1 THEN quantity END) AS max_product_quantity,
        MAX(CASE WHEN price_rank_asc = 1 THEN product_name END) AS cheapest_product,
        MAX(CASE WHEN price_rank_asc = 1 THEN quantity END) AS min_product_quantity
    FROM ranked_inventory
    GROUP BY store_id
    HAVING COUNT(DISTINCT product_name) >= 3
),
imbalance AS (
    SELECT 
        store_id,
        most_exp_product,
        cheapest_product,
        ROUND(min_product_quantity / max_product_quantity, 2) AS imbalance_ratio
    FROM store_extremes
    WHERE min_product_quantity > max_product_quantity
)
SELECT 
    s.store_id,
    s.store_name,
    s.location,
    i.most_exp_product,
    i.cheapest_product,
    i.imbalance_ratio
FROM stores s
JOIN imbalance i USING (store_id)
ORDER BY i.imbalance_ratio DESC, s.store_name ASC;