-- 182. Duplicate Emails
-- https://leetcode.com/problems/duplicate-emails

-- Write your MySQL query statement below
SELECT
	email
FROM
	Person
group by
	email
having count(email) > 1
;
