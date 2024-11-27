# frozen_string_literal: true

# 2516. Take K of Each Character From Left and Right
# https://leetcode.com/problems/take-k-of-each-character-from-left-and-right
# Medium

=begin
You are given a string s consisting of the characters 'a', 'b', and 'c' and a non-negative integer k. Each minute, you may take either the leftmost character of s, or the rightmost character of s.
Return the minimum number of minutes needed for you to take at least k of each character, or return -1 if it is not possible to take k of each character.

Example 1:
Input: s = "aabaaaacaabc", k = 2
Output: 8
Explanation:
Take three characters from the left of s. You now have two 'a' characters, and one 'b' character.
Take five characters from the right of s. You now have four 'a' characters, two 'b' characters, and two 'c' characters.
A total of 3 + 5 = 8 minutes is needed.
It can be proven that 8 is the minimum number of minutes needed.

Example 2:
Input: s = "a", k = 1
Output: -1
Explanation: It is not possible to take one 'b' or 'c' so return -1.

Constraints:
* 1 <= s.length <= 10^5
* s consists of only the letters 'a', 'b', and 'c'.
* 0 <= k <= s.length
=end

# @param {String} s
# @param {Integer} k
# @return {Integer}
def take_characters(s, k)
  cnt = [0, 0, 0]
  sz = s.size
  res = -1

  s.each_char do |ch|
    cnt[ch.ord - "a".ord] += 1
  end

  return -1 if cnt.min < k

  i = 0
  j = 0

  while i < sz
    cnt[s[i].ord - "a".ord] -= 1
    if cnt[s[i].ord - "a".ord] < k
      while cnt[s[i].ord - "a".ord] < k
        cnt[s[j].ord - "a".ord] += 1
        j += 1
      end
    end
    res = [res, i - j + 1].max
    i += 1
  end

  sz - res
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_take_characters < Test::Unit::TestCase
  def test_
    assert_equal 8, take_characters("aabaaaacaabc", 2)
    assert_equal(-1, take_characters("a", 1))
  end
end
