# frozen_string_literal: true

# 852. Peak Index in a Mountain Array
# Medium
# https://leetcode.com/problems/peak-index-in-a-mountain-array

=begin
An array arr a mountain if the following properties hold:
* arr.length >= 3
* There exists some i with 0 < i < arr.length - 1 such that:
  * arr[0] < arr[1] < ... < arr[i - 1] < arr[i]
  * arr[i] > arr[i + 1] > ... > arr[arr.length - 1]
Given a mountain array arr, return the index i such that arr[0] < arr[1] < ... < arr[i - 1] < arr[i] > arr[i + 1] > ... > arr[arr.length - 1].
You must solve it in O(log(arr.length)) time complexity.

Example 1:
Input: arr = [0,1,0]
Output: 1

Example 2:
Input: arr = [0,2,1,0]
Output: 1

Example 3:
Input: arr = [0,10,5,2]
Output: 1

Constraints:
* 3 <= arr.length <= 105
* 0 <= arr[i] <= 106
* arr is guaranteed to be a mountain array.
=end

# @param {Integer[]} arr
# @return {Integer}
def peak_index_in_mountain_array(arr)
  low = 0
  high = arr.length - 1

  while low < high
    mid = low + (high - low) / 2

    if arr[mid] < arr[mid + 1]
      low = mid + 1
    else
      high = mid
    end
  end

  low
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_peak_index_in_mountain_array < Test::Unit::TestCase
  def test_
    assert_equal 1, peak_index_in_mountain_array([0, 1, 0])
    assert_equal 1, peak_index_in_mountain_array([0, 2, 1, 0])
    assert_equal 1, peak_index_in_mountain_array([0, 10, 5, 2])
  end
end
