# frozen_string_literal: true

# 39. Combination Sum
# https://leetcode.com/problems/combination-sum
# Medium

=begin
Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.
The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.
The test cases are generated such that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

Example 1:
Input: candidates = [2,3,6,7], target = 7
Output: [[2,2,3],[7]]
Explanation:
2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
7 is a candidate, and 7 = 7.
These are the only two combinations.

Example 2:
Input: candidates = [2,3,5], target = 8
Output: [[2,2,2,2],[2,3,3],[3,5]]

Example 3:

Input: candidates = [2], target = 1
Output: []

Constraints:
1 <= candidates.length <= 30
2 <= candidates[i] <= 40
All elements of candidates are distinct.
1 <= target <= 40
=end

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
  candidates.sort!

  stack = [[0, 0, []]]
  result = []

  until stack.empty?
    total, start, combination = stack.pop

    if total == target
      result << combination
    end

    (start...candidates.count).each do |i|
      new_total = total + candidates[i]

      if new_total > target
        break
      end

      stack << [
        new_total,
        i,
        combination + [candidates[i]]
      ]
    end
  end

  result
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_combination_sum < Test::Unit::TestCase
  def test_
    assert_equal [[2, 2, 3], [7]].sort, combination_sum([2, 3, 6, 7], 7).sort
    assert_equal [[2, 2, 2, 2], [2, 3, 3], [3, 5]].sort, combination_sum([2, 3, 5], 8).sort
    assert_equal [], combination_sum([2], 1).sort
  end
end
