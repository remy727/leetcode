# frozen_string_literal: true

# 1480. Running Sum of 1d Array
# https://leetcode.com/problems/running-sum-of-1d-array

=begin

Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).

Return the running sum of nums.

### Example 1:
Input: nums = [1,2,3,4]
Output: [1,3,6,10]
Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].

### Example 2:
Input: nums = [1,1,1,1,1]
Output: [1,2,3,4,5]
Explanation: Running sum is obtained as follows: [1, 1+1, 1+1+1, 1+1+1+1, 1+1+1+1+1].

### Example 3:
Input: nums = [3,1,2,10,1]
Output: [3,4,6,16,17]

### Constraints:

* 1 <= nums.length <= 1000
* -10^6 <= nums[i] <= 10^6
=end

# Runtime 96 ms
# Memory 211.1 MB
# @param {Integer[]} nums
# @return {Integer[]}
def running_sum(nums)
  nums.reduce([]) { _1 << _2 + (_1.last || 0) }
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_running_sum < Test::Unit::TestCase
  def test_
    assert_equal [1, 3, 6, 10], running_sum([1, 2, 3, 4])
    assert_equal [1, 2, 3, 4, 5], running_sum([1, 1, 1, 1, 1])
    assert_equal [3, 4, 6, 16, 17], running_sum([3, 1, 2, 10, 1])
  end
end
