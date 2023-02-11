-- Problem: 584. Find Customer Referee
-- URL: https://leetcode.com/problems/find-customer-referee

-- Write your MySQL query statement below
SELECT
  name
FROM
  Customer
WHERE
  referee_id is NULL OR referee_id <> 2
;
