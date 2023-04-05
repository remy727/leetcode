# frozen_string_literal: true

# 844. Backspace String Compare
# https://leetcode.com/problems/backspace-string-compare

=begin

Given two strings s and t, return true if they are equal when both are typed into empty text editors. '#' means a backspace character.

Note that after backspacing an empty text, the text will continue empty.

### Example 1:
Input: s = "ab#c", t = "ad#c"
Output: true
Explanation: Both s and t become "ac".

### Example 2:
Input: s = "ab##", t = "c#d#"
Output: true
Explanation: Both s and t become "".

### Example 3:
Input: s = "a#c", t = "b"
Output: false
Explanation: s becomes "c" while t becomes "b".

### Constraints:
* 1 <= s.length, t.length <= 200
* s and t only contain lowercase letters and '#' characters.

=end

# @param {String} s
# @param {String} t
# @return {Boolean}
def backspace_compare(s, t)
  backspace(s) == backspace(t)
end

def backspace(str)
  str.chars.inject("") do |r, c|
    (c == "#") ? r[0...-1] : (r + c)
  end
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_backspace_compare < Test::Unit::TestCase
  def test_
    assert_equal true, backspace_compare("ab#c", "ad#c")
    assert_equal true, backspace_compare("ab##", "c#d#")
    assert_equal false, backspace_compare("a#c", "b")
  end
end
