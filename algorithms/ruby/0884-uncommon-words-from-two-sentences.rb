# frozen_string_literal: true

# 884. Uncommon Words from Two Sentences
# https://leetcode.com/problems/uncommon-words-from-two-sentences
# Easy

=begin
A sentence is a string of single-space separated words where each word consists only of lowercase letters.
A word is uncommon if it appears exactly once in one of the sentences, and does not appear in the other sentence.
Given two sentences s1 and s2, return a list of all the uncommon words. You may return the answer in any order.

Example 1:
Input: s1 = "this apple is sweet", s2 = "this apple is sour"
Output: ["sweet","sour"]
Explanation:
The word "sweet" appears only in s1, while the word "sour" appears only in s2.

Example 2:
Input: s1 = "apple apple", s2 = "banana"
Output: ["banana"]

Constraints:
* 1 <= s1.length, s2.length <= 200
* s1 and s2 consist of lowercase English letters and spaces.
* s1 and s2 do not have leading or trailing spaces.
* All the words in s1 and s2 are separated by a single space.
=end

# @param {String} s1
# @param {String} s2
# @return {String[]}
def uncommon_from_sentences(s1, s2)
  words_hash = Hash.new(0)
  s1.split.each do |word|
    words_hash[word] += 1
  end
  s2.split.each do |word|
    words_hash[word] += 1
  end
  words_hash.select { |_, count| count == 1 }.keys
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_uncommon_from_sentences < Test::Unit::TestCase
  def test_
    assert_equal ["sweet", "sour"], uncommon_from_sentences("this apple is sweet", "this apple is sour")
    assert_equal ["banana"], uncommon_from_sentences("apple apple", "banana")
  end
end
