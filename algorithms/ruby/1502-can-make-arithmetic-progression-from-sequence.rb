# frozen_string_literal: true

# https://leetcode.com/problems/can-make-arithmetic-progression-from-sequence
# 1502. Can Make Arithmetic Progression From Sequence
# Easy

=begin
A sequence of numbers is called an arithmetic progression if the difference between any two consecutive elements is the same.

Given an array of numbers arr, return true if the array can be rearranged to form an arithmetic progression. Otherwise, return false.

Example 1:
Input: arr = [3,5,1]
Output: true
Explanation: We can reorder the elements as [1,3,5] or [5,3,1] with differences 2 and -2 respectively, between each consecutive elements.

Example 2:
Input: arr = [1,2,4]
Output: false
Explanation: There is no way to reorder the elements to obtain an arithmetic progression.

Constraints:
* 2 <= arr.length <= 1000
* -106 <= arr[i] <= 106
=end

# @param {Integer[]} arr
# @return {Boolean}
def can_make_arithmetic_progression(arr)
  arr.sort!
  diff = arr[1] - arr[0]
  for i in 1..(arr.length - 2)
    return false if arr[i + 1] - arr[i] != diff
  end

  true
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_can_make_arithmetic_progression < Test::Unit::TestCase
  def test_
    assert_equal true, can_make_arithmetic_progression([3, 5, 1])
    assert_equal false, can_make_arithmetic_progression([1, 2, 4])
  end
end
