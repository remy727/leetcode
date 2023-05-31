# frozen_string_literal: true

# 79. Word Search
# https://leetcode.com/problems/word-search
# Medium

=begin
Given an m x n grid of characters board and a string word, return true if word exists in the grid.

The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

Example 1:
Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
Output: true

Example 2:
Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
Output: true

Example 3:
Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
Output: false

Constraints:
* m == board.length
* n = board[i].length
* 1 <= m, n <= 6
* 1 <= word.length <= 15
* board and word consists of only lowercase and uppercase English letters.
=end

# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def dfs(board, word, i, j)
  return true if word == ""
  return false if i < 0 || j < 0 || i >= board.length || j >= board[0].length || board[i][j] != word[0]
  pom = board[i][j]
  board[i][j] = "#"
  word = word[1..-1]
  return true if dfs(board, word, i - 1, j)
  return true if dfs(board, word, i, j - 1)
  return true if dfs(board, word, i + 1, j)
  return true if dfs(board, word, i, j + 1)
  board[i][j] = pom
  false
end

def exist(board, word)
  set1 = board.flatten.to_set
  set2 = word.split("").to_set
  return false if !(set1 >= set2)
  (0...board.length).each do |i|
    (0...board[0].length).each do |j|
      return true if dfs(board, word, i, j)
    end
  end
  false
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_exist < Test::Unit::TestCase
  def test_
    assert_equal true, exist([["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]], "ABCCED")
    assert_equal true, exist([["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]], "SEE")
    assert_equal false, exist([["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]], "ABCB")
  end
end
