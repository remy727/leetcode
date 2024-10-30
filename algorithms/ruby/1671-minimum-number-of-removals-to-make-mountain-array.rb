# frozen_string_literal: true

# 1671. Minimum Number of Removals to Make Mountain Array
# Hard
# https://leetcode.com/problems/minimum-number-of-removals-to-make-mountain-array

=begin
You may recall that an array arr is a mountain array if and only if:
* arr.length >= 3
* There exists some index i (0-indexed) with 0 < i < arr.length - 1 such that:
  * arr[0] < arr[1] < ... < arr[i - 1] < arr[i]
  * arr[i] > arr[i + 1] > ... > arr[arr.length - 1]
Given an integer array nums​​​, return the minimum number of elements to remove to make nums​​​ a mountain array.

Example 1:
Input: nums = [1,3,1]
Output: 0
Explanation: The array itself is a mountain array so we do not need to remove any elements.

Example 2:
Input: nums = [2,1,1,5,6,2,3,1]
Output: 3
Explanation: One solution is to remove the elements at indices 0, 1, and 5, making the array nums = [1,5,6,3,1].

Constraints:
* 3 <= nums.length <= 1000
* 1 <= nums[i] <= 109
* It is guaranteed that you can make a mountain array out of nums.
=end

# @param {Integer[]} nums
# @return {Integer}
def minimum_mountain_removals(nums)
  n = nums.size
  inc = Array.new(n, 1)
  dec = Array.new(n, 1)

  (1...n).each do |i|
    (0...i).each do |j|
      inc[i] = [inc[i], inc[j] + 1].max if nums[i] > nums[j]
    end
  end

  (n - 2).downto(0) do |i|
    (i + 1...n).each do |j|
      dec[i] = [dec[i], dec[j] + 1].max if nums[i] > nums[j]
    end
  end

  max_mountain = 0
  (1...n - 1).each do |i|
    if inc[i] > 1 && dec[i] > 1
      max_mountain = [max_mountain, inc[i] + dec[i] - 1].max
    end
  end

  n - max_mountain
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_minimum_mountain_removals < Test::Unit::TestCase
  def test_
    assert_equal 0, minimum_mountain_removals([1, 3, 1])
    assert_equal 3, minimum_mountain_removals([2, 1, 1, 5, 6, 2, 3, 1])
  end
end
