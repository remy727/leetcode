# Problem: 67. Add Binary
# URL: https://leetcode.com/problems/add-binary

class Solution:
  def addBinary(self, a: str, b: str) -> str:
    a_len, b_len = -len(a), -len(b)
    i, carry,res = -1, 0, ""

    while i >= a_len or i >= b_len:
      a_bit = int(a[i]) if i >= a_len else 0
      b_bit = int(b[i]) if i >= b_len else 0

      sum = a_bit + b_bit + carry
      res = str(sum % 2) + res
      carry = sum // 2

      i -= 1

    return "1" + res if carry else res

# ********************#
#       TEST         #
# ********************#

import unittest

class TestStringMethods(unittest.TestCase):
  def test_addBinary(self):
    self.assertEqual(Solution.addBinary(self, "11", "1"), "100")
    self.assertEqual(Solution.addBinary(self, "1010", "1011"), "10101")


if __name__ == '__main__':
    unittest.main()