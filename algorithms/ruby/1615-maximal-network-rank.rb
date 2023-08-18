# frozen_string_literal: true

# 1615. Maximal Network Rank
# Medium
# https://leetcode.com/problems/maximal-network-rank

=begin
There is an infrastructure of n cities with some number of roads connecting these cities. Each roads[i] = [ai, bi] indicates that there is a bidirectional road between cities ai and bi.
The network rank of two different cities is defined as the total number of directly connected roads to either city. If a road is directly connected to both cities, it is only counted once.
The maximal network rank of the infrastructure is the maximum network rank of all pairs of different cities.
Given the integer n and the array roads, return the maximal network rank of the entire infrastructure.

Example 1:
Input: n = 4, roads = [[0,1],[0,3],[1,2],[1,3]]
Output: 4
Explanation: The network rank of cities 0 and 1 is 4 as there are 4 roads that are connected to either 0 or 1. The road between 0 and 1 is only counted once.

Example 2:
Input: n = 5, roads = [[0,1],[0,3],[1,2],[1,3],[2,3],[2,4]]
Output: 5
Explanation: There are 5 roads that are connected to cities 1 or 2.

Example 3:
Input: n = 8, roads = [[0,1],[1,2],[2,3],[2,4],[5,6],[5,7]]
Output: 5
Explanation: The network rank of 2 and 5 is 5. Notice that all the cities do not have to be connected.

Constraints:
* 2 <= n <= 100
* 0 <= roads.length <= n * (n - 1) / 2
* roads[i].length == 2
* 0 <= ai, bi <= n-1
* ai != bi
=end

# @param {Integer} n
# @param {Integer[][]} roads
# @return {Integer}
def maximal_network_rank(n, roads)
  digit_rank = Array.new(n, 0)
  is_connected = Array.new(n) { Array.new(n, false) }
  max_rank = 0

  roads.each do |road|
    a, b = road
    digit_rank[a] += 1
    digit_rank[b] += 1
    is_connected[a][b] = true
    is_connected[b][a] = true
  end

  for i in 0...n
    for j in i + 1...n
      rank = digit_rank[i] + digit_rank[j]
      # remove the double count of the common road
      rank -= 1 if is_connected[i][j]
      max_rank = [max_rank, rank].max
    end
  end

  max_rank
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_maximal_network_rank < Test::Unit::TestCase
  def test_
    assert_equal 4, maximal_network_rank(4, [[0, 1], [0, 3], [1, 2], [1, 3]])
    assert_equal 5, maximal_network_rank(5, [[0, 1], [0, 3], [1, 2], [1, 3], [2, 3], [2, 4]])
    assert_equal 5, maximal_network_rank(8, [[0, 1], [1, 2], [2, 3], [2, 4], [5, 6], [5, 7]])
  end
end
