# frozen_string_literal: true

# 1964. Find the Longest Valid Obstacle Course at Each Position
# https://leetcode.com/problems/find-the-longest-valid-obstacle-course-at-each-position
# Hard

=begin
You want to build some obstacle courses. You are given a 0-indexed integer array obstacles of length n, where obstacles[i] describes the height of the ith obstacle.

For every index i between 0 and n - 1 (inclusive), find the length of the longest obstacle course in obstacles such that:

You choose any number of obstacles between 0 and i inclusive.
You must include the ith obstacle in the course.
You must put the chosen obstacles in the same order as they appear in obstacles.
Every obstacle (except the first) is taller than or the same height as the obstacle immediately before it.
Return an array ans of length n, where ans[i] is the length of the longest obstacle course for index i as described above.

Example 1:
Input: obstacles = [1,2,3,2]
Output: [1,2,3,3]
Explanation: The longest valid obstacle course at each position is:
- i = 0: [1], [1] has length 1.
- i = 1: [1,2], [1,2] has length 2.
- i = 2: [1,2,3], [1,2,3] has length 3.
- i = 3: [1,2,3,2], [1,2,2] has length 3.

Example 2:
Input: obstacles = [2,2,1]
Output: [1,2,1]
Explanation: The longest valid obstacle course at each position is:
- i = 0: [2], [2] has length 1.
- i = 1: [2,2], [2,2] has length 2.
- i = 2: [2,2,1], [1] has length 1.

Example 3:
Input: obstacles = [3,1,5,6,4,2]
Output: [1,1,2,3,2,2]
Explanation: The longest valid obstacle course at each position is:
- i = 0: [3], [3] has length 1.
- i = 1: [3,1], [1] has length 1.
- i = 2: [3,1,5], [3,5] has length 2. [1,5] is also valid.
- i = 3: [3,1,5,6], [3,5,6] has length 3. [1,5,6] is also valid.
- i = 4: [3,1,5,6,4], [3,4] has length 2. [1,4] is also valid.
- i = 5: [3,1,5,6,4,2], [1,2] has length 2.

Constraints:
n == obstacles.length
1 <= n <= 105
1 <= obstacles[i] <= 107
=end

# @param {Integer[]} obstacles
# @return {Integer[]}
def longest_obstacle_course_at_each_position(obstacles)
  obstacle_path = []
  ans = []
  for i in 0..obstacles.length - 1
    if obstacle_path.empty? || (obstacles[i] >= obstacle_path.last)
      obstacle_path << obstacles[i]
      ans[i] = obstacle_path.count
    else
      idx = obstacle_path.bsearch_index { |obstacle| obstacle > obstacles[i] }
      obstacle_path[idx] = obstacles[i]
      ans[i] = idx + 1
    end
  end

  ans
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_longest_obstacle_course_at_each_position < Test::Unit::TestCase
  def test_
    assert_equal [1, 2, 3, 3], longest_obstacle_course_at_each_position([1, 2, 3, 2])
    assert_equal [1, 2, 1], longest_obstacle_course_at_each_position([2, 2, 1])
    assert_equal [1, 1, 2, 3, 2, 2], longest_obstacle_course_at_each_position([3, 1, 5, 6, 4, 2])
  end
end
