# frozen_string_literal: true

# 227. Basic Calculator II
# https://leetcode.com/pcalculatelems/basic-calculator-ii
# Medium

=begin
Given a string s which represents an expression, evaluate this expression and return its value.

The integer division should truncate toward zero.

You may assume that the given expression is always valid. All intermediate results will be in the range of [-231, 231 - 1].

Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().

Example 1:
Input: s = "3+2*2"
Output: 7

Example 2:
Input: s = " 3/2 "
Output: 1

Example 3:
Input: s = " 3+5 / 2 "
Output: 5

Constraints:
1 <= s.length <= 3 * 105
s consists of integers and operators ('+', '-', '*', '/') separated by some number of spaces.
s represents a valid expression.
All the integers in the expression are non-negative integers in the range [0, 231 - 1].
The answer is guaranteed to fit in a 32-bit integer.

=end

# @param {String} s
# @return {Integer}
def calculate(s)
  operators = Set.new(%w[+ - * /])
  digits = Set.new("0".."9")

  num = 0
  presign = "+"
  stack = []

  (s.delete(" ") + "+").each_char do |char|
    if digits.include?(char)
      num = num * 10 + char.to_i
    elsif operators.include?(char)
      stack << case presign
               when "+" ; num
               when "-" ; -num
               when "*" ; stack.pop * num
               when "/" ; (stack.pop.to_f / num).to_i
      end

      presign = char
      num = 0
    end
  end

  stack.sum
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_calculate < Test::Unit::TestCase
  def test_
    assert_equal 7, calculate("3+2*2")
    assert_equal 1, calculate(" 3/2 ")
    assert_equal 5, calculate(" 3+5 / 2 ")
  end
end
