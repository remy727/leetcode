# frozen_string_literal: true

# 1020. Number of Enclaves
# https://leetcode.com/problems/number-of-enclaves

=begin

You are given an m x n binary matrix grid, where 0 represents a sea cell and 1 represents a land cell.

A move consists of walking from one land cell to another adjacent (4-directionally) land cell or walking off the boundary of the grid.

Return the number of land cells in grid for which we cannot walk off the boundary of the grid in any number of moves.

### Example 1:
Input: grid = [[0,0,0,0],[1,0,1,0],[0,1,1,0],[0,0,0,0]]
Output: 3
Explanation: There are three 1s that are enclosed by 0s, and one 1 that is not enclosed because its on the boundary.

### Example 2:
Input: grid = [[0,1,1,0],[0,0,1,0],[0,0,1,0],[0,0,0,0]]
Output: 0
Explanation: All 1s are either on the boundary or can reach the boundary.

### Constraints:
* m == grid.length
* n == grid[i].length
* 1 <= m, n <= 500
* grid[i][j] is either 0 or 1.

=end

# Runtime 234 ms Beats 100%
# Memory 213.7 MB Beats 100%
# @param {Integer[][]} grid
# @return {Integer}
def num_enclaves(grid)
  m = grid.size
  n = grid[0].size
  q = []

  answer = 0
  (0...m).each do |i|
    (0...n).each do |j|
      answer += grid[i][j]
      if i * j == 0 || i == m - 1 || j == n - 1
        q.push([i, j])
      end
    end
  end

  while !q.empty?
    x, y = q.first
    q.shift

    if x < 0 || x == m || y < 0 || y == n || grid[x][y] != 1
      next
    end

    grid[x][y] = 0
    answer -= 1
    q.push([x + 1, y])
    q.push([x - 1, y])
    q.push([x, y + 1])
    q.push([x, y - 1])
  end

  answer
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_num_enclaves < Test::Unit::TestCase
  def test_
    assert_equal 3, num_enclaves([[0, 0, 0, 0], [1, 0, 1, 0], [0, 1, 1, 0], [0, 0, 0, 0]])
    assert_equal 0, num_enclaves([[0, 1, 1, 0], [0, 0, 1, 0], [0, 0, 1, 0], [0, 0, 0, 0]])
    assert_equal 3, num_enclaves([[0, 0, 0, 1, 1, 1, 0, 1, 0, 0], [1, 1, 0, 0, 0, 1, 0, 1, 1, 1], [0, 0, 0, 1, 1, 1, 0, 1, 0, 0], [0, 1, 1, 0, 0, 0, 1, 0, 1, 0], [0, 1, 1, 1, 1, 1, 0, 0, 1, 0], [0, 0, 1, 0, 1, 1, 1, 1, 0, 1], [0, 1, 1, 0, 0, 0, 1, 1, 1, 1], [0, 0, 1, 0, 0, 1, 0, 1, 0, 1], [1, 0, 1, 0, 1, 1, 0, 0, 0, 0], [0, 0, 0, 0, 1, 1, 0, 0, 0, 1]])
  end
end
