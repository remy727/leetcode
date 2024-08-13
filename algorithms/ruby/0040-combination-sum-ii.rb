# frozen_string_literal: true

# 40. Combination Sum II
# https://leetcode.com/problems/combination-sum-ii
# Medium

=begin
Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.

Example 1:
Input: candidates = [10,1,2,7,6,1,5], target = 8
Output:
[
[1,1,6],
[1,2,5],
[1,7],
[2,6]
]

Example 2:
Input: candidates = [2,5,2,1,2], target = 5
Output:
[
[1,2,2],
[5]
]


Constraints:
* 1 <= candidates.length <= 100
* 1 <= candidates[i] <= 50
* 1 <= target <= 30
=end

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
  res_array = []
  candidates.sort!
  stack = [[[], 0, target]]

  while !stack.empty?
    temp, start, remaining = stack.pop

    if remaining == 0
      res_array.push(temp)
      next
    end

    (start...candidates.length).each do |i|
      next if i > start && candidates[i] == candidates[i - 1] # skip duplicates
      break if candidates[i] > remaining
      stack.push([temp + [candidates[i]], i + 1, remaining - candidates[i]])
    end
  end

  res_array
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_combination_sum2 < Test::Unit::TestCase
  def test_
    assert_equal [[1, 1, 6], [1, 2, 5], [1, 7], [2, 6]].sort, combination_sum2([10, 1, 2, 7, 6, 1, 5], 8).sort
    assert_equal [[1, 2, 2], [5]].sort, combination_sum2([2, 5, 2, 1, 2], 5).sort
  end
end
