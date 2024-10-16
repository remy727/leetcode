# frozen_string_literal: true

# 1405. Longest Happy String
# https://leetcode.com/problems/longest-happy-string
# Medium

=begin
A string s is called happy if it satisfies the following conditions:
* s only contains the letters 'a', 'b', and 'c'.
* s does not contain any of "aaa", "bbb", or "ccc" as a substring.
* s contains at most a occurrences of the letter 'a'.
* s contains at most b occurrences of the letter 'b'.
* s contains at most c occurrences of the letter 'c'.
Given three integers a, b, and c, return the longest possible happy string. If there are multiple longest happy strings, return any of them. If there is no such string, return the empty string "".
A substring is a contiguous sequence of characters within a string.

Example 1:
Input: a = 1, b = 1, c = 7
Output: "ccaccbcc"
Explanation: "ccbccacc" would also be a correct answer.

Example 2:
Input: a = 7, b = 1, c = 0
Output: "aabaa"
Explanation: It is the only correct answer in this case.

Constraints:
* 0 <= a, b, c <= 100
* a + b + c > 0
=end

# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {String}
def longest_diverse_string(a, b, c)
  chars = [
    ["a", a],
    ["b", b],
    ["c", c]
  ]

  result = +""

  loop do
    chars.sort_by! { |_, count| -count }

    added = false
    chars.each do |char, count|
      if count > 0 && (result[-2..-1] != char * 2)
        result << char
        chars[chars.index([char, count])] = [char, count - 1]
        added = true
        break
      end
    end

    break unless added
  end

  result
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_longest_diverse_string < Test::Unit::TestCase
  def test_
    assert_equal "ccaccbcc", longest_diverse_string(1, 1, 7)
    assert_equal "aabaa", longest_diverse_string(7, 1, 0)
  end
end
