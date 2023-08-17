# frozen_string_literal: true

# 542. 01 Matrix
# Medium
# https://leetcode.com/problems/01-matrix

=begin
Given an m x n binary matrix mat, return the distance of the nearest 0 for each cell.
The distance between two adjacent cells is 1.

Example 1:
Input: mat = [[0,0,0],[0,1,0],[0,0,0]]
Output: [[0,0,0],[0,1,0],[0,0,0]]

Example 2:
Input: mat = [[0,0,0],[0,1,0],[1,1,1]]
Output: [[0,0,0],[0,1,0],[1,2,1]]

Constraints:
* m == mat.length
* n == mat[i].length
* 1 <= m, n <= 104
* 1 <= m * n <= 104
* mat[i][j] is either 0 or 1.
* There is at least one 0 in mat.
=end

# @param {Integer[][]} mat
# @return {Integer[][]}
def update_matrix(matrix)
  rows = matrix.size
  cols = matrix.first.size

  queue = []
  max = Float::INFINITY

  # Identify the cells with 0's and initialize the rest of the cells to max
  (0...rows).each do |r|
    (0...cols).each do |c|
      if matrix[r][c] == 0
        queue.push([r, c])
      else
        matrix[r][c] = max
      end
    end
  end

  directions = [[1, 0], [-1, 0], [0, 1], [0, -1]] # down, up, right and left

  while queue.size > 0 do
    cell = queue.shift

    directions.each do |direction|
      r = cell.first + direction.first
      c = cell.last + direction.last

      # If the neighbor cell is out of bounds OR it has lower or equal distance, then ignore current neighbor
      if r < 0 || c < 0 || r == rows || c == cols || matrix[r][c] <= matrix[cell.first][cell.last] + 1
        next
      end

      # update the distance of the neighbour to current distance + 1
      queue.push([r, c])
      matrix[r][c] = matrix[cell.first][cell.last] + 1
    end
  end

  matrix
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_update_matrix < Test::Unit::TestCase
  def test_
    assert_equal [[0, 0, 0], [0, 1, 0], [0, 0, 0]], update_matrix([[0, 0, 0], [0, 1, 0], [0, 0, 0]])
    assert_equal [[0, 0, 0], [0, 1, 0], [1, 2, 1]], update_matrix([[0, 0, 0], [0, 1, 0], [1, 1, 1]])
  end
end
