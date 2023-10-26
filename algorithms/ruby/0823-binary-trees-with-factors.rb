# frozen_string_literal: true

# 823. Binary Trees With Factors
# Medium
# https://leetcode.com/problems/binary-trees-with-factors

=begin
Given an array of unique integers, arr, where each integer arr[i] is strictly greater than 1.
We make a binary tree using these integers, and each number may be used for any number of times. Each non-leaf node's value should be equal to the product of the values of its children.
Return the number of binary trees we can make. The answer may be too large so return the answer modulo 10^9 + 7.

Example 1:
Input: arr = [2,4]
Output: 3
Explanation: We can make these trees: [2], [4], [4, 2, 2]

Example 2:
Input: arr = [2,4,5,10]
Output: 7
Explanation: We can make these trees: [2], [4], [5], [10], [4, 2, 2], [10, 2, 5], [10, 5, 2].

Constraints:
1 <= arr.length <= 1000
2 <= arr[i] <= 109
All the values of arr are unique.
=end

# @param {Integer[]} arr
# @return {Integer}
def num_factored_binary_trees(arr)
  mod = 10**9 + 7
  arr.sort!
  dp = {}

  (0...arr.length).each do |i|
    dp[arr[i]] = 1
    (0...i).each do |j|
      if arr[i] % arr[j] == 0
        factor = arr[i] / arr[j]
        if dp.key?(factor)
          dp[arr[i]] = (dp[arr[i]] + dp[arr[j]] * dp[factor]) % mod
        end
      end
    end
  end

  result = 0
  dp.values.each do |value|
    result = (result + value) % mod
  end

  result
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_num_factored_binary_trees < Test::Unit::TestCase
  def test_
    assert_equal 3, num_factored_binary_trees([2, 4])
    assert_equal 7, num_factored_binary_trees([2, 4, 5, 10])
  end
end
