# frozen_string_literal: true

# 1768. Merge Strings Alternately
# https://leetcode.com/problems/merge-strings-alternately/
# Difficulty: Easy

=begin

You are given two strings word1 and word2. Merge the strings by adding letters in alternating order, starting with word1. If a string is longer than the other, append the additional letters onto the end of the merged string.

Return the merged string.

### Example 1:
Input: word1 = "abc", word2 = "pqr"
Output: "apbqcr"
Explanation: The merged string will be merged as so:
word1:  a   b   c
word2:    p   q   r
merged: a p b q c r

### Example 2:
Input: word1 = "ab", word2 = "pqrs"
Output: "apbqrs"
Explanation: Notice that as word2 is longer, "rs" is appended to the end.
word1:  a   b
word2:    p   q   r   s
merged: a p b q   r   s

### Example 3:
Input: word1 = "abcd", word2 = "pq"
Output: "apbqcd"
Explanation: Notice that as word1 is longer, "cd" is appended to the end.
word1:  a   b   c   d
word2:    p   q
merged: a p b q c   d

### Constraints:
* 1 <= word1.length, word2.length <= 100
* word1 and word2 consist of lowercase English letters.

=end

# @param {String} word1
# @param {String} word2
# @return {String}
def merge_alternately(word1, word2)
  res = ""
  for i in 0...[word1.length, word2.length].max
    res += word1[i] if i < word1.length
    res += word2[i] if i < word2.length
  end
  res
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_merge_alternately < Test::Unit::TestCase
  def test_
    assert_equal "apbqcr", merge_alternately("abc", "pqr")
    assert_equal "apbqrs", merge_alternately("ab", "pqrs")
    assert_equal "apbqcd", merge_alternately("abcd", "pq")
  end
end
