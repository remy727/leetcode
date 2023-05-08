# frozen_string_literal: true

# 1. Two Sum
# https://leetcode.com/problems/two-sum

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  h = {}
  (0..nums.size - 1).each do |i|
    complement = target - nums[i]

    return [i, h[complement]] if h.key?(complement)

    h[nums[i]] = i
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_two_sum < Test::Unit::TestCase
  def test_
    assert_equal [0, 1].sort, two_sum([2, 7, 11, 15], 9).sort
    assert_equal [1, 2].sort, two_sum([3, 2, 4], 6).sort
    assert_equal [0, 1].sort, two_sum([3, 3], 6).sort
  end
end
