# frozen_string_literal: true

# 605. Can Place Flowers
# https://leetcode.com/problems/can-place-flowers

=begin

You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.

Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule.

### Constraints:

* 1 <= flowerbed.length <= 2 * 104
* flowerbed[i] is 0 or 1.
* There are no two adjacent flowers in flowerbed.
* 0 <= n <= flowerbed.length

=end

# @param {Integer[]} flowerbed
# @param {Integer} n
# @return {Boolean}
# Runtime 80 ms, Beats 100%
# Memory 212.4 MB, Beats 28.57%
def can_place_flowers1(flowerbed, n)
  return true if n == 0

  flowerbed_count = flowerbed.count
  index = 0
  count_of_plant = 0

  while index < flowerbed_count
    break if count_of_plant == n

    if flowerbed[index] == 1
      index += 2
      next
    elsif index == flowerbed_count - 1 || flowerbed[index + 1] == 0
      flowerbed[index] = 1

      index += 2
      count_of_plant += 1
    else
      index += 1
    end
  end

  count_of_plant == n
end

# @param {Integer[]} flowerbed
# @param {Integer} n
# @return {Boolean}
# Runtime 124 ms, Beats 28.57%
# Memory 212.5 MB, Beats 19.5%
def can_place_flowers2(flowerbed, n)
  planted = 0
  (0...flowerbed.size).each do |i|
    one = i - 1 == -1 || 0 == flowerbed[i - 1]
    two =  i + 1 == flowerbed.size || 0 == flowerbed[i + 1]
    if one && two
      planted += 1 if 0 == flowerbed[i]
      return true if planted >= n
      flowerbed[i] = 1
    end
  end
  planted >= n
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_can_place_flowers < Test::Unit::TestCase
  def test_
    assert_equal true, can_place_flowers1([1, 0, 0, 0, 1], 1)
    assert_equal false, can_place_flowers1([1, 0, 0, 0, 1], 2)

    assert_equal true, can_place_flowers2([1, 0, 0, 0, 1], 1)
    assert_equal false, can_place_flowers2([1, 0, 0, 0, 1], 2)
  end
end

# ********************#
#     Benchmark       #
# ********************#

require "benchmark"

flowerbed = [1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1]
n = 5
Benchmark.bm do |x|
  x.report("can_place_flowers1: ") { can_place_flowers1(flowerbed, n) }
  x.report("can_place_flowers2: ") { can_place_flowers2(flowerbed, n) }
end
