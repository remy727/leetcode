# frozen_string_literal: true

# https://leetcode.com/problems/maximum-subarray
# 53. Maximum Subarray
# Medium

=begin
Given an integer array nums, find the subarray with the largest sum, and return its sum.

Example 1:
Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: The subarray [4,-1,2,1] has the largest sum 6.

Example 2:
Input: nums = [1]
Output: 1
Explanation: The subarray [1] has the largest sum 1.

Example 3:
Input: nums = [5,4,-1,7,8]
Output: 23
Explanation: The subarray [5,4,-1,7,8] has the largest sum 23.

Constraints:
* 1 <= nums.length <= 105
* -104 <= nums[i] <= 104
=end

# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  max_sum = nums[0]
  current_sum = nums[0]

  nums[1..-1].each do |num|
    current_sum = [num, current_sum + num].max
    max_sum = [max_sum, current_sum].max
  end

  max_sum
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_sub_array < Test::Unit::TestCase
  def test_
    assert_equal 6, max_sub_array([-2, 1, -3, 4, -1, 2, 1, -5, 4])
    assert_equal 1, max_sub_array([1])
    assert_equal 23, max_sub_array([5, 4, -1, 7, 8])
  end
end
