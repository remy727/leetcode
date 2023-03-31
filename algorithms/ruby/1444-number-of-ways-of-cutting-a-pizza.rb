# frozen_string_literal: true

# 1444. Number of Ways of Cutting a Pizza
# https://leetcode.com/problems/number-of-ways-of-cutting-a-pizza

=begin

Given a rectangular pizza represented as a rows x cols matrix containing the following characters: 'A' (an apple) and '.' (empty cell) and given the integer k. You have to cut the pizza into k pieces using k-1 cuts.

For each cut you choose the direction: vertical or horizontal, then you choose a cut position at the cell boundary and cut the pizza into two pieces. If you cut the pizza vertically, give the left part of the pizza to a person. If you cut the pizza horizontally, give the upper part of the pizza to a person. Give the last piece of pizza to the last person.

Return the number of ways of cutting the pizza such that each piece contains at least one apple. Since the answer can be a huge number, return this modulo 10^9 + 7.

### Example 1:
Input: pizza = ["A..","AAA","..."], k = 3
Output: 3
Explanation: The figure above shows the three ways to cut the pizza. Note that pieces must contain at least one apple.

### Example 2:
Input: pizza = ["A..","AA.","..."], k = 3
Output: 1

### Example 3:
Input: pizza = ["A..","A..","..."], k = 1
Output: 1

### Constraints:

* 1 <= rows, cols <= 50
* rows == pizza.length
* cols == pizza[i].length
* 1 <= k <= 10
* pizza consists of characters 'A' and '.' only.

=end

# Runtime: 200 ms
# Memory: 211.4 MB
# @param {String[]} pizza
# @param {Integer} k
# @return {Integer}
def ways(pizza, k)
  r, c = pizza.size, pizza[0].size
  ap = Array.new(r + 1).map { Array.new(c + 1, 0) }
  (0...r).reverse_each do |i|
    (0...c).reverse_each do |j|
      x = ?A == pizza[i][j] ? 1 : 0
      ap[i][j] = x + ap[i + 1][j] + ap[i][j + 1] - ap[i + 1][j + 1]
    end
  end
  dp = Array.new(k).map { Array.new(r).map { Array.new(c, 0) } }
  dp[0] = Array.new(r).map.with_index { |_, i| Array.new(c).map.with_index { |_, j| ap[i][j] > 0 ? 1 : 0 } }
  mod = 1000000007
  (1...k).each do |rmn|
    (0...r).each do |i|
      (0...c).each do |j|
        val = 0
        (i + 1...r).each do |ni|
          val += dp[rmn - 1][ni][j] if ap[i][j] - ap[ni][j] > 0
        end
        (j + 1...c).each do |nj|
          val += dp[rmn - 1][i][nj] if ap[i][j] - ap[i][nj] > 0
        end
        dp[rmn][i][j] = val % mod
      end
    end
  end
  dp[k - 1][0][0]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_ways < Test::Unit::TestCase
  def test_
    assert_equal 3, ways(["A..", "AAA", "..."], 3)
    assert_equal 1, ways(["A..", "AA.", "..."], 3)
    assert_equal 1, ways(["A..", "A..", "..."], 1)
  end
end
