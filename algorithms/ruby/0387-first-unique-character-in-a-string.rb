# frozen_string_literal: true

# 387. First Unique Character in a String
# https://leetcode.com/problems/first-unique-character-in-a-string

# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  a = s.chars
  hash = a.each_with_object(Hash.new(0)) do |e, h|
    h[e] += 1
  end
  hash.key(1) ? a.index(hash.key(1)) : -1
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_first_uniq_char < Test::Unit::TestCase
  def test_
    assert_equal 0, first_uniq_char("leetcode")
    assert_equal 2, first_uniq_char("loveleetcode")
    assert_equal(-1, first_uniq_char("aabb"))
  end
end
