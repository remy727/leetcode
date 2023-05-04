# frozen_string_literal: true

# 547. Number of Provinces
# https://leetcode.com/problems/number-of-provinces
# Medium

=begin
There are n cities. Some of them are connected, while some are not. If city a is connected directly with city b, and city b is connected directly with city c, then city a is connected indirectly with city c.

A province is a group of directly or indirectly connected cities and no other cities outside of the group.

You are given an n x n matrix isConnected where isConnected[i][j] = 1 if the ith city and the jth city are directly connected, and isConnected[i][j] = 0 otherwise.

Return the total number of provinces.

Example 1:
Input: isConnected = [[1,1,0],[1,1,0],[0,0,1]]
Output: 2

Example 2:
Input: isConnected = [[1,0,0],[0,1,0],[0,0,1]]
Output: 3

Constraints:
1 <= n <= 200
n == isConnected.length
n == isConnected[i].length
isConnected[i][j] is 1 or 0.
isConnected[i][i] == 1
isConnected[i][j] == isConnected[j][i]
=end

# @param {Integer[][]} is_connected
# @return {Integer}
def find_circle_num(is_connected)
  visited = Array.new(is_connected.size, 0)
  count = 0
  is_connected.size.times do |i|
    if visited[i] == 0
      dfs(is_connected, visited, i)
      count += 1
    end
  end
  count
end

def dfs(m, visited, i)
  m.size.times do |j|
    if m[i][j] == 1 && visited[j] == 0
      visited[j] = 1
      dfs(m, visited, j)
    end
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_find_circle_num < Test::Unit::TestCase
  def test_
    assert_equal 2, find_circle_num([[1, 1, 0], [1, 1, 0], [0, 0, 1]])
    assert_equal 3, find_circle_num([[1, 0, 0], [0, 1, 0], [0, 0, 1]])
  end
end
