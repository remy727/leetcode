# frozen_string_literal: true

# 70. Climbing Stairs
# https://leetcode.com/problems/climbing-stairs

# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  fib = { 0 => 0, 1 => 1, 2 => 2 }
  fib.default_proc = ->(f, n) { f[n] = f[n - 1] + f[n - 2] }
  fib[n]
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_climb_stairs < Test::Unit::TestCase
  def test_
    assert_equal 2, climb_stairs(2)
    assert_equal 3, climb_stairs(3)
  end
end
