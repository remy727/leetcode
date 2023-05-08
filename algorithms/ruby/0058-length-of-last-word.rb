# frozen_string_literal: true

# 58. Length of Last Word
# https://leetcode.com/problems/length-of-last-word

# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  words = s.strip.split(" ")
  words.last.length
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_length_of_last_word < Test::Unit::TestCase
  def test_
    assert_equal 5, length_of_last_word("Hello World")
    assert_equal 4, length_of_last_word("   fly me   to   the moon  ")
    assert_equal 6, length_of_last_word("luffy is still joyboy")
  end
end
