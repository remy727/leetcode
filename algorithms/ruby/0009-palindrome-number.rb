# frozen_string_literal: true

# 9. Palindrome Number
# https://leetcode.com/problems/palindrome-number

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x.negative?

  x.digits.join.to_i == x
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_is_palindrome < Test::Unit::TestCase
  def test_
    assert_equal true, is_palindrome(121)
    assert_equal false, is_palindrome(-121)
    assert_equal false, is_palindrome(10)
  end
end
