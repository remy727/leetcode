# frozen_string_literal: true

# Problem: 106. Construct Binary Tree from Inorder and Postorder Traversal
# URL: https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal

=begin

Given two integer arrays inorder and postorder where inorder is the inorder traversal of a binary tree and postorder is the postorder traversal of the same tree, construct and return the binary tree.

### Constraints:

* 1 <= inorder.length <= 3000
* postorder.length == inorder.length
* -3000 <= inorder[i], postorder[i] <= 3000
* inorder and postorder consist of unique values.
* Each value of postorder also appears in inorder.
* inorder is guaranteed to be the inorder traversal of the tree.
* postorder is guaranteed to be the postorder traversal of the tree.

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
# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
def build_tree(inorder, postorder)
  return nil if inorder.empty? || postorder.empty?

  current = postorder.pop
  root = TreeNode.new(current)
  mid = inorder.index(current)

  left_inorder = inorder[0...mid]
  right_inorder = inorder[mid + 1..-1]

  left_postorder = postorder.first(left_inorder.length)
  right_postorder = postorder.last(right_inorder.length)

  root.left = build_tree(left_inorder, left_postorder)
  root.right = build_tree(right_inorder, right_postorder)

  root
end
