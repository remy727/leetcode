# frozen_string_literal: true

# 1721. Swapping Nodes in a Linked List
# https://leetcode.com/problems/swapping-nodes-in-a-linked-list
# Medium

=begin
You are given the head of a linked list, and an integer k.

Return the head of the linked list after swapping the values of the kth node from the beginning and the kth node from the end (the list is 1-indexed).

Example 1:
Input: head = [1,2,3,4,5], k = 2
Output: [1,4,3,2,5]

Example 2:
Input: head = [7,9,6,6,7,8,3,0,9,5], k = 5
Output: [7,9,6,6,8,7,3,0,9,5]

Constraints:
The number of nodes in the list is n.
1 <= k <= n <= 105
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
# @param {Integer} k
# @return {ListNode}
def swap_nodes(head, k)
  n1 = nil
  n2 = nil
  curr = head

  while curr
    k -= 1
    if n2 != nil
      n2 = n2.next
    end

    if k == 0
      n1 = curr
      n2 = head
    end

    curr = curr.next
  end

  n1.val, n2.val = n2.val, n1.val
  head
end
