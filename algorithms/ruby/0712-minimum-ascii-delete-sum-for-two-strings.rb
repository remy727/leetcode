# frozen_string_literal: true

# 712. Minimum ASCII Delete Sum for Two Strings
# Medium
# https://leetcode.com/problems/minimum-ascii-delete-sum-for-two-strings

=begin
Given two strings s1 and s2, return the lowest ASCII sum of deleted characters to make two strings equal.

Example 1:
Input: s1 = "sea", s2 = "eat"
Output: 231
Explanation: Deleting "s" from "sea" adds the ASCII value of "s" (115) to the sum.
Deleting "t" from "eat" adds 116 to the sum.
At the end, both strings are equal, and 115 + 116 = 231 is the minimum sum possible to achieve this.

Example 2:
Input: s1 = "delete", s2 = "leet"
Output: 403
Explanation: Deleting "dee" from "delete" to turn the string into "let",
adds 100[d] + 101[e] + 101[e] to the sum.
Deleting "e" from "leet" adds 101[e] to the sum.
At the end, both strings are equal to "let", and the answer is 100+101+101+101 = 403.
If instead we turned both strings into "lee" or "eet", we would get answers of 433 or 417, which are higher.

Constraints:
* 1 <= s1.length, s2.length <= 1000
* s1 and s2 consist of lowercase English letters.
=end

# @param {String} s1
# @param {String} s2
# @return {Integer}
def minimum_delete_sum(s1, s2)
  dp = Array.new(s1.size + 1) { Array.new(s2.size + 1, 0) }

  (1..s1.length).each do |i|
    dp[i][0] = dp[i - 1][0] + s1[i - 1].ord
  end

  (1..s2.length).each do |j|
    dp[0][j] = dp[0][j - 1] + s2[j - 1].ord
  end

  (1..s1.length).each do |i|
    (1..s2.length).each do |j|
      if s1[i - 1] == s2[j - 1]
        dp[i][j] = dp[i - 1][j - 1]
      else
        dp[i][j] = [dp[i - 1][j] + s1[i - 1].ord, dp[i][j - 1] + s2[j - 1].ord].min
      end
    end
  end

  dp[s1.length][s2.length]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_minimum_delete_sum < Test::Unit::TestCase
  def test_
    assert_equal 231, minimum_delete_sum("sea", "eat")
    assert_equal 403, minimum_delete_sum("delete", "leet")
  end
end
