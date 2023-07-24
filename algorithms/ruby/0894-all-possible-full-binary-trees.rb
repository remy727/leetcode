# frozen_string_literal: true

# 894. All Possible Full Binary Trees
# Medium
# https://leetcode.com/problems/all-possible-full-binary-trees

=begin
Given an integer n, return a list of all possible full binary trees with n nodes. Each node of each tree in the answer must have Node.val == 0.
Each element of the answer is the root node of one possible tree. You may return the final list of trees in any order.
A full binary tree is a binary tree where each node has exactly 0 or 2 children.

Example 1:
Input: n = 7
Output: [[0,0,0,null,null,0,0,null,null,0,0],[0,0,0,null,null,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,null,null,null,null,0,0],[0,0,0,0,0,null,null,0,0]]

Example 2:
Input: n = 3
Output: [[0,0,0]]
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
# @param {Integer} n
# @return {TreeNode[]}
def all_possible_fbt(n)
  return [] if n.even?
  dp = Array.new(n + 1) { Array.new() }
  dp[1].push(TreeNode.new(0))
  (3...n + 1).step(2).each do |c|
    (1...c - 1).step(2).each do |i|
      j = c - 1 - i
      dp[i].each do |l|
        dp[j].each do |r|
          r = TreeNode.new(0, l, r)
          dp[c].push(r)
        end
      end
    end
  end
  dp[n]
end
