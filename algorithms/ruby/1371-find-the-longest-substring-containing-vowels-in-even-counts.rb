# frozen_string_literal: true

# 1371. Find the Longest Substring Containing Vowels in Even Counts
# Medium
# https://leetcode.com/problems/find-the-longest-substring-containing-vowels-in-even-counts

=begin
Given the string s, return the size of the longest substring containing each vowel an even number of times. That is, 'a', 'e', 'i', 'o', and 'u' must appear an even number of times.

Example 1:
Input: s = "eleetminicoworoep"
Output: 13
Explanation: The longest substring is "leetminicowor" which contains two each of the vowels: e, i and o and zero of the vowels: a and u.

Example 2:
Input: s = "leetcodeisgreat"
Output: 5
Explanation: The longest substring is "leetc" which contains two e's.

Example 3:
Input: s = "bcbcbc"
Output: 6
Explanation: In this case, the given string "bcbcbc" is the longest because all vowels: a, e, i, o and u appear zero times.

Constraints:
1 <= s.length <= 5 x 10^5
s contains only lowercase English letters.
=end

# @param {String} s
# @return {Integer}
def find_the_longest_substring(s)
  vowels = "aeiou"
  state = 0
  seen = { 0 => -1 }
  max_length = 0

  s.chars.each_with_index do |char, index|
    vowel_index = vowels.index(char)
    if vowel_index
      state ^= 1 << vowel_index
    end

    if seen.key?(state)
      max_length = [max_length, index - seen[state]].max
    else
      seen[state] = index
    end
  end

  max_length
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_find_the_longest_substring < Test::Unit::TestCase
  def test_
    assert_equal 13, find_the_longest_substring("eleetminicoworoep")
    assert_equal 5, find_the_longest_substring("leetcodeisgreat")
    assert_equal 6, find_the_longest_substring("bcbcbc")
  end
end
