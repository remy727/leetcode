# frozen_string_literal: true

# 2461. Maximum Sum of Distinct Subarrays With Length K
# https://leetcode.com/problems/maximum-sum-of-distinct-subarrays-with-length-k
# Medium

=begin
You are given an integer array nums and an integer k. Find the maximum subarray sum of all the subarrays of nums that meet the following conditions:
* The length of the subarray is k, and
* All the elements of the subarray are distinct.
Return the maximum subarray sum of all the subarrays that meet the conditions. If no subarray meets the conditions, return 0.
A subarray is a contiguous non-empty sequence of elements within an array.

Example 1:
Input: nums = [1,5,4,2,9,9,9], k = 3
Output: 15
Explanation: The subarrays of nums with length 3 are:
- [1,5,4] which meets the requirements and has a sum of 10.
- [5,4,2] which meets the requirements and has a sum of 11.
- [4,2,9] which meets the requirements and has a sum of 15.
- [2,9,9] which does not meet the requirements because the element 9 is repeated.
- [9,9,9] which does not meet the requirements because the element 9 is repeated.
We return 15 because it is the maximum subarray sum of all the subarrays that meet the conditions

Example 2:
Input: nums = [4,4,4], k = 3
Output: 0
Explanation: The subarrays of nums with length 3 are:
- [4,4,4] which does not meet the requirements because the element 4 is repeated.
We return 0 because no subarrays meet the conditions.

Constraints:
* 1 <= k <= nums.length <= 10^5
* 1 <= nums[i] <= 10^5
=end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def maximum_subarray_sum(nums, k)
  res = 0
  prev_idx = {} # num -> prev index of num
  cur_sum = 0
  l = 0

  nums.each_with_index do |num, r|
    cur_sum += num

    i = prev_idx[num] || -1

    while l <= i || r - l + 1 > k
      cur_sum -= nums[l]
      l += 1
    end

    res = [res, cur_sum].max if r - l + 1 == k

    prev_idx[num] = r
  end

  res
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_maximum_subarray_sum < Test::Unit::TestCase
  def test_
    assert_equal 15, maximum_subarray_sum([1, 5, 4, 2, 9, 9, 9], 3)
    assert_equal 0, maximum_subarray_sum([4, 4, 4], 3)
  end
end
