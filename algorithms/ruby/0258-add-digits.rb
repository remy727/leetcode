# frozen_string_literal: true

# 258. Add Digits
# https://leetcode.com/problems/add-digits
# Easy

=begin
Given an integer num, repeatedly add all its digits until the result has only one digit, and return it.

Example 1:
Input: num = 38
Output: 2
Explanation: The process is
38 --> 3 + 8 --> 11
11 --> 1 + 1 --> 2
Since 2 has only one digit, return it.

Example 2:
Input: num = 0
Output: 0

Constraints:
0 <= num <= 231 - 1
=end

# @param {Integer} num
# @return {Integer}
def add_digits(num)
  num == 0 ? 0 : (num - 1) % 9 + 1
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_add_digits < Test::Unit::TestCase
  def test_
    assert_equal 2, add_digits(38)
    assert_equal 0, add_digits(0)
  end
end
