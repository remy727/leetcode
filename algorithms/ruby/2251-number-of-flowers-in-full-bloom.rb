# frozen_string_literal: true

# 2251. Number of Flowers in Full Bloom
# Hard
# https://leetcode.com/problems/number-of-flowers-in-full-bloom

=begin
You are given a 0-indexed 2D integer array flowers, where flowers[i] = [starti, endi] means the ith flower will be in full bloom from starti to endi (inclusive). You are also given a 0-indexed integer array people of size n, where people[i] is the time that the ith person will arrive to see the flowers.
Return an integer array answer of size n, where answer[i] is the number of flowers that are in full bloom when the ith person arrives.

Example 1:
Input: flowers = [[1,6],[3,7],[9,12],[4,13]], poeple = [2,3,7,11]
Output: [1,2,2,2]
Explanation: The figure above shows the times when the flowers are in full bloom and when the people arrive.
For each person, we return the number of flowers in full bloom during their arrival.

Example 2:
Input: flowers = [[1,10],[3,3]], poeple = [3,3,2]
Output: [2,2,1]
Explanation: The figure above shows the times when the flowers are in full bloom and when the people arrive.
For each person, we return the number of flowers in full bloom during their arrival.

Constraints:
1 <= flowers.length <= 5 * 104
flowers[i].length == 2
1 <= starti <= endi <= 109
1 <= people.length <= 5 * 104
1 <= people[i] <= 109
=end

# @param {Integer[][]} flowers
# @param {Integer[]} people
# @return {Integer[]}
def full_bloom_flowers(flowers, people)
  flowers_size = flowers.size

  start_indices = flowers.map(&:first).sort
  end_indices = flowers.map(&:last).sort

  people.map do |num|
    start_index = start_indices.bsearch_index { |start_index| start_index > num }
    start_index ||= flowers_size

    end_index = end_indices.bsearch_index { |end_index| end_index >= num }
    end_index ||= flowers_size

    bloom_status = start_index - end_index

    bloom_status
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_full_bloom_flowers < Test::Unit::TestCase
  def test_
    assert_equal [1, 2, 2, 2], full_bloom_flowers([[1, 6], [3, 7], [9, 12], [4, 13]], [2, 3, 7, 11])
    assert_equal [2, 2, 1], full_bloom_flowers([[1, 10], [3, 3]], [3, 3, 2])
  end
end
