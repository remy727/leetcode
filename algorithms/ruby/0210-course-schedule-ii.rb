# frozen_string_literal: true

# 210. Course Schedule II
# https://leetcode.com/problems/course-schedule-ii/
# Medium

=begin

There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.

* For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
Return the ordering of courses you should take to finish all courses. If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.

Example 1:
Input: numCourses = 2, prerequisites = [[1,0]]
Output: [0,1]
Explanation: There are a total of 2 courses to take. To take course 1 you should have finished course 0. So the correct course order is [0,1].

Example 2:
Input: numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]
Output: [0,2,1,3]
Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.
So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3].

Example 3:
Input: numCourses = 1, prerequisites = []
Output: [0]


Constraints:
1 <= numCourses <= 2000
0 <= prerequisites.length <= numCourses * (numCourses - 1)
prerequisites[i].length == 2
0 <= ai, bi < numCourses
ai != bi
All the pairs [ai, bi] are distinct.

=end

# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
def find_order(num_courses, prerequisites)
  edges = Hash.new { |h, v| h[v] = [] }
  deg = [0] * num_courses
  prerequisites.each do |a, b|
    deg[a] += 1
    edges[b] << a
  end
  leaves = []
  deg.each_with_index { |d, v| leaves << v if d == 0 }
  res = leaves.dup
  # Exclude leaves (with corresponding edges) one by one.
  while v = leaves.shift
    num_courses -= 1
    edges[v].each do |u|
      deg[u] -= 1
      if deg[u] == 0
        leaves << u
        res << u
      end
    end
  end
  # no cycles if no more vertices
  num_courses == 0 ? res : []
end
