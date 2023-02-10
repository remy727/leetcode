# frozen_string_literal: true

# Problem: 2413. Smallest Even Multiple
# URL: https://leetcode.com/problems/smallest-even-multiple

# @param {Integer} n
# @return {Integer}
def smallest_even_multiple(n)
  n.even? ? n : 2 * n
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_smallest_even_multiple < Test::Unit::TestCase
  def test_
    assert_equal 10, smallest_even_multiple(5)
    assert_equal 6, smallest_even_multiple(6)
  end
end
