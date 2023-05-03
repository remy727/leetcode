# frozen_string_literal: true

# 334. Increasing Triplet Subsequence
# https://leetcode.com/problems/increasing-triplet-subsequence
# Difficulty: Medium

=begin
Given an integer array nums, return true if there exists a triple of indices (i, j, k) such that i < j < k and nums[i] < nums[j] < nums[k]. If no such indices exists, return false.

Example 1:
Input: nums = [1,2,3,4,5]
Output: true
Explanation: Any triplet where i < j < k is valid.

Example 2:
Input: nums = [5,4,3,2,1]
Output: false
Explanation: No triplet exists.

Example 3:
Input: nums = [2,1,5,0,4,6]
Output: true
Explanation: The triplet (3, 4, 5) is valid because nums[3] == 0 < nums[4] == 4 < nums[5] == 6.

Constraints:
* 1 <= nums.length <= 5 * 105
* -231 <= nums[i] <= 231 - 1
=end

# @param {Integer[]} nums
# @return {Boolean}
def increasing_triplet(nums)
  min = Float::INFINITY
  mid = Float::INFINITY
  nums.each do |x|
    next min = x if x <= min
    next mid = x if x <= mid
    return true
  end
  false
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_increasing_triplet < Test::Unit::TestCase
  def test_
    assert_equal true, increasing_triplet([1, 2, 3, 4, 5])
    assert_equal false, increasing_triplet([5, 4, 3, 2, 1])
    assert_equal true, increasing_triplet([2, 1, 5, 0, 4, 6])
  end
end
