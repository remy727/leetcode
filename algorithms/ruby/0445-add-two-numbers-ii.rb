# frozen_string_literal: true

# 445. Add Two Numbers II
# Medium
# https://leetcode.com/problems/add-two-numbers-ii

=begin
You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example 1:
Input: l1 = [7,2,4,3], l2 = [5,6,4]
Output: [7,8,0,7]

Example 2:
Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [8,0,7]

Example 3:
Input: l1 = [0], l2 = [0]
Output: [0]

Constraints:
The number of nodes in each linked list is in the range [1, 100].
0 <= Node.val <= 9
It is guaranteed that the list represents a number that does not have leading zeros.
=end

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  num1 = num2 = 0
  while l1
    num1 = num1 * 10 + l1.val
    l1 = l1.next
  end
  while l2
    num2 = num2 * 10 + l2.val
    l2 = l2.next
  end
  sum = num1 + num2
  return ListNode.new(0) if sum.zero?

  prev = nil
  while sum > 0
    curr = ListNode.new(sum % 10)
    curr.next = prev
    prev = curr
    sum /= 10
  end
  prev
end
