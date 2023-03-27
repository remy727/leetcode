# frozen_string_literal: true

# 2360. Longest Cycle in a Graph
# https://leetcode.com/problems/longest-cycle-in-a-graph

=begin

You are given a directed graph of n nodes numbered from 0 to n - 1, where each node has at most one outgoing edge.

The graph is represented with a given 0-indexed array edges of size n, indicating that there is a directed edge from node i to node edges[i]. If there is no outgoing edge from node i, then edges[i] == -1.

Return the length of the longest cycle in the graph. If no cycle exists, return -1.

A cycle is a path that starts and ends at the same node.

### Example 1:
Input: edges = [3,3,4,2,3]
Output: 3
Explanation: The longest cycle in the graph is the cycle: 2 -> 4 -> 3 -> 2.
The length of this cycle is 3, so 3 is returned.

### Example 2:
Input: edges = [2,-1,3,1]
Output: -1
Explanation: There are no cycles in this graph.

### Constraints:
* n == edges.length
* 2 <= n <= 105
* -1 <= edges[i] < n
* edges[i] != i

=end

# Runtime 379 ms
# Memory 228.1 MB
# @param {Integer[]} edges
# @return {Integer}
def longest_cycle(edges)
  max = -1

  edges.size.times do |cur|
    next if edges[cur] < 0
    dists = {}
    dist = 0
    until cur < 0
      if dists[cur]
        cycle = dist - dists[cur]
        max = cycle if cycle > max
        break
      else
        dists[cur] = dist
        cur, edges[cur] = edges[cur], -1
        dist += 1
      end
    end
  end

  max
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_longest_cycle < Test::Unit::TestCase
  def test_
    assert_equal 3, longest_cycle([3, 3, 4, 2, 3])
    assert_equal(-1, longest_cycle([2, -1, 3, 1]))
  end
end
