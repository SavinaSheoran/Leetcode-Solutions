# Write your MySQL query statement below
SELECT user_id AS "buyer_id",join_date,
CASE WHEN orders_in_2019 IS NULL THEN 0
ELSE orders_in_2019 END AS "orders_in_2019"
FROM Users u
LEFT JOIN
(SELECT buyer_id,COUNT(order_id) AS "orders_in_2019"
FROM Orders o
WHERE order_date LIKE '2019%'
GROUP BY buyer_id) AS t2
ON user_id=t2.buyer_id;