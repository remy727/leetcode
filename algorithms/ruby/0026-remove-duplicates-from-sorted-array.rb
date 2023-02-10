# frozen_string_literal: true

# Problem: 26. Remove Duplicates from Sorted Array
# URL: https://leetcode.com/problems/remove-duplicates-from-sorted-array

# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  nums.uniq!
  nums.size
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_remove_duplicates < Test::Unit::TestCase
  def test_
    assert_equal 2, remove_duplicates([1, 1, 2])
    assert_equal 5, remove_duplicates([0, 0, 1, 1, 1, 2, 2, 3, 3, 4])
  end
end
