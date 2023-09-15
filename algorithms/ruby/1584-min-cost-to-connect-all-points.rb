# frozen_string_literal: true

# 1584. Min Cost to Connect All Points
# Medium
# https://leetcode.com/problems/min-cost-to-connect-all-points

=begin
You are given an array points representing integer coordinates of some points on a 2D-plane, where points[i] = [xi, yi].
The cost of connecting two points [xi, yi] and [xj, yj] is the manhattan distance between them: |xi - xj| + |yi - yj|, where |val| denotes the absolute value of val.
Return the minimum cost to make all points connected. All points are connected if there is exactly one simple path between any two points.

Example 1:
Input: points = [[0,0],[2,2],[3,10],[5,2],[7,0]]
Output: 20
Explanation:
We can connect the points as shown above to get the minimum cost of 20.
Notice that there is a unique path between every pair of points.

Example 2:
Input: points = [[3,12],[-2,5],[-4,1]]
Output: 18

Constraints:
* 1 <= points.length <= 1000
* -106 <= xi, yi <= 106
* All pairs (xi, yi) are distinct.
=end

# @param {Integer[][]} points
# @return {Integer}
# @param {Integer[][]} points
# @return {Integer}
def min_cost_connect_points(points)
  return 0 if points.length == 1

  min_dist = Array.new(points.length, Float::MAX)
  cost = 0
  cur = 0
  connected_edges = 1
  len = points.length
  visited = Array.new(len, false)
  visited[0] = true
  while connected_edges < points.length
    min_edge = Float::MAX
    next_edge = -1
    (0..points.length - 1).each do |i|
      next if i == cur
      if !visited[i]
        dist = (points[cur][0] - points[i][0]).abs + (points[cur][1] - points[i][1]).abs
        min_dist[i] = [dist, min_dist[i]].min
        if min_edge > min_dist[i]
          min_edge = min_dist[i]
          next_edge = i
        end
      end
    end
    cost = cost + min_edge
    cur = next_edge
    visited[cur] = true
    connected_edges = connected_edges + 1
  end
  cost
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_min_cost_connect_points < Test::Unit::TestCase
  def test_
    assert_equal 20, min_cost_connect_points([[0, 0], [2, 2], [3, 10], [5, 2], [7, 0]])
    assert_equal 18, min_cost_connect_points([[3, 12], [-2, 5], [-4, 1]])
  end
end
