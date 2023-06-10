# frozen_string_literal: true

# https://leetcode.com/problems/maximum-value-at-a-given-index-in-a-bounded-array
# 1802. Maximum Value at a Given Index in a Bounded Array
# Medium

=begin
You are given three positive integers: n, index, and maxSum. You want to construct an array nums (0-indexed) that satisfies the following conditions:
* nums.length == n
* nums[i] is a positive integer where 0 <= i < n.
* abs(nums[i] - nums[i+1]) <= 1 where 0 <= i < n-1.
* The sum of all the elements of nums does not exceed maxSum.
* nums[index] is maximized.
Return nums[index] of the constructed array.
Note that abs(x) equals x if x >= 0, and -x otherwise.

Example 1:
Input: n = 4, index = 2,  maxSum = 6
Output: 2
Explanation: nums = [1,2,2,1] is one array that satisfies all the conditions.
There are no arrays that satisfy all the conditions and have nums[2] == 3, so 2 is the maximum nums[2].

Example 2:
Input: n = 6, index = 1,  maxSum = 10
Output: 3

Constraints:
* 1 <= n <= maxSum <= 109
* 0 <= index < n
=end

# @param {Integer} n
# @param {Integer} index
# @param {Integer} max_sum
# @return {Integer}
def max_value(n, index, max_sum)
  l = index + 1
  r = n - index
  res = (0..max_sum + 1).bsearch do |x|
    sum = 0
    sum += if x >= l
      (x + x - l + 1) * l / 2
    else
      (x + 1) * x / 2 + l - x
    end
    sum += if x >= r
      (x + x - r + 1) * r / 2
    else
      (x + 1) * x / 2 + r - x
    end
    sum -= x
    max_sum < sum
  end

  res - 1
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_value < Test::Unit::TestCase
  def test_
    assert_equal 2, max_value(4, 2, 6)
    assert_equal 3, max_value(6, 1, 10)
  end
end
