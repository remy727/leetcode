# frozen_string_literal: true

# Problem: 27. Remove Element
# URL: https://leetcode.com/problems/remove-element

# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
  nums.delete(val)
  nums.size
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_remove_element < Test::Unit::TestCase
  def test_
    assert_equal 2, remove_element([3, 2, 2, 3], 3)
    assert_equal 5, remove_element([0, 1, 2, 2, 3, 0, 4, 2], 2)
  end
end
