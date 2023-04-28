# frozen_string_literal: true

# 839. Similar String Groups
# https://leetcode.com/problems/similar-string-groups
# Difficulty: Hard

=begin
Two strings X and Y are similar if we can swap two letters (in different positions) of X, so that it equals Y. Also two strings X and Y are similar if they are equal.

For example, "tars" and "rats" are similar (swapping at positions 0 and 2), and "rats" and "arts" are similar, but "star" is not similar to "tars", "rats", or "arts".

Together, these form two connected groups by similarity: {"tars", "rats", "arts"} and {"star"}.  Notice that "tars" and "arts" are in the same group even though they are not similar.  Formally, each group is such that a word is in the group if and only if it is similar to at least one other word in the group.

We are given a list strs of strings where every string in strs is an anagram of every other string in strs. How many groups are there?

Example 1:
Input: strs = ["tars","rats","arts","star"]
Output: 2

Example 2:
Input: strs = ["omv","ovm"]
Output: 1

Constraints:
1 <= strs.length <= 300
1 <= strs[i].length <= 300
strs[i] consists of lowercase letters only.
All words in strs have the same length and are anagrams of each other.
=end

# @param {String[]} strs
# @return {Integer}
def num_similar_groups(strs)
  strs.map! do |str|
    str.split("").map(&:ord)
  end

  @connected = strs.each_with_object({}) { |str, connected| connected[str] = [] }

  max_index = strs.size.pred
  strs.each_with_index do |str1, index1|
    index1.next.upto max_index do |index2|
      compare(str1, strs[index2])
    end
  end

  count_groups
end

def compare(str1, str2)
  counter = 0

  str1.each_with_index do |char1, char_index|
    if char1 != str2[char_index]
      counter += 1

      break if counter > 2
    end
  end

  if counter == 2
    @connected[str1] << str2
    @connected[str2] << str1
  end
end

def count_groups
  counter = 0

  until @connected.empty?
    counter += 1
    connected_strs = [ @connected.keys.first ]

    until connected_strs.empty?
      connected_strs.map! { |str| @connected.delete(str) }
      connected_strs.compact!
      connected_strs.flatten!(1)
    end
  end

  counter
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_num_similar_groups < Test::Unit::TestCase
  def test_
    assert_equal 2, num_similar_groups(["tars", "rats", "arts", "star"])
    assert_equal 1, num_similar_groups(["omv", "ovm"])
  end
end
