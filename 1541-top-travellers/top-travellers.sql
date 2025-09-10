# Write your MySQL query statement below
select Users.name, sum(case when Users.id = Rides.user_id then distance else 0 end) as travelled_distance from Users left join 
Rides on Users.id = Rides.user_id group by Users.id order by sum(distance) desc, name asc;