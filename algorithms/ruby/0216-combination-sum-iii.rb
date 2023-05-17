# frozen_string_literal: true

# 216. Combination Sum III
# https://leetcode.com/problems/combination-sum-iii
# Medium

=begin
Find all valid combinations of k numbers that sum up to n such that the following conditions are true:

Only numbers 1 through 9 are used.
Each number is used at most once.
Return a list of all possible valid combinations. The list must not contain the same combination twice, and the combinations may be returned in any order.

Example 1:
Input: k = 3, n = 7
Output: [[1,2,4]]
Explanation:
1 + 2 + 4 = 7
There are no other valid combinations.

Example 2:
Input: k = 3, n = 9
Output: [[1,2,6],[1,3,5],[2,3,4]]
Explanation:
1 + 2 + 6 = 9
1 + 3 + 5 = 9
2 + 3 + 4 = 9
There are no other valid combinations.

Example 3:
Input: k = 4, n = 1
Output: []
Explanation: There are no valid combinations.
Using 4 different numbers in the range [1,9], the smallest sum we can get is 1+2+3+4 = 10 and since 10 > 1, there are no valid combination.

Constraints:
2 <= k <= 9
1 <= n <= 60
=end

# @param {Integer} k
# @param {Integer} n
# @return {Integer[][]}
def combination_sum3(k, n)
  [*(1..9)].combination(k).filter { _1.sum == n }
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_combination_sum3 < Test::Unit::TestCase
  def test_
    assert_equal [[1, 2, 4]], combination_sum3(3, 7)
    assert_equal [[1, 2, 6], [1, 3, 5], [2, 3, 4]], combination_sum3(3, 9)
    assert_equal [], combination_sum3(4, 1)
  end
end
