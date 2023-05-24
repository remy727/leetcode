# frozen_string_literal: true

# 300. Longest Increasing Subsequence
# https://leetcode.com/problems/longest-increasing-subsequence
# Medium

=begin
Given an integer array nums, return the length of the longest strictly increasing subsequence.

Example 1:
Input: nums = [10,9,2,5,3,7,101,18]
Output: 4
Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.

Example 2:
Input: nums = [0,1,0,3,2,3]
Output: 4

Example 3:
Input: nums = [7,7,7,7,7,7,7]
Output: 1

Constraints:
1 <= nums.length <= 2500
-104 <= nums[i] <= 104
=end

# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
  tails = Array.new
  k = 0
  nums.each do |num|
    start, finish = 0, k
    while start != finish
      mid = (start + finish) / 2
      if tails[mid] < num
        start = mid + 1
      else
        finish = mid
      end
    end
    tails[start] = num
    k += 1 if start == k
  end
  k
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_length_of_lis < Test::Unit::TestCase
  def test_
    assert_equal 4, length_of_lis([10, 9, 2, 5, 3, 7, 101, 18])
    assert_equal 4, length_of_lis([0, 1, 0, 3, 2, 3])
    assert_equal 1, length_of_lis([7, 7, 7, 7, 7, 7, 7])
  end
end
