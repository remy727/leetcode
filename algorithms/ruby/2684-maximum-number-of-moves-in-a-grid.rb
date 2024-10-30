# frozen_string_literal: true

# 2684. Maximum Number of Moves in a Grid
# https://leetcode.com/problems/maximum-number-of-moves-in-a-grid
# Medium

=begin
You are given a 0-indexed m x n matrix grid consisting of positive integers.
You can start at any cell in the first column of the matrix, and traverse the grid in the following way:
* From a cell (row, col), you can move to any of the cells: (row - 1, col + 1), (row, col + 1) and (row + 1, col + 1) such that the value of the cell you move to, should be strictly bigger than the value of the current cell.
Return the maximum number of moves that you can perform.

Example 1:
Input: grid = [[2,4,3,5],[5,4,9,3],[3,4,2,11],[10,9,13,15]]
Output: 3
Explanation: We can start at the cell (0, 0) and make the following moves:
- (0, 0) -> (0, 1).
- (0, 1) -> (1, 2).
- (1, 2) -> (2, 3).
It can be shown that it is the maximum number of moves that can be made.

Example 2:
Input: grid = [[3,2,4],[2,1,9],[1,1,7]]
Output: 0
Explanation: Starting from any cell in the first column we cannot perform any moves.

Constraints:
* m == grid.length
* n == grid[i].length
* 2 <= m, n <= 1000
* 4 <= m * n <= 105
* 1 <= grid[i][j] <= 106
=end

# @param {Integer[][]} grid
# @return {Integer}
def max_moves(grid)
  steps = Array.new(grid[0].size) { |i| [i, []] }.to_h
  steps[0] = grid.count.times.to_a

  grid[0].size.times.drop(1).each do |col|
    grid.count.times do |row|
      steps[col] << row if (steps[col - 1] & [row - 1, row, row + 1]).any? { |r| grid.dig(r, col - 1).to_i < grid.dig(row, col) }
    end
    break if steps[col].empty?
  end

  steps.count { |(_, v)| v.any? } - 1
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_moves < Test::Unit::TestCase
  def test_
    assert_equal 3, max_moves([[2, 4, 3, 5], [5, 4, 9, 3], [3, 4, 2, 11], [10, 9, 13, 15]])
    assert_equal 0, max_moves([[3, 2, 4], [2, 1, 9], [1, 1, 7]])
  end
end
