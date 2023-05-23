# frozen_string_literal: true

# 49. Group Anagrams
# https://leetcode.com/problems/group-anagrams
# Medium

=begin
Given an array of strings strs, group the anagrams together. You can return the answer in any order.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

Example 1:
Input: strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

Example 2:
Input: strs = [""]
Output: [[""]]

Example 3:
Input: strs = ["a"]
Output: [["a"]]

Constraints:
1 <= strs.length <= 104
0 <= strs[i].length <= 100
strs[i] consists of lowercase English letters.
=end

# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  strs.sort.group_by { |s| s.chars.sort }.values
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_group_anagrams < Test::Unit::TestCase
  def test_
    assert_equal [["bat"], ["nat", "tan"], ["ate", "eat", "tea"]].sort, group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
    assert_equal [[""]].sort, group_anagrams([""])
    assert_equal [["a"]].sort, group_anagrams(["a"])
  end
end
