# Write your MySQL query statement below
select d1.name as Department, e.name as Employee, e.salary as Salary from Employee as e  join Department as d1 on  
e.Departmentid = d1.id
where(Departmentid, Salary) in (select Departmentid, max(salary) from employee group by Departmentid);