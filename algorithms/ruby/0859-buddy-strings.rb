# frozen_string_literal: true

# 859. Buddy Strings
# Easy
# https://leetcode.com/problems/buddy-strings

=begin
Given two strings s and goal, return true if you can swap two letters in s so the result is equal to goal, otherwise, return false.
Swapping letters is defined as taking two indices i and j (0-indexed) such that i != j and swapping the characters at s[i] and s[j].
* For example, swapping at indices 0 and 2 in "abcd" results in "cbad".

Example 1:
Input: s = "ab", goal = "ba"
Output: true
Explanation: You can swap s[0] = 'a' and s[1] = 'b' to get "ba", which is equal to goal.

Example 2:
Input: s = "ab", goal = "ab"
Output: false
Explanation: The only letters you can swap are s[0] = 'a' and s[1] = 'b', which results in "ba" != goal.

Example 3:
Input: s = "aa", goal = "aa"
Output: true
Explanation: You can swap s[0] = 'a' and s[1] = 'a' to get "aa", which is equal to goal.

Constraints:
* 1 <= s.length, goal.length <= 2 * 104
* s and goal consist of lowercase letters.
=end

# @param {String} s
# @param {String} goal
# @return {Boolean}
def buddy_strings1(s, goal)
  return false if s.length != goal.length
  return false if s.size < 2

  h = {}
  ans = []
  dublicates = false
  s.chars.each_with_index { |v, i|
    dublicates = true if h[v]
    h[v] = true
    return false if ans.size > 2
    ans.push(i) if v != goal[i]
  }
  return dublicates if ans.empty?
  return false if ans.size != 2
  i, j = ans
  s[i] == goal[j] && s[j] == goal[i]
end

def buddy_strings2(s, goal)
  return false if s.length != goal.length

  s1 = ""
  s2 = ""
  chars = [].to_set
  repeated = false

  s.length.times do |i|
    repeated ||= !chars.add?(s[i])
    next if s[i] == goal[i]
    s1 += s[i]
    s2 += goal[i]
  end

  (s1.length == 2 && s1 == s2.reverse) ||
      (s1.length == 0 && repeated)
end

def buddy_strings3(s, goal)
  return false if s.size != goal.size
  d = s.chars.zip(goal.chars).each_with_index.inject([]) { |res, ((c1, c2), idx)|
    res << idx if c1 != c2
    res
  }
  case d.size
  when 0 then !s.chars.tally.filter { |c, v| v >= 2 }.empty?
  when 2 then s[d.first] == goal[d.last] && s[d.last] == goal[d.first]
  else
    false
  end
end

def buddy_strings4(s, goal)
  return false if s.size != goal.size

  s_uniq_chars = s.chars.uniq.sort
  gogal_uniq_chars = goal.chars.uniq.sort

  return false if s_uniq_chars != gogal_uniq_chars

  if s == goal
    s.size - s_uniq_chars.size >= 1
  else
    indices = []
    counter = 0

    s.size.times do |i|
      if s[i] != goal[i]
        counter += 1
        indices << i
      end

      return false if counter > 2
    end

    s[indices[0]] == goal[indices[1]] &&
      s[indices[1]] == goal[indices[0]]
  end
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_buddy_strings < Test::Unit::TestCase
  def test_
    assert_equal true, buddy_strings4("ab", "ba")
    assert_equal false, buddy_strings4("ab", "ab")
    assert_equal true, buddy_strings4("aa", "aa")
  end
end

# ********************#
#     Benchmark       #
# ********************#

require "benchmark"

s = "abcd"
goal = "cbad"
Benchmark.bm do |bm|
  bm.report("buddy_strings1: ") { buddy_strings1(s, goal) }
  bm.report("buddy_strings2: ") { buddy_strings2(s, goal) }
  bm.report("buddy_strings3: ") { buddy_strings3(s, goal) }
  bm.report("buddy_strings4: ") { buddy_strings4(s, goal) }
end

#        user     system      total        real
# buddy_strings1:   0.000032   0.000004   0.000036 (  0.000029)
# buddy_strings2:   0.002619   0.000254   0.002873 (  0.002903)
# buddy_strings3:   0.000639   0.000004   0.000643 (  0.000641)
# buddy_strings4:   0.000022   0.000001   0.000023 (  0.000021)
