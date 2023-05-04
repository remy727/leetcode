# frozen_string_literal: true

# 1312. Minimum Insertion Steps to Make a String Palindrome
# https://leetcode.com/problems/minimum-insertion-steps-to-make-a-string-palindrome/
# Hard

=begin
Given a string s. In one step you can insert any character at any index of the string.

Return the minimum number of steps to make s palindrome.

A Palindrome String is one that reads the same backward as well as forward.

Example 1:
Input: s = "zzazz"
Output: 0
Explanation: The string "zzazz" is already palindrome we do not need any insertions.

Example 2:
Input: s = "mbadm"
Output: 2
Explanation: String can be "mbdadbm" or "mdbabdm".

Example 3:
Input: s = "leetcode"
Output: 5
Explanation: Inserting 5 characters the string becomes "leetcodocteel".

Constraints:
* 1 <= s.length <= 500
* s consists of lowercase English letters.

=end

# @param {String} s
# @return {Integer}
def min_insertions(s, r = s.reverse)
  return 0 if s == r
  dp = Array.new(s.size + 1) { Array.new(r.size + 1) }
  (s.size + 1).times do |i|
    (r.size + 1).times do |j|
      if i == 0 || j == 0
        dp[i][j] = 0
      elsif s[i - 1] == r[j - 1]
        dp[i][j] = 1 + dp[i - 1][j - 1]
      else
        dp[i][j] = [dp[i][j - 1], dp[i - 1][j]].max
      end
    end
  end
  s.size - dp[-1][-1]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_min_insertions < Test::Unit::TestCase
  def test_
    assert_equal(0, min_insertions("zzazz"))
    assert_equal(2, min_insertions("mbadm"))
    assert_equal(5, min_insertions("leetcode"))
  end
end
