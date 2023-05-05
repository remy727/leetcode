# frozen_string_literal: true

# 1004. Max Consecutive Ones III
# https://leetcode.com/problems/max-consecutive-ones-iii
# Medium

=begin
Given a binary array nums and an integer k, return the maximum number of consecutive 1's in the array if you can flip at most k 0's.

Example 1:
Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
Output: 6
Explanation: [1,1,1,0,0,1,1,1,1,1,1]
Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.

Example 2:
Input: nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3
Output: 10
Explanation: [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.

Constraints:
1 <= nums.length <= 105
nums[i] is either 0 or 1.
0 <= k <= nums.length
=end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def longest_ones(nums, k)
  n = nums.size
  left = right = zeros = max = 0
  while right < n
    if nums[right] == 0
      zeros += 1
      while zeros > k
        if nums[left] == 0
          zeros -= 1
        end
        left += 1
      end
    end
    max = [max, right - left + 1].max
    right += 1
  end

  max
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_longest_ones < Test::Unit::TestCase
  def test_
    assert_equal 6, longest_ones([1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0], 2)
    assert_equal 10, longest_ones([0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1], 3)
  end
end
