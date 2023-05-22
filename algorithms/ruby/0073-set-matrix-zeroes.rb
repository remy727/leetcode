# frozen_string_literal: true

# 73. Set Matrix Zeroes
# https://leetcode.com/problems/set-matrix-zeroes
# Medium

=begin
Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's.

You must do it in place.

Example 1:
Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
Output: [[1,0,1],[0,0,0],[1,0,1]]

Example 2:
Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]

Constraints:
m == matrix.length
n == matrix[0].length
1 <= m, n <= 200
-231 <= matrix[i][j] <= 231 - 1
=end

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  rows = Array.new(matrix.size, false)
  columns = Array.new(matrix[0].size, false)

  (0...matrix.size).each do |i|
    (0...matrix[0].size).each do |j|
      if matrix[i][j].zero?
        rows[i] = true
        columns[j] = true
      end
    end
  end

  (0...matrix.size).each do |i|
    (0...matrix[0].size).each do |j|
      matrix[i][j] = 0 if rows[i] || columns[j]
    end
  end
end
