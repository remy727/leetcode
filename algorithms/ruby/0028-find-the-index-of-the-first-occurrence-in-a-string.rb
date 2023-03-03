# frozen_string_literal: true

# Problem: 28. Find the Index of the First Occurrence in a String
# URL: https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string

# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  return 0 if needle.empty?
  return -1 if needle.size > haystack.size

  (haystack.size - needle.size + 1).times do |i|
    return i if haystack[i..i + needle.size - 1] == needle
  end

  -1
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_str_str < Test::Unit::TestCase
  def test_
    assert_equal 0, str_str("sadbutsad", "sad")
    assert_equal(-1, str_str("leetcode", "leeto"))
  end
end
