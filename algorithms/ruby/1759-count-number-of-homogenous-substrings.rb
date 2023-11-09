# frozen_string_literal: true

# 1759. Count Number of Homogenous Substrings
# Medium
# https://leetcode.com/problems/count-number-of-homogenous-substrings

=begin
Given a string s, return the number of homogenous substrings of s. Since the answer may be too large, return it modulo 109 + 7.
A string is homogenous if all the characters of the string are the same.
A substring is a contiguous sequence of characters within a string.

Example 1:
Input: s = "abbcccaa"
Output: 13
Explanation: The homogenous substrings are listed as below:
"a"   appears 3 times.
"aa"  appears 1 time.
"b"   appears 2 times.
"bb"  appears 1 time.
"c"   appears 3 times.
"cc"  appears 2 times.
"ccc" appears 1 time.
3 + 1 + 2 + 1 + 3 + 2 + 1 = 13.

Example 2:
Input: s = "xy"
Output: 2
Explanation: The homogenous substrings are "x" and "y".

Example 3:
Input: s = "zzzzz"
Output: 15

Constraints:
1 <= s.length <= 105
s consists of lowercase letters.
=end

# @param {String} s
# @return {Integer}
def count_homogenous(s)
  s.each_char.chunk { |c| c }.map { |e| l = e[1].length(); l * (l + 1) / 2 }.sum() % (10**9 + 7)
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_count_homogenous < Test::Unit::TestCase
  def test_
    assert_equal 13, count_homogenous("abbcccaa")
    assert_equal 2, count_homogenous("xy")
    assert_equal 15, count_homogenous("zzzzz")
  end
end
