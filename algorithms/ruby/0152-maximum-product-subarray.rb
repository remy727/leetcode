# frozen_string_literal: true

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
