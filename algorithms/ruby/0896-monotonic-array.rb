# frozen_string_literal: true

# 896. Monotonic Array
# Easy
# https://leetcode.com/problems/monotonic-array

=begin
An array is monotonic if it is either monotone increasing or monotone decreasing.
An array nums is monotone increasing if for all i <= j, nums[i] <= nums[j]. An array nums is monotone decreasing if for all i <= j, nums[i] >= nums[j].
Given an integer array nums, return true if the given array is monotonic, or false otherwise.

Example 1:
Input: nums = [1,2,2,3]
Output: true

Example 2:
Input: nums = [6,5,4,4]
Output: true

Example 3:
Input: nums = [1,3,2]
Output: false

Constraints:
1 <= nums.length <= 105
-105 <= nums[i] <= 105
=end

# @param {Integer[]} nums
# @return {Boolean}
def is_monotonic(nums)
  x = nums
  up = false
  down = false
  (1...x.size).each do |i|
    return false if up && down
    up = true if x[i - 1] < x[i]
    down = true if x[i - 1] > x[i]
  end
  return false if up && down
  true
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_is_monotonic < Test::Unit::TestCase
  def test_
    assert_equal true, is_monotonic([1, 2, 2, 3])
    assert_equal true, is_monotonic([6, 5, 4, 4])
    assert_equal false, is_monotonic([1, 3, 2])
  end
end
