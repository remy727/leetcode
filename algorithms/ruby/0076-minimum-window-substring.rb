# frozen_string_literal: true

# 76. Minimum Window Substring
# https://leetcode.com/problems/minimum-window-substring/
# Difficulty: Hard

=begin
Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".

The testcases will be generated such that the answer is unique.

Example 1:
Input: s = "ADOBECODEBANC", t = "ABC"
Output: "BANC"
Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.

Example 2:
Input: s = "a", t = "a"
Output: "a"
Explanation: The entire string s is the minimum window.

Example 3:
Input: s = "a", t = "aa"
Output: ""
Explanation: Both 'a's from t must be included in the window.
Since the largest window of s only has one 'a', return empty string.

Constraints:
* m == s.length
* n == t.length
* 1 <= m, n <= 105
* s and t consist of uppercase and lowercase English letters.
=end

# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  h = Hash.new
  t.each_char do |c|
    h[c] = h[c] ? h[c] + 1 : 1
  end
  max = s.size + 1
  i, j = 0, 0
  c = 0
  res = ""
  while j < s.size
    if c != t.size
      if h[s[j]]
        c += 1 if h[s[j]] > 0
        h[s[j]] -= 1
      end
      j += 1
    end

    while c == t.size
      if h[s[i]]
        c -= 1 if h[s[i]] >= 0
        h[s[i]] += 1
        if j - i < max
          max = j - i
          res = s[i...j]
        end
      end
      i += 1
    end
  end
  res
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_min_window < Test::Unit::TestCase
  def test_
    assert_equal "BANC", min_window("ADOBECODEBANC", "ABC")
    assert_equal "a", min_window("a", "a")
    assert_equal "", min_window("a", "aa")
  end
end
