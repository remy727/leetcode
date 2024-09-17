# frozen_string_literal: true

# 539. Minimum Time Difference
# https://leetcode.com/problems/minimum-time-difference
# Medium

=begin
Given a list of 24-hour clock time points in "HH:MM" format, return the minimum minutes difference between any two time-points in the list.

Example 1:
Input: timePoints = ["23:59","00:00"]
Output: 1

Example 2:
Input: timePoints = ["00:00","23:59","00:00"]
Output: 0


Constraints:
* 2 <= timePoints.length <= 2 * 104
* timePoints[i] is in the format "HH:MM".
=end


# @param {String[]} time_points
# @return {Integer}
def find_min_difference(time_points)
  return 0 if time_points.size > 1440

  time_points.map! { |time| time.split(":").map(&:to_i).reduce(0) { |h, m| h * 60 + m } }.sort!
  time_points << time_points[0] + 1440
  time_points.each_cons(2).map { |a, b| b - a }.min
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_find_min_difference < Test::Unit::TestCase
  def test_
    assert_equal 1, find_min_difference(["23:59", "00:00"])
    assert_equal 0, find_min_difference(["00:00", "23:59", "00:00"])
  end
end
