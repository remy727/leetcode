# frozen_string_literal: true

# 1372. Longest ZigZag Path in a Binary Tree
# https://leetcode.com/problems/longest-zigzag-path-in-a-binary-tree

=begin

You are given the root of a binary tree.

A ZigZag path for a binary tree is defined as follow:

Choose any node in the binary tree and a direction (right or left).
If the current direction is right, move to the right child of the current node; otherwise, move to the left child.
Change the direction from right to left or from left to right.
Repeat the second and third steps until you can't move in the tree.
Zigzag length is defined as the number of nodes visited - 1. (A single node has a length of 0).

Return the longest ZigZag path contained in that tree.

### Example 1:
Input: root = [1,null,1,1,1,null,null,1,1,null,1,null,null,null,1,null,1]
Output: 3
Explanation: Longest ZigZag path in blue nodes (right -> left -> right).

### Example 2:
Input: root = [1,1,1,null,1,null,null,1,1,null,1]
Output: 4
Explanation: Longest ZigZag path in blue nodes (left -> right -> left -> right).

### Example 3:
Input: root = [1]
Output: 0

### Constraints:
* The number of nodes in the tree is in the range [1, 5 * 104].
* 1 <= Node.val <= 100

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
def longest_zig_zag(root)
  nodes = []
  queue = [root]
  until queue.empty?
    ele = queue.shift
    nodes << ele
    if ele.left
      ele.left.val = "l"
      queue << ele.left
    end
    if ele.right
      ele.right.val = "r"
      queue << ele.right
    end
  end
  nodes.map! { |node| [left_path(node), right_path(node)].max }
  nodes.max
end

def left_path(node)
  return 0 if node.val == "r"
  i = 0
  while node.left && node.left.right
    node = node.left.right
    i += 2
  end
  node.left ? i + 1 : i
end

def right_path(node)
  return 0 if node.val == "l"
  i = 0
  while node.right && node.right.left
    node = node.right.left
    i += 2
  end
  node.right ? i + 1 : i
end
