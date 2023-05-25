# frozen_string_literal: true

# 139. Word Break
# https://leetcode.com/problems/word-break
# Medium

=begin
Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.

Note that the same word in the dictionary may be reused multiple times in the segmentation.

Example 1:
Input: s = "leetcode", wordDict = ["leet","code"]
Output: true
Explanation: Return true because "leetcode" can be segmented as "leet code".

Example 2:
Input: s = "applepenapple", wordDict = ["apple","pen"]
Output: true
Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
Note that you are allowed to reuse a dictionary word.

Example 3:
Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
Output: false

Constraints:
1 <= s.length <= 300
1 <= wordDict.length <= 1000
1 <= wordDict[i].length <= 20
s and wordDict[i] consist of only lowercase English letters.
All the strings of wordDict are unique.
=end

# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(s, word_dict)
  word_dict_set = Set.new(word_dict)

  queue = [0]
  s_length = s.length
  word_lengths = word_dict.map(&:length)
  visited = [0] * s_length

  until queue.empty?
    start = queue.shift
    word_lengths.each do |word_length|
      if word_dict_set.include?(s[start...start + word_length])
        if start + word_length == s_length
          return true
        end

        if visited[start + word_length] == 0
          queue << start + word_length
          visited[start + word_length] = 1
        end
      end
    end
  end

  false
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_word_break < Test::Unit::TestCase
  def test_
    assert_equal true, word_break("leetcode", ["leet", "code"])
    assert_equal true, word_break("applepenapple", ["apple", "pen"])
    assert_equal false, word_break("catsandog", ["cats", "dog", "sand", "and", "cat"])
  end
end
