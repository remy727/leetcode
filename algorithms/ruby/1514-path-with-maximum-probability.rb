# frozen_string_literal: true

# 1514. Path with Maximum Probability
# Medium
# https://leetcode.com/problems/path-with-maximum-probability

=begin
You are given an undirected weighted graph of n nodes (0-indexed), represented by an edge list where edges[i] = [a, b] is an undirected edge connecting the nodes a and b with a probability of success of traversing that edge succProb[i].
Given two nodes start and end, find the path with the maximum probability of success to go from start to end and return its success probability.
If there is no path from start to end, return 0. Your answer will be accepted if it differs from the correct answer by at most 1e-5.

Example 1:
Input: n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.5,0.5,0.2], start = 0, end = 2
Output: 0.25000
Explanation: There are two paths from start to end, one having a probability of success = 0.2 and the other has 0.5 * 0.5 = 0.25.

Example 2:
Input: n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.5,0.5,0.3], start = 0, end = 2
Output: 0.30000

Example 3:
Input: n = 3, edges = [[0,1]], succProb = [0.5], start = 0, end = 2
Output: 0.00000
Explanation: There is no path between 0 and 2.

Constraints:
* 2 <= n <= 10^4
* 0 <= start, end < n
* start != end
* 0 <= a, b < n
* a != b
* 0 <= succProb.length == edges.length <= 2*10^4
* 0 <= succProb[i] <= 1
* There is at most one edge between every two nodes.
=end

# @param {Integer} n
# @param {Integer[][]} edges
# @param {Float[]} succ_prob
# @param {Integer} start_path
# @param {Integer} end_path
# @return {Float}
def max_probability(_, edges, succ_prob, start_path, end_path)
  graph = Hash.new { |h, k| h[k] = [] }
  edges.each.with_index { |(f, t), i|
    prob = succ_prob[i]
    graph[f] << [t, prob]
    graph[t] << [f, prob]
  }

  q = [[1, start_path]]
  v = Set[]

  while (path_prob, node = q.shift)
    next unless v.add?(node)
    return path_prob if node == end_path
    graph[node].each { |node, edge_prob|
      prob = path_prob * edge_prob
      rec = [prob, node]
      i = q.bsearch_index { |q_prob, _| prob > q_prob } || q.size
      q.insert(i, rec)
    }
  end

  0
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_probability < Test::Unit::TestCase
  def test_
    assert_equal 0.25000, max_probability(3, [[0, 1], [1, 2], [0, 2]], [0.5, 0.5, 0.2], 0, 2)
    assert_equal 0.30000, max_probability(3, [[0, 1], [1, 2], [0, 2]], [0.5, 0.5, 0.3], 0, 2)
    assert_equal 0.00000, max_probability(3, [[0, 1]], [0.5], 0, 2)
  end
end
