# frozen_string_literal: true

# 1458. Max Dot Product of Two Subsequences
# Hard
# https://leetcode.com/problems/max-dot-product-of-two-subsequences

=begin
Given two arrays nums1 and nums2.
Return the maximum dot product between non-empty subsequences of nums1 and nums2 with the same length.
A subsequence of a array is a new array which is formed from the original array by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, [2,3,5] is a subsequence of [1,2,3,4,5] while [1,5,3] is not).

Example 1:
Input: nums1 = [2,1,-2,5], nums2 = [3,0,-6]
Output: 18
Explanation: Take subsequence [2,-2] from nums1 and subsequence [3,-6] from nums2.
Their dot product is (2*3 + (-2)*(-6)) = 18.

Example 2:
Input: nums1 = [3,-2], nums2 = [2,-6,7]
Output: 21
Explanation: Take subsequence [3] from nums1 and subsequence [7] from nums2.
Their dot product is (3*7) = 21.

Example 3:
Input: nums1 = [-1,-1], nums2 = [1,1]
Output: -1
Explanation: Take subsequence [-1] from nums1 and subsequence [1] from nums2.
Their dot product is -1.

Constraints:
1 <= nums1.length, nums2.length <= 500
-1000 <= nums1[i], nums2[i] <= 1000
=end

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def max_dot_product(nums1, nums2)
  min1, max1 = nums1.minmax
  min2, max2 = nums2.minmax
  return max1 * min2 if max1 < 0 && min2 > 0
  return min1 * max2 if min1 > 0 && max2 < 0
  dp = Array.new(nums1.size + 1) { Array.new(nums2.size + 1, 0) }
  (0...nums1.size).reverse_each do |i|
    (0...nums2.size).reverse_each do |j|
      tmp = nums1[i] * nums2[j] + dp[i + 1][j + 1]
      dp[i][j] = [tmp, dp[i + 1][j], dp[i][j + 1]].max
    end
  end
  dp[0][0]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_dot_product < Test::Unit::TestCase
  def test_
    assert_equal 18, max_dot_product([2, 1, -2, 5], [3, 0, -6])
    assert_equal 21, max_dot_product([3, -2], [2, -6, 7])
    assert_equal(-1, max_dot_product([-1, -1], [1, 1]))
  end
end
