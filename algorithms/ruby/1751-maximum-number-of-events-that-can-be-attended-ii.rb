# frozen_string_literal: true

# 1751. Maximum Number of Events That Can Be Attended II
# Hard
# https://leetcode.com/problems/maximum-number-of-events-that-can-be-attended-ii

=begin
You are given an array of events where events[i] = [startDayi, endDayi, valuei]. The ith event starts at startDayi and ends at endDayi, and if you attend this event, you will receive a value of valuei. You are also given an integer k which represents the maximum number of events you can attend.
You can only attend one event at a time. If you choose to attend an event, you must attend the entire event. Note that the end day is inclusive: that is, you cannot attend two events where one of them starts and the other ends on the same day.
Return the maximum sum of values that you can receive by attending events.

Input: events = [[1,2,4],[3,4,3],[2,3,1]], k = 2
Output: 7
Explanation: Choose the green events, 0 and 1 (0-indexed) for a total value of 4 + 3 = 7.

Input: events = [[1,2,4],[3,4,3],[2,3,10]], k = 2
Output: 10
Explanation: Choose event 2 for a total value of 10.
Notice that you cannot attend any other event as they overlap, and that you do not have to attend k events.

Input: events = [[1,1,1],[2,2,2],[3,3,3],[4,4,4]], k = 3
Output: 9
Explanation: Although the events do not overlap, you can only attend 3 events. Pick the highest valued three.

Constraints:
* 1 <= k <= events.length
* 1 <= k * events.length <= 106
* 1 <= startDayi <= endDayi <= 109
* 1 <= valuei <= 106
=end

# @param {Integer[][]} events
# @param {Integer} k
# @return {Integer}
def max_value(events, k)
  events.sort_by! { |event| event[1] }
  dp = Array.new(events.size + 1) { Array.new(k + 1, 0) }
  events.unshift([0, 0, 0])

  for i in 1..events.size - 1
    for j in 1..k
      l = 0
      r = i - 1
      while l < r
        mid = l + (r - l + 1) / 2
        if events[mid][1] < events[i][0]
          l = mid
        else
          r = mid - 1
        end
      end

      dp[i][j] = [dp[i - 1][j], dp[l][j - 1] + events[i][2]].max
    end
  end

  dp[events.size - 1][k]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_value < Test::Unit::TestCase
  def test_
    assert_equal 7, max_value([[1, 2, 4], [3, 4, 3], [2, 3, 1]], 2)
    assert_equal 10, max_value([[1, 2, 4], [3, 4, 3], [2, 3, 10]], 2)
    assert_equal 9, max_value([[1, 1, 1], [2, 2, 2], [3, 3, 3], [4, 4, 4]], 3)
  end
end
