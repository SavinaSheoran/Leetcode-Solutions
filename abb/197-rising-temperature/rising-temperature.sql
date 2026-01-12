# Write your MySQL query statement below
-- select w1.id from Weather as w1, Weather as w2 where datediff(w1.recordDate, w2.recordDate) = 1 and w1.Temperature > w2.Temperature;

-- select id from weather where id=2 or id=4;
select w1.id from weather as w1 inner join weather as w2 on datediff(w1.recordDate, w2.recordDate) = 1 and
w1.temperature > w2.temperature;