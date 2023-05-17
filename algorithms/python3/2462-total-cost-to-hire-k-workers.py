# 2462. Total Cost to Hire K Workers
# https://leetcode.com/problems/total-cost-to-hire-k-workers
# Medium

from heapq import heapify, heappush, heappop

class Solution:
  def totalCost(self, costs: list[int], k: int, candidates: int) -> int:
    q = costs[:candidates]
    qq = costs[max(candidates, len(costs)-candidates):]
    heapify(q)
    heapify(qq)
    ans = 0
    i, ii = candidates, len(costs)-candidates-1
    for _ in range(k):
      if not qq or q and q[0] <= qq[0]:
        ans += heappop(q)
        if i <= ii:
          heappush(q, costs[i])
          i += 1
      else:
        ans += heappop(qq)
        if i <= ii:
          heappush(qq, costs[ii])
          ii -= 1
    return ans

# ********************#
#       TEST         #
# ********************#

import unittest

class TestMinimumTime(unittest.TestCase):
  def test_minimumTime(self):
    self.assertEqual(Solution.totalCost(self, [17,12,10,2,7,2,11,20,8], 3, 4), 11)
    self.assertEqual(Solution.totalCost(self, [1,2,4,1], 3, 3), 4)

if __name__ == '__main__':
  unittest.main()