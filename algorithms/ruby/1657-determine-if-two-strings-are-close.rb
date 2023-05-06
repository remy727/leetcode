# frozen_string_literal: true

# 1657. Determine if Two Strings Are Close
# https://leetcode.com/problems/determine-if-two-strings-are-close
# Medium

=begin
Two strings are considered close if you can attain one from the other using the following operations:

Operation 1: Swap any two existing characters.
For example, abcde -> aecdb
Operation 2: Transform every occurrence of one existing character into another existing character, and do the same with the other character.
For example, aacabb -> bbcbaa (all a's turn into b's, and all b's turn into a's)
You can use the operations on either string as many times as necessary.

Given two strings, word1 and word2, return true if word1 and word2 are close, and false otherwise.

Example 1:
Input: word1 = "abc", word2 = "bca"
Output: true
Explanation: You can attain word2 from word1 in 2 operations.
Apply Operation 1: "abc" -> "acb"
Apply Operation 1: "acb" -> "bca"

Example 2:
Input: word1 = "a", word2 = "aa"
Output: false
Explanation: It is impossible to attain word2 from word1, or vice versa, in any number of operations.

Example 3:
Input: word1 = "cabbba", word2 = "abbccc"
Output: true
Explanation: You can attain word2 from word1 in 3 operations.
Apply Operation 1: "cabbba" -> "caabbb"
Apply Operation 2: "caabbb" -> "baaccc"
Apply Operation 2: "baaccc" -> "abbccc"

Constraints:
1 <= word1.length, word2.length <= 105
word1 and word2 contain only lowercase English letters.
=end

# @param {String} word1
# @param {String} word2
# @return {Boolean}
def close_strings(word1, word2)
  word1, word2 = word1.chars, word2.chars

  return false unless word1.uniq.sort.eql? word2.uniq.sort

  word1.tally.values.sort.eql? word2.tally.values.sort
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"

class Test_close_strings < Test::Unit::TestCase
  def test_
    assert_equal true, close_strings("abc", "bca")
    assert_equal false, close_strings("a", "aa")
    assert_equal true, close_strings("cabbba", "abbccc")
  end
end
