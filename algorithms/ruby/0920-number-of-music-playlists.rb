# frozen_string_literal: true

# 920. Number of Music Playlists
# Hard
# https://leetcode.com/problems/number-of-music-playlists

=begin
Your music player contains n different songs. You want to listen to goal songs (not necessarily different) during your trip. To avoid boredom, you will create a playlist so that:
* Every song is played at least once.
* A song can only be played again only if k other songs have been played.
Given n, goal, and k, return the number of possible playlists that you can create. Since the answer can be very large, return it modulo 109 + 7.

Example 1:
Input: n = 3, goal = 3, k = 1
Output: 6
Explanation: There are 6 possible playlists: [1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], and [3, 2, 1].

Example 2:
Input: n = 2, goal = 3, k = 0
Output: 6
Explanation: There are 6 possible playlists: [1, 1, 2], [1, 2, 1], [2, 1, 1], [2, 2, 1], [2, 1, 2], and [1, 2, 2].

Example 3:
Input: n = 2, goal = 3, k = 1
Output: 2
Explanation: There are 2 possible playlists: [1, 2, 1] and [2, 1, 2].


Constraints:
0 <= k < n <= goal <= 100
=end

# @param {Integer} n
# @param {Integer} goal
# @param {Integer} k
# @return {Integer}
def num_music_playlists(n, goal, k)
  mod = 10**9 + 7
  dp = Array.new(goal + 1) { Array.new(n + 1, 0) }
  dp[0][0] = 1
  for i in 1..goal
    for j in 1..n
      dp[i][j] = (dp[i - 1][j - 1] * (n - j + 1) + dp[i - 1][j] * [ j - k, 0 ].max) % mod
    end
  end
  dp[goal][n]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_num_music_playlists < Test::Unit::TestCase
  def test_
    assert_equal 6, num_music_playlists(3, 3, 1)
    assert_equal 6, num_music_playlists(2, 3, 0)
    assert_equal 2, num_music_playlists(2, 3, 1)
  end
end
