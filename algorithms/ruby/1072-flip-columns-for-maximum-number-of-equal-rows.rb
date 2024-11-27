# frozen_string_literal: true

# 1072. Flip Columns For Maximum Number of Equal Rows
# https://leetcode.com/problems/flip-columns-for-maximum-number-of-equal-rows
# Medium

=begin
You are given an m x n binary matrix matrix.
You can choose any number of columns in the matrix and flip every cell in that column (i.e., Change the value of the cell from 0 to 1 or vice versa).
Return the maximum number of rows that have all values equal after some number of flips.

Example 1:
Input: matrix = [[0,1],[1,1]]
Output: 1
Explanation: After flipping no values, 1 row has all values equal.

Example 2:
Input: matrix = [[0,1],[1,0]]
Output: 2
Explanation: After flipping values in the first column, both rows have equal values.

Example 3:
Input: matrix = [[0,0,0],[0,0,1],[1,1,0]]
Output: 2
Explanation: After flipping values in the first two columns, the last two rows have equal values.


Constraints:
* m == matrix.length
* n == matrix[i].length
* 1 <= m, n <= 300
matrix[i][j] is either 0 or 1.
=end

# @param {Integer[][]} matrix
# @return {Integer}
def max_equal_rows_after_flips(mat)
  pat_freq = Hash.new(0)

  mat.each do |row|
    pattern = row[0] == 0 ? row.join : row.map { |bit| bit ^ 1 }.join
    pat_freq[pattern] += 1
  end

  pat_freq.values.max
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_equal_rows_after_flips < Test::Unit::TestCase
  def test_
    assert_equal(1, max_equal_rows_after_flips([[0, 1], [1, 1]]))
    assert_equal(2, max_equal_rows_after_flips([[0, 1], [1, 0]]))
    assert_equal(2, max_equal_rows_after_flips([[0, 0, 0], [0, 0, 1], [1, 1, 0]]))
  end
end
