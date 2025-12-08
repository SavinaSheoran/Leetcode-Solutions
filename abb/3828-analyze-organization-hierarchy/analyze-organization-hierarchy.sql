# Write your MySQL query statement below

WITH RECURSIVE cte1 AS
(
    SELECT
        employee_id,
        employee_name, 
        1 as level,
        salary,
        CAST('' AS CHAR(200)) AS parents
    from Employees
    where manager_id is null

    UNION ALL
    
    SELECT
        e.employee_id,
        e.employee_name, 
        c.level + 1,
        e.salary,
        CAST(CONCAT(c.parents, ', ', c.employee_name) AS CHAR(200))
    FROM cte1 c join Employees e
    on e.manager_id = c.employee_id
),

cte2 as (

    SELECT 
        e.employee_id, e.employee_name,
        count(c.employee_name) as team_size,
        (ifnull(sum(c.salary), 0)  + e.salary) as budget
    FROM cte1 c right join Employees e
    ON c.parents LIKE CONCAT('%, ', e.employee_name, '%')
    group by e.employee_id, e.employee_name
)

select 
    c2.employee_id, c2.employee_name, c1.level, c2.team_size, c2.budget
from cte1 c1 join cte2 c2 
on c1.employee_id = c2.employee_id
order by c1.level, c2.budget desc, employee_name