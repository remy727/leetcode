# frozen_string_literal: true

# 543. Diameter of Binary Tree
# https://leetcode.com/problems/diameter-of-binary-tree/
# Easy

=begin
Given the root of a binary tree, return the length of the diameter of the tree.

The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

The length of a path between two nodes is represented by the number of edges between them.

Example 1:
Input: root = [1,2,3,4,5]
Output: 3
Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].

Example 2:
Input: root = [1,2]
Output: 1

Constraints:
* The number of nodes in the tree is in the range [1, 104].
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
# @return {Integer}
def diameter_of_binary_tree(root)
  diameter = 0

  longest_path = lambda do |node|
    return 0 if node.nil?

    left_path = longest_path[node.left]
    right_path = longest_path[node.right]

    diameter = [diameter, left_path + right_path].max

    [left_path, right_path].max + 1
  end

  longest_path[root]

  diameter
end
