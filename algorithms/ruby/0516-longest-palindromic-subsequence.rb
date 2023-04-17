# frozen_string_literal: true

=begin

Given a string s, find the longest palindromic subsequence's length in s.

A subsequence is a sequence that can be derived from another sequence by deleting some or no elements without changing the order of the remaining elements.

### Example 1:
Input: s = "bbbab"
Output: 4
Explanation: One possible longest palindromic subsequence is "bbbb".

### Example 2:
Input: s = "cbbd"
Output: 2
Explanation: One possible longest palindromic subsequence is "bb".

### Constraints:
* 1 <= s.length <= 1000
* s consists only of lowercase English letters.

=end

# @param {String} s
# @return {Integer}
def longest_palindrome_subseq(s)
  dp, dp_nxt = 2.times.collect { |i| Array.new(s.size, 0) }
  (s.size - 1).downto(0) { |i|
    dp_nxt[i] = 1
    (i + 1...s.size).each { |j|
      dp_nxt[j] = (s[i] == s[j]) ? dp[j - 1] + 2 : [dp[j], dp_nxt[j - 1]].max
    }
    dp, dp_nxt = dp_nxt, dp
  }
  dp.last
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_longest_palindrome_subseq < Test::Unit::TestCase
  def test_
    assert_equal 4, longest_palindrome_subseq("bbbab")
    assert_equal 2, longest_palindrome_subseq("cbbd")
  end
end
