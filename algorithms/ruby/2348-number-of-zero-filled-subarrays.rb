# frozen_string_literal: true

# 2348. Number of Zero-Filled Subarrays
# https://leetcode.com/problems/number-of-zero-filled-subarrays

=begin

Given an integer array nums, return the number of subarrays filled with 0.

A subarray is a contiguous non-empty sequence of elements within an array.

### Constraints:

* 1 <= nums.length <= 105
* -109 <= nums[i] <= 109

=end

# Runtime 202 ms, Beats 100%
# Memory 223 MB, Beats 100%
# @param {Integer[]} nums
# @return {Integer}
def zero_filled_subarray(nums)
  res = i = j = 0

  while i < nums.size
    j = i + 1 if nums[i] != 0
    res += i - j + 1
    i += 1
  end

  res
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_zero_filled_subarray < Test::Unit::TestCase
  def test_
    assert_equal 6, zero_filled_subarray([1, 3, 0, 0, 2, 0, 0, 4])
    assert_equal 9, zero_filled_subarray([0, 0, 0, 2, 0, 0])
    assert_equal 0, zero_filled_subarray([2, 10, 2019])
  end
end
