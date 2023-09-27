# frozen_string_literal: true

# 880. Decoded String at Index
# Medium
# https://leetcode.com/problems/decoded-string-at-index

=begin
You are given an encoded string s. To decode the string to a tape, the encoded string is read one character at a time and the following steps are taken:

If the character read is a letter, that letter is written onto the tape.
If the character read is a digit d, the entire current tape is repeatedly written d - 1 more times in total.
Given an integer k, return the kth letter (1-indexed) in the decoded string.

Example 1:
Input: s = "leet2code3", k = 10
Output: "o"
Explanation: The decoded string is "leetleetcodeleetleetcodeleetleetcode".
The 10th letter in the string is "o".

Example 2:
Input: s = "ha22", k = 5
Output: "h"
Explanation: The decoded string is "hahahaha".
The 5th letter is "h".

Example 3:
Input: s = "a2345678999999999999999", k = 1
Output: "a"
Explanation: The decoded string is "a" repeated 8301530446056247680 times.
The 1st letter is "a".

Constraints:
2 <= s.length <= 100
s consists of lowercase English letters and digits 2 through 9.
s starts with a letter.
1 <= k <= 109
It is guaranteed that k is less than or equal to the length of the decoded string.
The decoded string is guaranteed to have less than 263 letters.
=end

# @param {String} s
# @param {Integer} k
# @return {String}
def decode_at_index(s, k)
  length = 0
  s.chars.each do |char|
    length = /\d/.match?(char) ? length * char.to_i : length + 1
    next if k <= length
  end

  s.reverse.each_char do |char|
    if /\d/.match?(char)
      length /= char.to_i
      k %= length
    else
      return char if k == length || k == 0
      length -= 1
    end
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_decode_at_index < Test::Unit::TestCase
  def test_
    assert_equal "o", decode_at_index("leet2code3", 10)
    assert_equal "h", decode_at_index("ha22", 5)
    assert_equal "a", decode_at_index("a2345678999999999999999", 1)
  end
end
