# frozen_string_literal: true

# Problem: 13. Roman to Integer
# URL: https://leetcode.com/problems/roman-to-integer

ROMAN_VALUES = {
  "I" => 1,
  "V" => 5,
  "X" => 10,
  "L" => 50,
  "C" => 100,
  "D" => 500,
  "M" => 1000
}.freeze

# @param {String} s
# @return {Integer}
def roman_to_int(s)
  sum = 0
  v = 0
  s.chars.each_with_index do |c, i|
    if s[i + 1] && ROMAN_VALUES[c] < ROMAN_VALUES[s[i + 1]]
      v = ROMAN_VALUES[c]
    else
      sum += ROMAN_VALUES[c] - v
      v = 0
    end
  end

  sum
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_roman_to_int < Test::Unit::TestCase
  def test_
    assert_equal 3, roman_to_int("III")
    assert_equal 58, roman_to_int("LVIII")
    assert_equal 1994, roman_to_int("MCMXCIV")
  end
end
