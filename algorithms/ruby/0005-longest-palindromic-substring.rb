# frozen_string_literal: true

# 5. Longest Palindromic Substring
# https://leetcode.com/problems/longest-palindromic-substring

=begin

Given a string s, return the longest palindromic substring in s.

# Constraints:

* 1 <= s.length <= 1000
* s consist of only digits and English letters.

=end

# @param {String} s
# @return {String}
def longest_palindrome(s)
  return "" if s.empty?

  chars = s.chars.zip(s.size.times.map { "|" }).flatten.unshift("|")
  n = chars.size

  p_len = Array.new(3, n)
  p_len[0] = 0
  p_len[1] = 1

  max_len, max_len_pos = 0, 0

  center = 1
  right = 2

  2.step(n - 1).each do |i|   # want to use enumerator; n.times.drop(2) makes (n-2) length array
    mirror = 2 * center - i
    diff = right - i

    expand = false

    if 0 < diff
      len = p_len[mirror]

      if len < diff
        p_len[i] = len

      elsif len == diff && i == n - 1
        p_len[i] = len

      elsif len == diff && i < n - 1
        p_len[i] = len
        expand = true

      elsif diff < len
        p_len[i] = diff
        expand = true

      end
    else
      p_len[i] = 0
      expand = true
    end

    if expand
      while (i + p_len[i]) < n && 0 < (i - p_len[i]) && (not_boundary_char(p_len, i) || same_char?(chars, p_len, i))
        p_len[i] += 1
      end
    end

    if max_len < p_len[i]
      max_len = p_len[i]
      max_len_pos = i
    end

    if i < i + p_len[i]
      center = i
      right = i + p_len[i]
    end
  end

  first = (max_len_pos - max_len) / 2
  last = first + max_len - 1
  s[first..last]
end

def not_boundary_char(p_len, i)
  (i + p_len[i] + 1) % 2 == 0
end

def same_char?(chars, p_len, i)
  chars[i - p_len[i] - 1] == chars[i + p_len[i] + 1]
end

# @param {String} s
# @return {String}
def longest_palindrome1(s)
  arr = s.downcase.chars
  s.length.downto(1) do |n|
    ana = arr.each_cons(n).find { |b| b == b.reverse }
    return ana.join if ana
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_longest_palindrome < Test::Unit::TestCase
  def test_
    assert_equal "bab", longest_palindrome("babad")
    assert_equal "bb", longest_palindrome("cbbd")
    assert_equal "SQQSYYSQQS", longest_palindrome("SQQSYYSQQS")
  end
end

# ********************#
#     Benchmark       #
# ********************#

require "benchmark"

s = "anugnxshgonmqydttcvmtsoaprxnhpmpovdolbidqiyqubirkvhwppcdyeouvgedccipsvnobrccbndzjdbgxkzdbcjsjjovnhpnbkurxqfupiprpbiwqdnwaqvjbqoaqzkqgdxkfczdkznqxvupdmnyiidqpnbvgjraszbvvztpapxmomnghfaywkzlrupvjpcvascgvstqmvuveiiixjmdofdwyvhgkydrnfuojhzulhobyhtsxmcovwmamjwljioevhafdlpjpmqstguqhrhvsdvinphejfbdvrvabthpyyphyqharjvzriosrdnwmaxtgriivdqlmugtagvsoylqfwhjpmjxcysfujdvcqovxabjdbvyvembfpahvyoybdhweikcgnzrdqlzusgoobysfmlzifwjzlazuepimhbgkrfimmemhayxeqxynewcnynmgyjcwrpqnayvxoebgyjusppfpsfeonfwnbsdonucaipoafavmlrrlplnnbsaghbawooabsjndqnvruuwvllpvvhuepmqtprgktnwxmflmmbifbbsfthbeafseqrgwnwjxkkcqgbucwusjdipxuekanzwimuizqynaxrvicyzjhulqjshtsqswehnozehmbsdmacciflcgsrlyhjukpvosptmsjfteoimtewkrivdllqiotvtrubgkfcacvgqzxjmhmmqlikrtfrurltgtcreafcgisjpvasiwmhcofqkcteudgjoqqmtucnwcocsoiqtfuoazxdayricnmwcg"
Benchmark.bm do |x|
  x.report("longest_palindrome: ") { longest_palindrome(s) }
  x.report("longest_palindrome1: ") { longest_palindrome1(s) }
end

# user     system      total        real
# longest_palindrome:   0.007118   0.000000   0.007118 (  0.007215)
# longest_palindrome1:   0.433382   0.055217   0.488599 (  0.512605)
