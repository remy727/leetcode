# frozen_string_literal: true

# 224. Basic Calculator
# https://leetcode.com/problems/basic-calculator
# Hard

=begin
Given a string s representing a valid expression, implement a basic calculator to evaluate it, and return the result of the evaluation.

Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().

Example 1:
Input: s = "1 + 1"
Output: 2

Example 2:
Input: s = " 2-1 + 2 "
Output: 3

Example 3:
Input: s = "(1+(4+5+2)-3)+(6+8)"
Output: 23

Constraints:
1 <= s.length <= 3 * 105
s consists of digits, '+', '-', '(', ')', and ' '.
s represents a valid expression.
'+' is not used as a unary operation (i.e., "+1" and "+(2 + 3)" is invalid).
'-' could be used as a unary operation (i.e., "-1" and "-(2 + 3)" is valid).
There will be no two consecutive operators in the input.
Every number and running calculation will fit in a signed 32-bit integer.
=end

# @param {String} s
# @return {Integer}
def calculate(s)
  last = s.size - 1
  total = 0
  sign = 1
  current = 0
  is_char = ->index { s[index].ord.between?(?0.ord, ?9.ord) }
  stack = []
  (0...s.size).each do |i|
    char = s[i]
    if ?+ == char
      sign = 1
    elsif ?- == char
      sign = -1
    elsif " " == char
    elsif ?( == char
      stack.push([total, sign])
      total = 0
      sign = 1
      current = 0
    elsif ?) == char
      prev_total, prev_sign = stack.pop()
      current = 0
      total = prev_total + prev_sign * total
      sign = 0
    elsif is_char[i]
      current = current * 10 + char.to_i
      if last == i || ! is_char[i + 1]
        total += sign * current
        current = 0
        sign = 0
      end
    end
  end
  total
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_calculate < Test::Unit::TestCase
  def test_
    assert_equal 2, calculate("1 + 1")
    assert_equal 3, calculate(" 2-1 + 2 ")
    assert_equal 23, calculate("(1+(4+5+2)-3)+(6+8)")
  end
end
