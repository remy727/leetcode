# frozen_string_literal: true

# 222. Count Complete Tree Nodes
# https://leetcode.com/problems/count-complete-tree-nodes
# Medium

=begin
Given the root of a complete binary tree, return the number of the nodes in the tree.

According to Wikipedia, every level, except possibly the last, is completely filled in a complete binary tree, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

Design an algorithm that runs in less than O(n) time complexity.

Example 1:
Input: root = [1,2,3,4,5,6]
Output: 6

Example 2:
Input: root = []
Output: 0

Example 3:
Input: root = [1]
Output: 1

Constraints:
* The number of nodes in the tree is in the range [0, 5 * 104].
* 0 <= Node.val <= 5 * 104
* The tree is guaranteed to be complete.
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
def count_nodes(root)
  return 0 unless root
  h = 0
  node = root
  h += 1 while node = node.left
  return 1 if h.zero?
  res = 2**h - 1
  h -= 1
  while h > 0
    node = root.left
    h.times { node = node.right }
    if node
      res += 2**h
      root = root.right
    else root = root.left
    end
    h -= 1
  end
  return res += 2 if root.right
  res += 1 if root.left
  res
end

require "test/unit"
class Test_count_nodes < Test::Unit::TestCase
  def test_
    assert_equal 6, count_nodes(tree_parser [1, 2, 3, 4, 5, 6])
    assert_equal 0, count_nodes(tree_parser [])
    assert_equal 1, count_nodes(tree_parser [1])
  end
end

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def tree_parser(arr)
  return nil unless arr && !arr.empty?
  root = TreeNode.new arr.shift
  queue = [root]
  until arr.empty?
    node = queue.shift
    (val = arr.shift).nil? ? nil : queue << node.left = TreeNode.new(val)
    (val = arr.shift).nil? ? nil : queue << node.right = TreeNode.new(val)
  end
  root
end
