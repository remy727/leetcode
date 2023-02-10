# frozen_string_literal: true

# Problem: 3. Longest Substring Without Repeating Characters
# URL: https://leetcode.com/problems/longest-substring-without-repeating-characters

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  max_len = 0
  i = 0
  h = {}

  (0...s.length).each do |j|
    i = [h[s[j]], i].max if h[s[j]].to_i.positive?
    max_len = [max_len, j - i + 1].max
    h[s[j]] = j + 1
  end

  max_len
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_length_of_longest_substring < Test::Unit::TestCase
  def test_
    assert_equal 3, length_of_longest_substring("abcabcbb")
    assert_equal 1, length_of_longest_substring("bbbbb")
    assert_equal 3, length_of_longest_substring("pwwkew")
  end
end
