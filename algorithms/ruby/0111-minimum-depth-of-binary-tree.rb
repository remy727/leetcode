# frozen_string_literal: true

# 111. Minimum Depth of Binary Tree
# Easy
# https://leetcode.com/problems/minimum-depth-of-binary-tree

=begin
Given a binary tree, find its minimum depth.
The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
Note: A leaf is a node with no children.

Example 1:
Input: root = [3,9,20,null,null,15,7]
Output: 2

Example 2:
Input: root = [2,null,3,null,4,null,5,null,6]
Output: 5

Constraints:
* The number of nodes in the tree is in the range [0, 105].
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
def min_depth(root)
  return 0 if root.nil?
  return 1 + min_depth(root.right) if root.left.nil?
  return 1 + min_depth(root.left) if root.right.nil?
  1 + [min_depth(root.left), min_depth(root.right)].min
end
