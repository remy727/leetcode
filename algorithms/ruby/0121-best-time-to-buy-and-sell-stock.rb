# frozen_string_literal: true

# Problem: 121. Best Time to Buy and Sell Stock
# URL: https://leetcode.com/problems/best-time-to-buy-and-sell-stock

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  min, max_prof = prices[0], 0
  prices.each.each do |p|
    min = [min, p].min
    max_prof = [max_prof, p - min].max
  end

  max_prof
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_profit < Test::Unit::TestCase
  def test_
    assert_equal 5, max_profit([7, 1, 5, 3, 6, 4])
    assert_equal 0, max_profit([7, 6, 4, 3, 1])
  end
end
