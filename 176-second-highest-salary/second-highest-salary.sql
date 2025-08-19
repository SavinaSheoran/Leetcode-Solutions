# Write your MySQL query statement below
Select IFNULL(
    (Select max(salary) 
    from Employee
    where salary < (select max(salary) from Employee)), null) 
    as SecondHighestSalary;
