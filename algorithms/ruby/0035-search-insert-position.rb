# frozen_string_literal: true

# Problem: 35. Search Insert Position
# URL: https://leetcode.com/problems/search-insert-position

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  return 0 if nums.empty?

  l = 0
  r = nums.length - 1
  while l <= r
    m = (l + r) / 2
    if nums[m] == target
      return m
    elsif nums[m] > target
      r = m - 1
    else
      l = m + 1
    end
  end

  l
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_search_insert < Test::Unit::TestCase
  def test_
    assert_equal 1, search_insert([1, 3, 5, 6], 2)
    assert_equal 4, search_insert([1, 3, 5, 6], 7)
  end
end
