# frozen_string_literal: true

# 120. Triangle
# https://leetcode.com/problems/triangle
# Medium

=begin
Given a triangle array, return the minimum path sum from top to bottom.

For each step, you may move to an adjacent number of the row below. More formally, if you are on index i on the current row, you may move to either index i or index i + 1 on the next row.

Example 1:
Input: triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
Output: 11
Explanation: The triangle looks like:
   2
  3 4
 6 5 7
4 1 8 3
The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).

Example 2:
Input: triangle = [[-10]]
Output: -10

Constraints:
1 <= triangle.length <= 200
triangle[0].length == 1
triangle[i].length == triangle[i - 1].length + 1
-104 <= triangle[i][j] <= 104
=end

# @param {Integer[][]} triangle
# @return {Integer}
def minimum_total(triangle)
  cost, last_cost = nil, nil
  triangle.size.times do |i|
    cost = triangle[triangle.size - i - 1]
    cost.size.times { |j| cost[j] += [last_cost[j], last_cost[j + 1]].min } if i > 0
    last_cost = cost
  end
  cost.first
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_minimum_total < Test::Unit::TestCase
  def test_
    assert_equal 11, minimum_total([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]])
    assert_equal(-10, minimum_total([[-10]]))
  end
end
