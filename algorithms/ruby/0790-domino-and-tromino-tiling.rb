# frozen_string_literal: true

# 790. Domino and Tromino Tiling
# https://leetcode.com/problems/domino-and-tromino-tiling
# Medium

=begin
You have two types of tiles: a 2 x 1 domino shape and a tromino shape. You may rotate these shapes.

Given an integer n, return the number of ways to tile an 2 x n board. Since the answer may be very large, return it modulo 109 + 7.

In a tiling, every square must be covered by a tile. Two tilings are different if and only if there are two 4-directionally adjacent cells on the board such that exactly one of the tilings has both squares occupied by a tile.

Example 1:
Input: n = 3
Output: 5
Explanation: The five different ways are show above.

Example 2:
Input: n = 1
Output: 1

Constraints:
1 <= n <= 1000
=end

# @param {Integer} n
# @return {Integer}
MOD = 10**9 + 7
def num_tilings(n)
  dp = Array.new(3) { Array.new(2, 0) }
  dp[1] = [1, 1]
  dp[2] = [2, 2]
  (3..n).each do |i|
    dp[i % 3][0] = dp[(i - 1) % 3][0] + dp[(i - 2) % 3][0] + 2 * dp[(i - 2) % 3][1]
    dp[i % 3][1] = dp[(i - 1) % 3][0] + dp[(i - 1) % 3][1]
  end
  dp[n % 3][0] % MOD
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_num_tilings < Test::Unit::TestCase
  def test_
    assert_equal 5, num_tilings(3)
    assert_equal 1, num_tilings(1)
  end
end
