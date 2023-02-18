# frozen_string_literal: true

# Problem: 226. Invert Binary Tree
# URL: https://leetcode.com/problems/invert-binary-tree

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
# @return {TreeNode}
def invert_tree(root)
  return if root.nil?
  root.left, root.right = invert_tree(root.right), invert_tree(root.left)
  root
end
