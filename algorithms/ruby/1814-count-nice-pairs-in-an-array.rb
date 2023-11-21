# frozen_string_literal: true

# 1814. Count Nice Pairs in an Array
# Medium
# https://leetcode.com/problems/count-nice-pairs-in-an-array

=begin
You are given an array nums that consists of non-negative integers. Let us define rev(x) as the reverse of the non-negative integer x. For example, rev(123) = 321, and rev(120) = 21. A pair of indices (i, j) is nice if it satisfies all of the following conditions:
* 0 <= i < j < nums.length
* nums[i] + rev(nums[j]) == nums[j] + rev(nums[i])
Return the number of nice pairs of indices. Since that number can be too large, return it modulo 109 + 7.

Example 1:
Input: nums = [42,11,1,97]
Output: 2
Explanation: The two pairs are:
- (0,3) : 42 + rev(97) = 42 + 79 = 121, 97 + rev(42) = 97 + 24 = 121.
- (1,2) : 11 + rev(1) = 11 + 1 = 12, 1 + rev(11) = 1 + 11 = 12.

Example 2:
Input: nums = [13,10,35,24,76]
Output: 4

Constraints:
1 <= nums.length <= 105
0 <= nums[i] <= 109
=end

# @param {Integer[]} nums
# @return {Integer}
def count_nice_pairs(nums)
  y = Hash.new { |h, x| h[x] = x - x.to_s.reverse.to_i }
  res = 0
  c = Hash.new(0)
  for x in nums
    res += c[y[x]]
    c[y[x]] += 1
  end
  res % 1000000007
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_count_nice_pairs < Test::Unit::TestCase
  def test_
    assert_equal 2, count_nice_pairs([42, 11, 1, 97])
    assert_equal 4, count_nice_pairs([13, 10, 35, 24, 76])
  end
end
