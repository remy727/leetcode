# frozen_string_literal: true

# 2405. Optimal Partition of String
# https://leetcode.com/problems/optimal-partition-of-string

=begin

Given a string s, partition the string into one or more substrings such that the characters in each substring are unique. That is, no letter appears in a single substring more than once.

Return the minimum number of substrings in such a partition.

Note that each character should belong to exactly one substring in a partition.

### Example 1:
Input: s = "abacaba"
Output: 4
Explanation:
Two possible partitions are ("a","ba","cab","a") and ("ab","a","ca","ba").
It can be shown that 4 is the minimum number of substrings needed.

### Example 2:
Input: s = "ssssss"
Output: 6
Explanation:
The only valid partition is ("s","s","s","s","s","s").

### Constraints:
* 1 <= s.length <= 105
* s consists of only English lowercase letters.

=end

# @param {String} s
# @return {Integer}
def partition_string(s)
  temp = ""
  count = 1
  s.each_char do |c|
    if temp.include?(c)
      count += 1
      temp = c
    else
      temp += c
    end
  end
  count
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_partition_string < Test::Unit::TestCase
  def test_
    assert_equal 4, partition_string("abacaba")
    assert_equal 6, partition_string("ssssss")
  end
end
