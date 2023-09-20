# frozen_string_literal: true

# 1658. Minimum Operations to Reduce X to Zero
# Medium
# https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero

=begin
You are given an integer array nums and an integer x. In one operation, you can either remove the leftmost or the rightmost element from the array nums and subtract its value from x. Note that this modifies the array for future operations.
Return the minimum number of operations to reduce x to exactly 0 if it is possible, otherwise, return -1.

Example 1:
Input: nums = [1,1,4,2,3], x = 5
Output: 2
Explanation: The optimal solution is to remove the last two elements to reduce x to zero.

Example 2:
Input: nums = [5,6,7,8,9], x = 4
Output: -1

Example 3:
Input: nums = [3,2,20,1,1,3], x = 10
Output: 5
Explanation: The optimal solution is to remove the last three elements and the first two elements (5 operations in total) to reduce x to zero.

Constraints:
* 1 <= nums.length <= 105
* 1 <= nums[i] <= 104
* 1 <= x <= 109
=end

# @param {Integer[]} nums
# @param {Integer} x
# @return {Integer}
def min_operations(nums, x)
  target = nums.sum - x

  if target == 0
    return nums.length
  end

  left = 0
  right = 0
  curr = 0
  cnt = 0

  while right < nums.length
    curr += nums[right]

    while left < right && curr > target
      curr -= nums[left]
      left += 1
    end

    if curr == target
      cnt = [cnt, right - left + 1].max
    end

    right += 1

  end

  cnt == 0 ? -1 : nums.length - cnt
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_min_operations < Test::Unit::TestCase
  def test_
    assert_equal 2, min_operations([1, 1, 4, 2, 3], 5)
    assert_equal(-1, min_operations([5, 6, 7, 8, 9], 4))
    assert_equal 5, min_operations([3, 2, 20, 1, 1, 3], 10)
  end
end
