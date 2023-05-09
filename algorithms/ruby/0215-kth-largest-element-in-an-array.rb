# frozen_string_literal: true

# 215. Kth Largest Element in an Array
# https://leetcode.com/problems/kth-largest-element-in-an-array
# Medium

=begin
Given an integer array nums and an integer k, return the kth largest element in the array.

Note that it is the kth largest element in the sorted order, not the kth distinct element.

You must solve it in O(n) time complexity.

Example 1:
Input: nums = [3,2,1,5,6,4], k = 2
Output: 5

Example 2:
Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
Output: 4

Constraints:
1 <= k <= nums.length <= 105
-104 <= nums[i] <= 104
=end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  nums.sort[-k]
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_find_kth_largest < Test::Unit::TestCase
  def test_
    assert_equal 5, find_kth_largest([3, 2, 1, 5, 6, 4], 2)
    assert_equal 4, find_kth_largest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4)
  end
end

# ********************#
#     Benchmark       #
# ********************#

require "benchmark"

nums = [3, 2, 3, 1, 2, 4, 5, 5, 6]
k = 4
Benchmark.bm do |x|
  x.report("find_kth_largest: ") { find_kth_largest(nums, k) }
end
