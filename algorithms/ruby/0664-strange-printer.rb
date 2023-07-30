# frozen_string_literal: true

# 664. Strange Printer
# Hard
# https://leetcode.com/problems/strange-printer

=begin
There is a strange printer with the following two special properties:
* The printer can only print a sequence of the same character each time.
* At each turn, the printer can print new characters starting from and ending at any place and will cover the original existing characters.
Given a string s, return the minimum number of turns the printer needed to print it.

Example 1:
Input: s = "aaabbb"
Output: 2
Explanation: Print "aaa" first and then print "bbb".

Example 2:
Input: s = "aba"
Output: 2
Explanation: Print "aaa" first and then print "b" from the second place of the string, which will cover the existing character 'a'.

Constraints:
* 1 <= s.length <= 100
* s consists of lowercase English letters.
=end

# @param {String} s
# @return {Integer}
def strange_printer(s)
  n = s.size
  dp = Array.new(n) { Array.new(n, 0) }

  (n - 1).downto(0) do |i|
    dp[i][i] = 1
    (i + 1...n).each do |j|
      dp[i][j] = dp[i][j - 1] + 1
      (i...j).each do |k|
        if s[k] == s[j]
          dp[i][j] = [dp[i][j], dp[i][k] + (k + 1 <= j - 1 ? dp[k + 1][j - 1] : 0)].min
        end
      end
    end
  end

  dp[0][n - 1]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_strange_printer < Test::Unit::TestCase
  def test_
    assert_equal 2, strange_printer("aaabbb")
    assert_equal 2, strange_printer("aba")
  end
end
