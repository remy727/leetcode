# frozen_string_literal: true

# 2641. Cousins in Binary Tree II
# Medium
# https://leetcode.com/problems/cousins-in-binary-tree-ii

=begin
Given the root of a binary tree, replace the value of each node in the tree with the sum of all its cousins' values.
Two nodes of a binary tree are cousins if they have the same depth with different parents.
Return the root of the modified tree.
Note that the depth of a node is the number of edges in the path from the root node to it.

Example 1:
Input: root = [5,4,9,1,10,null,7]
Output: [0,0,0,7,7,null,11]
Explanation: The diagram above shows the initial binary tree and the binary tree after changing the value of each node.
- Node with value 5 does not have any cousins so its sum is 0.
- Node with value 4 does not have any cousins so its sum is 0.
- Node with value 9 does not have any cousins so its sum is 0.
- Node with value 1 has a cousin with value 7 so its sum is 7.
- Node with value 10 has a cousin with value 7 so its sum is 7.
- Node with value 7 has cousins with values 1 and 10 so its sum is 11.

Example 2:
Input: root = [3,1,2]
Output: [0,0,0]
Explanation: The diagram above shows the initial binary tree and the binary tree after changing the value of each node.
- Node with value 3 does not have any cousins so its sum is 0.
- Node with value 1 does not have any cousins so its sum is 0.
- Node with value 2 does not have any cousins so its sum is 0.

Constraints:
* The number of nodes in the tree is in the range [1, 105].
* 1 <= Node.val <= 104
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
# @return {TreeNode}
def replace_value_in_tree(root)
  total_sum = root.val
  queue = [[root, root.val]]

  while queue.any?
    new_total_sum = 0
    queue = queue.flat_map do |node, sibling_sum|
      node.val = total_sum - sibling_sum
      new_sibling_sum = node.left&.val.to_i + node.right&.val.to_i
      new_total_sum += new_sibling_sum
      [node.left && [node.left, new_sibling_sum], node.right && [node.right, new_sibling_sum]].compact
    end
    total_sum = new_total_sum
  end
  root
end
