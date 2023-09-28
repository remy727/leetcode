# frozen_string_literal: true

# 905. Sort Array By Parity
# Easy
# https://leetcode.com/problems/sort-array-by-parity

=begin
Given an integer array nums, move all the even integers at the beginning of the array followed by all the odd integers.
Return any array that satisfies this condition.

Example 1:
Input: nums = [3,1,2,4]
Output: [2,4,3,1]
Explanation: The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.

Example 2:
Input: nums = [0]
Output: [0]

Constraints:
1 <= nums.length <= 5000
0 <= nums[i] <= 5000
=end

# @param {Integer[]} nums
# @return {Integer[]}
def sort_array_by_parity(nums)
  nums.partition(&:even?).sum([])
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_length_of_longest_substring < Test::Unit::TestCase
  def test_
    assert_equal [2, 4, 3, 1].sort, sort_array_by_parity([3, 1, 2, 4]).sort
    assert_equal [0].sort, sort_array_by_parity([0])
  end
end
