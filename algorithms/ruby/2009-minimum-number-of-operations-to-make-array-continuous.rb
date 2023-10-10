# frozen_string_literal: true

# 2009. Minimum Number of Operations to Make Array Continuous
# Hard
# https://leetcode.com/problems/minimum-number-of-operations-to-make-array-continuous

=begin
You are given an integer array nums. In one operation, you can replace any element in nums with any integer.
nums is considered continuous if both of the following conditions are fulfilled:
* All elements in nums are unique.
* The difference between the maximum element and the minimum element in nums equals nums.length - 1.
For example, nums = [4, 2, 5, 3] is continuous, but nums = [1, 2, 3, 5, 6] is not continuous.
Return the minimum number of operations to make nums continuous.

Example 1:
Input: nums = [4,2,5,3]
Output: 0
Explanation: nums is already continuous.

Example 2:
Input: nums = [1,2,3,5,6]
Output: 1
Explanation: One possible solution is to change the last element to 4.
The resulting array is [1,2,3,5,4], which is continuous.

Example 3:
Input: nums = [1,10,100,1000]
Output: 3
Explanation: One possible solution is to:
- Change the second element to 2.
- Change the third element to 3.
- Change the fourth element to 4.
The resulting array is [1,2,3,4], which is continuous.

Constraints:
1 <= nums.length <= 105
1 <= nums[i] <= 109
=end

# @param {Integer[]} nums
# @return {Integer}
def min_operations(nums)
  nums.sort!

  repeat = [0]
  seen = Set[]
  nums.each do |num|
    repeat << (seen.include?(num) ? repeat[-1] + 1 : repeat[-1])
    seen.add(num)
  end

  len = nums.length
  min = len

  nums.each_with_index do |num, i|
    idx = nums.bsearch_index { |val| val > num + len - 1 } || len
    num_to_change = len - idx + i + repeat[idx] - repeat[i]
    min = num_to_change if num_to_change < min
  end

  min
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_min_operations < Test::Unit::TestCase
  def test_
    assert_equal 0, min_operations([4, 2, 5, 3])
    assert_equal 1, min_operations([1, 2, 3, 5, 6])
    assert_equal 3, min_operations([1, 10, 100, 1000])
  end
end
