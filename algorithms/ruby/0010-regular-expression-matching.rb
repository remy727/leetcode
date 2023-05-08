# frozen_string_literal: true

# 10. Regular Expression Matching
# https://leetcode.com/problems/regular-expression-matching

# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  s = s.bytes
  p = p.bytes
  dp = Array.new(s.length + 1) { Array.new(p.length + 1, false) }
  m = s.length
  n = p.length
  dp[m][n] = true
  m.downto(0) do |i|
    (n - 1).downto(0) do |j|
      first = i < m && (s[i] == p[j] || p[j] == 46)
      dp[i][j] = if p[j + 1] == 42
        dp[i][j + 2] || (first && dp[i + 1][j])
      else
        first && dp[i + 1][j + 1]
      end
    end
  end
  dp[0][0]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_is_match < Test::Unit::TestCase
  def test_
    assert_equal false, is_match("aa", "a")
    assert_equal true, is_match("aa", "a*")
    assert_equal true, is_match("ab", ".*")
  end
end
