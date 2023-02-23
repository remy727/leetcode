# frozen_string_literal: true

# Problem: 502. IPO
# URL: https://leetcode.com/problems/ipo

# @param {Integer} k
# @param {Integer} w
# @param {Integer[]} profits
# @param {Integer[]} capital
# @return {Integer}
def find_maximized_capital(k, w, profits, capital)
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_find_maximized_capital < Test::Unit::TestCase
  def test_
    assert_equal 4, find_maximized_capital(2, 0, [1, 2, 3], [0, 1, 1])
    assert_equal 6, find_maximized_capital(3, 0, [1, 2, 3], [0, 1, 2])
  end
end
