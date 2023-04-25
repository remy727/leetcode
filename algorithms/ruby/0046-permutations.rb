# frozen_string_literal: true

# 46. Permutations
# https://leetcode.com/problems/permutations
# Difficulty: Medium

=begin
Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

Example 1:
Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

Example 2:
Input: nums = [0,1]
Output: [[0,1],[1,0]]

Example 3:
Input: nums = [1]
Output: [[1]]

Constraints:
1 <= nums.length <= 6
-10 <= nums[i] <= 10
All the integers of nums are unique.
=end

# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums, temp = [], res = [])
  nums.empty? ? res << temp : nums.each { |num| permute(nums - [num], temp + [num], res) }
  res
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_combination_sumpermute < Test::Unit::TestCase
  def test_
    assert_equal [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]], permute([1, 2, 3])
    assert_equal [[0, 1], [1, 0]], permute([0, 1])
    assert_equal [[1]], permute([1])
  end
end
