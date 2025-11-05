CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
    WITH RankedSalaries AS (
        SELECT
            salary,
            -- DENSE_RANK assigns the same rank to duplicate salaries and 
            -- does NOT skip the next number (e.g., 1, 1, 2, 3, 3, 4).
            DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
        FROM
            Employee
    )
    
    -- 2. Main Query: Select the salary that matches the target rank N
    SELECT
        -- MAX() ensures a single row is returned. If the filter finds nothing,
        -- MAX() returns NULL, fulfilling the final requirement.
        MAX(salary)
    FROM
        RankedSalaries
    WHERE
        salary_rank = N
  );
END