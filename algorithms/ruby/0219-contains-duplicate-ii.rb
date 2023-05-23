# frozen_string_literal: true

# 219. Contains Duplicate II
# https://leetcode.com/problems/contains-duplicate-ii
# Easy

=begin
Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.

Example 1:
Input: nums = [1,2,3,1], k = 3
Output: true

Example 2:
Input: nums = [1,0,1,1], k = 1
Output: true

Example 3:
Input: nums = [1,2,3,1,2,3], k = 2
Output: false

Constraints:
1 <= nums.length <= 105
-109 <= nums[i] <= 109
0 <= k <= 105
=end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  hash = {}
  nums.each_with_index do |value, j|
    i = hash[value]
    if i && (j - i) <= k
      return true
    end
    hash[value] = j
  end
  false
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_contains_nearby_duplicate < Test::Unit::TestCase
  def test_
    assert_equal true, contains_nearby_duplicate([1, 2, 3, 1], 3)
    assert_equal true, contains_nearby_duplicate([1, 0, 1, 1], 1)
    assert_equal false, contains_nearby_duplicate([1, 2, 3, 1, 2, 3], 2)
  end
end
