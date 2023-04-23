# frozen_string_literal: true

# 1639. Number of Ways to Form a Target String Given a Dictionary
# https://leetcode.com/problems/number-of-ways-to-form-a-target-string-given-a-dictionary
# Difficulty: Hard

=begin

You are given a list of strings of the same length words and a string target.

Your task is to form target using the given words under the following rules:

* target should be formed from left to right.
* To form the ith character (0-indexed) of target, you can choose the kth character of the jth string in words if target[i] = words[j][k].
* Once you use the kth character of the jth string of words, you can no longer use the xth character of any string in words where x <= k. In other words, all characters to the left of or at index k become unusuable for every string.
* Repeat the process until you form the string target.
Notice that you can use multiple characters from the same string in words provided the conditions above are met.

Return the number of ways to form target from words. Since the answer may be too large, return it modulo 109 + 7.

### Example 1:
Input: words = ["acca","bbbb","caca"], target = "aba"
Output: 6
Explanation: There are 6 ways to form target.
"aba" -> index 0 ("acca"), index 1 ("bbbb"), index 3 ("caca")
"aba" -> index 0 ("acca"), index 2 ("bbbb"), index 3 ("caca")
"aba" -> index 0 ("acca"), index 1 ("bbbb"), index 3 ("acca")
"aba" -> index 0 ("acca"), index 2 ("bbbb"), index 3 ("acca")
"aba" -> index 1 ("caca"), index 2 ("bbbb"), index 3 ("acca")
"aba" -> index 1 ("caca"), index 2 ("bbbb"), index 3 ("caca")

### Example 2:
Input: words = ["abba","baab"], target = "bab"
Output: 4
Explanation: There are 4 ways to form target.
"bab" -> index 0 ("baab"), index 1 ("baab"), index 2 ("abba")
"bab" -> index 0 ("baab"), index 1 ("baab"), index 3 ("baab")
"bab" -> index 0 ("baab"), index 2 ("baab"), index 3 ("baab")
"bab" -> index 1 ("abba"), index 2 ("baab"), index 3 ("baab")

### Constraints:
* 1 <= words.length <= 1000
* 1 <= words[i].length <= 1000
* All strings in words have the same length.
* 1 <= target.length <= 1000
* words[i] and target contain only lowercase English letters.

=end

# @param {String[]} words
# @param {String} target
# @return {Integer}
def num_ways1(words, target)
  alph, mod, m, k = 26, 1000000007, target.size, words[0].size
  cnt = Array.new(alph).map { Array.new(k, 0) }
  (0...k).each do |j|
    words.each do |word|
      cnt[word[j].ord - ?a.ord][j] += 1
    end
  end
  dp = Array.new(m + 1).map { Array.new(k + 1, 0) }
  dp[0][0] = 1
  (0..m).each do |i|
    (0...k).each do |j|
      if i < m
        a = cnt[target[i].ord - ?a.ord][j]
        dp[i + 1][j + 1] += a * dp[i][j]
        dp[i + 1][j + 1] %= mod
      end
      dp[i][j + 1] += dp[i][j]
      dp[i][j + 1] %= mod
    end
  end
  dp[m][k]
end

def num_ways(words, target)
  words.map(&:chars).transpose.map(&:tally).then(&ways = -> a, i = 0, j = 0, m = [] {
    target[a.size - j + i] ? 0 : !target[i] ? 1 : m[i * a.size + j] ||=
    (ways[a, i, j + 1, m] + a[j][target[i]].to_i * ways[a, i + 1, j + 1, m]) % 1000000007 })
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"

class Test_num_ways < Test::Unit::TestCase
  def test_
    assert_equal 6, num_ways(["acca", "bbbb", "caca"], "aba")
    assert_equal 4, num_ways(["abba", "baab"], "bab")
  end
end
