# frozen_string_literal: true

# 392. Is Subsequence
# https://leetcode.com/problems/is-subsequence
# Difficulty: Easy

=begin

Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

### Example 1:

Input: s = "abc", t = "ahbgdc"
Output: true

### Example 2:

Input: s = "axc", t = "ahbgdc"
Output: false

### Constraints:

* 0 <= s.length <= 100
* 0 <= t.length <= 104
* s and t consist only of lowercase English letters.

=end

# Runtime 86 ms
# Memory 212.1 MB
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
  return true if s.size == 0
  return false if s.size > t.size

  sp = 0
  t.chars.each do |char|
    if s[sp] == char
      sp += 1
      return true if sp == s.size
    end
  end

  false
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_is_subsequence < Test::Unit::TestCase
  def test_
    assert_equal true, is_subsequence("abc", "ahbgdc")
    assert_equal false, is_subsequence("axc", "ahbgdc")
  end
end
