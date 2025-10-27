# Write your MySQL query statement below
-- SELECT 
--     (SELECT salary 
--      FROM (
--          SELECT salary, 
--                 ROW_NUMBER() OVER (ORDER BY salary DESC) AS rownum
--          FROM (SELECT DISTINCT salary FROM Employee) AS temp
--      ) AS temp2
--      WHERE rownum = 2) AS SecondHighestSalary;

select(select distinct salary from employee order by salary desc limit 1 offset 1) as SecondHighestSalary;