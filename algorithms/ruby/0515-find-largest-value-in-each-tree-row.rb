# 515. Find Largest Value in Each Tree Row
# Medium
# https://leetcode.com/problems/find-largest-value-in-each-tree-row

=begin
Given the root of a binary tree, return an array of the largest value in each row of the tree (0-indexed).

Example 1:
Input: root = [1,3,2,5,3,null,9]
Output: [1,3,9]

Example 2:
Input: root = [1,2,3]
Output: [1,3]

Constraints:
The number of nodes in the tree will be in the range [0, 104].
-231 <= Node.val <= 231 - 1
=end

# frozen_string_literal: true

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
def largest_values(root)
  return [] if root.nil?

  res = []

  queue = Queue.new

  queue << root

  while !queue.empty? do
    n_a = []
    queue.size.times do
      node = queue.pop

      n_a << node.val
      if node.left != nil
        queue << node.left
      end

      if node.right != nil
        queue << node.right
      end
    end
    res << n_a.max
  end

  res
end
