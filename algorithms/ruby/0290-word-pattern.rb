# frozen_string_literal: true

# 290. Word Pattern
# https://leetcode.com/problems/word-pattern
# Easy

=begin
Given a pattern and a string s, find if s follows the same pattern.

Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.

Example 1:
Input: pattern = "abba", s = "dog cat cat dog"
Output: true

Example 2:
Input: pattern = "abba", s = "dog cat cat fish"
Output: false

Example 3:
Input: pattern = "aaaa", s = "dog cat cat dog"
Output: false

Constraints:
1 <= pattern.length <= 300
pattern contains only lower-case English letters.
1 <= s.length <= 3000
s contains only lowercase English letters and spaces ' '.
s does not contain any leading or trailing spaces.
All the words in s are separated by a single space.
=end

# @param {String} pattern
# @param {String} s
# @return {Boolean}
def word_pattern(pattern, s)
  s.split.map(&pattern.chars.zip(s.split).to_h.invert) == pattern.chars
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_word_pattern < Test::Unit::TestCase
  def test_
    assert_equal true, word_pattern("abba", "dog cat cat dog")
    assert_equal false, word_pattern("abba", "dog cat cat fish")
    assert_equal false, word_pattern("aaaa", "dog cat cat dog")
  end
end
