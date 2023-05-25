# frozen_string_literal: true

# 837. New 21 Game
# https://leetcode.com/problems/new-21-game
# Medium

=begin
Alice plays the following game, loosely based on the card game "21".

Alice starts with 0 points and draws numbers while she has less than k points. During each draw, she gains an integer number of points randomly from the range [1, maxPts], where maxPts is an integer. Each draw is independent and the outcomes have equal probabilities.

Alice stops drawing numbers when she gets k or more points.

Return the probability that Alice has n or fewer points.

Answers within 10**-5 of the actual answer are considered accepted.

Example 1:
Input: n = 10, k = 1, maxPts = 10
Output: 1.00000
Explanation: Alice gets a single card, then stops.

Example 2:
Input: n = 6, k = 1, maxPts = 10
Output: 0.60000
Explanation: Alice gets a single card, then stops.
In 6 out of 10 possibilities, she is at or below 6 points.

Example 3:
Input: n = 21, k = 17, maxPts = 10
Output: 0.73278

Constraints:
0 <= k <= n <= 104
1 <= maxPts <= 104
=end

# @param {Integer} n
# @param {Integer} k
# @param {Integer} max_pts
# @return {Float}
def new21_game(n, k, max_pts)
  return 1 if k - 1 + max_pts <= n

  result = Array.new(k + max_pts, 0.0)

  k.upto(n) do |i|
    result[i] = 1
  end

  sum = result[k...(k + max_pts)].sum

  (k - 1).downto(0) do |i|
    result[i] = sum / max_pts
    sum += result[i] - result[i + max_pts]
  end

  result[0].round(5)
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_new21_game < Test::Unit::TestCase
  def test_
    assert_equal 1.00000, new21_game(10, 1, 10)
    assert_equal 0.60000, new21_game(6, 1, 10)
    assert_equal 0.73278, new21_game(21, 17, 10)
  end
end
