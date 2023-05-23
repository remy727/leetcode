# frozen_string_literal: true

# 383. Ransom Note
# https://leetcode.com/problems/ransom-note
# Easy

=begin
Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.

Each letter in magazine can only be used once in ransomNote.

Example 1:
Input: ransomNote = "a", magazine = "b"
Output: false

Example 2:
Input: ransomNote = "aa", magazine = "ab"
Output: false

Example 3:
Input: ransomNote = "aa", magazine = "aab"
Output: true

Constraints:
1 <= ransomNote.length, magazine.length <= 105
ransomNote and magazine consist of lowercase English letters.
=end

# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
  ransom_note.chars.uniq.all? { |character| ransom_note.count(character) <= magazine.count(character) }
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_can_construct < Test::Unit::TestCase
  def test_
    assert_equal false, can_construct("a", "b")
    assert_equal false, can_construct("aa", "ab")
    assert_equal true, can_construct("aa", "aab")
  end
end
