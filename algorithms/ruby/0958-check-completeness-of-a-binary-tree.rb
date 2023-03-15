# frozen_string_literal: true

# Problem: 958. Check Completeness of a Binary Tree
# URL: https://leetcode.com/problems/check-completeness-of-a-binary-tree

=begin

Given the root of a binary tree, determine if it is a complete binary tree.

In a complete binary tree, every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

### Constraints:

* The number of nodes in the tree is in the range [1, 100].
* 1 <= Node.val <= 1000

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
def is_complete_tree(root)
  q = [root]
  q.push root.left, root.right while root = q.shift
  q.count(nil) == q.size
end
