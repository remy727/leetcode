-- Problem: 183. Customers Who Never Order
-- URL: https://leetcode.com/problems/customers-who-never-order

-- Write your MySQL query statement below
SELECT
  name as 'Customers'
FROM
  customers
WHERE
  id NOT IN
  (
    SELECT customerid FROM Orders
  )
;
