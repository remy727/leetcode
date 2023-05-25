# frozen_string_literal: true

# 50. Pow(x, n)
# https://leetcode.com/problems/powx-n
# Medium

=begin
Implement pow(x, n), which calculates x raised to the power n (i.e., x**n).

Example 1:
Input: x = 2.00000, n = 10
Output: 1024.00000

Example 2:
Input: x = 2.10000, n = 3
Output: 9.26100

Example 3:
Input: x = 2.00000, n = -2
Output: 0.25000
Explanation: 2-2 = 1/22 = 1/4 = 0.25

Constraints:
-100.0 < x < 100.0
-231 <= n <= 231-1
n is an integer.
Either x is not zero or n > 0.
-104 <= xn <= 104
=end

# @param {Float} x
# @param {Integer} n
# @return {Float}
def pow(x, n)
  return 1 if n.zero?
  return (1 / pow(x, -n)) if n.negative?
  return x * pow(x, n - 1) if n.odd?
  pow(x * x, n / 2)
end

def my_pow(x, n)
  pow(x, n).round(5)
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_my_pow < Test::Unit::TestCase
  def test_
    assert_equal 1024.00000, my_pow(2.00000, 10)
    assert_equal 9.26100, my_pow(2.10000, 3)
    assert_equal 0.25000, my_pow(2.00000, -2)
  end
end
