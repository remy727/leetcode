# frozen_string_literal: true

# 2477. Minimum Fuel Cost to Report to the Capital
# https://leetcode.com/problems/minimum-fuel-cost-to-report-to-the-capital

# @param {Integer[][]} roads
# @param {Integer} seats
# @return {Integer}
def minimum_fuel_cost(roads, seats)
  hsh = Array.new roads.size + 1 do [] end
  roads.each do | (x, y) |
    hsh[x] << y
    hsh[y] << x
  end

  cost = 0
  l = -> n, p do
    c = hsh[n].reduce(1) { _2 == p ? (next _1) : _1 + l.(_2, n) }
    cost += (c + seats - 1) / seats
    c
  end

  hsh[0].each { l.(_1, 0) }

  cost
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_minimum_fuel_cost < Test::Unit::TestCase
  def test_
    assert_equal 3, minimum_fuel_cost([[0, 1], [0, 2], [0, 3]], 5)
    assert_equal 7, minimum_fuel_cost([[3, 1], [3, 2], [1, 0], [0, 4], [0, 5], [4, 6]], 2)
    assert_equal 0, minimum_fuel_cost([], 1)
  end
end
