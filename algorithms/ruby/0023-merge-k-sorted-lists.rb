# frozen_string_literal: true

# Problem: 23. Merge k Sorted Lists
# URL: https://leetcode.com/problems/merge-k-sorted-lists

=begin

You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
Merge all the linked-lists into one sorted linked-list and return it.

# Constraints:

* k == lists.length
* 0 <= k <= 104
* 0 <= lists[i].length <= 500
* -104 <= lists[i][j] <= 104
* lists[i] is sorted in ascending order.
* The sum of lists[i].length will not exceed 104.

=end

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  values = []

  lists.each do |list|
    while list
      values << list.val
      list = list.next
    end
  end

  values.sort!
  head = dumphead = ListNode.new(nil)

  values.each do |value|
    head.next = ListNode.new(value)
    head = head.next
  end

  dumphead.next
end
