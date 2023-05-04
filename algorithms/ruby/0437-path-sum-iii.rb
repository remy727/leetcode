# frozen_string_literal: true

# 437. Path Sum III
# https://leetcode.com/problems/path-sum-iii/
# Medium

=begin
Given the root of a binary tree and an integer targetSum, return the number of paths where the sum of the values along the path equals targetSum.

The path does not need to start or end at the root or a leaf, but it must go downwards (i.e., traveling only from parent nodes to child nodes).

Example 1:
Input: root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8
Output: 3
Explanation: The paths that sum to 8 are shown.

Example 2:
Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
Output: 3

Constraints:
* The number of nodes in the tree is in the range [0, 1000].
* -109 <= Node.val <= 109
* -1000 <= targetSum <= 1000
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
# @param {Integer} target_sum
# @return {Integer}
def path_sum(root, target_sum)
  return 0 if !root
  count = 0
  stack = [[root, root.val, { 0 => 1 }]] # node, curr_sum, prefix_sums
  while stack.length > 0 do
    node, curr_sum, prefix_sums = stack.pop
    matching_prefix_sum = curr_sum - target_sum
    count += prefix_sums[matching_prefix_sum] || 0
    prefix_sums[curr_sum] = 1 + (prefix_sums[curr_sum] || 0)
    stack << [node.right, curr_sum + node.right.val, prefix_sums.clone] if node.right
    stack << [node.left, curr_sum + node.left.val, prefix_sums.clone] if node.left
  end
  count
end
