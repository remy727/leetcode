# frozen_string_literal: true

# 377. Combination Sum IV
# Medium
# https://leetcode.com/problems/combination-sum-iv

=begin
Given an array of distinct integers nums and a target integer target, return the number of possible combinations that add up to target.
The test cases are generated so that the answer can fit in a 32-bit integer.

Example 1:
Input: nums = [1,2,3], target = 4
Output: 7
Explanation:
The possible combination ways are:
(1, 1, 1, 1)
(1, 1, 2)
(1, 2, 1)
(1, 3)
(2, 1, 1)
(2, 2)
(3, 1)
Note that different sequences are counted as different combinations.

Example 2:
Input: nums = [9], target = 3
Output: 0

Constraints:
* 1 <= nums.length <= 200
* 1 <= nums[i] <= 1000
* All the elements of nums are unique.
* 1 <= target <= 1000
=end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def combination_sum4(nums, target)
  a = [1] + [0] * target

  (1..target).each do |i|
    nums.each do |num|
      a[i] += a[i - num] if num <= i
    end
  end

  a.last
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_combination_sum4 < Test::Unit::TestCase
  def test_
    assert_equal 7, combination_sum4([1, 2, 3], 4)
    assert_equal 0, combination_sum4([9], 3)
  end
end
