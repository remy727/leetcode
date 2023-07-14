# frozen_string_literal: true

# 1218. Longest Arithmetic Subsequence of Given Difference
# Medium
# https://leetcode.com/problems/longest-arithmetic-subsequence-of-given-difference

=begin
Given an integer array arr and an integer difference, return the length of the longest subsequence in arr which is an arithmetic sequence such that the difference between adjacent elements in the subsequence equals difference.
A subsequence is a sequence that can be derived from arr by deleting some or no elements without changing the order of the remaining elements.

Example 1:
Input: arr = [1,2,3,4], difference = 1
Output: 4
Explanation: The longest arithmetic subsequence is [1,2,3,4].

Example 2:
Input: arr = [1,3,5,7], difference = 1
Output: 1
Explanation: The longest arithmetic subsequence is any single element.

Example 3:
Input: arr = [1,5,7,8,5,3,4,2,1], difference = -2
Output: 4
Explanation: The longest arithmetic subsequence is [7,5,3,1].

Constraints:
* 1 <= arr.length <= 105
* -104 <= arr[i], difference <= 104
=end

# @param {Integer[]} arr
# @param {Integer} difference
# @return {Integer}
def longest_subsequence(arr, difference)
  counts = Hash.new(0)
  arr.reduce(0) do |max_size, num|
    counts[num] = counts[num - difference] + 1
    [max_size, counts[num]].max
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_longest_subsequence < Test::Unit::TestCase
  def test_
    assert_equal 4, longest_subsequence([1, 2, 3, 4], 1)
    assert_equal 1, longest_subsequence([1, 3, 5, 7], 1)
    assert_equal 4, longest_subsequence([1, 5, 7, 8, 5, 3, 4, 2, 1], -2)
  end
end
