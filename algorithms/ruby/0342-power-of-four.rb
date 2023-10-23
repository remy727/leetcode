# frozen_string_literal: true

# 342. Power of Four
# Easy
# https://leetcode.com/problems/power-of-four

=begin
Given an integer n, return true if it is a power of four. Otherwise, return false.
An integer n is a power of four, if there exists an integer x such that n == 4^x.

Example 1:
Input: n = 16
Output: true

Example 2:
Input: n = 5
Output: false

Example 3:
Input: n = 1
Output: true

Constraints:
-231 <= n <= 231 - 1
=end

# @param {Integer} n
# @return {Boolean}
def is_power_of_four(n)
  return true if n == 1
  four = 1
  while four < n
    four *= 4
  end
  four == n ? true : false
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_is_power_of_four < Test::Unit::TestCase
  def test_
    assert_equal true, is_power_of_four(16)
    assert_equal false, is_power_of_four(5)
    assert_equal true, is_power_of_four(1)
  end
end
