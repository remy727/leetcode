# frozen_string_literal: true

# 66. Plus One
# https://leetcode.com/problems/plus-one

=begin

You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.
Increment the large integer by one and return the resulting array of digits.

# Constraints:

* 1 <= digits.length <= 100
* 0 <= digits[i] <= 9
* digits does not contain any leading 0's.
=end

# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  carryover, pointer = 1, -1

  while carryover.positive?
    break digits.unshift(carryover) if digits[pointer].nil?

    sum = digits[pointer] + carryover
    carryover = sum / 10
    digits[pointer] = sum % 10
    pointer -= 1
  end

  digits
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_plus_one < Test::Unit::TestCase
  def test_
    assert_equal [1, 2, 4], plus_one([1, 2, 3])
    assert_equal [4, 3, 2, 2], plus_one([4, 3, 2, 1])
    assert_equal [1, 0], plus_one([9])
  end
end
