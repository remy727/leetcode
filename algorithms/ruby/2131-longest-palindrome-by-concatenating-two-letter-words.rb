# frozen_string_literal: true

# 2131. Longest Palindrome by Concatenating Two Letter Words
# https://leetcode.com/problems/longest-palindrome-by-concatenating-two-letter-words
# Difficulty: Medium

=begin
You are given an array of strings words. Each element of words consists of two lowercase English letters.

Create the longest possible palindrome by selecting some elements from words and concatenating them in any order. Each element can be selected at most once.

Return the length of the longest palindrome that you can create. If it is impossible to create any palindrome, return 0.

A palindrome is a string that reads the same forward and backward.

Example 1:
Input: words = ["lc","cl","gg"]
Output: 6
Explanation: One longest palindrome is "lc" + "gg" + "cl" = "lcggcl", of length 6.
Note that "clgglc" is another longest palindrome that can be created.

Example 2:
Input: words = ["ab","ty","yt","lc","cl","ab"]
Output: 8
Explanation: One longest palindrome is "ty" + "lc" + "cl" + "yt" = "tylcclyt", of length 8.
Note that "lcyttycl" is another longest palindrome that can be created.

Example 3:
Input: words = ["cc","ll","xx"]
Output: 2
Explanation: One longest palindrome is "cc", of length 2.
Note that "ll" is another longest palindrome that can be created, and so is "xx".

Constraints:
1 <= words.length <= 105
words[i].length == 2
words[i] consists of lowercase English letters.
=end

# @param {String[]} words
# @return {Integer}
def longest_palindrome(a)
  r, m, h = 0, 0, a.tally
  h.each do
    if _1 == (k = _1.reverse)
      r += 4 * (_2 / 2)
      m |= _2 & 1
    else
      next unless (v = h[k])&.> 0
      r += 4 * [_2, v].min
      h[_1] = h[k] = 0
    end
  end
  r + m * 2
end
