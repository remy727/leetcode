# frozen_string_literal: true

# 394. Decode String
# https://leetcode.com/problems/decode-string

=begin

Given an encoded string, return its decoded string.

The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

You may assume that the input string is always valid; there are no extra white spaces, square brackets are well-formed, etc. Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there will not be input like 3a or 2[4].

The test cases are generated so that the length of the output will never exceed 105.

### Example 1:
Input: s = "3[a]2[bc]"
Output: "aaabcbc"

### Example 2:
Input: s = "3[a2[c]]"
Output: "accaccacc"

### Example 3:
Input: s = "2[abc]3[cd]ef"
Output: "abcabccdcdcdef"

### Constraints:
* 1 <= s.length <= 30
* s consists of lowercase English letters, digits, and square brackets '[]'.
* s is guaranteed to be a valid input.
* All the integers in s are in the range [1, 300].
=end

# @param {String} s
# @return {String}
def decode_string(s)
  stack = []
  s.each_char do |c|
    if c == "]"
      s1 = ""
      while stack.last != "["
        s1 = stack.pop + s1
      end
      stack.pop
      n = ""
      while !stack.empty? && stack.last.match?(/[0-9]/)
        n = stack.pop + n
      end
      stack.push(s1 * n.to_i)
    else
      stack.push(c)
    end
  end
  stack.join
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_decode_string < Test::Unit::TestCase
  def test_
    assert_equal "aaabcbc", decode_string("3[a]2[bc]")
    assert_equal "accaccacc", decode_string("3[a2[c]]")
    assert_equal "abcabccdcdcdef", decode_string("2[abc]3[cd]ef")
  end
end
