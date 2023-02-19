# frozen_string_literal: true

# Problem: 103. Binary Tree Zigzag Level Order Traversal
# URL: https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal

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
def zigzag_level_order(root)
  return [] if root.nil?

  res = []
  stack = [root]
  count = 1
  until stack.empty?
    res << stack.map(&:val)
    count += 1
    arr = []
    stack.size.times do
      current = stack.pop
      if count.even?
        arr.push(current.right) if current.right
        arr.push(current.left) if current.left
      else
        arr.push(current.left) if current.left
        arr.push(current.right) if current.right
      end
    end
    stack = arr
  end

  res
end
