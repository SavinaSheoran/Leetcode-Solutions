# Write your MySQL query statement below
-- select Employee.name as name, Bonus.bonus as bonus from Employee left join Bonus on Bonus.empId=Employee.empId where Bonus.bonus <1000 or Bonus.bonus is null;

select Employee.name as name, Bonus.bonus as bonus from Employee left join Bonus on Bonus.empid = Employee.empid
where Bonus.bonus < 1000 or Bonus.bonus is null;