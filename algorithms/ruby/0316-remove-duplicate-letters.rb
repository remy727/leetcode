# frozen_string_literal: true

# 316. Remove Duplicate Letters
# Medium
# https://leetcode.com/problems/remove-duplicate-letters

=begin
Given a string s, remove duplicate letters so that every letter appears once and only once. You must make sure your result is
the smallest in lexicographical order among all possible results.

Example 1:
Input: s = "bcabc"
Output: "abc"

Example 2:
Input: s = "cbacdcbc"
Output: "acdb"

Constraints:
1 <= s.length <= 104
s consists of lowercase English letters.
=end

# @param {String} s
# @return {String}
def remove_duplicate_letters(s)
  count_hash = Hash.new { |h, k| h[k] = 0 }
  stack = []
  selected_set = Set.new

  s.each_char do |char|
    count_hash[char] += 1
  end

  s.each_char do |char|
    count_hash[char] -= 1
    unless selected_set.include?(char)
      while !stack.empty? && count_hash[stack.last] > 0 && stack.last > char
        selected_set.delete(stack.pop)
      end

      stack << char
      selected_set << char
    end
  end

  stack.join
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_length_of_longest_substring < Test::Unit::TestCase
  def test_
    assert_equal "abc", remove_duplicate_letters("bcabc")
    assert_equal "acdb", remove_duplicate_letters("cbacdcbc")
  end
end
