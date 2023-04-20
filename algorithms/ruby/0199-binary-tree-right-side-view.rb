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
# @return {Integer[]}
def right_side_view(root)
  return [] unless root
  res = []
  queue = [root]

  until queue.empty?
    current = nil
    queue.size.times do
      current = queue.shift
      queue.push(current.left) if current.left
      queue.push(current.right) if current.right
    end
    res << current.val
  end
  res
end
