# frozen_string_literal: true

# 114. Flatten Binary Tree to Linked List
# https://leetcode.com/problems/flatten-binary-tree-to-linked-list
# Medium

=begin
Given the root of a binary tree, flatten the tree into a "linked list":

The "linked list" should use the same TreeNode class where the right child pointer points to the next node in the list and the left child pointer is always null.
The "linked list" should be in the same order as a pre-order traversal of the binary tree.

Example 1:
Input: root = [1,2,5,3,4,null,6]
Output: [1,null,2,null,3,null,4,null,5,null,6]

Example 2:
Input: root = []
Output: []

Example 3:
Input: root = [0]
Output: [0]

Constraints:
* The number of nodes in the tree is in the range [0, 2000].
* -100 <= Node.val <= 100
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
# @return {Void} Do not return anything, modify root in-place instead.
def flatten(root)
  last = root
  q = []
  q.push(last) if root
  while ! q.empty?
    el = q.pop
    r, l = el.right, el.left
    el.right, el.left = nil, nil
    if el != last
      last.right = el
      last.left = nil
      last = last.right
    end
    q.push(r) if r
    q.push(l) if l
  end
  root
end
