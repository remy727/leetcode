# frozen_string_literal: true

# Problem: 1539. Kth Missing Positive Number
# URL: https://leetcode.com/problems/kth-missing-positive-number

# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def find_kth_positive(arr, k)
  left = 0
  right = arr.length

  while left < right
    middle = (left + right) / 2

    if arr[middle] - 1 - middle < k
      left = middle + 1
    else
      right = middle
    end
  end

  left + k
end

# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def find_kth_positive1(arr, k)
  ((1..(arr.last || 0) + k).to_a - arr)[k - 1]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"

class Test_find_kth_positive < Test::Unit::TestCase
  def test_
    assert_equal 9, find_kth_positive([2, 3, 4, 7, 11], 5)
    assert_equal 6, find_kth_positive([1, 2, 3, 4], 2)

    assert_equal 9, find_kth_positive1([2, 3, 4, 7, 11], 5)
    assert_equal 6, find_kth_positive1([1, 2, 3, 4], 2)
  end
end

# ********************#
#     Benchmark       #
# ********************#

require "benchmark"

arr = [1, 2, 3, 4, 7, 10, 11]
k = 5
Benchmark.bm do |x|
  x.report("find_kth_positive: ") { find_kth_positive(arr, k) }
  x.report("find_kth_positive1: ") { find_kth_positive1(arr, k) }
end

# user     system      total        real
# find_kth_positive:   0.000012   0.000003   0.000015 (  0.000010)
# find_kth_positive1:   0.000015   0.000003   0.000018 (  0.000017)
