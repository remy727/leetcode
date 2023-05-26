# frozen_string_literal: true

# 61. Rotate List
# https://leetcode.com/problems/rotate-list
# Medium

=begin
Given the head of a linked list, rotate the list to the right by k places.

Example 1:
Input: head = [1,2,3,4,5], k = 2
Output: [4,5,1,2,3]

Example 2:
Input: head = [0,1,2], k = 4
Output: [2,0,1]

Constraints:
* The number of nodes in the list is in the range [0, 500].
* -100 <= Node.val <= 100
* 0 <= k <= 2 * 109
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
def rotate_right(head, k)
  return head if head.nil? || head.next.nil? || k == 0

  # Calculate the length of the linked list
  length = 1
  old_tail = head
  while old_tail.next
    old_tail = old_tail.next
    length += 1
  end

  # Update k to be the effective number of rotations needed
  k %= length
  return head if k == 0

  # Find the new tail node (length - k - 1) and the new head node (length - k)
  new_tail = head
  (length - k - 1).times { new_tail = new_tail.next }
  new_head = new_tail.next

  # Update the next pointers of the new tail and the old tail
  new_tail.next = nil
  old_tail.next = head

  new_head
end
