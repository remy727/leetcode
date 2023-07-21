# frozen_string_literal: true

# 673. Number of Longest Increasing Subsequence
# Medium
# https://leetcode.com/problems/number-of-longest-increasing-subsequence

=begin
Given an integer array nums, return the number of longest increasing subsequences.
Notice that the sequence has to be strictly increasing.

Example 1:
Input: nums = [1,3,5,4,7]
Output: 2
Explanation: The two longest increasing subsequences are [1, 3, 4, 7] and [1, 3, 5, 7].

Example 2:
Input: nums = [2,2,2,2,2]
Output: 5
Explanation: The length of the longest increasing subsequence is 1, and there are 5 increasing subsequences of length 1, so output 5.

Constraints:
* 1 <= nums.length <= 2000
* -106 <= nums[i] <= 106
=end

# @param {Integer[]} nums
# @return {Integer}
def find_number_of_lis(nums)
  n = nums.length
  return 0 if n == 0
  dp = Array.new(n, 1)
  count = Array.new(n, 1)

  (0...n).each do |i|
    (0...i).each do |j|
      if nums[i] > nums[j]
        if dp[i] == dp[j] + 1
          count[i] += count[j]
        elsif dp[i] < dp[j] + 1
          dp[i] = dp[j] + 1
          count[i] = count[j]
        end
      end
    end
  end

  max_length = dp.max
  count.select.with_index { |_, i| dp[i] == max_length }.sum
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_find_number_of_lis < Test::Unit::TestCase
  def test_
    assert_equal 2, find_number_of_lis([1, 3, 5, 4, 7])
    assert_equal 5, find_number_of_lis([2, 2, 2, 2, 2])
  end
end
