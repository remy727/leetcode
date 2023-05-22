# frozen_string_literal: true

# 42. Trapping Rain Water
# https://leetcode.com/problems/trapping-rain-water
# Hard

=begin
Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

Example 1:
Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.

Example 2:
Input: height = [4,2,0,3,2,5]
Output: 9

Constraints:
n == height.length
1 <= n <= 2 * 104
0 <= height[i] <= 105
=end

# @param {Integer[]} height
# @return {Integer}
def trap(height)
  max_left, max_right = [], []

  height.each_index do |i|
    if i == 0
      max_left << height[i]
      max_right << height[-i - 1]
    else
      max_left.push([max_left[i - 1], height[i]].max)
      max_right.unshift([max_right[-i], height[-i - 1]].max)
    end
  end

  s = 0
  height.each_index do |i|
    s += ([max_right[i], max_left[i]].min - height[i])
  end
  s
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_trap < Test::Unit::TestCase
  def test_
    assert_equal 6, trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1])
    assert_equal 9, trap([4, 2, 0, 3, 2, 5])
  end
end
