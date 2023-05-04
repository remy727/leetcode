# frozen_string_literal: true

# 322. Coin Change
# https://leetcode.com/problems/coin-change/
# Medium

=begin

You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

You may assume that you have an infinite number of each kind of coin.

Example 1:
Input: coins = [1,2,5], amount = 11
Output: 3
Explanation: 11 = 5 + 5 + 1

Example 2:
Input: coins = [2], amount = 3
Output: -1

Example 3:
Input: coins = [1], amount = 0
Output: 0

Constraints:
1 <= coins.length <= 12
1 <= coins[i] <= 231 - 1
0 <= amount <= 104

=end

# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
INF = Float::INFINITY

def coin_change(coins, amount)
  dp = [INF] * (amount + 1)
  dp[0] = 0

  (1..amount).each do |i|
    coins.each do |j|
      if i - j >= 0 && dp[i - j] < INF
        dp[i] = [dp[i], 1 + dp[i - j]].min
      end
    end
  end

  dp[-1] < INF ? dp[-1] : -1
end
