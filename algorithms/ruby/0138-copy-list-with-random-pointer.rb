# frozen_string_literal: true

# 138. Copy List with Random Pointer
# https://leetcode.com/problems/copy-list-with-random-pointer
# Medium

=begin
A linked list of length n is given such that each node contains an additional random pointer, which could point to any node in the list, or null.

Construct a deep copy of the list. The deep copy should consist of exactly n brand new nodes, where each new node has its value set to the value of its corresponding original node. Both the next and random pointer of the new nodes should point to new nodes in the copied list such that the pointers in the original list and copied list represent the same list state. None of the pointers in the new list should point to nodes in the original list.

For example, if there are two nodes X and Y in the original list, where X.random --> Y, then for the corresponding two nodes x and y in the copied list, x.random --> y.

Return the head of the copied linked list.

The linked list is represented in the input/output as a list of n nodes. Each node is represented as a pair of [val, random_index] where:

* val: an integer representing Node.val
* random_index: the index of the node (range from 0 to n-1) that the random pointer points to, or null if it does not point to any node.
Your code will only be given the head of the original linked list.

Example 1:
Input: head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
Output: [[7,null],[13,0],[11,4],[10,2],[1,0]]

Example 2:
Input: head = [[1,1],[2,1]]
Output: [[1,1],[2,1]]

Example 3:
Input: head = [[3,null],[3,0],[3,null]]
Output: [[3,null],[3,0],[3,null]]

Constraints:
* 0 <= n <= 1000
* -104 <= Node.val <= 104
* Node.random is null or is pointing to some node in the linked list.
=end

# Definition for Node.
# class Node
#     attr_accessor :val, :next, :random
#     def initialize(val = 0)
#         @val = val
#		  @next = nil
#		  @random = nil
#     end
# end

# @param {Node} node
# @return {Node}
def copyRandomList(head)
  return nil if head.nil?

  # Create a hash map to store the mapping between original nodes and copied nodes
  node_map = {}

  # Create a new head for the copied list
  new_head = Node.new(head.val)
  node_map[head] = new_head

  # Initialize pointers for the original list and the copied list
  original_node = head
  copied_node = new_head

  # Iterate through the original list
  while original_node
    # Update the next pointer of the copied node
    if original_node.next
      unless node_map[original_node.next]
        node_map[original_node.next] = Node.new(original_node.next.val)
      end
      copied_node.next = node_map[original_node.next]
    end

    # Update the random pointer of the copied node
    if original_node.random
      unless node_map[original_node.random]
        node_map[original_node.random] = Node.new(original_node.random.val)
      end
      copied_node.random = node_map[original_node.random]
    end

    # Move the pointers to the next nodes
    original_node = original_node.next
    copied_node = copied_node.next
  end

  new_head
end
