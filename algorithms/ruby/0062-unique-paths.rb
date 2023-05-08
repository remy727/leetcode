# frozen_string_literal: true

# 62. Unique Paths
# https://leetcode.com/problems/unique-paths
# Medium

=begin

There is a robot on an m x n grid. The robot is initially located at the top-left corner (i.e., grid[0][0]). The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either down or right at any point in time.

Given the two integers m and n, return the number of possible unique paths that the robot can take to reach the bottom-right corner.

The test cases are generated so that the answer will be less than or equal to 2 * 109.

### Example 1:
Input: m = 3, n = 7
Output: 28

### Example 2:
Input: m = 3, n = 2
Output: 3
Explanation: From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
1. Right -> Down -> Down
2. Down -> Down -> Right
3. Down -> Right -> Down

### Constraints:
* 1 <= m, n <= 100

=end

# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  dp = Array.new(m) { Array.new(n) }
  m.times do |i|
    n.times do |j|
      if i == 0 || j == 0
        dp[i][j] = 1
      else
        dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
      end
    end
  end
  dp[-1][-1]
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_unique_paths < Test::Unit::TestCase
  def test_
    assert_equal 28, unique_paths(3, 7)
    assert_equal 3, unique_paths(3, 2)
  end
end
