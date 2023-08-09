# frozen_string_literal: true

# 2616. Minimize the Maximum Difference of Pairs
# Medium
# https://leetcode.com/problems/minimize-the-maximum-difference-of-pairs

=begin
You are given a 0-indexed integer array nums and an integer p. Find p pairs of indices of nums such that the maximum difference amongst all the pairs is minimized. Also, ensure no index appears more than once amongst the p pairs.
Note that for a pair of elements at the index i and j, the difference of this pair is |nums[i] - nums[j]|, where |x| represents the absolute value of x.
Return the minimum maximum difference among all p pairs. We define the maximum of an empty set to be zero.

Example 1:
Input: nums = [10,1,2,7,1,3], p = 2
Output: 1
Explanation: The first pair is formed from the indices 1 and 4, and the second pair is formed from the indices 2 and 5.
The maximum difference is max(|nums[1] - nums[4]|, |nums[2] - nums[5]|) = max(0, 1) = 1. Therefore, we return 1.

Example 2:
Input: nums = [4,2,1,2], p = 1
Output: 0
Explanation: Let the indices 1 and 3 form a pair. The difference of that pair is |2 - 2| = 0, which is the minimum we can attain.

Constraints:
* 1 <= nums.length <= 105
* 0 <= nums[i] <= 109
* 0 <= p <= (nums.length)/2
=end

# @param {Integer[]} nums
# @param {Integer} p
# @return {Integer}
def minimize_max(nums, pairs)
  nums.sort!
  diffs = []
  (1...nums.length).each do |i|
    diffs << nums[i] - nums[i - 1]
  end

  (0..diffs.max).bsearch do |n|
    i = 0
    pairs_copy = pairs
    while i < diffs.length && pairs_copy > 0
      if diffs[i] <= n
        i += 2
        pairs_copy -= 1
      else
        i += 1
      end
    end
    pairs_copy == 0
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_length_of_longest_substring < Test::Unit::TestCase
  def test_
    assert_equal 1, minimize_max([10, 1, 2, 7, 1, 3], 2)
    assert_equal 0, minimize_max([4, 2, 1, 2], 1)
  end
end
