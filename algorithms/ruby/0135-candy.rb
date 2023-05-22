# frozen_string_literal: true

# 135. Candy
# https://leetcode.com/problems/candy
# Hard

=begin
There are n children standing in a line. Each child is assigned a rating value given in the integer array ratings.

You are giving candies to these children subjected to the following requirements:

Each child must have at least one candy.
Children with a higher rating get more candies than their neighbors.
Return the minimum number of candies you need to have to distribute the candies to the children.

Example 1:
Input: ratings = [1,0,2]
Output: 5
Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.

Example 2:
Input: ratings = [1,2,2]
Output: 4
Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
The third child gets 1 candy because it satisfies the above two conditions.

Constraints:
n == ratings.length
1 <= n <= 2 * 104
0 <= ratings[i] <= 2 * 104
=end

# @param {Integer[]} ratings
# @return {Integer}
def candy(ratings)
  left2right = Array.new(ratings.size, 1)
  right2left = Array.new(ratings.size, 1)
  (1...ratings.size).each do |i|
    if ratings[i] > ratings[i - 1]
      left2right[i] = left2right[i - 1] + 1
    end
  end
  (0...ratings.size - 1).reverse_each do |i|
    if ratings[i] > ratings[i + 1]
      right2left[i] = right2left[i + 1] + 1
    end
  end
  sum = 0
  (0...ratings.size).each do |i|
    sum += left2right[i] > right2left[i] ? left2right[i] : right2left[i]
  end
  sum
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_candy < Test::Unit::TestCase
  def test_
    assert_equal 5, candy([1, 0, 2])
    assert_equal 4, candy([1, 2, 2])
  end
end
