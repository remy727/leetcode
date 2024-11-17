# frozen_string_literal: true

# 3254. Find the Power of K-Size Subarrays I
# https://leetcode.com/problems/find-the-power-of-k-size-subarrays-i
# Medium

=begin
You are given an array of integers nums of length n and a positive integer k.
The power of an array is defined as:
* Its maximum element if all of its elements are consecutive and sorted in ascending order.
* -1 otherwise.
You need to find the power of all subarrays of nums of size k.
Return an integer array results of size n - k + 1, where results[i] is the power of nums[i..(i + k - 1)].

Example 1:
Input: nums = [1,2,3,4,3,2,5], k = 3
Output: [3,4,-1,-1,-1]
Explanation:
There are 5 subarrays of nums of size 3:
* [1, 2, 3] with the maximum element 3.
* [2, 3, 4] with the maximum element 4.
* [3, 4, 3] whose elements are not consecutive.
* [4, 3, 2] whose elements are not sorted.
* [3, 2, 5] whose elements are not consecutive.
Example 2:
Input: nums = [2,2,2,2,2], k = 4
Output: [-1,-1]
Example 3:
Input: nums = [3,2,3,2,3,2], k = 2
Output: [-1,3,-1,3,-1]

Constraints:
* 1 <= n == nums.length <= 500
* 1 <= nums[i] <= 105
* 1 <= k <= n
=end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def results_array(nums, k)
  return nums if k == 1

  n = nums.length
  result = []
  left = 0
  right = 1

  while right < n
    is_not_consecutive = nums[right] - nums[right - 1] != 1

    if is_not_consecutive
      while left < right && left + k - 1 < n
        result.push(-1)
        left += 1
      end
      left = right
    elsif right - left == k - 1
      result.push(nums[right])
      left += 1
    end

    right += 1
  end

  result
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_results_array < Test::Unit::TestCase
  def test_
    assert_equal [3, 4, -1, -1, -1], results_array([1, 2, 3, 4, 3, 2, 5], 3)
    assert_equal [-1, -1], results_array([2, 2, 2, 2, 2], 4)
    assert_equal [-1, 3, -1, 3, -1], results_array([3, 2, 3, 2, 3, 2], 2)
  end
end
