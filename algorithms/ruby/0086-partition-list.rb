# frozen_string_literal: true

# 86. Partition List
# https://leetcode.com/problems/partition-list
# Medium

=begin
Given the head of a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

You should preserve the original relative order of the nodes in each of the two partitions.

Example 1:
Input: head = [1,4,3,2,5,2], x = 3
Output: [1,2,2,4,3,5]

Example 2:
Input: head = [2,1], x = 2
Output: [1,2]

Constraints:
* The number of nodes in the list is in the range [0, 200].
* -100 <= Node.val <= 100
* -200 <= x <= 200
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
# @param {Integer} x
# @return {ListNode}
def partition(head, x)
  # Create dummy nodes for before and after lists
  before = ListNode.new(0)
  after = ListNode.new(0)

  # Initialize pointers for before and after lists
  before_ptr = before
  after_ptr = after

  # Iterate through the linked list
  while head
    if head.val < x
      # Append the node to the before list
      before_ptr.next = head
      before_ptr = before_ptr.next
    else
      # Append the node to the after list
      after_ptr.next = head
      after_ptr = after_ptr.next
    end

    # Move to the next node in the original list
    head = head.next
  end

  # Connect the before list with the after list
  before_ptr.next = after.next

  # Set the last node of the after list to nil
  after_ptr.next = nil

  # Return the new head of the partitioned list
  before.next
end
