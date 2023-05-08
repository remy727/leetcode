# frozen_string_literal: true

# 557. Reverse Words in a String III
# https://leetcode.com/problems/reverse-words-in-a-string-iii

# @param {String} s
# @return {String}
def reverse_words(s)
  s.split.map(&:reverse).join(" ")
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_reverse_words < Test::Unit::TestCase
  def test_
    assert_equal "s'teL ekat edoCteeL tsetnoc", reverse_words("Let's take LeetCode contest")
    assert_equal "doG gniD", reverse_words("God Ding")
  end
end
