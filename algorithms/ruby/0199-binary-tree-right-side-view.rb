# frozen_string_literal: true

# 199. Binary Tree Right Side View
# https://leetcode.com/problems/binary-tree-right-side-view/
# Difficulty: Medium

=begin
Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

Example 1:
Input: root = [1,2,3,null,5,null,4]
Output: [1,3,4]

Example 2:
Input: root = [1,null,3]
Output: [1,3]

Example 3:
Input: root = []
Output: []

Constraints:
The number of nodes in the tree is in the range [0, 100].
-100 <= Node.val <= 100

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
def right_side_view(root)
  return [] unless root
  res = []
  queue = [root]

  until queue.empty?
    current = nil
    queue.size.times do
      current = queue.shift
      queue.push(current.left) if current.left
      queue.push(current.right) if current.right
    end
    res << current.val
  end
  res
end
