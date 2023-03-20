# frozen_string_literal: true

# 2595. Number of Even and Odd Bits
# https://leetcode.com/problems/number-of-even-and-odd-bits

=begin

You are given a positive integer n.

Let even denote the number of even indices in the binary representation of n (0-indexed) with value 1.

Let odd denote the number of odd indices in the binary representation of n (0-indexed) with value 1.

Return an integer array answer where answer = [even, odd].

### Constraints:

* 1 <= n <= 1000

=end

# Runtime 89 ms, Beats 100%
# Memory 210.9 MB, Beats 100%
# @param {Integer} n
# @return {Integer[]}
def even_odd_bit(n)
  [(n & 341).digits(2).count(1), (n & 682).digits(2).count(1)]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_even_odd_bit < Test::Unit::TestCase
  def test_
    assert_equal [2, 0], even_odd_bit(17)
    assert_equal [0, 1], even_odd_bit(2)
  end
end
