# frozen_string_literal: true

# 767. Reorganize String
# Medium
# https://leetcode.com/problems/reorganize-string

=begin
Given a string s, rearrange the characters of s so that any two adjacent characters are not the same.
Return any possible rearrangement of s or return "" if not possible.

Example 1:
Input: s = "aab"
Output: "aba"

Example 2:
Input: s = "aaab"
Output: ""

Constraints:
* 1 <= s.length <= 500
* s consists of lowercase English letters.
=end

# @param {String} s
# @return {String}
def reorganize_string(s)
  count_hash = {}
  s.each_char do |c|
    count_hash[c] = count_hash.fetch(c, 0) + 1
  end

  sorted_chars = count_hash.sort_by { |k, v| -v }

  # If any character occurs more than (N + 1) / 2 times, the task is impossible.
  if sorted_chars[0][1] > (s.length + 1) / 2
    return ""
  end

  res = [""] * s.length
  idx = 0

  sorted_chars.each do |char, count|
    count.times do
      if idx >= s.length
        idx = 1
      end
      res[idx] = char
      idx += 2
    end
  end

  res.join("")
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_length_of_longest_substring < Test::Unit::TestCase
  def test_
    assert_equal "aba", reorganize_string("aab")
    assert_equal "", reorganize_string("aaab")
  end
end
