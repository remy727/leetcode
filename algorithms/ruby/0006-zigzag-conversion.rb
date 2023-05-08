# frozen_string_literal: true

# 6. Verifying an Alien Dictionary
# https://leetcode.com/problems/zigzag-conversion

# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  return s if s.size == 1 || num_rows == 1

  str = s.chars
  res = Array.new(num_rows) { [] }

  j = 0
  while str.any?
    if num_rows == 1 || (j % (num_rows - 1)).zero?
      num_rows.times { |i| res[i][j] = str.shift }
    else
      res[num_rows - (j % (num_rows - 1)) - 1][j] = str.shift
    end

    j += 1
  end

  res.flatten.compact.join
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_convert < Test::Unit::TestCase
  def test_
    assert_equal "PAHNAPLSIIGYIR", convert("PAYPALISHIRING", 3)
    assert_equal "PINALSIGYAHRPI", convert("PAYPALISHIRING", 4)
    assert_equal "A", convert("A", 1)
  end
end
