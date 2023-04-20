# frozen_string_literal: true

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}
def width_of_binary_tree(root)
  max = 0
  queue = [{ node: root, pos: 0 }]
  while queue.length > 0 do
    next_queue = []
    length = queue.length
    min_pos = +1.0 / 0.0
    max_pos = 0
    while queue.length > 0 do
      current = queue.pop
      if current[:node].left
        next_queue << { node: current[:node].left, pos: 2 * current[:pos] + 1 }
      end
      if current[:node].right
        next_queue << { node: current[:node].right, pos: 2 * current[:pos] + 2 }
      end
      min_pos = [min_pos, current[:pos]].min
      max_pos = [max_pos, current[:pos]].max
    end
    queue = next_queue
    level_length = length == 1 ? 1 : max_pos - min_pos + 1
    max = [max, level_length].max
  end
  max
end
