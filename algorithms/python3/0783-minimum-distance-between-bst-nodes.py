# 783. Minimum Distance Between BST Nodes
# https://leetcode.com/problems/minimum-distance-between-bst-nodes

# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
  def minDiffInBST(self, root: Optional[TreeNode]) -> int:
    self.min = float('inf')
    self.prev = None
    self.inorder(root)
    return self.min

  def inorder(self, root: TreeNode) -> None:
    if root is None:
      return

    self.inorder(root.left)
    if self.prev is not None:
      self.min = min(self.min, root.val - self.prev)
    self.prev = root.val
    self.inorder(root.right)