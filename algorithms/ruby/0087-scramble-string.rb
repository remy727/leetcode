# frozen_string_literal: true

# 87. Scramble String
# https://leetcode.com/problems/scramble-string

=begin

We can scramble a string s to get a string t using the following algorithm:

If the length of the string is 1, stop.
If the length of the string is > 1, do the following:
* Split the string into two non-empty substrings at a random index, i.e., if the string is s, divide it to x and y where s = x + y.
* Randomly decide to swap the two substrings or to keep them in the same order. i.e., after this step, s may become s = x + y or s = y + x.
* Apply step 1 recursively on each of the two substrings x and y.
Given two strings s1 and s2 of the same length, return true if s2 is a scrambled string of s1, otherwise, return false.

### Example 1:
Input: s1 = "great", s2 = "rgeat"
Output: true
Explanation: One possible scenario applied on s1 is:
"great" --> "gr/eat" // divide at random index.
"gr/eat" --> "gr/eat" // random decision is not to swap the two substrings and keep them in order.
"gr/eat" --> "g/r / e/at" // apply the same algorithm recursively on both substrings. divide at random index each of them.
"g/r / e/at" --> "r/g / e/at" // random decision was to swap the first substring and to keep the second substring in the same order.
"r/g / e/at" --> "r/g / e/ a/t" // again apply the algorithm recursively, divide "at" to "a/t".
"r/g / e/ a/t" --> "r/g / e/ a/t" // random decision is to keep both substrings in the same order.
The algorithm stops now, and the result string is "rgeat" which is s2.
As one possible scenario led s1 to be scrambled to s2, we return true.

### Example 2:
Input: s1 = "abcde", s2 = "caebd"
Output: false

### Example 3:
Input: s1 = "a", s2 = "a"
Output: true

### Constraints:
* s1.length == s2.length
* 1 <= s1.length <= 30
* s1 and s2 consist of lowercase English letters.

=end

# @param {String} s1
# @param {String} s2
# @return {Boolean}
def is_scramble1(s1, s2)
  return true if s1 == s2

  len = s1.length
  count = Array.new(26, 0)
  (0...len).each do |i|
    count[s1[i].ord - 97] += 1
    count[s2[i].ord - 97] -= 1
  end

  (0...26).each do |i|
    return false if count[i] != 0
  end

  (1..len - 1).each do |i|
    return true if is_scramble1(s1[0...i], s2[0...i]) && is_scramble1(s1[i..-1], s2[i..-1])
    return true if is_scramble1(s1[0...i], s2[len - i..-1]) && is_scramble1(s1[i..-1], s2[0...len - i])
  end

  false
end

# Runtime: 157 ms
# Memory: 211 MB
# @param {String} s1
# @param {String} s2
# @return {Boolean}
def is_scramble2(s1, s2)
  z = s1.size
  @s1 = s1
  @s2 = s2
  @_scramble = Array.new(z) { Array.new(z) { [] } }
  scramble?(0, 0, z)
end

def scramble?(a_i, b_i, z)
  cache = @_scramble[a_i][b_i]

  if cache[z].nil?
    cache[z] =
      if z == 1
        @s1[a_i] == @s2[b_i]
      else
        (1..z - 1).any? { |cut|
          rem = z - cut
          scramble?(a_i, b_i, cut) && scramble?(a_i + cut, b_i + cut, rem) ||
            scramble?(a_i, b_i + rem, cut) && scramble?(a_i + cut, b_i, rem)
        }
      end
  else
    cache[z]
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_is_scramble < Test::Unit::TestCase
  def test_
    assert_equal true, is_scramble1("great", "rgeat")
    assert_equal false, is_scramble1("abcde", "caebd")
    assert_equal true, is_scramble1("a", "a")

    assert_equal true, is_scramble2("great", "rgeat")
    assert_equal false, is_scramble2("abcde", "caebd")
    assert_equal true, is_scramble2("a", "a")
  end
end

# ********************#
#     Benchmark       #
# ********************#

require "benchmark"

s1 = "eebaacbcbcadaaedceaaacadccd"
s2 = "eadcaacabaddaceacbceaabeccd"
Benchmark.bm do |x|
  x.report("is_scramble2: ") { is_scramble2(s1, s2) }
  # x.report("is_scramble1: ") { is_scramble1(s1, s2) }
end

# user     system      total        real
# is_scramble2:   0.019557   0.000188   0.019745 (  0.021551)
# is_scramble1: TLE
