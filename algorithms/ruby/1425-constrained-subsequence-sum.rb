# 1425. Constrained Subsequence Sum
# Hard
# https://leetcode.com/problems/constrained-subsequence-sum

=begin
Given an integer array nums and an integer k, return the maximum sum of a non-empty subsequence of that array such that for every two consecutive integers in the subsequence, nums[i] and nums[j], where i < j, the condition j - i <= k is satisfied.
A subsequence of an array is obtained by deleting some number of elements (can be zero) from the array, leaving the remaining elements in their original order.

Example 1:
Input: nums = [10,2,-10,5,20], k = 2
Output: 37
Explanation: The subsequence is [10, 2, 5, 20].

Example 2:
Input: nums = [-1,-2,-3], k = 1
Output: -1
Explanation: The subsequence must be non-empty, so we choose the largest number.

Example 3:
Input: nums = [10,-2,-10,-5,20], k = 2
Output: 23
Explanation: The subsequence is [10, -2, -5, 20].

Constraints:
1 <= k <= nums.length <= 105
-104 <= nums[i] <= 104
=end

# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def constrained_subset_sum(nums, k)
  max_sum = nums[0]
  max_sum_queue = []

  nums.each_with_index do |num, i|
    nums[i] += max_sum_queue.empty? ? 0 : max_sum_queue.first
    max_sum = [max_sum, nums[i]].max

    while !max_sum_queue.empty? && nums[i] > max_sum_queue.last
      max_sum_queue.pop
    end

    if nums[i] > 0
      max_sum_queue << nums[i]
    end

    if i >= k && !max_sum_queue.empty? && max_sum_queue.first == nums[i - k]
      max_sum_queue.shift
    end
  end

  max_sum
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_constrained_subset_sum < Test::Unit::TestCase
  def test_
    assert_equal 37, constrained_subset_sum([10, 2, -10, 5, 20], 2)
    assert_equal(-1, constrained_subset_sum([-1, -2, -3], 1))
    assert_equal 23, constrained_subset_sum([10, -2, -10, -5, 20], 2)
  end
end
