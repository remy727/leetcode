# frozen_string_literal: true

# 1489. Find Critical and Pseudo-Critical Edges in Minimum Spanning Tree
# Hard
# https://leetcode.com/problems/find-critical-and-pseudo-critical-edges-in-minimum-spanning-tree

=begin
Given a weighted undirected connected graph with n vertices numbered from 0 to n - 1, and an array edges where edges[i] = [ai, bi, weighti] represents a bidirectional and weighted edge between nodes ai and bi. A minimum spanning tree (MST) is a subset of the graph's edges that connects all vertices without cycles and with the minimum possible total edge weight.
Find all the critical and pseudo-critical edges in the given graph's minimum spanning tree (MST). An MST edge whose deletion from the graph would cause the MST weight to increase is called a critical edge. On the other hand, a pseudo-critical edge is that which can appear in some MSTs but not all.
Note that you can return the indices of the edges in any order.

Example 1:
Input: n = 5, edges = [[0,1,1],[1,2,1],[2,3,2],[0,3,2],[0,4,3],[3,4,3],[1,4,6]]
Output: [[0,1],[2,3,4,5]]
Explanation: The figure above describes the graph.
The following figure shows all the possible MSTs:
Notice that the two edges 0 and 1 appear in all MSTs, therefore they are critical edges, so we return them in the first list of the output.
The edges 2, 3, 4, and 5 are only part of some MSTs, therefore they are considered pseudo-critical edges. We add them to the second list of the output.

Example 2:
Input: n = 4, edges = [[0,1,1],[1,2,1],[2,3,1],[0,3,1]]
Output: [[],[0,1,2,3]]
Explanation: We can observe that since all 4 edges have equal weight, choosing any 3 edges from the given 4 will yield an MST. Therefore all 4 edges are pseudo-critical.

Constraints:
* 2 <= n <= 100
* 1 <= edges.length <= min(200, n * (n - 1) / 2)
* edges[i].length == 3
* 0 <= ai < bi < n
* 1 <= weighti <= 1000
* All pairs (ai, bi) are distinct.
=end

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[][]}
def find_critical_and_pseudo_critical_edges(n, e)
  return [[*n.pred.times], []] if e.size == n.pred
  e.each_with_index { _1 << _2 } .sort_by! { _1[-2] }
  msu = -> s, sf do
    p, c, r = n.times.to_a, [1] * n, 0
    f = -> x { p[x] == x ? x : (p[x] = f.(p[x])) }
    u = Proc.new do | a, b, x, i |
      next if (ra = f.(a)) == (rb = f.(b))
      ra, rb = rb, ra if c[ra] < c[rb]
      r += x; p[rb] = ra
      return r if (c[ra] += c[rb]) == n
    end
    u.(*e[s]) if !sf && s < e.size
    s = e[s].last if s < e.size
    e.each do | a, b, x, i |
      next if i == s
      u.(a, b, x, i)
    end
    1e6
  end
  t, c, p = msu.(200, false), [], []
  e.size.times do | s |
    i = e[s].last
    c << i if t < msu.(s, true)
    p << i if t == msu.(s, false)
  end
  [c, p - c]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_length_of_longest_substring < Test::Unit::TestCase
  def test_
    assert_equal [[0,1],[2,3,4,5]], find_critical_and_pseudo_critical_edges(5, [[0,1,1],[1,2,1],[2,3,2],[0,3,2],[0,4,3],[3,4,3],[1,4,6]])
    assert_equal [[],[0,1,2,3]], find_critical_and_pseudo_critical_edges(4, [[0,1,1],[1,2,1],[2,3,1],[0,3,1]])
  end
end