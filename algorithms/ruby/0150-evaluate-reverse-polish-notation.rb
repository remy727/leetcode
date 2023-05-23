# frozen_string_literal: true

# 150. Evaluate Reverse Polish Notation
# https://leetcode.com/problems/evaluate-reverse-polish-notation
# Medium

=begin
You are given an array of strings tokens that represents an arithmetic expression in a Reverse Polish Notation.

Evaluate the expression. Return an integer that represents the value of the expression.

Note that:

The valid operators are '+', '-', '*', and '/'.
Each operand may be an integer or another expression.
The division between two integers always truncates toward zero.
There will not be any division by zero.
The input represents a valid arithmetic expression in a reverse polish notation.
The answer and all the intermediate calculations can be represented in a 32-bit integer.

Example 1:
Input: tokens = ["2","1","+","3","*"]
Output: 9
Explanation: ((2 + 1) * 3) = 9

Example 2:
Input: tokens = ["4","13","5","/","+"]
Output: 6
Explanation: (4 + (13 / 5)) = 6

Example 3:
Input: tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
Output: 22
Explanation: ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
= ((10 * (6 / (12 * -11))) + 17) + 5
= ((10 * (6 / -132)) + 17) + 5
= ((10 * 0) + 17) + 5
= (0 + 17) + 5
= 17 + 5
= 22
=end

# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  t = tokens.pop
  return t.to_i if !(op = "+-*/".index t)
  b, a = eval_rpn(tokens), eval_rpn(tokens)
  [a + b, a - b, a * b, a.fdiv(b)][op].to_i
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_eval_rpn < Test::Unit::TestCase
  def test_
    assert_equal 9, eval_rpn(["2", "1", "+", "3", "*"])
    assert_equal 6, eval_rpn(["4", "13", "5", "/", "+"])
    assert_equal 22, eval_rpn(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"])
  end
end
