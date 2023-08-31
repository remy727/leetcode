# frozen_string_literal: true

# 1326. Minimum Number of Taps to Open to Water a Garden
# Hard
# https://leetcode.com/problems/minimum-number-of-taps-to-open-to-water-a-garden

=begin
There is a one-dimensional garden on the x-axis. The garden starts at the point 0 and ends at the point n. (i.e The length of the garden is n).
There are n + 1 taps located at points [0, 1, ..., n] in the garden.
Given an integer n and an integer array ranges of length n + 1 where ranges[i] (0-indexed) means the i-th tap can water the area [i - ranges[i], i + ranges[i]] if it was open.
Return the minimum number of taps that should be open to water the whole garden, If the garden cannot be watered return -1.

Example 1:
Input: n = 5, ranges = [3,4,1,1,0,0]
Output: 1
Explanation: The tap at point 0 can cover the interval [-3,3]
The tap at point 1 can cover the interval [-3,5]
The tap at point 2 can cover the interval [1,3]
The tap at point 3 can cover the interval [2,4]
The tap at point 4 can cover the interval [4,4]
The tap at point 5 can cover the interval [5,5]
Opening Only the second tap will water the whole garden [0,5]

Example 2:
Input: n = 3, ranges = [0,0,0,0]
Output: -1
Explanation: Even if you activate all the four taps you cannot water the whole garden.

Constraints:
1 <= n <= 104
ranges.length == n + 1
0 <= ranges[i] <= 100
=end

# @param {Integer} n
# @param {Integer[]} ranges
# @return {Integer}
def min_taps(n, ranges)
  intervals = ranges.filter_map.with_index { |range, index| [index - range, index + range] if range > 0 }
  intervals.sort_by!(&:first)

  garden_max_index = n
  intervals << [garden_max_index, garden_max_index]

  count = 0
  current_index = 0
  next_index = 0
  intervals.each do |start_index, end_index|
    return -1 if start_index > next_index

    if start_index > current_index
      count += 1
      current_index = next_index
    end

    next_index = end_index if end_index > next_index
  end

  count
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_min_taps < Test::Unit::TestCase
  def test_
    assert_equal 1, min_taps(5, [3, 4, 1, 1, 0, 0])
    assert_equal(-1, min_taps(3, [0, 0, 0, 0]))
  end
end
