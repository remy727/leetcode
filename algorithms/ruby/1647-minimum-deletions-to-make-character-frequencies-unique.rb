# frozen_string_literal: true

# 1647. Minimum Deletions to Make Character Frequencies Unique
# Medium
# https://leetcode.com/problems/minimum-deletions-to-make-character-frequencies-unique

=begin
A string s is called good if there are no two different characters in s that have the same frequency.
Given a string s, return the minimum number of characters you need to delete to make s good.
The frequency of a character in a string is the number of times it appears in the string. For example, in the string "aab", the frequency of 'a' is 2, while the frequency of 'b' is 1.

Example 1:
Input: s = "aab"
Output: 0
Explanation: s is already good.

Example 2:
Input: s = "aaabbbcc"
Output: 2
Explanation: You can delete two 'b's resulting in the good string "aaabcc".
Another way it to delete one 'b' and one 'c' resulting in the good string "aaabbc".

Example 3:
Input: s = "ceabaacb"
Output: 2
Explanation: You can delete both 'c's resulting in the good string "eabaab".
Note that we only care about characters that are still in the string at the end (i.e. frequency of 0 is ignored).


Constraints:
* 1 <= s.length <= 105
* s contains only lowercase English letters.
=end

# @param {String} s
# @return {Integer}
def min_deletions(s)
  cnt = s.chars.tally.values.sort
  cnt[0...-1].reverse_each.inject([0, cnt.last]) { |(d, prev), cc|
    dif = (cc < prev) ? 0 : (cc - prev + (prev.zero? ? 0 : 1))
    [d + dif, cc - dif]
  }.first
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_min_deletions < Test::Unit::TestCase
  def test_
    assert_equal 0, min_deletions("aab")
    assert_equal 2, min_deletions("aaabbbcc")
    assert_equal 2, min_deletions("ceabaacb")
  end
end
