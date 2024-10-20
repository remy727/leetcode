# frozen_string_literal: true

# 1106. Parsing A Boolean Expression
# Hard
# https://leetcode.com/problems/parsing-a-boolean-expression

=begin
A boolean expression is an expression that evaluates to either true or false. It can be in one of the following shapes:
* 't' that evaluates to true.
* 'f' that evaluates to false.
* '!(subExpr)' that evaluates to the logical NOT of the inner expression subExpr.
* '&(subExpr1, subExpr2, ..., subExprn)' that evaluates to the logical AND of the inner expressions subExpr1, subExpr2, ..., subExprn where n >= 1.
* '|(subExpr1, subExpr2, ..., subExprn)' that evaluates to the logical OR of the inner expressions subExpr1, subExpr2, ..., subExprn where n >= 1.
Given a string expression that represents a boolean expression, return the evaluation of that expression.
It is guaranteed that the given expression is valid and follows the given rules.

Example 1:
Input: expression = "&(|(f))"
Output: false
Explanation:
First, evaluate |(f) --> f. The expression is now "&(f)".
Then, evaluate &(f) --> f. The expression is now "f".
Finally, return false.

Example 2:
Input: expression = "|(f,f,f,t)"
Output: true
Explanation: The evaluation of (false OR false OR false OR true) is true.

Example 3:
Input: expression = "!(&(f,t))"
Output: true
Explanation:
First, evaluate &(f,t) --> (false AND true) --> false --> f. The expression is now "!(f)".
Then, evaluate !(f) --> NOT false --> true. We return true.

Constraints:
* 1 <= expression.length <= 2 * 104
* expression[i] is one following characters: '(', ')', '&', '|', '!', 't', 'f', and ','.
=end

# @param {String} expression
# @return {Boolean}
def parse_bool_expr(expression)
  if expression == "t"
    return true
  elsif expression == "f"
    return false
  end

  operator = expression[0]
  expression = expression[2..-2]
  parts = []
  balance = 0
  current = +""
  expression.each_char do |char|
    if char == "," && balance == 0
      parts << current
      current = +""
    else
      current << char
      balance += 1 if char == "("
      balance -= 1 if char == ")"
    end
  end
  parts << current unless current.empty?

  case operator
  when "!"
    !parse_bool_expr(parts[0])
  when "&"
    parts.all? { |part| parse_bool_expr(part) }
  else
    parts.any? { |part| parse_bool_expr(part) }
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_parse_bool_expr < Test::Unit::TestCase
  def test_
    assert_equal false, parse_bool_expr("&(|(f))")
    assert_equal true, parse_bool_expr("|(f,f,f,t)")
    assert_equal true, parse_bool_expr("!(&(f,t))")
  end
end
