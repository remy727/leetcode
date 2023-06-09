# frozen_string_literal: true

# https://leetcode.com/problems/find-smallest-letter-greater-than-target
# 744. Find Smallest Letter Greater Than Target
# Easy

=begin
You are given an array of characters letters that is sorted in non-decreasing order, and a character target. There are at least two different characters in letters.

Return the smallest character in letters that is lexicographically greater than target. If such a character does not exist, return the first character in letters.

Example 1:
Input: letters = ["c","f","j"], target = "a"
Output: "c"
Explanation: The smallest character that is lexicographically greater than 'a' in letters is 'c'.

Example 2:
Input: letters = ["c","f","j"], target = "c"
Output: "f"
Explanation: The smallest character that is lexicographically greater than 'c' in letters is 'f'.

Example 3:
Input: letters = ["x","x","y","y"], target = "z"
Output: "x"
Explanation: There are no characters in letters that is lexicographically greater than 'z' so we return letters[0].

Constraints:
* 2 <= letters.length <= 104
* letters[i] is a lowercase English letter.
* letters is sorted in non-decreasing order.
* letters contains at least two different characters.
* target is a lowercase English letter.
=end

# @param {Character[]} letters
# @param {Character} target
# @return {Character}
def next_greatest_letter(letters, target)
  i = 0
  j = letters.size - 1
  res = letters[0]
  while i <= j
    mid = i + (j - i) / 2

    if letters[mid] == target
      res = letters[mid + 1] || letters[0]
      i = mid + 1
    elsif letters[mid] < target
      i = mid + 1
    else
      res = letters[mid]
      j = mid - 1
    end
  end
  res
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_next_greatest_letter < Test::Unit::TestCase
  def test_
    assert_equal "c", next_greatest_letter(["c", "f", "j"], "a")
    assert_equal "f", next_greatest_letter(["c", "f", "j"], "c")
    assert_equal "x", next_greatest_letter(["x", "x", "y", "y"], "z")
  end
end
