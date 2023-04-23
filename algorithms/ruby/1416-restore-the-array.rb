# frozen_string_literal: true

# 1416. Restore The Array
# https://leetcode.com/problems/restore-the-array/description/
# Difficulty: Hard

=begin
A program was supposed to print an array of integers. The program forgot to print whitespaces and the array is printed as a string of digits s and all we know is that all integers in the array were in the range [1, k] and there are no leading zeros in the array.

Given the string s and the integer k, return the number of the possible arrays that can be printed as s using the mentioned program. Since the answer may be very large, return it modulo 109 + 7.

Example 1:
Input: s = "1000", k = 10000
Output: 1
Explanation: The only possible array is [1000]

Example 2:
Input: s = "1000", k = 10
Output: 0
Explanation: There cannot be an array that was printed this way and has all integer >= 1 and <= 10.

Example 3:
Input: s = "1317", k = 2000
Output: 8
Explanation: Possible arrays are [1317],[131,7],[13,17],[1,317],[13,1,7],[1,31,7],[1,3,17],[1,3,1,7]

Constraints:
1 <= s.length <= 105
s consists of only digits and does not contain leading zeros.
1 <= k <= 109
=end

# @param {String} s
# @param {Integer} k
# @return {Integer}
MOD = 10**9 + 7
def number_of_arrays(s, k)
  left = -1
  arr = [1] * s.size
  window_number = window_sum = 0
  for right in 0...s.size
    window_number = window_number * 10 + s[right].to_i
    while window_number > k
      window_sum -= arr[left] if s[left + 1] != "0"
      window_sum %= MOD
      left += 1
      window_number %= 10**(right - left)
    end
    if window_number == 0
      return 0
    end
    window_sum += arr[right - 1] if s[right] != "0"
    window_sum %= MOD
    arr[right] = window_sum
  end
  arr[-1]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_number_of_arrays < Test::Unit::TestCase
  def test_
    assert_equal 1, number_of_arrays("1000", 10000)
    assert_equal 0, number_of_arrays("1000", 10)
    assert_equal 8, number_of_arrays("1317", 2000)
  end
end
