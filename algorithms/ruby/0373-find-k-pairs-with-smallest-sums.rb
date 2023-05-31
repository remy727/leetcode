# frozen_string_literal: true

# https://leetcode.com/problems/find-k-pairs-with-smallest-sums
# 373. Find K Pairs with Smallest Sums
# Medium

# TODO: Resolve TLE

=begin
You are given two integer arrays nums1 and nums2 sorted in ascending order and an integer k.

Define a pair (u, v) which consists of one element from the first array and one element from the second array.

Return the k pairs (u1, v1), (u2, v2), ..., (uk, vk) with the smallest sums.

Example 1:
Input: nums1 = [1,7,11], nums2 = [2,4,6], k = 3
Output: [[1,2],[1,4],[1,6]]
Explanation: The first 3 pairs are returned from the sequence: [1,2],[1,4],[1,6],[7,2],[7,4],[11,2],[7,6],[11,4],[11,6]

Example 2:
Input: nums1 = [1,1,2], nums2 = [1,2,3], k = 2
Output: [[1,1],[1,1]]
Explanation: The first 2 pairs are returned from the sequence: [1,1],[1,1],[1,2],[2,1],[1,2],[2,2],[1,3],[1,3],[2,3]

Example 3:
Input: nums1 = [1,2], nums2 = [3], k = 3
Output: [[1,3],[2,3]]
Explanation: All possible pairs are returned from the sequence: [1,3],[2,3]

Constraints:
* 1 <= nums1.length, nums2.length <= 105
* -109 <= nums1[i], nums2[i] <= 109
* nums1 and nums2 both are sorted in ascending order.
* 1 <= k <= 104
=end

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[][]}
# require 'priority_queue'
require "algorithms"
include Containers

def k_smallest_pairs(nums1, nums2, k)
  return [] if nums1.empty? || nums2.empty? || k == 0

  pq = PriorityQueue.new
  nums1.each_with_index do |num1, i|
    pq.push([num1, nums2[0], 0], -(num1 + nums2[0]))
    break if i + 1 >= k
  end

  result = []
  k.times do
    break if pq.empty?

    pair = pq.pop
    result << [pair[0], nums2[pair[2]]]

    next_index = pair[2] + 1
    if next_index < nums2.length
      pq.push([pair[0], nums2[next_index], next_index], -(pair[0] + nums2[next_index]))
    end
  end

  result
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_k_smallest_pairs < Test::Unit::TestCase
  def test_
    assert_equal [[1, 2], [1, 4], [1, 6]], k_smallest_pairs([1, 7, 11], [2, 4, 6], 3)
    assert_equal [[1, 1], [1, 1]], k_smallest_pairs([1, 1, 2], [1, 2, 3], 2)
    assert_equal [[1, 3], [2, 3]], k_smallest_pairs([1, 2], [3], 3)
  end
end
