# frozen_string_literal: true

# Problem: 567. Permutation in String
# URL: https://leetcode.com/problems/permutation-in-string

# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion(s1, s2)
  return false if s1.size > s2.size

  s1_h = Hash.new(0)
  s1.each_char { |c| s1_h[c] += 1 }

  i = 0
  j = 0

  while j < s2.size
    if s1_h[s2[j]] != 0
      s1_h[s2[j]] -= 1
      return true if j - i == s1.size - 1

      j += 1
    elsif i == j
      i += 1
      j += 1
    else
      s1_h[s2[i]] += 1
      i += 1
    end
  end

  false
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_check_inclusion < Test::Unit::TestCase
  def test_
    assert_equal true, check_inclusion("ab", "eidbaooo")
    assert_equal false, check_inclusion("ab", "eidboaoo")
  end
end
