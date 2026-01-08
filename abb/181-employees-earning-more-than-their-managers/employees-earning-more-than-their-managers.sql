select e.name as Employee from Employee as e 
join Employee as c on e.managerId = c.id where e.salary > c.salary