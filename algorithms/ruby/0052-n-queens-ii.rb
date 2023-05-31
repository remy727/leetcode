# frozen_string_literal: true

# 52. N-Queens II
# https://leetcode.com/problems/n-queens-ii
# Hard

=begin
The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.

Given an integer n, return the number of distinct solutions to the n-queens puzzle.

Example 1:
Input: n = 4
Output: 2
Explanation: There are two distinct solutions to the 4-queens puzzle as shown.

Example 2:
Input: n = 1
Output: 1

Constraints:
* 1 <= n <= 9
=end

# @param {Integer} n
# @return {Integer}
def total_n_queens(n)
  return 1 if n == 1
  return 0 if n < 4

  @count = 0
  @n = n
  @board = Array.new(n) { Array.new(n, false) }

  backtrack(0)
  @count
end

def backtrack(row)
  if row == @n
    @count += 1
    return
  end

  (0...@n).each do |col|
    if is_valid(row, col)
      @board[row][col] = true
      backtrack(row + 1)
      @board[row][col] = false
    end
  end
end

def is_valid(row, col)
  # Check the same column
  (0...row).each do |i|
    return false if @board[i][col]
  end

  # Check the upper left diagonal
  i = row - 1
  j = col - 1
  while i >= 0 && j >= 0
    return false if @board[i][j]
    i -= 1
    j -= 1
  end

  # Check the upper right diagonal
  i = row - 1
  j = col + 1
  while i >= 0 && j < @n
    return false if @board[i][j]
    i -= 1
    j += 1
  end

  true
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_total_n_queens < Test::Unit::TestCase
  def test_
    assert_equal 2, total_n_queens(4)
    assert_equal 1, total_n_queens(1)
  end
end
