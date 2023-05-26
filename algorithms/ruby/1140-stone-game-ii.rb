# frozen_string_literal: true

# 1140. Stone Game II
# https://leetcode.com/problems/stone-game-ii/
# Medium

=begin
Alice and Bob continue their games with piles of stones.  There are a number of piles arranged in a row, and each pile has a positive integer number of stones piles[i].  The objective of the game is to end with the most stones.

Alice and Bob take turns, with Alice starting first.  Initially, M = 1.

On each player's turn, that player can take all the stones in the first X remaining piles, where 1 <= X <= 2M.  Then, we set M = max(M, X).

The game continues until all the stones have been taken.

Assuming Alice and Bob play optimally, return the maximum number of stones Alice can get.

Example 1:
Input: piles = [2,7,9,4,4]
Output: 10
Explanation:  If Alice takes one pile at the beginning, Bob takes two piles, then Alice takes 2 piles again. Alice can get 2 + 4 + 4 = 10 piles in total. If Alice takes two piles at the beginning, then Bob can take all three piles left. In this case, Alice get 2 + 7 = 9 piles in total. So we return 10 since it's larger.

Example 2:
Input: piles = [1,2,3,4,5,100]
Output: 104

Constraints:
1 <= piles.length <= 100
1 <= piles[i] <= 104
=end

# @param {Integer[]} piles
# @return {Integer}
def min(a, b)
  a < b ? a : b
end

def max(a, b)
  a > b ? a : b
end

def stone_game_ii(piles)
  ps = piles.reduce([0]) { |arr, num| arr << arr[-1] + num }
  z = ps.size
  game = Array.new(z) do |i|
    remaining_stones = ps[-1] - ps[i]
    Hash.new do |h, m|
      min_best_response = (i + 1..min(i + 2 * m, z)).map { game[_1][max(m, _1 - i)] }.min
      h[m] = remaining_stones - min_best_response
    end
  end << -> _ { 0 }

  game[0][1]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_stone_game_ii < Test::Unit::TestCase
  def test_
    assert_equal 10, stone_game_ii([2, 7, 9, 4, 4])
    assert_equal 104, stone_game_ii([1, 2, 3, 4, 5, 100])
  end
end
