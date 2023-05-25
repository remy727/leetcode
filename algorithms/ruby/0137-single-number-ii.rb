# frozen_string_literal: true

# 137. Single Number II
# https://leetcode.com/problems/single-number-ii
# Medium

=begin
Given an integer array nums where every element appears three times except for one, which appears exactly once. Find the single element and return it.

You must implement a solution with a linear runtime complexity and use only constant extra space.

Example 1:
Input: nums = [2,2,3,2]
Output: 3

Example 2:
Input: nums = [0,1,0,1,0,1,99]
Output: 99

Constraints:
1 <= nums.length <= 3 * 104
-231 <= nums[i] <= 231 - 1
Each element in nums appears exactly three times except for one element which appears once.
=end

# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  one = 0
  two = 0

  nums.each do |num|
    one = (one ^ num) & ~two
    two = (two ^ num) & ~one
  end

  one
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_single_number < Test::Unit::TestCase
  def test_
    assert_equal 3, single_number([2, 2, 3, 2])
    assert_equal 99, single_number([0, 1, 0, 1, 0, 1, 99])
  end
end
