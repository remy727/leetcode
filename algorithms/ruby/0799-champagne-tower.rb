# frozen_string_literal: true

# 799. Champagne Tower
# Medium
# https://leetcode.com/problems/champagne-tower

=begin
We stack glasses in a pyramid, where the first row has 1 glass, the second row has 2 glasses, and so on until the 100th row.  Each glass holds one cup of champagne.
Then, some champagne is poured into the first glass at the top.  When the topmost glass is full, any excess liquid poured will fall equally to the glass immediately to the left and right of it.  When those glasses become full, any excess champagne will fall equally to the left and right of those glasses, and so on.  (A glass at the bottom row has its excess champagne fall on the floor.)
For example, after one cup of champagne is poured, the top most glass is full.  After two cups of champagne are poured, the two glasses on the second row are half full.  After three cups of champagne are poured, those two cups become full - there are 3 full glasses total now.  After four cups of champagne are poured, the third row has the middle glass half full, and the two outside glasses are a quarter full, as pictured below.
Now after pouring some non-negative integer cups of champagne, return how full the jth glass in the ith row is (both i and j are 0-indexed.)

Example 1:
Input: poured = 1, query_row = 1, query_glass = 1
Output: 0.00000
Explanation: We poured 1 cup of champange to the top glass of the tower (which is indexed as (0, 0)). There will be no excess liquid so all the glasses under the top glass will remain empty.

Example 2:
Input: poured = 2, query_row = 1, query_glass = 1
Output: 0.50000
Explanation: We poured 2 cups of champange to the top glass of the tower (which is indexed as (0, 0)). There is one cup of excess liquid. The glass indexed as (1, 0) and the glass indexed as (1, 1) will share the excess liquid equally, and each will get half cup of champange.

Example 3:
Input: poured = 100000009, query_row = 33, query_glass = 17
Output: 1.00000

Constraints:
* 0 <= poured <= 109
* 0 <= query_glass <= query_row < 100
=end

# @param {Integer} poured
# @param {Integer} query_row
# @param {Integer} query_glass
# @return {Float}
def champagne_tower(poured, query_row, query_glass)
  dp = Array.new(101) { |i| Array.new(i + 1, 0) }
  dp[0][0] = poured
  (0..query_row).each do |r|
    (0..r).each do |c|
      q = (dp[r][c] - 1).fdiv(2)
      if q > 0
        dp[r + 1][c] += q
        dp[r + 1][c + 1] += q
      end
    end
  end
  [1, dp[query_row][query_glass]].min
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_champagne_tower < Test::Unit::TestCase
  def test_
    assert_equal 0.00000, champagne_tower(1, 1, 1)
    assert_equal 0.50000, champagne_tower(2, 1, 1)
    assert_equal 1.00000, champagne_tower(100000009, 33, 17)
  end
end
