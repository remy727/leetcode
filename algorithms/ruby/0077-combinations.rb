# frozen_string_literal: true

# 77. Combinations
# https://leetcode.com/problems/combinations
# Medium

=begin
Given two integers n and k, return all possible combinations of k numbers chosen from the range [1, n].

You may return the answer in any order.

Example 1:
Input: n = 4, k = 2
Output: [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
Explanation: There are 4 choose 2 = 6 total combinations.
Note that combinations are unordered, i.e., [1,2] and [2,1] are considered to be the same combination.

Example 2:
Input: n = 1, k = 1
Output: [[1]]
Explanation: There is 1 choose 1 = 1 total combination.

Constraints:
* 1 <= n <= 20
* 1 <= k <= n
=end

# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine(n, k)
  return (1..n).map { |i| [i] } if k == 1

  i = n
  result = []

  while i > 1
    result += combine(i - 1, k - 1).map { |tuple| tuple + [i] }
    i -= 1
  end

  result
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_combine < Test::Unit::TestCase
  def test_
    assert_equal [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]].sort, combine(4, 2).sort
    assert_equal [[1]], combine(1, 1)
  end
end
