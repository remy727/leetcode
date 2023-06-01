# frozen_string_literal: true

# https://leetcode.com/problems/shortest-path-in-binary-matrix
# 1091. Shortest Path in Binary Matrix
# Medium

=begin
Given an n x n binary matrix grid, return the length of the shortest clear path in the matrix. If there is no clear path, return -1.

A clear path in a binary matrix is a path from the top-left cell (i.e., (0, 0)) to the bottom-right cell (i.e., (n - 1, n - 1)) such that:

* All the visited cells of the path are 0.
* All the adjacent cells of the path are 8-directionally connected (i.e., they are different and they share an edge or a corner).
The length of a clear path is the number of visited cells of this path.

Example 1:
Input: grid = [[0,1],[1,0]]
Output: 2

Example 2:
Input: grid = [[0,0,0],[1,1,0],[1,1,0]]
Output: 4

Example 3:
Input: grid = [[1,0,0],[1,1,0],[1,1,0]]
Output: -1

Constraints:
* n == grid.length
* n == grid[i].length
* 1 <= n <= 100
* grid[i][j] is 0 or 1
=end

# @param {Integer[][]} grid
# @return {Integer}
def shortest_path_binary_matrix(grid)
  n = grid.count
  return -1 if grid[0][0] > 0 || grid[n - 1][n - 1] > 0

  q = [[0, 0, 1]]
  grid[0][0] = 1

  q.each do |i, j, d|
    return d if i == n - 1 && j == n - 1

    [
      [i - 1, j - 1], [i - 1, j],
      [i - 1, j + 1], [i, j - 1],
      [i, j + 1], [i + 1, j - 1],
      [i + 1, j], [i + 1, j + 1]
    ].each do |x, y|
      if 0 <= x && x < n && 0 <= y && y < n && grid[x][y] == 0
        grid[x][y] = 1
        q << [x, y, d + 1]
      end
    end
  end

  -1
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_shortest_path_binary_matrix < Test::Unit::TestCase
  def test_
    assert_equal(2, shortest_path_binary_matrix([[0, 1], [1, 0]]))
    assert_equal(4, shortest_path_binary_matrix([[0, 0, 0], [1, 1, 0], [1, 1, 0]]))
    assert_equal(-1, shortest_path_binary_matrix([[1, 0, 0], [1, 1, 0], [1, 1, 0]]))
  end
end
