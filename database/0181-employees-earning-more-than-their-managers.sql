-- 181. Employees Earning More Than Their Managers
-- https://leetcode.com/problems/employees-earning-more-than-their-managers

-- Write your MySQL query statement below
SELECT
  a.name AS Employee
FROM
  Employee AS a
JOIN Employee AS b ON a.managerId = b.id AND a.salary > b.salary
;
