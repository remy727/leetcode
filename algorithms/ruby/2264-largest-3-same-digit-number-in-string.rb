# frozen_string_literal: true

# 2264. Largest 3-Same-Digit Number in String
# Easy
# https://leetcode.com/problems/largest-3-same-digit-number-in-string

=begin
You are given a string num representing a large integer. An integer is good if it meets the following conditions:
* It is a substring of num with length 3.
* It consists of only one unique digit.
Return the maximum good integer as a string or an empty string "" if no such integer exists.

Note:
* A substring is a contiguous sequence of characters within a string.
* There may be leading zeroes in num or a good integer.

Example 1:
Input: num = "6777133339"
Output: "777"
Explanation: There are two distinct good integers: "777" and "333".
"777" is the largest, so we return "777".

Example 2:
Input: num = "2300019"
Output: "000"
Explanation: "000" is the only good integer.

Example 3:
Input: num = "42352338"
Output: ""
Explanation: No substring of length 3 consists of only one unique digit. Therefore, there are no good integers.

Constraints:
3 <= num.length <= 1000
num only consists of digits.
=end

# @param {String} num
# @return {String}
def largest_good_integer(num)
  res = []
  ans = ""

  for i in(0).upto(num.size - 1)
    if res.empty?
      res << num[i]
    elsif res[-1] != num[i]
      res = [num[i]]
    else
      res << num[i]
    end

    if res.size >= 3 && (ans[-1].to_i <= res[-1].to_i)
      ans = res[0..2].join
    end
  end

  ans
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_largest_good_integer < Test::Unit::TestCase
  def test_
    assert_equal "777", largest_good_integer("6777133339")
    assert_equal "000", largest_good_integer("2300019")
    assert_equal "", largest_good_integer("42352338")
  end
end
