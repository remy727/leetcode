# frozen_string_literal: true

# 983. Minimum Cost For Tickets
# https://leetcode.com/problems/minimum-cost-for-tickets

=begin

You have planned some train traveling one year in advance. The days of the year in which you will travel are given as an integer array days. Each day is an integer from 1 to 365.

Train tickets are sold in three different ways:

a 1-day pass is sold for costs[0] dollars,
a 7-day pass is sold for costs[1] dollars, and
a 30-day pass is sold for costs[2] dollars.
The passes allow that many days of consecutive travel.

For example, if we get a 7-day pass on day 2, then we can travel for 7 days: 2, 3, 4, 5, 6, 7, and 8.
Return the minimum number of dollars you need to travel every day in the given list of days.

### Example 1:
Input: days = [1,4,6,7,8,20], costs = [2,7,15]
Output: 11
Explanation: For example, here is one way to buy passes that lets you travel your travel plan:
On day 1, you bought a 1-day pass for costs[0] = $2, which covered day 1.
On day 3, you bought a 7-day pass for costs[1] = $7, which covered days 3, 4, ..., 9.
On day 20, you bought a 1-day pass for costs[0] = $2, which covered day 20.
In total, you spent $11 and covered all the days of your travel.

### Example 2:
Input: days = [1,2,3,4,5,6,7,8,9,10,30,31], costs = [2,7,15]
Output: 17
Explanation: For example, here is one way to buy passes that lets you travel your travel plan:
On day 1, you bought a 30-day pass for costs[2] = $15 which covered days 1, 2, ..., 30.
On day 31, you bought a 1-day pass for costs[0] = $2 which covered day 31.
In total, you spent $17 and covered all the days of your travel.

### Constraints:
1 <= days.length <= 365
1 <= days[i] <= 365
days is in strictly increasing order.
costs.length == 3
1 <= costs[i] <= 1000

=end

# Runtime 103 ms
# Memory 211.1 MB
# @param {Integer[]} days
# @param {Integer[]} costs
# @return {Integer}
def mincost_tickets(days, costs)
  is_travels = (days.last + 1).times.map { |day| days.include?(day) ? true : false }
  dp = [0] * (days.last + 1)

  (1..days.last).each do |day|
    dp[day] = if is_travels[day]
      dp[day] = [
        dp[day - 1] + costs[0],
        dp[[day - 7, 0].max] + costs[1],
        dp[[day - 30, 0].max] + costs[2]
      ].min
    else
      dp[day - 1]
    end
  end

  dp[days.last]
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_mincost_tickets < Test::Unit::TestCase
  def test_
    assert_equal 11, mincost_tickets([1, 4, 6, 7, 8, 20], [2, 7, 15])
    assert_equal 17, mincost_tickets([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 30, 31], [2, 7, 15])
  end
end
