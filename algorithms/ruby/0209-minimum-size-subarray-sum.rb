# frozen_string_literal: true

# 209. Minimum Size Subarray Sum
# https://leetcode.com/problems/minimum-size-subarray-sum
# Medium

=begin
Given an array of positive integers nums and a positive integer target, return the minimal length of a subarray whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.

Example 1:
Input: target = 7, nums = [2,3,1,2,4,3]
Output: 2
Explanation: The subarray [4,3] has the minimal length under the problem constraint.

Example 2:
Input: target = 4, nums = [1,4,4]
Output: 1

Example 3:
Input: target = 11, nums = [1,1,1,1,1,1,1,1]
Output: 0

Constraints:
1 <= target <= 109
1 <= nums.length <= 105
1 <= nums[i] <= 104
=end

# @param {Integer} target
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(target, nums)
  return 0 if nums.empty?
  min = nil
  i, j = 0, 0
  sum = nums[i]
  while j < nums.size
    if sum < target
      j += 1
      sum += nums[j] if j < nums.size
      next
    end
    if i == j
      return 1
    end
    length = j - i + 1
    min = length if min.nil?
    min = length if min > length
    i += 1
    sum -= nums[i - 1]
  end
  min || 0
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_min_sub_array_len < Test::Unit::TestCase
  def test_
    assert_equal 2, min_sub_array_len(7, [2, 3, 1, 2, 4, 3])
    assert_equal 1, min_sub_array_len(4, [1, 4, 4])
    assert_equal 0, min_sub_array_len(11, [1, 1, 1, 1, 1, 1, 1, 1])
  end
end
