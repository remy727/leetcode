# frozen_string_literal: true

# 735. Asteroid Collision
# https://leetcode.com/problems/asteroid-collision
# Medium

=begin
We are given an array asteroids of integers representing asteroids in a row.

For each asteroid, the absolute value represents its size, and the sign represents its direction (positive meaning right, negative meaning left). Each asteroid moves at the same speed.

Find out the state of the asteroids after all collisions. If two asteroids meet, the smaller one will explode. If both are the same size, both will explode. Two asteroids moving in the same direction will never meet.

Example 1:
Input: asteroids = [5,10,-5]
Output: [5,10]
Explanation: The 10 and -5 collide resulting in 10. The 5 and 10 never collide.

Example 2:
Input: asteroids = [8,-8]
Output: []
Explanation: The 8 and -8 collide exploding each other.

Example 3:
Input: asteroids = [10,2,-5]
Output: [10]
Explanation: The 2 and -5 collide resulting in -5. The 10 and -5 collide resulting in 10.

Constraints:
2 <= asteroids.length <= 104
-1000 <= asteroids[i] <= 1000
asteroids[i] != 0
=end

# @param {Integer[]} asteroids
# @return {Integer[]}
def asteroid_collision(asteroids)
  result = []

  asteroids.each do |asteroid|
    result << asteroid

    while result.count > 1 && result[-1] < 0 && result[-2] > 0
      last_asteroid = result.pop

      if last_asteroid.abs == result[-1]
        result.pop
      elsif last_asteroid.abs > result[-1]
        result[-1] = last_asteroid
      end
    end
  end

  result
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_asteroid_collision < Test::Unit::TestCase
  def test_
    assert_equal [5, 10], asteroid_collision([5, 10, -5])
    assert_equal [], asteroid_collision([8, -8])
    assert_equal [10], asteroid_collision([10, 2, -5])
  end
end
