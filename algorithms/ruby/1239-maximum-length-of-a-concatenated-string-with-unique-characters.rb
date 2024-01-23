# frozen_string_literal: true

# 1239. Maximum Length of a Concatenated String with Unique Characters
# Medium
# https://leetcode.com/problems/maximum-length-of-a-concatenated-string-with-unique-characters

=begin
You are given an array of strings arr. A string s is formed by the concatenation of a subsequence of arr that has unique characters.
Return the maximum possible length of s.
A subsequence is an array that can be derived from another array by deleting some or no elements without changing the order of the remaining elements.

Example 1:
Input: arr = ["un","iq","ue"]
Output: 4
Explanation: All the valid concatenations are:
- ""
- "un"
- "iq"
- "ue"
- "uniq" ("un" + "iq")
- "ique" ("iq" + "ue")
Maximum length is 4.

Example 2:
Input: arr = ["cha","r","act","ers"]
Output: 6
Explanation: Possible longest valid concatenations are "chaers" ("cha" + "ers") and "acters" ("act" + "ers").

Example 3:
Input: arr = ["abcdefghijklmnopqrstuvwxyz"]
Output: 26
Explanation: The only string in arr has all 26 characters.

Constraints:
1 <= arr.length <= 16
1 <= arr[i].length <= 26
arr[i] contains only lowercase English letters.
=end

# @param {String[]} arr
# @return {Integer}
AORD = "a".ord
def max_length(arr)
  arr.map! { _1.chars.map { |ch| ch.ord - AORD } }
  res = 0
  n = arr.length
  dfs = -> ary, idx do
    res = [res, ary.length].max
    return if idx == n
    ary2 = arr[idx]
    if ary2.length == ary2.uniq.length && !ary.intersect?(ary2)
      dfs.call(ary | ary2, idx + 1)
    end
    dfs.call(ary, idx + 1)
  end
  dfs.call([], 0)
  res
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_length < Test::Unit::TestCase
  def test_
    assert_equal 4, max_length(["un", "iq", "ue"])
    assert_equal 6, max_length(["cha", "r", "act", "ers"])
    assert_equal 26, max_length(["abcdefghijklmnopqrstuvwxyz"])
  end
end
