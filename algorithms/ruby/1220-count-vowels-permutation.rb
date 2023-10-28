# frozen_string_literal: true

# 1220. Count Vowels Permutation
# Hard
# https://leetcode.com/problems/count-vowels-permutation

=begin
Given an integer n, your task is to count how many strings of length n can be formed under the following rules:

Each character is a lower case vowel ('a', 'e', 'i', 'o', 'u')
Each vowel 'a' may only be followed by an 'e'.
Each vowel 'e' may only be followed by an 'a' or an 'i'.
Each vowel 'i' may not be followed by another 'i'.
Each vowel 'o' may only be followed by an 'i' or a 'u'.
Each vowel 'u' may only be followed by an 'a'.
Since the answer may be too large, return it modulo 10^9 + 7.

Example 1:
Input: n = 1
Output: 5
Explanation: All possible strings are: "a", "e", "i" , "o" and "u".

Example 2:
Input: n = 2
Output: 10
Explanation: All possible strings are: "ae", "ea", "ei", "ia", "ie", "io", "iu", "oi", "ou" and "ua".

Example 3:
Input: n = 5
Output: 68

Constraints:
1 <= n <= 2 * 10^4
=end

# @param {Integer} n
# @return {Integer}
def count_vowel_permutation(n)
  a = e = i = o = u = 1
  (2..n).each do
    a, e, i, o, u = e + i + u, a + i, e + o, i, i + o
  end
  (a + e + i + o + u) % 1000000007
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_count_vowel_permutation < Test::Unit::TestCase
  def test_
    assert_equal 5, count_vowel_permutation(1)
    assert_equal 10, count_vowel_permutation(2)
    assert_equal 68, count_vowel_permutation(5)
  end
end
