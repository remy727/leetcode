# frozen_string_literal: true

# Problem: 989. Add to Array-Form of Integer
# URL: https://leetcode.com/problems/add-to-array-form-of-integer

# @param {Integer[]} num
# @param {Integer} k
# @return {Integer[]}
def add_to_array_form(num, k)
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_add_to_array_form < Test::Unit::TestCase
  def test_
    assert_equal [1, 2, 3, 4], add_to_array_form([1, 2, 0, 0], 34)
  end
end
