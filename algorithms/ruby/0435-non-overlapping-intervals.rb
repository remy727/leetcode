# frozen_string_literal: true

# 435. Non-overlapping Intervals
# https://leetcode.com/problems/non-overlapping-intervals
# Medium

=begin
Given an array of intervals intervals where intervals[i] = [starti, endi], return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.

Example 1:
Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
Output: 1
Explanation: [1,3] can be removed and the rest of the intervals are non-overlapping.

Example 2:
Input: intervals = [[1,2],[1,2],[1,2]]
Output: 2
Explanation: You need to remove two [1,2] to make the rest of the intervals non-overlapping.

Example 3:
Input: intervals = [[1,2],[2,3]]
Output: 0
Explanation: You don't need to remove any of the intervals since they're already non-overlapping.

Constraints:
1 <= intervals.length <= 105
intervals[i].length == 2
-5 * 104 <= starti < endi <= 5 * 104
=end

# @param {Integer[][]} intervals
# @return {Integer}
def erase_overlap_intervals(intervals)
  return 0 if intervals.count <= 1

  result = 0
  end_point = -Float::INFINITY
  intervals.sort_by(&:last).each do |interval|
    if interval.first >= end_point
      end_point = interval.last
    else
      result += 1
    end
  end

  result
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_erase_overlap_intervals < Test::Unit::TestCase
  def test_
    assert_equal 1, erase_overlap_intervals([[1, 2], [2, 3], [3, 4], [1, 3]])
    assert_equal 2, erase_overlap_intervals([[1, 2], [1, 2], [1, 2]])
    assert_equal 0, erase_overlap_intervals([[1, 2], [2, 3]])
  end
end
