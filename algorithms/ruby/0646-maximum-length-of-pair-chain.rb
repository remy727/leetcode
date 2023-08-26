# frozen_string_literal: true

# 646. Maximum Length of Pair Chain
# Medium
# https://leetcode.com/problems/maximum-length-of-pair-chain

=begin
You are given an array of n pairs pairs where pairs[i] = [lefti, righti] and lefti < righti.
A pair p2 = [c, d] follows a pair p1 = [a, b] if b < c. A chain of pairs can be formed in this fashion.
Return the length longest chain which can be formed.
You do not need to use up all the given intervals. You can select pairs in any order.

Example 1:
Input: pairs = [[1,2],[2,3],[3,4]]
Output: 2
Explanation: The longest chain is [1,2] -> [3,4].

Example 2:
Input: pairs = [[1,2],[7,8],[4,5]]
Output: 3
Explanation: The longest chain is [1,2] -> [4,5] -> [7,8].

Constraints:
* n == pairs.length
* 1 <= n <= 1000
* -1000 <= lefti < righti <= 1000
=end

# @param {Integer[][]} pairs
# @return {Integer}
def find_longest_chain(pairs)
  return 0 if pairs.empty?
  pairs.sort_by! { |p| p[1] }
  c = 0
  a = Float::INFINITY * -1
  pairs.each do |pair|
    if a < pair[0]
      a = pair[1]
      c += 1
    end
  end
  c
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_find_longest_chain < Test::Unit::TestCase
  def test_
    assert_equal 2, find_longest_chain([[1, 2], [2, 3], [3, 4]])
    assert_equal 3, find_longest_chain([[1, 2], [7, 8], [4, 5]])
  end
end
