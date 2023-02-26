# frozen_string_literal: true

# Problem: 72. Edit Distance
# URL: https://leetcode.com/problems/edit-distance

# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
  n = word2.length
  curr = (0..n).to_a

  word1.length.times do |i|
    prev, curr = curr, [i + 1] + [0] * n

    n.times do |j|
      curr[j + 1] = word1[i] == word2[j] ? prev[j] : [curr[j], prev[j], prev[j + 1]].min + 1
    end
  end

  curr[n]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_min_distance < Test::Unit::TestCase
  def test_
    assert_equal 3, min_distance("horse", "ros")
    assert_equal 5, min_distance("intention", "execution")
  end
end
