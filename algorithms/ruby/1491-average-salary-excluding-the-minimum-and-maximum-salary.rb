# frozen_string_literal: true

# 1491. Average Salary Excluding the Minimum and Maximum Salary
# https://leetcode.com/problems/average-salary-excluding-the-minimum-and-maximum-salary
# Difficulty: Easy

=begin
You are given an array of unique integers salary where salary[i] is the salary of the ith employee.

Return the average salary of employees excluding the minimum and maximum salary. Answers within 10-5 of the actual answer will be accepted.

Example 1:
Input: salary = [4000,3000,1000,2000]
Output: 2500.00000
Explanation: Minimum salary and maximum salary are 1000 and 4000 respectively.
Average salary excluding minimum and maximum salary is (2000+3000) / 2 = 2500

Example 2:
Input: salary = [1000,2000,3000]
Output: 2000.00000
Explanation: Minimum salary and maximum salary are 1000 and 3000 respectively.
Average salary excluding minimum and maximum salary is (2000) / 1 = 2000

Constraints:
* 3 <= salary.length <= 100
* 1000 <= salary[i] <= 106
* All the integers of salary are unique.
=end

# @param {Integer[]} salary
# @return {Float}
def average(salary)
  (salary.sum - salary.minmax.sum) / (salary.size - 2.0)
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_average < Test::Unit::TestCase
  def test_
    assert_equal 2500.0, average([4000, 3000, 1000, 2000])
    assert_equal 2000.0, average([1000, 2000, 3000])
  end
end
