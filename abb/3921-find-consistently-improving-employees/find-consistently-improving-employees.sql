# Write your MySQL query statement below
With t1 as (Select employee_id,review_id, rating, row_number() over(partition by employee_id order by review_id desc) as rn
from performance_reviews
where employee_id in (
    Select employee_id from performance_reviews
    group by employee_id
    having count(review_id)>=3 ))

Select employee_id, e.name, rating -last_last_rating  improvement_score
from(
Select * , 
lead(rating) over(partition by employee_id order by rn asc) as last_rating ,
lead(rating,2) over(partition by employee_id order by rn asc) as last_last_rating 
from t1
where rn<=3) a
join employees e
using(employee_id)

where a.rating > a.last_rating
and a.last_rating>a.last_last_rating

order by improvement_score desc, name asc