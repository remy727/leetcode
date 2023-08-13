# frozen_string_literal: true

# 2369. Check if There is a Valid Partition For The Array
# Medium
# https://leetcode.com/problems/check-if-there-is-a-valid-partition-for-the-array

=begin
You are given a 0-indexed integer array nums. You have to partition the array into one or more contiguous subarrays.
We call a partition of the array valid if each of the obtained subarrays satisfies one of the following conditions:
1. The subarray consists of exactly 2 equal elements. For example, the subarray [2,2] is good.
2. The subarray consists of exactly 3 equal elements. For example, the subarray [4,4,4] is good.
3. The subarray consists of exactly 3 consecutive increasing elements, that is, the difference between adjacent elements is 1. For example, the subarray [3,4,5] is good, but the subarray [1,3,5] is not.
Return true if the array has at least one valid partition. Otherwise, return false.

Example 1:
Input: nums = [4,4,4,5,6]
Output: true
Explanation: The array can be partitioned into the subarrays [4,4] and [4,5,6].
This partition is valid, so we return true.

Example 2:
Input: nums = [1,1,1,2]
Output: false
Explanation: There is no valid partition for this array.

Constraints:
* 2 <= nums.length <= 105
* 1 <= nums[i] <= 106
=end

# @param {Integer[]} nums
# @return {Boolean}
def valid_partition(nums, memo = {})
  return true if nums.empty?

  memo[nums.size] ||= [
    nums.size >= 2 && eq?(nums[-2..])   && valid_partition(nums[0...-2], memo),
    nums.size >= 3 && eq?(nums[-3..])   && valid_partition(nums[0...-3], memo),
    nums.size >= 3 && cons?(nums[-3..]) && valid_partition(nums[0...-3], memo),
  ].any?
end

# checks if all elements of an array are the same
def eq?(arr)
  arr.uniq.one?
end

# checks if all elements of an array are increasing by one
def cons?(arr)
  arr.reverse.map.with_index { |e, i| e + i }.uniq.one?
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_valid_partition < Test::Unit::TestCase
  def test_
    assert_equal true, valid_partition([4, 4, 4, 5, 6])
    assert_equal false, valid_partition([1, 1, 1, 2])
    assert_equal false, valid_partition([923198, 923198, 701131, 701132])
  end
end
