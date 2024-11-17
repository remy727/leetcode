# frozen_string_literal: true

# 3097. Shortest Subarray With OR at Least K II
# https://leetcode.com/problems/shortest-subarray-with-or-at-least-k-ii
# Medium

=begin
You are given an array nums of non-negative integers and an integer k.
An array is called special if the bitwise OR of all of its elements is at least k.
Return the length of the shortest special non-empty subarray of nums, or return -1 if no special subarray exists.

Example 1:
Input: nums = [1,2,3], k = 2
Output: 1
Explanation:
The subarray [3] has OR value of 3. Hence, we return 1.
Example 2:
Input: nums = [2,1,8], k = 10
Output: 3
Explanation:
The subarray [2,1,8] has OR value of 11. Hence, we return 3.
Example 3:
Input: nums = [1,2], k = 0
Output: 1
Explanation:
The subarray [1] has OR value of 1. Hence, we return 1.

Constraints:
* 1 <= nums.length <= 2 * 105
* 0 <= nums[i] <= 109
* 0 <= k <= 109
=end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def minimum_subarray_length(nums, k)
  or_val = 0
  ans = Float::INFINITY
  bit_count = Array.new(32, 0)
  j = 0

  nums.each_with_index do |num, i|
    or_val |= num
    (0...32).each do |t|
      bit_count[t] += (num & (1 << t)) != 0 ? 1 : 0
    end

    next if or_val < k

    while j <= i && or_val >= k
      (0...32).each do |t|
        bit_count[t] += (nums[j] & (1 << t)) != 0 ? -1 : 0
        or_val &= ~(1 << t) if bit_count[t] == 0
      end
      ans = [ans, i - j + 1].min
      j += 1
    end
  end

  ans == Float::INFINITY ? -1 : ans
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_minimum_subarray_length < Test::Unit::TestCase
  def test_
    assert_equal 1, minimum_subarray_length([1, 2, 3], 2)
    assert_equal 3, minimum_subarray_length([2, 1, 8], 10)
    assert_equal 1, minimum_subarray_length([1, 2], 0)
  end
end
