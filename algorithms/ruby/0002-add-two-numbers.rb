# frozen_string_literal: true

# 2. Add Two Numbers
# https://leetcode.com/problems/add-two-numbers

# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next

#   def initialize(val = 0, _next = nil)
#     @val = val
#     @next = _next
#   end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2, carry = 0)
  return nil if l1.nil? && l2.nil? && carry.zero?

  sum = (l1&.val || 0) + (l2&.val || 0) + carry
  ListNode.new(sum % 10).tap do |l3|
    l3.next = add_two_numbers(l1&.next, l2&.next, sum / 10)
  end
end

# **************** #
#       TEST       #
# **************** #

# TODO: Write tests
