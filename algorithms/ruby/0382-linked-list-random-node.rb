# frozen_string_literal: true

# Problem: 382. Linked List Random Node
# URL: https://leetcode.com/problems/linked-list-random-node

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
class Solution
=begin
    :type head: ListNode
=end
  def initialize(head)
    @array = []
    tmp = head
    while tmp
      @array.push(tmp)
      tmp = tmp.next
    end
  end


=begin
    :rtype: Integer
=end
  def get_random
    @array[rand(@array.size)].val
  end
end

# Your Solution object will be instantiated and called as such:
# obj = Solution.new(head)
# param_1 = obj.get_random()
