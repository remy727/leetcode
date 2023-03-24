# frozen_string_literal: true

# 1466. Reorder Routes to Make All Paths Lead to the City Zero
# https://leetcode.com/problems/reorder-routes-to-make-all-paths-lead-to-the-city-zero

=begin

There are n cities numbered from 0 to n - 1 and n - 1 roads such that there is only one way to travel between two different cities (this network form a tree). Last year, The ministry of transport decided to orient the roads in one direction because they are too narrow.

Roads are represented by connections where connections[i] = [ai, bi] represents a road from city ai to city bi.

This year, there will be a big event in the capital (city 0), and many people want to travel to this city.

Your task consists of reorienting some roads such that each city can visit the city 0. Return the minimum number of edges changed.

It's guaranteed that each city can reach city 0 after reorder.

### Example 1:
Input: n = 6, connections = [[0,1],[1,3],[2,3],[4,0],[4,5]]
Output: 3
Explanation: Change the direction of edges show in red such that each node can reach the node 0 (capital).

### Example 2:
Input: n = 5, connections = [[1,0],[1,2],[3,2],[3,4]]
Output: 2
Explanation: Change the direction of edges show in red such that each node can reach the node 0 (capital).

### Example 3:
Input: n = 3, connections = [[1,0],[2,0]]
Output: 0

=end

# Runtime 396 ms
# Memory 234 MB
# @param {Integer} n
# @param {Integer[][]} connections
# @return {Integer}
def min_reorder(n, connections)
  al = {}
  connections.each do |c|
    al[c[0]] = al[c[0]].to_a + [c[1]]
    al[c[1]] = al[c[1]].to_a + [-c[0]]
  end

  dfs(al, [], 0)
end

def dfs(al, visited, from)
  change = 0
  visited[from] = true

  al[from].each do |to|
    unless visited[to.abs]
      change += dfs(al, visited, to.abs) + (to > 0 ? 1 : 0)
    end
  end

  change
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_min_reorder < Test::Unit::TestCase
  def test_
    assert_equal 3, min_reorder(6, [[0, 1], [1, 3], [2, 3], [4, 0], [4, 5]])
    assert_equal 2, min_reorder(5, [[1, 0], [1, 2], [3, 2], [3, 4]])
    assert_equal 0, min_reorder(3, [[1, 0], [2, 0]])
  end
end
