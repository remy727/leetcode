# frozen_string_literal: true

# 409. Longest Palindrome
# https://leetcode.com/problems/longest-palindrome

=begin

Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.

Letters are case sensitive, for example, "Aa" is not considered a palindrome here.

### Example 1:
Input: s = "abccccdd"
Output: 7
Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.

### Example 2:
Input: s = "a"
Output: 1
Explanation: The longest palindrome that can be built is "a", whose length is 1.

### Constraints:
* 1 <= s.length <= 2000
* s consists of lowercase and/or uppercase English letters only.

=end

# Runtime 92 ms
# Memory 210.9 MB
# @param {String} s
# @return {Integer}
def longest_palindrome(s)
  [s.size, s.each_char.tally.sum { _2 & ~1 } + 1].min
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_longest_palindrome < Test::Unit::TestCase
  def test_
    assert_equal 7, longest_palindrome("abccccdd")
    assert_equal 1, longest_palindrome("a")
  end
end
