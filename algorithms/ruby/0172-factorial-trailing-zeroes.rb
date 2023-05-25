# frozen_string_literal: true

# 172. Factorial Trailing Zeroes
# https://leetcode.com/problems/factorial-trailing-zeroes
# Medium

=begin
Given an integer n, return the number of trailing zeroes in n!.

Note that n! = n * (n - 1) * (n - 2) * ... * 3 * 2 * 1.

Example 1:
Input: n = 3
Output: 0
Explanation: 3! = 6, no trailing zero.

Example 2:
Input: n = 5
Output: 1
Explanation: 5! = 120, one trailing zero.

Example 3:
Input: n = 0
Output: 0

Constraints:
0 <= n <= 104
=end

# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
  (n / 5).zero? ? 0 : n / 5 + trailing_zeroes(n / 5)
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_trailing_zeroes < Test::Unit::TestCase
  def test_
    assert_equal 0, trailing_zeroes(3)
    assert_equal 1, trailing_zeroes(5)
    assert_equal 0, trailing_zeroes(0)
  end
end
