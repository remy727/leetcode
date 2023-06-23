# frozen_string_literal: true

# 1027. Longest Arithmetic Subsequence
# Medium
# https://leetcode.com/problems/longest-arithmetic-subsequence

=begin
Given an array nums of integers, return the length of the longest arithmetic subsequence in nums.

Note that:
  * A subsequence is an array that can be derived from another array by deleting some or no elements without changing the order of the remaining elements.
  * A sequence seq is arithmetic if seq[i + 1] - seq[i] are all the same value (for 0 <= i < seq.length - 1).

Example 1:
Input: nums = [3,6,9,12]
Output: 4
Explanation:  The whole array is an arithmetic sequence with steps of length = 3.

Example 2:
Input: nums = [9,4,7,2,10]
Output: 3
Explanation:  The longest arithmetic subsequence is [4,7,10].

Example 3:
Input: nums = [20,1,15,3,10,5,8]
Output: 4
Explanation:  The longest arithmetic subsequence is [20,15,10,5].

Constraints:
  * 2 <= nums.length <= 1000
  * 0 <= nums[i] <= 500
=end

# @param {Integer[]} nums
# @return {Integer}
def longest_arith_seq_length(arr)
  tab = Array.new(arr.length) { |h, k| Hash.new(1) }

  (1...arr.length).each do |i|
    (0...i).each do |j|
      a, b = arr[i], arr[j]
      diff = b - a

      tab[i][diff] = tab[j][diff] + 1
    end
  end

  max = 0

  tab.each do |hash|
    max_val = hash.values.max || 0
    max = max_val if max_val > max
  end

  max
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_longest_arith_seq_length < Test::Unit::TestCase
  def test_
    assert_equal 4, longest_arith_seq_length([3, 6, 9, 12])
    assert_equal 3, longest_arith_seq_length([9, 4, 7, 2, 10])
    assert_equal 4, longest_arith_seq_length([20, 1, 15, 3, 10, 5, 8])
  end
end
