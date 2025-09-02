# Write your MySQL query statement below
select name from Employee where id in(select managerid from Employee group by managerid having count(distinct id)>=5);
