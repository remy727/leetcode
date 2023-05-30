# frozen_string_literal: true

# 130. Surrounded Regions
# https://leetcode.com/problems/surrounded-regions
# Medium

=begin
Given an m x n matrix board containing 'X' and 'O', capture all regions that are 4-directionally surrounded by 'X'.

A region is captured by flipping all 'O's into 'X's in that surrounded region.

Example 1:
Input: board = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
Output: [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]
Explanation: Notice that an 'O' should not be flipped if:
- It is on the border, or
- It is adjacent to an 'O' that should not be flipped.
The bottom 'O' is on the border, so it is not flipped.
The other three 'O' form a surrounded region, so they are flipped.

Example 2:
Input: board = [["X"]]
Output: [["X"]]

Constraints:
m == board.length
n == board[i].length
1 <= m, n <= 200
board[i][j] is 'X' or 'O'.
=end

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve(board)
  return if board.empty?

  rows = board.length
  cols = board[0].length

  # Iterate through the border cells
  (0...rows).each do |row|
    dfs(board, row, 0)
    dfs(board, row, cols - 1)
  end

  (0...cols).each do |col|
    dfs(board, 0, col)
    dfs(board, rows - 1, col)
  end

  # Iterate through the entire board and flip the cells
  (0...rows).each do |row|
    (0...cols).each do |col|
      if board[row][col] == "O"
        board[row][col] = "X"
      elsif board[row][col] == "T"
        board[row][col] = "O"
      end
    end
  end

  board
end

def dfs(board, row, col)
  return if row < 0 || row >= board.length || col < 0 || col >= board[0].length || board[row][col] != "O"

  board[row][col] = "T"
  dfs(board, row - 1, col)
  dfs(board, row + 1, col)
  dfs(board, row, col - 1)
  dfs(board, row, col + 1)
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_solve < Test::Unit::TestCase
  def test_
    assert_equal [["X", "X", "X", "X"], ["X", "X", "X", "X"], ["X", "X", "X", "X"], ["X", "O", "X", "X"]], solve([["X", "X", "X", "X"], ["X", "O", "O", "X"], ["X", "X", "O", "X"], ["X", "O", "X", "X"]])
    assert_equal [["X"]], solve([["X"]])
  end
end
