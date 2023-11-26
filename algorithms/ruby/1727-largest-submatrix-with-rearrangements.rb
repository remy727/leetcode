# frozen_string_literal: true

# 1727. Largest Submatrix With Rearrangements
# Medium
# https://leetcode.com/problems/largest-submatrix-with-rearrangements

=begin
You are given a binary matrix matrix of size m x n, and you are allowed to rearrange the columns of the matrix in any order.
Return the area of the largest submatrix within matrix where every element of the submatrix is 1 after reordering the columns optimally.

Example 1:
Input: matrix = [[0,0,1],[1,1,1],[1,0,1]]
Output: 4
Explanation: You can rearrange the columns as shown above.
The largest submatrix of 1s, in bold, has an area of 4.

Example 2:
Input: matrix = [[1,0,1,0,1]]
Output: 3
Explanation: You can rearrange the columns as shown above.
The largest submatrix of 1s, in bold, has an area of 3.

Example 3:
Input: matrix = [[1,1,0],[1,0,1]]
Output: 2
Explanation: Notice that you must rearrange entire columns, and there is no way to make a submatrix of 1s larger than an area of 2.

Constraints:
m == matrix.length
n == matrix[i].length
1 <= m * n <= 105
matrix[i][j] is either 0 or 1.
=end

# @param {Integer[][]} matrix
# @return {Integer}
def largest_submatrix(matrix)
  m = matrix.size
  n = matrix[0].size
  columns = Array.new(m) { [] }

  0.upto(n - 1) do |j|
    seq = 0

    (m - 1).downto(0) do |i|
      if matrix[i][j] == 1
        seq += 1
        columns[i][j] = seq
      else
        seq = 0
      end
    end
  end

  max = 0

  0.upto(m - 1) do |i|
    cols = columns[i].compact.sort
    n = cols.size
    (n - 1).downto(0) do |j|
      max = [max, (n - j) * cols[j]].max
    end
  end

  max
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_largest_submatrix < Test::Unit::TestCase
  def test_
    assert_equal 4, largest_submatrix([[0, 0, 1], [1, 1, 1], [1, 0, 1]])
    assert_equal 3, largest_submatrix([[1, 0, 1, 0, 1]])
    assert_equal 2, largest_submatrix([[1, 1, 0], [1, 0, 1]])
  end
end
