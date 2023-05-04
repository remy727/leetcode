# frozen_string_literal: true

# 74. Search a 2D Matrix
# https://leetcode.com/problems/search-a-2d-matrix
# Medium

=begin
You are given an m x n integer matrix matrix with the following two properties:

Each row is sorted in non-decreasing order.
The first integer of each row is greater than the last integer of the previous row.
Given an integer target, return true if target is in matrix or false otherwise.

You must write a solution in O(log(m * n)) time complexity.

### Example 1:
Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
Output: true

### Example 2:
Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
Output: false

Constraints:
* m == matrix.length
* n == matrix[i].length
* 1 <= m, n <= 100
* -104 <= matrix[i][j], target <= 104
=end

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  m, n = matrix.size, matrix[0].size
  i = (0...m * n).bsearch { |i| matrix[i / n][i % n] >= target }
  !!i && matrix[i / n][i % n] == target
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_search_matrix < Test::Unit::TestCase
  def test_
    assert_equal true, search_matrix([[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 60]], 3)
    assert_equal false, search_matrix([[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 60]], 13)
  end
end
