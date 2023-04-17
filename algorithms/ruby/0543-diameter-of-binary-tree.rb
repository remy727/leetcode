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
# @return {Integer}
def diameter_of_binary_tree(root)
  diameter = 0

  longest_path = lambda do |node|
    return 0 if node.nil?

    left_path = longest_path[node.left]
    right_path = longest_path[node.right]

    diameter = [diameter, left_path + right_path].max

    [left_path, right_path].max + 1
  end

  longest_path[root]

  diameter
end
