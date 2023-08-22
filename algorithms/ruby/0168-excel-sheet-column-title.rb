# frozen_string_literal: true

# 168. Excel Sheet Column Title
# Easy
# https://leetcode.com/problems/excel-sheet-column-title

=begin
Given an integer columnNumber, return its corresponding column title as it appears in an Excel sheet.

For example:
A -> 1
B -> 2
C -> 3
...
Z -> 26
AA -> 27
AB -> 28
...

Example 1:
Input: columnNumber = 1
Output: "A"

Example 2:
Input: columnNumber = 28
Output: "AB"

Example 3:
Input: columnNumber = 701
Output: "ZY"

Constraints:
* 1 <= columnNumber <= 231 - 1
=end

# @param {Integer} column_number
# @return {String}
def convert_to_title(column_number)
  result = ""

  while column_number > 0
    column_number -= 1
    result = (column_number % 26 + 65).chr + result
    column_number /= 26
  end

  result
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_convert_to_title < Test::Unit::TestCase
  def test_
    assert_equal "A", convert_to_title(1)
    assert_equal "AB", convert_to_title(28)
    assert_equal "ZY", convert_to_title(701)
  end
end
