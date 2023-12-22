# frozen_string_literal: true

# 1422. Maximum Score After Splitting a String
# Easy
# https://leetcode.com/problems/maximum-score-after-splitting-a-string

=begin
Given a string s of zeros and ones, return the maximum score after splitting the string into two non-empty substrings (i.e. left substring and right substring).
The score after splitting a string is the number of zeros in the left substring plus the number of ones in the right substring.

Example 1:
Input: s = "011101"
Output: 5
Explanation:
All possible ways of splitting s into two non-empty substrings are:
left = "0" and right = "11101", score = 1 + 4 = 5
left = "01" and right = "1101", score = 1 + 3 = 4
left = "011" and right = "101", score = 1 + 2 = 3
left = "0111" and right = "01", score = 1 + 1 = 2
left = "01110" and right = "1", score = 2 + 1 = 3

Example 2:
Input: s = "00111"
Output: 5
Explanation: When left = "00" and right = "111", we get the maximum score = 2 + 3 = 5

Example 3:
Input: s = "1111"
Output: 3

Constraints:
2 <= s.length <= 500
The string s consists of characters '0' and '1' only.
=end

# @param {String} s
# @return {Integer}
def max_score(s)
  result = 0
  (0...s.length - 1).each do |i|
    current_score = 0
    (0..i).each do |j|
      current_score += 1 if s[j] == "0"
    end
    (i + 1...s.length).each do |j|
      current_score += 1 if s[j] == "1"
    end
    result = [result, current_score].max
  end
  result
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_score < Test::Unit::TestCase
  def test_
    assert_equal 5, max_score("011101")
    assert_equal 5, max_score("00111")
    assert_equal 3, max_score("1111")
  end
end
