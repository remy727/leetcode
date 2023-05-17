# frozen_string_literal: true

# 17. Letter Combinations of a Phone Number
# https://leetcode.com/problems/letter-combinations-of-a-phone-number
# Medium

=begin
Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

Example 1:
Input: digits = "23"
Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]

Example 2:
Input: digits = ""
Output: []

Example 3:
Input: digits = "2"
Output: ["a","b","c"]

Constraints:
0 <= digits.length <= 4
digits[i] is a digit in the range ['2', '9'].
=end

# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  map = "- - abc def ghi jkl mno pqrs tuv wxyz".split
  charsets = digits.chars.map { |d| map[d.to_i].chars }
  digits == "" ? [] : [""].product(*charsets).map(&:join)
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_letter_combinations < Test::Unit::TestCase
  def test_
    assert_equal ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"], letter_combinations("23")
    assert_equal [], letter_combinations("")
    assert_equal ["a", "b", "c"], letter_combinations("2")
  end
end
