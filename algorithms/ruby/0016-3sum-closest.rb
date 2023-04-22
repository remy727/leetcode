# frozen_string_literal: true

# 16. 3Sum Closest
# https://leetcode.com/problems/3sum-closest/
# Difficulty: Medium

=begin
Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.

Return the sum of the three integers.

You may assume that each input would have exactly one solution.

Example 1:
Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

Example 2:
Input: nums = [0,0,0], target = 1
Output: 0
Explanation: The sum that is closest to the target is 0. (0 + 0 + 0 = 0).

Constraints:
* 3 <= nums.length <= 500
* -1000 <= nums[i] <= 1000
* -104 <= target <= 104
=end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  nums.sort!
  result = Float::INFINITY

  (0..nums.size - 3).each do |i|
    left = i + 1
    right = nums.size - 1

    next if i.positive? && nums[i] == nums[i - 1]

    while left < right
      sum = nums[i] + nums[left] + nums[right]
      return sum if sum == target

      sum < target ? left += 1 : right -= 1
      result = sum if (target - sum).abs < (target - result).abs
    end
  end

  result
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_three_sum_closest < Test::Unit::TestCase
  def test_
    assert_equal(2, three_sum_closest([-1, 2, 1, -4], 1))
    assert_equal(0, three_sum_closest([0, 0, 0], 1))
  end
end
