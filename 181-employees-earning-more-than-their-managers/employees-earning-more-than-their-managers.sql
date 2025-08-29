# Write your My
select Employee.name as Employee from Employee, Employee e2  where Employee.managerid = e2.id and  Employee.salary > e2.salary;