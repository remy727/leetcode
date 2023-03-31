# frozen_string_literal: true

# 200. Number of Islands
# https://leetcode.com/problems/number-of-islands

=begin

Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

### Example 1:
Input: grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
Output: 1

### Example 2:
Input: grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
Output: 3

### Constraints:
* m == grid.length
* n == grid[i].length
* 1 <= m, n <= 300
* grid[i][j] is '0' or '1'.

=end

# Runtime: 180 ms
# Memory: 219.5 MB
# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  count = 0
  grid.size.times do |i|
    grid.first.size.times do |j|
      count += dfs(grid, i, j) if grid[i][j] == "1"
    end
  end
  count
end

def dfs(grid, i, j)
  return 0 if i < 0 || j < 0 || i >= grid.size || j >= grid.first.size || grid[i][j] == "0"
  grid[i][j] = "0"
  dfs(grid, i - 1, j)
  dfs(grid, i + 1, j)
  dfs(grid, i, j - 1)
  dfs(grid, i, j + 1)
  1
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_num_islands < Test::Unit::TestCase
  def test_
    assert_equal 1, num_islands([["1", "1", "1", "1", "0"], ["1", "1", "0", "1", "0"], ["1", "1", "0", "0", "0"], ["0", "0", "0", "0", "0"]])
    assert_equal 3, num_islands([["1", "1", "0", "0", "0"], ["1", "1", "0", "0", "0"], ["0", "0", "1", "0", "0"], ["0", "0", "0", "1", "1"]  ])
  end
end
