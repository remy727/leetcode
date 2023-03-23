# frozen_string_literal: true

# 1319. Number of Operations to Make Network Connected
# https://leetcode.com/problems/number-of-operations-to-make-network-connected

=begin

There are n computers numbered from 0 to n - 1 connected by ethernet cables connections forming a network where connections[i] = [ai, bi] represents a connection between computers ai and bi. Any computer can reach any other computer directly or indirectly through the network.

You are given an initial computer network connections. You can extract certain cables between two directly connected computers, and place them between any pair of disconnected computers to make them directly connected.

Return the minimum number of times you need to do this in order to make all the computers connected. If it is not possible, return -1.

### Example 1
Input: n = 4, connections = [[0,1],[0,2],[1,2]]
Output: 1
Explanation: Remove cable between computer 1 and 2 and place between computers 1 and 3.

### Example 2
Input: n = 6, connections = [[0,1],[0,2],[0,3],[1,2],[1,3]]
Output: 2

### Example 3
Input: n = 6, connections = [[0,1],[0,2],[0,3],[1,2]]
Output: -1
Explanation: There are not enough cables.

### Constraints:

* 1 <= n <= 105
* 1 <= connections.length <= min(n * (n - 1) / 2, 105)
* connections[i].length == 2
* 0 <= ai, bi < n
* ai != bi
* There are no repeated connections.
* No two computers are connected by more than one cable.

=end

# Runtime 135 ms, Beats 100%
# Memory 215.3 MB, Beats 100%
# @param {Integer} n
# @param {Integer[][]} connections
# @return {Integer}
def make_connected(n, connections)
  return -1 if connections.size < n - 1

  number = n
  ds = Array.new(n, -1)

  connections.each do |c|
    i = find(ds, c[0])
    j = find(ds, c[1])

    if i != j
      if ds[j] < ds[i]
        i, j = j, i
      end

      ds[i] += ds[j]
      ds[j] = i
      number -= 1
    end
  end

  number - 1
end

def find(ds, i)
  ds[i] < 0 ? i : ds[i] = find(ds, ds[i])
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_make_connected < Test::Unit::TestCase
  def test_
    assert_equal 1, make_connected(4, [[0, 1], [0, 2], [1, 2]])
    assert_equal 2, make_connected(6, [[0, 1], [0, 2], [0, 3], [1, 2], [1, 3]])
    assert_equal(-1, make_connected(6, [[0, 1], [0, 2], [0, 3], [1, 2]]))
  end
end
