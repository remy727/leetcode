# frozen_string_literal: true

# 188. Best Time to Buy and Sell Stock IV
# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv
# Hard

=begin
You are given an integer array prices where prices[i] is the price of a given stock on the ith day, and an integer k.

Find the maximum profit you can achieve. You may complete at most k transactions: i.e. you may buy at most k times and sell at most k times.

Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

Example 1:
Input: k = 2, prices = [2,4,1]
Output: 2
Explanation: Buy on day 1 (price = 2) and sell on day 2 (price = 4), profit = 4-2 = 2.

Example 2:
Input: k = 2, prices = [3,2,6,5,0,3]
Output: 7
Explanation: Buy on day 2 (price = 2) and sell on day 3 (price = 6), profit = 6-2 = 4. Then buy on day 5 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.

Constraints:
1 <= k <= 100
1 <= prices.length <= 1000
0 <= prices[i] <= 1000
=end

# @param {Integer} k
# @param {Integer[]} prices
# @return {Integer}
def max_profit(k, prices)
  return 0 if prices.count < 2

  n = prices.count
  if k > n / 2
    differences = (1..prices.count - 1).reduce([]) { |ar, i| ar << (prices[i] - prices[i - 1]) }
    return differences.select { |num| num > 0 }.reduce(:+) || 0
  end

  d = Array.new(k + 1) { Array.new(n + 1) { 0 } }
  (1..k).each do |i|
    tmp_max = d[i - 1][0] - prices[0]

    (1..n - 1).each do |j|
      d[i][j] = [ d[i][j - 1], prices[j] + tmp_max ].max
      tmp_max = [ tmp_max, d[i - 1][j] - prices[j] ].max
    end
  end

  d[k][n - 1]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_profit < Test::Unit::TestCase
  def test_
    assert_equal 2, max_profit(2, [2, 4, 1])
    assert_equal 7, max_profit(2, [3, 2, 6, 5, 0, 3])
  end
end
