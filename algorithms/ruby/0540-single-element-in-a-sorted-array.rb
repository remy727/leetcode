# frozen_string_literal: true

# 540. Single Element in a Sorted Array
# https://leetcode.com/problems/single-element-in-a-sorted-array

# @param {Integer[]} nums
# @return {Integer}
def single_non_duplicate1(nums, left = 0, right = nums.size - 1)
  return nums[left] if left == right

  mid = (left + right) / 2
  mid -= 1 if mid % 2 == 1

  return single_non_duplicate1(nums, left, mid - 2) if nums[mid] == nums[mid - 1]
  return single_non_duplicate1(nums, mid + 2, right) if nums[mid] == nums[mid + 1]

  nums[mid]
end

def single_non_duplicate2(nums)
  left, right = 0, nums.size - 1

  while left < right
    m = (left + right) / 2
    if nums[m] != nums[m ^ 1]
      right = m
    else
      left = m + 1
    end
  end

  nums[left]
end

def single_non_duplicate3(nums)
  nums[ (0...nums.size).bsearch { |i| nums[i] != nums[i ^ 1] } ]
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_single_non_duplicate < Test::Unit::TestCase
  def test_
    assert_equal 2, single_non_duplicate1([1, 1, 2, 3, 3, 4, 4, 8, 8])
    assert_equal 10, single_non_duplicate1([3, 3, 7, 7, 10, 11, 11])

    assert_equal 2, single_non_duplicate2([1, 1, 2, 3, 3, 4, 4, 8, 8])
    assert_equal 10, single_non_duplicate2([3, 3, 7, 7, 10, 11, 11])

    assert_equal 2, single_non_duplicate3([1, 1, 2, 3, 3, 4, 4, 8, 8])
    assert_equal 10, single_non_duplicate3([3, 3, 7, 7, 10, 11, 11])
  end
end

# ********************#
#     Benchmark       #
# ********************#

require "benchmark"

nums = [3, 3, 7, 7, 10, 10, 11, 11, 12, 12, 15, 15, 16, 16, 17, 17, 18, 20, 20, 21, 21, 22, 22, 23, 23]
Benchmark.bm do |x|
  x.report("single_non_duplicate1: ") { single_non_duplicate1(nums) }
  x.report("single_non_duplicate2: ") { single_non_duplicate2(nums) }
  x.report("single_non_duplicate3: ") { single_non_duplicate3(nums) }
end

# user     system      total        real
# single_non_duplicate1:   0.000017   0.000006   0.000023 (  0.000015)
# single_non_duplicate2:   0.000013   0.000001   0.000014 (  0.000012)
# single_non_duplicate3:   0.000011   0.000003   0.000014 (  0.000013)
