# frozen_string_literal: true

# 344. Reverse String
# https://leetcode.com/problems/reverse-string

# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_string(s)
  s.reverse!
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_reverse_string < Test::Unit::TestCase
  def test_
    assert_equal %w[o l l e h], reverse_string(%w[h e l l o])
    assert_equal %w[h a n n a H], reverse_string(%w[H a n n a h])
  end
end
