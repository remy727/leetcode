# frozen_string_literal: true

# Problem: 509. Fibonacci Number
# URL: https://leetcode.com/problems/fibonacci-number

# @param {Integer} n
# @return {Integer}
def fib(n)
  case n
  when 0
    return 0
  when 1
    return 1
  end

  fib(n - 1) + fib(n - 2)
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_fib < Test::Unit::TestCase
  def test_
    assert_equal 1, fib(2)
    assert_equal 2, fib(3)
    assert_equal 3, fib(4)
  end
end
