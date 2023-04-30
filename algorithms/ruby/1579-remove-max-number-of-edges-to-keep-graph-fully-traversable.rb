# frozen_string_literal: true

# 1579. Remove Max Number of Edges to Keep Graph Fully Traversable
# https://leetcode.com/problems/remove-max-number-of-edges-to-keep-graph-fully-traversable
# Difficulty: Hard

=begin
Alice and Bob have an undirected graph of n nodes and three types of edges:

Type 1: Can be traversed by Alice only.
Type 2: Can be traversed by Bob only.
Type 3: Can be traversed by both Alice and Bob.
Given an array edges where edges[i] = [typei, ui, vi] represents a bidirectional edge of type typei between nodes ui and vi, find the maximum number of edges you can remove so that after removing the edges, the graph can still be fully traversed by both Alice and Bob. The graph is fully traversed by Alice and Bob if starting from any node, they can reach all other nodes.

Return the maximum number of edges you can remove, or return -1 if Alice and Bob cannot fully traverse the graph.

Example 1:
Input: n = 4, edges = [[3,1,2],[3,2,3],[1,1,3],[1,2,4],[1,1,2],[2,3,4]]
Output: 2
Explanation: If we remove the 2 edges [1,1,2] and [1,1,3]. The graph will still be fully traversable by Alice and Bob. Removing any additional edge will not make it so. So the maximum number of edges we can remove is 2.

Example 2:
Input: n = 4, edges = [[3,1,2],[3,2,3],[1,1,4],[2,1,4]]
Output: 0
Explanation: Notice that removing any edge will not make the graph fully traversable by Alice and Bob.

Example 3:
Input: n = 4, edges = [[3,2,3],[1,1,2],[2,3,4]]
Output: -1
Explanation: In the current graph, Alice cannot reach node 4 from the other nodes. Likewise, Bob cannot reach 1. Therefore it's impossible to make the graph fully traversable.

Constraints:
* 1 <= n <= 105
* 1 <= edges.length <= min(105, 3 * n * (n - 1) / 2)
* edges[i].length == 3
* 1 <= typei <= 3
* 1 <= ui < vi <= n
* All tuples (typei, ui, vi) are distinct.
=end

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def max_num_edges_to_remove(n, edges)
  nodes = Array.new(n) { |index| Node.new(index) }

  alice_edges_count = 0
  bob_edges_count = 0
  both_edges_count = 0

  edges.each do |type, first_node_index, second_node_index|
    first_node_index -= 1
    second_node_index -= 1

    if type == 1
      alice_edges_count += 1
      nodes[first_node_index].next_nodes[:alice] << nodes[second_node_index]
      nodes[second_node_index].next_nodes[:alice] << nodes[first_node_index]
    elsif type == 2
      bob_edges_count += 1
      nodes[first_node_index].next_nodes[:bob] << nodes[second_node_index]
      nodes[second_node_index].next_nodes[:bob] << nodes[first_node_index]
    else

      both_edges_count += 1
      nodes[first_node_index].next_nodes[:both] << nodes[second_node_index]
      nodes[second_node_index].next_nodes[:both] << nodes[first_node_index]
    end
  end

  return -1 if check_nodes_for_one_person(nodes, :alice) == -1
  return -1 if check_nodes_for_one_person(nodes, :bob) == -1

  needed_individual_edges_count = check_both_edges_only(nodes)

  alice_edges_count + bob_edges_count + (both_edges_count - (n - 1)) - needed_individual_edges_count
end

def check_nodes_for_one_person(nodes, label)
  @checked = Array.new(nodes.size, nil)
  check_node(nodes[0], label)

  return -1 if @checked.include? nil
end

def check_both_edges_only(nodes)
  @checked = Array.new(nodes.size, nil)
  @checked.each_with_index do |_, node_val|
    next if @checked[node_val]

    check_both(nodes[node_val], node_val)
  end

  @checked.uniq.count - 1
end

def check_node(node, label)
  return if @checked[node.val]

  @checked[node.val] = true
  node.next_nodes[label].each do |next_node|
    check_node(next_node, label)
  end

  node.next_nodes[:both].each do |next_node|
    check_node(next_node, label)
  end
end

def check_both(node, label)
  return if @checked[node.val]

  @checked[node.val] = label

  node.next_nodes[:both].each do |next_node|
    check_both(next_node, label)
  end
end

class Node
  attr_reader :val, :next_nodes

  def initialize(val)
    @val = val
    @next_nodes = { alice: [], bob: [], both: [] }
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_two_sum < Test::Unit::TestCase
  def test_
    assert_equal 2, max_num_edges_to_remove(4, [[3, 1, 2], [3, 2, 3], [1, 1, 3], [1, 2, 4], [1, 1, 2], [2, 3, 4]])
    assert_equal 0, max_num_edges_to_remove(4, [[3, 1, 2], [3, 2, 3], [1, 1, 4], [2, 1, 4]])
    assert_equal(-1, max_num_edges_to_remove(4, [[3, 2, 3], [1, 1, 2], [2, 3, 4]]))
  end
end
