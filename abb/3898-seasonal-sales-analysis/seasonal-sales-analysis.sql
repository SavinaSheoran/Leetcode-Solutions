# Write your MySQL query statement below
WITH CTE AS (
SELECT 
s.product_id,
p.category,
quantity,
quantity * price as revenue,
CASE WHEN MONTH(SALE_DATE) IN (12,1,2) THEN 'Winter'  
WHEN MONTH(SALE_DATE) IN (3,4,5) THEN 'Spring'
WHEN MONTH(SALE_DATE) IN (6,7,8) THEN 'Summer'
ELSE 'Fall'
END AS season
FROM sales s
INNER JOIN products p
ON p.product_id = s.product_id
)

SELECT season, category, total_quantity, total_revenue
FROM
(SELECT *, RANK() OVER(PARTITION BY season ORDER BY total_quantity desc, total_revenue desc) AS RNK
FROM
(SELECT season, category, SUM(quantity) as total_quantity, SUM(revenue) as total_revenue
FROM CTE
GROUP BY 1,2
ORDER BY 1
) AS a
) AS b
WHERE RNK = 1