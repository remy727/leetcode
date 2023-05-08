# frozen_string_literal: true

# 12. Integer to Roman
# https://leetcode.com/problems/integer-to-roman

=begin

Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

* I can be placed before V (5) and X (10) to make 4 and 9.
* X can be placed before L (50) and C (100) to make 40 and 90.
* C can be placed before D (500) and M (1000) to make 400 and 900.
Given an integer, convert it to a roman numeral.

### Constraints:

* 1 <= num <= 3999

=end

# @param {Integer} num
# @return {String}
def int_to_roman(num)
  digits_to_roman = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }
  roman = ""
  digits_to_roman.each { |d, r|
    if num >= d
      times = num / d
      roman += r * times
      num -= d * times
    end
  }
  roman
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_int_to_roman < Test::Unit::TestCase
  def test_
    assert_equal "III", int_to_roman(3)
    assert_equal "LVIII", int_to_roman(58)
    assert_equal "MCMXCIV", int_to_roman(1994)
  end
end
