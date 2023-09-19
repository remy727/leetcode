# frozen_string_literal: true

# 847. Shortest Path Visiting All Nodes
# Hard
# https://leetcode.com/problems/shortest-path-visiting-all-nodes

=begin
You have an undirected, connected graph of n nodes labeled from 0 to n - 1. You are given an array graph where graph[i] is a list of all the nodes connected with node i by an edge.
Return the length of the shortest path that visits every node. You may start and stop at any node, you may revisit nodes multiple times, and you may reuse edges.

Example 1:
Input: graph = [[1,2,3],[0],[0],[0]]
Output: 4
Explanation: One possible path is [1,0,2,0,3]

Example 2:
Input: graph = [[1],[0,2,4],[1,3,4],[2],[1,2]]
Output: 4
Explanation: One possible path is [0,1,4,2,3]

Constraints:
* n == graph.length
* 1 <= n <= 12
* 0 <= graph[i].length < n
* graph[i] does not contain i.
* If graph[a] contains b, then graph[b] contains a.
* The input graph is always connected.
=end

# @param {Integer[][]} graph
# @return {Integer}
def shortest_path_length(graph)
  v = graph.length
  curr_level = []

  (0...v).each do |u|
    curr_level << [u, 1 << u]
  end

  all_visited = (1 << v) - 1
  visited = Array.new(v) { Array.new(all_visited + 1, false) }

  (0...v).each do |u|
    visited[u][1 << u] = true
  end

  path_length = 0

  until curr_level.empty?
    n = curr_level.length
    while n.positive?
      u, bit_mask = curr_level.shift

      return path_length if bit_mask == all_visited

      graph[u].each do |v|
        next_bit_mask = bit_mask | (1 << v)

        next if visited[v][next_bit_mask]

        return path_length + 1 if next_bit_mask == all_visited

        curr_level << [v, next_bit_mask]
        visited[v][next_bit_mask] = true
      end

      n -= 1
    end

    path_length += 1
  end

  -1
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_shortest_path_length < Test::Unit::TestCase
  def test_
    assert_equal 4, shortest_path_length([[1, 2, 3], [0], [0], [0]])
    assert_equal 4, shortest_path_length([[1], [0, 2, 4], [1, 3, 4], [2], [1, 2]])
  end
end
