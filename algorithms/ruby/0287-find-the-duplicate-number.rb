# frozen_string_literal: true

# 287. Find the Duplicate Number
# Medium
# https://leetcode.com/problems/find-the-duplicate-number

=begin
Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.
There is only one repeated number in nums, return this repeated number.
You must solve the problem without modifying the array nums and uses only constant extra space.

Example 1:
Input: nums = [1,3,4,2,2]
Output: 2

Example 2:
Input: nums = [3,1,3,4,2]
Output: 3


Constraints:
* 1 <= n <= 105
* nums.length == n + 1
* 1 <= nums[i] <= n
* All the integers in nums appear only once except for precisely one integer which appears two or more times.
=end

# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
  left, right = 1, nums.max

  while left < right
    mid = (left + right) / 2

    count = nums.count { |x| x <= mid }

    if count > mid
      right = mid
    else
      left = mid + 1
    end
  end

  left
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_find_duplicate < Test::Unit::TestCase
  def test_
    assert_equal 2, find_duplicate([1, 3, 4, 2, 2])
    assert_equal 3, find_duplicate([3, 1, 3, 4, 2])
  end
end
