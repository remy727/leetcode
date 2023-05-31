# frozen_string_literal: true

# 22. Generate Parentheses
# https://leetcode.com/problems/generate-parentheses
# Medium

=begin
Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

Example 1:
Input: n = 3
Output: ["((()))","(()())","(())()","()(())","()()()"]

Example 2:
Input: n = 1
Output: ["()"]

Constraints:
* 1 <= n <= 8
=end

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  @res = []
  backtrack("", 0, 0, n)
  @res
end

def backtrack(curr, open, close, n)
  @res << curr and return if curr.length == n * 2
  backtrack(curr + "(", open + 1, close, n) if open < n
  backtrack(curr + ")", open, close + 1, n) if close < open
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_generate_parenthesis < Test::Unit::TestCase
  def test_
    assert_equal ["((()))", "(()())", "(())()", "()(())", "()()()"], generate_parenthesis(3)
    assert_equal ["()"], generate_parenthesis(1)
  end
end
