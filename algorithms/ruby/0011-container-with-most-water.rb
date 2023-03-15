# frozen_string_literal: true

# Problem: 11. Container With Most Water
# URL: https://leetcode.com/problems/container-with-most-water/

=begin

You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return the maximum amount of water a container can store.

Notice that you may not slant the container.

### Constraints:

* n == height.length
* 2 <= n <= 105
* 0 <= height[i] <= 104

=end

# @param {Integer[]} height
# @return {Integer}
def max_area1(height)
  max_area = 0
  left, right = 0, height.size - 1

  while left < right
    min_h = [height[left], height[right]].min
    max_area = [max_area, min_h * (right - left)].max
    if height[left] < height[right]
      left += 1
    else
      right -= 1
    end
  end
  max_area
end

# @param {Integer[]} height
# @return {Integer}
def max_area2(height)
  max_area = 0
  height.size.times do |i|
    (i + 1..height.size - 1).each do |j|
      min_h = [height[i], height[j]].min
      max_area = [max_area, min_h * (j - i)].max
    end
  end
  max_area
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_area < Test::Unit::TestCase
  def test_
    assert_equal 49, max_area1([1, 8, 6, 2, 5, 4, 8, 3, 7])
    assert_equal 1, max_area1([1, 1])

    assert_equal 49, max_area2([1, 8, 6, 2, 5, 4, 8, 3, 7])
    assert_equal 1, max_area2([1, 1])
  end
end


# ********************#
#     Benchmark       #
# ********************#

require "benchmark"

height = [1, 8, 6, 2, 5, 4, 8, 3, 7]
Benchmark.bm do |x|
  x.report("max_area1: ") { max_area1(height) }
  x.report("max_area2: ") { max_area2(height) }
end

# user     system      total        real
# max_area1:   0.000019   0.000004   0.000023 (  0.000018)
# max_area2:   0.000025   0.000000   0.000025 (  0.000025)
