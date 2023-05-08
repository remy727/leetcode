-- 197. Rising Temperature
-- https://leetcode.com/problems/rising-temperature

-- Write your MySQL query statement below
SELECT
  weather.id AS 'Id'
FROM
  weather
JOIN
  weather w ON DATEDIFF(weather.recordDate, w.recordDate) = 1
  AND weather.temperature > w.temperature
;
