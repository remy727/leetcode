# frozen_string_literal: true

# 1743. Restore the Array From Adjacent Pairs
# Medium
# https://leetcode.com/problems/restore-the-array-from-adjacent-pairs

=begin
There is an integer array nums that consists of n unique elements, but you have forgotten it. However, you do remember every pair of adjacent elements in nums.
You are given a 2D integer array adjacentPairs of size n - 1 where each adjacentPairs[i] = [ui, vi] indicates that the elements ui and vi are adjacent in nums.
It is guaranteed that every adjacent pair of elements nums[i] and nums[i+1] will exist in adjacentPairs, either as [nums[i], nums[i+1]] or [nums[i+1], nums[i]]. The pairs can appear in any order.
Return the original array nums. If there are multiple solutions, return any of them.

Example 1:
Input: adjacentPairs = [[2,1],[3,4],[3,2]]
Output: [1,2,3,4]
Explanation: This array has all its adjacent pairs in adjacentPairs.
Notice that adjacentPairs[i] may not be in left-to-right order.

Example 2:
Input: adjacentPairs = [[4,-2],[1,4],[-3,1]]
Output: [-2,4,1,-3]
Explanation: There can be negative numbers.
Another solution is [-3,1,4,-2], which would also be accepted.

Example 3:
Input: adjacentPairs = [[100000,-100000]]
Output: [100000,-100000]

Constraints:
* nums.length == n
* adjacentPairs.length == n - 1
* adjacentPairs[i].length == 2
* 2 <= n <= 105
* -105 <= nums[i], ui, vi <= 105
* There exists some nums that has adjacentPairs as its pairs.
=end

# @param {Integer[][]} adjacent_pairs
# @return {Integer[]}
def restore_array(adjacent_pairs)
  hash = Hash.new { |h, k| h[k] = [] }
  adjacent_pairs.each do |a, b|
    hash[a] << b
    hash[b] << a
  end

  start = hash.keys.find { |k| hash[k].size == 1 }
  nums = [start]
  while nums.size < adjacent_pairs.size + 1
    crr = nums[-1]
    hash[crr].each do |t|
      if t != nums[-2]
        nums << t
        break
      end
    end
  end

  nums
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_restore_array < Test::Unit::TestCase
  def test_
    assert_equal [1, 2, 3, 4], restore_array([[2, 1], [3, 4], [3, 2]])
    assert_equal [-2, 4, 1, -3], restore_array([[4, -2], [1, 4], [-3, 1]])
    assert_equal [100000, -100000], restore_array([[100000, -100000]])
  end
end
