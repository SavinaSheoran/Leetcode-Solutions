CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N = N-1;
  RETURN (
    select Distinct(salary) from Employee Order BY salary DESC Limit 1 OFFSET N
     );
END