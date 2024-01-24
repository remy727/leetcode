# frozen_string_literal: true

# 1457. Pseudo-Palindromic Paths in a Binary Tree
# Medium
# https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree

=begin
Given a binary tree where node values are digits from 1 to 9. A path in the binary tree is said to be pseudo-palindromic if at least one permutation of the node values in the path is a palindrome.
Return the number of pseudo-palindromic paths going from the root node to leaf nodes.

Example 1:
Input: root = [2,3,1,3,1,null,1]
Output: 2
Explanation: The figure above represents the given binary tree. There are three paths going from the root node to leaf nodes: the red path [2,3,3], the green path [2,1,1], and the path [2,3,1]. Among these paths only red path and green path are pseudo-palindromic paths since the red path [2,3,3] can be rearranged in [3,2,3] (palindrome) and the green path [2,1,1] can be rearranged in [1,2,1] (palindrome).

Example 2:
Input: root = [2,1,1,1,3,null,null,null,null,null,1]
Output: 1
Explanation: The figure above represents the given binary tree. There are three paths going from the root node to leaf nodes: the green path [2,1,1], the path [2,1,3,1], and the path [2,1]. Among these paths only the green path is pseudo-palindromic since [2,1,1] can be rearranged in [1,2,1] (palindrome).

Example 3:
Input: root = [9]
Output: 1

Constraints:
The number of nodes in the tree is in the range [1, 105].
1 <= Node.val <= 9
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
def pseudo_palindromic_paths (root)
  @answer = 0
  @counter = Array.new(10, 0)
  backtracking(root)
  @answer
end

def backtracking(node)
  @counter[node.val] += 1
  if node.left.nil? && node.right.nil?
    @answer += 1 if palindromic?
  else
    backtracking(node.left) if node.left
    backtracking(node.right) if node.right
  end
  @counter[node.val] -= 1
end

def palindromic?
  even, odd = 0, 0
  @counter.each do |val|
    next if 0 == val
    if val.even?
      even += 1
    else
      odd += 1
    end
  end
  odd <= 1
end
