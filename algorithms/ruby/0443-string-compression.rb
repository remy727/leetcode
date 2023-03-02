# frozen_string_literal: true

# Problem: 443. String Compression
# URL: https://leetcode.com/problems/string-compression

# @param {Character[]} chars
# @return {Integer}
def compress(chars)
  i = 0
  len = 0
  count = 0

  while i < chars.length do
    count += 1

    if chars[i + 1] != chars[i]
      chars[len] = chars[i]
      len += 1

      if count > 1
        count.to_s.each_char do |char|
          chars[len] = char
          len += 1
        end
      end

      count = 0
    end

    i += 1
  end

  len
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_compress < Test::Unit::TestCase
  def test_
    assert_equal 6, compress(["a", "a", "b", "b", "c", "c", "c"])
    assert_equal 1, compress(["a"])
    assert_equal 4, compress(["a", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b"])
  end
end
