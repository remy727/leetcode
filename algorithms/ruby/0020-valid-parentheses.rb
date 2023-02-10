# frozen_string_literal: true

# Problem: 20. Valid Parentheses
# URL: https://leetcode.com/problems/valid-parentheses

# @param {String} s
# @return {Boolean}
def is_valid(s)
  arr = []

  s.chars.each do |c|
    if ["(", "{", "["].include?(c)
      arr.push(c)
    else
      return false if arr.empty?
      if c == ")" && arr.last != "(" ||
         c == "}" && arr.last != "{" ||
         c == "]" && arr.last != "["

        return false
      end

      arr.pop
    end
  end

  arr.empty?
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_is_valid < Test::Unit::TestCase
  def test_
    assert_equal true, is_valid("()")
    assert_equal true, is_valid("()[]{}")
    assert_equal false, is_valid("(]")
  end
end
