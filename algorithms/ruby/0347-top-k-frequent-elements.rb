# frozen_string_literal: true

# 347. Top K Frequent Elements
# https://leetcode.com/problems/top-k-frequent-elements
# Medium

=begin
Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

Example 1:
Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]

Example 2:
Input: nums = [1], k = 1
Output: [1]

Constraints:
1 <= nums.length <= 105
-104 <= nums[i] <= 104
k is in the range [1, the number of unique elements in the array].
It is guaranteed that the answer is unique.
=end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  nums.tally.sort_by { |_, v| -v }.first(k).to_h.keys
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_top_k_frequent < Test::Unit::TestCase
  def test_
    assert_equal [1, 2], top_k_frequent([1, 1, 1, 2, 2, 3], 2)
    assert_equal [1], top_k_frequent([1], 1)
  end
end
