# frozen_string_literal: true

# 934. Shortest Bridge
# https://leetcode.com/problems/shortest-bridge
# Medium

=begin
You are given an n x n binary matrix grid where 1 represents land and 0 represents water.

An island is a 4-directionally connected group of 1's not connected to any other 1's. There are exactly two islands in grid.

You may change 0's to 1's to connect the two islands to form one island.

Return the smallest number of 0's you must flip to connect the two islands.

Example 1:
Input: grid = [[0,1],[1,0]]
Output: 1

Example 2:
Input: grid = [[0,1,0],[0,0,0],[0,0,1]]
Output: 2

Example 3:
Input: grid = [[1,1,1,1,1],[1,0,0,0,1],[1,0,1,0,1],[1,0,0,0,1],[1,1,1,1,1]]
Output: 1

Constraints:
n == grid.length == grid[i].length
2 <= n <= 100
grid[i][j] is either 0 or 1.
There are exactly two islands in grid.
=end

# @param {Integer[][]} grid
# @return {Integer}
def shortest_bridge(grid)
  n = grid.size - 1
  i = 0

  queue = []
  while i <= n
    j = 0

    while j <= n
      if grid[i][j] == 1
        add_to_queue(queue, grid, i, j, 0)
        return find_shortest(queue, grid, n)
      end

      j += 1
    end

    i += 1
  end
end

def find_shortest(queue, grid, n)
  k = 0
  while (i, j, _ = queue[k])
    add_to_queue(queue, grid, i - 1, j, 0) if i > 0 && grid[i - 1][j] == 1
    add_to_queue(queue, grid, i + 1, j, 0) if i < n && grid[i + 1][j] == 1
    add_to_queue(queue, grid, i, j - 1, 0) if j > 0 && grid[i][j - 1] == 1
    add_to_queue(queue, grid, i, j + 1, 0) if j < n && grid[i][j + 1] == 1
    k += 1
  end

  while (i, j, distance = queue.shift)
    if i > 0 && grid[i - 1][j] < 2 && add_to_queue(queue, grid, i - 1, j, distance + 1) ||
       i < n && grid[i + 1][j] < 2 && add_to_queue(queue, grid, i + 1, j, distance + 1) ||
       j > 0 && grid[i][j - 1] < 2 && add_to_queue(queue, grid, i, j - 1, distance + 1) ||
       j < n && grid[i][j + 1] < 2 && add_to_queue(queue, grid, i, j + 1, distance + 1)
      return distance
    end
  end

  -1
end

def add_to_queue(queue, grid, i, j, distance)
  grid_val = grid[i][j]
  grid[i][j] = 2
  queue << [i, j, distance]
  grid_val == 1
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_shortest_bridge < Test::Unit::TestCase
  def test_
    assert_equal 1, shortest_bridge([[0, 1], [1, 0]])
    assert_equal 2, shortest_bridge([[0, 1, 0], [0, 0, 0], [0, 0, 1]])
    assert_equal 1, shortest_bridge([[1, 1, 1, 1, 1], [1, 0, 0, 0, 1], [1, 0, 1, 0, 1], [1, 0, 0, 0, 1], [1, 1, 1, 1, 1]])
  end
end
