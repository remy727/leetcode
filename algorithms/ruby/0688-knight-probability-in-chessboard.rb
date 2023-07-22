# frozen_string_literal: true

# 688. Knight Probability in Chessboard
# Medium
# https://leetcode.com/problems/knight-probability-in-chessboard

=begin
On an n x n chessboard, a knight starts at the cell (row, column) and attempts to make exactly k moves. The rows and columns are 0-indexed, so the top-left cell is (0, 0), and the bottom-right cell is (n - 1, n - 1).
A chess knight has eight possible moves it can make, as illustrated below. Each move is two cells in a cardinal direction, then one cell in an orthogonal direction.
Each time the knight is to move, it chooses one of eight possible moves uniformly at random (even if the piece would go off the chessboard) and moves there.
The knight continues moving until it has made exactly k moves or has moved off the chessboard.
Return the probability that the knight remains on the board after it has stopped moving.

Example 1:
Input: n = 3, k = 2, row = 0, column = 0
Output: 0.06250
Explanation: There are two moves (to (1,2), (2,1)) that will keep the knight on the board.
From each of those positions, there are also two moves that will keep the knight on the board.
The total probability the knight stays on the board is 0.0625.

Example 2:
Input: n = 1, k = 0, row = 0, column = 0
Output: 1.00000

Constraints:
1 <= n <= 25
0 <= k <= 100
0 <= row, column <= n - 1
=end

# @param {Integer} n
# @param {Integer} k
# @param {Integer} row
# @param {Integer} column
# @return {Float}
def knight_probability(n, k, row, column)
  moves = [[-2, -1], [2, -1], [-2, 1], [2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2]]
  dp = Array.new(n) { Array.new(n) { Array.new(k + 1, 0) } }
  dp[row][column][0] = 1

  (1..k).each do |k_index|
    (0..n - 1).each do |i|
      (0..n - 1).each do |j|
        moves.each do |move|
          new_x, new_y = i + move[0], j + move[1]
          dp[i][j][k_index] += dp[new_x][new_y][k_index - 1] if new_x.between?(0, n - 1) && new_y.between?(0, n - 1)
        end
      end
    end
  end

  total = 0.0
  (0..n - 1).each do |i|
    (0..n - 1).each do |j|
      total += dp[i][j][k]
    end
  end

  total / (8**k)
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_knight_probability < Test::Unit::TestCase
  def test_
    assert_equal 0.06250, knight_probability(3, 2, 0, 0)
    assert_equal 1.00000, knight_probability(1, 0, 0, 0)
  end
end
