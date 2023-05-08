# frozen_string_literal: true

# 1155. Number of Dice Rolls With Target Sum
# https://leetcode.com/problems/number-of-dice-rolls-with-target-sum

# @param {Integer} n
# @param {Integer} k
# @param {Integer} target
# @return {Integer}
def num_rolls_to_target(n, k, target)
  dp = Array.new(n).map { |x| Array.new(target + 1, 0) }

  # fill first row
  (1..target).each do |cell|
    dp[0][cell] = 1 if k >= cell
  end

  # fill the rest rows

  (1...n).each do |row|
    (1..target).each do |cell|
      (1..k).each do |i|
        dp[row][cell] += dp[row - 1][cell - i] if cell - i >= 0
      end
    end
  end

  dp[n - 1][target] % (10**9 + 7)
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_num_rolls_to_target < Test::Unit::TestCase
  def test_
    assert_equal 1, num_rolls_to_target(1, 6, 3)
    assert_equal 6, num_rolls_to_target(2, 6, 7)
    assert_equal 222616187, num_rolls_to_target(30, 30, 500)
  end
end
