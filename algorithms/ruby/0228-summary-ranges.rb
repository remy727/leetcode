# frozen_string_literal: true

# 228. Summary Ranges
# https://leetcode.com/problems/summary-ranges
# Easy

=begin
You are given a sorted unique integer array nums.

A range [a,b] is the set of all integers from a to b (inclusive).

Return the smallest sorted list of ranges that cover all the numbers in the array exactly. That is, each element of nums is covered by exactly one of the ranges, and there is no integer x such that x is in one of the ranges but not in nums.

Each range [a,b] in the list should be output as:

"a->b" if a != b
"a" if a == b

Example 1:
Input: nums = [0,1,2,4,5,7]
Output: ["0->2","4->5","7"]
Explanation: The ranges are:
[0,2] --> "0->2"
[4,5] --> "4->5"
[7,7] --> "7"

Example 2:
Input: nums = [0,2,3,4,6,8,9]
Output: ["0","2->4","6","8->9"]
Explanation: The ranges are:
[0,0] --> "0"
[2,4] --> "2->4"
[6,6] --> "6"
[8,9] --> "8->9"

Constraints:
0 <= nums.length <= 20
-231 <= nums[i] <= 231 - 1
All the values of nums are unique.
nums is sorted in ascending order.
=end

# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
  nums.each_with_index.group_by { |n, i| n - i }.map { |d, r| [r[0][0], r[-1][0]].uniq.join("->") }
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_summary_ranges < Test::Unit::TestCase
  def test_
    assert_equal ["0->2", "4->5", "7"], summary_ranges([0, 1, 2, 4, 5, 7])
    assert_equal ["0", "2->4", "6", "8->9"], summary_ranges([0, 2, 3, 4, 6, 8, 9])
  end
end
