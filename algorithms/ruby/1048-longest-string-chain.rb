# frozen_string_literal: true

# 1048. Longest String Chain
# Medium
# https://leetcode.com/problems/longest-string-chain

=begin
You are given an array of words where each word consists of lowercase English letters.
wordA is a predecessor of wordB if and only if we can insert exactly one letter anywhere in wordA without changing the order of the other characters to make it equal to wordB.
For example, "abc" is a predecessor of "abac", while "cba" is not a predecessor of "bcad".
A word chain is a sequence of words [word1, word2, ..., wordk] with k >= 1, where word1 is a predecessor of word2, word2 is a predecessor of word3, and so on. A single word is trivially a word chain with k == 1.
Return the length of the longest possible word chain with words chosen from the given list of words.

Example 1:
Input: words = ["a","b","ba","bca","bda","bdca"]
Output: 4
Explanation: One of the longest word chains is ["a","ba","bda","bdca"].

Example 2:
Input: words = ["xbc","pcxbcf","xb","cxbc","pcxbc"]
Output: 5
Explanation: All the words can be put in a word chain ["xb", "xbc", "cxbc", "pcxbc", "pcxbcf"].

Example 3:
Input: words = ["abcd","dbqca"]
Output: 1
Explanation: The trivial word chain ["abcd"] is one of the longest word chains.
["abcd","dbqca"] is not a valid word chain because the ordering of the letters is changed.

Constraints:
* 1 <= words.length <= 1000
* 1 <= words[i].length <= 16
* words[i] only consists of lowercase English letters.
=end

# @param {String[]} words
# @return {Integer}
def longest_str_chain(words)
  dp = {}

  words.sort_by { |word| word.length }.each do |word|
    temp = [0]
    word.length.times do |i|
      if dp[word[0...i] + word[i + 1..-1]]
        temp << dp[word[0...i] + word[i + 1..-1]]
      end
      dp[word] = temp.max + 1
    end
  end

  dp.values.max
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_longest_str_chain < Test::Unit::TestCase
  def test_
    assert_equal 4, longest_str_chain(["a", "b", "ba", "bca", "bda", "bdca"])
    assert_equal 5, longest_str_chain(["xbc", "pcxbcf", "xb", "cxbc", "pcxbc"])
    assert_equal 1, longest_str_chain(["abcd", "dbqca"])
  end
end
