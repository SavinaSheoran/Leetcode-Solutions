# Write your MySQL query statement below
WITH Prd1 AS (
    SELECT user_id, pp1.product_id, pi1.category 
    FROM ProductPurchases AS pp1 JOIN ProductInfo AS pi1 ON (pp1.product_id = pi1.product_id)
)
SELECT p1.category AS category1, p2.category AS category2, COUNT(DISTINCT(p1.user_id)) AS customer_count
FROM Prd1 AS p1 JOIN Prd1 AS p2 
ON (p1.user_id = p2.user_id AND p1.category < p2.category )
GROUP BY p1.category, p2.category
HAVING COUNT(DISTINCT(p1.user_id)) > 2
ORDER BY customer_count DESC, category1 ASC, category2 ASC