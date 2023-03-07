# frozen_string_literal: true

# Problem: 2187. Minimum Time to Complete Trips
# URL: https://leetcode.com/problems/minimum-time-to-complete-trips

# @param {Integer[]} time
# @param {Integer} total_trips
# @return {Integer}
def minimum_time(time, total_trips)
  (1..time.min * total_trips).bsearch do |x|
    time.sum { x / _1 } >= total_trips
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_minimum_time < Test::Unit::TestCase
  def test_
    assert_equal 3, minimum_time([1, 2, 3], 5)
    assert_equal 2, minimum_time([2], 1)
    assert_equal 4, minimum_time([1, 2, 3, 1], 10)
  end
end
