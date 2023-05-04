# frozen_string_literal: true

# 110. Balanced Binary Tree
# https://leetcode.com/problems/balanced-binary-tree/
# Easy

=begin

Given a binary tree, determine if it is height-balanced.

### Example 1:
Input: root = [3,9,20,null,null,15,7]
Output: true

### Example 2:
Input: root = [1,2,2,3,3,null,null,4,4]
Output: false

### Example 3:
Input: root = []
Output: true

### Constraints:
* The number of nodes in the tree is in the range [0, 5000].
* -104 <= Node.val <= 104

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
# @return {Boolean}
def is_balanced(root)
  balanced_height(root, 0) >= 0
end

def balanced_height(root, height)
  return height unless root

  l = balanced_height(root.left, height + 1)
  r = balanced_height(root.right, height + 1)

  return -1 if l == -1 || r == -1 || (l - r).abs > 1

  [l, r].max
end
