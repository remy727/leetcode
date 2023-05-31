# frozen_string_literal: true

# https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array
# 34. Find First and Last Position of Element in Sorted Array
# Medium

=begin
Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

If target is not found in the array, return [-1, -1].

You must write an algorithm with O(log n) runtime complexity.

Example 1:
Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]

Example 2:
Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]

Example 3:
Input: nums = [], target = 0
Output: [-1,-1]

Constraints:
* 0 <= nums.length <= 105
* -109 <= nums[i] <= 109
* nums is a non-decreasing array.
* -109 <= target <= 109
=end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  records = Hash.new([])
  for i in 0...nums.length
    records[nums[i]] = []
  end
  for i in 0...nums.length
    records[nums[i]] << i
  end
  records[target].empty? ? [-1, -1] : [records[target][0], records[target][-1]]
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_search_range < Test::Unit::TestCase
  def test_
    assert_equal [3, 4], search_range([5, 7, 7, 8, 8, 10], 8)
    assert_equal [-1, -1], search_range([5, 7, 7, 8, 8, 10], 6)
    assert_equal [-1, -1], search_range([], 0)
  end
end
