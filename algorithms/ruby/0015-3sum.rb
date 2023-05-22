# frozen_string_literal: true

# 15. 3Sum
# https://leetcode.com/problems/3sum
# Medium

=begin
Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.

Example 1:
Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
Explanation:
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
The distinct triplets are [-1,0,1] and [-1,-1,2].
Notice that the order of the output and the order of the triplets does not matter.

Example 2:
Input: nums = [0,1,1]
Output: []
Explanation: The only possible triplet does not sum up to 0.

Example 3:
Input: nums = [0,0,0]
Output: [[0,0,0]]
Explanation: The only possible triplet sums up to 0.

Constraints:
3 <= nums.length <= 3000
-105 <= nums[i] <= 105
=end

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  nums.sort!
  triplets = []
  n = nums.length - 1

  (0..n - 2).each do |i|
    left = i + 1
    right = n
    target = -nums[i]

    next if i.positive? && nums[i] == nums[i - 1]

    while left < right
      sum = nums[left] + nums[right]
      if sum < target
        left += 1
      elsif sum > target
        right -= 1
      elsif sum == target
        triplets << [nums[i], nums[left], nums[right]]
        left += 1
        right -= 1

        left += 1 while left < right && nums[left] == nums[left - 1]
      end
    end
  end

  triplets.uniq
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_three_sum < Test::Unit::TestCase
  def test_
    assert_equal [[-1, -1, 2], [-1, 0, 1]], three_sum([-1, 0, 1, 2, -1, -4])
    assert_equal [], three_sum([0, 1, 1])
    assert_equal [[0, 0, 0]], three_sum([0, 0, 0])
  end
end
