# frozen_string_literal: true

# 637. Average of Levels in Binary Tree
# https://leetcode.com/problems/average-of-levels-in-binary-tree
# Easy

=begin
Given the root of a binary tree, return the average value of the nodes on each level in the form of an array. Answers within 10-5 of the actual answer will be accepted.

Example 1:
Input: root = [3,9,20,null,null,15,7]
Output: [3.00000,14.50000,11.00000]
Explanation: The average value of nodes on level 0 is 3, on level 1 is 14.5, and on level 2 is 11.
Hence return [3, 14.5, 11].

Example 2:
Input: root = [3,9,20,15,7]
Output: [3.00000,14.50000,11.00000]

Constraints:
* The number of nodes in the tree is in the range [1, 104].
* -231 <= Node.val <= 231 - 1
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
# @return {Float[]}
def average_of_levels(root, sums = [], level = 0)
  return if !root
  sums[level] ||= [0, 0]
  sums[level][0] += root.val
  sums[level][1] += 1
  average_of_levels(root.left, sums, level + 1)
  average_of_levels(root.right, sums, level + 1)
  sums.map { |sum, n| sum.fdiv(n) } if level == 0
end
