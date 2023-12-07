# frozen_string_literal: true

# 1903. Largest Odd Number in String
# Easy
# https://leetcode.com/problems/largest-odd-number-in-string

=begin
You are given a string num, representing a large integer. Return the largest-valued odd integer (as a string) that is a non-empty substring of num, or an empty string "" if no odd integer exists.
A substring is a contiguous sequence of characters within a string.

Example 1:
Input: num = "52"
Output: "5"
Explanation: The only non-empty substrings are "5", "2", and "52". "5" is the only odd number.

Example 2:
Input: num = "4206"
Output: ""
Explanation: There are no odd numbers in "4206".

Example 3:
Input: num = "35427"
Output: "35427"
Explanation: "35427" is already an odd number.

Constraints:
1 <= num.length <= 105
num only consists of digits and does not contain any leading zeros.
=end

# @param {String} num
# @return {String}
def largest_odd_number(num)
  i = num.length - 1
  while i >= 0
    case num[i]
    when "1", "3", "5", "7", "9" then return num[0..i]
    end
    i -= 1
  end

  ""
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_largest_odd_number < Test::Unit::TestCase
  def test_
    assert_equal "5", largest_odd_number("52")
    assert_equal "", largest_odd_number("4206")
    assert_equal "35427", largest_odd_number("35427")
  end
end
