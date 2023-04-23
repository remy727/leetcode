# frozen_string_literal: true

# 994. Rotting Oranges
# https://leetcode.com/problems/rotting-oranges
# Difficulty: Medium

=begin
You are given an m x n grid where each cell can have one of three values:

0 representing an empty cell,
1 representing a fresh orange, or
2 representing a rotten orange.
Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.

Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.

### Example 1:
Input: grid = [[2,1,1],[1,1,0],[0,1,1]]
Output: 4

### Example 2:
Input: grid = [[2,1,1],[0,1,1],[1,0,1]]
Output: -1
Explanation: The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.

### Example 3:
Input: grid = [[0,2]]
Output: 0
Explanation: Since there are already no fresh oranges at minute 0, the answer is just 0.

### Constraints:
* m == grid.length
* n == grid[i].length
* 1 <= m, n <= 10
* grid[i][j] is 0, 1, or 2.

=end

# @param {Integer[][]} grid
# @return {Integer}
def oranges_rotting(grid)
  row_count = grid.count
  column_count = grid[0].count

  queue = []
  fresh_count = 0

  row_count.times do |i|
    column_count.times do |j|
      queue << [i, j] if grid[i][j] == 2
      fresh_count += 1 if grid[i][j] == 1
    end
  end

  directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
  level = 0

  while !queue.empty?
    level += 1
    queue.count.times do
      i, j = queue.shift
      directions.each do |d_i, d_j|
        if (0...row_count).cover?(i + d_i) &&
            (0...column_count).cover?(j + d_j) &&
            grid[i + d_i][j + d_j] == 1

          fresh_count -= 1
          grid[i + d_i][j + d_j] = 2
          queue << [i + d_i, j + d_j]
        end
      end
    end
  end

  fresh_count != 0 ? -1 : [level - 1, 0].max
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_oranges_rotting < Test::Unit::TestCase
  def test_
    assert_equal(4, oranges_rotting([[2, 1, 1], [1, 1, 0], [0, 1, 1]]))
    assert_equal(-1, oranges_rotting([[2, 1, 1], [0, 1, 1], [1, 0, 1]]))
    assert_equal(0, oranges_rotting([[0, 2]]))
  end
end
