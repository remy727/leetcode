# frozen_string_literal: true

# 328. Odd Even Linked List
# https://leetcode.com/problems/odd-even-linked-list

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
