# frozen_string_literal: true

# 733. Flood Fill
# https://leetcode.com/problems/flood-fill

=begin

An image is represented by an m x n integer grid image where image[i][j] represents the pixel value of the image.

You are also given three integers sr, sc, and color. You should perform a flood fill on the image starting from the pixel image[sr][sc].

To perform a flood fill, consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color), and so on. Replace the color of all of the aforementioned pixels with color.

Return the modified image after performing the flood fill.

### Example 1:
Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, color = 2
Output: [[2,2,2],[2,2,0],[2,0,1]]
Explanation: From the center of the image with position (sr, sc) = (1, 1) (i.e., the red pixel), all pixels connected by a path of the same color as the starting pixel (i.e., the blue pixels) are colored with the new color.
Note the bottom corner is not colored 2, because it is not 4-directionally connected to the starting pixel.

### Example 2:
Input: image = [[0,0,0],[0,0,0]], sr = 0, sc = 0, color = 0
Output: [[0,0,0],[0,0,0]]
Explanation: The starting pixel is already colored 0, so no changes are made to the image.

### Constraints:
* m == image.length
* n == image[i].length
* 1 <= m, n <= 50
* 0 <= image[i][j], color < 216
* 0 <= sr < m
* 0 <= sc < n

=end

# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} color
# @return {Integer[][]}
def flood_fill(image, sr, sc, color)
  return image if image[sr][sc] == color

  fill(image, sr, sc, image[sr][sc], color)

  image
end

def fill(image, sr, sc, original_color, new_color)
  m = image.length
  n = image[0].length

  if sr.negative? ||
     sr >= m ||
     sc.negative? ||
     sc >= n

    return
  end

  return if image[sr][sc] != original_color

  image[sr][sc] = new_color

  fill(image, sr - 1, sc, original_color, new_color)
  fill(image, sr + 1, sc, original_color, new_color)
  fill(image, sr, sc - 1, original_color, new_color)
  fill(image, sr, sc + 1, original_color, new_color)
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_flood_fill < Test::Unit::TestCase
  def test_
    assert_equal [[2, 2, 2], [2, 2, 0], [2, 0, 1]], flood_fill([[1, 1, 1], [1, 1, 0], [1, 0, 1]], 1, 1, 2)
    assert_equal [[0, 0, 0], [0, 0, 0]], flood_fill([[0, 0, 0], [0, 0, 0]], 0, 0, 0)
  end
end
