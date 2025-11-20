# Write your MySQL query statement below
(select u.name as results from Users u join MovieRating mr on mr.useR_id = u.user_id group by u.user_id, 
u.name order by count(*) desc, u.name asc limit 1)
UNION ALL
(
  SELECT m.title AS results
  FROM Movies m
  JOIN MovieRating mr ON mr.movie_id = m.movie_id
  WHERE mr.created_at >= '2020-02-01' AND mr.created_at < '2020-03-01'
  GROUP BY m.movie_id, m.title
  ORDER BY AVG(mr.rating) DESC, m.title ASC
  LIMIT 1
);