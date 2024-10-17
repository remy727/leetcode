# frozen_string_literal: true

# 670. Maximum Swap
# Medium
# https://leetcode.com/problems/maximum-swap

=begin
You are given an integer num. You can swap two digits at most once to get the maximum valued number.
Return the maximum valued number you can get.

Example 1:
* Input: num = 2736
* Output: 7236
* Explanation: Swap the number 2 and the number 7.

Example 2:
* Input: num = 9973
* Output: 9973
* Explanation: No swap.

Constraints:
* 0 <= num <= 108
=end

# @param {Integer} num
# @return {Integer}
def maximum_swap(num)
  digits = num.digits.reverse
  last = Array.new(10, -1)

  digits.each_with_index { |digit, i| last[digit] = i }

  digits.each_with_index do |digit, i|
    (9).downto(digit + 1) do |d|
      if last[d] > i
        digits[i], digits[last[d]] = digits[last[d]], digits[i]
        return digits.join.to_i
      end
    end
  end

  num
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_maximum_swap < Test::Unit::TestCase
  def test_
    assert_equal 7236, maximum_swap(2736)
    assert_equal 9973, maximum_swap(9973)
  end
end
