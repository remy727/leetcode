# frozen_string_literal: true

# 212. Word Search II
# https://leetcode.com/problems/word-search-ii
# Hard

=begin
Given an m x n board of characters and a list of strings words, return all words on the board.

Each word must be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.

Example 1:
Input: board = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], words = ["oath","pea","eat","rain"]
Output: ["eat","oath"]

Example 2:
Input: board = [["a","b"],["c","d"]], words = ["abcb"]
Output: []

Constraints:
* m == board.length
* n == board[i].length
* 1 <= m, n <= 12
* board[i][j] is a lowercase English letter.
* 1 <= words.length <= 3 * 104
* 1 <= words[i].length <= 10
* words[i] consists of lowercase English letters.
* All the strings of words are unique.
=end

# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
def find_words(board, words)
  res = []
  trie = {}

  words.each do |word|
    node = trie
    word.chars.each do |char|
      node[char] ||= {}
      node = node[char]
    end
    node[:word] = word
  end

  (0...board.size).each do |i|
    (0...board[0].size).each do |j|
      res += search(board, i, j, trie)
    end
  end

  res
end

def search(board, i, j, node)
  res = []

  char = board[i][j]
  char_node = node[char]

  return res if char_node.nil? || char_node.empty?

  if char_node.key?(:word)
    res << char_node[:word]
    char_node.delete(:word)
    if char_node.empty?
      node.delete(char)
      return res
    end
  end

  board[i][j] = :visited
  [[0, 1], [0, -1], [1, 0], [-1, 0]].map { |di, dj| [di + i, dj + j] }.each do |next_i, next_j|
    next if next_i < 0 || next_j < 0 || next_i >= board.size || next_j >= board[0].size

    next_char = board[next_i][next_j]
    next if next_char == :visited

    res += search(board, next_i, next_j, char_node)
    if char_node.empty?
      node.delete(char)
      break
    end
  end

  board[i][j] = char

  res
end


# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_find_words < Test::Unit::TestCase
  def test_
    assert_equal ["eat", "oath"].sort, find_words([["o", "a", "a", "n"], ["e", "t", "a", "e"], ["i", "h", "k", "r"], ["i", "f", "l", "v"]], ["oath", "pea", "eat", "rain"]).sort
    assert_equal [], find_words([["a", "b"], ["c", "d"]], ["abcb"])
  end
end
