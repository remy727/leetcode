# frozen_string_literal: true

# 2458. Height of Binary Tree After Subtree Removal Queries
# https://leetcode.com/problems/height-of-binary-tree-after-subtree-removal-queries
# Hard

=begin
You are given the root of a binary tree with n nodes. Each node is assigned a unique value from 1 to n. You are also given an array queries of size m.
You have to perform m independent queries on the tree where in the ith query you do the following:
* Remove the subtree rooted at the node with the value queries[i] from the tree. It is guaranteed that queries[i] will not be equal to the value of the root.
Return an array answer of size m where answer[i] is the height of the tree after performing the ith query.

Note:
* The queries are independent, so the tree returns to its initial state after each query.
* The height of a tree is the number of edges in the longest simple path from the root to some node in the tree.

Example 1:
Input: root = [1,3,4,2,null,6,5,null,null,null,null,null,7], queries = [4]
Output: [2]
Explanation: The diagram above shows the tree after removing the subtree rooted at node with value 4.
The height of the tree is 2 (The path 1 -> 3 -> 2).

Example 2:
Input: root = [5,8,9,2,1,3,7,4,6], queries = [3,2,4,8]
Output: [3,2,3,2]
Explanation: We have the following queries:
- Removing the subtree rooted at node with value 3. The height of the tree becomes 3 (The path 5 -> 8 -> 2 -> 4).
- Removing the subtree rooted at node with value 2. The height of the tree becomes 2 (The path 5 -> 8 -> 1).
- Removing the subtree rooted at node with value 4. The height of the tree becomes 3 (The path 5 -> 8 -> 2 -> 6).
- Removing the subtree rooted at node with value 8. The height of the tree becomes 2 (The path 5 -> 9 -> 3).

Constraints:
* The number of nodes in the tree is n.
* 2 <= n <= 105
* 1 <= Node.val <= n
* All the values in the tree are unique.
* m == queries.length
* 1 <= m <= min(n, 104)
* 1 <= queries[i] <= n
* queries[i] != root.val
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
# @param {Integer[]} queries
# @return {Integer[]}
def tree_queries(root, queries)
  @heights = Array.new(50000, 0)
  @len = 0
  @d = Array.new(100001, 0)
  @l = Array.new(100001, 0)
  @r = Array.new(100001, 0)

  search(root, 0)

  n = @len
  maxl = Array.new(n, 0)
  maxr = Array.new(n, 0)

  (1...n).each do |i|
    maxl[i] = [maxl[i - 1], @heights[i - 1]].max
    maxr[n - i - 1] = [maxr[n - i], @heights[n - i]].max
  end

  ret = []
  queries.each do |query|
    maxxl = maxl[@l[query]]
    maxxr = maxr[@r[query]]
    ret.push([maxxl, maxxr, @d[query] - 1].max)
  end

  ret
end

def search(p, h)
  @d[p.val] = h

  if !p.left && !p.right
    @heights[@len] = h
    @l[p.val] = @r[p.val] = @len
    @len += 1
    return
  end

  @l[p.val] = @len

  search(p.left, h + 1) if p.left
  search(p.right, h + 1) if p.right

  @r[p.val] = @len - 1
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

class Test_tree_queries < Test::Unit::TestCase
  def setup
    # Example 1 tree setup
    @root1 = TreeNode.new(1)
    @root1.left = TreeNode.new(3)
    @root1.right = TreeNode.new(4)
    @root1.left.left = TreeNode.new(2)
    @root1.right.left = TreeNode.new(6)
    @root1.right.right = TreeNode.new(5)
    @root1.right.right.right = TreeNode.new(7)

    # Example 2 tree setup
    @root2 = TreeNode.new(5)
    @root2.left = TreeNode.new(8)
    @root2.right = TreeNode.new(9)
    @root2.left.left = TreeNode.new(2)
    @root2.left.right = TreeNode.new(1)
    @root2.right.left = TreeNode.new(3)
    @root2.right.right = TreeNode.new(7)
    @root2.left.left.left = TreeNode.new(4)
    @root2.left.left.right = TreeNode.new(6)
  end

  def test_example_1
    queries = [4]
    expected = [2]
    assert_equal expected, tree_queries(@root1, queries)
  end

  def test_example_2
    queries = [3, 2, 4, 8]
    expected = [3, 2, 3, 2]
    assert_equal expected, tree_queries(@root2, queries)
  end
end
