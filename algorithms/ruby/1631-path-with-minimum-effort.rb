# frozen_string_literal: true

# 1631. Path With Minimum Effort
# Medium
# https://leetcode.com/problems/path-with-minimum-effort

=begin
You are a hiker preparing for an upcoming hike. You are given heights, a 2D array of size rows x columns, where heights[row][col] represents the height of cell (row, col). You are situated in the top-left cell, (0, 0), and you hope to travel to the bottom-right cell, (rows-1, columns-1) (i.e., 0-indexed). You can move up, down, left, or right, and you wish to find a route that requires the minimum effort.
A route's effort is the maximum absolute difference in heights between two consecutive cells of the route.
Return the minimum effort required to travel from the top-left cell to the bottom-right cell.

Example 1:
Input: heights = [[1,2,2],[3,8,2],[5,3,5]]
Output: 2
Explanation: The route of [1,3,5,3,5] has a maximum absolute difference of 2 in consecutive cells.
This is better than the route of [1,2,2,2,5], where the maximum absolute difference is 3.

Example 2:
Input: heights = [[1,2,3],[3,8,4],[5,3,5]]
Output: 1
Explanation: The route of [1,2,3,4,5] has a maximum absolute difference of 1 in consecutive cells, which is better than route [1,3,5,3,5].

Example 3:
Input: heights = [[1,2,1,1,1],[1,2,1,2,1],[1,2,1,2,1],[1,2,1,2,1],[1,1,1,2,1]]
Output: 0
Explanation: This route does not require any effort.

Constraints:
* rows == heights.length
* columns == heights[i].length
* 1 <= rows, columns <= 100
* 1 <= heights[i][j] <= 106
=end

# @param {Integer[][]} heights
# @return {Integer}
def minimum_effort_path(heights)
  h = heights.size
  w = heights[0].size
  queue = [[0, 0]]
  cost = Array.new(h).map { Array.new(w, Float::INFINITY) }
  cost[0][0] = 0
  directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]
  inside = ->(rr, cc) { rr.between?(0, h - 1) && cc.between?(0, w - 1) }
  while ! queue.empty?
    r, c = queue.pop()
    curr_h = heights[r][c]
    curr_c = cost[r][c]
    directions.each do |(dr, dc)|
      r1, c1 = r + dr, c + dc
      if inside[r1, c1]
        nh = heights[r1][c1]
        nc = (curr_h - nh).abs > curr_c ? (curr_h - nh).abs : curr_c
        if nc < cost[r1][c1]
          cost[r1][c1] = nc
          queue.unshift [r1, c1]
        end
      end
    end
  end
  cost[h - 1][w - 1]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_minimum_effort_path < Test::Unit::TestCase
  def test_
    assert_equal 2, minimum_effort_path([[1, 2, 2], [3, 8, 2], [5, 3, 5]])
    assert_equal 1, minimum_effort_path([[1, 2, 3], [3, 8, 4], [5, 3, 5]])
    assert_equal 0, minimum_effort_path([[1, 2, 1, 1, 1], [1, 2, 1, 2, 1], [1, 2, 1, 2, 1], [1, 2, 1, 2, 1], [1, 1, 1, 2, 1]])
  end
end
