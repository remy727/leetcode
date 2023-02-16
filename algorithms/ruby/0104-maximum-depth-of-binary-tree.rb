# frozen_string_literal: true

# Problem: # 104. Maximum Depth of Binary Tree
# URL: https://leetcode.com/problems/maximum-depth-of-binary-tree

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
def max_depth(root)
  root ? 1 + [max_depth(root.left), max_depth(root.right)].max : 0
end
