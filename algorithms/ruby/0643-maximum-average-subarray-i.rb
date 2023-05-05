# frozen_string_literal: true

# 643. Maximum Average Subarray I
# https://leetcode.com/problems/maximum-average-subarray-i
# Easy

=begin
You are given an integer array nums consisting of n elements, and an integer k.

Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.

Example 1:
Input: nums = [1,12,-5,-6,50,3], k = 4
Output: 12.75000
Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75

Example 2:
Input: nums = [5], k = 1
Output: 5.00000

Constraints:
n == nums.length
1 <= k <= n <= 105
-104 <= nums[i] <= 104
=end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Float}
def find_max_average(nums, k)
  max_sum = 0
  i = 0
  while i < k do
    max_sum += nums[i]
    i += 1
  end

  new_sum = max_sum

  while i < nums.length do
    new_sum += nums[i] - nums[i - k]
    max_sum = new_sum if new_sum > max_sum
    i += 1
  end
  max_sum / k.to_f
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_vowels < Test::Unit::TestCase
  def test_
    assert_equal 12.75, find_max_average([1, 12, -5, -6, 50, 3], 4)
    assert_equal 5.0, find_max_average([5], 1)
  end
end
