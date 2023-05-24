# frozen_string_literal: true

# 221. Maximal Square
# https://leetcode.com/problems/maximal-square
# Medium

=begin
Given an m x n binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

Example 1:
Input: matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
Output: 4

Example 2:
Input: matrix = [["0","1"],["1","0"]]
Output: 1

Example 3:
Input: matrix = [["0"]]
Output: 0

Constraints:
m == matrix.length
n == matrix[i].length
1 <= m, n <= 300
matrix[i][j] is '0' or '1'.
=end

# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
  dp = Array.new(matrix.size + 1) { Array.new(matrix[0].size + 1) }
  max = 0
  dp.size.times do |i|
    dp[0].size.times do |j|
      if i == 0 || j == 0 || matrix[i - 1][j - 1] == "0"
        dp[i][j] = 0
      else
        dp[i][j] = 1 + [dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1]].min
      end
      max = [max, dp[i][j]].max
    end
  end
  max**2
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_maximal_square < Test::Unit::TestCase
  def test_
    assert_equal 4, maximal_square([["1", "0", "1", "0", "0"], ["1", "0", "1", "1", "1"], ["1", "1", "1", "1", "1"], ["1", "0", "0", "1", "0"]])
    assert_equal 1, maximal_square([["0", "1"], ["1", "0"]])
    assert_equal 0, maximal_square([["0"]])
  end
end
