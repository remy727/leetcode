# frozen_string_literal: true

# 1160. Find Words That Can Be Formed by Characters
# Easy
# https://leetcode.com/problems/find-words-that-can-be-formed-by-characters

=begin
You are given an array of strings words and a string chars.
A string is good if it can be formed by characters from chars (each character can only be used once).
Return the sum of lengths of all good strings in words.

Example 1:
Input: words = ["cat","bt","hat","tree"], chars = "atach"
Output: 6
Explanation: The strings that can be formed are "cat" and "hat" so the answer is 3 + 3 = 6.

Example 2:
Input: words = ["hello","world","leetcode"], chars = "welldonehoneyr"
Output: 10
Explanation: The strings that can be formed are "hello" and "world" so the answer is 5 + 5 = 10.

Constraints:
1 <= words.length <= 1000
1 <= words[i].length, chars.length <= 100
words[i] and chars consist of lowercase English letters.
=end

# @param {String[]} words
# @param {String} chars
# @return {Integer}
def count_characters(words, chars)
  char_hash = {}
  chars.each_char do |char|
    char_hash[char] ||= 0
    char_hash[char] += 1
  end

  answer = 0
  words.each do |word|
    char_hash_clone = char_hash.clone

    has_all = true
    word.each_char do |c|
      if char_hash_clone[c] && (char_hash_clone[c] > 0)
        char_hash_clone[c] -= 1
      else
        has_all = false
        break
      end
    end

    if has_all
      answer += word.size
    end
  end

  answer
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_count_characters < Test::Unit::TestCase
  def test_
    assert_equal 6, count_characters(["cat","bt","hat","tree"], "atach")
    assert_equal 10, count_characters(["hello","world","leetcode"], "welldonehoneyr")
  end
end
