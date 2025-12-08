# Write your MySQL query statement below
with cte as(select student_id, subject, FIRST_VALUE(score) over (PARTITION BY student_id, Subject order by exam_date) as first_score, FIRST_VALUE(score) over (PARTITION BY student_id, Subject order by exam_date desc) as latest_score from Scores)
select distinct * from cte where latest_score > first_score;