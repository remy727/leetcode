# frozen_string_literal: true

# Problem: 1523. Count Odd Numbers in an Interval Range
# URL: https://leetcode.com/problems/count-odd-numbers-in-an-interval-range

# @param {Integer} low
# @param {Integer} high
# @return {Integer}
def count_odds(low, high)
  low += 1 if low % 2 == 0

  low > high ? 0 : ((high - low) / 2) + 1
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_count_odds < Test::Unit::TestCase
  def test_
    assert_equal 3, count_odds(3, 7)
    assert_equal 1, count_odds(8, 10)
  end
end
