# frozen_string_literal: true

# 125. Valid Palindrome
# https://leetcode.com/problems/valid-palindrome
# Easy

=begin
A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string s, return true if it is a palindrome, or false otherwise.

Example 1:
Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.

Example 2:
Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.

Example 3:
Input: s = " "
Output: true
Explanation: s is an empty string "" after removing non-alphanumeric characters.
Since an empty string reads the same forward and backward, it is a palindrome.

Constraints:
1 <= s.length <= 2 * 105
s consists only of printable ASCII characters.
=end

# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  filtered_s = s.gsub(/[^a-bA-Z0-9]/i, "").downcase
  left, right = 0, filtered_s.size - 1

  while left < right
    return false if filtered_s[left] != filtered_s[right]
    left += 1
    right -= 1
  end

  true
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_is_palindrome < Test::Unit::TestCase
  def test_
    assert_equal true, is_palindrome("A man, a plan, a canal: Panama")
    assert_equal false, is_palindrome("race a car")
    assert_equal true, is_palindrome("")
  end
end
