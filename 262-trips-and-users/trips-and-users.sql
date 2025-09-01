# Write your MySQL query statement below
select request_at as Day, round(SUM(status != 'completed')  / COUNT(status) , 2) AS 'Cancellation Rate' from Trips where 
request_at between '2013-10-01' and '2013-10-03' and
client_id not in(select users_id from users where banned = 'Yes' and role = 'client') and 
driver_id not in(select users_id from users where banned = 'Yes' and role = 'driver') group by request_at;