# frozen_string_literal: true

# 319. Bulb Switcher
# https://leetcode.com/problems/bulb-switcher
# Difficulty: Medium

=begin
There are n bulbs that are initially off. You first turn on all the bulbs, then you turn off every second bulb.

On the third round, you toggle every third bulb (turning on if it's off or turning off if it's on). For the ith round, you toggle every i bulb. For the nth round, you only toggle the last bulb.

Return the number of bulbs that are on after n rounds.

Example 1:
Input: n = 3
Output: 1
Explanation: At first, the three bulbs are [off, off, off].
After the first round, the three bulbs are [on, on, on].
After the second round, the three bulbs are [on, off, on].
After the third round, the three bulbs are [on, off, off].
So you should return 1 because there is only one bulb is on.

Example 2:
Input: n = 0
Output: 0

Example 3:
Input: n = 1
Output: 1

Constraints:
0 <= n <= 109
=end

# @param {Integer} n
# @return {Integer}
def bulb_switch(n)
  Integer.sqrt(n)
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_two_sum < Test::Unit::TestCase
  def test_
    assert_equal 1, bulb_switch(3)
    assert_equal 0, bulb_switch(0)
    assert_equal 1, bulb_switch(1)
  end
end
