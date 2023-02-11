-- Problem: 175. Combine Two Tables
-- URL: https://leetcode.com/problems/combine-two-tables

-- Write your MySQL query statement below
SELECT
  firstName,
  lastName,
  city,
  state
FROM
  Person
LEFT JOIN Address on Person.personId = Address.personId
;
