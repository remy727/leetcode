# frozen_string_literal: true

# 1679. Max Number of K-Sum Pairs
# https://leetcode.com/problems/max-number-of-k-sum-pairs
# Medium

=begin
You are given an integer array nums and an integer k.

In one operation, you can pick two numbers from the array whose sum equals k and remove them from the array.

Return the maximum number of operations you can perform on the array.

Example 1:
Input: nums = [1,2,3,4], k = 5
Output: 2
Explanation: Starting with nums = [1,2,3,4]:
- Remove numbers 1 and 4, then nums = [2,3]
- Remove numbers 2 and 3, then nums = []
There are no more pairs that sum up to 5, hence a total of 2 operations.

Example 2:
Input: nums = [3,1,3,4,3], k = 6
Output: 1
Explanation: Starting with nums = [3,1,3,4,3]:
- Remove the first two 3's, then nums = [1,4,3]
There are no more pairs that sum up to 6, hence a total of 1 operation.

Constraints:
* 1 <= nums.length <= 105
* 1 <= nums[i] <= 109
* 1 <= k <= 109
=end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def max_operations(nums, k)
  h = Hash.new(0)
  out = 0

  nums.each do |num|
    next if num >= k

    if h[k - num] > 0
      h[k - num] -= 1
      out += 1
    else
      h[num] += 1
    end
  end

  out
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_operations < Test::Unit::TestCase
  def test_
    assert_equal 2, max_operations([1, 2, 3, 4], 5)
    assert_equal 1, max_operations([3, 1, 3, 4, 3], 6)
  end
end
