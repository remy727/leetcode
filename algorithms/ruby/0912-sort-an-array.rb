# frozen_string_literal: true

# 912. Sort an Array
# https://leetcode.com/problems/sort-an-array

# @param {Integer[]} nums
# @return {Integer[]}
def sort_array(nums)
  in_place_quick_sort(nums, 0, nums.length - 1)
  nums
end

def in_place_quick_sort(nums, l, r)
  return if l >= r

  pivot = nums[rand(l..r)]
  pl, pr = partition(nums, l, r, pivot)
  in_place_quick_sort(nums, l, pl - 1)
  in_place_quick_sort(nums, pr + 1, r)
end

def partition(nums, l, r, pivot)
  p0, p1, p2 = l, l, r
  while p1 <= p2
    if nums[p1] < pivot
      nums[p0], nums[p1] = nums[p1], nums[p0]
      p0 += 1
      p1 += 1
    elsif nums[p1] == pivot
      p1 += 1
    else
      nums[p1], nums[p2] = nums[p2], nums[p1]
      p2 -= 1
    end
  end

  [p0, p2]
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_sort_array < Test::Unit::TestCase
  def test_
    assert_equal [1, 2, 3, 5], sort_array([5, 2, 3, 1])
    assert_equal [0, 0, 1, 1, 2, 5], sort_array([5, 1, 1, 2, 0, 0])
  end
end
