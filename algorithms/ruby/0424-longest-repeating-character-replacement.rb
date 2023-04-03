# frozen_string_literal: true

# 424. Longest Repeating Character Replacement
# https://leetcode.com/problems/longest-repeating-character-replacement

=begin

You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.

Return the length of the longest substring containing the same letter you can get after performing the above operations.

### Example 1:
Input: s = "ABAB", k = 2
Output: 4
Explanation: Replace the two 'A's with two 'B's or vice versa.

### Example 2:
Input: s = "AABABBA", k = 1
Output: 4
Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
The substring "BBBB" has the longest repeating letters, which is 4.

### Constraints:
* 1 <= s.length <= 105
* s consists of only uppercase English letters.
* 0 <= k <= s.length

=end

# @param {String} s
# @param {Integer} k
# @return {Integer}
def character_replacement(s, k)
  left = 0
  curr_lead_char_count = 0
  hash = {}
  hash.default = 0

  s.each_char.with_index.reduce(0) do |max_length, (char, right)|
    hash[char] += 1

    curr_lead_char_count = [curr_lead_char_count, hash[char]].max

    if right - left + 1 - curr_lead_char_count > k
      hash[s[left]] -= 1
      left += 1
    end

    [max_length, right - left + 1].max
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_character_replacement < Test::Unit::TestCase
  def test_
    assert_equal 4, character_replacement("ABAB", 2)
    assert_equal 4, character_replacement("AABABBA", 1)
  end
end
