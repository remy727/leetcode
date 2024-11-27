# frozen_string_literal: true

# 773. Sliding Puzzle
# https://leetcode.com/problems/sliding-puzzle
# Hard

=begin
On an 2 x 3 board, there are five tiles labeled from 1 to 5, and an empty square represented by 0. A move consists of choosing 0 and a 4-directionally adjacent number and swapping it.
The state of the board is solved if and only if the board is [[1,2,3],[4,5,0]].
Given the puzzle board board, return the least number of moves required so that the state of the board is solved. If it is impossible for the state of the board to be solved, return -1.

Example 1:
Input: board = [[1,2,3],[4,0,5]]
Output: 1
Explanation: Swap the 0 and the 5 in one move.

Example 2:
Input: board = [[1,2,3],[5,4,0]]
Output: -1
Explanation: No number of moves will make the board solved.

Example 3:
Input: board = [[4,1,2],[5,0,3]]
Output: 5
Explanation: 5 is the smallest number of moves that solves the board.
An example path:
After move 0: [[4,1,2],[5,0,3]]
After move 1: [[4,1,2],[0,5,3]]
After move 2: [[0,1,2],[4,5,3]]
After move 3: [[1,0,2],[4,5,3]]
After move 4: [[1,2,0],[4,5,3]]
After move 5: [[1,2,3],[4,5,0]]

Constraints:
* board.length == 2
* board[i].length == 3
* 0 <= board[i][j] <= 5
* Each value board[i][j] is unique.
=end


# @param {Integer[][]} board
# @return {Integer}
def sliding_puzzle(board)
  target = [[1, 2, 3], [4, 5, 0]].flatten.join
  start = board.flatten.join
  can_move = {
    0 => [1, 3],
    1 => [0, 2, 4],
    2 => [1, 5],
    3 => [0, 4],
    4 => [1, 3, 5],
    5 => [2, 4]
  }
  visited = Set.new
  steps = 0
  queue = [[start, steps]]

  until queue.empty?
    current, steps = queue.shift
    return steps if current == target

    zero_index = current.index("0")
    can_move[zero_index].each do |move|
      next_board = current.dup
      next_board[zero_index], next_board[move] = next_board[move], next_board[zero_index]
      next if visited.include?(next_board)

      visited << next_board
      queue.push([next_board, steps + 1])
    end
  end

  -1
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_sliding_puzzle < Test::Unit::TestCase
  def test_
    assert_equal 1, sliding_puzzle([[1, 2, 3], [4, 0, 5]])
    assert_equal(-1, sliding_puzzle([[1, 2, 3], [5, 4, 0]]))
    assert_equal 5, sliding_puzzle([[4, 1, 2], [5, 0, 3]])
  end
end
