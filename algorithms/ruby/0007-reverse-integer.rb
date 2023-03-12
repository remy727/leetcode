# frozen_string_literal: true

# Problem: 7. Reverse Integer
# URL: https://leetcode.com/problems/reverse-integer

=begin

Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

Constraints:

* -231 <= x <= 231 - 1

=end

# @param {Integer} x
# @return {Integer}
def reverse(x)
  if x.negative?
    x = (x.to_s.reverse.to_i * -1)
  else
    x = x.to_s.reverse.to_i
  end

  x.bit_length > 31 ? 0 : x
end

# @param {Integer} x
# @return {Integer}
def reverse1(x)
  max = 2**31 - 1
  min = -2**31

  neg = x.negative?
  x *= -1 if neg

  rev = 0
  while x != 0
    pop = x.remainder(10)
    x /= 10
    rev = rev * 10 + pop
  end

  return 0 if rev < min || max < rev

  neg ? rev * -1 : rev
end

# ********************#
#     Benchmark       #
# ********************#

require "benchmark"

x = 12320238384812489
Benchmark.bm do |bm|
  bm.report("reverse: ") { reverse(x) }
  bm.report("reverse1: ") { reverse1(x) }
end

# user     system      total        real
# reverse:   0.000012   0.000005   0.000017 (  0.000012)
# reverse1:   0.000013   0.000005   0.000018 (  0.000016)
