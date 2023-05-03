# frozen_string_literal: true

# 283. Move Zeroes
# https://leetcode.com/problems/move-zeroes
# Difficulty: Easy

=begin
Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Note that you must do this in-place without making a copy of the array.

Example 1:
Input: nums = [0,1,0,3,12]
Output: [1,3,12,0,0]

Example 2:
Input: nums = [0]
Output: [0]

Constraints:
* 1 <= nums.length <= 104
* -231 <= nums[i] <= 231 - 1
=end

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  k = 0
  nums.length.times do |i|
    next if nums[i].zero?

    nums[k] = nums[i]
    k += 1
  end

  k.upto(nums.length - 1).each { |i| nums[i] = 0 }
end
