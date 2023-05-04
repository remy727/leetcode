# frozen_string_literal: true

# 152. Maximum Product Subarray
# https://leetcode.com/problems/maximum-product-subarray/
# Medium

=begin
Given an integer array nums, find a subarray that has the largest product, and return the product.

The test cases are generated so that the answer will fit in a 32-bit integer.

Example 1:
Input: nums = [2,3,-2,4]
Output: 6
Explanation: [2,3] has the largest product 6.

Example 2:
Input: nums = [-2,0,-1]
Output: 0
Explanation: The result cannot be 2, because [-2,-1] is not a subarray.

Constraints:
1 <= nums.length <= 2 * 104
-10 <= nums[i] <= 10
The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
=end

# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  min = max = 1
  res = nums[0]
  nums.each do |n|
    min, max = [n, min * n, max * n].minmax
    res = [res, max].max
  end
  res
end
