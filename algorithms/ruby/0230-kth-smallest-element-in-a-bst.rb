# frozen_string_literal: true

# 230. Kth Smallest Element in a BST
# https://leetcode.com/problems/kth-smallest-element-in-a-bst
# Difficulty: Medium

=begin

Given the root of a binary search tree, and an integer k, return the kth smallest value (1-indexed) of all the values of the nodes in the tree.

### Example 1:
Input: root = [3,1,4,null,2], k = 1
Output: 1

### Example 2:
Input: root = [5,3,6,2,4,null,null,1], k = 3
Output: 3

### Constraints:
* The number of nodes in the tree is n.
* 1 <= k <= n <= 104
* 0 <= Node.val <= 104

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
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)
  find = -> root { root && (find[root.left] or
                            (k -= 1) == 0 ? root.val :
                            find[root.right]) }
  find[root]
end
