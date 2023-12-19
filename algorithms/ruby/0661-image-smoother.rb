# frozen_string_literal: true

# 661. Image Smoother
# Easy
# https://leetcode.com/problems/image-smoother

=begin
An image smoother is a filter of the size 3 x 3 that can be applied to each cell of an image by rounding down the average of the cell and the eight surrounding cells (i.e., the average of the nine cells in the blue smoother). If one or more of the surrounding cells of a cell is not present, we do not consider it in the average (i.e., the average of the four cells in the red smoother).
Given an m x n integer matrix img representing the grayscale of an image, return the image after applying the smoother on each cell of it.

Example 1:
Input: img = [[1,1,1],[1,0,1],[1,1,1]]
Output: [[0,0,0],[0,0,0],[0,0,0]]
Explanation:
For the points (0,0), (0,2), (2,0), (2,2): floor(3/4) = floor(0.75) = 0
For the points (0,1), (1,0), (1,2), (2,1): floor(5/6) = floor(0.83333333) = 0
For the point (1,1): floor(8/9) = floor(0.88888889) = 0

Example 2:
Input: img = [[100,200,100],[200,50,200],[100,200,100]]
Output: [[137,141,137],[141,138,141],[137,141,137]]
Explanation:
For the points (0,0), (0,2), (2,0), (2,2): floor((100+200+200+50)/4) = floor(137.5) = 137
For the points (0,1), (1,0), (1,2), (2,1): floor((200+200+50+200+100+100)/6) = floor(141.666667) = 141
For the point (1,1): floor((50+200+200+200+200+100+100+100+100)/9) = floor(138.888889) = 138

Constraints:
m == img.length
n == img[i].length
1 <= m, n <= 200
0 <= img[i][j] <= 255
=end

# @param {Integer[][]} img
# @return {Integer[][]}
def image_smoother(img)
  m = img.size - 1
  n = img[0].size - 1
  result = []

  i = 0
  while i <= m
    result << []
    min_x = [0, i - 1].max
    max_x = [i + 1, m].min
    dx = max_x - min_x + 1
    j = 0
    while j <= n
      min_y = [0, j - 1].max
      max_y = [j + 1, n].min
      dy = max_y - min_y + 1
      result[i] << img[min_x..max_x].sum { |r| r[min_y..max_y].sum } / (dx * dy)
      j += 1
    end

    i += 1
  end

  result
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_image_smoother < Test::Unit::TestCase
  def test_
    assert_equal [[0, 0, 0], [0, 0, 0], [0, 0, 0]], image_smoother([[1, 1, 1], [1, 0, 1], [1, 1, 1]])
    assert_equal [[137, 141, 137], [141, 138, 141], [137, 141, 137]], image_smoother([[100, 200, 100], [200, 50, 200], [100, 200, 100]])
  end
end
