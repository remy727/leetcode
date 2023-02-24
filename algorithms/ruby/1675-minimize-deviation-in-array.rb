# frozen_string_literal: true

# Problem: 1675. Minimize Deviation in Array
# URL: https://leetcode.com/problems/minimize-deviation-in-array

# @param {Integer[]} nums
# @return {Integer}
def minimum_deviation(nums)
  nums.uniq!
  nums.map! { |x| x.odd? ? x * 2 : x }.sort!
  diff = nums.last - nums.first
  stack = []

  loop do
    if stack.empty? || nums.last.to_i > stack.first
      max = nums.pop
    else
      max = stack.shift
    end

    break if max.odd?

    stack.push max / 2
    max = [stack.first, nums.last].compact.max
    min = [stack.last, nums.first].compact.min
    diff = [diff, max - min].min
  end

  diff
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_minimum_deviation < Test::Unit::TestCase
  def test_
    assert_equal 1, minimum_deviation([1, 2, 3, 4])
    assert_equal 3, minimum_deviation([4, 1, 5, 20, 3])
    assert_equal 3, minimum_deviation([2, 10, 8])
  end
end
