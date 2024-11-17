# frozen_string_literal: true

# 2563. Count the Number of Fair Pairs
# https://leetcode.com/problems/count-the-number-of-fair-pairs
# Medium

=begin
Given a 0-indexed integer array nums of size n and two integers lower and upper, return the number of fair pairs.
A pair (i, j) is fair if:
* 0 <= i < j < n, and
* lower <= nums[i] + nums[j] <= upper

Example 1:
Input: nums = [0,1,7,4,4,5], lower = 3, upper = 6
Output: 6
Explanation: There are 6 fair pairs: (0,3), (0,4), (0,5), (1,3), (1,4), and (1,5).
Example 2:
Input: nums = [1,7,9,2,5], lower = 11, upper = 11
Output: 1
Explanation: There is a single fair pair: (2,3).

Constraints:
* 1 <= nums.length <= 105
* nums.length == n
* -109 <= nums[i] <= 109
* -109 <= lower <= upper <= 109
=end

# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {Integer}
def count_fair_pairs(nums, lower, upper)
  nums.sort!

  nums.each_with_index.sum do |num, i|
    lower_idx = nums.bsearch_index { |x| x >= lower - num } || nums.size
    lower_idx = i + 1 if lower_idx <= i

    upper_idx = nums.bsearch_index { |x| x > upper - num } || nums.size
    next 0 if upper_idx < lower_idx

    upper_idx - lower_idx
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_count_fair_pairs < Test::Unit::TestCase
  def test_
    assert_equal 6, count_fair_pairs([0, 1, 7, 4, 4, 5], 3, 6)
    assert_equal 1, count_fair_pairs([1, 7, 9, 2, 5], 11, 11)
  end
end
