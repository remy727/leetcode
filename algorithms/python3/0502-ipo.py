# Problem: 502. IPO
# URL: https://leetcode.com/problems/ipo

import heapq

class Solution:
  def findMaximizedCapital(self, k: int, w: int, profits: list[int], capital: list[int]) -> int:
    n = len(profits)
    projects = list(zip(capital, profits))
    projects.sort()

    q = []
    ptr = 0
    for i in range(k):
      while ptr < n and projects[ptr][0] <= w:
        heapq.heappush(q, -projects[ptr][1])
        ptr += 1
      if not q:
        break
      w += -heapq.heappop(q)
    return w

# ********************#
#       TEST         #
# ********************#

import unittest

class TestStringMethods(unittest.TestCase):
  def test_addBinary(self):
    self.assertEqual(Solution.findMaximizedCapital(self, 2, 0, [1, 2, 3], [0, 1, 1]), 4)
    self.assertEqual(Solution.findMaximizedCapital(self, 3, 0, [1, 2, 3], [0, 1, 2]), 6)

if __name__ == '__main__':
  unittest.main()
