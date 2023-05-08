# frozen_string_literal: true

# 14. Longest Common Prefix
# https://leetcode.com/problems/longest-common-prefix
# Easy

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.empty?

  prefix = strs[0]
  strs[1..].each do |str|
    loop do
      break if str.start_with?(prefix)

      prefix = prefix[0...prefix.length - 1]
      return "" if prefix.empty?
    end
  end

  prefix
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_longest_common_prefix < Test::Unit::TestCase
  def test_
    assert_equal "fl", longest_common_prefix(%w[flower flow flight])
    assert_equal "", longest_common_prefix(%w[dog racecar car])
  end
end
