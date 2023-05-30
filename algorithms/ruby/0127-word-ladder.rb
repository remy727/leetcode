# frozen_string_literal: true

# 127. Word Ladder
# https://leetcode.com/problems/word-ladder
# Hard

=begin
A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:
* Every adjacent pair of words differs by a single letter.
* Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
* sk == endWord
Given two words, beginWord and endWord, and a dictionary wordList, return the number of words in the shortest transformation sequence from beginWord to endWord, or 0 if no such sequence exists.

Example 1:
Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
Output: 5
Explanation: One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.

Example 2:
Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
Output: 0
Explanation: The endWord "cog" is not in wordList, therefore there is no valid transformation sequence.

Constraints:
* 1 <= beginWord.length <= 10
* endWord.length == beginWord.length
* 1 <= wordList.length <= 5000
* wordList[i].length == beginWord.length
* beginWord, endWord, and wordList[i] consist of lowercase English letters.
* beginWord != endWord
* All the words in wordList are unique.
=end

# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}
def ladder_length(begin_word, end_word, word_list)
  word_set = Set.new(word_list)
  return 0 unless word_set.include?(end_word)

  queue = [[begin_word, 1]]
  visited = Set.new([begin_word])

  while !queue.empty?
    word, steps = queue.shift

    word.length.times do |i|
      ("a".."z").each do |char|
        next_word = word[0...i] + char + word[i + 1..-1]

        if next_word == end_word
          return steps + 1
        end

        if word_set.include?(next_word) && !visited.include?(next_word)
          queue.push([next_word, steps + 1])
          visited.add(next_word)
        end
      end
    end
  end

  0
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_ladder_length < Test::Unit::TestCase
  def test_
    assert_equal 5, ladder_length("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])
    assert_equal 0, ladder_length("hit", "cog", ["hot", "dot", "dog", "lot", "log"])
  end
end
