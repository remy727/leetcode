# frozen_string_literal: true

# 2265. Count Nodes Equal to Average of Subtree
# Medium
# https://leetcode.com/problems/count-nodes-equal-to-average-of-subtree

=begin
Given the root of a binary tree, return the number of nodes where the value of the node is equal to the average of the values in its subtree.

Note:
* The average of n elements is the sum of the n elements divided by n and rounded down to the nearest integer.
* A subtree of root is a tree consisting of root and all of its descendants.

Example 1:
Input: root = [4,8,5,0,1,null,6]
Output: 5
Explanation:
For the node with value 4: The average of its subtree is (4 + 8 + 5 + 0 + 1 + 6) / 6 = 24 / 6 = 4.
For the node with value 5: The average of its subtree is (5 + 6) / 2 = 11 / 2 = 5.
For the node with value 0: The average of its subtree is 0 / 1 = 0.
For the node with value 1: The average of its subtree is 1 / 1 = 1.
For the node with value 6: The average of its subtree is 6 / 1 = 6.

Example 2:
Input: root = [1]
Output: 1
Explanation: For the node with value 1: The average of its subtree is 1 / 1 = 1.

Constraints:
* The number of nodes in the tree is in the range [1, 1000].
* 0 <= Node.val <= 1000
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
def average_of_subtree(root)
  @count = 0
  dfs root
  @count
end

def dfs(root)
  return [0, 0] unless root

  left_count, left_sum = dfs root.left
  right_count, right_sum = dfs root.right

  subtree_sum = left_sum + right_sum + root.val
  subtree_count = left_count + right_count + 1

  @count += 1 if root.val == subtree_sum / subtree_count
  [subtree_count, subtree_sum]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class TestAverageOfSubtree < Test::Unit::TestCase
  def test_average_of_subtree
    assert_equal 5, average_of_subtree(array_to_tree([4, 8, 5, 0, 1, nil, 6]))
    assert_equal 1, average_of_subtree(array_to_tree([1]))
  end

  private
    def array_to_tree(array)
      return nil if array.empty?

      nodes = array.map { |val| val.nil? ? nil : TreeNode.new(val) }
      kids = nodes.dup
      root = kids.shift

      nodes.each do |node|
        next if node.nil?
        node.left = kids.shift
        node.right = kids.shift
      end

      root
    end
end
