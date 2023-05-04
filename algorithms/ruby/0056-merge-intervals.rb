# frozen_string_literal: true

# 56. Merge Intervals
# https://leetcode.com/problems/merge-intervals
# Medium

=begin
Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

Example 1:
Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].

Example 2:
Input: intervals = [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.

Constraints:
* 1 <= intervals.length <= 104
* intervals[i].length == 2
* 0 <= starti <= endi <= 104
=end

# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
  result = []

  intervals.sort_by { |interval| interval[0] }.each do |interval|
    if !result.empty? && interval[0] <= result[-1][1]
      result[-1][1] = [result[-1][1], interval[1]].max
    else
      result << interval
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
    assert_equal([[1, 6], [8, 10], [15, 18]], merge([[1, 3], [2, 6], [8, 10], [15, 18]]))
    assert_equal([[1, 5]], merge([[1, 4], [4, 5]]))
  end
end
