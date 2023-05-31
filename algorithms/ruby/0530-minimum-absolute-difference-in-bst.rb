# frozen_string_literal: true

# 530. Minimum Absolute Difference in BST
# https://leetcode.com/problems/minimum-absolute-difference-in-bst
# Easy

=begin
Given the root of a Binary Search Tree (BST), return the minimum absolute difference between the values of any two different nodes in the tree.

Example 1:
Input: root = [4,2,6,1,3]
Output: 1

Example 2:
Input: root = [1,0,48,null,null,12,49]
Output: 1

Constraints:
* The number of nodes in the tree is in the range [2, 104].
* 0 <= Node.val <= 105
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
# @param {TreeNode} root
# @return {Integer}
def get_minimum_difference(root)
  @prev = nil
  @min_diff = Float::INFINITY

  in_order_traversal(root)
  @min_diff
end

def in_order_traversal(node)
  return if node.nil?

  in_order_traversal(node.left)

  if @prev
    diff = node.val - @prev.val
    @min_diff = [@min_diff, diff].min
  end

  @prev = node
  in_order_traversal(node.right)
end
