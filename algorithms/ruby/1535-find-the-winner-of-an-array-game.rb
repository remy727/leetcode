# frozen_string_literal: true

# 1535. Find the Winner of an Array Game
# Medium
# https://leetcode.com/problems/find-the-winner-of-an-array-game

=begin
Given an integer array arr of distinct integers and an integer k.
A game will be played between the first two elements of the array (i.e. arr[0] and arr[1]). In each round of the game, we compare arr[0] with arr[1], the larger integer wins and remains at position 0, and the smaller integer moves to the end of the array. The game ends when an integer wins k consecutive rounds.
Return the integer which will win the game.
It is guaranteed that there will be a winner of the game.

Example 1:
Input: arr = [2,1,3,5,4,6,7], k = 2
Output: 5
Explanation: Let's see the rounds of the game:
Round |       arr       | winner | win_count
  1   | [2,1,3,5,4,6,7] | 2      | 1
  2   | [2,3,5,4,6,7,1] | 3      | 1
  3   | [3,5,4,6,7,1,2] | 5      | 1
  4   | [5,4,6,7,1,2,3] | 5      | 2
So we can see that 4 rounds will be played and 5 is the winner because it wins 2 consecutive games.

Example 2:
Input: arr = [3,2,1], k = 10
Output: 3
Explanation: 3 will win the first 10 rounds consecutively.

Constraints:
2 <= arr.length <= 105
1 <= arr[i] <= 106
arr contains distinct integers.
1 <= k <= 109
=end

# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def get_winner(arr, k)
  max_val, count = arr[0], 0
  (1...arr.length).each do |i|
    if max_val < arr[i]
      max_val = arr[i]
      count = 0
    end
    count += 1
    return max_val if count == k
  end
  max_val
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_get_winner < Test::Unit::TestCase
  def test_
    assert_equal 5, get_winner([2, 1, 3, 5, 4, 6, 7], 2)
    assert_equal 3, get_winner([3, 2, 1], 10)
  end
end
