# Write your MySQL query statement below
select id, visit_date, people from(select id, visit_date, people, (case when people>=100 and lead(people,1) over(order by
id)>=100 and lead(people,2) over(order by id)>=100 then 1 when people>=100 and lag(people,1) over(order by id)>=100 and
lead(people,1) over(order by id)>=100 then 1
when people>=100 and lag(people,1) over(order by id)>=100 and lag(people,2) over(order by id)>=100 then 1
else 0 end)flag
from stadium) x
where x.flag=1 order by visit_date;