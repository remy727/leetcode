# frozen_string_literal: true

# 1861. Rotating the Box
# https://leetcode.com/problems/rotating-the-box
# Medium

=begin
You are given an m x n matrix of characters boxGrid representing a side-view of a box. Each cell of the box is one of the following:
* A stone '#'
* A stationary obstacle '*'
* Empty '.'
The box is rotated 90 degrees clockwise, causing some of the stones to fall due to gravity. Each stone falls down until it lands on an obstacle, another stone, or the bottom of the box. Gravity does not affect the obstacles' positions, and the inertia from the box's rotation does not affect the stones' horizontal positions.
It is guaranteed that each stone in boxGrid rests on an obstacle, another stone, or the bottom of the box.
Return an n x m matrix representing the box after the rotation described above.

Example 1:
Input: boxGrid = [["#",".","#"]]
Output: [["."],
         ["#"],
         ["#"]]

Example 2:
Input: boxGrid = [["#",".","*","."],
              ["#","#","*","."]]
Output: [["#","."],
         ["#","#"],
         ["*","*"],
         [".","."]]

Example 3:
Input: boxGrid = [["#","#","*",".","*","."],
              ["#","#","#","*",".","."],
              ["#","#","#",".","#","."]]
Output: [[".","#","#"],
         [".","#","#"],
         ["#","#","*"],
         ["#","*","."],
         ["#",".","*"],
         ["#",".","."]]

Constraints:
* m == boxGrid.length
* n == boxGrid[i].length
* 1 <= m, n <= 500
* boxGrid[i][j] is either '#', '*', or '.'.
=end

# @param {Character[][]} box
# @return {Character[][]}
def rotate_the_box(box)
  box.map do |r|
    r.chunk { |x| x == "*" }
      .flat_map { |_, stones| stones.sort.reverse }
  end.reverse.transpose
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_rotate_the_box < Test::Unit::TestCase
  def test_
    assert_equal(
      [
        ["."],
        ["#"],
        ["#"]
      ],
      rotate_the_box([["#", ".", "#"]])
    )
    assert_equal(
      [
        ["#", "."],
        ["#", "#"],
        ["*", "*"],
        [".", "."]
      ],
      rotate_the_box([
        ["#", ".", "*", "."],
        ["#", "#", "*", "."]
      ])
    )
    assert_equal(
      [
        [".", "#", "#"],
        [".", "#", "#"],
        ["#", "#", "*"],
        ["#", "*", "."],
        ["#", ".", "*"],
        ["#", ".", "."]
      ],
      rotate_the_box([
        ["#", "#", "*", ".", "*", "."],
        ["#", "#", "#", "*", ".", "."],
        ["#", "#", "#", ".", "#", "."]
      ])
    )
  end
end
