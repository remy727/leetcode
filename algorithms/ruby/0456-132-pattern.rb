# frozen_string_literal: true

# 456. 132 Pattern
# Medium
# https://leetcode.com/problems/132-pattern

=begin
Given an array of n integers nums, a 132 pattern is a subsequence of three integers nums[i], nums[j] and nums[k] such that i < j < k and nums[i] < nums[k] < nums[j].
Return true if there is a 132 pattern in nums, otherwise, return false.

Example 1:
Input: nums = [1,2,3,4]
Output: false
Explanation: There is no 132 pattern in the sequence.

Example 2:
Input: nums = [3,1,4,2]
Output: true
Explanation: There is a 132 pattern in the sequence: [1, 4, 2].

Example 3:
Input: nums = [-1,3,2,0]
Output: true
Explanation: There are three 132 patterns in the sequence: [-1, 3, 2], [-1, 3, 0] and [-1, 2, 0].

Constraints:
n == nums.length
1 <= n <= 2 * 105
-109 <= nums[i] <= 109
=end

# @param {Integer[]} nums
# @return {Boolean}
def find132pattern(nums)
  stack = []
  minVal = nums[0]
  (1...nums.size).each do |i|
    while (!stack.empty?) && nums[i] >= stack[-1][0]
      stack.pop
    end
    if (!stack.empty?) && nums[i] > stack[-1][1]
      return true
    end
    stack.push([nums[i], minVal])
    minVal = nums[i] < minVal ? nums[i] : minVal
  end
  false
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_find132pattern < Test::Unit::TestCase
  def test_
    assert_equal false, find132pattern([1, 2, 3, 4])
    assert_equal true, find132pattern([3, 1, 4, 2])
    assert_equal true, find132pattern([-1, 3, 2, 0])
  end
end
