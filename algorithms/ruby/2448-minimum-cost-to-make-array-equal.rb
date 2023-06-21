# frozen_string_literal: true

# 2448. Minimum Cost to Make Array Equal
# Hard
# https://leetcode.com/problems/minimum-cost-to-make-array-equal

=begin
You are given two 0-indexed arrays nums and cost consisting each of n positive integers.
You can do the following operation any number of times:
* Increase or decrease any element of the array nums by 1.
The cost of doing one operation on the ith element is cost[i].
Return the minimum total cost such that all the elements of the array nums become equal.

Example 1:
Input: nums = [1,3,5,2], cost = [2,3,1,14]
Output: 8
Explanation: We can make all the elements equal to 2 in the following way:
- Increase the 0th element one time. The cost is 2.
- Decrease the 1st element one time. The cost is 3.
- Decrease the 2nd element three times. The cost is 1 + 1 + 1 = 3.
The total cost is 2 + 3 + 3 = 8.
It can be shown that we cannot make the array equal with a smaller cost.

Example 2:
Input: nums = [2,2,2,2,2], cost = [4,2,8,1,3]
Output: 0
Explanation: All the elements are already equal, so no operations are needed.

Constraints:
* n == nums.length == cost.length
* 1 <= n <= 105
* 1 <= nums[i], cost[i] <= 106
=end

# @param {Integer[]} nums
# @param {Integer[]} costs
# @return {Integer}
def min_cost(nums, costs)
  min, max = nums.minmax
  return 0 if min == max

  memo = Hash.new { |h, k| h[k] = nums.zip(costs).sum(0) { |number, cost| cost * (k - number).abs } }
  memo[(min..max).bsearch { |number| memo[number] < memo[number + 1] }]
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_min_cost < Test::Unit::TestCase
  def test_
    assert_equal 8, min_cost([1, 3, 5, 2], [2, 3, 1, 14])
    assert_equal 0, min_cost([2, 2, 2, 2, 2], [4, 2, 8, 1, 3])
  end
end
