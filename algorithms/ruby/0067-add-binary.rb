# frozen_string_literal: true

# 67. Add Binary
# https://leetcode.com/problems/add-binary

# @param {String} a
# @param {String} b
# @return {String}
def add_binary1(a, b)
  (a.to_i(2) + b.to_i(2)).to_s(2)
end

# @param {String} a
# @param {String} b
# @return {String}
def add_binary2(a, b)
  a_len = -(a.size)
  b_len = -(b.size)

  i, carry, res = -1, 0, ""

  while i >= a_len || i >= b_len
    a_bit = i >= a_len ? a[i].to_i : 0
    b_bit = i >= b_len ? b[i].to_i : 0

    sum = a_bit + b_bit + carry
    res = (sum % 2).to_s + res
    carry = sum / 2

    i -= 1
  end

  carry > 0 ? "1" + res : res
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_add_binary1 < Test::Unit::TestCase
  def test_
    assert_equal "100", add_binary1("11", "1")
    assert_equal "10101", add_binary1("1010", "1011")

    assert_equal "100", add_binary2("11", "1")
    assert_equal "10101", add_binary2("1010", "1011")
  end
end

require "benchmark"

a = "1010111010101010101111100101010100110000101011101101011"
b = "100010101000100111011101010101000011100101011110101"
Benchmark.bm do |x|
  x.report { add_binary1(a, b) }
  x.report { add_binary2(a, b) }
end

# user     system      total        real
# 0.000013   0.000002   0.000015 (  0.000009)
# 0.000053   0.000011   0.000064 (  0.000064)
