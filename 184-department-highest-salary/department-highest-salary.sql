# Write your MySQL query statement below
select d.name as Department, e.name as Employee, e.salary as Salary from Employee as e join Department as d
on e.Departmentid = d.id
where (Departmentid, salary) in (select Departmentid, max(salary) from Employee group by Departmentid);