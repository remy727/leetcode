# frozen_string_literal: true

# 1277. Count Square Submatrices with All Ones
# Medium
# https://leetcode.com/problems/count-square-submatrices-with-all-ones

=begin
Given a m * n matrix of ones and zeros, return how many square submatrices have all ones.

Example 1:
Input: matrix =
[
  [0,1,1,1],
  [1,1,1,1],
  [0,1,1,1]
]
Output: 15
Explanation:
There are 10 squares of side 1.
There are 4 squares of side 2.
There is  1 square of side 3.
Total number of squares = 10 + 4 + 1 = 15.

Example 2:
Input: matrix =
[
  [1,0,1],
  [1,1,0],
  [1,1,0]
]
Output: 7
Explanation:
There are 6 squares of side 1.
There is 1 square of side 2.
Total number of squares = 6 + 1 = 7.

Constraints:
* 1 <= matrix.length <= 300
* 1 <= matrix[0].length <= 300
* 0 <= matrix[i][j] <= 1
=end

# @param {Integer[][]} matrix
# @return {Integer}
def count_squares(matrix)
  m, n = matrix.length, matrix[0].length
  result = 0
  (0...m).each { |i|
    (0...n).each { |j|
      if matrix[i][j] != 0 && i > 0 && j > 0
        matrix[i][j] = 1 + [matrix[i - 1][j], matrix[i - 1][j - 1], matrix[i][j - 1]].min
      end
      result += matrix[i][j]
    }
  }
  result
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_count_squares < Test::Unit::TestCase
  def test_
    assert_equal 15, count_squares([[0, 1, 1, 1], [1, 1, 1, 1], [0, 1, 1, 1]])
    assert_equal 7, count_squares([[1, 0, 1], [1, 1, 0], [1, 1, 0]])
  end
end
