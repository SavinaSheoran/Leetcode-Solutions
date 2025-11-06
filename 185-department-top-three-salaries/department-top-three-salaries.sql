# Write your MySQL query statement below
-- select Department, Employee, Salary from(select d.name as Department, e.name as Employee, e.salary, dense_rank() over (partition by e.departmentid order by e.salary desc) as rnk from Employee as e left join Department as d on 
-- e.Departmentid = d.id) temp where temp.rnk <= 3;

 select Department, Employee, Salary from(select d.name as Department, e.name as Employee, e.salary, dense_rank() over (partition by e.departmentid order by e.salary desc) as rnk from Employee as e left join Department as d on e.Departmentid = d.id) temp where temp.rnk <= 3;
