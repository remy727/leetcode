# frozen_string_literal: true

# 2218. Maximum Value of K Coins From Piles
# https://leetcode.com/problems/maximum-value-of-k-coins-from-piles/

=begin

There are n piles of coins on a table. Each pile consists of a positive number of coins of assorted denominations.

In one move, you can choose any coin on top of any pile, remove it, and add it to your wallet.

Given a list piles, where piles[i] is a list of integers denoting the composition of the ith pile from top to bottom, and a positive integer k, return the maximum total value of coins you can have in your wallet if you choose exactly k coins optimally.

### Example 1:
Input: piles = [[1,100,3],[7,8,9]], k = 2
Output: 101
Explanation:
The above diagram shows the different ways we can choose k coins.
The maximum total we can obtain is 101.

### Example 2:
Input: piles = [[100],[100],[100],[100],[100],[100],[1,1,1,1,1,1,700]], k = 7
Output: 706
Explanation:
The maximum total can be obtained if we choose all coins from the last pile.

### Constraints:
* n == piles.length
* 1 <= n <= 1000
* 1 <= piles[i][j] <= 105
* 1 <= k <= sum(piles[i].length) <= 2000
=end

# @param {Integer[][]} piles
# @param {Integer} k
# @return {Integer}
def max_value_of_coins(piles, k)
  dp = Array.new(piles.size + 1) { Array.new(k + 1, -1) }
  solve(0, k, piles, dp)
end

def solve(i, kk, piles, dp)
  return 0 if i >= piles.size || !kk.positive?

  return dp[i][kk] if dp[i][kk] != -1

  cur = 0
  max_val = solve(i + 1, kk, piles, dp)
  [piles[i].size, kk].min.times do |j|
    cur += piles[i][j]
    max_val = [max_val, cur + solve(i + 1, kk - j - 1, piles, dp)].max
  end

  dp[i][kk] = max_val
  max_val
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_value_of_coins < Test::Unit::TestCase
  def test_
    assert_equal 101, max_value_of_coins([[1, 100, 3], [7, 8, 9]], 2)
    assert_equal 706, max_value_of_coins([[100], [100], [100], [100], [100], [100], [1, 1, 1, 1, 1, 1, 700]], 7)
  end
end
