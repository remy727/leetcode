# frozen_string_literal: true

# 1970. Last Day Where You Can Still Cross
# Hard
# https://leetcode.com/problems/last-day-where-you-can-still-cross

=begin
There is a 1-based binary matrix where 0 represents land and 1 represents water. You are given integers row and col representing the number of rows and columns in the matrix, respectively.
Initially on day 0, the entire matrix is land. However, each day a new cell becomes flooded with water. You are given a 1-based 2D array cells, where cells[i] = [ri, ci] represents that on the ith day, the cell on the rith row and cith column (1-based coordinates) will be covered with water (i.e., changed to 1).
You want to find the last day that it is possible to walk from the top to the bottom by only walking on land cells. You can start from any cell in the top row and end at any cell in the bottom row. You can only travel in the four cardinal directions (left, right, up, and down).
Return the last day where it is possible to walk from the top to the bottom by only walking on land cells.

Example 1:
Input: row = 2, col = 2, cells = [[1,1],[2,1],[1,2],[2,2]]
Output: 2
Explanation: The above image depicts how the matrix changes each day starting from day 0.
The last day where it is possible to cross from top to bottom is on day 2.

Example 2:
Input: row = 2, col = 2, cells = [[1,1],[1,2],[2,1],[2,2]]
Output: 1
Explanation: The above image depicts how the matrix changes each day starting from day 0.
The last day where it is possible to cross from top to bottom is on day 1.

Example 3:
Input: row = 3, col = 3, cells = [[1,2],[2,1],[3,3],[2,2],[1,1],[1,3],[2,3],[3,2],[3,1]]
Output: 3
Explanation: The above image depicts how the matrix changes each day starting from day 0.
The last day where it is possible to cross from top to bottom is on day 3.

Constraints:
* 2 <= row, col <= 2 * 104
* 4 <= row * col <= 2 * 104
* cells.length == row * col
* 1 <= ri <= row
* 1 <= ci <= col
* All the values of cells are unique.
=end

# @param {Integer} row
# @param {Integer} col
# @param {Integer[][]} cells
# @return {Integer}
def latest_day_to_cross(row, col, cells)
  g, z = Array.new(row) { [0] * col }, row * col
  p, c = [*0...z], [1] * z
  f = -> x { p[x] == x ? x : (p[x] = f.(p[x])) }
  tr, br = Set[], Set[]
  d = [[1, 0], [-1, 0], [0, 1], [0, -1]]
  loop do
    i, j = *cells.pop
    g[i -= 1][j -= 1], a = 1, i * col + j
    tr << a if i == 0
    br << a if i == row - 1
    d.each do | y, x |
      y += i; x += j
      next if y < 0 || y == row ||
              x < 0 || x == col || g[y][x] == 0 ||
              (ra = f.(a)) == (rb = f.(y * col + x))
      return cells.size if tr === ra && br === rb ||
                       tr === rb && br === ra
      ra, rb = rb, ra if c[ra] < c[rb]
      p[rb] = ra; c[ra] += c[rb]
      (tr.delete rb; tr << ra) if tr === rb
      (br.delete rb; br << ra) if br === rb
    end
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_latest_day_to_cross < Test::Unit::TestCase
  def test_
    assert_equal 2, latest_day_to_cross(2, 2, [[1, 1], [2, 1], [1, 2], [2, 2]])
    assert_equal 1, latest_day_to_cross(2, 2, [[1, 1], [1, 2], [2, 1], [2, 2]])
    assert_equal 3, latest_day_to_cross(3, 3, [[1, 2], [2, 1], [3, 3], [2, 2], [1, 1], [1, 3], [2, 3], [3, 2], [3, 1]])
  end
end
