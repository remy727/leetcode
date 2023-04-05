# frozen_string_literal: true

# 2439. Minimize Maximum of Array
# https://leetcode.com/problems/minimize-maximum-of-array

=begin

You are given a 0-indexed array nums comprising of n non-negative integers.

In one operation, you must:
* Choose an integer i such that 1 <= i < n and nums[i] > 0.
* Decrease nums[i] by 1.
* Increase nums[i - 1] by 1.
Return the minimum possible value of the maximum integer of nums after performing any number of operations.

### Example 1:
Input: nums = [3,7,1,6]
Output: 5
Explanation:
One set of optimal operations is as follows:
1. Choose i = 1, and nums becomes [4,6,1,6].
2. Choose i = 3, and nums becomes [4,6,2,5].
3. Choose i = 1, and nums becomes [5,5,2,5].
The maximum integer of nums is 5. It can be shown that the maximum number cannot be less than 5.
Therefore, we return 5.

### Example 2:
Input: nums = [10,1]
Output: 10
Explanation:
It is optimal to leave nums as is, and since 10 is the maximum value, we return 10.

### Constraints:
* n == nums.length
* 2 <= n <= 105
* 0 <= nums[i] <= 109

=end

# @param {Integer[]} nums
# @return {Integer}
def minimize_array_value(nums)
  minmax = 0
  sum = 0
  (0...nums.size).each do |i|
    sum += nums[i]
    minmax = [(sum + i) / (i + 1), minmax].max
  end
  minmax
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_minimize_array_value < Test::Unit::TestCase
  def test_
    assert_equal 5, minimize_array_value([3, 7, 1, 6])
    assert_equal 10, minimize_array_value([10, 1])
  end
end
