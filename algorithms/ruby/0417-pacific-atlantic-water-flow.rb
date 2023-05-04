# frozen_string_literal: true

# 417. Pacific Atlantic Water Flow
# https://leetcode.com/problems/pacific-atlantic-water-flow
# Medium

=begin

There is an m x n rectangular island that borders both the Pacific Ocean and Atlantic Ocean. The Pacific Ocean touches the island's left and top edges, and the Atlantic Ocean touches the island's right and bottom edges.

The island is partitioned into a grid of square cells. You are given an m x n integer heights heights where heights[r][c] represents the height above sea level of the cell at coordinate (r, c).

The island receives a lot of rain, and the rain water can flow to neighboring cells directly north, south, east, and west if the neighboring cell's height is less than or equal to the current cell's height. Water can flow from any cell adjacent to an ocean into the ocean.

Return a 2D list of grid coordinates result where result[i] = [ri, ci] denotes that rain water can flow from cell (ri, ci) to both the Pacific and Atlantic oceans.

### Example 1:
Input: heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]
Output: [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]
Explanation: The following cells can flow to the Pacific and Atlantic oceans, as shown below:
[0,4]: [0,4] -> Pacific Ocean
       [0,4] -> Atlantic Ocean
[1,3]: [1,3] -> [0,3] -> Pacific Ocean
       [1,3] -> [1,4] -> Atlantic Ocean
[1,4]: [1,4] -> [1,3] -> [0,3] -> Pacific Ocean
       [1,4] -> Atlantic Ocean
[2,2]: [2,2] -> [1,2] -> [0,2] -> Pacific Ocean
       [2,2] -> [2,3] -> [2,4] -> Atlantic Ocean
[3,0]: [3,0] -> Pacific Ocean
       [3,0] -> [4,0] -> Atlantic Ocean
[3,1]: [3,1] -> [3,0] -> Pacific Ocean
       [3,1] -> [4,1] -> Atlantic Ocean
[4,0]: [4,0] -> Pacific Ocean
       [4,0] -> Atlantic Ocean
Note that there are other possible paths for these cells to flow to the Pacific and Atlantic oceans.

### Example 2:
Input: heights = [[1]]
Output: [[0,0]]
Explanation: The water can flow from the only cell to the Pacific and Atlantic oceans.

### Constraints:
* m == heights.length
* n == heights[r].length
* 1 <= m, n <= 200
* 0 <= heights[r][c] <= 105

=end

# @param {Integer[][]} heights
# @return {Integer[][]}
def pacific_atlantic(heights)
  return [] if heights.empty?
  pacific = Array.new(heights.length) { Array.new(heights[0].length, false) }
  atlantic = Array.new(heights.length) { Array.new(heights[0].length, false) }

  # left side pacific column
  for i in 0...heights.length
    dfs(heights, i, 0, pacific)
  end

  # upper side pacific row
  for j in 0...heights[0].length
    dfs(heights, 0, j, pacific)
  end

  # right side atlantic column
  for i in 0...heights.length
    dfs(heights, i, heights[0].length - 1, atlantic)
  end

  # down side atlantic row
  for j in 0...heights[0].length
    dfs(heights, heights.length - 1, j, atlantic)
  end

  res = []
  for i in 0...heights.length
    for j in 0...heights[0].length
      res << [i, j] if pacific[i][j] && atlantic[i][j]
    end
  end
  res
end

def dfs(heights, i, j, visited)
  visited[i][j] = true
  dfs(heights, i + 1, j, visited) if i + 1 < heights.size && !visited[i + 1][j] && heights[i + 1][j] >= heights[i][j]
  dfs(heights, i - 1, j, visited) if i - 1 >= 0 && !visited[i - 1][j] && heights[i - 1][j] >= heights[i][j]
  dfs(heights, i, j + 1, visited) if j + 1 < heights[0].size && !visited[i][j + 1] && heights[i][j + 1] >= heights[i][j]
  dfs(heights, i, j - 1, visited) if j - 1 >= 0 && !visited[i][j - 1] && heights[i][j - 1] >= heights[i][j]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_pacific_atlantic < Test::Unit::TestCase
  def test_
    assert_equal([[0, 4], [1, 3], [1, 4], [2, 2], [3, 0], [3, 1], [4, 0]], pacific_atlantic([[1, 2, 2, 3, 5], [3, 2, 3, 4, 4], [2, 4, 5, 3, 1], [6, 7, 1, 4, 5], [5, 1, 1, 2, 4]]))
    assert_equal([[0, 0]], pacific_atlantic([[1]]))
  end
end
