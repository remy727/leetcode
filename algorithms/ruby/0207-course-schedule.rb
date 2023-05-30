# frozen_string_literal: true

# 207. Course Schedule
# https://leetcode.com/problems/course-schedule
# Medium

=begin
There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.
* For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
Return true if you can finish all courses. Otherwise, return false.

Example 1:
Input: numCourses = 2, prerequisites = [[1,0]]
Output: true
Explanation: There are a total of 2 courses to take.
To take course 1 you should have finished course 0. So it is possible.

Example 2:
Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
Output: false
Explanation: There are a total of 2 courses to take.
To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.

Constraints:
* 1 <= numCourses <= 2000
* 0 <= prerequisites.length <= 5000
* prerequisites[i].length == 2
* 0 <= ai, bi < numCourses
* All the pairs prerequisites[i] are unique.
=end

# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
  # Initialize the graph and indegree array
  graph = Array.new(num_courses) { [] }
  indegree = Array.new(num_courses, 0)

  # Build the graph and update the indegree array
  prerequisites.each do |prerequisite|
    course, prerequisite_course = prerequisite
    graph[prerequisite_course] << course
    indegree[course] += 1
  end

  # Initialize the queue with courses having indegree 0
  queue = []
  indegree.each_with_index do |degree, index|
    queue << index if degree == 0
  end

  # Process the courses in the queue
  while !queue.empty?
    current_course = queue.shift
    num_courses -= 1

    # Update the indegree of the neighboring courses
    graph[current_course].each do |neighboring_course|
      indegree[neighboring_course] -= 1

      # If the neighboring course has indegree 0, add it to the queue
      if indegree[neighboring_course] == 0
        queue << neighboring_course
      end
    end
  end

  # If all courses have been processed, return true, otherwise false
  num_courses == 0
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_can_finish < Test::Unit::TestCase
  def test_
    assert_equal true, can_finish(2, [[1, 0]])
    assert_equal false, can_finish(2, [[1, 0], [0, 1]])
  end
end
