# frozen_string_literal: true

# 518. Coin Change II
# Medium
# https://leetcode.com/problems/coin-change-ii

=begin
You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.
Return the number of combinations that make up that amount. If that amount of money cannot be made up by any combination of the coins, return 0.
You may assume that you have an infinite number of each kind of coin.
The answer is guaranteed to fit into a signed 32-bit integer.

Example 1:
Input: amount = 5, coins = [1,2,5]
Output: 4
Explanation: there are four ways to make up the amount:
5=5
5=2+2+1
5=2+1+1+1
5=1+1+1+1+1

Example 2:
Input: amount = 3, coins = [2]
Output: 0
Explanation: the amount of 3 cannot be made up just with coins of 2.

Example 3:
Input: amount = 10, coins = [10]
Output: 1

Constraints:
* 1 <= coins.length <= 300
* 1 <= coins[i] <= 5000
* All the values of coins are unique.
* 0 <= amount <= 5000
=end

# @param {Integer} amount
# @param {Integer[]} coins
# @return {Integer}
def change(amount, coins)
  dp = Array.new(amount + 1, 0)
  dp[0] = 1
  coins.each do |coin|
    (coin..amount).each do |x|
      dp[x] += dp[x - coin]
    end
  end
  dp[amount]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_length_of_longest_substring < Test::Unit::TestCase
  def test_
    assert_equal 4, change(5, [1, 2, 5])
    assert_equal 0, change(3, [2])
    assert_equal 1, change(10, [10])
  end
end
