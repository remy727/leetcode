# frozen_string_literal: true

# Problem: 69. Sqrt(x)
# URL: https://leetcode.com/problems/sqrtx

# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
  return 0 if x.zero?
  return 1 if x < 4

  prev = 2
  cur = x / 2
  while (prev - cur).abs > 1
    return cur if cur * cur == x

    prev = cur
    cur = (cur + x / cur) / 2
  end
  cur * cur > x ? (cur - 1) : cur
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_my_sqrt < Test::Unit::TestCase
  def test_
    assert_equal 2, my_sqrt(4)
    assert_equal 2, my_sqrt(8)
  end
end
