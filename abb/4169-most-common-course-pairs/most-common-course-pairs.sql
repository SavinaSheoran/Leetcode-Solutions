# Write your MySQL query statement below
with cte1 as(
    select user_id from course_completions group by
    user_id having count(user_id)>4 and avg(course_rating)>=4
),
cte2 as(
    select * from course_completions where user_id in
    (select user_id from cte1)
),
cte3 as(
    select course_name first_course, user_id as first_user , lead(course_name,1) over () second_course, lead(user_id,1) over () second_user from cte2
)
select first_course, second_course , count(first_course) transition_count from cte3
where second_course is not null and first_user=second_user group by first_course, second_course order by count(first_course) desc, 1,2
