# frozen_string_literal: true

# 239. Sliding Window Maximum
# Hard
# https://leetcode.com/problems/sliding-window-maximum

=begin
You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.
Return the max sliding window.

Example 1:
Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
Output: [3,3,5,5,6,7]
Explanation:
Window position                Max
---------------               -----
[1  3  -1] -3  5  3  6  7       3
 1 [3  -1  -3] 5  3  6  7       3
 1  3 [-1  -3  5] 3  6  7       5
 1  3  -1 [-3  5  3] 6  7       5
 1  3  -1  -3 [5  3  6] 7       6
 1  3  -1  -3  5 [3  6  7]      7

Example 2:
Input: nums = [1], k = 1
Output: [1]

Constraints:
* 1 <= nums.length <= 105
* -104 <= nums[i] <= 104
* 1 <= k <= nums.length
=end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
  return [] if nums.empty?

  # Deque will store indexes of array elements
  deque = []

  # Start processing the first k elements
  (0...k).each do |i|
    # While the deque isn't empty and the current element is greater than the last element in the deque
    while !deque.empty? && nums[i] >= nums[deque.last]
      deque.pop
    end
    deque.push(i)
  end

  # Save the maximum element from the first k elements
  output = [nums[deque.first]]

  # Process rest of the elements
  (k...nums.size).each do |i|
    # Remove elements from the deque that are not within the sliding window
    while !deque.empty? && deque.first <= i - k
      deque.shift
    end

    # While the deque isn't empty and the current element is greater than the last element in the deque
    while !deque.empty? && nums[i] >= nums[deque.last]
      deque.pop
    end
    deque.push(i)

    # The first element in the deque is always the maximum element in the current sliding window
    output.push(nums[deque.first])
  end

  output
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_length_of_longest_substring < Test::Unit::TestCase
  def test_
    assert_equal [3, 3, 5, 5, 6, 7], max_sliding_window([1, 3, -1, -3, 5, 3, 6, 7], 3)
    assert_equal [1], max_sliding_window([1], 1)
  end
end
