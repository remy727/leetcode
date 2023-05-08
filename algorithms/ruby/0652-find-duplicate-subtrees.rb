# frozen_string_literal: true

# 652. Find Duplicate Subtrees
# https://leetcode.com/problems/find-duplicate-subtrees

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
# @return {TreeNode[]}
def find_duplicate_subtrees(root)
  @path = {}
  @duplicates = []

  find_duplicates(root)

  @duplicates
end

def find_duplicates(root)
  return "" if root.nil?

  path = [root.val, find_duplicates(root.left), find_duplicates(root.right)].join(",")

  if @path[path]
    @duplicates << root if @path[path] == 1
    @path[path] += 1
  else
    @path[path] = 1
  end

  path
end
