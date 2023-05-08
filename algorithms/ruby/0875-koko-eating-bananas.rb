# frozen_string_literal: true

# 875. Koko Eating Bananas
# https://leetcode.com/problems/koko-eating-bananas
# Medium

=begin

Koko loves to eat bananas. There are n piles of bananas, the ith pile has piles[i] bananas. The guards have gone and will come back in h hours.

Koko can decide her bananas-per-hour eating speed of k. Each hour, she chooses some pile of bananas and eats k bananas from that pile. If the pile has less than k bananas, she eats all of them instead and will not eat any more bananas during this hour.

Koko likes to eat slowly but still wants to finish eating all the bananas before the guards return.

Return the minimum integer k such that she can eat all the bananas within h hours.

Constraints:

* 1 <= piles.length <= 104
* piles.length <= h <= 109
* 1 <= piles[i] <= 109

=end

# @param {Integer[]} piles
# @param {Integer} h
# @return {Integer}
def min_eating_speed(piles, h)
  (1..piles.max).bsearch do |x|
    piles.sum { (_1 + x - 1) / x } <= h
  end
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_min_eating_speed < Test::Unit::TestCase
  def test_
    assert_equal 4, min_eating_speed([3, 6, 7, 11], 8)
    assert_equal 30, min_eating_speed([30, 11, 23, 4, 20], 5)
    assert_equal 23, min_eating_speed([30, 11, 23, 4, 20], 6)
  end
end
