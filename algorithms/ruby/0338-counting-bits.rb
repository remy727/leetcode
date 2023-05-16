# frozen_string_literal: true

# 338. Counting Bits
# https://leetcode.com/problems/counting-bits
# Easy

=begin
Given an integer n, return an array ans of length n + 1 such that for each i (0 <= i <= n), ans[i] is the number of 1's in the binary representation of i.

Example 1:
Input: n = 2
Output: [0,1,1]
Explanation:
0 --> 0
1 --> 1
2 --> 10

Example 2:
Input: n = 5
Output: [0,1,1,2,1,2]
Explanation:
0 --> 0
1 --> 1
2 --> 10
3 --> 11
4 --> 100
5 --> 101

Constraints:
0 <= n <= 105
=end

# @param {Integer} n
# @return {Integer[]}
def count_bits(n)
  result = [0]
  (0..n).each { |i|
    result[i] = result[i / 2] + (i % 2)
  }
  result
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_count_bits < Test::Unit::TestCase
  def test_
    assert_equal [0, 1, 1], count_bits(2)
    assert_equal [0, 1, 1, 2, 1, 2], count_bits(5)
  end
end
