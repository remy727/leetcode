# frozen_string_literal: true

# 1035. Uncrossed Lines
# https://leetcode.com/problems/uncrossed-lines
# Medium

=begin
You are given two integer arrays nums1 and nums2. We write the integers of nums1 and nums2 (in the order they are given) on two separate horizontal lines.

We may draw connecting lines: a straight line connecting two numbers nums1[i] and nums2[j] such that:

nums1[i] == nums2[j], and
the line we draw does not intersect any other connecting (non-horizontal) line.
Note that a connecting line cannot intersect even at the endpoints (i.e., each number can only belong to one connecting line).

Return the maximum number of connecting lines we can draw in this way.

Example 1:
Input: nums1 = [1,4,2], nums2 = [1,2,4]
Output: 2
Explanation: We can draw 2 uncrossed lines as in the diagram.
We cannot draw 3 uncrossed lines, because the line from nums1[1] = 4 to nums2[2] = 4 will intersect the line from nums1[2]=2 to nums2[1]=2.

Example 2:
Input: nums1 = [2,5,1,2,5], nums2 = [10,5,2,1,5,2]
Output: 3

Example 3:
Input: nums1 = [1,3,7,1,7,5], nums2 = [1,9,2,5,1]
Output: 2

Constraints:
1 <= nums1.length, nums2.length <= 500
1 <= nums1[i], nums2[j] <= 2000
=end

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def max_uncrossed_lines(nums1, nums2)
  r = Array.new(2) { [0] * (nums2.size + 1) }
  for x in nums1
    for y, j in nums2.each_with_index
      r[1][j + 1] = (x == y) ?
          1 + r[0][j] :
          [r[0][j + 1], r[1][j]].max
    end
    r.reverse!
  end
  r.first.last
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_uncrossed_lines < Test::Unit::TestCase
  def test_
    assert_equal 2, max_uncrossed_lines([1, 4, 2], [1, 2, 4])
    assert_equal 3, max_uncrossed_lines([2, 5, 1, 2, 5], [10, 5, 2, 1, 5, 2])
    assert_equal 2, max_uncrossed_lines([1, 3, 7, 1, 7, 5], [1, 9, 2, 5, 1])
  end
end
