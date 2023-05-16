# frozen_string_literal: true

# 1721. Swapping Nodes in a Linked List
# https://leetcode.com/problems/swapping-nodes-in-a-linked-list
# Medium

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
