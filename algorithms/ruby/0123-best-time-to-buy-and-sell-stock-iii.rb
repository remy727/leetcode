# frozen_string_literal: true

# 123. Best Time to Buy and Sell Stock III
# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii
# Hard

=begin
You are given an array prices where prices[i] is the price of a given stock on the ith day.

Find the maximum profit you can achieve. You may complete at most two transactions.

Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

Example 1:
Input: prices = [3,3,5,0,0,3,1,4]
Output: 6
Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.

Example 2:
Input: prices = [1,2,3,4,5]
Output: 4
Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are engaging multiple transactions at the same time. You must sell before buying again.

Example 3:
Input: prices = [7,6,4,3,1]
Output: 0
Explanation: In this case, no transaction is done, i.e. max profit = 0.

Constraints:
1 <= prices.length <= 105
0 <= prices[i] <= 105
=end

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  cost1 = cost2 = 100000
  profit1 = profit2 = temp = 0
  prices.each do |price|
    cost1   = price if cost1 > price
    profit1 = temp  if profit1 < temp = price - cost1
    cost2   = temp  if cost2 > temp = price - profit1
    profit2 = temp  if profit2 < temp = price - cost2
  end
  profit2
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_profit < Test::Unit::TestCase
  def test_
    assert_equal 6, max_profit([3, 3, 5, 0, 0, 3, 1, 4])
    assert_equal 4, max_profit([1, 2, 3, 4, 5])
    assert_equal 0, max_profit([7, 6, 4, 3, 1])
  end
end
