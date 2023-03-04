# frozen_string_literal: true

# Problem: 2444. Count Subarrays With Fixed Bounds
# URL: https://leetcode.com/problems/count-subarrays-with-fixed-bounds

# @param {Integer[]} nums
# @param {Integer} min_k
# @param {Integer} max_k
# @return {Integer}
def count_subarrays(nums, min_k, max_k)
  max_found = min_found = false
  start = 0
  res = 0
  min_index = max_index = 0
  nums.each_with_index do |num, i|
    unless num.between?(min_k, max_k)
      start = i + 1
      min_found = max_found = false
    else
      if num == min_k
        min_found = true
        min_index = i
      end
      if num == max_k
        max_found = true
        max_index = i
      end
      if min_found && max_found
        res += ([min_index, max_index].min - start + 1)
      end
    end
  end
  res
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_minimum_fuel_cost < Test::Unit::TestCase
  def test_
    assert_equal 2, count_subarrays([1, 3, 5, 2, 7, 5], 1, 5)
    assert_equal 10, count_subarrays([1, 1, 1, 1], 1, 1)
  end
end
