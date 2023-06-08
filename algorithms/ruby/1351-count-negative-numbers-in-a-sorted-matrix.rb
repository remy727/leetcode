# frozen_string_literal: true

# https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix
# 1351. Count Negative Numbers in a Sorted Matrix
# Easy

=begin
Given a m x n matrix grid which is sorted in non-increasing order both row-wise and column-wise, return the number of negative numbers in grid.

Example 1:
Input: grid = [[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]]
Output: 8
Explanation: There are 8 negatives number in the matrix.

Example 2:
Input: grid = [[3,2],[1,0]]
Output: 0
=end

# @param {Integer[][]} grid
# @return {Integer}
def count_negatives(grid)
  grid.reduce(0) do |sum, row|
    row.each do |column|
        sum += 1 if column < 0
      end
    sum
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_count_negatives < Test::Unit::TestCase
  def test_
    assert_equal 8, count_negatives([[4, 3, 2, -1], [3, 2, 1, -1], [1, 1, -1, -2], [-1, -1, -2, -3]])
    assert_equal 0, count_negatives([[3, 2], [1, 0]])
  end
end
