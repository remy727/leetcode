# frozen_string_literal: true

# 98. Validate Binary Search Tree
# https://leetcode.com/problems/validate-binary-search-tree

=begin

Given the root of a binary tree, determine if it is a valid binary search tree (BST).

A valid BST is defined as follows:

* The left subtree of a node contains only nodes with keys less than the node's key.
* The right subtree of a node contains only nodes with keys greater than the node's key.
* Both the left and right subtrees must also be binary search trees.

### Example 1:
Input: root = [2,1,3]
Output: true

### Example 2:
Input: root = [5,1,4,null,null,3,6]
Output: false
Explanation: The root node's value is 5 but its right child's value is 4.

### Constraints:
* The number of nodes in the tree is in the range [1, 104].
* -231 <= Node.val <= 231 - 1

=end

# Runtime: 83 ms
# Memory: 211.7 MB
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
def is_valid_bst(root, min = -Float::INFINITY, max = Float::INFINITY)
  !root ||
    min < root.val &&
    root.val < max &&
    is_valid_bst(root.left, min, root.val) &&
    is_valid_bst(root.right, root.val, max)
end
