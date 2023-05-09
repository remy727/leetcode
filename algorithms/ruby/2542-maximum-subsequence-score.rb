# frozen_string_literal: true

# 2542. Maximum Subsequence Score
# https://leetcode.com/problems/maximum-subsequence-score
# Medium

=begin
You are given two 0-indexed integer arrays nums1 and nums2 of equal length n and a positive integer k. You must choose a subsequence of indices from nums1 of length k.

For chosen indices i0, i1, ..., ik - 1, your score is defined as:

The sum of the selected elements from nums1 multiplied with the minimum of the selected elements from nums2.
It can defined simply as: (nums1[i0] + nums1[i1] +...+ nums1[ik - 1]) * min(nums2[i0] , nums2[i1], ... ,nums2[ik - 1]).
Return the maximum possible score.

A subsequence of indices of an array is a set that can be derived from the set {0, 1, ..., n-1} by deleting some or no elements.

Example 1:
Input: nums1 = [1,3,3,2], nums2 = [2,1,3,4], k = 3
Output: 12
Explanation:
The four possible subsequence scores are:
- We choose the indices 0, 1, and 2 with score = (1+3+3) * min(2,1,3) = 7.
- We choose the indices 0, 1, and 3 with score = (1+3+2) * min(2,1,4) = 6.
- We choose the indices 0, 2, and 3 with score = (1+3+2) * min(2,3,4) = 12.
- We choose the indices 1, 2, and 3 with score = (3+3+2) * min(1,3,4) = 8.
Therefore, we return the max score, which is 12.

Example 2:
Input: nums1 = [4,2,3,1,1], nums2 = [7,5,10,9,6], k = 1
Output: 30
Explanation:
Choosing index 2 is optimal: nums1[2] * nums2[2] = 3 * 10 = 30 is the maximum possible score.
=end

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer}
def max_score(nums1, nums2, k)
  n = nums2.size
  inds_max_min = (0...n).to_a.sort_by { |i| -nums2[i] }

  sorted_array = []
  max = 0
  sum = 0
  inds_max_min.each do |index|
    next if sorted_array.size == k && sorted_array.last >= nums1[index]
    sum += nums1[index]
    insert_in_sort_array(sorted_array, nums1[index])
    sum -= sorted_array.pop if sorted_array.size > k
    max = [max, sum * nums2[index]].max if sorted_array.size == k
  end

  max
end

def insert_in_sort_array(array, insert_value)
  insert_at = array.bsearch_index { |value| (value <=> insert_value) <= 0 } || array.size
  array.insert(insert_at, insert_value)
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_max_score < Test::Unit::TestCase
  def test_
    assert_equal 12, max_score([1, 3, 3, 2], [2, 1, 3, 4], 3)
    assert_equal 30, max_score([4, 2, 3, 1, 1], [7, 5, 10, 9, 6], 1)
  end
end
