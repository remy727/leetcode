# frozen_string_literal: true

# 4. Median of Two Sorted Arrays
# https://leetcode.com/problems/median-of-two-sorted-arrays

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  sorted = (nums1 + nums2).sort
  len = sorted.length
  (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_find_median_sorted_arrays < Test::Unit::TestCase
  def test_
    assert_equal 2.0, find_median_sorted_arrays([1, 3], [2])
    assert_equal 2.5, find_median_sorted_arrays([1, 2], [3, 4])
  end
end
