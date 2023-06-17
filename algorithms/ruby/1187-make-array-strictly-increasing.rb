# frozen_string_literal: true

# https://leetcode.com/problems/make-array-strictly-increasing
# 1187. Make Array Strictly Increasing
# Hard

=begin
Given two integer arrays arr1 and arr2, return the minimum number of operations (possibly zero) needed to make arr1 strictly increasing.

In one operation, you can choose two indices 0 <= i < arr1.length and 0 <= j < arr2.length and do the assignment arr1[i] = arr2[j].

If there is no way to make arr1 strictly increasing, return -1.

Example 1:
Input: arr1 = [1,5,3,6,7], arr2 = [1,3,2,4]
Output: 1
Explanation: Replace 5 with 2, then arr1 = [1, 2, 3, 6, 7].

Example 2:
Input: arr1 = [1,5,3,6,7], arr2 = [4,3,1]
Output: 2
Explanation: Replace 5 with 3 and then replace 3 with 4. arr1 = [1, 3, 4, 6, 7].

Example 3:
Input: arr1 = [1,5,3,6,7], arr2 = [1,6,3,3]
Output: -1
Explanation: You can't make arr1 strictly increasing.

Constraints:
* 1 <= arr1.length, arr2.length <= 2000
* 0 <= arr1[i], arr2[i] <= 10^9
=end

# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer}
def make_array_increasing(arr1, arr2)
  @arr1 = arr1
  @arr2 = arr2.uniq.sort
  @memo = {}

  res = swaps(0, -1)
  res == Float::INFINITY ? -1 : res
end

def swaps(i, val)
  return 0 if i == @arr1.length
  return @memo[[i, val]] if @memo[[i, val]]

  options = []

  if @arr1[i] > val
    options << swaps(i + 1, @arr1[i])
  end

  j = @arr2.bsearch_index { |num| num > val }

  options << (j ? swaps(i + 1, @arr2[j]) + 1 : Float::INFINITY)

  @memo[[i, val]] = options.min
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_make_array_increasing < Test::Unit::TestCase
  def test_
    assert_equal 1, make_array_increasing([1, 5, 3, 6, 7], [1, 3, 2, 4])
    assert_equal 2, make_array_increasing([1, 5, 3, 6, 7], [4, 3, 1])
    assert_equal(-1, make_array_increasing([1, 5, 3, 6, 7], [1, 6, 3, 3]))
  end
end
