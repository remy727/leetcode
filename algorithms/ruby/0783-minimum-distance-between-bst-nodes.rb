# frozen_string_literal: true

# 783. Minimum Distance Between BST Nodes
# https://leetcode.com/problems/minimum-distance-between-bst-nodes
# Easy
# TODO: Write Tests

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
def min_diff_in_bst(root)
  @prev = nil
  @min = nil
  inorder_traversal(root)
  @min
end

def inorder_traversal(root)
  return if root.nil?
  inorder_traversal(root.left)
  if @prev
    val = root.val - @prev
    @min = @min ? [@min, val].min : val
  end
  @prev = root.val
  inorder_traversal(root.right)
end
