# frozen_string_literal: true

# 1456. Maximum Number of Vowels in a Substring of Given Length
# https://leetcode.com/problems/maximum-number-of-vowels-in-a-substring-of-given-length
# Medium

=begin
Given a string s and an integer k, return the maximum number of vowel letters in any substring of s with length k.

Vowel letters in English are 'a', 'e', 'i', 'o', and 'u'.

Example 1:
Input: s = "abciiidef", k = 3
Output: 3
Explanation: The substring "iii" contains 3 vowel letters.

Example 2:
Input: s = "aeiou", k = 2
Output: 2
Explanation: Any substring of length 2 contains 2 vowels.

Example 3:
Input: s = "leetcode", k = 3
Output: 2
Explanation: "lee", "eet" and "ode" contain 2 vowels.

Constraints:
1 <= s.length <= 105
s consists of lowercase English letters.
1 <= k <= s.length
=end

# @param {String} s
# @param {Integer} k
# @return {Integer}
def max_vowels(s, k)
  (0..s.length - k).map { |i| s[i..i + k - 1].count("aeiou") }.max
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_vowels < Test::Unit::TestCase
  def test_
    assert_equal 3, max_vowels("abciiidef", 3)
    assert_equal 2, max_vowels("aeiou", 2)
    assert_equal 2, max_vowels("leetcode", 3)
  end
end
