# Write your MySQL query statement below
select class from Courses Group By class having count(student) >= 5;