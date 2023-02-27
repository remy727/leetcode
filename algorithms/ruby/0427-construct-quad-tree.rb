# frozen_string_literal: true

# Problem: 427. Construct Quad Tree
# URL: https://leetcode.com/problems/construct-quad-tree

# Definition for a QuadTree node.
# class Node
#     attr_accessor :val, :isLeaf, :topLeft, :topRight, :bottomLeft, :bottomRight
#     def initialize(val=false, isLeaf=false, topLeft=nil, topRight=nil, bottomLeft=nil, bottomRight=nil)
#         @val = val
#         @isLeaf = isLeaf
#         @topLeft = topLeft
#         @topRight = topRight
#         @bottomLeft = bottomLeft
#         @bottomRight = bottomRight
#     end
# end

# @param {Integer[][]} grid
# @return {Node}
def construct(grid, r = 0, c = 0, length = grid.length)
  if same?(grid, r, c, length)
    return Node.new(grid[r][c] == 1 ? true : false, true)
  end

  node = Node.new(true, false)
  node.topLeft = construct(grid, r, c, length / 2)
  node.topRight = construct(grid, r, c + length / 2, length / 2)
  node.bottomLeft = construct(grid, r + length / 2, c, length / 2)
  node.bottomRight = construct(grid, r + length / 2, c + length / 2, length / 2)
  node
end

def same?(grid, r, c, n)
  for i in r..r + n - 1
    for j in c..c + n - 1
      if grid[i][j] != grid[r][c]
        return false
      end
    end
  end

  true
end
