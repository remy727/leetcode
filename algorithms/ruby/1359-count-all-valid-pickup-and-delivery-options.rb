# frozen_string_literal: true

# 1359. Count All Valid Pickup and Delivery Options
# Hard
# https://leetcode.com/problems/count-all-valid-pickup-and-delivery-options

=begin
Given n orders, each order consist in pickup and delivery services.
Count all valid pickup/delivery possible sequences such that delivery(i) is always after of pickup(i).
Since the answer may be too large, return it modulo 10^9 + 7.

Example 1:
Input: n = 1
Output: 1
Explanation: Unique order (P1, D1), Delivery 1 always is after of Pickup 1.

Example 2:
Input: n = 2
Output: 6
Explanation: All possible orders:
(P1,P2,D1,D2), (P1,P2,D2,D1), (P1,D1,P2,D2), (P2,P1,D1,D2), (P2,P1,D2,D1) and (P2,D2,P1,D1).
This is an invalid order (P1,D2,P2,D1) because Pickup 2 is after of Delivery 2.

Example 3:
Input: n = 3
Output: 90

Constraints:
* 1 <= n <= 500
=end

# @param {Integer} n
# @return {Integer}
def count_orders(n)
  ans = 1
  mod = (10**9) + 7
  (1..n).each do |i|
    ans *= i * (2 * i - 1)
    ans %= mod
  end
  ans
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_count_orders < Test::Unit::TestCase
  def test_
    assert_equal 1, count_orders(1)
    assert_equal 6, count_orders(2)
    assert_equal 90, count_orders(3)
  end
end
