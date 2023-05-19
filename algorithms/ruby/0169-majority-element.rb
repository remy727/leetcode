# frozen_string_literal: true

# 169. Majority Element
# https://leetcode.com/problems/majority-element
# Easy

=begin
Given an array nums of size n, return the majority element.

The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

Example 1:
Input: nums = [3,2,3]
Output: 3

Example 2:
Input: nums = [2,2,1,1,1,2,2]
Output: 2

Constraints:
n == nums.length
1 <= n <= 5 * 104
-109 <= nums[i] <= 109
=end

# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  candidate = nil
  count = 0

  nums.each do |ele|
    candidate = ele if count == 0

    if candidate == ele
      count += 1
    else
      count -= 1
    end
  end

  count = 0
  nums.each do |ele|
    count += 1 if ele == candidate
  end

  count > nums.count / 2 ? candidate : nil
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_majority_element < Test::Unit::TestCase
  def test_
    assert_equal 3, majority_element([3, 2, 3])
    assert_equal 2, majority_element([2, 2, 1, 1, 1, 2, 2])
  end
end
