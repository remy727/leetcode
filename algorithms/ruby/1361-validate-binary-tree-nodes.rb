# frozen_string_literal: true

# 1361. Validate Binary Tree Nodes
# Medium
# https://leetcode.com/problems/validate-binary-tree-nodes

=begin
You have n binary tree nodes numbered from 0 to n - 1 where node i has two children leftChild[i] and rightChild[i], return true if and only if all the given nodes form exactly one valid binary tree.
If node i has no left child then leftChild[i] will equal -1, similarly for the right child.
Note that the nodes have no values and that we only use the node numbers in this problem.

Example 1:
Input: n = 4, leftChild = [1,-1,3,-1], rightChild = [2,-1,-1,-1]
Output: true

Example 2:
Input: n = 4, leftChild = [1,-1,3,-1], rightChild = [2,3,-1,-1]
Output: false

Example 3:
Input: n = 2, leftChild = [1,0], rightChild = [-1,-1]
Output: false

Constraints:
n == leftChild.length == rightChild.length
1 <= n <= 104
-1 <= leftChild[i], rightChild[i] <= n - 1
=end

# @param {Integer} n
# @param {Integer[]} left_child
# @param {Integer[]} right_child
# @return {Boolean}
def validate_binary_tree_nodes(n, left_child, right_child)
  parents, children = [], Array.new(n) { |_| Array.new }
  [left_child, right_child].each do |childs|
    childs.each_with_index do |c, i|
      next if c.negative?
      parents[c] ||= i
      return false if parents[c] != i
      return false if children[i].include?(c)
      children[i] << c
    end
  end

  return false unless n.times.collect { |p| parents[p].nil? ? 1 : 0 }.sum == 1

  root = n.times.inject(nil) do |r, p|
    return false if parents[p].nil? && !r.nil?
    parents[p].nil? ? p : r
  end
  visited, cur = Set[root], Set[root]
  until cur.empty? do
    cur = cur.inject(Set[]) do |r, c|
      cc = children[c]
      return false if cc.any? { |ccc| visited.include?(ccc) }
      visited.merge(cc)
      r.merge(cc)
    end
  end

  visited.size == n
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_validate_binary_tree_nodes < Test::Unit::TestCase
  def test_
    assert_equal true, validate_binary_tree_nodes(4, [1, -1, 3, -1], [2, -1, -1, -1])
    assert_equal false, validate_binary_tree_nodes(4, [1, -1, 3, -1], [2, 3, -1, -1])
    assert_equal false, validate_binary_tree_nodes(4, [1, 0], [-1, -1])
  end
end
