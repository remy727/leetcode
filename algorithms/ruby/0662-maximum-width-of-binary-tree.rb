# frozen_string_literal: true

# 662. Maximum Width of Binary Tree
# https://leetcode.com/problems/maximum-width-of-binary-tree/
# Medium

=begin
Given the root of a binary tree, return the maximum width of the given tree.

The maximum width of a tree is the maximum width among all levels.

The width of one level is defined as the length between the end-nodes (the leftmost and rightmost non-null nodes), where the null nodes between the end-nodes that would be present in a complete binary tree extending down to that level are also counted into the length calculation.

It is guaranteed that the answer will in the range of a 32-bit signed integer.

Example 1:
Input: root = [1,3,2,5,3,null,9]
Output: 4
Explanation: The maximum width exists in the third level with length 4 (5,3,null,9).

Example 2:
Input: root = [1,3,2,5,null,null,9,6,null,7]
Output: 7
Explanation: The maximum width exists in the fourth level with length 7 (6,null,null,null,null,null,7).

Example 3:
Input: root = [1,3,2,5]
Output: 2
Explanation: The maximum width exists in the second level with length 2 (3,2).

Constraints:
* The number of nodes in the tree is in the range [1, 3000].
* -100 <= Node.val <= 100
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
# @return {Integer}
def width_of_binary_tree(root)
  max = 0
  queue = [{ node: root, pos: 0 }]
  while queue.length > 0 do
    next_queue = []
    length = queue.length
    min_pos = +1.0 / 0.0
    max_pos = 0
    while queue.length > 0 do
      current = queue.pop
      if current[:node].left
        next_queue << { node: current[:node].left, pos: 2 * current[:pos] + 1 }
      end
      if current[:node].right
        next_queue << { node: current[:node].right, pos: 2 * current[:pos] + 2 }
      end
      min_pos = [min_pos, current[:pos]].min
      max_pos = [max_pos, current[:pos]].max
    end
    queue = next_queue
    level_length = length == 1 ? 1 : max_pos - min_pos + 1
    max = [max, level_length].max
  end
  max
end
