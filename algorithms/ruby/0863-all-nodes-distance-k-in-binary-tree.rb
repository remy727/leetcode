# frozen_string_literal: true

# 863. All Nodes Distance K in Binary Tree
# Medium
# https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree

=begin
Given the root of a binary tree, the value of a target node target, and an integer k, return an array of the values of all nodes that have a distance k from the target node.

You can return the answer in any order.

Example 1:
Input: root = [3,5,1,6,2,0,8,null,null,7,4], target = 5, k = 2
Output: [7,4,1]
Explanation: The nodes that are a distance 2 from the target node (with value 5) have values 7, 4, and 1.

Example 2:
Input: root = [1], target = 1, k = 3
Output: []

Constraints:
* The number of nodes in the tree is in the range [1, 500].
* 0 <= Node.val <= 500
* All the values Node.val are unique.
* target is the value of one of the nodes in the tree.
* 0 <= k <= 1000
=end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end
# @param {TreeNode} root
# @param {TreeNode} target
# @param {Integer} k
# @return {Integer[]}
def distance_k(root, target, k)
  graph = {}
  build_graph(graph, root, nil)
  bfs(graph, target, k)
end

def build_graph(graph, node, parent)
  return if node.nil?

  graph[node] = []
  graph[node] << parent unless parent.nil?
  graph[parent] << node unless parent.nil?

  build_graph(graph, node.left, node)
  build_graph(graph, node.right, node)
end

def bfs(graph, target, k)
  queue = [[target, 0]]
  visited = { target => true }
  res = []

  while !queue.empty?
    node, dist = queue.shift

    if dist == k
      res << node.val
    end

    graph[node].each do |nei|
      next if visited[nei]

      visited[nei] = true
      queue << [nei, dist + 1]
    end
  end

  res
end
