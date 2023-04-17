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
