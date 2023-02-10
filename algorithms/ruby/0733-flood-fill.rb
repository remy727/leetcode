# frozen_string_literal: true

# Problem: 733. Flood Fill
# URL: https://leetcode.com/problems/flood-fill

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
