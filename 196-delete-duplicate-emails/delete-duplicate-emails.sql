# Write your MySQL query statement below
-- select distinct email, id from Person where id <4;

delete p1 from person p1, person p2, person p3 where p1.email = p2.email and p1.id > p2.id;