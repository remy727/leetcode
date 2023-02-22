# frozen_string_literal: true

# Problem: 1011. Capacity To Ship Packages Within D Days
# URL: https://leetcode.com/problems/capacity-to-ship-packages-within-d-days

# @param {Integer[]} weights
# @param {Integer} days
# @return {Integer}
def ship_within_days(weights, days)
  weight = weights.max
  sum = weights.sum

  while weight <= sum
    mid = (sum - weight) / 2 + weight
    cap = 0
    count = 1
    weights.each do |w|
      cap += w
      if cap > mid
        count += 1
        cap = w
      end
    end

    if count <= days
      sum = mid - 1
    else
      weight = mid + 1
    end
  end

  weight
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_ship_within_days < Test::Unit::TestCase
  def test_
    assert_equal 15, ship_within_days([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 5)
    assert_equal 6, ship_within_days([3, 2, 2, 4, 1, 4], 3)
    assert_equal 3, ship_within_days([1, 2, 3, 1, 1], 4)
  end
end

# ********************#
#     Benchmark       #
# ********************#

require "benchmark"

weights = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
days = 5
Benchmark.bm do |x|
  x.report("ship_within_days: ") { ship_within_days(weights, days) }
end

# user     system      total        real
# ship_within_days:   0.000025   0.000006   0.000031 (  0.000023)
