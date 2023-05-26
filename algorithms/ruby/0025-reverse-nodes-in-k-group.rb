# frozen_string_literal: true

# 25. Reverse Nodes in k-Group
# https://leetcode.com/problems/reverse-nodes-in-k-group
# Hard

=begin
Given the head of a linked list, reverse the nodes of the list k at a time, and return the modified list.

k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is.

You may not alter the values in the list's nodes, only nodes themselves may be changed.

Example 1:
Input: head = [1,2,3,4,5], k = 2
Output: [2,1,4,3,5]

Example 2:
Input: head = [1,2,3,4,5], k = 3
Output: [3,2,1,4,5]

Constraints:
* The number of nodes in the list is n.
* 1 <= k <= n <= 5000
* 0 <= Node.val <= 1000
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
def reverse_k_group(head, k)
  dummy = ListNode.new("dummy", head)
  prev = dummy

  loop do
    scout = prev

    k.times do
      break unless scout
      scout = scout.next
    end

    break unless scout

    pivot = prev.next

    until prev.next == scout
      prev.next, pivot.next.next = pivot.next.next, prev.next
      prev.next, pivot.next = pivot.next, prev.next
    end

    k.times { prev = prev.next }
  end

  dummy.next
end
