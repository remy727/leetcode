# frozen_string_literal: true

# 92. Reverse Linked List II
# https://leetcode.com/problems/reverse-linked-list-ii
# Medium

=begin
Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.

Example 1:
Input: head = [1,2,3,4,5], left = 2, right = 4
Output: [1,4,3,2,5]

Example 2:
Input: head = [5], left = 1, right = 1
Output: [5]

Constraints:
* The number of nodes in the list is n.
* 1 <= n <= 500
* -500 <= Node.val <= 500
* 1 <= left <= right <= n
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
# @param {Integer} left
# @param {Integer} right
# @return {ListNode}
def reverse_between(head, left, right)
  dummy = ListNode.new(0)
  dummy.next = head
  prev = dummy

  (left - 1).times do
    prev = prev.next
  end

  start = prev.next
  then_node = start.next

  (right - left).times do
    start.next = then_node.next
    then_node.next = prev.next
    prev.next = then_node
    then_node = start.next
  end

  dummy.next
end
