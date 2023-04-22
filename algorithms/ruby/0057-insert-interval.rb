# frozen_string_literal: true

# 57. Insert Interval
# https://leetcode.com/problems/insert-interval
# Difficulty: Medium

=begin
You are given an array of non-overlapping intervals intervals where intervals[i] = [starti, endi] represent the start and the end of the ith interval and intervals is sorted in ascending order by starti. You are also given an interval newInterval = [start, end] that represents the start and end of another interval.

Insert newInterval into intervals such that intervals is still sorted in ascending order by starti and intervals still does not have any overlapping intervals (merge overlapping intervals if necessary).

Return intervals after the insertion.

Example 1:
Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
Output: [[1,5],[6,9]]

Example 2:
Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
Output: [[1,2],[3,10],[12,16]]
Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].

Constraints:
* 0 <= intervals.length <= 104
* intervals[i].length == 2
* 0 <= starti <= endi <= 105
* intervals is sorted by starti in ascending order.
* newInterval.length == 2
* 0 <= start <= end <= 105
=end

# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, new_interval)
  result = []

  (intervals + [new_interval]).sort.each do |interval|
    if result.empty? || result.last[1] < interval[0]
      result << interval
    else
      result[-1][1] = [result.last[1], interval[1]].max
    end
  end

  result
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_merge < Test::Unit::TestCase
  def test_
    assert_equal([[1, 5], [6, 9]], insert([[1, 3], [6, 9]], [2, 5]))
    assert_equal([[1, 2], [3, 10], [12, 16]], insert([[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], [4, 8]))
  end
end
