# frozen_string_literal: true

# https://leetcode.com/problems/maximum-sum-circular-subarray
# 918. Maximum Sum Circular Subarray
# Medium

=begin
Given a circular integer array nums of length n, return the maximum possible sum of a non-empty subarray of nums.

A circular array means the end of the array connects to the beginning of the array. Formally, the next element of nums[i] is nums[(i + 1) % n] and the previous element of nums[i] is nums[(i - 1 + n) % n].

A subarray may only include each element of the fixed buffer nums at most once. Formally, for a subarray nums[i], nums[i + 1], ..., nums[j], there does not exist i <= k1, k2 <= j with k1 % n == k2 % n.

Example 1:
Input: nums = [1,-2,3,-2]
Output: 3
Explanation: Subarray [3] has maximum sum 3.

Example 2:
Input: nums = [5,-3,5]
Output: 10
Explanation: Subarray [5,5] has maximum sum 5 + 5 = 10.

Example 3:
Input: nums = [-3,-2,-3]
Output: -2
Explanation: Subarray [-2] has maximum sum -2.

Constraints:
* n == nums.length
* 1 <= n <= 3 * 104
* -3 * 104 <= nums[i] <= 3 * 104
=end

# @param {Integer[]} nums
# @return {Integer}
def max_subarray_sum_circular(nums)
  curr_min = 0
  curr_max = 0
  mini = 1.0 / 0.0
  maxi = -1.0 / 0.0
  sum = 0
  nums.each do |num|
    curr_min = [num, curr_min + num].min
    mini = [mini, curr_min].min
    curr_max = [num, curr_max + num].max
    maxi = [maxi, curr_max].max
    sum += num
  end

  if maxi > 0
    [maxi, sum - mini].max
  else
    maxi
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_subarray_sum_circular < Test::Unit::TestCase
  def test_
    assert_equal 3, max_subarray_sum_circular([1, -2, 3, -2])
    assert_equal 10, max_subarray_sum_circular([5, -3, 5])
    assert_equal(-2, max_subarray_sum_circular([-3, -2, -3]))
  end
end
