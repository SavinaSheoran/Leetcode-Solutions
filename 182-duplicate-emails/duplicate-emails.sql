# Write your MySQL query statement below

#Group by: This clause tells the database to gather all the rows that have the exact same email address and put them into a single, temporary group.

#Count: This is an aggregate function that counts how many items are in each of the groups created in Step 1.

#HAVING COUNT(*)>1: This is the filter, but it works after the grouping. The HAVING clause filters the groups based on the result of the COUNT(*). It keeps only the groups where the count is greater than 1.

#select email: Finally, after all the filtering is done, you display the result. You select and show the email address from the remaining groups.

select email from Person group by email  having count(*)>1;