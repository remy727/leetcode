# frozen_string_literal: true

# 1143. Longest Common Subsequence
# https://leetcode.com/problems/longest-common-subsequence
# Medium

=begin
Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.

A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.

For example, "ace" is a subsequence of "abcde".
A common subsequence of two strings is a subsequence that is common to both strings.

Example 1:
Input: text1 = "abcde", text2 = "ace"
Output: 3
Explanation: The longest common subsequence is "ace" and its length is 3.

Example 2:
Input: text1 = "abc", text2 = "abc"
Output: 3
Explanation: The longest common subsequence is "abc" and its length is 3.

Example 3:
Input: text1 = "abc", text2 = "def"
Output: 0
Explanation: There is no such common subsequence, so the result is 0.

Constraints:
1 <= text1.length, text2.length <= 1000
text1 and text2 consist of only lowercase English characters.
=end

# @param {String} text1
# @param {String} text2
# @return {Integer}
def longest_common_subsequence(text1, text2)
  indices = {}
  text1.each_char.with_index { |char1, index1| (indices[char1] ||= []) << index1 }
  indices.transform_values!(&:reverse)

  result = []
  text2.each_char do |char2|
    indices[char2]&.each do |index1|
      index = result.bsearch_index { |val| val >= index1 }

      if index.nil?
        result << index1
      elsif result[index] > index1
        result[index] = index1
      end
    end
  end

  result.size
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_longest_common_subsequence < Test::Unit::TestCase
  def test_
    assert_equal 3, longest_common_subsequence("abcde", "ace")
    assert_equal 3, longest_common_subsequence("abc", "abc")
    assert_equal 0, longest_common_subsequence("abc", "def")
  end
end
