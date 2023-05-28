# frozen_string_literal: true

# 124. Binary Tree Maximum Path Sum
# https://leetcode.com/problems/binary-tree-maximum-path-sum
# Hard

=begin
A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. Note that the path does not need to pass through the root.

The path sum of a path is the sum of the node's values in the path.

Given the root of a binary tree, return the maximum path sum of any non-empty path.

Example 1:
Input: root = [1,2,3]
Output: 6
Explanation: The optimal path is 2 -> 1 -> 3 with a path sum of 2 + 1 + 3 = 6.

Example 2:
Input: root = [-10,9,20,null,null,15,7]
Output: 42
Explanation: The optimal path is 15 -> 20 -> 7 with a path sum of 15 + 20 + 7 = 42.

Constraints:
* The number of nodes in the tree is in the range [1, 3 * 104].
* -1000 <= Node.val <= 1000
=end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}
def max_path_sum(root)
  res = -Float::INFINITY
  dfs = -> node do
    return 0 unless node
    val = node.val
    max_left = dfs.(node.left)
    max_right = dfs.(node.right)
    path_node_max = val + max_left + max_right
    res = [res, path_node_max].max
    [ 0, val + max_left, val + max_right ].max
  end

  dfs.(root)
  res
end
