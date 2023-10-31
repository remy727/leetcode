# frozen_string_literal: true

# 2433. Find The Original Array of Prefix Xor
# Medium
# https://leetcode.com/problems/find-the-original-array-of-prefix-xor

=begin
You are given an integer array pref of size n. Find and return the array arr of size n that satisfies:
* pref[i] = arr[0] ^ arr[1] ^ ... ^ arr[i].
Note that ^ denotes the bitwise-xor operation.

It can be proven that the answer is unique.


Example 1:
Input: pref = [5,2,0,3,1]
Output: [5,7,2,3,2]
Explanation: From the array [5,7,2,3,2] we have the following:
- pref[0] = 5.
- pref[1] = 5 ^ 7 = 2.
- pref[2] = 5 ^ 7 ^ 2 = 0.
- pref[3] = 5 ^ 7 ^ 2 ^ 3 = 3.
- pref[4] = 5 ^ 7 ^ 2 ^ 3 ^ 2 = 1.

Example 2:
Input: pref = [13]
Output: [13]
Explanation: We have pref[0] = arr[0] = 13.

Constraints:
* 1 <= pref.length <= 105
* 0 <= pref[i] <= 106
=end

# @param {Integer[]} pref
# @return {Integer[]}
def find_array(pref)
  [0, *pref].each_cons(2).map { _1 ^ _2 }
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_find_array < Test::Unit::TestCase
  def test_
    assert_equal [5, 7, 2, 3, 2], find_array([5, 2, 0, 3, 1])
    assert_equal [13], find_array([13])
  end
end
