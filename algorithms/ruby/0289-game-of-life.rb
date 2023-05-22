# frozen_string_literal: true

# 289. Game of Life
# https://leetcode.com/problems/game-of-life
# Medium

=begin
According to Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."

The board is made up of an m x n grid of cells, where each cell has an initial state: live (represented by a 1) or dead (represented by a 0). Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):

Any live cell with fewer than two live neighbors dies as if caused by under-population.
Any live cell with two or three live neighbors lives on to the next generation.
Any live cell with more than three live neighbors dies, as if by over-population.
Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
The next state is created by applying the above rules simultaneously to every cell in the current state, where births and deaths occur simultaneously. Given the current state of the m x n grid board, return the next state.

Example 1:
Input: board = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
Output: [[0,0,0],[1,0,1],[0,1,1],[0,1,0]]

Example 2:
Input: board = [[1,1],[1,0]]
Output: [[1,1],[1,1]]

Constraints:
m == board.length
n == board[i].length
1 <= m, n <= 25
board[i][j] is 0 or 1.
=end

# @param {Integer[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def game_of_life(board)
  m, n = board.count, board[0].count

  m.times do |i|
    n.times do |j|
      [[i + 1, j - 1], [i + 1, j], [i + 1, j + 1], [i, j + 1]].each do |i2, j2|
        if (0...m).cover?(i2) && (0...n).cover?(j2)
          board[i2][j2] += (board[i][j] & 1) << 1
        end
      end
    end
  end

  (m - 1).downto(0) do |i|
    (n - 1).downto(0) do |j|
      [[i, j - 1], [i - 1, j - 1], [i - 1, j], [i - 1, j + 1]].each do |i2, j2|
        if (0...m).cover?(i2) && (0...n).cover?(j2)
          board[i2][j2] += (board[i][j] & 1) << 1
        end
      end

      board[i][j] = (5...8).cover?(board[i][j]) ? 1 : 0
    end
  end
end
