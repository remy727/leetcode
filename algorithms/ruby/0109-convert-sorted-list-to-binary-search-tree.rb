# frozen_string_literal: true

# Problem: 109. Convert Sorted List to Binary Search Tree
# URL: https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree

=begin

Given the head of a singly linked list where elements are sorted in ascending order, convert it to a
height-balanced binary search tree.

# Constraints:

* The number of nodes in head is in the range [0, 2 * 104].
* -105 <= Node.val <= 105

=end

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {ListNode} head
# @return {TreeNode}
def sorted_list_to_bst(head)
  a = []
  while head
    a << head.val
    head = head.next
  end
  f = -> i, j do
    return nil if i >= j
    m = (i + j) / 2
    TreeNode.new a[m], f.(i, m), f.(m + 1, j)
  end
  f.(0, a.size)
end
