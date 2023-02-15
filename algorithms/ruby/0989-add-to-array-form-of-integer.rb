# frozen_string_literal: true

# Problem: 989. Add to Array-Form of Integer
# URL: https://leetcode.com/problems/add-to-array-form-of-integer

# TODO: IMPROVE

# @param {Integer[]} num
# @param {Integer} k
# @return {Integer[]}
def add_to_array_form1(num, k)
  (num.join.to_i + k).digits.reverse
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_add_to_array_form < Test::Unit::TestCase
  def test_
    assert_equal [1, 2, 3, 4], add_to_array_form1([1, 2, 0, 0], 34)
    assert_equal [4, 5, 5], add_to_array_form1([2, 7, 4], 181)
    assert_equal [1, 0, 2, 1], add_to_array_form1([2, 1, 5], 806)
  end
end

require "benchmark"

num = [1, 0, 2, 9, 5, 8, 7, 3, 6, 7, 9, 1, 3, 4, 6, 7, 8, 9, 5, 4, 3, 4, 6, 7, 7, 6, 5, 4, 3, 0, 1]
k = 458971347
Benchmark.bm do |x|
  x.report("add_to_array_form1: ") { add_to_array_form1(num, k) }
end

# user     system      total        real
# add_to_array_form1:   0.000033   0.000025   0.000058 (  0.000054)
