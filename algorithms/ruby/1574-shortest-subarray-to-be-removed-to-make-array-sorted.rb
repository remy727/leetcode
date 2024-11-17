# frozen_string_literal: true

# 1574. Shortest Subarray to be Removed to Make Array Sorted
# https://leetcode.com/problems/shortest-subarray-to-be-removed-to-make-array-sorted
# Medium

=begin
Given an integer array arr, remove a subarray (can be empty) from arr such that the remaining elements in arr are non-decreasing.
Return the length of the shortest subarray to remove.
A subarray is a contiguous subsequence of the array.

Example 1:
Input: arr = [1,2,3,10,4,2,3,5]
Output: 3
Explanation: The shortest subarray we can remove is [10,4,2] of length 3. The remaining elements after that will be [1,2,3,3,5] which are sorted.
Another correct solution is to remove the subarray [3,10,4].
Example 2:
Input: arr = [5,4,3,2,1]
Output: 4
Explanation: Since the array is strictly decreasing, we can only keep a single element. Therefore we need to remove a subarray of length 4, either [5,4,3,2] or [4,3,2,1].
Example 3:
Input: arr = [1,2,3]
Output: 0
Explanation: The array is already non-decreasing. We do not need to remove any elements.

Constraints:
* 1 <= arr.length <= 105
* 0 <= arr[i] <= 109
=end

# @param {Integer[]} arr
# @return {Integer}
def find_length_of_shortest_subarray(arr)
  n = arr.size
  left = 0
  left += 1 while left + 1 < n && arr[left] <= arr[left + 1]
  return 0 if left == n - 1

  right = n - 1
  right -= 1 while right - 1 >= 0 && arr[right - 1] <= arr[right]

  min_length = [n - left - 1, right].min

  i = 0
  j = right
  while i <= left && j < n
    if arr[i] <= arr[j]
      min_length = [min_length, j - i - 1].min
      i += 1
    else
      j += 1
    end
  end

  min_length
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_find_length_of_shortest_subarray < Test::Unit::TestCase
  def test_
    assert_equal 3, find_length_of_shortest_subarray([1, 2, 3, 10, 4, 2, 3, 5])
    assert_equal 4, find_length_of_shortest_subarray([5, 4, 3, 2, 1])
    assert_equal 0, find_length_of_shortest_subarray([1, 2, 3])
  end
end
