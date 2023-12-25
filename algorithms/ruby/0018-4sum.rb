# frozen_string_literal: true

# 18. 4Sum
# Medium
# https://leetcode.com/problems/4sum

=begin
Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:
* 0 <= a, b, c, d < n
* a, b, c, and d are distinct.
* nums[a] + nums[b] + nums[c] + nums[d] == target
You may return the answer in any order.

Example 1:
Input: nums = [1,0,-1,0,-2,2], target = 0
Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]

Example 2:
Input: nums = [2,2,2,2,2], target = 8
Output: [[2,2,2,2]]

Constraints:
1 <= nums.length <= 200
-109 <= nums[i] <= 109
-109 <= target <= 109
=end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def max_four(nums)
  count = nums.tally
  arr = []
  count.each do |k, v|
    ([v, 4].min).times { arr << k }
  end
  arr
end

def four_sum(nums, target)
  nums = max_four(nums)
  res = Set[]

  # hash: sum is key, array of pairs of indices is value
  two_sum = Hash.new { |h, k| h[k] = [] }

  (0...nums.length).each do |a|
    (a + 1...nums.length).each do |b|
      sum = nums[a] + nums[b]

      two_sum[target - sum].each do |pair|
        if ([a, b] + pair).uniq.length == 4
          c, d = pair
          res.add([nums[a], nums[b], nums[c], nums[d]].sort)
        end
      end

      two_sum[sum] << [a, b]
    end
  end

  res.to_a
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_four_sum < Test::Unit::TestCase
  def test_
    assert_equal [[-2, -1, 1, 2], [-2, 0, 0, 2], [-1, 0, 0, 1]].sort, four_sum([1, 0, -1, 0, -2, 2], 0).sort
    assert_equal [[2, 2, 2, 2]].sort, four_sum([2, 2, 2, 2, 2], 8).sort
  end
end
