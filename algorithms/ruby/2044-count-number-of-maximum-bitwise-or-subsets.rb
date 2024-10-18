# frozen_string_literal: true

# 2044. Count Number of Maximum Bitwise-OR Subsets
# Medium
# https://leetcode.com/problems/count-number-of-maximum-bitwise-or-subsets

=begin
Given an integer array nums, find the maximum possible bitwise OR of a subset of nums and return the number of different non-empty subsets with the maximum bitwise OR.
An array a is a subset of an array b if a can be obtained from b by deleting some (possibly zero) elements of b. Two subsets are considered different if the indices of the elements chosen are different.
The bitwise OR of an array a is equal to a[0] OR a[1] OR ... OR a[a.length - 1] (0-indexed).

Example 1:
Input: nums = [3,1]
Output: 2
Explanation: The maximum possible bitwise OR of a subset is 3. There are 2 subsets with a bitwise OR of 3:
- [3]
- [3,1]

Example 2:
Input: nums = [2,2,2]
Output: 7
Explanation: All non-empty subsets of [2,2,2] have a bitwise OR of 2. There are 23 - 1 = 7 total subsets.

Example 3:
Input: nums = [3,2,1,5]
Output: 6
Explanation: The maximum possible bitwise OR of a subset is 7. There are 6 subsets with a bitwise OR of 7:
- [3,5]
- [3,1,5]
- [3,2,5]
- [3,2,1,5]
- [2,5]
- [2,1,5]

Constraints:
* 1 <= nums.length <= 16
* 1 <= nums[i] <= 105
=end

# @param {Integer[]} nums
# @return {Integer}
def count_max_or_subsets(nums)
  dp = Hash.new(0)
  dp[0] = 1
  nums.each do |num|
    cl = dp.clone
    cl.each do |k, v|
      dp[k | num] += v
    end
  end
  dp[dp.keys.max]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_count_max_or_subsets < Test::Unit::TestCase
  def test_
    assert_equal 2, count_max_or_subsets([3, 1])
    assert_equal 7, count_max_or_subsets([2, 2, 2])
    assert_equal 6, count_max_or_subsets([3, 2, 1, 5])
  end
end
