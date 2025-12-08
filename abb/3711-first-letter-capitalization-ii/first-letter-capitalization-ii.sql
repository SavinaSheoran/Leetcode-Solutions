# Write your MySQL query statement below
SELECT
content_id,
content_text AS original_text,
SUBSTRING(REGEXP_REPLACE(CONCAT(LCASE(content_text),UCASE(content_text)),
CONCAT('(?<=[ -]|^)[a-z](?=.{',CHAR_LENGTH(content_text) - 1,'}([a-z]))'),
'$1'),1,CHAR_LENGTH(content_text))  AS converted_text
FROM user_content;