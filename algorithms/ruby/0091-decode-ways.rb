# frozen_string_literal: true

# Problem: 91. Decode Ways
# URL: https://leetcode.com/problems/decode-ways

# @param {String} s
# @return {Integer}
def num_decodings(s)
  i1, i2 = 1, 1
  for i in 1..s.length do
    count = s[i - 1, 1] != "0" ? i1 : 0
    count += i2 if s[i - 2, 2].between?("10", "26") && i > 1
    i2 = i1
    i1 = count
    end
  count
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_num_decodings < Test::Unit::TestCase
  def test_
    assert_equal 2, num_decodings("12")
    assert_equal 3, num_decodings("226")
    assert_equal 0, num_decodings("06")
  end
end
