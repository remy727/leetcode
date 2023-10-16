# frozen_string_literal: true

# 119. Pascal's Triangle II
# Easy
# https://leetcode.com/problems/pascals-triangle-ii

=begin
Given an integer rowIndex, return the rowIndexth (0-indexed) row of the Pascal's triangle.
In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:

Example 1:
Input: rowIndex = 3
Output: [1,3,3,1]

Example 2:
Input: rowIndex = 0
Output: [1]

Example 3:
Input: rowIndex = 1
Output: [1,1]

Constraints:
0 <= rowIndex <= 33
=end

# @param {Integer} row_index
# @return {Integer[]}
def get_row(row_index)
  return [1] if row_index == 0

  ans = [1]
  temp = 1
  for i in 1...row_index do
    temp = temp * (row_index - i + 1) / i
    ans << temp
  end
  ans << 1
  ans
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_get_row < Test::Unit::TestCase
  def test_
    assert_equal [1, 3, 3, 1], get_row(3)
    assert_equal [1], get_row(0)
    assert_equal [1, 1], get_row(1)
  end
end
