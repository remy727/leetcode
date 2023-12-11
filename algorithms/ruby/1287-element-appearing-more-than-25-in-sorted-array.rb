# frozen_string_literal: true

# 1287. Element Appearing More Than 25% In Sorted Array
# Easy
# https://leetcode.com/problems/element-appearing-more-than-25-in-sorted-array

=begin
Given an integer array sorted in non-decreasing order, there is exactly one integer in the array that occurs more than 25% of the time, return that integer.

Example 1:
Input: arr = [1,2,2,6,6,6,6,7,10]
Output: 6

Example 2:
Input: arr = [1,1]
Output: 1

Constraints:
1 <= arr.length <= 104
0 <= arr[i] <= 105
=end

# @param {Integer[]} arr
# @return {Integer}
def find_special_integer(arr)
  return arr[0] if arr.size < 3

  size = arr.size
  appearance = size.fdiv(4)

  counter = 1
  (1...size).each do |i|
    value = arr[i]
    if arr[i - 1] == value
      counter += 1
    else
      counter = 1
    end
    return value if appearance < counter
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_find_special_integer < Test::Unit::TestCase
  def test_
    assert_equal 6, find_special_integer([1, 2, 2, 6, 6, 6, 6, 7, 10])
    assert_equal 1, find_special_integer([1, 1])
  end
end
