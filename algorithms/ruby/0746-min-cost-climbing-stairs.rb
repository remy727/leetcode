# frozen_string_literal: true

# 746. Min Cost Climbing Stairs
# https://leetcode.com/problems/min-cost-climbing-stairs
# Easy

=begin

You are given an integer array cost where cost[i] is the cost of ith step on a staircase. Once you pay the cost, you can either climb one or two steps.

You can either start from the step with index 0, or the step with index 1.

Return the minimum cost to reach the top of the floor.

### Example 1:
Input: cost = [10,15,20]
Output: 15
Explanation: You will start at index 1.
- Pay 15 and climb two steps to reach the top.
The total cost is 15.

### Example 2:
Input: cost = [1,100,1,1,1,100,1,1,100,1]
Output: 6
Explanation: You will start at index 0.
- Pay 1 and climb two steps to reach index 2.
- Pay 1 and climb two steps to reach index 4.
- Pay 1 and climb two steps to reach index 6.
- Pay 1 and climb one step to reach index 7.
- Pay 1 and climb two steps to reach index 9.
- Pay 1 and climb one step to reach the top.
The total cost is 6.

### Constraints:
* 2 <= cost.length <= 1000
* 0 <= cost[i] <= 999

=end

# @param {Integer[]} cost
# @return {Integer}
def min_cost_climbing_stairs(cost)
  dp = [0] * cost.count
  dp[0] = cost[0]
  dp[1] = cost[1]

  (2...cost.count).each do |i|
    dp[i] = [dp[i - 2] + cost[i], dp[i - 1] + cost[i]].min
  end

  [dp[-2], dp[-1]].min
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_min_cost_climbing_stairs < Test::Unit::TestCase
  def test_
    assert_equal 15, min_cost_climbing_stairs([10, 15, 20])
    assert_equal 6, min_cost_climbing_stairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1])
  end
end
