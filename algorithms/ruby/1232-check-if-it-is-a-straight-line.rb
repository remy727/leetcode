# frozen_string_literal: true

# https://leetcode.com/problems/check-if-it-is-a-straight-line
# 1232. Check If It Is a Straight Line
# Easy

=begin
You are given an array coordinates, coordinates[i] = [x, y], where [x, y] represents the coordinate of a point. Check if these points make a straight line in the XY plane.

Example 1:
Input: coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
Output: true

Example 2:
Input: coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
Output: false

Constraints:
* 2 <= coordinates.length <= 1000
* coordinates[i].length == 2
* -10^4 <= coordinates[i][0], coordinates[i][1] <= 10^4
* coordinates contains no duplicate point.
=end

# @param {Integer[][]} coordinates
# @return {Boolean}
def check_straight_line(coordinates)
  x1, y1 = coordinates.shift
  x2, y2 = coordinates.shift
  coordinates.each do |a, b|
    if (x2 - x1) * (b - y1) != (y2 - y1) * (a - x1)
      return false
    end
  end
  true
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_check_straight_line < Test::Unit::TestCase
  def test_
    assert_equal true, check_straight_line([[1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7]])
    assert_equal false, check_straight_line([[1, 1], [2, 2], [3, 4], [4, 5], [5, 6], [7, 7]])
  end
end
