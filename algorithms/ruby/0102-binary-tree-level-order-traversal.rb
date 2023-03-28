# frozen_string_literal: true

# 102. Binary Tree Level Order Traversal
# https://leetcode.com/problems/binary-tree-level-order-traversal

=begin

Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

### Example 1:
Input: root = [3,9,20,null,null,15,7]
Output: [[3],[9,20],[15,7]]

### Example 2:
Input: root = [1]
Output: [[1]]

### Example 3:
Input: root = []
Output: []

### Constraints:
* The number of nodes in the tree is in the range [0, 2000].
* -1000 <= Node.val <= 1000

=end

# Runtime: 103 ms
# Memory: 211.2 MB
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
# @return {Integer[][]}
def level_order(root)
  return [] unless root

  result = []
  deque = [[root, 1]]

  until deque.empty?
    n, d = deque.shift
    result << [] if d > result.count
    result[d - 1] << n.val
    deque << [n.left, d + 1] if n.left
    deque << [n.right, d + 1] if n.right
  end

  result
end
