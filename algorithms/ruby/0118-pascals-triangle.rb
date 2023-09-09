# frozen_string_literal: true

# 118. Pascal's Triangle
# Easy
# https://leetcode.com/problems/pascals-triangle

=begin
Given an integer numRows, return the first numRows of Pascal's triangle.
In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:

Example 1:
Input: numRows = 5
Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]

Example 2:
Input: numRows = 1
Output: [[1]]

Constraints:
* 1 <= numRows <= 30
=end

# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
  result = [[1]]

  (num_rows - 1).times do
    prev_row = result.last
    row = [1]

    0.upto(prev_row.size - 2) do |i|
      row << prev_row[i] + prev_row[i + 1]
    end

    row << 1
    result << row
  end

  result
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_generate < Test::Unit::TestCase
  def test_
    assert_equal [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]], generate(5)
    assert_equal [[1]], generate(1)
  end
end
