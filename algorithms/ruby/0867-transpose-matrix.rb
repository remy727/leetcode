# frozen_string_literal: true

# 867. Transpose Matrix
# Easy
# https://leetcode.com/problems/transpose-matrix

=begin
Given a 2D integer array matrix, return the transpose of matrix.
The transpose of a matrix is the matrix flipped over its main diagonal, switching the matrix's row and column indices.

Example 1:
Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [[1,4,7],[2,5,8],[3,6,9]]

Example 2:
Input: matrix = [[1,2,3],[4,5,6]]
Output: [[1,4],[2,5],[3,6]]

Constraints:
m == matrix.length
n == matrix[i].length
1 <= m, n <= 1000
1 <= m * n <= 105
-109 <= matrix[i][j] <= 109
=end

# @param {Integer[][]} matrix
# @return {Integer[][]}
def transpose(matrix)
  matrix.transpose
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_transpose < Test::Unit::TestCase
  def test_
    assert_equal [[1, 4, 7], [2, 5, 8], [3, 6, 9]], transpose([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    assert_equal [[1, 4], [2, 5], [3, 6]], transpose([[1, 2, 3], [4, 5, 6]])
  end
end
