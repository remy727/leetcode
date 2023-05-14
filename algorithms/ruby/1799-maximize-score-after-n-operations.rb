# frozen_string_literal: true

# TODO: Improve

# 1799. Maximize Score After N Operations
# https://leetcode.com/problems/maximize-score-after-n-operations
# Hard

=begin
You are given nums, an array of positive integers of size 2 * n. You must perform n operations on this array.

In the ith operation (1-indexed), you will:

Choose two elements, x and y.
Receive a score of i * gcd(x, y).
Remove x and y from nums.
Return the maximum score you can receive after performing n operations.

The function gcd(x, y) is the greatest common divisor of x and y.

Example 1:
Input: nums = [1,2]
Output: 1
Explanation: The optimal choice of operations is:
(1 * gcd(1, 2)) = 1

Example 2:
Input: nums = [3,4,6,8]
Output: 11
Explanation: The optimal choice of operations is:
(1 * gcd(3, 6)) + (2 * gcd(4, 8)) = 3 + 8 = 11

Example 3:
Input: nums = [1,2,3,4,5,6]
Output: 14
Explanation: The optimal choice of operations is:
(1 * gcd(1, 5)) + (2 * gcd(2, 4)) + (3 * gcd(3, 6)) = 1 + 4 + 9 = 14

Constraints:
1 <= n <= 7
nums.length == 2 * n
1 <= nums[i] <= 106
=end

class Numeric
  def max(v)
    self < v ? v : self
  end
end

class Solver
  attr_reader :nums, :ns2, :gcd

  def initialize(nums)
    @nums, @ns2, @gcd = nums, nums.size / 2, Array.new(nums.size) { |_| Array.new(nums.size) }
    nums.each_with_index { |v, idx|
      (idx + 1...nums.size).each { |j| @gcd[idx][j] = v.gcd(nums[j]) }
    }
  end

  def rec(op = 1, mask = 0)
    return 0 if op > ns2
    @dp[mask] ||= nums.size.times.inject(-1) { |res, i|
      next res unless mask[i].zero?
      (i + 1...nums.size).inject(res) { |res1, j|
        next res1 unless mask[j].zero?
        [res1, op * gcd[i][j] + rec(op + 1, mask | (1 << i) | (1 << j))].max
      }
    }
  end

  def solve
    @dp = Array.new(1 << nums.size)
    rec
  end
end

# @param {Integer[]} nums
# @return {Integer}
def max_score(nums)
  Solver.new(nums).solve
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_score < Test::Unit::TestCase
  def test_
    assert_equal 1, max_score([1, 2])
    assert_equal 11, max_score([3, 4, 6, 8])
    assert_equal 14, max_score([1, 2, 3, 4, 5, 6])
  end
end
