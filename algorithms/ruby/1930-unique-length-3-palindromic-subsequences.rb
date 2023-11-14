# frozen_string_literal: true

# 1930. Unique Length-3 Palindromic Subsequences
# Medium
# https://leetcode.com/problems/unique-length-3-palindromic-subsequences

=begin
Given a string s, return the number of unique palindromes of length three that are a subsequence of s.
Note that even if there are multiple ways to obtain the same subsequence, it is still only counted once.
A palindrome is a string that reads the same forwards and backwards.
A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.
* For example, "ace" is a subsequence of "abcde".

Example 1:
Input: s = "aabca"
Output: 3
Explanation: The 3 palindromic subsequences of length 3 are:
- "aba" (subsequence of "aabca")
- "aaa" (subsequence of "aabca")
- "aca" (subsequence of "aabca")

Example 2:
Input: s = "adc"
Output: 0
Explanation: There are no palindromic subsequences of length 3 in "adc".

Example 3:
Input: s = "bbcbaba"
Output: 4
Explanation: The 4 palindromic subsequences of length 3 are:
- "bbb" (subsequence of "bbcbaba")
- "bcb" (subsequence of "bbcbaba")
- "bab" (subsequence of "bbcbaba")
- "aba" (subsequence of "bbcbaba")

Constraints:
* 3 <= s.length <= 105
* s consists of only lowercase English letters.
=end

# @param {String} s
# @return {Integer}
def count_palindromic_subsequence(s)
  count = 0
  for i in 0...26
    current_char = (i + 97).chr
    l = s.index(current_char)
    r = s.rindex(current_char)
    if l && r && l < r
      count += s[l + 1...r].chars.uniq.size
    end
  end
  count
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_count_palindromic_subsequence < Test::Unit::TestCase
  def test_
    assert_equal 3, count_palindromic_subsequence("aabca")
    assert_equal 0, count_palindromic_subsequence("adc")
    assert_equal 4, count_palindromic_subsequence("bbcbaba")
  end
end
