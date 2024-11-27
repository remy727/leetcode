# frozen_string_literal: true

# 3243. Shortest Distance After Road Addition Queries I
# https://leetcode.com/problems/shortest-distance-after-road-addition-queries-i
# Medium

=begin
You are given an integer n and a 2D integer array queries.
There are n cities numbered from 0 to n - 1. Initially, there is a unidirectional road from city i to city i + 1 for all 0 <= i < n - 1.
queries[i] = [ui, vi] represents the addition of a new unidirectional road from city ui to city vi. After each query, you need to find the length of the shortest path from city 0 to city n - 1.
Return an array answer where for each i in the range [0, queries.length - 1], answer[i] is the length of the shortest path from city 0 to city n - 1 after processing the first i + 1 queries.

Example 1:
Input: n = 5, queries = [[2,4],[0,2],[0,4]]
Output: [3,2,1]

Example 2:
Input: n = 4, queries = [[0,3],[0,2]]
Output: [1,1]

Constraints:
* 3 <= n <= 500
* 1 <= queries.length <= 500
* queries[i].length == 2
* 0 <= queries[i][0] < queries[i][1] < n
* 1 < queries[i][1] - queries[i][0]
* There are no repeated roads among the queries.
=end

# @param {Integer} n
# @param {Integer[][]} queries
# @return {Integer[]}
def shortest_distance_after_queries(n, queries)
  roads = Array.new(n) { [] }
  dp = (0...n).to_a
  res = []

  queries.each do |q|
    roads[q[1]] << q[0]
    (q[1]...n).each do |i|
      dp[i] = [dp[i], dp[i - 1] + 1].min
      roads[i].each do |l|
        dp[i] = [dp[i], dp[l] + 1].min
      end
    end
    res << dp[n - 1]
  end

  res
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_sliding_puzzle < Test::Unit::TestCase
  def test_
    assert_equal [3, 2, 1], shortest_distance_after_queries(5, [[2, 4], [0, 2], [0, 4]])
    assert_equal [1, 1], shortest_distance_after_queries(4, [[0, 3], [0, 2]])
  end
end
