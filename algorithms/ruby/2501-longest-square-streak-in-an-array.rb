# frozen_string_literal: true

# 2501. Longest Square Streak in an Array
# Medium
# https://leetcode.com/problems/longest-square-streak-in-an-array

=begin
You are given an integer array nums. A subsequence of nums is called a square streak if:
* The length of the subsequence is at least 2, and
* after sorting the subsequence, each element (except the first element) is the square of the previous number.
Return the length of the longest square streak in nums, or return -1 if there is no square streak.
A subsequence is an array that can be derived from another array by deleting some or no elements without changing the order of the remaining elements.

Example 1:
Input: nums = [4,3,6,16,8,2]
Output: 3
Explanation: Choose the subsequence [4,16,2]. After sorting it, it becomes [2,4,16].
- 4 = 2 * 2.
- 16 = 4 * 4.
Therefore, [4,16,2] is a square streak.
It can be shown that every subsequence of length 4 is not a square streak.

Example 2:
Input: nums = [2,3,5,6,7]
Output: -1
Explanation: There is no square streak in nums so return -1.

Constraints:
* 2 <= nums.length <= 105
* 2 <= nums[i] <= 105
=end

# @param {Integer[]} nums
# @return {Integer}
def longest_square_streak(nums)
  nums = nums.uniq.sort
  num_set = nums.to_set
  max_length = 0

  nums.each do |num|
    length = 0
    current = num

    while num_set.include?(current)
      length += 1
      current = current**2
    end

    if length > 1
      max_length = [max_length, length].max
    end
  end

  max_length > 1 ? max_length : -1
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_longest_square_streak < Test::Unit::TestCase
  def test_
    assert_equal 3, longest_square_streak([4, 3, 6, 16, 8, 2])
    assert_equal(-1, longest_square_streak([2, 3, 5, 6, 7]))
  end
end
