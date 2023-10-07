# frozen_string_literal: true

# 1420. Build Array Where You Can Find The Maximum Exactly K Comparisons
# Hard
# https://leetcode.com/problems/build-array-where-you-can-find-the-maximum-exactly-k-comparisons

=begin
You are given three integers n, m and k. Consider the following algorithm to find the maximum element of an array of positive integers:
You should build the array arr which has the following properties:
* arr has exactly n integers.
* 1 <= arr[i] <= m where (0 <= i < n).
* After applying the mentioned algorithm to arr, the value search_cost is equal to k.
Return the number of ways to build the array arr under the mentioned conditions. As the answer may grow large, the answer must be computed modulo 109 + 7.

Example 1:
Input: n = 2, m = 3, k = 1
Output: 6
Explanation: The possible arrays are [1, 1], [2, 1], [2, 2], [3, 1], [3, 2] [3, 3]

Example 2:
Input: n = 5, m = 2, k = 3
Output: 0
Explanation: There are no possible arrays that satisify the mentioned conditions.

Example 3:
Input: n = 9, m = 1, k = 1
Output: 1
Explanation: The only possible array is [1, 1, 1, 1, 1, 1, 1, 1, 1]

Constraints:
* 1 <= n <= 50
* 1 <= m <= 100
* 0 <= k <= n
=end

# @param {Integer} n
# @param {Integer} m
# @param {Integer} k
# @return {Integer}
MOD = 1_000_000_007

def num_of_arrays(n, m, k)
  dp = Array.new(n + 1) { Array.new(m + 1) { Array.new(k + 1, 0) } }

  1.upto(m) do |i|
    dp[1][i][1] = 1
  end

  2.upto(n) do |len|
    1.upto(m) do |max_val|
      1.upto(k) do |cost|
        sum = 0
        1.upto(max_val - 1) do |i|
          sum = (sum + dp[len - 1][i][cost - 1]) % MOD
        end
        dp[len][max_val][cost] = (dp[len - 1][max_val][cost] * max_val + sum) % MOD
      end
    end
  end

  ans = 0
  1.upto(m) do |i|
    ans = (ans + dp[n][i][k]) % MOD
  end

  ans
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_num_of_arrays < Test::Unit::TestCase
  def test_
    assert_equal 6, num_of_arrays(2, 3, 1)
    assert_equal 0, num_of_arrays(5, 2, 3)
    assert_equal 1, num_of_arrays(9, 1, 1)
  end
end
