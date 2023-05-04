# frozen_string_literal: true

# 238. Product of Array Except Self
# https://leetcode.com/problems/product-of-array-except-self
# Medium

=begin
Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
You must write an algorithm that runs in O(n) time and without using the division operation.

Example 1:
Input: nums = [1,2,3,4]
Output: [24,12,8,6]

Example 2:
Input: nums = [-1,1,0,-3,3]
Output: [0,0,9,0,0]

Constraints:
* 2 <= nums.length <= 105
* -30 <= nums[i] <= 30
* The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
=end

# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  n = nums.size
  out = [1] * n
  left = right = 1
  1.upto(n - 1) { |i|
    out[i] *= left *= nums[i - 1]
    out[~i] *= right *= nums[-i]
  }
  out
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_length_of_longest_substring < Test::Unit::TestCase
  def test_
    assert_equal [24, 12, 8, 6], product_except_self([1, 2, 3, 4])
    assert_equal [0, 0, 9, 0, 0], product_except_self([-1, 1, 0, -3, 3])
  end
end
