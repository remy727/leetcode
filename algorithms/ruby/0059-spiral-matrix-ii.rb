# frozen_string_literal: true

# 59. Spiral Matrix II
# https://leetcode.com/problems/spiral-matrix-ii
# Medium

=begin
Given a positive integer n, generate an n x n matrix filled with elements from 1 to n2 in spiral order.

Example 1:
Input: n = 3
Output: [[1,2,3],[8,9,4],[7,6,5]]

Example 2:
Input: n = 1
Output: [[1]]

Constraints:
1 <= n <= 20
=end

# @param {Integer} n
# @return {Integer[][]}
def generate_matrix(n)
  matrix = n.times.map { [nil] * n }

  top_i, bottom_i = 0, n - 1
  left_j, right_j = 0, n - 1

  count = 1

  while top_i <= bottom_i && left_j <= right_j
    (left_j...right_j + 1).each do |j|
      matrix[top_i][j] = count
      count += 1
    end

    (top_i + 1...bottom_i + 1).each do |i|
      matrix[i][right_j] = count
      count += 1
    end

    (right_j - 1).downto(left_j) do |j|
      matrix[bottom_i][j] = count
      count += 1
    end

    (bottom_i - 1).downto(top_i + 1) do |i|
      matrix[i][left_j] = count
      count += 1
    end

    top_i += 1
    bottom_i -= 1
    left_j += 1
    right_j -= 1
  end

  matrix
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_generate_matrix < Test::Unit::TestCase
  def test_
    assert_equal [[1, 2, 3], [8, 9, 4], [7, 6, 5]], generate_matrix(3)
    assert_equal [[1]], generate_matrix(1)
  end
end
