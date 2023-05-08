# frozen_string_literal: true

# 1470. Shuffle the Array
# https://leetcode.com/problems/shuffle-the-array

# @param {Integer[]} nums
# @param {Integer} n
# @return {Integer[]}
def shuffle(nums, n)
  result = []

  n.times do |i|
    result << nums[i]
    result << nums[i + n]
  end

  result
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_shuffle < Test::Unit::TestCase
  def test_
    assert_equal [2, 3, 5, 4, 1, 7], shuffle([2, 5, 1, 3, 4, 7], 3)
    assert_equal [1, 4, 2, 3, 3, 2, 4, 1], shuffle([1, 2, 3, 4, 4, 3, 2, 1], 4)
    assert_equal [1, 2, 1, 2], shuffle([1, 1, 2, 2], 2)
  end
end
