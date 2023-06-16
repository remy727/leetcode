# frozen_string_literal: true

# https://leetcode.com/problems/number-of-ways-to-reorder-array-to-get-same-bst
# 1569. Number of Ways to Reorder Array to Get Same BST
# Medium

=begin
Given an array nums that represents a permutation of integers from 1 to n. We are going to construct a binary search tree (BST) by inserting the elements of nums in order into an initially empty BST. Find the number of different ways to reorder nums so that the constructed BST is identical to that formed from the original array nums.
* For example, given nums = [2,1,3], we will have 2 as the root, 1 as a left child, and 3 as a right child. The array [2,3,1] also yields the same BST but [3,2,1] yields a different BST.
Return the number of ways to reorder nums such that the BST formed is identical to the original BST formed from nums.

Since the answer may be very large, return it modulo 109 + 7.

Example 1:
Input: nums = [2,1,3]
Output: 1
Explanation: We can reorder nums to be [2,3,1] which will yield the same BST. There are no other ways to reorder nums which will yield the same BST.

Example 2:
Input: nums = [3,4,5,1,2]
Output: 5
Explanation: The following 5 arrays will yield the same BST:
[3,1,2,4,5]
[3,1,4,2,5]
[3,1,4,5,2]
[3,4,1,2,5]
[3,4,1,5,2]

Example 3:
Input: nums = [1,2,3]
Output: 0
Explanation: There are no other orderings of nums that will yield the same BST.

Constraints:
* 1 <= nums.length <= 1000
* 1 <= nums[i] <= nums.length
* All integers in nums are distinct.
=end

# @param {Integer[]} nums
# @return {Integer}
MOD = 1_000_000_007

def num_of_ways(nums)
  bst_permutations(nums) - 1
end

def bst_permutations(nums)
  if nums.empty?
    1
  else
    root_val = nums.shift
    partitions = nums.partition { _1 < root_val }
    comb(*partitions.map(&:size)) * partitions.map { bst_permutations _1 }.reduce(:*) % MOD
  end
end

def comb(a, b)
  if a > b
    comb(b, a)
  else
    (b + 1..b + a).reduce(1, :*) / (1..a).reduce(1, :*)
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"

class Test_num_of_ways < Test::Unit::TestCase
  def test_
    assert_equal 1, num_of_ways([2, 1, 3])
    assert_equal 5, num_of_ways([3, 4, 5, 1, 2])
    assert_equal 0, num_of_ways([1, 2, 3])
  end
end
