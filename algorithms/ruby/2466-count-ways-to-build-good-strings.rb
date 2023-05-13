# frozen_string_literal: true

# 2466. Count Ways To Build Good Strings
# https://leetcode.com/problems/count-ways-to-build-good-strings
# Medium

=begin
Given the integers zero, one, low, and high, we can construct a string by starting with an empty string, and then at each step perform either of the following:

Append the character '0' zero times.
Append the character '1' one times.
This can be performed any number of times.

A good string is a string constructed by the above process having a length between low and high (inclusive).

Return the number of different good strings that can be constructed satisfying these properties. Since the answer can be large, return it modulo 10**9 + 7.

Example 1:
Input: low = 3, high = 3, zero = 1, one = 1
Output: 8
Explanation:
One possible valid good string is "011".
It can be constructed as follows: "" -> "0" -> "01" -> "011".
All binary strings from "000" to "111" are good strings in this example.

Example 2:
Input: low = 2, high = 3, zero = 1, one = 2
Output: 5
Explanation: The good strings are "00", "11", "000", "110", and "011".

Constraints:

1 <= low <= high <= 105
1 <= zero, one <= low
=end

# @param {Integer} low
# @param {Integer} high
# @param {Integer} zero
# @param {Integer} one
# @return {Integer}
MOD = 10**9 + 7

def count_good_strings(low, high, zero, one)
  dp = Array.new(high + 1, 0)
  dp[0] = 1
  (1..high).each { |i|
    dp[i] += dp[i - zero] % MOD if i >= zero
    dp[i] += dp[i - one] % MOD if i >= one
  }
  dp[low..high].sum % MOD
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_count_good_strings < Test::Unit::TestCase
  def test_
    assert_equal 8, count_good_strings(3, 3, 1, 1)
    assert_equal 5, count_good_strings(2, 3, 1, 2)
  end
end
