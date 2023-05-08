# frozen_string_literal: true

# 990. Satisfiability of Equality Equations
# https://leetcode.com/problems/satisfiability-of-equality-equations

# @param {String[]} equations
# @return {Boolean}
def equations_possible(equations)
  equations.join.tap { _1.tr! Regexp.last_match(1), Regexp.last_match(2) while _1 =~ /(.)==(?!\1)(.)/ } !~ /(.)!=\1/
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_equations_possible < Test::Unit::TestCase
  def test_
    assert_equal false, equations_possible(["a==b", "b!=a"])
    assert_equal true, equations_possible(["b==a", "a==b"])
  end
end
