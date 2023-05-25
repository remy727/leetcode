# frozen_string_literal: true

# 201. Bitwise AND of Numbers Range
# https://leetcode.com/problems/bitwise-and-of-numbers-range
# Medium

=begin
Given two integers left and right that represent the range [left, right], return the bitwise AND of all numbers in this range, inclusive.

Example 1:
Input: left = 5, right = 7
Output: 4

Example 2:
Input: left = 0, right = 0
Output: 0

Example 3:
Input: left = 1, right = 2147483647
Output: 0

Constraints:
0 <= left <= right <= 231 - 1
=end

# @param {Integer} left
# @param {Integer} right
# @return {Integer}
def range_bitwise_and(left, right)
  shift = 0
  while left != right
    left >>= 1
    right >>= 1
    shift += 1
  end
  left << shift
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_range_bitwise_and < Test::Unit::TestCase
  def test_
    assert_equal 4, range_bitwise_and(5, 7)
    assert_equal 0, range_bitwise_and(0, 0)
    assert_equal 0, range_bitwise_and(1, 2147483647)
  end
end
