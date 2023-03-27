# frozen_string_literal: true

# 876. Middle of the Linked List
# https://leetcode.com/problems/middle-of-the-linked-list

=begin

Given the head of a singly linked list, return the middle node of the linked list.

If there are two middle nodes, return the second middle node.

### Example 1:
Input: head = [1,2,3,4,5]
Output: [3,4,5]
Explanation: The middle node of the list is node 3.

### Example 2:
Input: head = [1,2,3,4,5,6]
Output: [4,5,6]
Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.

### Constraints:
* The number of nodes in the list is in the range [1, 100].
* 1 <= Node.val <= 100

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
def middle_node(head)
  slow = fast = head
  while fast != nil && fast.next != nil
    slow = slow.next
    fast = fast.next.next
  end
  slow
end
