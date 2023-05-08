# 2187. Minimum Time to Complete Trips
# https://leetcode.com/problems/minimum-time-to-complete-trips

class Solution:
	def minimumTime(self, time: list[int], totalTrips: int) -> int:
		# Initialize the left and right boundaries.
		left, right = 1, min(time) * totalTrips

		# Can these buses finish 'totalTrips' of trips in 'given_time'?
		def timeEnough(given_time):
			return sum(given_time // t for t in time) >= totalTrips

		# Binary search to find the minimum time to finish the task.
		while left < right:
			mid = (left + right) // 2
			if timeEnough(mid):
				right = mid
			else:
				left = mid + 1
		return left

# ********************#
#       TEST         #
# ********************#

import unittest

class TestMinimumTime(unittest.TestCase):
  def test_minimumTime(self):
    self.assertEqual(Solution.minimumTime(self, [1, 2, 3, 5], 5), 3)
    self.assertEqual(Solution.minimumTime(self, [2], 1),2)

if __name__ == '__main__':
  unittest.main()
