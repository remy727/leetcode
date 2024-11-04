# frozen_string_literal: true

# 796. Rotate String
# Easy
# https://leetcode.com/problems/rotate-string

=begin
Given two strings s and goal, return true if and only if s can become goal after some number of shifts on s.
A shift on s consists of moving the leftmost character of s to the rightmost position.
* For example, if s = "abcde", then it will be "bcdea" after one shift.

Example 1:
Input: s = "abcde", goal = "cdeab"
Output: true
Example 2:
Input: s = "abcde", goal = "abced"
Output: false

Constraints:
* 1 <= s.length, goal.length <= 100
* s and goal consist of lowercase English letters.
=end

# @param {String} s
# @param {String} goal
# @return {Boolean}
def rotate_string(s, goal)
  return false if s.length != goal.length
  (s + s).include?(goal)
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_rotate_string < Test::Unit::TestCase
  def test_
    assert_equal true, rotate_string("abcde", "cdeab")
    assert_equal false, rotate_string("abcde", "abced")
  end
end
