# frozen_string_literal: true

# 1137. N-th Tribonacci Number
# https://leetcode.com/problems/n-th-tribonacci-number
# Easy

=begin
The Tribonacci sequence Tn is defined as follows:

T0 = 0, T1 = 1, T2 = 1, and Tn+3 = Tn + Tn+1 + Tn+2 for n >= 0.

Given n, return the value of Tn.

Example 1:
Input: n = 4
Output: 4
Explanation:
T_3 = 0 + 1 + 1 = 2
T_4 = 1 + 1 + 2 = 4

Example 2:
Input: n = 25
Output: 1389537

Constraints:
0 <= n <= 37
The answer is guaranteed to fit within a 32-bit integer, ie. answer <= 2^31 - 1.
=end

# @param {Integer} n
# @return {Integer}
def tribonacci(n)
  arr = [0, 1, 1]

  arr.size.upto(n) { arr << arr.last(3).sum }

  arr[n]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_tribonacci < Test::Unit::TestCase
  def test_
    assert_equal 4, tribonacci(4)
    assert_equal 1389537, tribonacci(25)
  end
end
