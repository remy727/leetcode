# frozen_string_literal: true

# 1162. As Far from Land as Possible
# https://leetcode.com/problems/as-far-from-land-as-possible

# @param {Integer[][]} grid
# @return {Integer}
def max_distance(grid)
  queue = []
  grid.each_with_index { |row, i|
    row.each_with_index { |cell, j|
      queue << [i, j] if cell == 1
    }
  }
  n = grid.size
  hop_count = -1
  until queue.empty?
    queue.size.times {
      i, j = queue.shift
      [[i + 1, j], [i - 1, j], [i, j + 1], [i, j - 1]].each { |ii, jj|
        next if !ii.between?(0, n - 1) || !jj.between?(0, n - 1) || !grid[ii][jj].zero?
        queue << [ii, jj]
        grid[ii][jj] = 2
      }
    }
    hop_count += 1
  end
  hop_count.zero? ? -1 : hop_count
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_distance < Test::Unit::TestCase
  def test_
    assert_equal 2, max_distance([[1, 0, 1], [0, 0, 0], [1, 0, 1]])
    assert_equal 4, max_distance([[1, 0, 0], [0, 0, 0], [0, 0, 0]])
  end
end
