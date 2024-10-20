# frozen_string_literal: true

# 1545. Find Kth Bit in Nth Binary String
# Medium
# https://leetcode.com/problems/find-kth-bit-in-nth-binary-string

=begin
Given two positive integers n and k, the binary string Sn is formed as follows:
* S1 = "0"
* Si = Si - 1 + "1" + reverse(invert(Si - 1)) for i > 1
Where + denotes the concatenation operation, reverse(x) returns the reversed string x, and invert(x) inverts all the bits in x (0 changes to 1 and 1 changes to 0).

For example, the first four strings in the above sequence are:
* S1 = "0"
* S2 = "011"
* S3 = "0111001"
* S4 = "011100110110001"
Return the kth bit in Sn. It is guaranteed that k is valid for the given n.



Example 1:
Input: n = 3, k = 1
Output: "0"
Explanation: S3 is "0111001".
The 1st bit is "0".

Example 2:
Input: n = 4, k = 11
Output: "1"
Explanation: S4 is "011100110110001".
The 11th bit is "1".


Constraints:
* 1 <= n <= 20
* 1 <= k <= 2n - 1
=end

# @param {Integer} n
# @param {Integer} k
# @return {Character}
def find_kth_bit(n, k)
  return "0" if n == 1

  mid = 2**(n - 1)
  return "1" if k == mid

  if k < mid
    find_kth_bit(n - 1, k)
  else
    find_kth_bit(n - 1, 2**n - k) == "0" ? "1" : "0"
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"

class Test_find_kth_bit < Test::Unit::TestCase
  def test_
    assert_equal "0", find_kth_bit(3, 1)
    assert_equal "1", find_kth_bit(4, 11)
  end
end
