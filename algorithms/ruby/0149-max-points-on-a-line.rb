# frozen_string_literal: true

# 149. Max Points on a Line
# https://leetcode.com/problems/max-points-on-a-line
# Hard

=begin
Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane, return the maximum number of points that lie on the same straight line.

Example 1:
Input: points = [[1,1],[2,2],[3,3]]
Output: 3

Example 2:
Input: points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
Output: 4

Constraints:
1 <= points.length <= 300
points[i].length == 2
-104 <= xi, yi <= 104
All the points are unique.
=end

# @param {Integer[][]} points
# @return {Integer}
def max_points(points)
  (points[0...-1].each_with_index.collect { |p, idx|
    points[idx + 1..-1].collect { |p1|
      dx = p.first - p1.first
      dx.zero? ? Float::INFINITY : Rational(p.last - p1.last, dx)
    }.tally.values.max
  }.max || 0) + 1
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_points < Test::Unit::TestCase
  def test_
    assert_equal 3, max_points([[1, 1], [2, 2], [3, 3]])
    assert_equal 4, max_points([[1, 1], [3, 2], [5, 3], [4, 1], [2, 3], [1, 4]])
  end
end
