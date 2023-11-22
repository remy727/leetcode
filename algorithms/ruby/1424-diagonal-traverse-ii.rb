# frozen_string_literal: true

# 1424. Diagonal Traverse II
# Medium
# https://leetcode.com/problems/diagonal-traverse-ii

=begin
Given a 2D integer array nums, return all elements of nums in diagonal order as shown in the below images.

Example 1:
Input: nums = [[1,2,3],[4,5,6],[7,8,9]]
Output: [1,4,2,7,5,3,8,6,9]

Example 2
Input: nums = [[1,2,3,4,5],[6,7],[8],[9,10,11],[12,13,14,15,16]]
Output: [1,6,2,8,7,3,9,4,12,10,5,13,11,14,15,16]

Constraints:
1 <= nums.length <= 105
1 <= nums[i].length <= 105
1 <= sum(nums[i].length) <= 105
1 <= nums[i][j] <= 105
=end

# @param {Integer[][]} nums
# @return {Integer[]}
def find_diagonal_order(a)
  r, z = [], a.size
  a.each_with_index do | v, i |
    p = z - i
    v.each_with_index do
      r << [(i + _2 << 20) | p, _1]
    end
  end
  r.sort_by!(&:first).map!(&:last)
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_find_diagonal_order < Test::Unit::TestCase
  def test_
    assert_equal [1, 4, 2, 7, 5, 3, 8, 6, 9], find_diagonal_order([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    assert_equal [1, 6, 2, 8, 7, 3, 9, 4, 12, 10, 5, 13, 11, 14, 15, 16], find_diagonal_order([[1, 2, 3, 4, 5], [6, 7], [8], [9, 10, 11], [12, 13, 14, 15, 16]])
  end
end
