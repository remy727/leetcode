# frozen_string_literal: true

# 234. Palindrome Linked List
# https://leetcode.com/problems/palindrome-linked-list

=begin

Given the head of a singly linked list, return true if it is a

### Example 1:
Input: head = [1,2,2,1]
Output: true

### Example 2:
Input: head = [1,2]
Output: false

### Constraints:
The number of nodes in the list is in the range [1, 105].
0 <= Node.val <= 9

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
# @return {Boolean}
def is_palindrome(head)
  data = []
  current_node = head
  while !current_node.nil?
    data << current_node.val
    current_node = current_node.next
  end
  data == data.reverse
end
