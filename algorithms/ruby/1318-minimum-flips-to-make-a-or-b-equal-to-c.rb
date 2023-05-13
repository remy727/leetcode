# frozen_string_literal: true

# 1318. Minimum Flips to Make a OR b Equal to c
# https://leetcode.com/problems/minimum-flips-to-make-a-or-b-equal-to-c
# Medium

=begin
Given 3 positives numbers a, b and c. Return the minimum flips required in some bits of a and b to make ( a OR b == c ). (bitwise OR operation).
Flip operation consists of change any single bit 1 to 0 or change the bit 0 to 1 in their binary representation.

Example 1:
Input: a = 2, b = 6, c = 5
Output: 3
Explanation: After flips a = 1 , b = 4 , c = 5 such that (a OR b == c)

Example 2:
Input: a = 4, b = 2, c = 7
Output: 1

Example 3:
Input: a = 1, b = 2, c = 3
Output: 0

Constraints:
1 <= a <= 10^9
1 <= b <= 10^9
1 <= c <= 10^9
=end

# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {Integer}
def min_flips(a, b, c)
  a, b, c = make_bits(a), make_bits(b), make_bits(c)
  count = 0
  c.each_with_index do |bit, i|
    if bit == 1
      count += 1 unless a[i] == 1 || b[i] == 1
    else
      count += a[i] + b[i]
    end
  end
  count
end

def make_bits(n)
  arr = []
  30.times do
    arr.unshift(n % 2)
    n /= 2
  end
  arr
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_min_flips < Test::Unit::TestCase
  def test_
    assert_equal 3, min_flips(2, 6, 5)
    assert_equal 1, min_flips(4, 2, 7)
    assert_equal 0, min_flips(1, 2, 3)
  end
end
