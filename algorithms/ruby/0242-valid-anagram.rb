# frozen_string_literal: true

# 242. Valid Anagram
# https://leetcode.com/problems/valid-anagram
# Easy

=begin
Given two strings s and t, return true if t is an anagram of s, and false otherwise.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

Example 1:
Input: s = "anagram", t = "nagaram"
Output: true

Example 2:
Input: s = "rat", t = "car"
Output: false

Constraints:
1 <= s.length, t.length <= 5 * 104
s and t consist of lowercase English letters.
=end

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  counter = s.chars.reduce(Hash.new(0)) { |ha, ch| ha[ch] += 1; ha }

  t.chars.each do |ch|
    counter[ch] -= 1
    return false if counter[ch] < 0
  end

  counter.values.all?(&:zero?)
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_is_anagram < Test::Unit::TestCase
  def test_
    assert_equal true, is_anagram("anagram", "nagaram")
    assert_equal false, is_anagram("rat", "car")
  end
end
