# Write your MySQL query statement below
with cte as (select  *,date_format(trip_date,'%m') as month from trips)


,cte2 as (select driver_id,case when month in (01,02,03,04,05,06) then distance_km/fuel_consumed  end as first_half ,

case when month in (07,08,09,10,11,12) then distance_km/fuel_consumed end as second_half from cte group by driver_id,trip_date)


,cte3 as (select q.driver_id,round(q.first_half_avg,2) as first_half_avg ,round(q.second_half_avg,2) as second_half_avg ,round(q.second_half_avg - q.first_half_avg,2)as efficiency_improvement from (select driver_id,avg(first_half) as  first_half_avg   ,avg(second_half) as  second_half_avg  from cte2

group by driver_id)as q

where q.first_half_avg is not null and q.second_half_avg is not null)


select d.driver_id,d.driver_name,cte3.first_half_avg,cte3.second_half_avg,cte3.efficiency_improvement from cte3 left join drivers d on cte3.driver_id = d.driver_id

where cte3.efficiency_improvement>0

order by cte3.efficiency_improvement desc,d.driver_name