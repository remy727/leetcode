# frozen_string_literal: true

# 64. Minimum Path Sum
# https://leetcode.com/problems/minimum-path-sum

=begin

Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.

Note: You can only move either down or right at any point in time.

### Example 1:
Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
Output: 7
Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.

### Example 2:
Input: grid = [[1,2,3],[4,5,6]]
Output: 12

### Constraints:
* m == grid.length
* n == grid[i].length
* 1 <= m, n <= 200
* 0 <= grid[i][j] <= 100

=end

# Runtime 72 ms
# Memory 212.3 MB
# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
  acc = [0] + [Float::INFINITY] * (grid[0].size - 1)

  grid.each { |row|
    left = Float::INFINITY
    acc.map!.with_index { |n, i| left = row[i] + (left < n ? left : n) }
  }

  acc.last
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_min_path_sum < Test::Unit::TestCase
  def test_
    assert_equal 7, min_path_sum([[1, 3, 1], [1, 5, 1], [4, 2, 1]])
    # assert_equal 12, min_path_sum([[1,2,3],[4,5,6]])
  end
end
