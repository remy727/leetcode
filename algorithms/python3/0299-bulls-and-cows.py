# 299. Bulls and Cows
# https://leetcode.com/problems/bulls-and-cows

import operator;

class Solution:
  def getHint(self, secret: str, guess: str) -> str:
    bulls = sum(map(operator.eq, secret, guess))
    both = sum(min(secret.count(x), guess.count(x)) for x in set(guess))
    return '%dA%dB' % (bulls, both - bulls)

# ********************#
#       TEST         #
# ********************#

import unittest

class TestStringMethods(unittest.TestCase):
  def test_addBinary(self):
    self.assertEqual(Solution.getHint(self, "1807", "7810"), "1A3B")
    self.assertEqual(Solution.getHint(self, "1123", "0111"), "1A1B")

if __name__ == '__main__':
    unittest.main()