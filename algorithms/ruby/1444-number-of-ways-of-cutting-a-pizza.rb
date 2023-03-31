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

# @param {String[]} pizza
# @param {Integer} k
# @return {Integer}
def ways(pizza, k)
  rows = pizza.size
  cols = pizza[0].size
  apples = Array.new(rows + 1) { Array.new(cols + 1, 0) }
  f = Array.new(rows) { Array.new(cols, 0) }

  row = rows - 1
  while row >= 0
    col = cols - 1
    while col >= 0
      apples[row][col] = ((pizza[row][col] == "A") && 1 || 0) + apples[row + 1][col] + apples[row][col + 1] - apples[row + 1][col + 1]
      f[row][col] = (apples[row][col] > 0) && 1 || 0
      col -= 1
    end
    row -= 1
  end

  mod = 1000000007
  remain = 1
  while remain < k
    g = Array.new(rows) { Array.new(cols, 0) }
    row = 0
    while row < rows
      col = 0
      while col < cols
        next_row = row + 1
        while next_row < rows
          if apples[row][col] - apples[next_row][col] > 0
            g[row][col] += f[next_row][col] %= mod
          end
          next_row += 1
        end

        next_col = col + 1
        while next_col < cols
          if apples[row][col] - apples[row][next_col] > 0
            g[row][col] += f[row][next_col] %= mod
          end
          next_col += 1
        end
        col += 1
      end
      row += 1
    end
    f = g
    remain += 1
  end

  f[0][0]
end

# **************** #
#       TEST       #
# **************** #

# require "test/unit"
# class Test_ways < Test::Unit::TestCase
#   def test_
#     assert_equal 3, ways(["A..", "AAA", "..."], 3)
#     assert_equal 1, ways(["A..", "AA.", "..."], 3)
#     assert_equal 1, ways(["A..", "A..", "..."], 1)
#   end
# end


pizza = ["..A.A.AAA...AAAAAA.AA..A..A.A......A.AAA.AAAAAA.AA", "A.AA.A.....AA..AA.AA.A....AAA.A........AAAAA.A.AA.", "A..AA.AAA..AAAAAAAA..AA...A..A...A..AAA...AAAA..AA", "....A.A.AA.AA.AA...A.AA.AAA...A....AA.......A..AA.", "AAA....AA.A.A.AAA...A..A....A..AAAA...A.A.A.AAAA..", "....AA..A.AA..A.A...A.A..AAAA..AAAA.A.AA..AAA...AA", "A..A.AA.AA.A.A.AA..A.A..A.A.AAA....AAAAA.A.AA..A.A", ".AA.A...AAAAA.A..A....A...A.AAAA.AA..A.AA.AAAA.AA.", "A.AA.AAAA.....AA..AAA..AAAAAAA...AA.A..A.AAAAA.A..", "A.A...A.A...A..A...A.AAAA.A..A....A..AA.AAA.AA.AA.", ".A.A.A....AAA..AAA...A.AA..AAAAAAA.....AA....A....", "..AAAAAA..A..A...AA.A..A.AA......A.AA....A.A.AAAA.", "...A.AA.AAA.AA....A..AAAA...A..AAA.AAAA.A.....AA.A", "A.AAAAA..A...AAAAAAAA.AAA.....A.AAA.AA.A..A.A.A...", "A.A.AA...A.A.AA...A.AA.AA....AA...AA.A..A.AA....AA", "AA.A..A.AA..AAAAA...A..AAAAA.AA..AA.AA.A..AAAAA..A", "...AA....AAAA.A...AA....AAAAA.A.AAAA.A.AA..AA..AAA", "..AAAA..AA..A.AA.A.A.AA...A...AAAAAAA..A.AAA..AA.A", "AA....AA....AA.A......AAA...A...A.AA.A.AA.A.A.AA.A", "A.AAAA..AA..A..AAA.AAA.A....AAA.....A..A.AA.A.A...", "..AA...AAAAA.A.A......AA...A..AAA.AA..A.A.A.AA..A.", ".......AA..AA.AAA.A....A...A.AA..A.A..AAAAAAA.AA.A", ".A.AAA.AA..A.A.A.A.A.AA...AAAA.A.A.AA..A...A.AAA..", "A..AAAAA.A..A..A.A..AA..A...AAA.AA.A.A.AAA..A.AA..", "A.AAA.A.AAAAA....AA..A.AAA.A..AA...AA..A.A.A.AA.AA", ".A..AAAA.A.A.A.A.......AAAA.AA...AA..AAA..A...A.AA", "A.A.A.A..A...AA..A.AAA..AAAAA.AA.A.A.A..AA.A.A....", "A..A..A.A.AA.A....A...A......A.AA.AAA..A.AA...AA..", ".....A..A...A.A...A..A.AA.A...AA..AAA...AA..A.AAA.", "A...AA..A..AA.A.A.AAA..AA..AAA...AAA..AAA.AAAAA...", "AA...AAA.AAA...AAAA..A...A..A...AA...A..AA.A...A..", "A.AA..AAAA.AA.AAA.A.AA.A..AAAAA.A...A.A...A.AA....", "A.......AA....AA..AAA.AAAAAAA.A.AA..A.A.AA....AA..", ".A.A...AA..AA...AA.AAAA.....A..A..A.AA.A.AA...A.AA", "..AA.AA.AA..A...AA.AA.AAAAAA.....A.AA..AA......A..", "AAA..AA...A....A....AA.AA.AA.A.A.A..AA.AA..AAA.AAA", "..AAA.AAA.A.AA.....AAA.A.AA.AAAAA..AA..AA.........", ".AA..A......A.A.AAA.AAAA...A.AAAA...AAA.AAAA.....A", "AAAAAAA.AA..A....AAAA.A..AA.A....AA.A...A.A....A..", ".A.A.AA..A.AA.....A.A...A.A..A...AAA..A..AA..A.AAA", "AAAA....A...A.AA..AAA..A.AAA..AA.........AA.AAA.A.", "......AAAA..A.AAA.A..AAA...AAAAA...A.AA..A.A.AA.A.", "AA......A.AAAAAAAA..A.AAA...A.A....A.AAA.AA.A.AAA.", ".A.A....A.AAA..A..AA........A.AAAA.AAA.AA....A..AA", ".AA.A...AA.AAA.A....A.A...A........A.AAA......A...", "..AAA....A.A...A.AA..AAA.AAAAA....AAAAA..AA.AAAA..", "..A.AAA.AA..A.AA.A...A.AA....AAA.A.....AAA...A...A", ".AA.AA...A....A.AA.A..A..AAA.A.A.AA.......A.A...A.", "...A...A.AA.A..AAAAA...AA..A.A..AAA.AA...AA...A.A.", "..AAA..A.A..A..A..AA..AA...A..AA.AAAAA.A....A..A.A"]
k = 8
puts ways(pizza, k) # 641829390
