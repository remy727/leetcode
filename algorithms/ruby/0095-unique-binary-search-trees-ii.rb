# frozen_string_literal: true

# 95. Unique Binary Search Trees II
# Medium
# https://leetcode.com/problems/unique-binary-search-trees-ii

=begin
Given an integer n, return all the structurally unique BST's (binary search trees), which has exactly n nodes of unique values from 1 to n. Return the answer in any order.

Example 1:
Input: n = 3
Output: [[1,null,2,null,3],[1,null,3,2],[2,1,3],[3,1,null,null,2],[3,2,null,1]]

Example 2:
Input: n = 1
Output: [[1]]

Constraints:
* 1 <= n <= 8
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
def generate(start_val, end_val)
  return [nil] if start_val > end_val

  result = []
  (start_val..end_val).each do |i|
    left_trees = generate(start_val, i - 1)
    right_trees = generate(i + 1, end_val)

    left_trees.each do |l|
      right_trees.each do |r|
        node = TreeNode.new(i)
        node.left = l
        node.right = r
        result << node
      end
    end
  end
  result
end

def generate_trees(n)
  return [] if n == 0
  generate(1, n)
end
