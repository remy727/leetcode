# frozen_string_literal: true

# 399. Evaluate Division
# https://leetcode.com/problems/evaluate-division
# Medium

=begin
You are given an array of variable pairs equations and an array of real numbers values, where equations[i] = [Ai, Bi] and values[i] represent the equation Ai / Bi = values[i]. Each Ai or Bi is a string that represents a single variable.

You are also given some queries, where queries[j] = [Cj, Dj] represents the jth query where you must find the answer for Cj / Dj = ?.

Return the answers to all queries. If a single answer cannot be determined, return -1.0.

Note: The input is always valid. You may assume that evaluating the queries will not result in division by zero and that there is no contradiction.

Example 1:
Input: equations = [["a","b"],["b","c"]], values = [2.0,3.0], queries = [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]
Output: [6.00000,0.50000,-1.00000,1.00000,-1.00000]
Explanation:
Given: a / b = 2.0, b / c = 3.0
queries are: a / c = ?, b / a = ?, a / e = ?, a / a = ?, x / x = ?
return: [6.0, 0.5, -1.0, 1.0, -1.0 ]

Example 2:
Input: equations = [["a","b"],["b","c"],["bc","cd"]], values = [1.5,2.5,5.0], queries = [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]
Output: [3.75000,0.40000,5.00000,0.20000]

Example 3:
Input: equations = [["a","b"]], values = [0.5], queries = [["a","b"],["b","a"],["a","c"],["x","y"]]
Output: [0.50000,2.00000,-1.00000,-1.00000]

Constraints:
1 <= equations.length <= 20
equations[i].length == 2
1 <= Ai.length, Bi.length <= 5
values.length == equations.length
0.0 < values[i] <= 20.0
1 <= queries.length <= 20
queries[i].length == 2
1 <= Cj.length, Dj.length <= 5
Ai, Bi, Cj, Dj consist of lower case English letters and digits.
=end

# @param {String[][]} equations
# @param {Float[]} values
# @param {String[][]} queries
# @return {Float[]}
def calc_equation(equations, values, queries)
  @graph = Hash.new { |h, k| h[k] = {} }

  equations.zip(values).each do |equation, value|
    variable_1, variable_2 = equation

    @graph[variable_1][variable_2] = value.to_f
    @graph[variable_2][variable_1] = 1.0 / value
    @graph[variable_1][variable_1] = 1.0
    @graph[variable_2][variable_2] = 1.0
  end

  result = []

  queries.each do |variable_1, variable_2|
    if @graph[variable_1].empty? || @graph[variable_2].empty?
      result << -1.0
    else
      result << dfs(variable_1, variable_2, 1.0, Set.new)
    end
  end

  result
end

def dfs(variable_1, variable_2, result, checked_variables_set)
  return result if variable_1 == variable_2

  checked_variables_set << variable_1

  @graph[variable_1].keys.each do |connected_variable|
    unless checked_variables_set.include?(connected_variable)
      value = dfs(
        connected_variable,
        variable_2,
        result * @graph[variable_1][connected_variable],
        checked_variables_set.dup
      )
      return value if value != -1.0
    end
  end

  -1.0
end


# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_calc_equation < Test::Unit::TestCase
  def test_
    assert_equal [6.00000, 0.50000, -1.00000, 1.00000, -1.00000], calc_equation([["a", "b"], ["b", "c"]], [2.0, 3.0], [["a", "c"], ["b", "a"], ["a", "e"], ["a", "a"], ["x", "x"]])
    assert_equal [3.75000, 0.40000, 5.00000, 0.20000], calc_equation([["a", "b"], ["b", "c"], ["bc", "cd"]], [1.5, 2.5, 5.0], [["a", "c"], ["c", "b"], ["bc", "cd"], ["cd", "bc"]])
    assert_equal [0.50000, 2.00000, -1.00000, -1.00000], calc_equation([["a", "b"]], [0.5], [["a", "b"], ["b", "a"], ["a", "c"], ["x", "y"]])
  end
end
