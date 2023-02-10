# frozen_string_literal: true

# Problem: 45. Jump Game II
# URL: https://leetcode.com/problems/jump-game-ii

# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
  current_jump = 0
  last_jump = 0
  step = 0

  (nums.size - 1).times do |i|
    current_jump = [current_jump, i + nums[i]].max
    if i == last_jump
      step += 1
      last_jump = current_jump
    end
  end

  step
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_jump < Test::Unit::TestCase
  def test_
    assert_equal 2, jump([2, 3, 1, 1, 4])
    assert_equal 2, jump([2, 3, 0, 1, 4])
  end
end
