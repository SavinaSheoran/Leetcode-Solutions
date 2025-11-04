# Write your MySQL query statement below
-- select distinct email, id from Person where id <4;

delete p1 from person p1, person p2, person p3 where p1.email = p2.email and p1.id > p2.id;

-- select distinct email, id from Person where email != email;

-- DELETE p1
-- FROM Person p1, Person p2, Person p3
-- WHERE p1.email = p2.email or p2.email = p3.email AND p1.id > p2.id or p2.id > p3.id;