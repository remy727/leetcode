# frozen_string_literal: true

# 862. Shortest Subarray with Sum at Least K
# https://leetcode.com/problems/shortest-subarray-with-sum-at-least-k
# Hard

=begin
Given an integer array nums and an integer k, return the length of the shortest non-empty subarray of nums with a sum of at least k. If there is no such subarray, return -1.
A subarray is a contiguous part of an array.

Example 1:
Input: nums = [1], k = 1
Output: 1
Example 2:
Input: nums = [1,2], k = 4
Output: -1
Example 3:
Input: nums = [2,-1,2], k = 3
Output: 3

Constraints:
* 1 <= nums.length <= 105
* -105 <= nums[i] <= 105
* 1 <= k <= 109
=end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def shortest_subarray(nums, k)
  n = nums.length
  sum = Array.new(n + 1, 0)

  n.times do |i|
    sum[i + 1] = sum[i] + nums[i]
  end

  q = Array.new(n + 1)
  l = 0
  r = 0
  min_length = n + 1

  sum.length.times do |i|
    while r > l && sum[i] >= sum[q[l]] + k
      min_length = [min_length, i - q[l]].min
      l += 1
    end

    while r > l && sum[i] <= sum[q[r - 1]]
      r -= 1
    end

    q[r] = i
    r += 1
  end

  min_length <= n ? min_length : -1
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_shortest_subarray < Test::Unit::TestCase
  def test_
    assert_equal 1, shortest_subarray([1], 1)
    assert_equal(-1, shortest_subarray([1, 2], 4))
    assert_equal 3, shortest_subarray([2, -1, 2], 3)
  end
end
