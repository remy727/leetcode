# frozen_string_literal: true

# 24. Swap Nodes in Pairs
# https://leetcode.com/problems/swap-nodes-in-pairs
# Medium

=begin
Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)

Example 1:
Input: head = [1,2,3,4]
Output: [2,1,4,3]

Example 2:
Input: head = []
Output: []

Example 3:
Input: head = [1]
Output: [1]

Constraints:
The number of nodes in the list is in the range [0, 100].
0 <= Node.val <= 100
=end

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}

def swap_pairs(head)
  return head if !head || !head.next

  next_node, next_segment = head.next, head.next.next
  next_node.next = head
  head_next = swap_pairs(next_segment)
  head.next = head_next

  next_node
end
