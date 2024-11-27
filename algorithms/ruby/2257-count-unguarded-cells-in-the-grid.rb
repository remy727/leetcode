# frozen_string_literal: true

# 2257. Count Unguarded Cells in the Grid
# https://leetcode.com/problems/count-unguarded-cells-in-the-grid
# Medium

=begin
You are given two integers m and n representing a 0-indexed m x n grid. You are also given two 2D integer arrays guards and walls where guards[i] = [rowi, coli] and walls[j] = [rowj, colj] represent the positions of the ith guard and jth wall respectively.
A guard can see every cell in the four cardinal directions (north, east, south, or west) starting from their position unless obstructed by a wall or another guard. A cell is guarded if there is at least one guard that can see it.
Return the number of unoccupied cells that are not guarded.

Example 1:
Input: m = 4, n = 6, guards = [[0,0],[1,1],[2,3]], walls = [[0,1],[2,2],[1,4]]
Output: 7
Explanation: The guarded and unguarded cells are shown in red and green respectively in the above diagram.
There are a total of 7 unguarded cells, so we return 7.

Example 2:
Input: m = 3, n = 3, guards = [[1,1]], walls = [[0,1],[1,0],[2,1],[1,2]]
Output: 4
Explanation: The unguarded cells are shown in green in the above diagram.
There are a total of 4 unguarded cells, so we return 4.

Constraints:
* 1 <= m, n <= 10^5
* 2 <= m * n <= 10^5
* 1 <= guards.length, walls.length <= 5 * 10^4
* 2 <= guards.length + walls.length <= m * n
* guards[i].length == walls[j].length == 2
* 0 <= rowi, rowj < m
* 0 <= coli, colj < n
* All the positions in guards and walls are unique.
=end

# @param {Integer} m
# @param {Integer} n
# @param {Integer[][]} guards
# @param {Integer[][]} walls
# @return {Integer}
def count_unguarded(m, n, guards, walls)
  not_guarded = m * n - walls.size
  g = Array.new(m) { Array.new(n, 0) }
  dir = [0, 1, 0, -1, 0]

  walls.each do |wall|
    g[wall[0]][wall[1]] = 15
  end

  guards.each do |gd|
    4.times do |d|
      i, j = gd[0], gd[1]
      while [i, j].min >= 0 && i < m && j < n && (g[i][j] & (1 << d)) == 0
        not_guarded -= 1 if g[i][j] == 0
        g[i][j] += (1 << d)
        i += dir[d]
        j += dir[d + 1]
      end
    end
  end

  not_guarded
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_count_unguarded < Test::Unit::TestCase
  def test_
    assert_equal 7, count_unguarded(4, 6, [[0, 0], [1, 1], [2, 3]], [[0, 1], [2, 2], [1, 4]])
    assert_equal 4, count_unguarded(3, 3, [[1, 1]], [[0, 1], [1, 0], [2, 1], [1, 2]])
  end
end
