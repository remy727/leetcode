# frozen_string_literal: true

# 128. Longest Consecutive Sequence
# https://leetcode.com/problems/longest-consecutive-sequence
# Medium

=begin
Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

You must write an algorithm that runs in O(n) time.

Example 1:
Input: nums = [100,4,200,1,3,2]
Output: 4
Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.

Example 2:
Input: nums = [0,3,7,2,5,8,4,6,0,1]
Output: 9

Constraints:
0 <= nums.length <= 105
-109 <= nums[i] <= 109
=end

# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  return 0 if nums.empty?
  nums.sort.uniq.each_cons(2).inject([1, 1]) { |(maxl, curl), (v1, v2)|
    (v1 + 1 == v2) ? [[maxl, curl + 1].max, curl + 1] : [maxl, 1]
  }.first
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_longest_consecutive < Test::Unit::TestCase
  def test_
    assert_equal 4, longest_consecutive([100, 4, 200, 1, 3, 2])
    assert_equal 9, longest_consecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1])
  end
end
