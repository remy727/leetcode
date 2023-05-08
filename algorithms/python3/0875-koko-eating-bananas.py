# 875. Koko Eating Bananas
# https://leetcode.com/problems/koko-eating-bananas

'''

Koko loves to eat bananas. There are n piles of bananas, the ith pile has piles[i] bananas. The guards have gone and will come back in h hours.

Koko can decide her bananas-per-hour eating speed of k. Each hour, she chooses some pile of bananas and eats k bananas from that pile. If the pile has less than k bananas, she eats all of them instead and will not eat any more bananas during this hour.

Koko likes to eat slowly but still wants to finish eating all the bananas before the guards return.

Return the minimum integer k such that she can eat all the bananas within h hours.

Constraints:

* 1 <= piles.length <= 104
* piles.length <= h <= 109
* 1 <= piles[i] <= 109

'''
import math
class Solution:
  def minEatingSpeed(self, piles: list[int], h: int) -> int:
    left, right = 1, max(piles)

    def speedEnough(speed):
      return sum(math.ceil(p / speed)  for p in piles) <= h

    while left < right:
      mid = (left + right) // 2
      if speedEnough(mid):
        right = mid
      else:
        left = mid + 1
    return left

# ********************#
#       TEST         #
# ********************#

import unittest

class TestminEatingSpeed(unittest.TestCase):
  def test_minEatingSpeed(self):
    self.assertEqual(Solution.minEatingSpeed(self, [3, 6, 7, 11], 8), 4)
    self.assertEqual(Solution.minEatingSpeed(self, [30, 11, 23, 4, 20], 5), 30)
    self.assertEqual(Solution.minEatingSpeed(self, [30, 11, 23, 4, 20], 6), 23)

if __name__ == '__main__':
  unittest.main()