# frozen_string_literal: true

# Problem: 1071. Greatest Common Divisor of Strings
# URL: https://leetcode.com/problems/greatest-common-divisor-of-strings

# @param {String} str1
# @param {String} str2
# @return {String}
def gcd_of_strings(str1, str2)
  return str1 if str1 == str2

  if str1.size >= str2.size
    long = str1
    short = str2
  else
    long = str2
    short = str1
  end
  len = short.size
  return "" unless short == long[0...len]

  gcd_of_strings(short, long[len..])
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_gcd_of_strings < Test::Unit::TestCase
  def test_
    assert_equal "ABC", gcd_of_strings("ABCABC", "ABC")
    assert_equal "AB", gcd_of_strings("ABABAB", "ABAB")
    assert_equal "", gcd_of_strings("LEET", "CODE")
  end
end
