# frozen_string_literal: true

# 2275. Largest Combination With Bitwise AND Greater Than Zero
# Medium
# https://leetcode.com/problems/largest-combination-with-bitwise-and-greater-than-zero

=begin
The bitwise AND of an array nums is the bitwise AND of all integers in nums.
* For example, for nums = [1, 5, 3], the bitwise AND is equal to 1 & 5 & 3 = 1.
* Also, for nums = [7], the bitwise AND is 7.
You are given an array of positive integers candidates. Evaluate the bitwise AND of every combination of numbers of candidates. Each number in candidates may only be used once in each combination.
Return the size of the largest combination of candidates with a bitwise AND greater than 0.

Example 1:
Input: candidates = [16,17,71,62,12,24,14]
Output: 4
Explanation: The combination [16,17,62,24] has a bitwise AND of 16 & 17 & 62 & 24 = 16 > 0.
The size of the combination is 4.
It can be shown that no combination with a size greater than 4 has a bitwise AND greater than 0.
Note that more than one combination may have the largest size.
For example, the combination [62,12,24,14] has a bitwise AND of 62 & 12 & 24 & 14 = 8 > 0.
Example 2:
Input: candidates = [8,8]
Output: 2
Explanation: The largest combination [8,8] has a bitwise AND of 8 & 8 = 8 > 0.
The size of the combination is 2, so we return 2.

Constraints:
* 1 <= candidates.length <= 105
* 1 <= candidates[i] <= 107
=end

# @param {Integer[]} candidates
# @return {Integer}
def largest_combination(candidates)
  max_count = 0
  count = 0

  for i in 0..31 do
    count = 0

    candidates.each do |num|
      if num & (1 << i) != 0
        count += 1
      end
    end

    max_count = [count, max_count].max
  end

  max_count
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_largest_combination < Test::Unit::TestCase
  def test_
    assert_equal 4, largest_combination([16, 17, 71, 62, 12, 24, 14])
    assert_equal 2, largest_combination([8, 8])
  end
end
