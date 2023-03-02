# Problem: 443. String Compression
# URL: https://leetcode.com/problems/string-compression

class Solution:
  def compress(self, chars: list[str]) -> int:
    n = len(chars)
    
    if n == 1:
      return 1

    i = 0
    j = 0
    count = 0

    while i < n:
      count += 1

      if i == n - 1 or chars[i + 1] != chars[i]:
        chars[j] = chars[i]
        j += 1

        if count > 1:
          for char in str(count):
            chars[j] = char
            j += 1

        count = 0

      i += 1

    return j

# ********************#
#       TEST         #
# ********************#

import unittest

class TestStringMethods(unittest.TestCase):
  def test_addBinary(self):
    self.assertEqual(Solution.compress(self, ["a", "a", "b", "b", "c", "c", "c"]), 6)
    self.assertEqual(Solution.compress(self, ["a"]), 1)
    self.assertEqual(Solution.compress(self, ["a", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b"]), 4)

if __name__ == '__main__':
    unittest.main()