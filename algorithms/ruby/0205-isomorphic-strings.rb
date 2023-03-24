# frozen_string_literal: true

# 205. Isomorphic Strings
# https://leetcode.com/problems/isomorphic-strings

=begin

Given two strings s and t, determine if they are isomorphic.

Two strings s and t are isomorphic if the characters in s can be replaced to get t.

All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

### Example 1:

Input: s = "egg", t = "add"
Output: true

### Example 2:

Input: s = "foo", t = "bar"
Output: false

### Example 3:

Input: s = "paper", t = "title"
Output: true

### Constraints:

* 1 <= s.length <= 5 * 104
* t.length == s.length
* s and t consist of any valid ascii character.

=end

# Runtime 258 ms
# Memory 211.3 MB
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  ms = {}
  mt = {}
  n = s.length
  i = 0

  while i < n && ms[s[i]] == mt[t[i]]
    ms[s[i]] = mt[t[i]] = i + 1
    i += 1
  end

  i == n
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_is_isomorphic < Test::Unit::TestCase
  def test_
    assert_equal true, is_isomorphic("egg", "add")
    assert_equal false, is_isomorphic("foo", "bar")
    assert_equal true, is_isomorphic("paper", "title")
  end
end
