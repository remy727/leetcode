# frozen_string_literal: true

# 343. Integer Break
# Medium
# https://leetcode.com/problems/integer-break

=begin
Given an integer n, break it into the sum of k positive integers, where k >= 2, and maximize the product of those integers.
Return the maximum product you can get.

Example 1:
Input: n = 2
Output: 1
Explanation: 2 = 1 + 1, 1 × 1 = 1.

Example 2:
Input: n = 10
Output: 36
Explanation: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36.

Constraints:
2 <= n <= 58
=end

# @param {Integer} n
# @return {Integer}
def integer_break(n)
  n < 4 ? n - 1 : 3**((n - 2) / 3) * ((n - 2) % 3 + 2)
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_integer_break < Test::Unit::TestCase
  def test_
    assert_equal 1, integer_break(2)
    assert_equal 36, integer_break(10)
  end
end
