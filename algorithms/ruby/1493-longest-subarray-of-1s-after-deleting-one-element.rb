# frozen_string_literal: true

# 1493. Longest Subarray of 1's After Deleting One Element
# https://leetcode.com/problems/longest-subarray-of-1s-after-deleting-one-element
# Medium

=begin
Given a binary array nums, you should delete one element from it.

Return the size of the longest non-empty subarray containing only 1's in the resulting array. Return 0 if there is no such subarray.

Example 1:
Input: nums = [1,1,0,1]
Output: 3
Explanation: After deleting the number in position 2, [1,1,1] contains 3 numbers with value of 1's.

Example 2:
Input: nums = [0,1,1,1,0,1,1,0,1]
Output: 5
Explanation: After deleting the number in position 4, [0,1,1,1,1,1,0,1] longest subarray with value of 1's is [1,1,1,1,1].

Example 3:
Input: nums = [1,1,1]
Output: 2
Explanation: You must delete one element.

Constraints:
1 <= nums.length <= 105
nums[i] is either 0 or 1.
=end

# @param {Integer[]} nums
# @return {Integer}
def longest_subarray(nums)
  left = 0
  right = 0
  k = 1
  max = 0

  n = nums.size
  while right < n
    if nums[right] == 0
      k -= 1
      while k < 0
        k += 1 if nums[left] == 0
        left += 1
      end
    end
    max = [max, right - left].max

    right += 1
  end

  max
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_longest_subarray < Test::Unit::TestCase
  def test_
    assert_equal 3, longest_subarray([1, 1, 0, 1])
    assert_equal 5, longest_subarray([0, 1, 1, 1, 0, 1, 1, 0, 1])
    assert_equal 2, longest_subarray([1, 1, 1])
  end
end
