# frozen_string_literal: true

# 438. Find All Anagrams in a String
# https://leetcode.com/problems/find-all-anagrams-in-a-string

=begin

Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

### Example 1:
Input: s = "cbaebabacd", p = "abc"
Output: [0,6]
Explanation:
The substring with start index = 0 is "cba", which is an anagram of "abc".
The substring with start index = 6 is "bac", which is an anagram of "abc".

### Example 2:
Input: s = "abab", p = "ab"
Output: [0,1,2]
Explanation:
The substring with start index = 0 is "ab", which is an anagram of "ab".
The substring with start index = 1 is "ba", which is an anagram of "ab".
The substring with start index = 2 is "ab", which is an anagram of "ab".

### Constraints:
* 1 <= s.length, p.length <= 3 * 104
* s and p consist of lowercase English letters.

=end

# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  p_hash = Hash.new(0)
  p.each_char { |c| p_hash[c] += 1 }

  i = 0
  j = 0
  res = []

  while j < s.size
    if p_hash[s[j]] != 0
      p_hash[s[j]] -= 1
      res << i if j - i == p.size - 1
      j += 1
    elsif i == j
      i += 1
      j += 1
    else
      p_hash[s[i]] += 1
      i += 1
    end
  end
  res
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_find_anagrams < Test::Unit::TestCase
  def test_
    assert_equal [0, 6], find_anagrams("cbaebabacd", "abc")
    assert_equal [0, 1, 2], find_anagrams("abab", "ab")
  end
end
