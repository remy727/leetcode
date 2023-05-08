# frozen_string_literal: true

# 1572. Matrix Diagonal Sum
# https://leetcode.com/problems/matrix-diagonal-sum
# Easy

=begin
Given a square matrix mat, return the sum of the matrix diagonals.

Only include the sum of all the elements on the primary diagonal and all the elements on the secondary diagonal that are not part of the primary diagonal.

Example 1:
Input: mat = [[1,2,3],
              [4,5,6],
              [7,8,9]]
Output: 25
Explanation: Diagonals sum: 1 + 5 + 9 + 3 + 7 = 25
Notice that element mat[1][1] = 5 is counted only once.

Example 2:
Input: mat = [[1,1,1,1],
              [1,1,1,1],
              [1,1,1,1],
              [1,1,1,1]]
Output: 8

Example 3:
Input: mat = [[5]]
Output: 5

Constraints:
n == mat.length == mat[i].length
1 <= n <= 100
1 <= mat[i][j] <= 100
=end

# @param {Integer[][]} mat
# @return {Integer}
def diagonal_sum(mat)
  size = mat.size
  sum = 0
  (0...size).each { |i| sum += mat[i][i] + mat[i][size - 1 - i] }
  if size.odd?
    sum -= mat[size / 2][size / 2]
  end
  sum
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"

class Test_diagonal_sum < Test::Unit::TestCase
  def test_
    assert_equal 25, diagonal_sum([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    assert_equal 8, diagonal_sum([[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]])
    assert_equal 5, diagonal_sum([[5]])
  end
end
