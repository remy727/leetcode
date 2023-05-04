# frozen_string_literal: true

# 345. Reverse Vowels of a String
# https://leetcode.com/problems/reverse-vowels-of-a-string
# Easy

=begin
Given a string s, reverse only all the vowels in the string and return it.

The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.

Example 1:
Input: s = "hello"
Output: "holle"

Example 2:
Input: s = "leetcode"
Output: "leotcede"

Constraints:
* 1 <= s.length <= 3 * 105
* s consist of printable ASCII characters.
=end

# @param {String} s
# @return {String}
def reverse_vowels(s)
  vowels = s.scan(/[aeiou]/i)
  s.gsub(/[aeiou]/i) { vowels.pop }
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_reverse_vowels < Test::Unit::TestCase
  def test_
    assert_equal "holle", reverse_vowels("hello")
    assert_equal "leotcede", reverse_vowels("leetcode")
  end
end
