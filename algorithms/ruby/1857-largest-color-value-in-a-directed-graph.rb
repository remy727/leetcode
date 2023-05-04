# frozen_string_literal: true

# 1857. Largest Color Value in a Directed Graph
# https://leetcode.com/problems/largest-color-value-in-a-directed-graph
# Hard

=begin

There is a directed graph of n colored nodes and m edges. The nodes are numbered from 0 to n - 1.

You are given a string colors where colors[i] is a lowercase English letter representing the color of the ith node in this graph (0-indexed). You are also given a 2D array edges where edges[j] = [aj, bj] indicates that there is a directed edge from node aj to node bj.

A valid path in the graph is a sequence of nodes x1 -> x2 -> x3 -> ... -> xk such that there is a directed edge from xi to xi+1 for every 1 <= i < k. The color value of the path is the number of nodes that are colored the most frequently occurring color along that path.

Return the largest color value of any valid path in the given graph, or -1 if the graph contains a cycle.

### Example 1:
Input: colors = "abaca", edges = [[0,1],[0,2],[2,3],[3,4]]
Output: 3
Explanation: The path 0 -> 2 -> 3 -> 4 contains 3 nodes that are colored "a" (red in the above image).

### Example 2:
Input: colors = "a", edges = [[0,0]]
Output: -1
Explanation: There is a cycle from 0 to 0.

### Constraints:
* n == colors.length
* m == edges.length
* 1 <= n <= 105
* 0 <= m <= 105
* colors consists of lowercase English letters.
* 0 <= aj, bj < n

=end

# @param {String} colors
# @param {Integer[][]} edges
# @return {Integer}
def largest_path_value(color, edges)
  color = color.split("").map { |c| c.ord - "a".ord }
  n = color.size
  graph = 0.upto(n - 1).map { [] }
  in_degree = [0] * n

  edges.each do |u, v|
    graph[u] << v
    in_degree[v] += 1
  end

  qu = []
  cnt = 0.upto(n - 1).map { [0] * 26 }
  0.upto(n - 1) do |u|
    next if in_degree[u] != 0

    qu.push(u)
    cnt[u][color[u]] = 1
  end

  ret, seen = 0, 0
  until qu.empty?
    u = qu.shift
    ret = [ret, cnt[u][color[u]]].max
    seen += 1

    graph[u].each do |v|
      0.upto 25 do |i|
        add = i == color[v] ? 1 : 0
        cnt[v][i] = [cnt[v][i], cnt[u][i] + add].max
      end
      qu << v if (in_degree[v] -= 1).zero?
    end
  end

  seen < n ? -1 : ret
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_minimum_time < Test::Unit::TestCase
  def test_
    assert_equal 3, largest_path_value("abaca", [[0, 1], [0, 2], [2, 3], [3, 4]])
    assert_equal(-1, largest_path_value("a", [[0, 0]]))
  end
end
