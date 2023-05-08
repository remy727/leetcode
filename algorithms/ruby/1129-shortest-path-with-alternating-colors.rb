# frozen_string_literal: true

# 1129. Shortest Path with Alternating Colors
# https://leetcode.com/problems/shortest-path-with-alternating-colors

# @param {Integer} n
# @param {Integer[][]} red_edges
# @param {Integer[][]} blue_edges
# @return {Integer[]}
def shortest_alternating_paths(n, red_edges, blue_edges)
  Graph.new(n, red_edges, blue_edges).shortest_alternating_paths
end

class Graph
  def initialize(n, red_edges, blue_edges)
    @n = n
    @graph_data = Array.new(@n) { { r: [], b: [] } }
    red_edges.each do |(from, to)|
      @graph_data[from][:r] << to
    end
    blue_edges.each do |(from, to)|
      @graph_data[from][:b] << to
    end
  end

  def shortest_alternating_paths
    queue = [[0, nil, 0]]
    visited_edges = {}
    result = Array.new(n) { -1 }

    while (node, parent_color, length = queue.shift)
      result[node] = length if result[node] == -1

      (%i(r b) - [parent_color]).each do |color|
        graph_data[node][color].each do |next_node|
          unless visited_edges.dig(node, next_node, color)
            visited_edges[node] ||= {}
            visited_edges[node][next_node] ||= {}
            visited_edges[node][next_node][color] = true
            queue << [next_node, color, length + 1]
          end
        end
      end
    end
    result
  end

  private
    attr_reader :graph_data, :n
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_shortest_alternating_paths < Test::Unit::TestCase
  def test_
    assert_equal [0, 1, -1], shortest_alternating_paths(3, [[0, 1], [1, 2]], [])
    assert_equal [0, 1, -1], shortest_alternating_paths(3, [[0, 1]], [[2, 1]])
  end
end
