# frozen_string_literal: true

# 2483. Minimum Penalty for a Shop
# Medium
# https://leetcode.com/problems/minimum-penalty-for-a-shop

=begin
You are given the customer visit log of a shop represented by a 0-indexed string customers consisting only of characters 'N' and 'Y':
* if the ith character is 'Y', it means that customers come at the ith hour
* whereas 'N' indicates that no customers come at the ith hour.
If the shop closes at the jth hour (0 <= j <= n), the penalty is calculated as follows:
* For every hour when the shop is open and no customers come, the penalty increases by 1.
* For every hour when the shop is closed and customers come, the penalty increases by 1.
Return the earliest hour at which the shop must be closed to incur a minimum penalty.
Note that if a shop closes at the jth hour, it means the shop is closed at the hour j.

Example 1:
Input: customers = "YYNY"
Output: 2
Explanation:
- Closing the shop at the 0th hour incurs in 1+1+0+1 = 3 penalty.
- Closing the shop at the 1st hour incurs in 0+1+0+1 = 2 penalty.
- Closing the shop at the 2nd hour incurs in 0+0+0+1 = 1 penalty.
- Closing the shop at the 3rd hour incurs in 0+0+1+1 = 2 penalty.
- Closing the shop at the 4th hour incurs in 0+0+1+0 = 1 penalty.
Closing the shop at 2nd or 4th hour gives a minimum penalty. Since 2 is earlier, the optimal closing time is 2.

Example 2:
Input: customers = "NNNNN"
Output: 0
Explanation: It is best to close the shop at the 0th hour as no customers arrive.

Example 3:
Input: customers = "YYYY"
Output: 4
Explanation: It is best to close the shop at the 4th hour as customers arrive at each hour.

Constraints:
* 1 <= customers.length <= 105
* customers consists only of characters 'Y' and 'N'.
=end

# @param {String} customers
# @return {Integer}
def best_closing_time(customers)
  count = [0]
  customers.each_char { |customer| count << (count[-1] + (customer == "Y" ? 1 : 0)) }

  min = customers.length
  mindex = 0
  (0..customers.length).each do |i|
    score = (i - count[i]) + (count[-1] - count[i])
    if score < min
      min = score
      mindex = i
    end
  end

  mindex
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_best_closing_time < Test::Unit::TestCase
  def test_
    assert_equal 2, best_closing_time("YYNY")
    assert_equal 0, best_closing_time("NNNNN")
    assert_equal 4, best_closing_time("YYYY")
  end
end
