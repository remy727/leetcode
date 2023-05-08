# frozen_string_literal: true

# 953. Verifying an Alien Dictionary
# https://leetcode.com/problems/verifying-an-alien-dictionary

# @param {String[]} words
# @param {String} order
# @return {Boolean}
def is_alien_sorted(words, order)
  words.sort_by { |w| w.chars.map { |c| order.include?(c) ? order.index(c) : c.ord } } == words
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_is_alien_sorted < Test::Unit::TestCase
  def test_
    assert_equal true, is_alien_sorted(%w[hello leetcode], "hlabcdefgijkmnopqrstuvwxyz")
    assert_equal false, is_alien_sorted(%w[word world row], "worldabcefghijkmnpqstuvxyz")
    assert_equal false, is_alien_sorted(%w[apple app], "abcdefghijklmnopqrstuvwxyz")
  end
end
