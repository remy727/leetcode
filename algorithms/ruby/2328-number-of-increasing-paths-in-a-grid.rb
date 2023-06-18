# frozen_string_literal: true

# https://leetcode.com/problems/number-of-increasing-paths-in-a-grid
# 2328. Number of Increasing Paths in a Grid
# Hard

=begin
You are given an m x n integer matrix grid, where you can move from a cell to any adjacent cell in all 4 directions.

Return the number of strictly increasing paths in the grid such that you can start from any cell and end at any cell. Since the answer may be very large, return it modulo 109 + 7.

Two paths are considered different if they do not have exactly the same sequence of visited cells.

Example 1:
Input: grid = [[1,1],[3,4]]
Output: 8
Explanation: The strictly increasing paths are:
- Paths with length 1: [1], [1], [3], [4].
- Paths with length 2: [1 -> 3], [1 -> 4], [3 -> 4].
- Paths with length 3: [1 -> 3 -> 4].
The total number of paths is 4 + 3 + 1 = 8.

Example 2:
Input: grid = [[1],[2]]
Output: 3
Explanation: The strictly increasing paths are:
- Paths with length 1: [1], [2].
- Paths with length 2: [1 -> 2].
The total number of paths is 2 + 1 = 3.

Constraints:
* m == grid.length
* n == grid[i].length
* 1 <= m, n <= 1000
* 1 <= m * n <= 105
* 1 <= grid[i][j] <= 105
=end

# @param {Integer[][]} grid
# @return {Integer}
def count_paths(grid)
  max_row_index = grid.size - 1
  max_col_index = grid.first.size - 1
  result_grid = Array.new(grid.size) { Array.new(grid.first.size, nil) }
  total_result = 0
  mod = 10**9 + 7

  dfs = lambda do |row_index, col_index, previous|
    return 0 unless row_index.between?(0, max_row_index) && col_index.between?(0, max_col_index)
    cell = grid[row_index][col_index]
    return 0 unless cell > previous
    return result_grid[row_index][col_index] if result_grid[row_index][col_index]

    steps = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    result = steps.sum do |step_row, step_col|
      dfs.call(row_index + step_row, col_index + step_col, cell)
    end + 1

    result_grid[row_index][col_index] = result % mod
  end

  0.upto(max_row_index) do |row_index|
    0.upto(max_col_index) do |col_index|
      total_result += dfs.call(row_index, col_index, -Float::INFINITY)
    end
  end

  total_result % mod
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_count_paths < Test::Unit::TestCase
  def test_
    assert_equal 8, count_paths([[1, 1], [3, 4]])
    assert_equal 3, count_paths([[1], [2]])
  end
end
