# frozen_string_literal: true

# 624. Maximum Distance in Arrays
# https://leetcode.com/problems/maximum-distance-in-arrays
# Medium

=begin
You are given m arrays, where each array is sorted in ascending order.
You can pick up two integers from two different arrays (each array picks one) and calculate the distance. We define the distance between two integers a and b to be their absolute difference |a - b|.
Return the maximum distance.

Example 1:
Input: arrays = [[1,2,3],[4,5],[1,2,3]]
Output: 4
Explanation: One way to reach the maximum distance 4 is to pick 1 in the first or third array and pick 5 in the second array.

Example 2:
Input: arrays = [[1],[1]]
Output: 0

Constraints:
* m == arrays.length
* 2 <= m <= 105
* 1 <= arrays[i].length <= 500
* -104 <= arrays[i][j] <= 104
* arrays[i] is sorted in ascending order.
* There will be at most 105 integers in all the arrays.
=end

# @param {Integer[][]} arrays
# @return {Integer}
def max_distance(arrays)
  min_val = arrays[0][0]
  max_val = arrays[0][-1]
  max_distance = 0

  arrays[1..-1].each do |current_array|
    current_min = current_array[0]
    current_max = current_array[-1]

    max_distance = [max_distance, (current_max - min_val).abs].max
    max_distance = [max_distance, (max_val - current_min).abs].max

    min_val = [min_val, current_min].min
    max_val = [max_val, current_max].max
  end

  max_distance
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_combination_sum2 < Test::Unit::TestCase
  def test_
    assert_equal 4, max_distance([[1, 2, 3], [4, 5], [1, 2, 3]])
    assert_equal 0, max_distance([[1], [1]])
  end
end
