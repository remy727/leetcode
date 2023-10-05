# frozen_string_literal: true

# 229. Majority Element II
# Medium
# https://leetcode.com/problems/majority-element-ii

=begin
Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.

Example 1:
Input: nums = [3,2,3]
Output: [3]

Example 2:
Input: nums = [1]
Output: [1]

Example 3:
Input: nums = [1,2]
Output: [1,2]

Constraints:
1 <= nums.length <= 5 * 104
-109 <= nums[i] <= 109
=end

# @param {Integer[]} nums
# @return {Integer[]}
def majority_element(nums)
  candidate1, candidate2 = 0, 0
  count1, count2 = 0, 0

  nums.each do |num|
    if candidate1 == num
      count1 += 1
    elsif candidate2 == num
      count2 += 1
    elsif count1 == 0
      candidate1 = num
      count1 += 1
    elsif count2 == 0
      candidate2 = num
      count2 += 1
    else
      count1 -= 1
      count2 -= 1
    end
  end

  result = []
  [candidate1, candidate2].uniq.each do |candidate|
    result << candidate if nums.count(candidate) > (nums.count / 3)
  end

  result
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_majority_element < Test::Unit::TestCase
  def test_
    assert_equal [3], majority_element([3, 2, 3])
    assert_equal [1], majority_element([1])
    assert_equal [1, 2], majority_element([1, 2])
  end
end
