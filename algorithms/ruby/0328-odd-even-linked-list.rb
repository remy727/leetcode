# frozen_string_literal: true

# 328. Odd Even Linked List
# https://leetcode.com/problems/odd-even-linked-list
# Difficulty: Medium

=begin
Given the head of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list.

The first node is considered odd, and the second node is even, and so on.

Note that the relative order inside both the even and odd groups should remain as it was in the input.

You must solve the problem in O(1) extra space complexity and O(n) time complexity.

Example 1:
Input: head = [1,2,3,4,5]
Output: [1,3,5,2,4]

Example 2:
Input: head = [2,1,3,5,6,4,7]
Output: [2,3,6,7,1,5,4]

Constraints:
* The number of nodes in the linked list is in the range [0, 104].
* -106 <= Node.val <= 106

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
def odd_even_list(head)
  return nil if head.nil?

  odd_head = head
  odd = head
  even = head.next
  even_head = head.next

  while even && even.next
    odd.next = odd.next.next
    odd = odd.next
    even.next = even.next.next
    even = even.next
  end

  odd.next = even_head
  odd_head
end
