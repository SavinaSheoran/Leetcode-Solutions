# Write your MySQL query statement below
select 
p1.product_id as product1_id,
p2.product_id as product2_id,
pinfo1.category as product1_category,
pinfo2.category as product2_category,
count(*) as customer_count 
from productpurchases p1 join productpurchases p2
on p1.user_id = p2.user_id and p1.product_id < p2.product_id
join productinfo pinfo1
on p1.product_id = pinfo1.product_id
join productinfo pinfo2
on p2.product_id = pinfo2.product_id 
group by p1.product_id, p2.product_id
having count(*) > 2
order by count(*) desc, p1.product_id, p2.product_id;