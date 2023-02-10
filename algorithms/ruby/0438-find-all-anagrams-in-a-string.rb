# frozen_string_literal: true

# Problem: 438. Find All Anagrams in a String
# URL: https://leetcode.com/problems/find-all-anagrams-in-a-string

# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  p_hash = Hash.new(0)
  p.each_char { |c| p_hash[c] += 1 }

  i = 0
  j = 0
  res = []

  while j < s.size
    if p_hash[s[j]] != 0
      p_hash[s[j]] -= 1
      res << i if j - i == p.size - 1
      j += 1
    elsif i == j
      i += 1
      j += 1
    else
      p_hash[s[i]] += 1
      i += 1
    end
  end
  res
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_find_anagrams < Test::Unit::TestCase
  def test_
    assert_equal [0, 6], find_anagrams("cbaebabacd", "abc")
    assert_equal [0, 1, 2], find_anagrams("abab", "ab")
  end
end
