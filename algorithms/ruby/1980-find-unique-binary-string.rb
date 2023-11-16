# frozen_string_literal: true

# 1980. Find Unique Binary String
# Medium
# https://leetcode.com/problems/find-unique-binary-string

=begin
Given an array of strings nums containing n unique binary strings each of length n, return a binary string of length n that does not appear in nums. If there are multiple answers, you may return any of them.

Example 1:
Input: nums = ["01","10"]
Output: "11"
Explanation: "11" does not appear in nums. "00" would also be correct.

Example 2:
Input: nums = ["00","01"]
Output: "11"
Explanation: "11" does not appear in nums. "10" would also be correct.

Example 3:
Input: nums = ["111","011","001"]
Output: "101"
Explanation: "101" does not appear in nums. "000", "010", "100", and "110" would also be correct.

Constraints:
n == nums.length
1 <= n <= 16
nums[i].length == n
nums[i] is either '0' or '1'.
All the strings of nums are unique.
=end

# @param {String[]} nums
# @return {String}
def find_different_binary_string(nums)
  length = nums.length
  number = ""
  (0...length).each do |i|
    number += (nums[i][i] == "1" ? "0" : "1")
  end
  number
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_find_different_binary_string < Test::Unit::TestCase
  def test_
    assert_equal "11", find_different_binary_string(["01", "10"])
    assert_equal "11", find_different_binary_string(["00", "01"])
    assert_equal "101", find_different_binary_string(["111", "011", "001"])
  end
end
