# frozen_string_literal: true

# Problem: 1680. Concatenation of Consecutive Binary Numbers
# URL: https://leetcode.com/problems/concatenation-of-consecutive-binary-numbers

# @param {Integer} n
# @return {Integer}
MOD = 10**9 + 7
def concatenated_binary(n)
  t = r = 1
  (1..n).reduce(0) do |s, k|
    s = ((s << r) + k) % MOD
    t -= 1
    if t.zero?
      t = 1 << r
      r += 1
    end
    s
  end
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_concatenated_binary < Test::Unit::TestCase
  def test_
    assert_equal 1, concatenated_binary(1)
    assert_equal 27, concatenated_binary(3)
    assert_equal 505_379_714, concatenated_binary(12)
  end
end
