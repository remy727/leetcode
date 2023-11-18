# frozen_string_literal: true

# 1838. Frequency of the Most Frequent Element
# Medium
# https://leetcode.com/problems/frequency-of-the-most-frequent-element

=begin
The frequency of an element is the number of times it occurs in an array.
You are given an integer array nums and an integer k. In one operation, you can choose an index of nums and increment the element at that index by 1.
Return the maximum possible frequency of an element after performing at most k operations.

Example 1:
Input: nums = [1,2,4], k = 5
Output: 3
Explanation: Increment the first element three times and the second element two times to make nums = [4,4,4].
4 has a frequency of 3.

Example 2:
Input: nums = [1,4,8,13], k = 5
Output: 2
Explanation: There are multiple optimal solutions:
- Increment the first element three times to make nums = [4,4,8,13]. 4 has a frequency of 2.
- Increment the second element four times to make nums = [1,8,8,13]. 8 has a frequency of 2.
- Increment the third element five times to make nums = [1,4,13,13]. 13 has a frequency of 2.

Example 3:
Input: nums = [3,9,6], k = 2
Output: 1

Constraints:
1 <= nums.length <= 105
1 <= nums[i] <= 105
1 <= k <= 105
=end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def max_frequency(nums, k)
  nums.sort!
  left, ans, curr = 0, 0, 0
  nums.size.times do |right|
    target = nums[right]
    curr += target
    while  (right - left + 1) * target - curr > k
      curr -= nums[left]
      left += 1
    end
    tmp = right - left + 1
    ans = tmp if tmp > ans
  end
  ans
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_frequency < Test::Unit::TestCase
  def test_
    assert_equal 3, max_frequency([1, 2, 4], 5)
    assert_equal 2, max_frequency([1, 4, 8, 13], 5)
    assert_equal 1, max_frequency([3, 9, 6], 2)
  end
end
