# frozen_string_literal: true

# 459. Repeated Substring Pattern
# Easy
# https://leetcode.com/problems/repeated-substring-pattern

=begin
Given a string s, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together.

Example 1:
Input: s = "abab"
Output: true
Explanation: It is the substring "ab" twice.

Example 2:
Input: s = "aba"
Output: false

Example 3:
Input: s = "abcabcabcabc"
Output: true
Explanation: It is the substring "abc" four times or the substring "abcabc" twice.

Constraints:
1 <= s.length <= 104
s consists of lowercase English letters.
=end

# @param {String} s
# @return {Boolean}
def repeated_substring_pattern(s)
  str = s + s
  str[1...-1].include? s
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_repeated_substring_pattern < Test::Unit::TestCase
  def test_
    assert_equal true, repeated_substring_pattern("abab")
    assert_equal false, repeated_substring_pattern("aba")
    assert_equal true, repeated_substring_pattern("abcabcabcabc")
  end
end
