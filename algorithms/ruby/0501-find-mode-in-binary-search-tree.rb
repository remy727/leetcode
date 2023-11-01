# frozen_string_literal: true

# 501. Find Mode in Binary Search Tree
# Easy
# https://leetcode.com/problems/find-mode-in-binary-search-tree

=begin
Given the root of a binary search tree (BST) with duplicates, return all the mode(s) (i.e., the most frequently occurred element) in it.
If the tree has more than one mode, return them in any order.
Assume a BST is defined as follows:
* The left subtree of a node contains only nodes with keys less than or equal to the node's key.
* The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
* Both the left and right subtrees must also be binary search trees.

Example 1:
Input: root = [1,null,2,2]
Output: [2]

Example 2:
Input: root = [0]
Output: [0]

Constraints:
* The number of nodes in the tree is in the range [1, 104].
* -105 <= Node.val <= 105
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
# @return {Integer[]}
def find_mode(root)
  inorder(root, 0, 0, nil, modes = [])

  modes
end

def inorder(root, local_max, global_max, prev, modes)
  return [local_max, global_max, prev] unless root

  local_max, global_max, prev = inorder(root.left, local_max, global_max, prev, modes)
  val = root.val

  if prev&.val == root.val
    local_max += 1
  else
    local_max = 1
  end
  if local_max == global_max
    modes << val
  elsif local_max > global_max
    global_max = local_max
    modes.clear
    modes << val
  end
  prev = root
  local_max, global_max, prev = inorder(root.right, local_max, global_max, prev, modes)
  [local_max, global_max, prev]
end
