# frozen_string_literal: true

# 97. Interleaving String
# https://leetcode.com/problems/interleaving-string
# Medium

=begin
Given strings s1, s2, and s3, find whether s3 is formed by an interleaving of s1 and s2.

An interleaving of two strings s and t is a configuration where s and t are divided into n and m substrings respectively, such that:

s = s1 + s2 + ... + sn
t = t1 + t2 + ... + tm
|n - m| <= 1
The interleaving is s1 + t1 + s2 + t2 + s3 + t3 + ... or t1 + s1 + t2 + s2 + t3 + s3 + ...
Note: a + b is the concatenation of strings a and b.

Example 1:
Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
Output: true
Explanation: One way to obtain s3 is:
Split s1 into s1 = "aa" + "bc" + "c", and s2 into s2 = "dbbc" + "a".
Interleaving the two splits, we get "aa" + "dbbc" + "bc" + "a" + "c" = "aadbbcbcac".
Since s3 can be obtained by interleaving s1 and s2, we return true.

Example 2:
Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
Output: false
Explanation: Notice how it is impossible to interleave s2 with any other string to obtain s3.

Example 3:
Input: s1 = "", s2 = "", s3 = ""
Output: true

Constraints:
0 <= s1.length, s2.length <= 100
0 <= s3.length <= 200
s1, s2, and s3 consist of lowercase English letters.
=end

# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3)
  return false if s1.length + s2.length != s3.length

  row = [true] * (s2.length + 1)
  (1...row.length).each do |j|
    row[j] = row[j - 1] && s2[j - 1] == s3[j - 1]
  end

  s1.length.times do |i|
    row[0] = row[0] && s1[i] == s3[i]
    (1...row.length).each do |j|
      row[j] = (row[j] && s1[i] == s3[i + j]) || (row[j - 1] && s2[j - 1] == s3[i + j])
    end
  end

  row[-1]
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_is_interleave < Test::Unit::TestCase
  def test_
    assert_equal true, is_interleave("aabcc", "dbbca", "aadbbcbcac")
    assert_equal false, is_interleave("aabcc", "dbbca", "aadbbbaccc")
    assert_equal true, is_interleave("", "", "")
  end
end
