# frozen_string_literal: true

# Problem: 101. Symmetric Tree
# URL: https://leetcode.com/problems/symmetric-tree

=begin

Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

### Constraints:

* The number of nodes in the tree is in the range [1, 1000].
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
# @return {Boolean}
def is_symmetric(root)
  return true unless root

  symmetric_trees?(root.left, root.right)
end

def symmetric_trees?(node1, node2)
  return true if node1.nil? && node2.nil?
  return false if node1&.val != node2&.val

  symmetric_trees?(node1.left, node2.right) && symmetric_trees?(node1.right, node2.left)
end
