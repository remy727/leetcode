# frozen_string_literal: true

# 2316. Count Unreachable Pairs of Nodes in an Undirected Graph
# https://leetcode.com/problems/count-unreachable-pairs-of-nodes-in-an-undirected-graph

=begin

You are given an integer n. There is an undirected graph with n nodes, numbered from 0 to n - 1. You are given a 2D integer array edges where edges[i] = [ai, bi] denotes that there exists an undirected edge connecting nodes ai and bi.

Return the number of pairs of different nodes that are unreachable from each other.

### Example 1:
Input: n = 3, edges = [[0,1],[0,2],[1,2]]
Output: 0
Explanation: There are no pairs of nodes that are unreachable from each other. Therefore, we return 0.

### Example 2:
Input: n = 7, edges = [[0,2],[0,5],[2,4],[1,6],[5,4]]
Output: 14
Explanation: There are 14 pairs of nodes that are unreachable from each other:
[[0,1],[0,3],[0,6],[1,2],[1,3],[1,4],[1,5],[2,3],[2,6],[3,4],[3,5],[3,6],[4,6],[5,6]].
Therefore, we return 14.

### Constraints:
* 1 <= n <= 105
* 0 <= edges.length <= 2 * 105
* edges[i].length == 2
* 0 <= ai, bi < n
* ai != bi
* There are no repeated edges.

=end

# Runtime: 403 ms
# Memory Usage: 247.1 MB
# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def count_pairs(n, edges)
  @adj = Array.new(n + 1).map { [] }
  @v = Array.new(n + 1, false)
  @total = 0
  @ans = 0
  edges.each do |a, b|
    @adj[a].push(b)
    @adj[b].push(a)
  end
  (0...n).each do |i|
    next if @v[i]
    bfs(i)
  end
  @ans
end

def bfs(i)
  return if @v[i]
  count = 0
  q = [i]
  @v[i] = true
  while !q.empty?
    x = q.shift
    count += 1
    @ans += @total
    @adj[x].each do |j|
      next if @v[j]
      @v[j] = true
      q.push(j)
    end
  end
  @total += count
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_count_pairs < Test::Unit::TestCase
  def test_
    assert_equal 0, count_pairs(3, [[0, 1], [0, 2], [1, 2]])
    assert_equal 14, count_pairs(7, [[0, 2], [0, 5], [2, 4], [1, 6], [5, 4]])
  end
end
