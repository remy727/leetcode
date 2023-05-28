# frozen_string_literal: true

# 117. Populating Next Right Pointers in Each Node II
# https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii
# Medium

=begin
Given a binary tree

struct Node {
  int val;
  Node *left;
  Node *right;
  Node *next;
}
Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

Initially, all next pointers are set to NULL.

Example 1:
Input: root = [1,2,3,4,5,null,7]
Output: [1,#,2,3,#,4,5,7,#]
Explanation: Given the above binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.

Example 2:
Input: root = []
Output: []


Constraints:
* The number of nodes in the tree is in the range [0, 6000].
* -100 <= Node.val <= 100
=end

# Definition for a Node.
# class Node
#     attr_accessor :val, :left, :right, :next
#     def initialize(val)
#         @val = val
#         @left, @right, @next = nil, nil, nil
#     end
# end

# @param {Node} root
# @return {Node}
def connect(root)
  queue = [root]

  until queue.empty?
    new_queue = []
    prev_node = nil

    until queue.empty?
      node = queue.shift

      prev_node.next = node if prev_node && node != prev_node
      prev_node = node

      new_queue << node.left if node && node.left
      new_queue << node.right if node && node.right
    end

    queue = new_queue
  end

  root
end
