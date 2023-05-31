# frozen_string_literal: true

# 55. Jump Game
# https://leetcode.com/problems/jump-game
# Medium

=begin
You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.

Return true if you can reach the last index, or false otherwise.

Example 1:
Input: nums = [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.

Example 2:
Input: nums = [3,2,1,0,4]
Output: false
Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.

Constraints:
1 <= nums.length <= 104
0 <= nums[i] <= 105
=end

# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  i = nums.length - 2
  distance = 1

  while i >= 0 do
    if nums[i] - distance >= 0
      distance = 1
    else
      distance += 1
    end

    i -= 1
  end

  distance == 1
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_can_jump < Test::Unit::TestCase
  def test_
    assert_equal true, can_jump([2, 3, 1, 1, 4])
    assert_equal false, can_jump([3, 2, 1, 0, 4])
  end
end
