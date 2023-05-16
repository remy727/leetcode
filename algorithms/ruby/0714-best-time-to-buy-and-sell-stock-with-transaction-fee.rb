# frozen_string_literal: true

# 714. Best Time to Buy and Sell Stock with Transaction
# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee
# Medium

=begin
You are given an array prices where prices[i] is the price of a given stock on the ith day, and an integer fee representing a transaction fee.

Find the maximum profit you can achieve. You may complete as many transactions as you like, but you need to pay the transaction fee for each transaction.

Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

Example 1:
Input: prices = [1,3,2,8,4,9], fee = 2
Output: 8
Explanation: The maximum profit can be achieved by:
- Buying at prices[0] = 1
- Selling at prices[3] = 8
- Buying at prices[4] = 4
- Selling at prices[5] = 9
The total profit is ((8 - 1) - 2) + ((9 - 4) - 2) = 8.

Example 2:
Input: prices = [1,3,7,5,10,3], fee = 3
Output: 6

Constraints:
1 <= prices.length <= 5 * 104
1 <= prices[i] < 5 * 104
0 <= fee < 5 * 104
=end

# @param {Integer[]} prices
# @param {Integer} fee
# @return {Integer}
def max_profit(prices, fee)
  dp_hold, dp_not_hold = -Float::INFINITY, 0

  prices.each do |price|
    dp_not_hold = [dp_not_hold, dp_hold + price].max
    dp_hold = [dp_hold, dp_not_hold - price - fee].max
  end

  dp_not_hold
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_max_profit < Test::Unit::TestCase
  def test_
    assert_equal 8, max_profit([1, 3, 2, 8, 4, 9], 2)
    assert_equal 6, max_profit([1, 3, 7, 5, 10, 3], 3)
  end
end
