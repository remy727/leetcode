# frozen_string_literal: true

# 739. Daily Temperatures
# https://leetcode.com/problems/daily-temperatures
# Medium

=begin
Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature. If there is no future day for which this is possible, keep answer[i] == 0 instead.

Example 1:
Input: temperatures = [73,74,75,71,69,72,76,73]
Output: [1,1,4,2,1,1,0,0]

Example 2:
Input: temperatures = [30,40,50,60]
Output: [1,1,1,0]

Example 3:
Input: temperatures = [30,60,90]
Output: [1,1,0]

Constraints:
1 <= temperatures.length <= 105
30 <= temperatures[i] <= 100
=end

# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
  t = temperatures
  s = []
  si = []
  answer = Array.new(t.size, 0)
  t.each_with_index do |v, i|
    while (!s.empty?) && s.last < v
      s.pop()
      j = si.pop()
      answer[j] = i - j
    end
    s.push(v)
    si.push(i)
  end
  answer
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_daily_temperatures < Test::Unit::TestCase
  def test_
    assert_equal [1, 1, 4, 2, 1, 1, 0, 0], daily_temperatures([73, 74, 75, 71, 69, 72, 76, 73])
    assert_equal [1, 1, 1, 0], daily_temperatures([30, 40, 50, 60])
    assert_equal [1, 1, 0], daily_temperatures([30, 60, 90])
  end
end
