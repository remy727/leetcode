# frozen_string_literal: true

# 725. Split Linked List in Parts
# Medium
# https://leetcode.com/problems/split-linked-list-in-parts

=begin
Given the head of a singly linked list and an integer k, split the linked list into k consecutive linked list parts.
The length of each part should be as equal as possible: no two parts should have a size differing by more than one. This may lead to some parts being null.
The parts should be in the order of occurrence in the input list, and parts occurring earlier should always have a size greater than or equal to parts occurring later.
Return an array of the k parts.

Example 1:
Input: head = [1,2,3], k = 5
Output: [[1],[2],[3],[],[]]
Explanation:
The first element output[0] has output[0].val = 1, output[0].next = null.
The last element output[4] is null, but its string representation as a ListNode is [].

Example 2:
Input: head = [1,2,3,4,5,6,7,8,9,10], k = 3
Output: [[1,2,3,4],[5,6,7],[8,9,10]]
Explanation:
The input has been split into consecutive parts with size difference at most 1, and earlier parts are a larger size than the later parts.

Constraints:
The number of nodes in the list is in the range [0, 1000].
0 <= Node.val <= 1000
1 <= k <= 50
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
# @return {ListNode[]}
def split_list_to_parts(head, k)
  base = Array.new(k, [])

  if head == nil
    return base
  end

  list_length = 0
  vals = []

  while head
    list_length += 1
    vals.push(head.val)
    head = head.next
  end

  fraction = list_length / k
  remainder = list_length % k

  base.map do |g|
    if fraction > 0
      g = vals.slice!(0, fraction)
      if remainder > 0
        g.push(vals.slice!(0))
        remainder -= 1
        next g
      end
      next g
    end
    if vals.any?
      g = [vals.slice!(0)]
    end
    next g
  end
end
