# frozen_string_literal: true

# 1921. Eliminate Maximum Number of Monsters
# Medium
# https://leetcode.com/problems/eliminate-maximum-number-of-monsters

=begin
You are playing a video game where you are defending your city from a group of n monsters. You are given a 0-indexed integer array dist of size n, where dist[i] is the initial distance in kilometers of the ith monster from the city.
The monsters walk toward the city at a constant speed. The speed of each monster is given to you in an integer array speed of size n, where speed[i] is the speed of the ith monster in kilometers per minute.
You have a weapon that, once fully charged, can eliminate a single monster. However, the weapon takes one minute to charge. The weapon is fully charged at the very start.
You lose when any monster reaches your city. If a monster reaches the city at the exact moment the weapon is fully charged, it counts as a loss, and the game ends before you can use your weapon.
Return the maximum number of monsters that you can eliminate before you lose, or n if you can eliminate all the monsters before they reach the city.

Example 1:
Input: dist = [1,3,4], speed = [1,1,1]
Output: 3
Explanation:
In the beginning, the distances of the monsters are [1,3,4]. You eliminate the first monster.
After a minute, the distances of the monsters are [X,2,3]. You eliminate the second monster.
After a minute, the distances of the monsters are [X,X,2]. You eliminate the thrid monster.
All 3 monsters can be eliminated.

Example 2:
Input: dist = [1,1,2,3], speed = [1,1,1,1]
Output: 1
Explanation:
In the beginning, the distances of the monsters are [1,1,2,3]. You eliminate the first monster.
After a minute, the distances of the monsters are [X,0,1,2], so you lose.
You can only eliminate 1 monster.

Example 3:
Input: dist = [3,2,4], speed = [5,3,2]
Output: 1
Explanation:
In the beginning, the distances of the monsters are [3,2,4]. You eliminate the first monster.
After a minute, the distances of the monsters are [X,0,2], so you lose.
You can only eliminate 1 monster.


Constraints:
n == dist.length == speed.length
1 <= n <= 105
1 <= dist[i], speed[i] <= 105
=end

# @param {Integer[]} dist
# @param {Integer[]} speed
# @return {Integer}
def eliminate_maximum(dist, speed)
  return 0 if dist.empty? || speed.empty?

  time = dist.map.with_index { |d, i| d.to_f / speed[i] }

  time.sort!

  count = 0
  time.each_with_index do |t, i|
    break if t <= i

    count += 1
  end

  count
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_eliminate_maximum < Test::Unit::TestCase
  def test_
    assert_equal 3, eliminate_maximum([1, 3, 4], [1, 1, 1])
    assert_equal 1, eliminate_maximum([1, 1, 2, 3], [1, 1, 1, 1])
    assert_equal 1, eliminate_maximum([3, 2, 4], [5, 3, 2])
  end
end
