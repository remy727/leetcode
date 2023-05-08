# frozen_string_literal: true

# 113. Path Sum II
# https://leetcode.com/problems/path-sum-ii

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
# @return {Integer[][]}
def path_sum(root, target_sum, path = [])
  return [] if root.nil?

  target_sum -= root.val
  return [path + [root.val]] if root.left.nil? && root.right.nil? && target_sum.zero?

  path_sum(root.left, target_sum, path + [root.val]) +
    path_sum(root.right, target_sum, path + [root.val])
end

# **************** #
#       TEST       #
# **************** #

# TODO: Write tests
