# frozen_string_literal: true

# 2272. Substring With Largest Variance
# Hard
# https://leetcode.com/problems/substring-with-largest-variance

=begin
The variance of a string is defined as the largest difference between the number of occurrences of any 2 characters present in the string. Note the two characters may or may not be the same.
Given a string s consisting of lowercase English letters only, return the largest variance possible among all substrings of s.
A substring is a contiguous sequence of characters within a string.

Example 1:
Input: s = "aababbb"
Output: 3
Explanation:
All possible variances along with their respective substrings are listed below:
- Variance 0 for substrings "a", "aa", "ab", "abab", "aababb", "ba", "b", "bb", and "bbb".
- Variance 1 for substrings "aab", "aba", "abb", "aabab", "ababb", "aababbb", and "bab".
- Variance 2 for substrings "aaba", "ababbb", "abbb", and "babb".
- Variance 3 for substring "babbb".
Since the largest possible variance is 3, we return it.

Example 2:
Input: s = "abcde"
Output: 0
Explanation:
No letter occurs more than once in s, so the variance of every substring is 0.

Constraints:
1 <= s.length <= 104
s consists of lowercase English letters.
=end

# @param {String} s
# @return {Integer}
def largest_variance(s)
  nchars = "z".ord - "a".ord + 1
  o, d, db = 0, Array.new(nchars) { Array.new(nchars, 0) }, Array.new(nchars) { Array.new(nchars, -s.size) }
  s.chars.each do |c|
    ch = c.ord - "a".ord
    nchars.times do |k|
      next if k == ch
      d[ch][k] += 1
      db[ch][k] += 1
      db[k][ch] = (d[k][ch] -= 1)
      d[k][ch] = [0, d[k][ch]].max
      o = [o, db[ch][k], db[k][ch]].max
    end
  end
  o
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_largest_variance < Test::Unit::TestCase
  def test_largest_variance
    assert_equal(3, largest_variance("aababbb"))
    assert_equal(0, largest_variance("abcde"))
    assert_equal(36, largest_variance("sgajbhneaqajgzxfmflwhsilbruvdnsyiuudombiacrdavcmgpuyygijqzqlbzezkznjlzhekmceuxmahnwvodtghypaffmstmrajlatsusowvmpesnjpcgdkbljvuczeykvfxfbprxyhizdhovqhtbufeffardikqjcaabboknsfyfcwkzvmqurdzmxatdspsauvlvxsmsmdhjbsmeiszxpkwqyhrsectnbfeukedmcoivcuplgliruyqkzkoakougkgpngsrxawouixypzxzwixuzhhquuvxzixlqpufrypblhyyvyqzjkkiphljxxhezkxskhxlzmweiiwunhyshncpwfeddekwhuhvuxwnruyypeldrifwfsucdzfqzqmzwopqhugojkmaoinjursteivifmbjqjhbgwvbvrhneprsntsslepjxrzewqrlktlfotacuhzsyuapiwadnuviajwtgvjlxmfifgnoizmkbhlaudtagvzsapuufhrmkyjdshgavjxlkkuzipsmqykhzpflzyksuqihmffyvfnnzhggbcggngfckmjgpzoaxuhheqactdadbgoiogxyvawsqhhwestfxamfgaymluuafxvqhawwbotlgnlpdtgtzxkewwoziehskmxvlytenhnsngjisliyyssuhctyfzcdwvdyflzmwqbpttgsdhzyfnjylahaklhlqwjhpbzzrxsabkhiggpsafvzjlllwrfidnsarrezwxuhaqzczwxmknqgsinzrvsyzpkwarywgwkqaajsekaqydmkjqhcqkmamyisamfxatdumdbzudjtcbqasmshhvkivsavtrxlehewhsgrybfsfrrnrmsagsdwzpadwotqlnzroeamcdotgseohiihefptxjhmwbmpimeudowsizhjdlrqdhssvkesasypjojxpvcvbwjcyqvtzcwzcxyrmeqvdnkibjaikfplimodiczoaaryhbvyhrhoosunhrhhekupritwwoqkfmnpvzzabdrlnlscqsedjzcjjhfxrqzeuvwhrlrhpoqfsqctbudwixpbnehdcuwfmbuwtochwkefubfxeruurjbhpnnonqqmnrsfakvjpjjixxbnfrzegyabogvrfyaqpqltxykhxeekmisshdezkcrovpyzestqfktbtrwxtklymmhrcyxirgzzocpdnl"))
  end
end
